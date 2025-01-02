Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4B16C687;
	Thu,  2 Jan 2025 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735811941; cv=none; b=Ffve/cqsXljJQmQkxXz8rXNm2VLj7TjAIG1t7OAc86iCmp4/OnAIU7XjUFtZ6YaMehw2Yg2JecOGGupR8tQmBsDict0i16VSIevPf1o0KRb6amksoRkJaQXygp6Booqwfy8LOkwJxxAGa4l+PzxkrGxUg5aYCkS+jefueAuPlA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735811941; c=relaxed/simple;
	bh=f7aHM4DBWfV0TXPyQzINcTvKkEF4UiDfFvReL9gfbQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU1+HX40a8+45ebzL/nfcFtYRj7vEZPcZDKCHBY4+r2SSgwRqbj9rl0YW5amgbQJODvyLIB1yLoQt6bArEbpfzrRCyfYD/ZqQWIf4GBdDh7n/FtyjljlKTU15cT0a1kTwuTi43ZWQPg8EQk7vpOWY5jO1zpY9Rvi9IHqMD51KyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51ba75ee2f3so2559806e0c.2;
        Thu, 02 Jan 2025 01:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735811938; x=1736416738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvCmEDFsLCS686ApolvvcDeZQP817WRSTP0JOnjQ3eQ=;
        b=wIrY+SE4Bwvsb8+e6iWm4IudFiHPyFHImSnLVpsEQIk6v28DTRI/xidvB1TLx8Wq+B
         alV1ZdpidOmYNKGjPlWdsQ5yiykaGws/UI2X6WRGS//ifr2E8XrboR2xrMCQJP/XcwJe
         2OFN28NlWuZveUcaRn0CAOEvj/tswHmWZrMgeF7kubsDfLmpcbrR3l0SK4WEMm7dVX4O
         pGFa0f3VKzggouj+rMm02MdNGeYv0kf6kLsJgYzPRnISOLZrJ4jB26sEboejeN8DiXke
         apaa57AJPVpXWcM4RWFR+1GskMSgkCzH6bNdiBNcFoetTbev/tg8alOMKfYB1X9an1ia
         VVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7FBiSYzOg3du11/Jh2bIMtCW71fI41HG0cT7ixOBFgp7b2gQucM8VHZk6r2q/j3YqljdE+lUWJ+o=@vger.kernel.org, AJvYcCWENVZAAkLS7K+G0SyMitbIwPB+r1LGP6ZMse6PS0hxSBRHIdutKTRkYtcrDlyI6AVn7vgVGg1XHllQEFNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+rrw387L8/+qF5sO9LhJjS/kuJWUw5vWKY6mT0ZfG9J6c7Egq
	G82mDmSuHxNJ22JKEh68HKTMEOIgpa9X1UUgu03Op7qg0gG73JCOqYKJkWgh
X-Gm-Gg: ASbGncv4zuG3iqvwJD2Hg758JcT+5ykzsgJyRRFkpeCxkZSMckcP5YhCRGcJ511BnOi
	Tkfms5ULeCRQnk3Fa7u4dXm2oxbmHQ1w5GhSDXv+9SmSGwH/VG6+6j707kxpSVv8brPzRpuE5N7
	CGZs4WdUXomEotGrVqInD3EesYhADARh9cPVphP6b8NByYgsKcx/0nBtH1hw9/8Ju/ky1W34Ua0
	x4iJbjuPZbHJWz/LyvhkW5aG5T/AZFP1/cuKyYc0knguT7f5KHEIzE+b5+FQOUc8P5g4DGO++cD
	8ORUk9DOl2rJChJAAg4=
X-Google-Smtp-Source: AGHT+IE2KtwRObF/CDEhO+IiEcJdZ0lFbQX9awzVJXfBn7q28q440LP4iwFR/KSFqxz4W4Qhm52n4Q==
X-Received: by 2002:a05:6122:8c8:b0:514:eeba:517 with SMTP id 71dfb90a1353d-51b75d6d218mr31430737e0c.10.1735811937692;
        Thu, 02 Jan 2025 01:58:57 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bbc759sm2977540e0c.21.2025.01.02.01.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:58:57 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso3132961137.3;
        Thu, 02 Jan 2025 01:58:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAruibyetQGiLEgWOEOgL3DMWa9SXUTHu/rozgG0AGXn6thyjYOz9fRqm5FaUnd+wg9kwbu1PAy3g=@vger.kernel.org, AJvYcCVhkdsiv3CK8DcFkOShgt1vtYL3ZQc4+HrrSJjZVL86MGb+eGIpszGa4WwpYRC1uDlVj13EpKnbdeS/z77r@vger.kernel.org
