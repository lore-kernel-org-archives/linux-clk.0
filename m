Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665412;
	b=Tgwew36jaZcdhyQJ5seIq2Y5V+xhfwSwNnmd9oErVybnBBEfAmBnGT89bMg7hPIA59/G
	 wufvEy3LajKNOt0mRnIYVzkya5Takb8GaoBrK0xSWG3gW+gz0gMLyFO1jyvBFyL7c4GX8
	 F2ubCi4iTiu6bvAPtsNLZ13Ng2CVPD656/W6tfsTBwTF6TUWw0VRpceWUlRKLBChc1hHP
	 UxogJuKA7fcwoEp+DfxE//9Vrw/0yMVjh4IQqsLxrnSKDtu/d97JzEg9NYF93AsRLEVpV
	 td1ukLxTSbABJBkLO2rDB1fPIbe+ulnioctmxq7fXNFiqXemRv+bLohUuMhFQW9t6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665412;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	b=3zmz/t3KuEPrJ6StdANe05XmyAee5UkcKO9tUWg/d+t5CyOSEXslEj4iKNSIGmz1C5/j
	 2qelN2/wuN5OO2aOP1y1rKDtrw82z9IVZif9c5Trhpib3RQuk05B7kS/w0E7bbyUW+vLc
	 wQOiV42msh4eiBFe/L4Yypf/y9t93c9SiVhL81Y+Lnge7DQiJXmJoZ6TCHHwbtXlDfceW
	 fcfp/v1rQ2epxcwmPmKetGJDmxQi4uuE1L11BwqoAlVv3Ei+qe/NKm+ZRFjjjyI33Lzcp
	 HOULxiVqA9tX4VYh/DjOgkFe56wcTIPiaDY1eLxnf2+zQ1yIFdClhklTYIKK4BOT6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1au1t+v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A394606A329
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 03:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1au1t+v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28041F000CA
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665412;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=B1au1t+vJ4xKP1IwcH9Pb1aLK67JRhRCpw4dT+4rgsvqf1HRgU5eAKXqzVspfTD2Z
	 NSjVF+tFOrErbw03TvuslkeSgS2gWKnk7ql3nBagEJQBPH0eoJdxFooAdmd5y7c3TW
	 vkZPyNDmlSRKjn9WYFu5zAIWrRw6bVw5iFMJndIbxy7zo4rPih28/3zfnxvFD7+4xu
	 ObNiO6UKOl60sPZ7st1QS+eiwEEJzkFoi7kqMW25c6Q1l0GAo/qFNj9UIgC45JmpD4
	 FTbcEe/DPJRStHfaUSjbMMK2Iknzjxu41QTzO3b7nuIzsWlzL1MnO95ZNKp9BoYRWR
	 or0aB7/sdfsew==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae85add4dcso44244181fa.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 19:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGDZv0eIyAKmquRIlbLYvJl8lzQOZrX9XACiWHSSuBG+WExSG97cgjhnxMcIbxD42I4b8jmP/oth3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z91ZFy/fnkSeyqhcxcSFBYQS440Op5JIUHsPVIrU/S6BblQA/1b
	hMeo/R6Q0VOG11EIN1EOVg4Jh0kHtXWbKdcnX5q1ZucuzEZymThHrCky+5IjuGaQbQn7Wa3Hfyx
	W3Te3i1VfyMjs6ovRocr/mUtIkRrWZtQ=
X-Received: by 2002:a05:651c:a1aa:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae7fa71a15mr56174711fa.28.1795665409967; Wed, 25 Nov 2026
 19:56:49 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org>
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 12:56:37 +0900
X-Gmail-Original-Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
X-Gm-Features: Aa3M54rpP-Zn9FFry4pu5XjBTgRTyOiIwDPt_8N8tX1t-bsfN3kUc7IF24g0SfQ
Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 9:02=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
> > static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> >                         0x5c0, BIT(16), 0);
> > ...
> > static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hw=
s,
> >                         0x5e0, BIT(29), 0);
>
> While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
> link-up and DMA broke as soon as clk_disable_unused() ran.
>
> ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
> the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
> bus-msi-lite0 is only its register configuration clock. Referencing
> ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
> shared fabric, and gating them off breaks GMAC0 DMA.
>
> Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
> CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
> driver?

The patches have been merged. Please send a fix on top.

If in doubt, you can always check linux-next for patches you are tracking.

> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair
>
