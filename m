Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF2284B4F
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028889; cv=none; b=s+BhAWo8daCDbVDty1KZ7dLVi8KdwW+nIZXTO7HlTSt0BggL5JxfSD9UcywUjOn11KrNv/6km8GwiR/Mq6Nyp7Xh1hl8XFJCARMslbz1sDTDuiGEy4YyFX+QSmkKzy93P1PCyp4SMcVkILq99pdazNLd8c2oA+ZEYI7DnURhMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028889; c=relaxed/simple;
	bh=Wbxkai96KV++LHuFBYgeBqSwbkDv6oZ7clagX+nNyW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyLitZ4nVHP1FVvIkSI4L/vrR1gYZ2dKGOYJk5rOvPRcFkfDzgwSwHHkSgjSsOntRYZ+DmI/0+FH161kSfozgws+vc9pAdn9mHNNJYBDaV3B8MTqiQdJ/skGV8AmhNbSvkjeQC0Km5q9Y7ROJoTuk/aR46TTV45UhiR+uhPzXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxBxJyEa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxBxJyEa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65a18bc4b1dso903865a12.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772028886; x=1772633686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X7TGnbDY8JHbzvNZLr4KocFzXXLBLgEWZOADNbBVWE=;
        b=YxBxJyEacPdaVWV8E/fFdEoQUVLYxSMeqbw9ucaoIl5p3TuwKqul+NYqvIxCldESmz
         p/jUirKiWkS2NvU8TNP7LQs+KVggrq0hXn7L6idvJ0mdN7JNZKTTkMjjqs3etEeOe5r2
         nUeOIOWqpwdcfaiZX4nysc6L74tOEoS36hlSmYJAir4gYpW56QgeEsOIXQ2MvXUN7a4I
         1MOON5iEM4WHqG3umTY+brO/gqsDiV9quWJxe1620opmKENLjSf2NsRn8osXuX8QPPAE
         3hv7zAAKrB4itOagZBu4Ca5fz+lg1BVg6BXJsiDdmmKR/oBjgjolE2E2GFSSWLv4aIGP
         gLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028886; x=1772633686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X7TGnbDY8JHbzvNZLr4KocFzXXLBLgEWZOADNbBVWE=;
        b=N+pXMFZw4Jwc3fRYtQIJl98Flni6kIr7QGIKvCyiw/vT504hYWVr6147dQ64B+PHWH
         rvssrmNHA0Rcq+/QUT2unELnTYW+VMIkRQubqZaqLWtlBRzaEdhsdoM7uRPmSqSp7eKE
         Rfpb7BWBZnLaXOOtyWRjV67oCvTLBErBL7z4IwH4KkR8ELhxd7MOc2bOttZ90rohS5im
         /GUDPQi95O55nzEAPn3eyg4WzBFP9+Wv5voldl1qm2Qv+asCElhBKuK9oV8ysejOOooz
         XEQ29LV7e1rtfTgiqjLvecVmbzZfhrSA2ps3L7NpVOZW85/MPemRXOkevarlomSvDGqo
         EcoA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6ClLyTzyVXDB1YwjNhbN8DG3UBWlfR/UPegv21bgDkJyNZ+maSqf819XRHGi2AictA7Q1tPjKiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtkh9PKXQPpjQHXLXHFFh7sc/bUvkInG56G9Rtk5/tCCEidW4N
	vUBJ5vo8Mtres0VBA5mMv3/VTgNezPMWlG/r5i4EdJSmvOCNQGwoXkf+
X-Gm-Gg: ATEYQzxx2XwSuF74WlUnDqNy1Nho5Z2H9uaRjFTy0r4pg+69Lu2GKlOK41eCbXevURw
	BOrbJyQF0S/gTrq7g9H2V3lqNMnflUkFCywG10OaCyvP4QkdrG37Qvs+TYRg864P4/+mmiyj+vt
	xgRgdrRhteTrkwnrOFOq7hGHiuC2njt7OaR/v46xhBKMlbnphXW5xUNmqRzyyR5KzmhhL4aiTV2
	k6kFRgOEciSTNwtPEZ6OOIZdTNQMbibZ5kxuJx3BigbLLvhMBfhe3WZnULWQKGmGG15uvyAy6/5
	C+zA0dos++ADz18VzbJ+R5vWNU+MSi++Kl+KOOqEAQNalgE0MGplxauWP5UDMI28mcPK3uAsgZE
	vFefc2KqAu0SyJSkjd1kKrYepJJYpRYcNpvySprl0ANCjNz/PL21NDSgRx9bIiaxJ8gZirSPQoI
	FKh0iwJGnHEctB1gmVlBv6NLHq
