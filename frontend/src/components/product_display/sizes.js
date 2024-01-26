export const getSizes = (category, division) => {
    if (category === "Clothing") {
        return ["XS", "S", "M", "L", "XL"];
    } else if (category === "Shoes") {
        let sizes = [];
        let startSize, endSize;
        if (division === "Men") {
            startSize = 6; 
            endSize = 14;
        } else if (division === "Women") {
            startSize = 5;
            endSize = 12;
        }

        for (let i = startSize; i <= endSize; i += 0.5) {
            sizes.push(i);
        }
        return sizes;
    }
};

export const sizes = ["W 5 / M 3.5", "W 5.5 / M 4", "W 6 / M 4.5", "W 6.5 / M 5", "W 7 / M 5.5",
    "W 7.5 / M 6", "W 8 / M 6.5", "W 8.5 / M 7", "W 9 / M 7.5", "W 9.5 / M 8", "W 10 / M 8.5",
    "W 10.5 / M 9", "W 11 / M 9.5", "W 11.5 / M 10", "W 12 / M 10.5"]