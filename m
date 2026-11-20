Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160958;
	b=C9dFoDKxeJA3a/2XeQpzAV/5iRXoqqQqdACBIYz9ctqui7xNk7Yf2onvH53NIO7bcaVe
	 TkZCRCwuq0WrKrxmWStaV+gZq29i8ImG8YYZGcb1obL4OMGrlDddK5EX6hwmKaqw0IG4S
	 ElLIUdCwiczgqMz1oYe37PIp2m3Sa3/jQD31GVVJbga1sPefuuqAwEqNrgHlXBx85udxG
	 jFtVz1Fv2/4bMmkU+iSp7GYQc0/G8MKvSCsRwxFItukix2IaeW99t+c+xuPp5mYsHA5BM
	 P9OcNJbS1ndfp+HHq7EZg3FyFfe2TCQWLQ2WEr62J9G1YmDpPqX83W9a/985kC2ax3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160958;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xKnU/TldM314xEN7UqLDGvv/eDTZSOGz68aX0N6/qi4=;
	b=Qr2qGC7VyJ0biOlxgELwOwiTfQMaaAqqfJlf+9KZVJZ/9YOsu3WGeLvFD5c0FGdQn+Qq
	 hkxmsRssCNMunEWVK2YCmJkIfKj18yZk6Lqmf4Zs12AAenx/NVXzDtwS6iH5xLWJwyRdv
	 wZUBbgzKGiwpeAC0FzVhO+4iehdMikJ24pSY0fmMRT2bFg/s42CjJytJwIubhPs7ufSJ7
	 oit21CBHKtcDEqAPqyv5oe0dsC4FIeT9i8jkARWl8+1yS4pU90rIhNbUZaltXRVi1Azca
	 bIKbWM42nYZegL2oOeyOPcmXzzjnfPdShj5GKX10cdCIxcAgU8EMJ6IzgVs/WBXzE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68C606A32C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 07:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A68C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99ac154431bso120647241.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 23:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160957; x=1795765757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKnU/TldM314xEN7UqLDGvv/eDTZSOGz68aX0N6/qi4=;
        b=ngHfSX92CPJ4Vxh0AGjSVIkOJcyl0y6Ct48RQcIK/6sWCcZ5WnJpZ12JqlfX5aJFeU
         ZbvA8gu2sjbm6K1Dw0B0jL7/l0x+rNeug2kaFErgL2Sy8RqvxoI0ptCoj0O+bWwMs9bm
         9+4f/lapm4bKXuU6LBLxMi0XIKodpGoKW3YREMDl7I00d2kmdoYAn26SeRRGSjPxD4iA
         NEW2NzyjkjfBT/+9GpE8lLpeJ/Ft1Z7R+lmL7RmgyNzRdKcRMkMVB5dr+6dc4+Y/EDYU
         vU+DR85xBp/cYMT7Z40d6vkEZc9uQUPmWEvhTApvAkGQprqaaBfHL6k8ThxIwZ0+Pmpl
         j5QQ==
X-Forwarded-Encrypted: i=1; AL+hErG9uObRXN8rpp0LyjblEZ18qMfCHGZc7KB/9o7knST3TxJOiZ/8sJ9bEm4cyVwLLJ9NXIFF1/i9kAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s3w5OStuKMkr0qKjMhrUqBQoAPMtU47I+XDqrPTr/TSTy1Nv4
	OMatMMuelvQtR1V4y/YyLlWjx6Z2d4lb451gK7v53jKMbDRRE+xa8rMtDCT7aQ6U
X-Gm-Gg: AZFdTZf+2pawSfHam61vcOL3x+lEBP2vrlIM5U3fHOMSXuSHwQGipFgWBiWsydWgkLk
	cEO9x0/1mO28dOvb5A37H+GtjMg8HEmyX0Ry7SXb2KZ0ktQAnTlRnQ1QHmTuNU3CdjVrMvv1tV9
	7+dFYk8nWJULVxAcCzVJ2lyRsNU4iZ5ShJzIlDJrww1MOOGxRgQqWv2x8KUqcZQqta5UYz6AnCL
	aAmEnQbGHFP6uDO1t/daOwGSpbxo+KuYp9hBVz4F8W23xXXmS7FPYC6Cae5vCxNiJN0S32XL8kp
	yKmuJRM2XiiLhgWD/sW8weev3/oJW2Sf4GSDk5o7K1VKJR1/Pj2qybGOjKi4lHySGWGFK9qWZ35
	9tgpUOfPZbm2dZh3QM2Ocx8qnwvqFgGUH0Pv33bW7P5OKxB6PN9reJA02Y454m/CV0GShyoxN/q
	V1x7TPGCSwERDPgV7vK73+Wnv8TTzD1Hgs8gsShTyoxUA16QwNsAXQ1GXds8P9yw+MXtajNaypb
	mwgMc3oZxC6QG3zH2jsSnpSdwO5odhO4vjFVFiO2xFnzT3MIKZRuM3qYQZWvIdtgpVAbSOK5ySP
	R3oxD9XW4FPoIwjMemgT2EsL8e22ITQ2JeskQRZ7w5yoKw+6An2t2JeXCDul2eo+seO4
X-Received: by 2002:a05:6102:5049:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d72b36d388mr862762137.5.1795160957251;
        Thu, 19 Nov 2026 23:49:17 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5564a9sm1859092e0c.5.2026.11.19.23.49.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:49:16 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2ee9e7093so171090137.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 23:49:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHhbZeW70b6KwPRBNpLUDebqQnMqeSiXt32Th+QqVOOnW6Ma9+LYPgpJ6ecNTN5zlsGrcvrDjhC6+g=@vger.kernel.org
X-Received: by 2002:a05:6102:6c4:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d7393caab1mr683612137.13.1795160956421; Thu, 19 Nov 2026
 23:49:16 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
 <20261119225017.15a7b5cc@kemnade.info>
In-Reply-To: <20261119225017.15a7b5cc@kemnade.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:49:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
X-Gm-Features: Aa3M54rfGlA3UrmhLbFF7B0m1MfxoFvw1pyboKcP24dUngkkG_fWLkpDdrOnbn8
Message-ID: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrote:
> On Thu, 19 Nov 2026 14:40:38 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > used for power management, so the latter show up as "deviceless" in the
> > consumer column of the clk_summary file in debugfs.
> >
> > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > the consumer device, too.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> >
> > The first change is probably OK.  The second change may fail if anything
> > in the oh->od->pdev->dev chain is not available yet at this point.
>
> Test on OMAP3:

Thanks for testing!

> --- clk-old     2026-11-19 22:44:59.810807920 +0100
> +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> @@ -1,17 +1,17 @@
>                                   enable  prepare  protect                                duty  hardware                            connection
>     clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
>  ---------------------------------------------------------------------------------------------------------------------------------------------
> - oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
> - secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
> -    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      of_clk_get_from_provider
> +    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      dev_clk_get_from_provider
>                                                                                                                deviceless                      no_connection_id
>      gpt12_fck                        0       1        0        32768       0          0     50000      Y      48304000.timer                  fck
>                                                                                                                48304000.target-module          fck
> -                                                                                                              deviceless                      of_clk_get_from_provider
> +                                                                                                              deviceless                      dev_clk_get_from_provider
>                                                                                                                deviceless                      no_connection_id
> - dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
>   mcbsp_clks                          0       5        0        0           0          0     50000      Y   deviceless                      mcbsp_clks
>                                                                                                             deviceless                      mcbsp_clks

Hmm, so the passed device is always NULL, and thus there is no point
in making the change.
Do you know if these come from the first or second change in my patch
(I guess the second)?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
