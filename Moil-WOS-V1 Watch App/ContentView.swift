import SwiftUI

struct ContentView: View {
    /// 서버 연동 전까지 화면을 채우는 표본 데이터입니다.
    @State private var items: [ScheduleItem] = [
        ScheduleItem(id: "1", time: "14:00", title: "아빠 골프", owner: MoilWatchSampleData.members[1]),
        ScheduleItem(id: "2", time: "18:30", title: "나 팀 회의", owner: MoilWatchSampleData.members[2]),
        ScheduleItem(id: "3", time: "20:00", title: "저녁 약속", owner: MoilWatchSampleData.members[0]),
    ]

    var body: some View {
        TabView {
            NavigationStack {
                TodayView(
                    groupName: "우리 가족",
                    dateTitle: "7월 22일",
                    items: items,
                    onSelect: { _ in
                        // TODO: 일정 상세 화면 연결 (다음 이슈에서 진행)
                    }
                )
            }
            NavigationStack {
                FamilyView(
                    members: MoilWatchSampleData.members,
                    availability: [
                        AvailabilitySlot(id: "1", timeRange: "12:30–13:30", summary: "4명 모두", indicatorColor: MoilWatchSampleData.members[2].color),
                        AvailabilitySlot(id: "2", timeRange: "17:00–18:00", summary: "3명 가능", indicatorColor: MoilWatchSampleData.members[1].color),
                        AvailabilitySlot(id: "3", timeRange: "20:30 이후", summary: "4명 모두", indicatorColor: MoilWatchSampleData.members[3].color),
                    ]
                )
            }
            NavigationStack {
                ContentUnavailableView("월간", systemImage: "calendar")
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
