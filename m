Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570CC28F50F
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752123; cv=none; b=o1LhS1H3LPKwoEouzDWKDjibK91rCVzjJW9fJqOVAEK0+e0+dFZJrve5RNs23EmukLt95zwhLP26cRf7SwdoHI6Zx2zcbnRLSP0oUnCge+12xrUmuGBqTA1zfZvQ5cBKQ8O/gNiM+UGrf1KI1us3AUfkbT29dZiFhpmYqYOS+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752123; c=relaxed/simple;
	bh=DGinb3ghEqxaZCJCZt3m8id3UTzrXFQ4oBk/VIE0rT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbOLYiaKw+fJmensZ6yyzoflJbJmDkHplzKvH1uSVhIKFCZ+6spZUpipUbe0Q9nVCykHGBumBiXzXhE25YS2b6PibBewvHptdSmv9KjjbSAFB7xtaMe8R5M8T+3KRCcqSms4qX1R1lIP2pNuLW7o9JM98xz8y9JAdjuL7L5y8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dum8HJ2m; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dum8HJ2m"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43631742db9so373694f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 11:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752121; x=1771356921; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1FTvcKjle8v/I3+gNDN7izL+kp2hM1kytmKhqKq02/4=;
        b=Dum8HJ2m2eabaP+8Kyv3xdhnrvCivqY0Ju/IizzWFWHxb6pL4aOiWxUUzg+7TT50Vv
         MXOwG0XdHpx22UUWZr4/cwCR2f4Rw6rPdMbW/6Hcl98Um9B3Kk8fojkqU3YnVaSALa9f
         oEMG5SHXHRMbYD9t6zoWB7jaymmpSSmPFFZH8IG765Az3RLYitn6H4Fm0wBO0OMrCniJ
         uBN8ZZpjsO9X7n0g5U87lbp8K7bjbj+EtCMY9+wQU50bruEz/E0+fx3juvztiubVMssY
         ZboTh1kiAg4+EYntnyvs/e43H8pDplbpyxYsQeZfpoFFf+C1Tzrzm+9UcigAz435YN9X
         KzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752121; x=1771356921;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FTvcKjle8v/I3+gNDN7izL+kp2hM1kytmKhqKq02/4=;
        b=V2QXQKG2OZHlOHKejytUgJjaLrL0RAEgswmVDdNiIjn5Yz3Aise97OfJSGmyuLgpcm
         iaSf5rqScPrcncKAQTS7CsLrYNhujsz2LrpwWGpSG+TXAJpon3hNKprMCtnGnIJRFA/Y
         Z9Ae9Ce4WAb8bjBXKdzGX2bF6rULWvbUISuaEzM6VBApw4f3rXQiXmj6+CGFPc3BFHS+
         V0BMa/PKTjR/flttuPTDx14OqMmrH9gcFdoT2OFwK5kqk0k8wnXhGKxsdBcCz127pq7m
         IMOAI/OuF3Ook6dPI2cPB+576W+gW/jkY5EukiQ0p+i6awZWmxC9jw3Bf7VUMUpykBaT
         Xuuw==
X-Forwarded-Encrypted: i=1; AJvYcCU4lLvdwCEOCuq0mjcthzgVUQvSPTienvEIeOzVHZIi77B5ca+Km1MT57pdXSGF1eyhkgLUbsx4GlE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxav/3gorD/0yOWOy+MtoBk/YXW/+BMdi91+LdfKYmj7fVHU9//
	U1snYcQCd/cHwbxua+ICGwDkJYdvlhX5RYLmVcrJlqwz2vM+KcZiI8lv
