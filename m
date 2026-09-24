Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C141DDF0
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280768; cv=pass; b=D8p8DVDUhnI7FuGF0K3OJ9Oyik+ErDjSB53/QMt2rTggW9Kw2nTdy4l+uOuFR+qCn9F7RLv4T0ly6YBBgKWtKh1U1qZIgaFip9+BLLLWD0SNsqgruymUkkJ+8W5ATrFHTblUAYXAUCZqAA4dx+T80qX9Alwm7VV6OGvztt+wVUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280768; c=relaxed/simple;
	bh=+fmR/U1H6avzccBRXy1O++xjv67Ls5rrWcxfYYUejZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIMWn6tDSW7/jEXKgVI/gmesldzvLXWZMowifW/7OeEGMhe0Uk73yfwYu+Z5McSoc/jf1T82B6nCZscIj6oqVnzaMKMnJ5jrx36X51hH0Hmsz2Qtuzr+C1FjSL1SNwDwgFvgiQAbtXBnn1O4cYsKF1HC7Qt8TwEdAhATjvGHr9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kz3em7Lb; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kz3em7Lb"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc7641d03a5so58637a12.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 13:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790280756; cv=none;
        d=google.com; s=arc-20260327;
        b=XYjPhvt1DEme49iu6Kjdm5rSfyqyzuMCx/4tNwEhCzyHpDg/oudRyS2VfG/6Z5s8U8
         VEC5qiG1VL+qfBrL/wyk3UqPASWObiOnm1RVVnSfQUDafRRFI3Vjeahkp8lBX00xtQYw
         8ljocS5KxqNoUzXk+Q2hMJ0ybEwuijoFnotgMRRVTlHlaZqEEPxi4HXUBuB2dZK1Vqf+
         VbpOqt8suGaPEiNpUIgKC9h4ef5tQS+FXK2IA1n7319xdUmtRlZdWRnkyIrD0Fs3Ynvv
         C43Kfi38H64a+6O2MuS2m5ivh3VPIA4Pl+JJZnNSNLYuADimxJiF8Iwt4YSigx/Q76so
         t23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=;
        fh=tzpl9ki5riEYOwxkhgNRu9thcfGXPkPmhanj+HWCJnY=;
        b=A3+A53sgmUGA9+I6Qr/HUPJs0rbc90nohPz5hYld2Xx0IEknLOzNkZfjNpkxfBYZ8A
         iNKXgUN8KNW0/j6lK2LKDxQtmzCsKF+LPrqM2t2xc5dX19oPink09CdIRovH4JnEW/xZ
         zDeHrxvQJwFirPAAKzPJYE+Nj9Fx8wk8qb63wDlLeBqadgTGyEBf06ECOllJRTcLZvPi
         Z75PTP2HeBRfqLYTK8e6jCBKTJ1Zvte9H/0kR48xTwI1in5qulG7wu5CE7iFkPF1EqDF
         rMmr8B/5AES+3T3gGrlfBNGexU2SU7AMjGPzsRroiGmnDY+e5+WrkUCwM4AOeW9kJd4Q
         HYIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280756; x=1790885556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=;
        b=kz3em7Lb5uSY8qWs5LMAw0tOhwh8FyZUygAFsiIEm5J1mQjNlzzLFtFM6vCV3EZYdb
         ngAZGTzVWnLGlmNpbEqJmFQg3ryeV0h9iqcjMmu6wmlbsoy0ugHk0bhZYUvJNfy5va8c
         7JXBCXV5pVEYMiLlTCHwOG/26v0DMCY7KcT5cf7op0nbKcTEuZuo/y3BsA17CTfC4nEN
         W1QQVfVUyGCHOHF2veHkq8g1vBNhRuJPPphIGMFuYXb8zvldouql4/INfIXU6iIXOLRx
         5KW2BosAGTBcUsv6yH5KjaZM/xjT/rxeo8qm5kQ+TcWOuupDUwzgs4BRMDvihjvdsGap
         mPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280756; x=1790885556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=;
        b=Dr0JHH1yp1FXS3jloBoEMCfvAZF9dhBUyQ7ZKzEbIVU5JwCl1FWwwcSl0mYKG+O/Xe
         lLxXYivvy1+VCt37Vq7r6fVji7bgy4Hj61LEtvFbTBdRuqXdafcilUb9BAR+xlNM/sIS
         2RXMuuPAtSNfnDBo5IJ48Q2DD6FErzPXhs/253iGPN2abyZUvWtnxROaPDJrD8pGOTr0
         qYPrZEDU3VmwP9rkJXaxJ9e5UwPsjgNWfCefmBcSt9FSTevKxQYc1TTfTaGuouB73QiR
         go2ELfaJha2qYv+ANTpZXkw0GQX4RVFg6vdFxxacnfWSCmpHg9d3c7nsq7lJbeO3GZ5e
         CYrA==
