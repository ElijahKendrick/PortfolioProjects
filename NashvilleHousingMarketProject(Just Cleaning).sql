/*

Cleaning Data in SQL Queries

*/


Select * From
ProjectOne.dbo.NashvilleHousing

----------------------------------------------------------------------------------------------------------------------

--Standarize Date Format

Select saledateTwo, CONVERT(date,saledate)
from NashvilleHousing

Update NashvilleHousing
Set SaleDate = CONVERT(date,saledate)

Alter Table NashvilleHousing
Add SaledateTwo Date;

Update NashvilleHousing
Set SaleDateTwo = CONVERT(Date,SaleDate)

---------------------------------------------------------------------------------------------------------------------------

--Populate Property Address Data-----------------------------------

Select *
From NashvilleHousing
--Where PropertyAddress is null--------------------
order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From NashvilleHousing a
JOIN NashvilleHousing b
    on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
Set propertyaddress = ISNULL(a.propertyaddress,b.propertyaddress)
from NashvilleHousing a
join NashvilleHousing b
    on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null




------------------------------------------------------------------------------------------------------------------------

--Breaking out Address into individual Columns (Address, City, State)---------------

Select propertyaddress
From NashvilleHousing
--Where PropertyAddress is null
--Order by ParcelId

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as Address

From NashvilleHousing

ALTER TABLE NashvilleHousing
ADD SplitAddress NVARCHAR(255);


Update NashvilleHousing
Set SplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

Select *
From NashvilleHousing


----------Clean Owner Address--------------------------------------------------------------------------------------------

Select OwnerAddress
From NashvilleHousing

Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From NashvilleHousing

ALTER TABLE NashvilleHousing
ADD OWnerSplitAddress NVARCHAR(255);


Update NashvilleHousing
Set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)


----------------------------------------------------------------------------------------------------------
-- Change Y and N to Yes and No in "Sold as Vacant" field----------------------------------

Select DISTINCT(SoldAsVacant), Count(SoldAsVacant)
From NashvilleHousing
Group by SoldAsVacant
Order by 2


Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'YES'
       When SoldAsVacant = 'N' THEN 'NO'
	   Else SoldAsVacant
	   END
From NashvilleHousing

Update NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'YES'
       When SoldAsVacant = 'N' THEN 'NO'
	   Else SoldAsVacant
	   END



----------------------------------------------------------------------------------------------------------------------------------
-- Remove Duplicates 
--Future Reference DELETING DATA IS NOT STANDARD PRACTICE BUT FOR THIS PROJECT I WILL--------------------------------

WITH RowNumCTE AS(
Select *,
    ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
	             PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				    UNIQUEID
					) row_num

From NashvilleHousing
--order by ParcelID
)
SELECT *,
From RowNumCTE
Where row_num > 1
Order By PropertyAddress
--Interchange SELECT * with DELETE take off order by propertyaddress to remove duplicates

------------------------------------------------------------------------------------------------------------------------------
--Delete Unused Columns

Select *
From NashvilleHousing

ALTER TABLE NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE NashvilleHousing
DROP COLUMN SaleDate