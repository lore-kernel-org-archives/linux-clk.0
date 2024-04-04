Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33481E86F;
	Thu,  4 Apr 2024 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221766; cv=none; b=TpD9rX8/sfnHU1xqwzjxf0nuWV3fb6iMko+UXM7MWAXuLM0C4E8wusjbRX3MLKhzzKUc23h8BG6iN4qwzlwPs0YS+AUjEEeAiBMUwqCckm40H3yAx4rm9qVeaebCuIGoOkC5TUW3f9G50CbU5ta+G3zVFGaGySWp7fb3mUkKre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221766; c=relaxed/simple;
	bh=JB3OrrjrOjff6wFCsiCl64xi1T8JRXxR+g2ZL5cXaR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xiww++H1NV07cFHuWlCPy6NEIKG8/TJRzKANnNhkpD7icqby96YLG00LgV7OCPSyAZ+eGNR0F1csRDoI/DZKhVS91coaHKNSuXI0gLnqYZcY7UMnFEQ/jWCymE+0+Xhj+VqLe8Rl4mLYvGRGD4jobayL2lCdR/8rPeQMcAfgvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bkt5dh1m; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bkt5dh1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712221762;
	bh=JB3OrrjrOjff6wFCsiCl64xi1T8JRXxR+g2ZL5cXaR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bkt5dh1maGfor7ufvp04BlZtKSec9z0A6Zo7FayyRcv48BXX9QvzJPQpLkUnbIHqH
	 9xVQNV6h4t7Ezxe7N/Akg4aoFITX9j5HGcHzWTYkfhAxXWvApWxuxBNhdWzRoZu9AW
	 +M+y2n+J9I8tf2c1vEIYOQe9ZijJD81osuv7tqx67jabWcCzHtx6m6PS2949wCarwk
	 KYM9zZop1vuG9Eeitc2GOaodd2nvuUoqwNJQ7+YRkrsftFPVDx3u2d2mqINrWB0vyF
	 CPwUPXP4o7t0aiPQfpuuWSZgLvDaB6pIHi0lrSIxgJhiiLbT9+ztVDxqq09ZWpgkc4
	 jcxx4jCI46bZA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CC20137813A4;
	Thu,  4 Apr 2024 09:09:21 +0000 (UTC)
Message-ID: <0297a8ab-2f62-4f03-b2ed-87180a47c57c@collabora.com>
Date: Thu, 4 Apr 2024 11:09:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: en7523: add EN7581 support
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name,
 john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com,
 lorenzo.bianconi83@gmail.com
References: <cover.1712160869.git.lorenzo@kernel.org>
 <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/04/24 18:20, Lorenzo Bianconi ha scritto:
> Introduce EN7581 clock support to clk-en7523 driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/clk/clk-en7523.c | 130 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 125 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index c7def87b74c6..51a6c0cc7f58 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -4,13 +4,16 @@
>   #include <linux/clk-provider.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <dt-bindings/clock/en7523-clk.h>
>   
>   #define REG_PCI_CONTROL			0x88
>   #define   REG_PCI_CONTROL_PERSTOUT	BIT(29)
>   #define   REG_PCI_CONTROL_PERSTOUT1	BIT(26)
> +#define   REG_PCI_CONTROL_REFCLK_EN0	BIT(23)
>   #define   REG_PCI_CONTROL_REFCLK_EN1	BIT(22)
> +#define   REG_PCI_CONTROL_PERSTOUT2	BIT(16)
>   #define REG_GSW_CLK_DIV_SEL		0x1b4
>   #define REG_EMI_CLK_DIV_SEL		0x1b8
>   #define REG_BUS_CLK_DIV_SEL		0x1bc
> @@ -18,10 +21,25 @@
>   #define REG_SPI_CLK_FREQ_SEL		0x1c8
>   #define REG_NPU_CLK_DIV_SEL		0x1fc
>   #define REG_CRYPTO_CLKSRC		0x200
> -#define REG_RESET_CONTROL		0x834
> +#define REG_RESET_CONTROL2		0x830

Wait what? The RESET2 register comes before RESET1 ?!?!

Is this a typo? :-)

