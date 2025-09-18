Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64262E0406
	for <linux-clk@vger.kernel.org>; Thu, 18 Sep 2025 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758193921; cv=none; b=KWX0IY2+FXguU7Qx6kUGMkbfOD4gUQQETsTyNp3l8xN9oZ+M8UKt9w9PH7xvM9a6llV9E3U03oYNVem1AZTvlLnIPd5HuFTOFFyGplviYzk4ky4KCrWhQP8EA+xrb0tnnSxL6RvixBpQzM3ZpfKlDbjGd4/sCz3QQi/edAywTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758193921; c=relaxed/simple;
	bh=hh9aJMUS07iQ+JFOom0lu0TZ4+z/q5RWhduVOfEcJqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8IDB5Yy6Erqg3AoTmOIJsmfiwL2xcG1jkgP5VVjgeayK4DXnjG49pBtFyR/qB6B8aCPGBjMb5IeE3CpU1myGbOHunXoq/CYs389UNZIvXDQN0A06M2r0sED6URZxywIe/xMa3LZHyf1fMhEtSqfSmv/BGaWtTk+5FWVK/Qehqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpCECnOC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpCECnOC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3eb0a50a60aso528644f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Sep 2025 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758193918; x=1758798718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgH82lUCOsP+VrtHsBb90fe5+wv2J6tQFhMpK3dJL7w=;
        b=dpCECnOCrgA1mxzqPTKyDIj1swhbBlQ5b5LTRj+j2xRdvTIQEMKrI1ymAz8wTP7Xv8
         h4+nvc2STIYQTUrdpAjc/II2zK0HfztmmR4Uwc+sXL6+HQTz8tJ85x1kWLJirour5Hjo
         c7Qet4m2UyRhkDa6U2RxZR02qr6L22osn+bngCXsZWwoologyiWnqXzjneUld5RvY9np
         uYbqU8yKTEtDs/CtOWWCBQCGArPTJNu3DP/QWW/C2Nw7hkUaEGVZSWNUBpYmmF2H2Ycf
         oVw8e9UY4QwddTvVLx+WdZMoKqAaIHsUOHwQwnBq17yCRfUwu5mFzftWApdoPIfy3wtv
         a+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758193918; x=1758798718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgH82lUCOsP+VrtHsBb90fe5+wv2J6tQFhMpK3dJL7w=;
        b=FCFIGvzIWG9BgQPVIJwEEShdtMl675MzJTeoWx7CZoTX7oRcOUV/6EVuP29Mt6/37M
         Y4R7D5uU1ij19LXrUi+pudUkUtIO56tQrrdEXZLbBEhW5BbtWPmpIKpWycSLNZhe7Mwq
         qgw6Xp15rR23hFbHTU8CM37W4o+A/LX3gcgufWOW9a5KU/3Bd14YGPe7J2EDMV4dmzkp
         MWYeGimTE2vVfz5ygQRKTKgE9bFYcZPMW2zwVe/l3kOso6xOmegx9BOPv7MW3Tyk9Zkc
         Onk/SToocD4YwTxCTbfsamAWYYscZUza2cm7FYh01qrCQps2WSdcaihEgKHxTH9GhXtV
         QmJA==
X-Gm-Message-State: AOJu0YxLdqMHs0H/tBgT0QBlmSxsHpTsXYi+8w3Ab0jcZRnFC7y0mgvG
	AQiU42Uvs+rvzmp2hC4z8yAlkxHqVllnrtZ9oi/b/1rkVScGISK0qFX8f9DJtiYejYCtLpYCfl+
	QwVfWuT72VQt+cmMlLm7hXXNRPBxb5o+Xod0HjkI=
X-Gm-Gg: ASbGncsWFpw6SGhsXVXBG1lj6+ZjRouFD4zTASBwClF5wkt3dFSGWuR3Gx4UoBhAxR5
	i0dlbuQlecKmL80Jf+EjpVOlYTSU3ebnKi3bkSxV0rhtuHOeBK1CNiG6fVG1nOxEax6d9Brj8z+
	XY1NweCC30KA7VQnh1oasyltS5r0c8k4v8cQS/eE8YCvfu2Fs/S0+SUr4z1Totz1xnTdzxus3iH
	vl2Jg4q/gi9g9XzdzfDRgdh2sk=
X-Google-Smtp-Source: AGHT+IG0GMui68drR1bqxkF8T9cRxS3juUoMGcMHWjH/OXmaJxEWr9FQxLagF0QgDoGdQk4pJSLUDY67LP3Vklsr4dA=
X-Received: by 2002:a5d:5d10:0:b0:3dd:981d:43a5 with SMTP id
 ffacd0b85a97d-3ecdfa4e575mr3860337f8f.47.1758193917668; Thu, 18 Sep 2025
 04:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Sep 2025 12:11:30 +0100
X-Gm-Features: AS18NWD77y8PPkGANcR7F8lkci9tGtrtCWwH2x7D42Lju8LFSoC6mJti4exnjPU
Message-ID: <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Thu, Sep 18, 2025 at 4:07=E2=80=AFAM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> On R-Car V4H, the PCIEC controller DBI read would generate an SError
> in case the controller reset is released by writing SRSTCLR register
> first, and immediately afterward reading some PCIEC controller DBI
> register. The issue triggers in rcar_gen4_pcie_additional_common_init()
> on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
> read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).
>
> The reset controller which contains the SRSTCLR register and the PCIEC
> controller which contains the DBI register share the same root access
> bus, but the bus then splits into separate segments before reaching
> each IP. Even if the SRSTCLR write access was posted on the bus before
> the DBI read access, it seems the DBI read access may reach the PCIEC
> controller before the SRSTCLR write completed, and trigger the SError.
>
> Mitigate the issue by adding a dummy SRSTCLR read, which assures the
> SRSTCLR write completes fully and is latched into the reset controller,
> before the PCIEC DBI read access can occur.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 65dfaceea71f..7b52e8235984 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_dev=
 *rcdev,
>
>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
to read the reset register `7` times and confirm [0] (as mentioned in
the HW manual). So after reading do we want to confirm the bit is
set/clear?

[0] https://lore.kernel.org/all/20250905114558.1602756-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/

Cheers,
Prabhakar

>
>         /*
>          * On R-Car Gen4, delay after SRCR has been written is 1ms.
> @@ -701,6 +702,7 @@ static int cpg_mssr_reset(struct reset_controller_dev=
 *rcdev,
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
>
>         return 0;
>  }
> @@ -715,6 +717,7 @@ static int cpg_mssr_assert(struct reset_controller_de=
v *rcdev, unsigned long id)
>         dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
>         return 0;
>  }
>
> @@ -729,6 +732,7 @@ static int cpg_mssr_deassert(struct reset_controller_=
dev *rcdev,
>         dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> +       readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
>         return 0;
>  }
>
> --
> 2.51.0
>
>
