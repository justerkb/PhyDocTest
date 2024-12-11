//
//  ThirdScreen.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 07.12.2024.
//

import SwiftUI

//MARK: - SchedulerView
struct DateSelectingScreen: View {
    
    @EnvironmentObject var schedulerViewModel: ScheduleViewModel
    @EnvironmentObject var appoimentFormatViewModel: AppoimentFormatViewModel
    
    var body: some View {
        VStack {
            Text("Выберите дату и время")
                .font(.custom("Onest", size: 33))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
            
            ErrorView()
                .padding(.bottom, 32)
            
            
            ScrollView {
                
                ForEach(Array(schedulerViewModel.slotsByDate.keys.sorted()), id: \.self) { key in
                    
                    SectionView(
                        dateKey: key,
                        slots: schedulerViewModel.slotsByDate[key] ?? [],
                        selectedSlot: schedulerViewModel.selectedSlot,
                        onSelect: { slot in
                            schedulerViewModel.selectedSlot = slot
                        }
                    )
                }
            }
            .task {
                schedulerViewModel.fetchSchedule(type: appoimentFormatViewModel.selecedOptionType)
            }
            
        }
        .padding(.horizontal, 20)
    }
}


//MARK: - SlotView
struct SlotView: View {
    let slot: Slot
    var isSelected: Bool = false
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            VStack {
                Text(formattedTime(from:slot.datetime))
                    .font(.custom("Onest-Bold", size: 19))
                    .foregroundStyle(isSelected ? .backGroundBlue: .mainBlack)
                Text("\(formattedPrice(slot.price))₸")
                    .font(.custom("Onest", size: 16))
                    .foregroundStyle(isSelected ? .backGroundBlue: .mainBlack)

            }
            .padding()
            .background(isSelected ? .mainBlue : .backGray)
            .cornerRadius(16)
        }
        
        
    }
    
    private func formattedPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
    
    private func formattedTime(from datetime: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
            
        guard let date = inputFormatter.date(from: datetime) else { return datetime }
        return outputFormatter.string(from: date)
    }
}



//MARK: - #PREVIEW
#Preview {
    DateSelectingScreen()
}

//MARK: - SECTION VIEW
struct SectionView: View {
    let dateKey: String
    let slots: [Slot]
    let selectedSlot: Slot?
    let onSelect: (Slot) -> Void
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            Section {
                ForEach(slots) { slot in
                    SlotView(slot: slot, isSelected: slot == selectedSlot) {
                        onSelect(slot)
                    }
                }
            } header: {
                Text(dateKey)
                    .font(.custom("Onest", size: 20))
                    .foregroundStyle(Color.textGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 16)
            }
        }
        .padding(.bottom, 24)
    }
}