X-Received: by 2002:a05:6102:809a:b0:4af:f1fb:1c36 with SMTP id
 ada2fe7eead31-4b2cc358579mr37457483137.8.1735811937194; Thu, 02 Jan 2025
 01:58:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com> <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
 <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
 <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com> <CH2PR12MB487534FB01A540F33ECF96E4E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB487534FB01A540F33ECF96E4E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 10:58:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZn0FLGXdGhQ-YYksewm8sJK8J5N=_-DQnE1a_xz41yw@mail.gmail.com>
Message-ID: <CAMuHMdWZn0FLGXdGhQ-YYksewm8sJK8J5N=_-DQnE1a_xz41yw@mail.gmail.com>
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

On Thu, Jan 2, 2025 at 8:01=E2=80=AFAM Visavalia, Rohit <rohit.visavalia@am=
d.com> wrote:
> >From: Geert Uytterhoeven <geert@linux-m68k.org>
> >On Tue, Dec 31, 2024 at 3:16=E2=80=AFPM Visavalia, Rohit <rohit.visavali=
a@amd.com>
> >wrote:
> >> >Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset
> >> >sequence Quoting Rohit Visavalia (2024-12-26 04:20:21)
> >> >> diff --git a/drivers/clk/xilinx/xlnx_vcu.c
> >> >> b/drivers/clk/xilinx/xlnx_vcu.c index 81501b48412e..f294a2398cb4
> >> >> 100644
> >> >> --- a/drivers/clk/xilinx/xlnx_vcu.c
> >> >> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> >> >> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *=
pdev)
> >> >>          * Bit 0 : Gasket isolation
> >> >>          * Bit 1 : put VCU out of reset
> >> >>          */
> >> >> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "r=
eset",
> >> >> +                                                  GPIOD_OUT_LOW);
> >> >> +       if (IS_ERR(xvcu->reset_gpio)) {
> >> >> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> >> >> +               dev_err(&pdev->dev, "failed to get reset gpio for
> >> >> + vcu.\n");
> >> >
> >> >Use dev_err_probe() and friends.
> >> I will take care in v2 patch series.
> >>
> >> >
> >> >> +               goto error_get_gpio;
> >> >> +       }
> >> >> +
> >> >> +       if (xvcu->reset_gpio) {
> >> >> +               gpiod_set_value(xvcu->reset_gpio, 0);
> >> >> +               /* min 2 clock cycle of vcu pll_ref, slowest freq i=
s 33.33KHz */
> >> >> +               usleep_range(60, 120);
> >> >> +               gpiod_set_value(xvcu->reset_gpio, 1);
> >> >> +               usleep_range(60, 120);
> >> >> +       } else {
> >> >> +               dev_warn(&pdev->dev, "No reset gpio info from dts
> >> >> + for vcu. This may lead to incorrect functionality if VCU
> >> >> + isolation is removed post initialization.\n");
> >> >
> >> >Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an
> >> >unfixable warning message if the reset isn't there. Why have this war=
ning at all?
> >>
> >> I will use 'VCU' in next(v2) patch series.
> >>
> >> Added warning just to inform user that if design has the reset gpio an=
d it is
> >
> >missing in dt node then it could lead to issue.
> >
> >If it could lead to issues, shouldn't the reset GPIO be required instead=
 of optional?
>
> It is marked as optional as few of the Zynqmp designs are having vcu_rese=
t(reset pin of VCU IP) is driven by proc_sys_reset. proc_sys_reset is anoth=
er PL IP driven by the PS pl_reset.  So here the VCU reset is not driven by=
 axi_gpio or PS gpio so there will be no gpio entry.

OK, then optional is fine.

> >Regardless, the reset GPIO should be documented in the DT bindings.
>
> Yes, I will be sending patch for the same.
>
> >And perhaps marked required, so "make dtbs_check" will flag it when it's=
 missing?
> I believe rephrasing the warning to "No reset gpio info found in dts for =
VCU. This may result in incorrect functionality if VCU isolation is removed=
 after initialization in designs where the VCU reset is driven by gpio." wo=
uld make it clearer. Let me know your thoughts.

If the reset is optional on some systems and required on other systems,
there should not be a warning, IMHO, unless the driver can detect by
some other means when the reset is actually required.

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
