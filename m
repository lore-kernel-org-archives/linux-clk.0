Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657144CF40;
	Wed, 23 Sep 2026 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195784; cv=none; b=M+Yh7jISqXefBcnD+PvunKLjLKKKlvmpNjAudWI2WAOY8UqUz56+ZR/ETrOhu7/CsiGxfF8eJk275f+7IRyvPDMMY5bENqlvEYt+/6C3QCZsTww2gPkYNlbXOwS36UQfIUIWRMOs5BNNh1CoAEEd/fN80SuZQWfm80FN1SH2+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195784; c=relaxed/simple;
	bh=2RZyP8wj2BCJdxqNFQLy4whaJU9CDa4KwithoOYoSzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LHMsdMAcRjY6Z9coLVakdKqjQBp3laW3lbplqVn8g7wO9T+0x/0CrlrnhpkdgzetVDTGiDLMnYVi9MzhSP+HLq93/9a+6gV/qsDhzNWUMq7dV2GihVKlXrE8qfZVRhgVQnpxD+Wtl4WtaK0yoXdz3zqRyExanCAhKG9GnieQYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STHRA42U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STHRA42U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698291F000FF;
	Wed, 23 Sep 2026 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195783;
	bh=L0zCQDyrwud5b2X8p1hF6OfQ42IiAs+qNcY8pz4Xkik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STHRA42UiLij3u3J2VvQ/tonY7OFp6d+Wpf3GNotinliT2yRp4phy1EGOy9SQPtBS
	 KkuSpF7T5bgwyC61zXs3MENMjTMyM2+rDLCpP2w4WMLvKHJA1/W1/b53f5HfYsfYSz
	 q31Hdz7uXARlTNTDeCKTkCnuCCjhh2s+TwPi/NLu0+kphLBJXpMtyMXaEpFeX8NhdL
	 1A3hbl+hZjMp40Mk5RrI59vUU7fTqDMMXYcS5IgJNAD40ZsMBOeCozAthGmOomPVGP
	 nyt9iGxmC3/JvV/FjRrIWZ/0vMUvDuY3Ur0+xR36e/NushOQNNNYkp6AMY7p0d3NUH
	 TY04GO2dpiJyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/11] clk: sunxi-ng: add Allwinner B288 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
In-Reply-To: <20260923201701.43391-2-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-2-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:36:22 +0000
Message-Id: <20260923203623.698291F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: sunxi-ng: shared gate conflict on csi bus clocks
--

commit ae2cfebe5340417fd7a0871fe9800b7e3353dc68
Author: Pablo Mazzini <pmazzini@gmail.com>

clk: sunxi-ng: add Allwinner B288 CCU driver

This commit introduces the clock control unit (CCU) driver for the Allwinner
B288 SoC, covering the PLLs, CPU/AHB/APB trees, module clocks, and bus
gates and resets.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-b288.c
> new file mode 100644
> index 0000000000000..4c3ce02878d25
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
[ ... ]
> +static SUNXI_CCU_GATE(bus_tcon0_clk, "bus-tcon0", "ahb1",
> +		      0x064, BIT(4), 0);
> +static SUNXI_CCU_GATE(bus_csi_s_clk, "bus-csi-s", "ahb1",
> +		      0x064, BIT(8), 0);
> +static SUNXI_CCU_GATE(bus_csi_m_clk, "bus-csi-m", "ahb1",
> +		      0x064, BIT(8), 0);
> +static SUNXI_CCU_GATE(bus_csi_misc_clk, "bus-csi-misc", "ahb1",
> +		      0x064, BIT(8), 0);
> +static SUNXI_CCU_GATE(bus_adda_clk, "bus-adda", "apb1",

[Severity: High]
Does this create a shared gate conflict for the csi bus clocks?

These three distinct clock objects map to the exact same physical register
(0x064) and gate bit (BIT(8)). Because they are declared as separate clocks,
the Common Clock Framework tracks their reference counts independently.

If driver A enables the bus-csi-s clock and driver B enables the bus-csi-m
clock, the shared gate will be turned on. However, if driver A subsequently
disables bus-csi-s, the framework will clear the shared bit because the
bus-csi-s reference count reached zero.

Could this abruptly disable the active clock for driver B, potentially
causing hardware lockups, asynchronous external aborts, or device failure
during standard device probe, unbind, or runtime PM sequences?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923201701.4339=
1-1-pmazzini@gmail.com?part=3D2
