package jung;

import java.util.ArrayList;

public class DessertRepository {
	
	private ArrayList<Dessert> ListOfDessert=new ArrayList<Dessert>();
		
	private static DessertRepository instance = new DessertRepository();
	
	public DessertRepository(){
		
	Dessert DessertList1 = new Dessert("JGD121027","휘낭시에", 3500, "디저트", 5, "계란", "국산");
	DessertList1.setDescription("아몬드의 풍미와 버터의 고소한 맛이 어우러진 달콤하지만 과하지 않은 고급스러운 맛을 느낄 수 있습니다.");
	DessertList1.setFilename("financier.jpg");
	
	Dessert DessertList2 = new Dessert("JGD121028","소금빵", 3500, "디저트", 5, "계란", "국산");
	DessertList2.setDescription("바삭하고 부드러운 식감에 소금의 약간의 짭짤한 맛이 달콤한 빵과 어우러져 특별한 맛을 느낄 수 있습니다.");
	DessertList2.setFilename("saltbread.jpg");
	
	Dessert DessertList3 = new Dessert("JGD121029","마들렌", 4000, "디저트", 5, "계란", "국산");
	DessertList3.setDescription("레몬 향이 가미된 부드러운 프랑스 전통 디저트를 정가당에서 맛 볼 수 있습니다.");
	DessertList3.setFilename("madeleine.jpg");
	
	Dessert DessertList4 = new Dessert("JGD121030","스콘", 3500, "디저트", 5, "계란", "국산");
	DessertList4.setDescription("겉은 바삭하지만 속은 부드럽고 촉촉한 담백한 맛을 느낄 수 있습니다.");
	DessertList4.setFilename("scone.jpg");

	
	Dessert DessertList5 = new Dessert("JGD121101","브라우니", 3000, "디저트", 5, "계란", "국산");
	DessertList5.setDescription("진한 초콜릿 맛과 부드러운 질감으로 전 세계적으로 많은 사람들에게 사랑을 받은 브라우니");
	DessertList5.setFilename("brownie.jpg");
	
	Dessert DessertList6 = new Dessert("JGD121102","크레이프", 4000, "디저트", 5, "계란", "국산");
	DessertList6.setDescription(null);
	DessertList6.setFilename("wait.jpg");
	
	Dessert DessertList7 = new Dessert("JGD121103","파운드", 4000, "디저트", 5, "계란", "국산");
	DessertList7.setDescription("풍부한 버터 맛과 촉촉한 식감");
	DessertList7.setFilename("wait.jpg");
	
	Dessert DessertList8 = new Dessert("JGD121104","카스테라", 4000, "디저트", 5, "계란", "국산");
	DessertList8.setDescription("부드럽고 촉촉한 스펀지 케이크");
	DessertList8.setFilename("wait.jpg");
	
	Dessert DessertList9 = new Dessert("JGD121105","크루아상", 4000, "디저트", 5, "계란", "국산");
	DessertList9.setDescription("바삭한 페이스트리를 겹겹이 쌓은 프랑스 대표 빵");
	DessertList9.setFilename("wait.jpg");
	
	Dessert DessertList10 = new Dessert("JGD121106","머핀", 4000, "디저트", 5, "계란", "국산");
	DessertList10.setDescription("단단한 식감과 다양한 맛을 느낄 수 있는 작은 컵 모양의 케이크");
	DessertList10.setFilename("wait.jpg");
	
	ListOfDessert.add(DessertList1);
	ListOfDessert.add(DessertList2);
	ListOfDessert.add(DessertList3);
	ListOfDessert.add(DessertList4);	
	ListOfDessert.add(DessertList5);
	ListOfDessert.add(DessertList6);
	ListOfDessert.add(DessertList7);
	ListOfDessert.add(DessertList8);
	ListOfDessert.add(DessertList9);
	ListOfDessert.add(DessertList10);
	
	}
	
public static DessertRepository getInstance() {
		return instance;
}	

public ArrayList<Dessert> getAllDessert(){
	return ListOfDessert;
}

public Dessert getDessertByNumber(String info) {
	Dessert DsessertByNumber=null;
	
	for (int i=0; i < ListOfDessert.size(); i++) {
		Dessert dessert = ListOfDessert.get(i);
		if(dessert != null && dessert.getNumber() !=null && dessert.getNumber().equals(info)) {
			DsessertByNumber=dessert;
			break;
		}
	}
	return DsessertByNumber;
}

public void addDessert(Dessert create) {
	ListOfDessert.add(create);
}
}