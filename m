Received: from mx-relay58-hz1.antispameurope.com (mx-relay58-hz1.antispameurope.com [94.100.133.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D22DEA72
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.229
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335147; cv=pass; b=Y6M9su532KC8mELLFiYoSJcjuX7QK54NFt+JBKzRkkSDi4mEurAT7SV6AzrDP0LkaPV/gNWeCPgysrWl7PBYF7yGA4gWsHmi3YqFhymKxmdKkKKXS5qyxyhvdcVmzPB2Lva+/lEGkUiKljn53qBw8GVHVtnudr8XykN20+jl6Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335147; c=relaxed/simple;
	bh=X8AGmIyFH62+8FCE1sx2DQx4ow/3aWax6JFtbnR28t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxVof+50i5UCZ+qPZYf5Em+KXLMx1OqMMwfmabVgr6QzW1fTM3vth0RkpKdpFHElb/Nfhi+kunMQ3Rga/hzwcc5sIIE/g4fsLl8paYk93UpCi3ihrOEB3PZnSNbK7BKfWjMLbDSvj1VcffbAak+ikcLKsd3oqKFDFfrTV/6Q3mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=n2+u07gI; arc=pass smtp.client-ip=94.100.133.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="n2+u07gI"
ARC-Authentication-Results: i=1; mx-gate58-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qVaz1zwGuDSR6vm0lLRYYp/IrSSmnl0g1UxK/5AowGY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760335116;
 b=NGE6U5VMNeMd86F5OaUk9Z+5/wJKFlhKtQg21m+KC2xoSO7FTD3ITHC+NoEIKmu9ZR9uKNAL
 XzurtDdvyP6i3ZaX0UMbtfj6MJpjWdTZFQZ/UT1PubRmawgjzX1WQdpFNAEyS4AtKb5OkKn00RW
 HsOPgAWuH7GB9ZfRu7/oDP5MbFFyRG2NtgNsQidO0o0MxPUhu9dNGEvR/JUXXBBuNFXl5KWq9l5
 vaxeW7Rfq4RNVRysJKHXa3I0WekTYpDwQ19OSvM2NacCTI0GSg+2tf6s1RlZhFqO/B/xWcAPh6F
 VpXCI/+Y7tV83PnGGUDW5K9kqPdBuOf19wdNSkpqutRUw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760335116;
 b=cdObsrZrSYajtmEiNliW2ZuV0aVmTBnrkgDreum20aGssjgRlPAX2toS4XkEyYVyXEuoIFDI
 hdLSeb7MJvaZB/AsnpJzvCw0pL/EITNUEDeLSHB+rzMst5t+4eU1OyzOx6JXKePi4t39W4Sqlpv
 Q1fEI1bTIigoB9Is5q87MGN009O3yRJ/bq+TAg4GwuglSnimq8E2e3WpyPT8X+VCpAemqHWfuvk
 JrFuDX8VG6DUEdMNWypEhUZ8gbMhyVuh14gBTlW1uM8PiH2GI1llv5atLv382cjulWiLvx4g+KF
 mIKQtqx7lhrG39gF2Dl0sTXr4yiLSozuejUkAbnVv/aqQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay58-hz1.antispameurope.com;
 Mon, 13 Oct 2025 07:58:36 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DC35522054B;
	Mon, 13 Oct 2025 07:58:12 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Xu Yang <xu.yang_2@nxp.com>
Subject:
 Re: [PATCH v2 3/4] phy: fsl-imx8mq-usb: support alternate reference clock
Date: Mon, 13 Oct 2025 07:58:12 +0200
Message-ID: <2805917.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251010-usb-phy-alt-clk-support-v2-3-af4b78bb4ae8@nxp.com>
References:
 <20251010-usb-phy-alt-clk-support-v2-0-af4b78bb4ae8@nxp.com>
 <20251010-usb-phy-alt-clk-support-v2-3-af4b78bb4ae8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay58-hz1.antispameurope.com with 4clRTy0D7HzQkxm
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:7d5dfab00112230566df6a60cb391a85
X-cloud-security:scantime:2.228
DKIM-Signature: a=rsa-sha256;
 bh=qVaz1zwGuDSR6vm0lLRYYp/IrSSmnl0g1UxK/5AowGY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760335115; v=1;
 b=n2+u07gI/iSKPu0J9uw/ifKOvaOu+BxYbup6E1KPCuYSrvyCo//OhDZzUcb0xKEozt2NXv2p
 rQ+Rg62SwbXhDXxSUqjDp07bpEGgPmwAXoQe9/nfxlLaEbMLUa4r9E11B+InX7ENtiR+TsL24mR
 ztxCuYGxaq4GD71g+BiDtkP00BsXIb5sCzmDJPg+Oj2jqbsGY/K1roSa6IYl/BeX5LYYFpZ14ad
 mfIP6dgqR4gI1X2LKCXOhE9EQWduXpBrT2rDMUUDCB17hWfMpJy1UxDmT4L7FrOKJVPxODLFmUf
 hbVfXYCK9LqOEgGULBl46sraltgZhJmDMhEnS36gbTjmQ==

Am Freitag, 10. Oktober 2025, 13:01:12 CEST schrieb Xu Yang:
> This phy supports both 24MHz and 100MHz clock inputs. By default it's
> using XTAL 24MHz and the 100MHz clock is a alternate reference clock.
> Add supports to use alternate reference clock in case 24MHz clock
> can't work well.

This driver supports imx8mx and imx8mp as well. Do these SoC also support
the alternative clock?

Best regards
Alexander

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - add Rb tag
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b94f242420fc733cd75abef8ba1cd4f59ac18eb5..ad8a55012e42f2c15496955d00c6d5fd85c5beb2 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -16,6 +16,7 @@
>  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
>  #define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
>  #define PHY_CTRL0_FSEL_24M		0x2a
> +#define PHY_CTRL0_FSEL_100M		0x27
>  
>  #define PHY_CTRL1			0x4
>  #define PHY_CTRL1_RESET			BIT(0)
> @@ -108,6 +109,7 @@ struct tca_blk {
>  struct imx8mq_usb_phy {
>  	struct phy *phy;
>  	struct clk *clk;
> +	struct clk *alt_clk;
>  	void __iomem *base;
>  	struct regulator *vbus;
>  	struct tca_blk *tca;
> @@ -582,7 +584,8 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  	/* USB3.0 PHY signal fsel for 24M ref */
>  	value = readl(imx_phy->base + PHY_CTRL0);
>  	value &= ~PHY_CTRL0_FSEL_MASK;
> -	value |= FIELD_PREP(PHY_CTRL0_FSEL_MASK, PHY_CTRL0_FSEL_24M);
> +	value |= FIELD_PREP(PHY_CTRL0_FSEL_MASK, imx_phy->alt_clk ?
> +			    PHY_CTRL0_FSEL_100M : PHY_CTRL0_FSEL_24M);
>  	writel(value, imx_phy->base + PHY_CTRL0);
>  
>  	/* Disable alt_clk_en and use internal MPLL clocks */
> @@ -626,13 +629,24 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	return clk_prepare_enable(imx_phy->clk);
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(imx_phy->alt_clk);
> +	if (ret) {
> +		clk_disable_unprepare(imx_phy->clk);
> +		return ret;
> +	}
> +
> +	return ret;
>  }
>  
>  static int imx8mq_phy_power_off(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
>  
> +	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);
>  	regulator_disable(imx_phy->vbus);
>  
> @@ -681,6 +695,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(imx_phy->clk);
>  	}
>  
> +	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
> +	if (IS_ERR(imx_phy->alt_clk))
> +		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
> +				    "Failed to get alt clk\n");
> +
>  	imx_phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> 
> 