X-Gm-Gg: AZuq6aKFO+t6tGp3OZzNIT+1akjSHV4KNdkhVaVxWbW6Yjfhx5ZVnBSK3S0FocTTbx6
	iQnbLcccwULLdbDZrZ25OK9M7Kcw/KWCNCnUiwP9zHuZXQjFaEWeWDspA6/PzKXz/1v35rJkL3M
	NI4pSYfHr/aTM6ZuoZN6aNFFMyZrYH0lUZyhmi1crWeJhq8R+40K8Y0DjiTmom8L4VKnzFBVZgl
	QIZhMlC4+hI2lFg4+dZx1LU07qb5qscI0lWPhkn65viRPlw9iX1bNp7Y90tMlQtstx1IUMIlc6a
	lhNV2//TNMs+osPoKRyeFC4gOwpYRQbCLWX/O9dIrYj/QfhNQfrRR42ILXp3pVasygomgKfmxiK
	UnOxLztNannJ8IVV2xasURI02MTJd+pzQp4QtwTikOQu0oV8eEDM5jE3dggC+0c0LATATblfIZT
	QpwHtq0QO5h2Q25uw=
X-Received: by 2002:a5d:588d:0:b0:437:6e9b:805a with SMTP id ffacd0b85a97d-4377ad1e2cfmr2935958f8f.4.1770752120295;
        Tue, 10 Feb 2026 11:35:20 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:d8ac:c964:9b43:1b13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc26sm34036922f8f.22.2026.02.10.11.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:35:19 -0800 (PST)
Date: Tue, 10 Feb 2026 21:35:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 3/8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <20260210193516.temrg46yozxma7xb@skbuf>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>

Hi Theo,

On Tue, Jan 27, 2026 at 06:09:31PM +0100, Théo Lebrun wrote:
> +static int eq5_phy_init(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +	u32 reg;
> +
> +	dev_dbg(dev, "phy_init(inst=%td)\n", inst - priv->phys);

Nitpick: can you please remove the debugging prints and maybe add some
trace points to the PHY core if you feel strongly about having some
introspection?

> +
> +	writel(0, inst->gp);
> +	writel(0, inst->sgmii);
> +
> +	udelay(5);

Could you please add a macro or comment hinting at the origin of the
magic number 5 here? You could also place these 3 lines in a common
helper, also called from eq5_phy_exit(), to avoid minor code
duplication.

> +
> +	reg = readl(inst->gp) | EQ5_GP_TX_SWRST_DIS | EQ5_GP_TX_M_CLKE |

When you write 0 to inst->gp and then read it back, do you expect to
(a) get back 0 or
(b) are some fields non-resetting?

I see both as inconsistent, since if (a), you can remove the
readl(inst->gp) and expect the same result. And if (b), it also
shouldn't matter if you write zeroes a second time, if it was fine the
first time?

Shortly said, is readl(inst->gp) really needed?

> +	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
> +	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);

Quick sanity check on your proposal to use #phy-cells = <1>. This is not
a request to change anything.

What if you need to customize the RGMII drive strength (or some other
setting, maybe SGMII polarity if that is available) per lane, for a
particular board? How would you do that if each PHY does not have its
own OF node?

> +	writel(reg, inst->gp);
> +
> +	return 0;
> +}
> +
> +static int eq5_phy_exit(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +
> +	dev_dbg(dev, "phy_exit(inst=%td)\n", inst - priv->phys);
> +
> +	writel(0, inst->gp);
> +	writel(0, inst->sgmii);
> +	udelay(5);
> +
> +	return 0;
> +}
> +
> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +
> +	dev_dbg(dev, "phy_set_mode(inst=%td, mode=%d, submode=%d)\n",
> +		inst - priv->phys, mode, submode);
> +
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EOPNOTSUPP;
> +
> +	if (!phy_interface_mode_is_rgmii(submode) &&
> +	    submode != PHY_INTERFACE_MODE_SGMII)
> +		return -EOPNOTSUPP;

Both PHYs are equal in capabilities, and support both RGMII and SGMII,
correct? I see the driver is implemented as if they were, but it doesn't
hurt to ask.

> +
> +	inst->phy_interface = submode;

Short story: don't rely on the phy_set_mode_ext() -> phy_power_on() order.
Implement the driver so that it works the other way around too.

Long story:
https://lore.kernel.org/netdev/aXzFH09AeIRawCwU@shell.armlinux.org.uk/

> +	return 0;
> +}
