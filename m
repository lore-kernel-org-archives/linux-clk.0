Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E6261566
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532394; cv=none; b=Re59DhGHcyD8igdjCQo9F3HznPnnMQj61MUs7lPSNPsG5aU7d0O09/SizzqzbKJYhLbV98PtudQeN5z1EopyT0GebWqcgaFbCh7lHBwdX2Dzd/Hjv+Sa2+/Oxt5uCaCtvoIhMKkbUINoOB4CnIHPyUj9jQ9BqFCZVfA5YEyne9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532394; c=relaxed/simple;
	bh=ioKZ2MvhUw4Q0y9IwBXxm/cxgOWwwIiAjPD8x7s0DKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvGSMuld36PrPt0ld/FCSK5iE8w9rtGb++gfI5IyM1fJ9Bc/QUnwHGqlIZVeW/SN6dxWoAPG0DzQt+ap/qRBPt067LlkFD5uwXnYDZHYyOMLC4HOyOh12s348QL9ciOv4FcsAZlrB4rIwugTv689GWMWWViDt7c9jcgjwA9060E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoKtpO4r; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoKtpO4r"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6efe4e3d698so17457727b3.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532392; x=1740137192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0lFTwfZZcUWkq9fJmOvcld23qYjy5biwQLrQr9JB8A=;
        b=MoKtpO4rNvIBgN6jGqtGzj7n/zSy2m2444NFRZFxYQKpXDx/xxfRVNIaVHLFLKmB+6
         eEQ+U9k1Ol5/DcpidBPpSOAn8Thq9MKB+xgTEDNB+xOBLz3ovGjf9p+JA4IkE8XWhfhT
         Am9cR7N6YafEzsE7bdSdDgiWrPQZZJFMvgdvkek0SrNT8PXXf7KMsuPUJvjjjwn8yoc7
         WlL/6dfFiH406HOucQcd2MVPHLesXW8N3sKtkOUn4ZKec8FbK89qANOX4uXedYNEuLR3
         wGvdG8E9082DML2TCmjvskFemH3XxEp1wH1Ya8A10O592Ui/0T++tWl+LlHKn8EACZLs
         OMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532392; x=1740137192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0lFTwfZZcUWkq9fJmOvcld23qYjy5biwQLrQr9JB8A=;
        b=g0TNM4UWIZ5JyGrTP+i2O3FGx4HHWd5uGMlly6UcriZbPfrrU9NgcScv81TH8ZdO0V
         lLKtunIVNLMU39blldKLEWExZOTwWxm6LRQyVQ6U4V8eO0SLXuARJCkmVaf7RMjNGS7m
         95py/DPBQBamXcrSoTMkme0YvE+F0pqPjiWdbyoV57KgTUGUoCsz0NTxZ/q6D8jyuLnF
         Ldp7UoKAm1tJkrYIYSzA9Ix2hggGP44f1vcXz4nW0emAOeshvGg1kvGSUCQmq3gJejdK
         lKcGXPazkv7p40DVAMPjb1lHGvqrqhYPOaUA6P6mDPZ4wGjdbgNpd7+qtfJLH+fhbLrY
         ye8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4d8tg5v0nC7p20UBqW8c9sJzJcsEwNEwfGwfOjaMh/SBcXER3nvoLA79CnM+TOkMQFZP0ETsBsbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnFQwib+cCc0fw13twtpXzXITWUPtxYbbzqYuiIK7/9k9GcD5J
	/Bd3FmQuQx2oRro/s0urZdk9QKJcmqaXDyrMKkaOgl2o7+fsSiEjbxRJtUiV7drguFWp1UuL82K
	l8gjWR81hxtcsS2tnGt9ls99C5OOjwuTEZEB5LA==
X-Gm-Gg: ASbGncs1LF77sE65kcT/g2tA6hu14rh5QTSItXvK2NPpVAvLICIJgAukUvIWUly8g+a
	pRx49L0PqMeHo1EIkC363Kiy4c0wJ8+hisk3xPH/BAJ4miGaxZ3bfB8Wbh4jgmJ993yGctZeNBg
	==
X-Google-Smtp-Source: AGHT+IHgAlZM0IOqZW2VzEw1FYIV10AUY+XwYeC5PGfb6gr8KMhdCaMYxrQJlkGON4FNOU8B5yXkDtD2hxcjbR8IEvM=
X-Received: by 2002:a05:6902:2b11:b0:e5b:18ff:8cf4 with SMTP id
 3f1490d57ef6-e5d9f0c85afmr10803625276.5.1739532391918; Fri, 14 Feb 2025
 03:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:25:55 +0100
