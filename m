Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966801;
	b=gMep+hoTQhL26s0Y5blH/6W2qfy5wIH8CMlgO0aGPxxQ2NUrB/GCKta99O/Q6hvXTjie
	 JTQ4e18Hwj93Y/SsZVyRST0p54vGlXi3iroRxtht4u4jdFOh77zKXFuXzeVq61WBq9Sup
	 2+sb+MoQfppICgn9FQANwGUAvOmgIu4mbBZ6/VgvqB6KmkRuO4EDzI2msAB89Yaa0vxUs
	 Wp5Ev8JWqCOtc+FZPhZwqFvVx0VEGvueo0D3+6CxBhyrHechy9+nWrNwLo/S9tr7klGZv
	 WQH1YFQA29THzXflXbwyvZwuGPFAhuzi2nE+gZNxZGTFojTLcPSdMk1xVkG2GKuuu9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966801;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kTmDNaB5SlgqoSG11/b3GBHAL02Fkjv+AYUpj38Qgs0=;
	b=BpupNNGFDMLVOeAPFnFqwW9H2RI5e1p3atSCdzAePRw88Adw6awdtJq1lYNLM8otNiaB
	 k4RveHq318Ohn4XJLbV2MO/l7FIskUQB9r60zCuGEhphJA1Nj4UbuUxb6k82Gz34GpqE2
	 tCvjCxkbJcuAtVX0RbtARCxZFajGf2A6BNb0VEwptu60eVUKCbrO+reQkdxoNfdKti9Ka
	 7G0F7tXFg4cyp8GOD2x/hAvAXUpqebYC15Wn3DGPUMvnuU1LWNnhQTnWmUrqa50N3J/7o
	 bcgOSjNe7nDC0UbXI8l+g/omE0N2lQAJEx63y6rJmtBIQDp727fTrw83Hab1/q7CqsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIwBVG8O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B662606A32F;
	Fri,  6 Nov 2026 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIwBVG8O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6161F0089F;
	Fri,  6 Nov 2026 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966800;
	bh=kTmDNaB5SlgqoSG11/b3GBHAL02Fkjv+AYUpj38Qgs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZIwBVG8OBXH2LX8Kh6f7HFws6Ugs5mSHNP+9lTzOK7DjR1LRUhzu8trjP6u1zPRru
	 EC2snGskcr5SRA9TDSCIUpMTMG75h3c9zAnWe3bWBcKKQJ63nxqYzLesEMPpe8mvQ/
	 XDHIC3M/PucmIbHhjwMtC1wg2bqQPtjI1Bc2Zp0BC9bYukgtE4z686w6bBlaiCdZ2v
	 Sed0hyn/lRW3c8WL3JDj++mkY4rhPApUWceCpii/xa7Mb3Z0uA6ULz17k0M9AjjO39
	 Zue3+LSY0tL9v+3V7jekkRq+srZXEIIcwgWqr7Y5xDbE4/D4pv8nBhGQsrRzjZqEoE
	 wk/Wj3wLeOMKA==
Message-ID: <sashiko-outbox-201377@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/5] clk: en7523: protect concurrent access to reset
 and PCI register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106115852.189098-4-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
 <20261106115852.189098-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:06:39 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] clk: en7523: NULL dereference in clk_hw_get_dev() before
  registration
--

commit 9029e0297a2815d965ae1a27ae544f0b9a67fb5f
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: protect concurrent access to reset and PCI register

This commit adds spinlock protection around PCI control and reset register
accesses in the EN7523 clock and reset callbacks.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 2baec734df9fe..e534a5c91e618 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -623,12 +666,19 @@ static int en7523_pci_prepare(struct clk_hw *hw)
>  static void en7523_pci_unprepare(struct clk_hw *hw)
>  {
>  	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
> +	struct device *dev =3D clk_hw_get_dev(hw);
>  	void __iomem *np_base =3D cg->base;
> +	struct en_clk_priv *priv;
> +	unsigned long flags;
>  	u32 val;
> =20
> +	priv =3D dev_get_drvdata(dev);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	val &=3D ~REG_PCI_CONTROL_REFCLK_EN1;
>  	writel(val, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
>  }
[ ... ]
> @@ -683,12 +748,20 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  static void en7581_pci_disable(struct clk_hw *hw)
>  {
>  	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
> +	struct device *dev =3D clk_hw_get_dev(hw);
>  	void __iomem *np_base =3D cg->base;
> +	struct en_clk_priv *priv;
> +	unsigned long flags;
>  	u32 val, mask;
> =20
> +	priv =3D dev_get_drvdata(dev);
>  	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
>  	usleep_range(1000, 2000);
>  }

[Severity: High]
Does clk_hw_get_dev(hw) dereference a NULL hw->core pointer when
en7523_register_pcie_clk() calls init.ops->unprepare(&cg->hw)?

drivers/clk/clk-en7523.c:en7523_register_pcie_clk() {
	...
	cg->base =3D np_base;
	cg->hw.init =3D &init;

	if (init.ops->unprepare)
		init.ops->unprepare(&cg->hw);

	if (devm_clk_hw_register(dev, &cg->hw))
		return NULL;
}

clk_hw_get_dev() returns hw->core->dev, but hw->core is only allocated and
assigned inside devm_clk_hw_register().  Calling init.ops->unprepare()
before registration causes a NULL pointer dereference during probe on SoCs
that set pcie_ops.unprepare to en7523_pci_unprepare() or
en7581_pci_disable().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106115852.1890=
98-1-ansuelsmth@gmail.com?part=3D3
