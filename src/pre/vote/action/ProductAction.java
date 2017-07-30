package pre.vote.action;

import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import pre.vote.dao.ProductDao;
import pre.vote.dao.Impl.ProductDaoImpl;
//import org.apache.commons.fileupload.FileUploadBase$SizeLimitExceededException;
import pre.vote.model.Product;

import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {
	private File pic;
	private String picContentType;
	private String picFileName;
	private String savePath;
    private Product product;
	List<Product> productList;
	ProductDao productDao = new ProductDaoImpl();

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String findAll() {
		productList = productDao.findAll();
		return "findAll";
	}

	public String execute() throws Exception {
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			// 文件输出
			fos = new FileOutputStream(this.getSavePath() + "\\"
					+ this.getPicFileName());
			fis = new FileInputStream(this.getPic());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
			product.setPicture(picFileName);
			boolean saveResult = productDao.saveProduct(product);
			if (saveResult) {
				productList = productDao.findAll();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new FileNotFoundException(
					"dingjun sayFileNotFoundException :" + e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new Exception("dingjun sayException :" + e.getMessage());
		} finally {
			try {
				fos.close();
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
				throw new IOException("dingjun say IOException:"
						+ e.getMessage());
			}
		}

		return SUCCESS;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getSavePath() throws Exception {
		String url = ServletActionContext.getServletContext().getRealPath(
				savePath);
		return url;
	}

	public InputStream getInputStream() {
		return ServletActionContext.getServletContext().getResourceAsStream(
				"/upload/" + picFileName);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String download() {

		return SUCCESS;
	}

}