X-Gm-Features: AWEUYZkzFAbsbuTJhoDDXcEDwXJNLijMk4rdL9iJXNhVee2PTovAo1vxRBOIWOQ
Message-ID: <CAPDyKFq72fqa9xOOw3m2z2ceTj18JFn42PaqxA4Ks+o9dd3FXg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Support for Allwinner V853 SoC
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 13:52, Andras Szemzo <szemzo.andras@gmail.com> wrote:
>
> V85x is a SoC from Allwinner with video encoding targeted for the field of
> IP Camera. It integrates the single CA7 core, and a T-Head E907 RISC-V mcu.
> The SoC has the usual Allwinner peripherals and a Vivante NPU.
> V853 is a BGA package without DRAM, V851s/V851s3 has the same die with
> co-packaged 64MB/128MB DRAM (in a QFN88 package).
>
> This patchset tries to add basical support for the V853 device family.

Patch5 and patch6 applied for next via my pmdomain tree, thanks!

Note, patch5 (the DT patch) is also available on the immutable dt
branch, if soc maintainers need to pull it.

Kind regards
Uffe



>
> Changelog - v2:
>  - rebased on 6.14-rc1
>  - add a needed gate with key support to sunxi clk
>  - rewrite the ccu-r driver
>  - fix license issues
>  - remove the pinctrl binding, as it has beed applied
>  - rework the pinctrl driver, use the new sunxi dt based mux support. This new pinctrl
>    driver depends on the new sunxi device-tree based mux support patch series [1].
>  - remove the new usb phy binding, as the v853's usb phy is very close to d1/a64
>  - add a board dts
>  - ccu: add module description
>  - ccu: fix PLL enable bits, and min multipliers
>  - ccu: change PLL flags to CLK_SET_RATE_GATE
>  - ccu: use SUNXI_CCU_M_HWS at peripheral PLLs
>  - ccu: convert the VIDEO and CSI PLLs from nm type to nkmp according to BSP
>  - ccu: cpu axi clk use pointer
>  - ccu: fix comments
>  - ccu: swap i2s1 and i2s0 bus clocks
>  - ccu: fix indentation
>  - ccu: fix RST_BUS_SPIF order
>  - ccu: convert RST_RISCV_CLK_GATING from reset to gate
>
> [1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/
>
> Andras Szemzo (10):
>   clk: sunxi-ng: allow key feature in ccu reset and gate
>   pinctrl: sunxi: add driver for Allwinner V853
>   dt-bindings: clock: sunxi-ng: add compatibles for V853
>   clk: sunxi-ng: add CCU drivers for V853
>   dt-bindings: power: add V853 ppu bindings
>   pmdomain: sunxi: add V853 ppu support
>   dt-bindings: phy: allwinner: add v853 usb phy
>   phy: allwinner: add v853 usb phy compatible
>   ARM: dts: sun8i: add DTSI file for V853
>   ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s
>
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |    3 +
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |    2 +
>  .../power/allwinner,sun20i-d1-ppu.yaml        |    1 +
>  arch/arm/boot/dts/allwinner/Makefile          |    1 +
>  .../boot/dts/allwinner/sun8i-v851s-lizard.dts |  196 +++
>  arch/arm/boot/dts/allwinner/sun8i-v853.dtsi   |  656 ++++++++++
>  drivers/clk/sunxi-ng/Kconfig                  |   10 +
>  drivers/clk/sunxi-ng/Makefile                 |    4 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c       |  120 ++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h       |   14 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.c         | 1145 +++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.h         |   14 +
>  drivers/clk/sunxi-ng/ccu_common.h             |    2 +
>  drivers/clk/sunxi-ng/ccu_gate.c               |    6 +
>  drivers/clk/sunxi-ng/ccu_gate.h               |   14 +
>  drivers/clk/sunxi-ng/ccu_mux.c                |    4 +-
>  drivers/clk/sunxi-ng/ccu_reset.c              |    7 +
>  drivers/clk/sunxi-ng/ccu_reset.h              |    2 +-
>  drivers/phy/allwinner/phy-sun4i-usb.c         |   10 +
>  drivers/pinctrl/sunxi/Kconfig                 |    5 +
>  drivers/pinctrl/sunxi/Makefile                |    1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c    |   53 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |   15 +
>  .../clock/allwinner,sun8i-v853-ccu.h          |  132 ++
>  .../clock/allwinner,sun8i-v853-r-ccu.h        |   16 +
>  .../power/allwinner,sun8i-v853-ppu.h          |   10 +
>  .../reset/allwinner,sun8i-v853-ccu.h          |   60 +
>  .../reset/allwinner,sun8i-v853-r-ccu.h        |   14 +
>  28 files changed, 2513 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
>
> --
> 2.39.5
>
