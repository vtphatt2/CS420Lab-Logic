import fitz  # PyMuPDF
import os

def extract_images_from_pdf(pdf_path, output_folder):
    pdf_document = fitz.open(pdf_path)
    
    os.makedirs(output_folder, exist_ok=True)

    for page_number in range(len(pdf_document)):
        page = pdf_document[page_number]
        images = page.get_images(full=True)
        for img_index, img in enumerate(images):
            xref = img[0]
            base_image = pdf_document.extract_image(xref)
            image_bytes = base_image["image"]
            image_ext = base_image["ext"]
            image_filename = f"page_{page_number + 1}_img_{img_index + 1}.{image_ext}"
            with open(os.path.join(output_folder, image_filename), "wb") as image_file:
                image_file.write(image_bytes)
    
    pdf_document.close()
    print(f"Images have been saved to '{output_folder}'.")

# Example usage
pdf_file_path = "LAB.pdf"  
output_dir = "./"
extract_images_from_pdf(pdf_file_path, output_dir)
