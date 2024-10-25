Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4E1384B3;
	Fri, 25 Oct 2024 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868398; cv=none; b=nXJJmjYkMq33lQTF+hgoGoB6a6GNg5UphZ6+il0WUPVnLXVBJU62w1+Y7eCusPL9nWz3leTi8ecdqHjtzMt+hhCFxEOfD0AfVbmPTbrfhbI7C44lZPbOSkdKGg3Pkx2jNljm2OKxX9QjR5tBmv9kwBAoZ8y+7BjxTz6uCMzNC0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868398; c=relaxed/simple;
	bh=imyQo1VFw3Ndt0WRSKsTyWBo9WQ2vS2H1OtsMCK6fj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ih45euTLOSg0jN7JS4Im+YSWDclRFy6VKsJJ/bW7/2uWzax17S+jJhRpjWpXLxcf7x/k82xz1w+WM0qKAf9FcOSme6hboYF3TiVXbQm3MbJfD2TynyUtFW7JybBv7fITfC+fTZMXpjgIora5Myb4TbpvYFHiwefluA4ZCkNU6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f2b95775so2501381e87.1;
        Fri, 25 Oct 2024 07:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868393; x=1730473193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpTWE9VFta5DLt/rrH5kkLgWbylzFjGFRg1FtfRFRr0=;
        b=QRRDEYy7lJz4sMcDej87x8KCoCmV+P9NQPMjZtyOYffzFq8dIYi0Cl27g+NOiX90hv
         J6HRxMt4BV4ta2njp7O1YBoYL9tfAz8iQpL5iS8ou9CQkWmeDK0csBedGB6rI5KNut15
         Eq/7MnPPnDTDJrP+qk/HwFjUwQYe/QEJOQmgSOWyDFT0G/n6tVRCZ0FL67Mm7ELTOAOS
         eUvjKA9r+2U+G+v/n6GKxE88RXUFioN7rwDITT0lrTrlF/gTUcAKdlbKq0IqSoER3ZDQ
         3P5fYWN7e71P2yfuDEbuiiEBOD/N1i3api4vxOw3jh4xpFyY43qIhUubYCc+R8PHaZ6M
         1dHg==
X-Forwarded-Encrypted: i=1; AJvYcCVClRlbw53DuiUsABIN3fp1RfsRKPaLBMe6co1EsZU53EozAzRmgDiZZOf/jxtZtcOI2ZovSYBafLH5@vger.kernel.org, AJvYcCVd+siFkxtxR9AdHFkVIMswvMZ7RMyaXNBV7bAql+qji2vGeI94Zr16gRjZGmARaic8Bd9HfFYHmbn5NWs=@vger.kernel.org, AJvYcCXYVuTy3hpgOFuZPZDLOQyQnP4qT6Qknfk4e+SgOy0Rkrqnfna5Wdij6knXVeZAWfYqAuWCr8b8umcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/joCe8N97gqqR9ll5TY56y6omDZ3ED8cEbjnZ6MwLiRBt/ghX
	XiNCmunz/l6W8vCtFoCx1d73lLGEoOYSIjKzakMieLviPO2OzBhz68IUHIX2tpU=
X-Google-Smtp-Source: AGHT+IEFpzVl2lUhTmhokiY0CN8fmLu/VnjHsShJP0lV/FkkK4T13Fhw3kG7MBMztQXSbuJCdaHHJw==
X-Received: by 2002:a05:6512:4013:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53b1a315bb0mr9642665e87.4.1729868393111;
        Fri, 25 Oct 2024 07:59:53 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9ecasm211758e87.218.2024.10.25.07.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:59:52 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso30287781fa.2;
        Fri, 25 Oct 2024 07:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWhYriSWuhEdaPsw2j3PiAxlIWv/K4eNsj7d19FcAHG3ot1qeC/IaPeHWjPG2PbBTz425Nmxcg3+4I@vger.kernel.org, AJvYcCXOkSmBMf2Q+DHMPt2byf7SEaCbPtixpYYIGwXNF9LjRQsdDXZOgddtlc/npqCrMDv9l/PclweV4HCa@vger.kernel.org, AJvYcCXR9gn+3VKKMtdBqW3bFwBK642unX53M/HI+tc50Fj7WZ44Bu8Oufvgven9bA6ECOl9mUC6N5McYX5kOH8=@vger.kernel.org
