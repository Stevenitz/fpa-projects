

library(readxl)
install.packages("corrplot")
############################################################
# 1. LOAD THE DATA
############################################################

file_path <- "C:/Users/Stevenitzz/Downloads/Ancillary Sales Analysis Project.xlsx"

# Check sheet names
excel_sheets(file_path)

# Import data (skip first row if it's headers)
df <- read_excel(file_path, sheet = 1, skip = 1)

# Remove Grand Total row
df <- df[-nrow(df), ]

# Check basic info
cat("Rows and Columns:\n")
print(dim(df))

cat("\nOriginal Column Names:\n")
print(names(df))

############################################################
# 2. CLEAN COLUMN NAMES (Run this ONCE)
############################################################

# Clean column names - replace spaces, %, /, parentheses
names(df) <- gsub(" ", "_", names(df))           # spaces to underscores
names(df) <- gsub("%", "pct", names(df))          # % to pct
names(df) <- gsub("\\(", "_", names(df))          # ( to _
names(df) <- gsub("\\)", "_", names(df))          # ) to _
names(df) <- gsub("/", "_", names(df))            # / to _
names(df) <- gsub("__", "_", names(df))           # double underscores to single
names(df) <- gsub("_$", "", names(df))            # remove trailing underscores

# Check cleaned names
cat("\nCleaned Column Names:\n")
print(names(df))

############################################################
# 3. CREATE NUMERIC DATASET
############################################################

# Find numeric columns
numeric_vars <- sapply(df, is.numeric)
cat("\nNumeric Variables:\n")
print(names(df)[numeric_vars])

# Create numeric-only dataset
df_numeric <- df[, numeric_vars]
cat("\nNumeric Dataset Dimensions:\n")
print(dim(df_numeric))

##letting curioisyt strike

# Check how many NAs per product penetration column
sapply(df[, c("Product_1_Penetration","Product_2_Penetration","Product_3_Penetration",
              "Product_4_Penetration","Product_5_Penetration")], function(x) sum(is.na(x)))


df[df$Checkout_Location_Code %in% c("Location 288","Location 289","Location 290","Location 291","Location 292"), 
   c("Checkout_Location_Code","Number_of_Rentals")]

quantile(df$Number_of_Rentals, probs = c(0.01, 0.05, 0.10), na.rm = TRUE)
cutoff <- quantile(df$Number_of_Rentals, 0.05, na.rm = TRUE)
df <- df[df$Number_of_Rentals >= cutoff, ]
############################################################
# 4. CORRELATION MATRIX
############################################################

cor_matrix <- cor(df_numeric, use = "pairwise.complete.obs")

# View the correlation matrix
View(cor_matrix)

############################################################
# 5. FIND LOW AND HIGH PERFORMERS FOR EACH PRODUCT
############################################################


# --- Product 1 Penetration ---
df_p1 <- df[!is.na(df$Product_1_Penetration), ]   # drop NA rows first
df_sorted_p1 <- df_p1[order(df_p1$Product_1_Penetration), ]
low_p1 <- head(df_sorted_p1, 10)
high_p1 <- tail(df_sorted_p1, 10)

# --- Product 2 Penetration ---


df_p2 <- df[!is.na(df$Product_2_Penetration), ]   # drop NA rows first
df_sorted_p2 <- df_p2[order(df_p2$Product_2_Penetration), ]
low_p2 <- head(df_sorted_p2, 10)
high_p2 <- tail(df_sorted_p2, 10)

# --- Product 3 Penetration ---


df_p3 <- df[!is.na(df$Product_3_Penetration), ]   # drop NA rows first
df_sorted_p3 <- df_p3[order(df_p3$Product_3_Penetration), ]

low_p3 <- head(df_sorted_p3, 10)
high_p3 <- tail(df_sorted_p3, 10)

# --- Product 4 Penetration ---
df_p4 <- df[!is.na(df$Product_4_Penetration), ]   # drop NA rows first
df_sorted_p4 <- df_p4[order(df_p4$Product_4_Penetration), ]


low_p4 <- head(df_sorted_p4, 10)
high_p4 <- tail(df_sorted_p4, 10)

# --- Product 5 Penetration ---
df_p5 <- df[!is.na(df$Product_5_Penetration), ]   # drop NA rows first
df_sorted_p5 <- df_p5[order(df_p5$Product_5_Penetration), ]