X-Received: by 2002:a05:600c:6218:b0:483:702f:4639 with SMTP id 5b1f17b1804b1-483a95eabd7mr166023945e9.2.1772022593550;
        Wed, 25 Feb 2026 04:29:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:6e08:ea2c:b2bc:dea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm33655969f8f.6.2026.02.25.04.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 04:29:52 -0800 (PST)
Date: Wed, 25 Feb 2026 14:29:49 +0200
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
Message-ID: <20260225122949.pt55t3eefr5nawmu@skbuf>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
 <20260210193516.temrg46yozxma7xb@skbuf>
 <DGND4VXM9X0N.2CP1VBD8E128M@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGND4VXM9X0N.2CP1VBD8E128M@bootlin.com>

On Tue, Feb 24, 2026 at 06:20:21PM +0100, Théo Lebrun wrote:
> > Could you please add a macro or comment hinting at the origin of the
> > magic number 5 here? You could also place these 3 lines in a common
> > helper, also called from eq5_phy_exit(), to avoid minor code
> > duplication.
> 
> ACK, something named `eq5_phy_reinit()`.
> 
> I don't have precise explanation for the 5µs value; I only know it is
> time to let the PHY settle before further register config writes.
> Is this enough?
> 
>    udelay(5); /* settling time */

If there's a single occurrence and there's a comment, it's fine.

> >> +	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
> >> +	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);
> >
> > Quick sanity check on your proposal to use #phy-cells = <1>. This is not
> > a request to change anything.
> >
> > What if you need to customize the RGMII drive strength (or some other
> > setting, maybe SGMII polarity if that is available) per lane, for a
> > particular board? How would you do that if each PHY does not have its
> > own OF node?
> 
> I have no knowledge of what that 0x9 stands for, I didn't see the point
> exposing it to devicetree. We could plan for the future and add a cell
> or create subnodes, but here I kept it simple stupid. Is it OK?

If you don't know that you need to customize anything, it's fine the way
it is.

> >> +	writel(reg, inst->gp);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int eq5_phy_exit(struct phy *phy)
> >> +{
> >> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> >> +	struct eq5_phy_private *priv = inst->priv;
> >> +	struct device *dev = priv->dev;
> >> +
> >> +	dev_dbg(dev, "phy_exit(inst=%td)\n", inst - priv->phys);
> >> +
> >> +	writel(0, inst->gp);
> >> +	writel(0, inst->sgmii);
> >> +	udelay(5);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> >> +{
> >> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> >> +	struct eq5_phy_private *priv = inst->priv;
> >> +	struct device *dev = priv->dev;
> >> +
> >> +	dev_dbg(dev, "phy_set_mode(inst=%td, mode=%d, submode=%d)\n",
> >> +		inst - priv->phys, mode, submode);
> >> +
> >> +	if (mode != PHY_MODE_ETHERNET)
> >> +		return -EOPNOTSUPP;
> >> +
> >> +	if (!phy_interface_mode_is_rgmii(submode) &&
> >> +	    submode != PHY_INTERFACE_MODE_SGMII)
> >> +		return -EOPNOTSUPP;
> >
> > Both PHYs are equal in capabilities, and support both RGMII and SGMII,
> > correct? I see the driver is implemented as if they were, but it doesn't
> > hurt to ask.
> 
> Datasheet indicates 0 can do SGMII/RGMII and 1 can do only RGMII.
> Did you imply that the driver code should reject SGMII on PHY 1
> if it ever gets asked for?

I didn't imply anything, as I didn't know the facts. But now that I do,
yes, I'm explicitly requesting you to reject the submodes that PHY 1
doesn't support.

I also notice that you haven't implemented support for phy_validate().
Please do so, even if your PHY consumer does not call it (it should, to
detect which modes and submodes are supported).

> >> +
> >> +	inst->phy_interface = submode;
> >
> > Short story: don't rely on the phy_set_mode_ext() -> phy_power_on() order.
> > Implement the driver so that it works the other way around too.
> >
> > Long story:
> > https://lore.kernel.org/netdev/aXzFH09AeIRawCwU@shell.armlinux.org.uk/
> 
> I wouldn't mind, but what should phy_power_on() do if no submode has
> been provided through phy_set_mode_ext() yet? Guess one? Fail?

Assume a default initial submode, and power on using the rules of that
submode. In your case you don't even have to assume, you can read
EQ5_GP_SGMII_MODE to figure out what the submode is at probe time.

> Also our PHY will need to be reset to change its mode if we do
> power_on() followed by set_mode(), which in practice is never something
> we want. Maybe there is a flag to indicate that we require a submode to
> power on?

Such flag doesn't exist, nor do I think it is desirable. It would
unnecessarily complicate consumer drivers, which would have to support
two code paths if they were to follow the "generic" PHY API model.

Feel free to reset the PHY if requested to change the submode while it
is powered on. For example, lynx_28g_set_mode() does that.
