Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D9379EDA
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159399; cv=none; b=VEXc/5RVYrXLQU4p15l0iApAB4yhzlsQMAL8a5k65I7h+MlHpa5iTSoYdIisRUC26d3dV2Reyy3TYKhRfqeb+hYuSPneYfpn8SzgV8du4w+h7aZlGO5vIPKXD5fCsK6khRt1d2UQjm0yT/4RZTsKJSPpHFLfIctLxSHVPMCQYYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159399; c=relaxed/simple;
	bh=Areegk53H6/XbQwws7oOwPR0aURFGvMPYh3hgBswYzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5rM/ucWsy0HOdf04i5Acwqr9MkYWWofcrFdWH6+87xNWYRyPVDYwUXbdA2ZGLa8N/r69AjikzEGoBjDW4xWiofyijtpntudr5fr2hj9CbZ78hKQjsgpUX64HyA6i+ugmx82H7zdWpznCnFfgYzE6bEXV7arec2Qj8ZISQSSihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f6afbd205so489171e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 06:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159397; x=1778764197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPy2YmNGhR0rtoHJZwlFv0JUOZnh2OU1p9YLs4YHLbg=;
        b=gt2a1pF3drLfWs8a9XIXI2x/6UxPHnpvT8X+phL7WTO2OVmu2sudQ4lviCUfBfUSz5
         Fwo3A3vwdiroKoVsV1g/l7In2Las59l4PnCOnwGh4ODztGnO5G02G9iaCOGcpWbZ//wf
         4cK24/Ai470yqpdYak2dKZdhfsAIq65c25s2bGBbhl9XDSn9dxIbY0GE7863WgdKJnE/
         WH+UbsMcwfYnhL5x/JuSzN9BxWk5CFluYTuxn2DUP5D7KQEx8qfYd3K9zC081ftGCQEs
         oPW/GnsqatbQXiVS7YmWO+C7BG6OtRnz4ZL8y13QHYDGzM8CfqOltvMmHhEGay1FI0UD
         MBvg==
X-Forwarded-Encrypted: i=1; AFNElJ9GbAQutiE268dkHEyK2KnXBMZMU3r8WpUoJrJ7pbAMispWI0io0+a1ZUM2AL9I00GHFA0r0AglAW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxibiiAHV8rH2BHpcBt4G/J2Bx9GLS95E9V6kRpofYcP2k6YxjC
	R6QxUxMDIDKgvA6tV+MWnSbK8UbyGFpVrbfCVy3u7JWAgrDlZGlbRMW2Jw9KvNe3koY=
X-Gm-Gg: AeBDievedBwAtQwy+LgkjmhvfD4zHuW/OR6L8T5P5It9BpNHyARQVSDN8oUlHR93Xsz
	oFg1Yia8jM6EaPiBdAwxuX5acDuiKdv9QNKyoFIR6XDJKAqlkICdBHhkuYojIJJQowI8WrKMfR8
	KEj0fqKY9qgTqDb/LhlKakNV2G9aXrgX9ybgFkKRQh1a0zNirdN8O47bUvczmCpuYO4Nto4WxE0
	dxFHprGZ5ETkEoYN48+qA2PAEsensvaUxdUDt03q3a171bF0xp79wvl4vBIlM9Ltp56RJqU1l4h
	d5H0NReHTOJuL/LQxQvt/36UqtrSKiyYY5xlxhhPOF1cmm/ChpgP7xdnM2M6njJDJ21UMmgUzsk
	1ioiWvrtJSm9romAIApzQUgddslTPXuHXklxvaqDLKMooUjHI5m+TOet4TiAXmv4lyENugMGkDv
	va+HQjjtZvF3RfKeGEMAiseNPPTKgq4kwkJIv4HECQ1ClYoM0Z5KavbMb8BTgQj6NBlix/ilAXT
	WkYO8a0bznYFw==
X-Received: by 2002:a05:6122:8b10:b0:56b:8ba0:fd58 with SMTP id 71dfb90a1353d-575702b5333mr976156e0c.6.1778159397531;
        Thu, 07 May 2026 06:09:57 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af68c7sm10919278241.9.2026.05.07.06.09.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:09:56 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575212eb419so616758e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 06:09:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8masXimm4A/fAb3krYwIQvL5SVFSyS4CbieYxMpx0k9jadDL+NVocExD5dhM8vYLZ3vrvdvzvpyto=@vger.kernel.org
X-Received: by 2002:a05:6122:e246:b0:575:9f5:ac57 with SMTP id
 71dfb90a1353d-575702660a2mr904531e0c.4.1778159395782; Thu, 07 May 2026
 06:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com> <20260504144523.153906-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260504144523.153906-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 15:09:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVipbaaooxJpv_ugAF6Jpe2iOyg-G3RCM9WXPxJjb4ihg@mail.gmail.com>
X-Gm-Features: AVHnY4KfxZaV6cffdYAzHZX2lA7S5y0ECaxEl9ey1qV3v-mxmJpGbhI-x0nZrsI
Message-ID: <CAMuHMdVipbaaooxJpv_ugAF6Jpe2iOyg-G3RCM9WXPxJjb4ihg@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros
 to CPG-prefixed ones
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 4 May 2026 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Rename RZG3L_PLL_STBY_OFFSET(), RZG3L_PLL_STBY_RESETB,
> RZG3L_PLL_STBY_RESETB_WEN, RZG3L_PLL_MON_OFFSET(), RZG3L_PLL_MON_RESETB,
> and RZG3L_PLL_MON_LOCK to their CPG_PLL_* equivalents to reflect that
> these macros are not RZG3L-specific and are shared across SoCs.
>
> Also fold CPG_PLL_MON_OFFSET() into rzg2l-cpg.c alongside the other
> CPG_PLL_*_OFFSET() helpers introduced in previous patches.
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -62,13 +62,12 @@
>  #define CPG_PLL_STBY_OFFSET(conf)      FIELD_GET(GENMASK(23, 12), (conf))
>  #define CPG_PLL_CLK1_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x4)
>  #define CPG_PLL_CLK2_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x8)
> +#define CPG_PLL_MON_OFFSET(x)          (CPG_PLL_STBY_OFFSET(x) + 0xc)
>
> -#define RZG3L_PLL_STBY_OFFSET(x)       (CPG_PLL1_SETTING_OFFSET(x))

Ah, here the bad one is removed again, so no harm done in the end ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
