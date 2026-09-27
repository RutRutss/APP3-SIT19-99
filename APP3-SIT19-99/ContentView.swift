import SwiftUI

struct ContentView: View {

    // MARK: - Array เก็บข้อมูลเมนู 3 รายการ
    let menuItems: [(name: String, price: Double, desc: String, imageName: String)] = [
        ("ผัดไทย", 60, "เส้นผัดไทยรสชาติต้นตำรับ ผัดกับกุ้งสด ถั่วงอก และไข่", "padthai"),
        ("ต้มยำกุ้ง", 120, "ต้มยำรสจัดจ้าน กุ้งแม่น้ำตัวโต น้ำซุปเปรี้ยวเผ็ดกำลังดี", "tomyum"),
        ("ส้มตำไทย", 50, "ส้มตำรสแซ่บ เปรี้ยวหวานเผ็ดครบรส", "somtum"),
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(menuItems, id: \.name) { item in
                    NavigationLink(
                        destination: MenuDetailView(
                            name: item.name,
                            price: item.price,
                            desc: item.desc,
                            imageName: item.imageName
                        )
                    ) {
                        HStack(spacing: 12) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.desc)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }

                            Spacer()

                            Text("฿\(item.price, specifier: "%.0f")")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("รายการอาหาร")
        }
    }
}

// MARK: - หน้ารายละเอียดเมนู
struct MenuDetailView: View {
    let name: String
    let price: Double
    let desc: String
    let imageName: String

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()

                Text(name)
                    .font(.largeTitle).bold()

                Text(desc)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                Text("฿\(price, specifier: "%.0f")")
                    .font(.title2).bold()
                    .foregroundStyle(.orange)
            }
            .padding(.bottom)
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ContentView()
}
