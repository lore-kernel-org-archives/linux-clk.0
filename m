Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99B3112B4
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369050; cv=none; b=m220ta5NbxBPNW/Ih7uLGw6ZMjEg2W0IRUQfsY7HHfnRHgDNFZKprS9DBmsMFcsw808zGXqpmCRRIpzebRf5Hl38X1YVq73llH4xLUgyQzR2YTjTqAjcBRt3Erl9XXvyA3soYk/1OjKOrQObQaCED1VTerCVgrlDxZJa90Fn7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369050; c=relaxed/simple;
	bh=DENqB/OcotsKyuHcXI2b7+iyagtKWeW19rqjF9NIRV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiI8Rkour1U4NHQx0W5lpAD6VPTWbzoCzfLk0t8zvRZspmlSiiromHKqBMSxX+nCuXMx+zzl3S5umisfCa/PRYihSxa6cjie9/5CV5qZ35BzWo418/ZVFfm3a1dPeTLsrktad0jMZ1UDs7rIkmIMDZ69kt1b09O+FhlSHUJ7Ibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bc2d1feb2so1095375e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 08:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369046; x=1760973846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsy0eDfhPBdpuoZPurTAe13rVL2skD/L1Ou2tlGLMy8=;
        b=vi5kFiJ86HvwPEmG66QK/J+LoErL1IgHO1L71efIywYcEx2dmbdSvC5al4c+64Z4+J
         3b7z2/nJzF/Sv5JMp7GyH138zhyLFsHRKGAhVDvyMpW+jOkZE4qW4sRTqah7ZpxosuM8
         thyUdYHyWAhbizSnC9nX5kXj1n4F61UKAm+LaXYJib6TSTI31kjQpuHMU2+34LIPHUj0
         AkQSi0JjMgisjNc02GiO2hASZwQHdjKIUMPxEGbRhC6yu7v/RftIsusNMHBqKJeOtvIq
         YkNg6oX69+bz+onI5LgK195sA0ikZrwCVofsm+N3CnzDLVGLVzfQmSkojFU7l+xNwmgq
         VA8g==
X-Forwarded-Encrypted: i=1; AJvYcCXtbFCPxvBICCekYaas0OdsJo0TFscb2AvJGGbsqDiQlgp1cMFwIYeWpzWoWYjaQZNo4euoVH+1rn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycHYr1zgyoQGxSIO0TUOxYlQO2Zl4ZXhenk8C/RGSvca+wgEzK
	iiS8Rix0aQdK/woKXErtPY4bQnfMP4gODEH+OkiIOrx1YSq3feBVSKRrf43o18fn
X-Gm-Gg: ASbGncv+1eqPKD2IJt4nAp9+XeGtMtJxkaYjBWY8EARmKd3j0P1Lv6w0yaINMUuoHZs
	wXbHq36/F3txaK5hXfq741tUPfjPYyNk3sAlsexbvt5T3ZvHPFJwXACrU03U/ruJwZhlOMTF0Ad
	gBcQZzVnKyR5rIqPN0/rlZw1/aVUqHS7LfdiWq4s3wWrbE8BBxI26xFmHc/9sxgsj+RCSh1OboY
	KDVRNnrtQ2NIAizIVTWrWuexx9o/aVjjZVgA5TdfW3ZP+MYX2Nk0Oq0CdJOG65fVbcbVAICXvDk
	9vxg7rEiEJ+Ggkkn3pgDUZg7F+g2AolEo5zwEvigyPr+yeEn9p0uzngfrF/b9LnW/MQxXhlHazI
	PGCok+ze5HS0TMigcWU+9dQVgIrcpdKFZZ/3xHN2xXw1D/UVtCFH6MCBl3uJwdOqDQKXN3ndBQ1
	VerSw=
X-Google-Smtp-Source: AGHT+IH6A/z6rYdXZGM7Y9SS3aIm3RcBWjszgfXRK4TQfUaxwpt4Ay67OB4sJxj407FaSjc8//QrYA==
X-Received: by 2002:a05:6122:31a7:b0:54b:c83b:9299 with SMTP id 71dfb90a1353d-554b8b93859mr7186489e0c.10.1760369046514;
        Mon, 13 Oct 2025 08:24:06 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80ddf8asm3181313e0c.21.2025.10.13.08.24.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:24:06 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso2213881137.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 08:24:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbsQD5BkIGB8S+EzE2oCSopThHCUwwMsJJAlQ0lo/X97UhA9kIoYotuxjtxenFn0sswQmTE8Ujqv0=@vger.kernel.org
X-Received: by 2002:a05:6102:5987:b0:52a:1ff2:da15 with SMTP id
 ada2fe7eead31-5d5e22a274cmr6461301137.15.1760369045394; Mon, 13 Oct 2025
 08:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
In-Reply-To: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 17:23:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYsHFi3LSLLPtTZ8xrZsLsXUMG693C3KE=wShhObnkCQ@mail.gmail.com>
X-Gm-Features: AS18NWA9Hs19mkJEa6IfJo5fXRfqr6oSpD-LjSgVL2758b3dOA-smMQy-fpnLbQ
Message-ID: <CAMuHMdXYsHFi3LSLLPtTZ8xrZsLsXUMG693C3KE=wShhObnkCQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for ISP
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	fabrizio.castro.jz@renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 10 Oct 2025 at 11:43, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add entries detailing the clocks and resets for the ISP in the
> RZ/V2H(P) SoC.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> - Dropped the dt-bindings patches since the macros weren't needed
> - Squashed the separate patches adding clock and reset definitions
>   into a single patch
> - Link to v1: https://lore.kernel.org/r/20250506121252.557170-1-dan.scally@ideasonboard.com

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19, with the below fixed...

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -64,6 +64,7 @@ enum clk_ids {
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
>         CLK_PLLGPU_GEAR,
> +       CLK_PLLVDO_ISP,

... moving up, with the other CLK_PLLVDO_* entries...

>
>         /* Module Clocks */
>         MOD_CLK_BASE,
> @@ -170,6 +171,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
>
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
> +       DEF_DDIV(".pllvdo_isp", CLK_PLLVDO_ISP, CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),

... moving up, with the other CLK_PLLVDO_* entries.

>
>         /* Core Clocks */
>         DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
