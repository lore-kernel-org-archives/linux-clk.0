Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623623F54AE;
	Mon, 12 Oct 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800528; cv=none; b=VokWpFtf/vFeab5wMXma+nXB1VBjUkemLYjZDsQkwHafsIz7I7lXrwUCGJnfEkAqA54jPha/Ojnsxu7WKogXdmYn7K4k/Le5ffWX5Uxp7r9bwk4rZPe6Fg8jYiGPDxKHLhkfCIWLDh5NdN4bdHEGqmYploRhFfxczfiDflXh9vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800528; c=relaxed/simple;
	bh=3TiYQNgjiqyYCFVtetRXPC2T1t46OvhBF3BDdkAKE7k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mcuSYzabK1lcsq7m7cmwdoiI4MZw48JAmYxmJ5LlitFrwIotKHHspJ2RgbgOuvdM5lKQmkMNRiPsu2yiaVX1cY8i7HzTWU4nokZXRn3YbWTWRw7Sk3HnnRMXcJPVomkW03pgBZHSjcwm3sb+gY0Wlns8Es/YjZTASCN2b/nCStc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPRFeW5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPRFeW5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2C41F008A2;
	Mon, 12 Oct 2026 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800507;
	bh=iPkwnxITGvmUXP1HuWb6DGGfN0C5MPcFO3HBlq8MprY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPRFeW5c2uVuVbP+BObt0aJ2ImaDh4ge2ltQoZlyRpUgDFxfZW3jPT4SVmrgGAgv+
	 wveCTca+th/HABySu+3KKcydQvqzr8q+Sss18bbUDhGk+c30w84mo31OViXZeVnw2g
	 fdYhRYlRi0TPP0/dc++YKNnYcScWV9k0s+aqL922etZqzKur6WXFFsplF35mOAqeue
	 i81lv02jXgvucRLwF/S740did3QGXhzY3axpoAjGX9TmmhMHeeIYzADpl0G+vA68qw
	 HskLrPN4pkHKiEXDy2krqYMbv5Zpo/qvZYDBSOedQyvzpnvAsmaN7+QsghKmEh/bbK
	 o3iUkCZSCbIbw==
Message-ID: <sashiko-outbox-167950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: add Allwinner B288 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261012100816.331033-3-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 10:21:47 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: sunxi-ng: missing parent index table for tcon0_clk
--

commit 3f9c552550550b015864167770907fa314ac3239
Author: Pablo Mazzini <pmazzini@gmail.com>

clk: sunxi-ng: add Allwinner B288 CCU driver

This commit introduces the Allwinner B288 CCU driver, covering the PLLs,
the CPU/AHB/APB tree, module clocks, bus gates, and resets. The driver
is noted to be closely related to the A64 CCU.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-b288.c
> new file mode 100644
> index 0000000000000..c53afd6f9af98
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c

[ ... ]

> +/* DE_CFG @ 0x104, EE_CFG @ 0x108, EDMA_CFG @ 0x10c -- M[3:0] mux[26:24]=
 gate 31 */
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(de_clk, "de", de_parents, 0x104,
> +				      0, 4, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ee_clk, "ee", de_parents, 0x108,
> +				      0, 4, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(edma_clk, "edma", de_parents, 0x10=
c,
> +				      0, 4, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
> +
> +/* TCON_CFG @ 0x118 -- mux[26:24] gate 31, no divider */
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents, 0=
x118,
> +				    24, 3,		/* mux */
> +				    BIT(31),		/* gate */
> +				    CLK_SET_RATE_PARENT);

[Severity: Medium]
Does the B288 hardware actually use a 1:1 index mapping (0 and 1) for this
TCON mux?

The closely related A64 SoC uses a {0, 2} index mapping for its TCON PLLs.
Because SUNXI_CCU_MUX_DATA_WITH_GATE defaults to a 1:1 mapping, if a display
driver requests to use pll_video1 for the TCON, the CCU driver will write
index 1 to the mux register. If the hardware maps the second parent to index
2 instead of 1, this will result in incorrect clock parent selection and co=
uld
break video output.

If a custom mapping is needed, it might be slightly tricky to define since =
the
ccu_mux.h framework currently lacks a SUNXI_CCU_MUX_DATA_TABLE_WITH_GATE
macro to combine a table with clk_parent_data.

> +
> +/* MBUS_CFG @ 0x15c -- M[2:0] mux[25:24] gate 31 */
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mbus_clk, "mbus", mbus_parents, 0x=
15c,
> +				      0, 3, 24, 2, BIT(31), CLK_IS_CRITICAL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.3310=
33-1-pmazzini@gmail.com?part=3D2
