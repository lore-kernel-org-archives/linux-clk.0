Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1436BCE7
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846078; cv=none; b=C+kOc/Ud5z0599klrnpyfejPvhZyw5gMSd1oiQKAmRtBuqX9PxQ4Hp0Mia9zkizgfKm3kqaUrOCZinuzxdnuF52oMo0CrzXPdNSl9KlKU+iJjaY0xd2c27ctgZJ676MuUOZfsfVGQUUT8p8nITpQgNLAXe3jqoPErNvmBW/ldDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846078; c=relaxed/simple;
	bh=BFPlFdGofjO1NMSH6MTDaP0xfeuuIZQCHtJYo8BHycs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsmxLR6Eu+6QIKfaM/QnK5LfivB/1EmLF7xCkn3xdziBJMsF0yDIE4QjVw3RH3j7udwpHhG+sUvtdC40laN8Wt2oIVeDuZV3GPG/iOdW0xxCEbmUPZyyeybRtotNgMgLoWRmOplkWxp88MQelj9FHgn0+SqDt/lusmeXaSEU7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b890d1687so2549161e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846076; x=1774450876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXg7FETapjSVXFHxAADyy8y1j4tl12Oxzd3Nyl9hAYU=;
        b=tH5aw/Omxlxkedht2iK2CHvXlBFzjwM6yRHLaKFLt09BkQ/vHa6T5idJ6YNtOI0PrE
         2zkEp2spgzBh7cPOdBUtj5H6rBhPUYn+x29bCm79seKLoyyfc1D99usibtDohycUjde9
         E1mMVMtMslOvPe/lIIwkhkkRO+QsKyu0DWmNcpHf9PtjVzuQPxIazCTZOdGjHreiVXKm
         kHx19awTwBy9BztozB4VC1CLQ+lk/IbAYCZAS3mLqbxwkO5Nh6L8l51z88q2+uLbcsFQ
         TvlITSbDyUyM3PfyW+FxNwAtD799OHB3dtzuma+CJaNcg0JcFjcfVemVG2w0AEsy1j+t
         vH1g==
X-Forwarded-Encrypted: i=1; AJvYcCVUKDXeyOJxjVjjdsTtEnu9qUFLpP9ynbdlskjnyVVRojNn90V6qu9qvgiav4ag5mtfll2xG+oteN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYJbW7K1ZjAX4mvTUulMvsWGlYlYvnP2DIqPh+QoKs4RvyUMF
	vjkIvnGRC4wUXXX6if4IytD/+IBnBF4gj9U0t0FFgWOKGKW8Fh6iRNcWQc/vEoJaXq4=
X-Gm-Gg: ATEYQzxmgNE6AZ8vkDL3osG426IQ2cKeAya2WFhkZajp0L+g/tLTOLNt8Ib5u2IBGdf
	EGgbGfDAsIzcIMj6TMNa0cgs/BzG0+/JuX1FFmpJZ8aUoKEsJ8ZftjDV3E0tPxsa5N/RkxLsmZz
	URyGs0M6aNmQES0wGKtR+d2w2VVYImdyK2UWieyNb2/P4GCBbVhbwdHU3Zngl94kyLkj2Pd3vkk
	qEwDCY4IPzZlk9omLTmfZ4uy4NJ/zJTw6Ot4qd/tPaJD1GsJ0hIuyTIuntx4meMkQlk9AST+PIK
	rQ87/9cDbCLoIS+N0ECZOS3W+oc09hi5FLAJfWU28UKU1RyshDxVqMNv64Plp+Bpn/f1yNixkjy
	wKpQXZEaJW0e7A6es/hscp/xz6bK/B6agpRMX+ro+/L/KTQt85Dc25DNP0BUxN+Z01h+NSUGYRk
	J1aFHpQcAalLhxPUHJxRTlTH/Dppc+8LMZ+L+sWH0umFLO38K22xZ/Av155kgLFjhD
X-Received: by 2002:a05:6122:4a0d:10b0:56b:8023:b898 with SMTP id 71dfb90a1353d-56ba6ffd7cbmr1589164e0c.1.1773846075994;
        Wed, 18 Mar 2026 08:01:15 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510328f67dsm1489665241.4.2026.03.18.08.01.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:01:15 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b890d1687so2549128e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr3EdNN16j1A7+TdBbG71t+yYr8A+VG6Msp2kVia7qvTiylk9jcMIRBHfqYgO+1S8+3xohC09Ds1M=@vger.kernel.org
X-Received: by 2002:a05:6122:178c:b0:56c:c76f:1bb0 with SMTP id
 71dfb90a1353d-56cc76f1cd4mr1137814e0c.9.1773846075257; Wed, 18 Mar 2026
 08:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 16:01:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2hr3svoxqn_xw1y6D4yTcsHhFU2sz3rfqkXdTsJOEvw@mail.gmail.com>
X-Gm-Features: AaiRm52l5JvJI6VrRb9P6PewmuqbHa_trQPwdZfgYoddw9jAVQwgLAT7GxG69dE
Message-ID: <CAMuHMdU2hr3svoxqn_xw1y6D4yTcsHhFU2sz3rfqkXdTsJOEvw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC family requires DMA resets to be deasserted for routing
> some peripheral interrupts to the CPU. Asserting these resets after boot
> would silently break interrupt delivery with no driver to restore them.
>
> Mark the DMA resets as critical by adding them to the crit_resets table
> in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
> r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
> ensuring they are deasserted during probe and resume.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g043-cpg.c
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
> @@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
>  };
>
> +static const unsigned int r9a07g043_critical_resets[] = {

"r9a07g043_crit_resets", for consistency with ".crit_resets" (everywhere).


> +       R9A07G043_DMAC_ARESETN,
> +       R9A07G043_DMAC_RST_ASYNC,
> +};
> +
>  #ifdef CONFIG_ARM64
>  static const unsigned int r9a07g043_no_pm_mod_clks[] = {
>         MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
> @@ -420,5 +425,8 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
>         .num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
>  #endif
>
> +       /* Critical Resets */
> +       .crit_resets = r9a07g043_critical_resets,
> +       .num_crit_resets = ARRAY_SIZE(r9a07g043_critical_resets),
>         .has_clk_mon_regs = true,
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
