Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11E3B14CC
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134001; cv=none; b=tyyYIcsH6eRCNGu1SP+g26RKlpBJbCECXvTYEyd4munajEAC9fvdmxBsmVUFuRK9bA2xHTFVfCy3D0S/WVVvDQezb9kLTmvL9VWJPYY0wwXEVIk0z+VQLNGwUD+mlbQAtoygZxQy2gaIPIxoepCE4eAaeoci8aDb+Tqmb3q5Zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134001; c=relaxed/simple;
	bh=XcEOJh31PWonfR0DQ8W+3Ki764YdjB5fZsLG4UFUAQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oL8TzC7XgDvDJAmZjyjAC9bedQ6ql7LnaOqPAQzhF1/J0P6q4cZVOoiI1n0xhQq5tq30noTmxuPjpjhYoPtYy3RP/5rvlcnmSlRCA1zl4bF6JfKg/rUlVjwTWDyqXQh8LE5eUwO2LK6t/LPcoCnyeUBzvcHssoDpK1gfLvlpgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c0c41ff84a6so304222466b.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133998; x=1782738798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cPiOkbmgHnl7iVDXe5O/aM/qhQ7nF1KGFxDUd/gPMA=;
        b=asooQD/H5GYvS3fhw639fgDeEsPJI3Gq6i1Pd24s0pha35rBsSNQCzuyuy6kPuPAmg
         oiFaffubpxZcf/aH3Qlkeg0VjA+X00FtjTykX3ZRusNPlyNDyMdY7eTL+9e5ZrkpM7jR
         o0AE8/FO8GwTW5vi2u6kYpBJiEXDsgr6qu8PwDY/Y2cNxtiw3CfXHqPhENJKZfE8a4Cq
         nbtm+/lWMOXlwjR5aoMt+qJvvhNWAL+GHkMXfGkTJr61e3BpV+RSSS4Ivqe5Zx+3cQ/z
         heYgIF3YREf80hWSdqW48BgwwGAAuQQslxFKF3H3krj0ILk3Lq8dUylQY/GnfAQ9IHuE
         lL1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9vO20/6bIZLPn14vcEwgKcCobYI225q4MJ/QZH8TJVJphSwK1E6oF2phMo8nYO6tllFtOSCqOsoss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUesl8HSPWeSxdaEblTZNrBNKHJA/MZKLkcF72pg/SPlBGDPIC
	O/yTHYo2JYwpOnrN1KMdgofA1AYQybqOwm3hocesv5u0QnG1PTQ+9OjxQzrzaGt+6TI=
X-Gm-Gg: AfdE7ckRiFDlVGazC60IWaTISqRXDIapt2eFYYgbY8jRb+9o5cUJ42R1qxwf5d6F8wT
	lLk4DE7QtasTg8JojwI9wp+jDLMdJGZDRzwD9485L1jqX3+hrKLNi452X9b+RUvDcijlE2S7Hff
	xZZyXDsyHtftd2VxtZ2QJL0FV7alFRwPJbONWBRdDKAkN/8Eu/7MjT+88p/CvxnE9Z4jrffrPS+
	VdS0k2NXrg8LCZ4p/90S4kKHfIWQIVtB8O1A45XzX4miu54dH9ZHzZU7fbPXcXM0wCfYlXuPqLZ
	IWe5SRHhpys24tTUec4w97YHSC3E+EeP5rkkqJBJyJbNjKoJG+6uhLT2nBD7LXePhDyviJpCJXo
	DA2kYrMWYW2P9/8DJj6tf2mYHY4oWdZVczYdFmoSh5k2Ul+KyQ9TnimgjusXdd8L5oKikhGF8bJ
	9VHlBFXtMaL0xb3ulwHSthOp2+NLnB5N4BIAEKzwYyq1dBo/F7Ew==
X-Received: by 2002:a17:906:f59e:b0:bf7:a616:cafa with SMTP id a640c23a62f3a-c097c8ba434mr890218466b.34.1782133998250;
        Mon, 22 Jun 2026 06:13:18 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99bd0bsm359533466b.23.2026.06.22.06.13.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:13:17 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso5286201a12.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4aUL0nSigoPefhATYQd7IzyTh3b2jk70SbsrTG+vASu6eqRgadyhd9Q0Qg2Tmsrvq9P058BZ2uTE=@vger.kernel.org
X-Received: by 2002:a05:6402:3547:b0:697:ce0e:9243 with SMTP id
 4fb4d7f45d1cf-697ce0e9559mr540539a12.13.1782133996242; Mon, 22 Jun 2026
 06:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
X-Gm-Features: AVVi8CcUH8u1TOdYYuE-qFfJh-2q3W4LZYrwKknGe4DqOfHPr71m4gxhWY1vJh4
Message-ID: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
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

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the clock definitions and PLL logic required to supply the LCDC
> (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
> subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> clocks.
>
> Introduce a new PLL clock type and implement rate recalculation,
> programming and locking sequences for PLL3 using the RZ/T2H specific
> divider and VCO limits. Add the corresponding muxes and divider entries,
> expose the LCDC core clock, and register the LCDC module clock using the
> correct PCLK parent.
>
> This enables the RZ/T2H clock driver to generate the display pipeline
> clocking tree needed by the DU and VSP-based composition engines, allowing
> upcoming display support to be integrated without duplicating CPG logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Added RB tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

> +       rate_millihz = mul_u32_u32(req->rate, MILLI);

The issue pointed out by Sashiko (req->rate is unsigned long, i.e. can
be larger than u32 on 64-bit) is valid, but I believe it can't happen
in practice.  Still, would be good to fix it in a subsequent patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
