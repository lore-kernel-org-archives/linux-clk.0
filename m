Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132970;
	b=viRW2/3/sLC5JfMpBJ6SDoGHJmUNBBrkOCF7t6QsdK61Pr77UBhQ/0BrkdIFG6LycZdu
	 5n9b8CuLxqhQh+vKzW3MlPiwk06XzbHvBcl750tbM8EeOGoUutl/KkTqiwWnb9aMwj1CU
	 wyJBw3D89tRHtu+FsF5g583zrL/JP+hS+fIGf+LhE4+dXZ2x9uMSoHEH8b5xy3VUVVV0S
	 xY23VO3Yw692vS5G7yUk10qnS0K7OMHSfXp2EBlhcNdRHv0OruE+zCV9igNE10rzuAVpa
	 LPksov0tTpCaT4Rpu4lz6buAdUripC2KPbp9fGCFI8P8bCRrfym4ug0ALVL5MeIe1Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132970;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Qn17H3IOSSvH2IrLgkvHMH5GTctM6BtdG2wuJf630Zg=;
	b=cjIX3dj9vIbB8NVzl6itB2ZbCSroucDifVhPs+2a4dtLdTazTH9beIbi61jKJjB4FCFQ
	 D3Hvp/0932NagLybY+YXaa46zNJaafNmBqgImKiZKJjkxs3Sy2iHbJGZbPWc+bDTZUkld
	 diuzKzPTvv00e/93zPhf4kayifH2Sm1/baKTZJCHWOwB+ppZc2vOT8rw5AANGNFIR0h+Q
	 1cokZftJLcVhMjp6avUo9ZuQWozc3+gwHTheI3Slr5mMvvVOeILup31WORBsSSuSV4vh5
	 NUv9t7rmiaKuHX+SNAv9aUrlX9dyyyohxOjL5uaE+350TDibzGjEog0Mjy3XWZrs9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjYYCOS3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2C606A339;
	Fri, 20 Nov 2026 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjYYCOS3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941221F000C4;
	Fri, 20 Nov 2026 00:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132970;
	bh=Qn17H3IOSSvH2IrLgkvHMH5GTctM6BtdG2wuJf630Zg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kjYYCOS3oV+wZvwdPucNHyX1gAV2Er8PDCfK7NQ8WmThGtrdfqr+bYOAJwn+6BA2B
	 OycZAUQS0aeMUisdEep8zp/rpk4c7RDEA4C+pDyepkIAwfd1jAGPvk5czD04L5dATw
	 Q2v6ZTZbj34VvXFnpgPWLVxu2WPktLX1Idan+AwaspKEMxVle0Oqp62xmkgOdkVTx1
	 6s9mOROpx9O0IQ0CHKyeR2vf5lvlHhfYlbZFV+ovfFu+n0Q3P6rFwAPRF7Y8BPf+YU
	 x50aY3VE03wmhhDNpsQbJQogXe0SQmIV9XGlftMlHIelv3McyaePpv/shPC0KRwlD/
	 kexxczAo3k0VA==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v13 3/5] clk: en7523: protect concurrent access to
 reset and PCI register
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117182444.103123-4-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-4-ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 19:02:30 -0500
Message-Id: <179513295003.301584.12707579619184180658.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=5332; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=elDJihZr8Sn8KuTsCcqxv3H8PrekDh20MCAmc0hzyog=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+9yk+na5t8unf/gv73oWv+eZhdeLZZ81SLdWtnT/dT
 oWqF8263lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE+P4yMnzYGePr+ezS45pr
 T+ffPNu0lOmw6XmNJQftwubu6eIVmuXP8D9M5mPD+k79nKfugVM/5osXzFY/ssRmzvtKuco711/
 UT+cBAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> Use spinlock for concurrent access to reset and PCI register to catch case
