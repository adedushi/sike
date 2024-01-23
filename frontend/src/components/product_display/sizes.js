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