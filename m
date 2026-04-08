Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99C3B19CC
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641302; cv=none; b=Nn+FcSBQmunibANgl1izhG9XCw45i49tSEWRaeHgXwZBKJU4ZDnxhhYSrQxG0Vja2vy0UV4EYdnNwUG5p6xdcelDfjjh9+tWkr02LsD6Q9JyPa0Dt6V7zhSp/zVWT5LKrOU84odEDhXma1RPZus5yxuPaymlc+vEOgkKHV+GOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641302; c=relaxed/simple;
	bh=O0dPKIPUwqcZQdDhmwfagNKRPoro50YwQ5jiiYuAkY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW6k46rJO3exnTOBR1pcbqjEEsv3ktjoO6vHZuWVZTD88nOt+/agJZiTtzMvxp8fFesz5xyAelLZos7bvK2zmeLyqfGLYUAxU2gv9N2wQEKKAiLM4NRYhSTg+baLoAs0BquLCEGzra9LbwqVnMOYo0A/MmBDnfmEAb/gvAwd47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso4687247e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 02:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641297; x=1776246097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quvvcejYXNcTSghIu/ABG/aBBVzSmRl0OrHbMTAKiNc=;
        b=q8gm/I+pdEuGCd6MfMPHmpvy+kAssC7eeZu/krQ2GVpldxKbpl3meoSj6/lz0zfanj
         d9vrMAHVcrb6lPUL+f8Y8ZKSYuJdTg1YMnILUbFdLRrrzXHH4vXglOW2A1Kp1/hzkW1G
         MJ8D24s0KekhpyrZVdzEaacUHeRQu861LnoqzzJp5501+hqH/OvRX0scKdnXvawUBXZ6
         8/9nGxAlH/DZnAsDDefz+sLrabvZhOziXntllQmVewbutnj/FXRvlYV4FpgnQCJToY5J
         WP0IKtpcPy6vakoRWDthKFMHfm1cjiaKkwPR5387q/6wpmsQidS44EUwibcv2OMno3q3
         sVAA==
X-Forwarded-Encrypted: i=1; AJvYcCWtSa4z3EVbDJPm99/cj3a/paF5kSuO31rx2OgyZKM3BYhucc/fWSpJfNsWW42Y0Np1SrlianRFj6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxldc0Wr7oEebTz0snLPJzzOCYtMVP9SBF126Q187DmpUqBQf6a
	KGpcJ78mGGzDpkizwoXFvwxITiw41GIkO6mWdiRGK2rZQUIrAIv/qkHDL+bpPz8N
X-Gm-Gg: AeBDiesW2hor6g1fDCq7ob2Btg79FpqFzUE1U5yC7MegHvtg3zq0ThNvYLaXkU91xJq
	zs3KXYFM3sngy0DvKf64NqcYEU8didJUj4pUh7kxg4w1g9UNYdc1yDtYZVO6D9wpASSljwG9vrG
	wtHCMRbJT1bmf5q+B3WzShqfD0x7Xcl1GYc6pUUBJ9wejRheTqdlp+aaIkujckcaM43lWxEfy4V
	gkUBnTYGSuKUqfQ5Q4TzIXDH1X1435viipnWbAkkC46bNhI+DS/ZA3hMmtPhjWm0/fdpIgV5jvg
	VGJrDPIE4X29m3Ud1ttoG+nHIT9YkQgVAsy0Zu7+018DJIv3xXJ+sdYdNtZdXNGiX8kTZNpYoKt
	B1ldOlTVxL0uvVvds0+zlgDbwODpbHsZvSbdkF9bCUCQm8irJIapWEzu3PRytwkF2QGUpM7wxno
	nHwYv8h8qztdr8X6NXXNtuT73Nebf3m8/5phScEXTlA6bZ2ZPLGSUXjOvJMEOc7I64
X-Received: by 2002:a05:6122:3b84:b0:56e:eb08:21ca with SMTP id 71dfb90a1353d-56eeb082629mr5429777e0c.7.1775641296786;
        Wed, 08 Apr 2026 02:41:36 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm19722482e0c.4.2026.04.08.02.41.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:41:36 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso4168620e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 02:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEOqFlf31YKG05TgZL7jp9f9+f4B2SJ01ED3BUe8KEk+Wvx38NV/KEeHL10f9NdTJ54aglp2w7qP0=@vger.kernel.org
X-Received: by 2002:a05:6122:a5c9:10b0:56e:e9cf:7134 with SMTP id
 71dfb90a1353d-56ee9cfa0fbmr3844058e0c.3.1775641295235; Wed, 08 Apr 2026
 02:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com> <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:41:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
X-Gm-Features: AQROBzD3bL2aOOG6EzT_imFnbWnAbXmWWZH1UF0TeTlDTbev2ZgK_ZCcpyzlvIk
Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 2 Apr 2026 at 11:10, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts

> @@ -280,6 +358,42 @@ &sdhi1 {
>         vqmmc-supply = <&vqmmc_sd1_pvdd>;
>  };
>
> +&snd_rzg3e {

Please preserve sort order (alphabetical, by label).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
