package SignUpPackage;

public class CartModel {
	String prodImage;
	String prodDesc;
	float prodCost;
	int prodQuantity;
	float totalProdCost;
	
	public String getProdImage() {
		return prodImage;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public String getProdDesc() {
		return prodDesc;
	}

	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	public float getProdCost() {
		return prodCost;
	}

	public void setProdCost(float prodCost) {
		this.prodCost = prodCost;
	}

	public int getProdQuantity() {
		return prodQuantity;
	}

	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}

	public float getTotalProdCost() {
		return totalProdCost;
	}

	public void setTotalProdCost(float totalProdCost) {
		this.totalProdCost = totalProdCost;
	}

	public CartModel(String prodImage, String prodDesc, float prodCost, int prodQuantity, float totalProdCost) {
		this.prodImage = prodImage;
		this.prodDesc = prodDesc;
		this.prodCost = prodCost;
		this.prodQuantity = prodQuantity;
		this.totalProdCost = totalProdCost;
	}
}
