Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0786CA4B;
	Tue, 31 Dec 2024 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735655184; cv=none; b=k63KrpXhpaZEdF0RHx2xehn89kRH/9kOUoD9mVfuibQGr9Cd5leChoM5tvMbEUPHJD83N5iqaDUyrXrNCJUv6+pdO4Xs/PVGeczwvXOotlatXkOklvXD6CxdpfFmYR9303xwHHJsiI8Kwq4JAqtJ9SPCW6edrWrK3QV3E0KWVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735655184; c=relaxed/simple;
	bh=T5ttWLj21ZemjHsfaaTlAwMCQD/0dHhbmm9mhFxso+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV1scukAVpJJ/EClH9gNzaExyx5REonzu6xvtkA0QzaUWc0rTqnCYmUvIQVLw3Mm88Ujzu4CzPwf3AJBAArohSUBPEfx86yqbjA3zw9OUvpwVM5JEkt7Q9phVWZ6EkSTce7A2YRho7CjqzYKxrtztzr0FJYO1US+MyVNvfrFdvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afeb79b52fso2743471137.0;
        Tue, 31 Dec 2024 06:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735655180; x=1736259980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXXm7jXSyAHpmGAH3x9taDLedDu+p3wnULbeaYvIinw=;
        b=AFZb8FN0Jxsqxos7B0XgX/g9Bb1LUevjA/NdBtuXNs02es1mXKzkf6oHkcxrUHcB0h
         Xft5FcR6UniiwjbCxP0sYpeL69SDLM2BGqBp1WYXuvsYODW2FF5Nm5PZ+jUGij4aYpD4
         2FSZt0lM1Oir3uOMEGPZB+273/+bXxFSlnNN5zXQI2D7ZRXHCKAN1HhlIy54lay+bJ/8
         IZP0EWl5/Nnb8o1KOOLxuoUSAGOyu6Iy6nO/0+43y3ngPr8GYpLN9enKoormnddM3ba5
         2PdiP8BxuYJcllMclKB2RwmgGXh29rFf00pA/HbWiSJjkG14feXggPJyenwMaU4pyAV1
         ZC1w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8/K3aAVBxrASsPRuxYH5lAukn8yUy325nqU/05ansvdMZNQnBOteR8fyDBc9vY6dBHeXU98BPn8=@vger.kernel.org, AJvYcCWksOnEC3tzNSSLBvm5dSpEIvrQW1mkSHIx0X9qUpbWCo4aMAPbz6L9rSKXcILEXEQBlaWffFABwl+ZWYjk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx13MRUTddFM7i7gK6gtVqjB6UXmZZabDtalIRiaCqCb6FnPtcP
	a2ldQNRc/hYGp222sIoRm0VS2/QCV3y8RxCgv0SkbWOqfEGwwrYrbNSXsKUA
X-Gm-Gg: ASbGncsn4k2m68fuU/wdcgI/2v9yUx0IKIkjvjR3aKb/OAyo6aQMpaWJTn901PfK8GJ
	yfnAAgbHPLxPPykrS9BSCdr8ZhMm1waXCyckCK7Mb49i2Xt1SWBeZiqZgN5tLW0EW88MVqnchCa
	adEFWBLXTuNiHOIWUTbZIclHDesNewUwsTlO1Df+TXwfURZNO1OxgKYXsi54n7eS0oG82Se1ehk
	gfLfzL0YrHFYIr3yc8OO7QyRdvt+iWB6vmNkqf6xgm5sGAVEwgRMeaGjatN66z3npuCTMPX0knv
	uhArWOiHIyASRL+M/1A=
X-Google-Smtp-Source: AGHT+IEL1RazsK9JsQMAQWjTJlYY/jkcFHmAu+f/nA4hMBhLstBNwQd4syZGorrKUHo7CpP4J10OVg==
X-Received: by 2002:a05:6102:3ca5:b0:4af:5f65:4fd3 with SMTP id ada2fe7eead31-4b2cc31a04bmr30393720137.6.1735655180022;
        Tue, 31 Dec 2024 06:26:20 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad5a3fesm4407464241.33.2024.12.31.06.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 06:26:19 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afeb79b52fso2743456137.0;
        Tue, 31 Dec 2024 06:26:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPab7GSsnpfkHfLolOoHLdyBqrqsUC4lH3AR0Ne+5E651yIH0YvYP2pN3LoVlMErvNfjQT4sHtjgM5wmWw@vger.kernel.org, AJvYcCWUlaxnackm1XZnWxJEN82a2q/9denzBEKuT3hmhigiBmublRA1iY/pCyjsrLHsGGcPHVjeVasQyPI=@vger.kernel.org
X-Received: by 2002:a05:6102:38ce:b0:4af:f6e5:2b46 with SMTP id
 ada2fe7eead31-4b2cc359cebmr27414041137.9.1735655179221; Tue, 31 Dec 2024
 06:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com> <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
 <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Dec 2024 15:26:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
Message-ID: <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
To: "Visavalia, Rohit" <rohit.visavalia@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal" <vishal.sagar@amd.com>, 
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rohit,

On Tue, Dec 31, 2024 at 3:16=E2=80=AFPM Visavalia, Rohit
<rohit.visavalia@amd.com> wrote:
> >Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequenc=
e
> >Quoting Rohit Visavalia (2024-12-26 04:20:21)
> >> diff --git a/drivers/clk/xilinx/xlnx_vcu.c
> >> b/drivers/clk/xilinx/xlnx_vcu.c index 81501b48412e..f294a2398cb4
> >> 100644
> >> --- a/drivers/clk/xilinx/xlnx_vcu.c
> >> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> >> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pde=
v)
> >>          * Bit 0 : Gasket isolation
> >>          * Bit 1 : put VCU out of reset
> >>          */
> >> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "rese=
t",
> >> +                                                  GPIOD_OUT_LOW);
> >> +       if (IS_ERR(xvcu->reset_gpio)) {
> >> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> >> +               dev_err(&pdev->dev, "failed to get reset gpio for
> >> + vcu.\n");
> >
> >Use dev_err_probe() and friends.
> I will take care in v2 patch series.
>
> >
> >> +               goto error_get_gpio;
> >> +       }
> >> +
> >> +       if (xvcu->reset_gpio) {
> >> +               gpiod_set_value(xvcu->reset_gpio, 0);
> >> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 3=
3.33KHz */
> >> +               usleep_range(60, 120);
> >> +               gpiod_set_value(xvcu->reset_gpio, 1);
> >> +               usleep_range(60, 120);
> >> +       } else {
> >> +               dev_warn(&pdev->dev, "No reset gpio info from dts for
> >> + vcu. This may lead to incorrect functionality if VCU isolation is
> >> + removed post initialization.\n");
> >
> >Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an unfi=
xable warning
> >message if the reset isn't there. Why have this warning at all?
> I will use 'VCU' in next(v2) patch series.
> Added warning just to inform user that if design has the reset gpio and i=
t is missing in dt node then it could lead to issue.

If it could lead to issues, shouldn't the reset GPIO be required instead of
optional?

Regardless, the reset GPIO should be documented in the DT bindings.
And perhaps marked required, so "make dtbs_check" will flag it when
it's missing?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
