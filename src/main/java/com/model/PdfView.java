package com.model;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Created by aboullaite on 2017-02-25.
 */
public class PdfView extends AbstractPdfView {
    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // change the file name
        response.setHeader("Content-Disposition", "attachment; filename=\"my-pdf-file.pdf\"");

        Advert ad = (Advert) model.get("advert");
        document.add(new Paragraph("Generated Advert " + LocalDate.now()));

        PdfPTable table = new PdfPTable(15);
        table.setWidthPercentage(100.0f);
        table.setSpacingBefore(10);

        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.TIMES);
        font.setColor(BaseColor.WHITE);

        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.DARK_GRAY);
        cell.setPadding(5);

        // write table header
        cell.setPhrase(new Phrase("Mark", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Model", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Price", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Category", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Year", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Horse Power", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Mileage", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Color", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("User Id", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Title", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Description", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Creation Time", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Transmission Type", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Fuel Type", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Body Type", font));
        table.addCell(cell);
        	
        	if(ad!=null) {
        	table.addCell(ad.getMark());
            table.addCell(ad.getModel());
            table.addCell(String.valueOf(ad.getPrice()));
            table.addCell(ad.getCategory());
            table.addCell(String.valueOf(ad.getYear()));
            table.addCell(String.valueOf(ad.getHorsePower()));
            table.addCell(String.valueOf(ad.getMileage()));
            table.addCell(ad.getColor());
            table.addCell(String.valueOf(ad.getUserId()));
            table.addCell(ad.getTitle());
            table.addCell(ad.getDescription());
            table.addCell(String.valueOf(ad.getCreationTime()));
            table.addCell(ad.getTransmissionType());
            table.addCell(ad.getFuelType());
            table.addCell(ad.getBodyType());
        	}
        document.add(table);
    }
  }