low_p5 <- head(df_sorted_p5, 10)
high_p5 <- tail(df_sorted_p5, 10)

############################################################
# 6. VIEW THE RESULTS
############################################################

cutoff <- quantile(df$Number_of_Rentals, 0.05, na.rm = TRUE)
df_filtered <- df[df$Number_of_Rentals >= cutoff, ]

products <- paste0("Product_", 1:5, "_Penetration")

low_list  <- list()
high_list <- list()

for (p in products) {
  temp <- df_filtered[!is.na(df_filtered[[p]]), ]
  temp <- temp[order(temp[[p]]), ]
  low_list[[p]]  <- head(temp, 10)[, c("Checkout_Location_Code", p, "Walkup_No_Reservation_pct", "Counter_Bypass_pct")]
  high_list[[p]] <- tail(temp, 10)[, c("Checkout_Location_Code", p, "Walkup_No_Reservation_pct", "Counter_Bypass_pct")]
}

# View any product like this:
low_list[["Product_1_Penetration"]]
high_list[["Product_1_Penetration"]]

# Or print all 10 tables at once:
for (p in products) {
  cat("\n---", p, "LOW ---\n"); print(low_list[[p]])
  cat("\n---", p, "HIGH ---\n"); print(high_list[[p]])
}


all_low_locs <- unlist(lapply(low_list, function(x) x$Checkout_Location_Code))
sort(table(all_low_locs), decreasing = TRUE)[1:10]


all_high_locs <- unlist(lapply(high_list, function(x) x$Checkout_Location_Code))
sort(table(all_high_locs), decreasing = TRUE)[1:10]


#checking relation with higy by pass and low ancillary
cor(df_filtered$Counter_Bypass_pct, df_filtered$Product_1_Penetration, use = "complete.obs")
cor(df_filtered$Walkup_No_Reservation_pct, df_filtered$Product_1_Penetration, use = "complete.obs")

cor(df_filtered$Counter_Bypass_pct, df_filtered$Product_2_Penetration, use = "complete.obs")
cor(df_filtered$Walkup_No_Reservation_pct, df_filtered$Product_2_Penetration, use = "complete.obs")

cor(df_filtered$Counter_Bypass_pct, df_filtered$Product_3_Penetration, use = "complete.obs")
cor(df_filtered$Walkup_No_Reservation_pct, df_filtered$Product_3_Penetration, use = "complete.obs")

cor(df_filtered$Counter_Bypass_pct, df_filtered$Product_4_Penetration, use = "complete.obs")
cor(df_filtered$Walkup_No_Reservation_pct, df_filtered$Product_4_Penetration, use = "complete.obs")

cor(df_filtered$Counter_Bypass_pct, df_filtered$Product_5_Penetration, use = "complete.obs")
cor(df_filtered$Walkup_No_Reservation_pct, df_filtered$Product_5_Penetration, use = "complete.obs")


cor(df_filtered$pct_VAN, df_filtered$Leisure_Transactions, use = "complete.obs")
cor(df_filtered$pct_SUV, df_filtered$Leisure_Transactions, use = "complete.obs")


library(corrplot)  # install.packages("corrplot") once

# Numeric columns, after the 5% cutoff
df_num <- df_filtered[, sapply(df_filtered, is.numeric)]

# 5 penetration columns plus leisure
targets <- c(paste0("Product_", 1:5, "_Penetration"), "Leisure_Transactions")

# Full matrix saved as a file
cor_full <- cor(df_num, use = "pairwise.complete.obs")
write.csv(round(cor_full, 3), "correlation_matrix_full.csv")

# Each factor vs the targets
drivers <- cor(df_num, df_num[, targets], use = "pairwise.complete.obs")
drivers <- drivers[!rownames(drivers) %in% targets, ]
drivers <- drivers[!grepl("Revenue|Sold|Number", rownames(drivers)), ]

# Top 10 strongest factors
drivers <- drivers[order(-rowMeans(abs(drivers), na.rm = TRUE)), ]
top10 <- round(head(drivers, 10), 2)
print(top10)
write.csv(top10, "top_drivers.csv")

# Heatmap, saved as a PNG in your working folder
png("correlation_heatmap.png", width = 1000, height = 700)
corrplot(as.matrix(top10), method = "color", addCoef.col = "black",
         tl.cex = 0.8, number.cex = 0.7,
         col = colorRampPalette(c("blue", "white", "red"))(200))
dev.off()

