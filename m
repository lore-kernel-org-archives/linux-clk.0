Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9A3D16F1
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689739; cv=none; b=XUvc5OuPKlvW0wpBJPPhuTHoT6xDwOr7NVJyC3XWeJEAOOhF51cLIrbsc5oO7+SRrEVwSXVoMZGv97dWGoRhslENkPfEdnCBbdCyHT5PRvfzH+Kt1KKOBzeNodp8sC8+1kvOiC6XzsIThCAezJrp1yw4LYbtpryTBqrvaExdJwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689739; c=relaxed/simple;
	bh=zgmF4G180wgcf5oiYNf7MKLkwNcY83CQ6T1cSixEe7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Po868/i+grr4qovdzsxHWPBT1Zj4SfA8mntuRJqar4TpnJkGBZ6AB2V/EWXfGvZHRIbh89Ffes6aiINEdXmSvOPYR1y6BBu4WNuMFpoiHcImTJlN2WRWxchkzsYqaCiwXvzAnv+XfBlbQ/+efLIp8lJh/j7k7L+rpUTc9dpdTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6c3154fa47fso4243285137.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 02:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689737; x=1782294537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzBIHbH3e9z5WB6Uvoc2w5PoH5awp6Q/fBEmuSHqk2M=;
        b=kxiU5BB49c1yiLbsajGaPCE1bVCEDTnucG+hsR78dKusmzUSFyEoV6u6Re5wwIzOLD
         CPOKc7d2vmBeE65ESQf0uBgE49XJPW8lr2T7i4KAD1NK9gEFBiJQAyyqLSM3j2I7cxSZ
         hc98NA9sANZugtCwXhstf7ab3HohsHWzptYyMF0JLVwAbAP+l9YDH9agDmH0kNjIBHpU
         AZtFHsdWRoYz1rR58Ct1pXLHOSZpiQ8385K9P5ZD0yNvYSk+qYGEZEm56igcHGh8roCn
         WJVMEEKmk2CE6CcUL3zL8zC4grpO4dreZNWXXbfZbMA/x1YRlO2z8yZ1J2hwNsPK4aBu
         BMBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wgV2eh4pC1BxLrh3LkUjhj+GjHgsHlYW5wgD96ZUQ3fYH/c1F7XgvxVIVpTYF2R4WtlNclj2cf2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1YRMfmEifNQ/ouKlrohjCYfkfeXEWuWrnFo0xat5QxfKT3em
	OAB/RMxPnxOe2BuKSy8AuO4i+DaeoKqd2rq5MpzGqKHvSLowncGlEkEavhp6bI0f
X-Gm-Gg: Acq92OFpoXjhb7jcNyCq74s/ujdHpzAg59qjeY1fugmUaQpnpobnLDtZAtX5bgw9s65
	ooZlv6VPsOcihVwVEeNu0ADJJALNFGipWIGcSHJkYG5CHBd3EFefaDlJ9EysSddXAVX4J1r6sNR
	cnqPJBk4XIw8nbD3gqJgcbpBPeLXVzvrxL3YPhhdL8hfeqm9WnMSA79zQ9vLHtDb9dM1fkqsISE
	llbMSDjx3sX8ORgUEcnbbGrfCpizAtomR0/6OTeMdFLcHPGScqUNga931acqoaIQNeCJ93EnMCb
	uQfJnOYqcnBJ/EwJ8O8jrnidIrAqfonagtrtFlAAq80UVQjQQFoP0tn8lCPnUXwBucNTlH+dIXy
	60ECuD+7CnH6GhuYNHbgmdVQgu9zO2NlTBO7E6Q8BIkyx+F6axKd31LK3awEVQG95Myx4jh1V2d
	GO93QWRUDRpRUIZ5731p7PbeoMTpkDLeDWUjvKlZ0P5eYuxaCA/g==
X-Received: by 2002:a05:6102:162a:b0:604:f29d:84be with SMTP id ada2fe7eead31-7245d2063fcmr1539275137.3.1781689736658;
        Wed, 17 Jun 2026 02:48:56 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720847c1525sm6661960137.1.2026.06.17.02.48.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:48:55 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7269038ad05so148623137.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 02:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MzMgGrRu5wJi8VB/3mstP4NveP07l+bD++9O0ZQ1kb8v6oX8D/ttOZUaoCsWkmRx7JtBcmBZ4Xjc=@vger.kernel.org
X-Received: by 2002:a05:6102:3588:b0:6e7:5c89:3fc0 with SMTP id
 ada2fe7eead31-7246d42e08cmr1649434137.25.1781689734943; Wed, 17 Jun 2026
 02:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:48:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
X-Gm-Features: AVVi8CexHI6Cn-7af-3NwS7Fpca-DgZi_9j2_blKzUOte_bydlG-ZNQqhEBgXok
Message-ID: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> Add an input_fref member to struct rzv2h_pll_limits. In the core
> calculation helper rzv2h_get_pll_pars(), derive the base input clock
> rate from limits->input_fref, utilizing the conditional ternary operator
> to fall back to 24MHz if the struct field is left uninitialized (0), and
> drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
>
> This abstraction permits the reuse of the common PLL divider logic on
> newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
> clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> disrupting existing platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz). If set

"in Hz", as pointed out by Sashiko.

> + * to 0, a default value of 24MHz is used.
> + *
>   * @fout: Output frequency range (in MHz)
>   * @fout.min: Minimum allowed output frequency
>   * @fout.max: Maximum allowed output frequency
> @@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * @k.max: Maximum delta-sigma value
>   */
>  struct rzv2h_pll_limits {
> +       u32 input_fref;
> +
>         struct {
>                 u32 min;
>                 u32 max;

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
