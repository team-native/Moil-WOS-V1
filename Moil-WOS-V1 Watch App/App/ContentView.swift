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
                MonthlyView(
                    monthTitle: "7월",
                    yearTitle: "2026",
                    weekdaySymbols: ["일", "월", "화", "수", "목", "금", "토"],
                    weeks: monthWeeks,
                    legend: Array(MoilWatchSampleData.members.prefix(3))
                )
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    /// 서버 연동 전까지 화면을 채우는 7월 달력 표본 데이터입니다.
    private var monthWeeks: [[MonthDay]] {
        func day(_ value: Int, today: Bool = false, color: Color? = nil) -> MonthDay {
            MonthDay(id: value, day: value, isToday: today, eventColor: color)
        }
        func blank(_ id: Int) -> MonthDay {
            MonthDay(id: id, day: nil, isToday: false, eventColor: nil)
        }
        let members = MoilWatchSampleData.members
        return [
            [day(1), day(2), day(3), day(4), day(5, color: members[2].color), day(6), day(7)],
            [day(8), day(9), day(10), day(11), day(12), day(13), day(14)],
            [day(15), day(16, color: members[1].color), day(17), day(18), day(19), day(20), day(21)],
            [day(22, today: true, color: members[0].color), day(23), day(24), day(25), day(26), day(27), day(28, color: members[3].color)],
            [day(29), day(30), day(31), blank(-1), blank(-2), blank(-3), blank(-4)],
        ]
    }
}

#Preview {
    ContentView()
}