> +#define   REG_RESET2_CONTROL_PCIE2	BIT(27)
> +#define REG_RESET_CONTROL1		0x834
>   #define   REG_RESET_CONTROL_PCIEHB	BIT(29)
>   #define   REG_RESET_CONTROL_PCIE1	BIT(27)
>   #define   REG_RESET_CONTROL_PCIE2	BIT(26)
> +/* EN7581 */
> +#define REG_PCIE0_MEM			0x00
> +#define REG_PCIE0_MEM_MASK		0x04
> +#define REG_PCIE1_MEM			0x08
> +#define REG_PCIE1_MEM_MASK		0x0c
> +#define REG_PCIE2_MEM			0x10
> +#define REG_PCIE2_MEM_MASK		0x14
> +#define REG_PCIE_RESET_OPEN_DRAIN	0x018c
> +#define REG_PCIE_RESET_OPEN_DRAIN_MASK	GENMASK(2, 0)
> +#define REG_NP_SCU_PCIC			0x88
> +#define REG_NP_SCU_SSTR			0x9c
> +#define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
> +#define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
>   
>   struct en_clk_desc {
>   	int id;
> @@ -207,14 +225,14 @@ static int en7523_pci_prepare(struct clk_hw *hw)
>   	usleep_range(1000, 2000);
>   
>   	/* Reset to default */
> -	val = readl(np_base + REG_RESET_CONTROL);
> +	val = readl(np_base + REG_RESET_CONTROL1);
>   	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
>   	       REG_RESET_CONTROL_PCIEHB;
> -	writel(val & ~mask, np_base + REG_RESET_CONTROL);
> +	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
>   	usleep_range(1000, 2000);
> -	writel(val | mask, np_base + REG_RESET_CONTROL);
> +	writel(val | mask, np_base + REG_RESET_CONTROL1);
>   	msleep(100);
> -	writel(val & ~mask, np_base + REG_RESET_CONTROL);
> +	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
>   	usleep_range(5000, 10000);
>   
>   	/* Release device */
> @@ -262,6 +280,64 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
>   	return &cg->hw;
>   }
>   
> +static int en7581_pci_is_enabled(struct clk_hw *hw)
> +{
> +	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +	u32 val, mask;
> +
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
> +	val = readl(cg->base + REG_PCI_CONTROL);
> +	return (val & mask) == mask;
> +}
> +
> +static int en7581_pci_prepare(struct clk_hw *hw)
> +{
> +	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +	void __iomem *np_base = cg->base;
> +	u32 val, mask;
> +
> +	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> +	       REG_RESET_CONTROL_PCIEHB;
> +	val = readl(np_base + REG_RESET_CONTROL1);
> +	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> +	val = readl(np_base + REG_RESET_CONTROL2);
> +	writel(val & ~REG_RESET2_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
> +	usleep_range(5000, 10000);
> +
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> +	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> +	       REG_PCI_CONTROL_PERSTOUT;

I'm not sure that this is actually something to control in a clock driver...

the right thing to do would be to add a reset controller to this clock driver
and then assert/deassert reset in the PCIe PHY/MAC driver.

Perhaps REFCLK_EN0/EN1 can be manipulated in a .enable() callback, treating
this really just as what it appears to really be: a gate clock! (hint: check
clk-gate.c)

> +	val = readl(np_base + REG_PCI_CONTROL);
> +	writel(val | mask, np_base + REG_PCI_CONTROL);
> +	msleep(250);
> +
> +	return 0;
> +}
> +
> +static void en7581_pci_unprepare(struct clk_hw *hw)
> +{
> +	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +	void __iomem *np_base = cg->base;
> +	u32 val, mask;
> +
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |

...and this should be a clk-gate .disable() callback, I guess :-)

> +	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> +	       REG_PCI_CONTROL_PERSTOUT;
> +	val = readl(np_base + REG_PCI_CONTROL);
> +	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> +	usleep_range(1000, 2000);
> +
> +	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> +	       REG_RESET_CONTROL_PCIEHB;
> +	val = readl(np_base + REG_RESET_CONTROL1);
> +	writel(val | mask, np_base + REG_RESET_CONTROL1);
> +	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2;
> +	writel(val | mask, np_base + REG_RESET_CONTROL1);
> +	val = readl(np_base + REG_RESET_CONTROL2);
> +	writel(val | REG_RESET_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
> +	msleep(100);
> +}
> +
>   static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
>   				   void __iomem *base, void __iomem *np_base)
>   {
> @@ -291,6 +367,37 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
>   	clk_data->num = EN7523_NUM_CLOCKS;
>   }
>   
> +static int en7581_clk_hw_init(struct platform_device *pdev,
> +			      void __iomem *base,
> +			      void __iomem *np_base)
> +{
> +	void __iomem *pb_base;
> +	u32 val;
> +
> +	pb_base = devm_platform_ioremap_resource(pdev, 2);
> +	if (IS_ERR(pb_base))
> +		return PTR_ERR(pb_base);
> +
> +	val = readl(np_base + REG_NP_SCU_SSTR);
> +	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
> +	writel(val, np_base + REG_NP_SCU_SSTR);
> +	val = readl(np_base + REG_NP_SCU_PCIC);
> +	writel(val | 3, np_base + REG_NP_SCU_PCIC);

What is 3?

#define SOMETHING 3 ??

> +
> +	writel(0x20000000, pb_base + REG_PCIE0_MEM);
> +	writel(0xfc000000, pb_base + REG_PCIE0_MEM_MASK);
> +	writel(0x24000000, pb_base + REG_PCIE1_MEM);
> +	writel(0xfc000000, pb_base + REG_PCIE1_MEM_MASK);
> +	writel(0x28000000, pb_base + REG_PCIE2_MEM);
> +	writel(0xfc000000, pb_base + REG_PCIE2_MEM_MASK);

And... this is .. some BIT() and some GENMASK() as far as I understand...
do we have any clue about what you're setting to those registers?

Can MediaTek/Airoha help with this, please?

#define SOMETHING BIT(29) /* this is 0x20000000 */
#define SOME_MASK GENMASK(31, 26) /* this is 0xfc00000 */

> +
> +	val = readl(base + REG_PCIE_RESET_OPEN_DRAIN);
> +	writel(val | REG_PCIE_RESET_OPEN_DRAIN_MASK,
> +	       base + REG_PCIE_RESET_OPEN_DRAIN);
> +
> +	return 0;
> +}
> +
>   static int en7523_clk_probe(struct platform_device *pdev)
>   {
>   	struct device_node *node = pdev->dev.of_node;
> @@ -306,6 +413,12 @@ static int en7523_clk_probe(struct platform_device *pdev)
>   	if (IS_ERR(np_base))
>   		return PTR_ERR(np_base);
>   
> +	if (of_device_is_compatible(node, "airoha,en7581-scu")) {
> +		r = en7581_clk_hw_init(pdev, base, np_base);
> +		if (r)
> +			return r;
> +	}
> +
>   	clk_data = devm_kzalloc(&pdev->dev,
>   				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
>   				GFP_KERNEL);
> @@ -329,8 +442,15 @@ static const struct clk_ops en7523_pcie_ops = {
>   	.unprepare = en7523_pci_unprepare,
>   };
>   

static const struct clk_en7523_pdata en7581_pdata = {
	.init = en7581_clk_hw_init, /* if (pdata->init) pdata->init(x, y, z) */
	.ops = en7581_pcie_ops,
};

or, alternatively:

static const struct .... = {
	.init = ...,
	.ops = (const struct clk_ops) {
		.is_enabled = en7581_pci_is_enabled,
		.... etc
	}
};

Cheers,
Angelo

> +static const struct clk_ops en7581_pcie_ops = {
> +	.is_enabled = en7581_pci_is_enabled,
> +	.prepare = en7581_pci_prepare,
> +	.unprepare = en7581_pci_unprepare,
> +};
> +
>   static const struct of_device_id of_match_clk_en7523[] = {
>   	{ .compatible = "airoha,en7523-scu", .data = &en7523_pcie_ops },
> +	{ .compatible = "airoha,en7581-scu", .data = &en7581_pcie_ops },
>   	{ /* sentinel */ }
>   };
>   

-
