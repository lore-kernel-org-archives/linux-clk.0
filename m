Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C21D5AC6
	for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428881; cv=none; b=TppcOrxV0DiJPOR9cU9pF7FIFR5aYmJSz0ND62/pqhDQbbrE6yeYdvhaPtn2WIzycOmBNFAj3CvMJFHV5F9rDmUAHbvTUh9oUf7NqLuu3kc4gbQI9HqmuDNc6C0U4UsPb+TtHqQ933Ldqrd8ReiBsw10KK7Rkry1oldB4tInsNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428881; c=relaxed/simple;
	bh=NB3yDfsRy4c2nsKTYr/2W55KabUQwS/trTEX9f41G+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZ8rwqGH8ctiMwzKFl6zVcwW2hmhe6CQPy8fQQPJEBaMvFVso3rduLITlgovZSg2aa5EnsKik/zf2rNF9+i/XYsKTziTfNV7gqI/rkfcDAL2EF2lai8JgADwP6GIdLsfqyC8jhK0d5a+T51phB7gmIK623qO8P1zIz9YIL4q7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54c0bac7d6bso2486608e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 01:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760428878; x=1761033678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9A6h8OlO+sRs7kmpWSCpGtEIoodYXxSOMIPCV9kNdY=;
        b=jfvhFklqnldeiFrSBCb9ykA6/1e9nvaMuv914bRzfsRH/2FDrEM1FQXN8qEaOItpC9
         DdTDkifOYvCFuukd2tAKShrDd+rmdW/4l5xonRDnVsBV6uuO82SHm+iAb2ko1c1fRCRb
         r0NJxtl3VIIKbbsPZxffhlcGxsmvY7gfbxwu+78FTRl7uF+kjdeEFSFo+Ty2Z5krmlQG
         ArVQ/5cZWM8cYZK3ENjCGbaP5RnV2SAcHZC/YZ3mL+MrWlDo7U38GzTayhLjGm5WTNUl
         FsIyX/srBCwqz3MRSQzRT4GVnsaD5fEEPxXDozXPbfa2A4fgNdsR5W4AuV02hV75IiNc
         Fe0w==
X-Forwarded-Encrypted: i=1; AJvYcCWOLJz4wAo7TZ0NyqpYImGZlq7+dCv4SRwtRcPR8MGEOwKMVLN1n9jYSQ/VSGEWUjusYAU6KzWBRZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaHYCO6v9nHZ4eNbTwCDOKdl7uZrHcFbBYKekF8SzcNNKw2jo
	a+2NAM3SIyBDNHOHoY4/TdbB5h2W5NEBkq9g13lKiXYwz+XlsvwKgDTxOcxTQ+DM
X-Gm-Gg: ASbGncvDSex4Gt1WBAgiszVuvnrRm7GGUdx44+co2Y4AtPyBKFWRZxLDAjmK3En2u7V
	3G4jaMaIBzdyaLKVdPwt32h+QzTwDA0qj/rFocCWLdT4RfzcgX5h+ieCYuWlUJPUuK1Oiasnczh
	y3r/YeqZWWkCLPoqTb1I8AdbYN5NUEO4pa7v1TOk3Hslq+8XbJ5gqpoNQbH494zSB5Tt0/1fOkz
	+svSb/5p/QN+vD84zB4XwNkRlnJ+HdMb4LSmTUczhTCkFn5P8tZVxrVbVprSikl/1s/Xhc8QH6I
	mQXceMZdYyFtEkiHqyGN4EgG7J+7zssil6KvNjZFwXSt7tAGoneY1+mk5BJD2H6JFHtJFnXduw8
	8Nzyto37hKJsnU3EOodPAPoK1E/RkYHtE7rrvcdDKs5kYp+dkQ/s5PwIRE2gYt6mPHFgG5bHVoP
	izNLrosuVs8CmX1A==
X-Google-Smtp-Source: AGHT+IG5k/RUpyk4sFleeiJxRx46c0Qn1ACTepB+qvYMxzxb5wiuk5wx0riu5vhQaOCSXGKfKVHT9Q==
X-Received: by 2002:a05:6122:311c:b0:552:15a3:e764 with SMTP id 71dfb90a1353d-554b89029e1mr8601415e0c.0.1760428877719;
        Tue, 14 Oct 2025 01:01:17 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80fdbd5sm3844721e0c.22.2025.10.14.01.01.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:01:17 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso4296401137.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 01:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkyIAUUVcp328YPGIh5iV+3l+3SeN8M000fYpw6YSqQ98TKYsi6N4rTXvocB67GNy/WACNY3eVnzY=@vger.kernel.org
X-Received: by 2002:a05:6102:dd0:b0:59d:ad3:e1dc with SMTP id
 ada2fe7eead31-5d5e2202cfdmr9463488137.8.1760428877073; Tue, 14 Oct 2025
 01:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
In-Reply-To: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 10:01:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-1fktGHiNGxpTVqxigDqNenV_2oxsdm1MN++ix1_wSg@mail.gmail.com>
X-Gm-Features: AS18NWAbvI2-hyhwdeTKYm-p_fgx_uUVgfTeoO9pCR-j5hiEYG51qrZuvEO8XNU
Message-ID: <CAMuHMdX-1fktGHiNGxpTVqxigDqNenV_2oxsdm1MN++ix1_wSg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for ISP
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	fabrizio.castro.jz@renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

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

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -377,6 +379,14 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
>                                                 BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("isp_0_reg_aclk",               CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
> +                                               BUS_MSTOP(9, BIT(8))),
> +       DEF_MOD("isp_0_pclk",                   CLK_PLLDTY_DIV16, 14, 3, 7, 3,
> +                                               BUS_MSTOP(9, BIT(8))),
> +       DEF_MOD("isp_0_vin_aclk",               CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
> +                                               BUS_MSTOP(9, BIT(9))),
> +       DEF_MOD("isp_0_isp_sclk",               CLK_PLLVDO_ISP, 14, 5, 7, 5,
> +                                               BUS_MSTOP(9, BIT(9))),

Moving up, too.

>  };
>
>  static const struct rzv2h_reset r9a09g057_resets[] __initconst = {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