X-Received: by 2002:a2e:b2c7:0:b0:2fb:36df:3b4 with SMTP id
 38308e7fff4ca-2fc9d37ff0emr66846331fa.34.1729868392584; Fri, 25 Oct 2024
 07:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023075917.186835-1-ryan@testtoast.com> <20241023075917.186835-2-ryan@testtoast.com>
 <CAEKpxB=BQ1GvzdVCYKyr_Q1eCfcYYEz1L_RqzEVBBgNu8jDfwA@mail.gmail.com>
In-Reply-To: <CAEKpxB=BQ1GvzdVCYKyr_Q1eCfcYYEz1L_RqzEVBBgNu8jDfwA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:59:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v658LYR_4v0G6dKz7OwD_F=hRCJkiGfqwLzAnkFzCe2Hdw@mail.gmail.com>
Message-ID: <CAGb2v658LYR_4v0G6dKz7OwD_F=hRCJkiGfqwLzAnkFzCe2Hdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation
 settings for audio PLL
To: Code Kipper <codekipper@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chris Morgan <macroalpha82@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 9:20=E2=80=AFPM Code Kipper <codekipper@gmail.com> =
wrote:
>
> On Wed, 23 Oct 2024 at 09:59, Ryan Walklin <ryan@testtoast.com> wrote:
> >
> > Allwinner has previously released a H616 audio driver which also
> > provides sigma-delta modulation for the audio PLL clocks. This approach
> > is used in other Allwinner SoCs, including the H3 and A64.
> >
> > The manual-provided clock values are:
> > PLL_AUDIO(hs) =3D 24 MHz*N/M1
> > PLL_AUDIO(4X) =3D 24 MHz*N/M0/M1/P
> > PLL_AUDIO(2X) =3D 24 MHz*N/M0/M1/P/2
> > PLL_AUDIO(1X) =3D 24 MHz*N/M0/M1/P/4
> >
> > A fixed post-divider of 2 is used to account for a M0 divider of
> > 2, which cannot be modelled by the existing macros and ccu_nm struct.
> >
> > Add SDM to the H616 clock control unit driver.
> >
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> >
> > ---
> > Changelog v1..v2:
> > - Add fixed_post_div to high-speed audio clock to correct M0 value to 1=
 (ie divide by 2) based on manual
> > - Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
> > - Add/correct inline comments for the above.
> > - add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features
> >
> > Changelog v2..v3:
> > - Update comments and commit message to more accurately reflect SDM cha=
nges and rationale
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 46 +++++++++++++++++---------
> >  1 file changed, 30 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 6c7623d4c59ea..05727fa1ee46e 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -215,20 +215,30 @@ static struct ccu_nkmp pll_de_clk =3D {
> >         },
> >  };
> >
> > -/*
> > - * TODO: Determine SDM settings for the audio PLL. The manual suggests
> > - * PLL_FACTOR_N=3D16, PLL_POST_DIV_P=3D2, OUTPUT_DIV=3D2, pattern=3D0x=
e000c49b
> > - * for 24.576 MHz, and PLL_FACTOR_N=3D22, PLL_POST_DIV_P=3D3, OUTPUT_D=
IV=3D2,
> > - * pattern=3D0xe001288c for 22.5792 MHz.
> > - * This clashes with our fixed PLL_POST_DIV_P.
> > +/*
> > + * Sigma-delta modulation settings table obtained from the vendor SDK =
driver.
> > + * There are additional M0 and M1 divider bits not modelled here, so f=
orced to
> > + * fixed values in the probe routine. Sigma-delta modulation allows pr=
oviding a
> > + * fractional-N divider in the PLL, to help reaching those specific
> > + * frequencies with less error.
> >   */
> > +static struct ccu_sdm_setting pll_audio_sdm_table[] =3D {
> > +       { .rate =3D 90316800, .pattern =3D 0xc001288d, .m =3D 3, .n =3D=
 22 },
> > +       { .rate =3D 98304000, .pattern =3D 0xc001eb85, .m =3D 5, .n =3D=
 40 },
> > +};
> > +
> >  #define SUN50I_H616_PLL_AUDIO_REG      0x078
> >  static struct ccu_nm pll_audio_hs_clk =3D {
> >         .enable         =3D BIT(31),
> >         .lock           =3D BIT(28),
> >         .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 12),
> > -       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> > +       .m              =3D _SUNXI_CCU_DIV(16, 6),
> > +       .sdm            =3D _SUNXI_CCU_SDM(pll_audio_sdm_table,
> > +                                        BIT(24), 0x178, BIT(31)),
> > +       .fixed_post_div =3D 2,
> >         .common         =3D {
> > +               .features       =3D CCU_FEATURE_FIXED_POSTDIV |
> > +                                 CCU_FEATURE_SIGMA_DELTA_MOD,
> >                 .reg            =3D 0x078,
> >                 .hw.init        =3D CLK_HW_INIT("pll-audio-hs", "osc24M=
",
> >                                               &ccu_nm_ops,
> > @@ -701,18 +711,20 @@ static const struct clk_hw *clk_parent_pll_audio[=
] =3D {
> >  };
> >
> >  /*
> > - * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22=
579200
> > - * rates can be set exactly in conjunction with sigma-delta modulation=
.
> > + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the man=
ual, with
> > + * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively=
. The 1x
> > + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (=
and
> > + * multiples).
> >   */
> >  static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
> >                             clk_parent_pll_audio,
> > -                           96, 1, CLK_SET_RATE_PARENT);
> > +                           4, 1, CLK_SET_RATE_PARENT);
> >  static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
> >                             clk_parent_pll_audio,
> > -                           48, 1, CLK_SET_RATE_PARENT);
> > +                           2, 1, CLK_SET_RATE_PARENT);
> >  static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
> >                             clk_parent_pll_audio,
> > -                           24, 1, CLK_SET_RATE_PARENT);
> > +                           1, 1, CLK_SET_RATE_PARENT);
> >
> >  static const struct clk_hw *pll_periph0_parents[] =3D {
> >         &pll_periph0_clk.common.hw
> > @@ -1162,12 +1174,14 @@ static int sun50i_h616_ccu_probe(struct platfor=
m_device *pdev)
> >         }
> >
> >         /*
> > -        * Force the post-divider of pll-audio to 12 and the output div=
ider
> > -        * of it to 2, so 24576000 and 22579200 rates can be set exactl=
y.
> > +        * Set the output-divider for the pll-audio clocks (M0) to 2 an=
d the
> > +        * input divider (M1) to 1 as recommended by the manual when us=
ing
> > +        * SDM.
> >          */
> >         val =3D readl(reg + SUN50I_H616_PLL_AUDIO_REG);
> > -       val &=3D ~(GENMASK(21, 16) | BIT(0));
> > -       writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_R=
EG);
> > +       val &=3D ~BIT(1);
> > +       val |=3D BIT(0);
> > +       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> >         /*
> >          * First clock parent (osc32K) is unusable for CEC. But since t=
here
> Hi Ryan,
> I noticed some white-space issues when cherry-picking this change from
> your repo.
> scripts/checkpatch.pl
> 0001-clk-sunxi-ng-h616-Add-sigma-delta-modulation-setting.patch
> ERROR: trailing whitespace
> #51: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:218:
> +/* $
>
> ERROR: trailing whitespace
> #74: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:240:
> +^I^I.features^I=3D CCU_FEATURE_FIXED_POSTDIV | $
>
> ERROR: trailing whitespace
> #85: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:698:
> + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the
> manual, with $
>
> ERROR: trailing whitespace
> #86: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:699:
> + * a final divider of 1. The 2X and 1X clocks use 2 and 4
> respectively. The 1x $
>
> ERROR: trailing whitespace
> #87: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:700:
> + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (an=
d $
>
> ERROR: trailing whitespace
> #112: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:1152:
> +^I * input divider (M1) to 1 as recommended by the manual when using $
>
> ERROR: trailing whitespace
> #113: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:1153:
> +^I * SDM. $
>
> total: 7 errors, 0 warnings, 80 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inpl=
ace.
>
> NOTE: Whitespace errors detected.
>       You may wish to use scripts/cleanpatch or scripts/cleanfile

I fixed up all the whitespace errors when applying.

ChenYu

> but that didn't stop it from singing beautifully!,
>
> Tested-by: Marcus Cooper <codekipper@gmail.com>
> BR,
> CK
> > --
> > 2.47.0
> >
> >
