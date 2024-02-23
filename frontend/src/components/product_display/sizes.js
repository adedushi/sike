export const getSizes = (category, division) => {
    if (category === "Clothing") {
        return ["XS", "S", "M", "L", "XL"];
    } else if (category === "Shoes") {
        let sizes = [];
        let startSize, endSize;
        let sizeDifference = 1.5;

        if (division === "Men") {
            startSize = 6;
            endSize = 14;
            for (let i = startSize; i <= endSize; i += 0.5) {
                let womensSize = i + sizeDifference;
                sizes.push(`M ${i} / W ${womensSize}`);
            }
        } else if (division === "Women") {
            startSize = 5;
            endSize = 12;
            for (let i = startSize; i <= endSize; i += 0.5) {
                let mensSize = i - sizeDifference;
                sizes.push(`W ${i} / M ${mensSize}`);
            }
        } else if (division === "Kids") {
            startSize = 3.5;
            endSize = 7;
            for (let i = startSize; i <= endSize; i += 0.5) {
                sizes.push(`${i}Y`);
            }
        }
        return sizes;
    }
};