> when clock is enabled/disabled while a reset is also operated at the same
> time. This is needed as register are shared for both clock and reset
> operation and rmw operation require protection against writing inconsistent
> data.
> 
> Some minor rework was needed for PCI unprepare case to permit calling it
> before clk_hw_register and reference the global spinlock.

This should be split out into it's own patch.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 74 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 69 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index d1d8935f0a1a..886858345cf0 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -150,6 +150,7 @@ struct en_clk_soc_data {
>  	const struct clk_ops pcie_ops;
>  	int (*hw_init)(struct platform_device *pdev,
>  		       struct clk_hw_onecell_data *clk_data);
> +	void (*pci_unprepare)(struct device *dev, struct en_clk_gate *cg);
>  };
>  
>  static const u32 gsw_base[] = { 400000000, 500000000 };
> @@ -584,51 +585,95 @@ static int en7523_pci_is_enabled(struct clk_hw *hw)
>  static int en7523_pci_prepare(struct clk_hw *hw)
>  {
>  	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +	struct device *dev = clk_hw_get_dev(hw);
>  	void __iomem *np_base = cg->base;
> +	struct en_clk_priv *priv;
> +	unsigned long flags;
>  	u32 val, mask;
>  
> +	priv = dev_get_drvdata(dev);
> +
>  	/* Need to pull device low before reset */
> +	spin_lock_irqsave(&priv->lock, flags);

You can use:

scoped_guard(spinlock_irqsave, &priv->lock) {
	...
}

>  	val = readl(np_base + REG_PCI_CONTROL);
>  	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
>  	writel(val, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	usleep_range(1000, 2000);
>  
>  	/* Enable PCIe port 1 */
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val = readl(np_base + REG_PCI_CONTROL);
>  	val |= REG_PCI_CONTROL_REFCLK_EN1;
>  	writel(val, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	usleep_range(1000, 2000);
>  
>  	/* Reset to default */
> +	spin_lock_irqsave(&priv->lock, flags);
>  	val = readl(np_base + REG_RESET_CONTROL1);
>  	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
>  	       REG_RESET_CONTROL_PCIEHB;
>  	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	usleep_range(1000, 2000);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val = readl(np_base + REG_RESET_CONTROL1);
>  	writel(val | mask, np_base + REG_RESET_CONTROL1);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	msleep(100);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val = readl(np_base + REG_RESET_CONTROL1);
>  	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	usleep_range(5000, 10000);
>  
>  	/* Release device */
> -	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
> +	spin_lock_irqsave(&priv->lock, flags);
>  	val = readl(np_base + REG_PCI_CONTROL);
> +	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	usleep_range(1000, 2000);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	msleep(250);
>  
>  	return 0;
>  }
>  
> -static void en7523_pci_unprepare(struct clk_hw *hw)
> +static void __en7523_pci_unprepare(struct device *dev, struct en_clk_gate *cg)
>  {
> -	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +	struct en_clk_priv *priv = dev_get_drvdata(dev);
>  	void __iomem *np_base = cg->base;
> +	unsigned long flags;
>  	u32 val;
>  
> +	spin_lock_irqsave(&priv->lock, flags);
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
>  	writel(val, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +}
> +
> +static void en7523_pci_unprepare(struct clk_hw *hw)
> +{
> +	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +	struct device *dev = clk_hw_get_dev(hw);
> +
> +	__en7523_pci_unprepare(dev, cg);
>  }
>  
>  static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
> @@ -648,8 +693,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
>  	cg->base = np_base;
>  	cg->hw.init = &init;
>  
> -	if (init.ops->unprepare)
> -		init.ops->unprepare(&cg->hw);
> +	if (soc_data->pci_unprepare)
> +		soc_data->pci_unprepare(dev, cg);
>  
>  	if (devm_clk_hw_register(dev, &cg->hw))
>  		return NULL;
> @@ -663,6 +708,7 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
>  	u32 val, mask;
>  
>  	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
> +

Extra newline can be dropped.

Brian

-- 
Brian Masney <masneyb@kernel.org>