X-Forwarded-Encrypted: i=1; AKwUvBz9BdbRilzGdLtM6DrTboCyj7f7OYfGNdSEiE1O9TrcksqGpvypb8lb+m6i2+HrPLcbqPPJpdspZHo=@vger.kernel.org
X-Gm-Message-State: AFuF++lvKI9CL51LqjLnlnMJ3c3tUj8wnjMOJj/qEm8VmpSFkvSdCHTp
	kIBPfep6rYa2gHcEK4+18h3nm7NCHqlRi4O5REj+faGRi1UhdufNBvEy0fH1eLXjQgHfprBkWD1
	eXFsdqgTT3NMc+1csgIJxv+/AT2lvRFA=
X-Gm-Gg: AYBFou0BSad6dGOP+4z2h1kL9FTa8kXPmh4UjdW5sviQMmuehMuXkUXYiq9OTmqrhMq
	2c1r5EJvE6dasH3nzvBp0yUqbRo/xB8Gkf0KJ56CGBAxzZlZ2U+aVrbwlnsZ3isZR4J8PrfTKB7
	9IkIBX3bVtDniLWxhJpkHKCLbY1fwJBidGcaLqYcVToAJI3kmIFILd+zcSIni5qbvzIFOho1QIw
	PUqjM/QWu+f8HWEz9b8OHGqANLS81N4cO2jtOnZ+idwM4rMue+3995BTB7CKavLzT12710z9c0m
	NAa0nBRRKJWMRNE4aiPA4ZDeJ8qg+DnlQe1esy9o7nTYijjnsFZVHyk/IygyoA2CX8MHJkY=
X-Received: by 2002:a17:902:e94e:b0:2df:7e40:6f6c with SMTP id
 d9443c01a7336-2df7e407013mr31670965ad.46.1790280755626; Thu, 24 Sep 2026
 13:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <8871e921-f66c-475b-a489-560028eb2200@arm.com>
In-Reply-To: <8871e921-f66c-475b-a489-560028eb2200@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:12:01 +0100
X-Gm-Features: AclHuK_-mnDGIb_ID5ajTTS6OK8_9vcC7qVQlZUU6wB7EYPhgJdDLHDg8SJ6_uQ
Message-ID: <CAAxh=jsb_SGxKEisYYcg-eSbzE2iOUwnvmGUww_rUdXW64E84g@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: clock: add Allwinner B288 CCU
To: Andre Przywara <andre.przywara@arm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

thanks for the review.

> please add a cover letter

Done for v2.

> One problem in general is the lack of access to a manual [...]

The descriptions come from the BSP's clk-sun8iw10.{c,h}, cross-checked
against ccu-sun50i-a64.c - nine of the eleven PLLs are bit-identical -
and exercised on the device up to userspace.

> I am afraid you cannot push off the responsibility to other people

Copy-paste mistake, sorry. Moot now: folding both bindings into the
existing files removes those entries.

> why do you need a separate binding?

