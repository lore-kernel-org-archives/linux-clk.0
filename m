Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF52DC77F
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533211; cv=none; b=Pwqw3vLcqNlhpS2MF+br+O3nWFT4bJky7lCbX+Ds+9nF3lcZ43Zw7c/7PP6L9TBXQQxCUKy5NBI8E3lToPKli+Ic7+/RPKr0715Upck0vSlCInHUQfs791fbMUmvamXZKgrqX0YBVz7WskSUB/4ZB09cpk1rNOLCKGan3w1Daec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533211; c=relaxed/simple;
	bh=W8Dd4FlEsGFbEKAdC04ppgwIlS4Qx8iLEtMN2s3o6MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4/lYWG9/F92VdxEFb2nWyDVp8xg1Kn/2ac/yhkmSP/+CFTxvaPInpGL2eZiiYjLzHv+rNDnbQ3i/i11X361fIwAaRShth5miRQ4lap/BI4DoipuUWwhdNxQtq1QN9B5PPz2CGEh68krEHSDjzOx5pVECPN4/D1SKsXiS8HSmhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a9076813bso558712e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533209; x=1775138009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naOo6LNAxTqdEVDTz8K5c9QHOQ72iH8wNq/q7MgHwUE=;
        b=Hn7rR2OSFlsXsxD9x3AxOSsN0cVePqRGcl/wYbwrXs+K48nVj+Crkch4I3EWVVy1Mp
         cAOArAmONZoAJO+ObNrxYVRAsu06zIoxa53tEzvKtae4O6tLq6hM1KCzAaTJIMfXvf4L
         xsXbRzi9e0i6QJigP1RHA2ky5rn41VPohA6IEXU5/tCyFQeDNZkXegHFZN2r6JCN0bYC
         5CChpH4UR+8Qp/1ggQVOYbmzhv5DFFoLE5C0BxsgNXkfT2baLvFYx/GBt2WxQoBMHlfa
         MZjUqgI7WiOm15Qdk6sQeP4cQIxeSB8p86p56F6SPC/V5lhCigReVv70znYtVnHGI2Xt
         0r0w==
X-Forwarded-Encrypted: i=1; AJvYcCXTL05U6v1rpM9Z4PC8ODbz0HWsl3zE6kH1nV4Doo7sQK/KVYLkBIphwweDICw+IQQpJZhHiAGeMUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YypyoCVgRNn/97hFdAWX0ySOvsS2QJSLZdDZojyXObb8QmD11B4
	adCM1pATTm7Mv2/OdaSeOBiNZ0jHvvTXxUGNcJOHPpX19c6xzzunBcrUkfry8ftPMQg=
X-Gm-Gg: ATEYQzxRjx9i2HKDYqTmx/lPPlZrLx29TQ5a2V6lqx967xmEbHw1R+Tq3z9XmYsv3ka
	rMqsKXBMDCVvNi7lcVaePlI2WBvyGKeozuxQ7xYHL4hN8hFZu1WhcIhsF32SWig3035hETCGPMG
	ApDDWUZYNTlSRrJ6FHboAYcBlUSk4mZBJkEnp//BPEIBCIWPJgO3KPS4ApT3PJDwiV3iAV7P04x
	cXuHFDzImUN3/Vu/jzeQxgreVWHuUSquCtIURx/XSTwbxP1MTVg+dnk9+l3T4TZviWJU+N9g/Cv
	dqZI66lrBvL5uzSqOC2C2A6Z7nf7agEjiVo4d136VY5YOxLHAWXg1/cfrBJVfx9RCrvHo7od/JA
	gOexsitjFROGnjCWnmGGCphEDOhwXrT1PxDgHRYX3ZWBfSJQxPVE2q7LqtUTOEGkWkp6MJlleYX
	aoKFFv+uB0VVRRL59dhB7IauyDu8XnjBvnbby72K4Etftl4/+OUBbNRImxbzeB
X-Received: by 2002:a05:6122:8c24:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-56d22091c8bmr3558700e0c.13.1774533209446;
        Thu, 26 Mar 2026 06:53:29 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d81edbsm4164521e0c.15.2026.03.26.06.53.28
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:53:29 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-950cd03fb5eso281368241.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiht0Rg9L8JU/xY/k/pHJIuZ140fdjUeyNqJxE61OKg5qYnVlytj7cIW7wWe7dXn8z//PoZ6FCf9w=@vger.kernel.org
X-Received: by 2002:a05:6102:3f51:b0:603:2432:9fe4 with SMTP id
 ada2fe7eead31-603873188dfmr3448093137.27.1774533208645; Thu, 26 Mar 2026
 06:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:53:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe7WWKCgFnb4gEmU9AgOimEsTNkW7h5XzPDHWFrxrgAQ@mail.gmail.com>
X-Gm-Features: AQROBzDJ9v-y5IGqDTpmUqEx_zp1MmiMWDxFz6VTCxNWICBWoGWwBcRnChicpzc
Message-ID: <CAMuHMdXe7WWKCgFnb4gEmU9AgOimEsTNkW7h5XzPDHWFrxrgAQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] clk: renesas: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The clock structure for RZ/G3L is almost identical to that of the RZ/G3S
> SoC with more IP blocks such as LCDC, CRU, LVDS, and GPU.
>
> Add minimal clock and reset entries required to boot the system on Renesas
> RZ/G3L SMARC EVK and bind it with the RZ/G2L CPG core driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
