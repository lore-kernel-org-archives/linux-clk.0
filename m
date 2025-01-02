Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAEF156871;
	Thu,  2 Jan 2025 19:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846260; cv=none; b=BxYCBiwN9vnMGjtv+WsDjwrIXyJ1oZnKx+xUEDK60A+MuGLQQLZRC6Oq0RBwMN/Ij32gyFzCXZ0rzpsP2iIIKFUiTJBYAxGloQF2sWMxX45EcBPVnK7dcjq64Tkv5HTaEVN7Ks3iYsvSzXTfLufUadQQXXYN2lqGN+wyDV/cOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846260; c=relaxed/simple;
	bh=iECDB/dFrSZaWEt58rUqcji02OV6HptYObIh7I+dBVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldpnKP7OvRlB8Xu0Seko/TiLapr+HJu4LUrYNQ1KAgbRtK1lbSDR0O8tnnQQNQc0tjCeBTZX1aKXXlXNV2PTBDuF0Xdm6HcSMizkMp9fjjObE9tDhLFdQWx3wLmLtLdkzHn69C+30ga17klByr0igpDtZWi6LWM+jsSofVgTzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5161d5b8650so3511588e0c.3;
        Thu, 02 Jan 2025 11:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846254; x=1736451054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4H6UDEVI47G82chzxwybcsE9lJCkY1PdBcOb/KEZExw=;
        b=QsbXieckEIKKyGVAxppiYA+efGniC+LUXhjeqzFOU0qQTIsHlXJU/wSfxP4JnlwV1A
         gStBE/d9CEGElCPnR+kuKoDC0PfdGafzR+junlGF1p48IPEe5xUOek+7lZvhiYoNI88n
         P22pDBLwToJZe36YiLIFRJPenH46pY69saTln1Bq5iAdbz/dOlLgaQcuzghvYzO3A8at
         /3JujnrlMBmybhFQt6kRJRl+54Dw3nqrmPDVTU81VAHbKXTncilKGFOztMChT8GMK2GK
         q/hxUanOcSujBlbb3qmHf8STxn6woNq2zb4v4tgGJb4bqvn13RIwRpufBk9/C7MpBFEC
         kvBg==
X-Forwarded-Encrypted: i=1; AJvYcCW2tDVeWICYbflzrj97xOdRrwsVVF5ytIrLSD5TS7a/LEVyp9kAiZQH/w9B8s7+EsqvPfdRsCANAzEhutzR@vger.kernel.org, AJvYcCWgVqZrIfVtwdEOaZYDGuVZYj6kpwSsjI9IMNgItDEXEGQHV2hsoXae8DDAbRGaVAY8ThIm55DF6DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyidPY9Aiv+0Th8i5/TLAIs0hop2ErWiy6eTg5W7X/9FQXUMLd0
	PPVH2mtbfJrkp7aaod5keI7S71kzqIAE011e8AD6IwbLTY0O6bRFDwqd83WM
X-Gm-Gg: ASbGnctAmE54GJxy4tTr7xbK5BS9Uymllm2p246pItP/QJOCY5tjJcfXv1YuJ53WqPr
	yuJ1F+Y2W+gumRZZ4MUstD7OMidg2L8BIUfEnAb7/pKNcgPUbZIUz8yjjPKK5hj8OZas2VE4vR1
	CxasolpIXE82Tv15jV2sD4wOT+RFaJ44HjB/1yz3M0T8gWC8/ZtBemV30d+iVTorR6cc/PKtHLL
	PZFHEaL7O91FPa9wYF3TwuiLpH66zKg7WTNiO3fK1QcJnIxDDcY3An5qtHoV01DGCJ3Pfab5XnJ
	X6e6//VZeg7lSeVHBeM=
X-Google-Smtp-Source: AGHT+IEY2PahXgja7Mue93GQFV38ewR3wldaaWuohZFf8nTVMrV4eyh28vlmxCKpY4xP87Su8OGcNA==
X-Received: by 2002:a05:6122:240a:b0:515:4fab:28c6 with SMTP id 71dfb90a1353d-51b75c5985amr35015379e0c.4.1735846253919;
        Thu, 02 Jan 2025 11:30:53 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cd968bsm2982773e0c.42.2025.01.02.11.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 11:30:53 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afeb79b52fso3210280137.0;
        Thu, 02 Jan 2025 11:30:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/lT4GOFKQi0UQMHHIcqTTMGZ2siGL7osNHYi+n31ouX8kSsmzLmVzjeP9vnzrKzBIh+bKMPWwGGY=@vger.kernel.org, AJvYcCWqFh4FQBg8PErahdikoTtOcpW3PYUFfi/OXNe0yNOOMHyGXmVEuOEZm8s93HgMuuRDMlcNKPtY+2EKBhCv@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:4b2:cc94:187a with SMTP id
 ada2fe7eead31-4b2cc941dc5mr37385276137.1.1735846253100; Thu, 02 Jan 2025
 11:30:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102170359.761670-1-rohit.visavalia@amd.com> <20250102170359.761670-4-rohit.visavalia@amd.com>
In-Reply-To: <20250102170359.761670-4-rohit.visavalia@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 20:30:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxOg3Yh1JxsJuga_qz=98kp5kv8JGg_yk0=HiKop8o5Q@mail.gmail.com>
Message-ID: <CAMuHMdVxOg3Yh1JxsJuga_qz=98kp5kv8JGg_yk0=HiKop8o5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: xilinx: vcu: Update vcu init/reset sequence
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, michal.simek@amd.com, 
	vishal.sagar@amd.com, javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, 
	u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rohit,

On Thu, Jan 2, 2025 at 6:04=E2=80=AFPM Rohit Visavalia <rohit.visavalia@amd=
.com> wrote:
> Updated vcu init/reset sequence as per design changes.
> If VCU reset GPIO is available then do assert and de-assert it before
> enabling/disabling gasket isolation.
> This GPIO is added because gasket isolation will be removed during startu=
p
> that requires access to SLCR register space. Post startup, the ownership =
of
> the register interface lies with logiCORE IP.
>
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
> Changes in v2:
>   - Changed patches sequence to have patches with "Fixes" as preceding in=
 order
>   - Used dev_err_probe()
>   - Moved warning to dev_dbg() and updated print with more detail

Thanks for the update!

> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
>          * Bit 0 : Gasket isolation
>          * Bit 1 : put VCU out of reset
>          */
> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset",
> +                                                  GPIOD_OUT_LOW);

This requires updating the DT bindings _first_.

> +       if (IS_ERR(xvcu->reset_gpio)) {
> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> +               dev_err_probe(&pdev->dev, ret, "failed to get reset gpio =
for vcu.\n");
> +               goto error_get_gpio;
> +       }
> +
> +       if (xvcu->reset_gpio) {
> +               gpiod_set_value(xvcu->reset_gpio, 0);
> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 33.3=
3KHz */
> +               usleep_range(60, 120);
> +               gpiod_set_value(xvcu->reset_gpio, 1);
> +               usleep_range(60, 120);
> +       } else {
> +               dev_dbg(&pdev->dev, "No reset gpio info found in dts for =
VCU. This may result in incorrect functionality if VCU isolation is removed=
 after initialization in designs where the VCU reset is driven by gpio.\n")=
;
> +       }
> +
>         regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_V=
ALUE);
>
>         ret =3D xvcu_register_clock_provider(xvcu);

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