You're right, it's a strict subset; v2 just adds the compatible to
allwinner,sun4i-a10-ccu.yaml.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:03=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> many thanks for sending this series, on a first glance this looks pretty
> good.
> As a general comment: please add a cover letter (git format-patch ...
> --cover-letter, then edit the generated file), and explain a bit about
> the background of this work. This would be a good place to briefly
> describe what the B288 is, how it's related to other SoCs, how you came
> to all this information, the firmware story, and the existing
> limitations of this port.
>
> One problem in general is the lack of access to a manual, I am not even
> sure we ever upstreamed SoC support without one. Especially the clock
> driver is quite tricky, we would love to compare the clock descriptions
> against some documentation.
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../clock/allwinner,sun8i-b288-ccu.yaml       | 55 ++++++++++++
> >   include/dt-bindings/clock/sun8i-b288-ccu.h    | 90 ++++++++++++++++++=
+
> >   include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
> >   3 files changed, 190 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/clock/allwinner,=
sun8i-b288-ccu.yaml
> >   create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
> >   create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-b2=
88-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-=
ccu.yaml
> > new file mode 100644
> > index 000000000000..22b59d5b652c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.=
yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/allwinner,sun8i-b288-ccu.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Clock Control Unit
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <mripard@kernel.org>
>
> I am afraid you cannot push off the responsibility to other people,
> especially I think Maxime wouldn't be really interested any more ;-)
>
> Actually, why do you need a separate binding? Wouldn't it be enough to
> just add the compatible string to the existing
> allwinner,sun4i-a10-ccu.yaml file? This one here looks like a subset of
> this, and would blend in there easily.
>
> Cheers,
> Andre
>
> > +
> > +properties:
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +  compatible:
> > +    const: allwinner,sun8i-b288-ccu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: hosc
> > +      - const: losc
> > +
> > +required:
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    ccu: clock-controller@1c20000 {
> > +        compatible =3D "allwinner,sun8i-b288-ccu";
> > +        reg =3D <0x01c20000 0x400>;
> > +        clocks =3D <&osc24M>, <&osc32k>;
> > +        clock-names =3D "hosc", "losc";
> > +        #clock-cells =3D <1>;
> > +        #reset-cells =3D <1>;
> > +    };
> > diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bi=
ndings/clock/sun8i-b288-ccu.h
> > new file mode 100644
> > index 000000000000..3dc1704d001e
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> > @@ -0,0 +1,90 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
> > +#define _DT_BINDINGS_CLK_SUN8I_B288_H_
> > +
> > +#define CLK_PLL_CPUX 0
> > +#define CLK_PLL_AUDIO_BASE   1
> > +#define CLK_PLL_VIDEO0       2
> > +#define CLK_PLL_DDR0 3
> > +#define CLK_PLL_PERIPH0      4
> > +#define CLK_PLL_VIDEO1       5
> > +#define CLK_PLL_24M  6
> > +#define CLK_PLL_PERIPH1      7
> > +#define CLK_PLL_DE   8
> > +#define CLK_PLL_DDR1 9
> > +
> > +#define CLK_PLL_PERIPH0_2X   10
> > +#define CLK_PLL_PERIPH1_2X   11
> > +#define CLK_CPUX     12
> > +#define CLK_AXI      13
> > +#define CLK_CPUAPB   14
> > +#define CLK_AHB1     15
> > +#define CLK_APB1     16
> > +#define CLK_APB2     17
> > +
> > +#define CLK_NAND     18
> > +#define CLK_MMC0     19
> > +#define CLK_MMC1     20
> > +#define CLK_MMC2     21
> > +#define CLK_MMC3     22
> > +#define CLK_SPI0     23
> > +#define CLK_SPI1     24
> > +#define CLK_SPI2     25
> > +#define CLK_DRAM     26
> > +#define CLK_DE       27
> > +#define CLK_EE       28
> > +#define CLK_EDMA     29
> > +#define CLK_TCON0    30
> > +#define CLK_MBUS     31
> > +
> > +#define CLK_BUS_THS  32
> > +#define CLK_BUS_NAND 33
> > +#define CLK_BUS_SDMMC0_BUS   34
> > +#define CLK_BUS_SDMMC1_BUS   35
> > +#define CLK_BUS_SDMMC2_BUS   36
> > +#define CLK_BUS_SDMMC3_BUS   37
> > +#define CLK_BUS_SPI0 38
> > +#define CLK_BUS_SPI1 39
> > +#define CLK_BUS_SPI2 40
> > +#define CLK_BUS_I2S0 41
> > +#define CLK_BUS_I2S1 42
> > +#define CLK_BUS_SPDIF        43
> > +#define CLK_BUS_DSD  44
> > +#define CLK_BUS_DMIC 45
> > +#define CLK_BUS_USBOHCI0     46
> > +#define CLK_BUS_USBEHCI0     47
> > +#define CLK_BUS_USBOTG       48
> > +#define CLK_BUS_DE   49
> > +#define CLK_BUS_EE   50
> > +#define CLK_BUS_TCON0        51
> > +#define CLK_BUS_CSI_S        52
> > +#define CLK_BUS_CSI_M        53
> > +#define CLK_BUS_CSI_MISC     54
> > +#define CLK_BUS_ADDA 55
> > +#define CLK_BUS_SDRAM        56
> > +#define CLK_BUS_PSRAM        57
> > +#define CLK_BUS_DMA  58
> > +#define CLK_BUS_UART0        59
> > +#define CLK_BUS_UART1        60
> > +#define CLK_BUS_UART2        61
> > +#define CLK_BUS_UART3        62
> > +#define CLK_BUS_UART4        63
> > +#define CLK_BUS_UART5        64
> > +#define CLK_BUS_TWI0 65
> > +#define CLK_BUS_TWI1 66
> > +#define CLK_BUS_TWI2 67
> > +#define CLK_BUS_PIO  68
> > +#define CLK_BUS_GPADC        69
> > +#define CLK_BUS_KEYADC       70
> > +
> > +/*
> > + * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, =
which
> > + * needs the sample and output phase clocks. mmc2 and mmc3 are newer b=
locks
> > + * that do their own delay calibration and have none.
> > + */
> > +#define CLK_MMC0_SAMPLE      71
> > +#define CLK_MMC0_OUTPUT      72
> > +#define CLK_MMC1_SAMPLE      73
> > +#define CLK_MMC1_OUTPUT      74
> > +
> > +#endif
> > diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bi=
ndings/reset/sun8i-b288-ccu.h
> > new file mode 100644
> > index 000000000000..675145654548
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
> > +#define _DT_BINDINGS_RST_SUN8I_B288_H_
> > +
> > +#define RST_BUS_THS  0
> > +#define RST_BUS_NAND 1
> > +#define RST_BUS_MMC0 2
> > +#define RST_BUS_MMC1 3
> > +#define RST_BUS_MMC2 4
> > +#define RST_BUS_MMC3 5
> > +#define RST_BUS_SPI0 6
> > +#define RST_BUS_SPI1 7
> > +#define RST_BUS_SPI2 8
> > +#define RST_BUS_I2S0 9
> > +#define RST_BUS_I2S1 10
> > +#define RST_BUS_SPDIF        11
> > +#define RST_BUS_DSD  12
> > +#define RST_BUS_DMIC 13
> > +#define RST_USBPHY0  14
> > +#define RST_BUS_OHCI0        15
> > +#define RST_BUS_EHCI0        16
> > +#define RST_BUS_OTG  17
> > +#define RST_BUS_DE   18
> > +#define RST_BUS_EE   19
> > +#define RST_BUS_TCON0        20
> > +#define RST_BUS_CSI  21
> > +#define RST_BUS_ADDA 22
> > +#define RST_BUS_WLAN 23
> > +#define RST_MBUS     24
> > +#define RST_BUS_DRAM 25
> > +#define RST_BUS_PSRAM        26
> > +#define RST_BUS_DMA  27
> > +#define RST_BUS_UART0        28
> > +#define RST_BUS_UART1        29
> > +#define RST_BUS_UART2        30
> > +#define RST_BUS_UART3        31
> > +#define RST_BUS_UART4        32
> > +#define RST_BUS_UART5        33
> > +#define RST_BUS_I2C0 34
> > +#define RST_BUS_I2C1 35
> > +#define RST_BUS_I2C2 36
> > +#define RST_BUS_GPADC        37
> > +#define RST_BUS_KEYADC       38
> > +
> > +#endif
>
