--select * from nashvillehousing

--The dates were standardized because I imported the data using the csv sql server wizard.

--Populate Property Address Data (Nulls)

--We make a self join to obtain the null values that are missing.

--select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.propertyAddress, b.PropertyAddress) Substitute
--from NashvilleHousing a 
--inner join NashvilleHousing b 
--on a.ParcelID = b.ParcelID and a.UniqueID <> b.UniqueID
--where a.PropertyAddress is null

--update a
--set PropertyAddress = isnull(a.propertyAddress, b.PropertyAddress)
--from NashvilleHousing a 
--inner join NashvilleHousing b 
--	on a.ParcelID = b.ParcelID 
--	and a.UniqueID <> b.UniqueID
--where a.PropertyAddress is null

--Breaking out Address into Individual Columns (Address, City, State)

--select SUBSTRING(propertyAddress, 1, CHARINDEX(',', propertyaddress) - 1) Address1, SUBSTRING(propertyAddress, CHARINDEX(',', propertyaddress) + 1, len(propertyaddress)) Address2
--from NashvilleHousing

--alter table nashvillehousing
--add splitAddress nvarchar(255)

--alter table nashvillehousing
--add splitCity nvarchar(255)

--update NashvilleHousing
--set splitAddress = SUBSTRING(propertyAddress, 1, CHARINDEX(',', propertyaddress) - 1)

--update NashvilleHousing
--set splitCity = SUBSTRING(propertyAddress, CHARINDEX(',', propertyaddress) + 1, len(propertyaddress))

--select splitaddress, splitcity from NashvilleHousing

--For owner address we will use parsename, it separes strings using periods '.'.

--select 
--PARSENAME(replace(owneraddress, ',', '.'), 3),
--PARSENAME(replace(owneraddress, ',', '.'), 2),
--PARSENAME(replace(owneraddress, ',', '.'), 1) from NashvilleHousing

--alter table nashvillehousing
--add splitOwnerAddress nvarchar(255)

--alter table nashvillehousing
--add splitOwnerCity nvarchar(255)

--alter table nashvillehousing
--add splitOwnerState nvarchar(255)

--update NashvilleHousing
--set splitOwnerAddress = PARSENAME(replace(owneraddress, ',', '.'), 3)

--update NashvilleHousing
--set splitOwnerCity = PARSENAME(replace(owneraddress, ',', '.'), 2)

--update NashvilleHousing
--set splitOwnerState = PARSENAME(replace(owneraddress, ',', '.'), 1)

--select splitOwnerAddress, splitOwnerCity, splitOwnerState from NashvilleHousing


