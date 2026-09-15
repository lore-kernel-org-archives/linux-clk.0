Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745473B813C;
	Tue, 15 Sep 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477371; cv=none; b=YnJo9ruW2aptqy1wNEFwFvqoS4+WLOpyuCCVOKQ90q//d3HTnR36vccCatXLbhdrEI64ZILx4eRjq0xe7uVi/s5XFZu5aR7xN0OpsZXI786WoDtNRgsXWn1/eku9RSaJUwkgzS62HPofUmVj8QRuLXURr3HFHRV4sAaMfJbHf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477371; c=relaxed/simple;
	bh=K+dDFM4ytA19fpaSso+S5dty9s5VEcMMB920tIEDwDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nTXrKK4TT75Gqt2WKD6V/3/ILStltvMfUQICvOm51vNQNA8pN7Vx+s7xvXkq6aTuou9Nk7umq4wTqRsBhwpwGdU6YKOfTaxfGTny/Opml3KXuOsxmiue9JeboKU2wA691qzbBhzoJbNC4HxiTZE5drT6wMQZl2r9hFh+1MtuPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwGWt5+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwGWt5+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34591F000FF;
	Tue, 15 Sep 2026 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477369;
	bh=ttTOKkk4ck64oPFeYX75yIDUh83CLMTBPWwEeZU1MJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MwGWt5+GncOm9SunAshcHPbda3PjaMIV9ZC6/r53tcIerrFzMQcl0K0Dh7YLVD7S7
	 Bwh2dAb21Iiv6XHgfrpclPF4cEE+0ar3bOBLQuUcuyVOC2Fuwn66nYqoQ1m6g26VLA
	 fzmd5QnLio6KYdDveqTA1wL5LtyxvWFOz9Jp9He9cn4f08X/3I+PZOsBz0MhAOuabJ
	 8PFrUANqBnG0uWaKHbX3DpzHiS0Ko84ZQ6cQx1ZqF5C5qrf/Ye9W6ovvEFsPlVp+Z0
	 3fC8GjRHQOf0MHvreaXboNF8RScHL1T+zn6ih0Zeej1k0BwgdT6XF9/w3vqdfOyH6b
	 AeiKUvWCyNEdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: en7523: Add support for selecting the
 Serdes port in SCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260915125226.20579-3-ansuelsmth@gmail.com>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
 <20260915125226.20579-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:02:48 +0000
Message-Id: <20260915130248.B34591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: en7523: en7581_serdes_phy_set_mode() rejects USB Host PHY mod=
es
--

commit e4c0888a17c4cf69587dbf3077fe8a5e2ed19ae7
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: Add support for selecting the Serdes port in SCU

In the SCU register for clock and reset, there are also some register to
select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
that can switch between PCIe, USB or Ethernet mode.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 5c45aacb6409e..24fdec2e6198c 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -847,12 +878,179 @@ static int en7581_reset_register(struct device *de=
v, void __iomem *base,
[ ... ]
> +	case AIROHA_SCU_SERDES_USB1:
> +		reg =3D REG_NP_SCU_SSR3;
> +		mask =3D REG_SSUSB_HSGMII_SEL_MASK;
> +
> +		if (mode !=3D PHY_MODE_ETHERNET && mode !=3D PHY_MODE_USB_DEVICE &&
> +		    mode !=3D PHY_MODE_USB_DEVICE_SS)
> +			return -EINVAL;

[Severity: High]
Does this validation check in en7581_serdes_phy_set_mode() in
drivers/clk/clk-en7523.c incorrectly reject standard USB Host PHY modes for
the USB1 Serdes port?

When a USB controller driver (such as dwc3) is configured in Host mode, it
typically calls phy_set_mode() with PHY_MODE_USB_HOST or PHY_MODE_USB_HOST_=
SS
during initialization.

Returning -EINVAL here prevents the PHY multiplexer from switching to USB
mode, leaving the Serdes pins disconnected from the USB controller and
breaking USB Host functionality.

Should PHY_MODE_USB_HOST and PHY_MODE_USB_HOST_SS also be allowed here?

> +
> +		if (mode =3D=3D PHY_MODE_ETHERNET)
> +			sel =3D REG_SSUSB_HSGMII_SEL_HSGMII;
> +		else
> +			sel =3D REG_SSUSB_HSGMII_SEL_USB;
> +
> +		break;
> +	case AIROHA_SCU_SERDES_USB2:
> +		reg =3D REG_NP_SCU_SSTR;
> +		mask =3D REG_USB_PCIE_SEL_MASK;
> +
> +		if (mode !=3D PHY_MODE_PCIE && mode !=3D PHY_MODE_USB_DEVICE &&
> +		    mode !=3D PHY_MODE_USB_DEVICE_SS)
> +			return -EINVAL;

[Severity: High]
Similarly, does this logic incorrectly reject standard USB Host PHY modes
for the USB2 Serdes port?

If a USB controller initializes in Host or OTG mode, it will request
PHY_MODE_USB_HOST or PHY_MODE_USB_HOST_SS. Without explicitly allowing these
modes, USB Host operations might be completely non-functional on this SoC.

> +
> +		if (mode =3D=3D PHY_MODE_PCIE)
> +			sel =3D REG_USB_PCIE_SEL_PCIE;
> +		else
> +			sel =3D REG_USB_PCIE_SEL_USB;
> +
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915125226.2057=
9-1-ansuelsmth@gmail.com?part=3D2
