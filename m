Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12633C1971
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925689; cv=none; b=LzYh80kYG0j7sK1UrNFlyCX9VA7OH4oBpZ8Ipru3CpdGnh1b9mKC6g+cxf/ol8wWZT2yQBTkShct2kUeSoy6Sq9a2s5Deb23h5eal4lmb19l9+E0yZVATaaWy9H2fPsU6XrhReWtBpH9iWAKIaLXZbXVFrVDZzASpz0yBCuf5ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925689; c=relaxed/simple;
	bh=7MsYjH/9iUjhWy8P8Ia09suPqhf/e9RibAkv2+s9j5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sC+uVbEt+fhwGRv74nO2pYRTv5wirmeU9Yjrjj7E6jBHRNEboCv0EibOFgiGf2OV9JUc5Y16mSEVOEB6skIrv9nlduZ36ztr5zZ+tpk8JW4pdMwq0NrUu3MT+J976GQ3ekyrj4wSyUYGZddd+q6Cu+Au1uBhDZMko1SwAC8DesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b65ef9441so737413e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 06:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925687; x=1774530487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjLOUfcSKffRbXIYff9Rhip3Lpi++Tfs6RDOszYrfHU=;
        b=lvf15V0NiCouTC2AtlNREd+sQF/5oEoWS1hXkIwxL4dAduCQZakVngargktkcXJjk2
         dUQ3RhuUsDj17KicN40FX9TPtAVP2ucxjMHjErVA4wLMavvTTGr7DM96EEWTMm9O5G6J
         SZ0Lxmg51D9yRUO9/oV1eYXyo16jKJLRS2bBN0jX/sZjZSSxVED8RDKfc5peYhF5YW3N
         bYZA1TBUMMxdoA7HU9TZv8B+bGJRv1wSFCPyWxS4wJeo2DDzPw0jxhLV+6oCjEGCGZYn
         kqoyAtlDjwmSkVgjKeEgG9WBQl3567Tlm7lk3HntfxGfn8gxmtm9PCa4J91fzdd7JEXg
         FQZA==
X-Forwarded-Encrypted: i=1; AJvYcCU+8eR98RYrXl1cxBXgL/jdQ4wiqpmmYm9XaaXUGqc/xva4HXSvFJ/78yt8G2KJuMPSLaz1A5EO770=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiwYGWKe8hlQR2xCD/iHtq8XWR3LbmNvEPfcV9lvPPVyZW2VO
	O5L4hQphjzVF5qO00O2RTyAkycKPrMp4wGVe2Q0r8aWtkAFJ8YIPcCO0zlBD31y6
X-Gm-Gg: ATEYQzyS6P1ko743fx5Bpi7PqJvdAzrixexZCb+ANDW4wV6zg9pXffqG0Osmi9SLfak
	jbA0LjPEVfrFLZeKmbMOLp0E9i/ptuvyx7ewGsCWBVfwFEMvx5p07q7cHoEJChjOFOwQVAhzduz
	hvATj6jgDLU0m2+AJF5xZboNOsdYRSQ247Dr6G65Yey10jQJVlyeoFfQoIwaTxjH7gxxMaybjxP
	LPpHOq1GsCzA+evY5VItNEqk/2IHdQzx9d4Va+aMULEU9ZUetzZREkjnKV+ryP5zEmqZiGq/9JG
	rDeeAIDV5O+LQoGNLsEFSN3E+R4y6QMZ3SXctO7DDa1/GIQd7YC99I38sISsOgKjaXsAtVfmEEu
	mgGqFnKiAjMd/TS7Fi1jD0N3sDmRNUTIL1kSyFU0qisgSHgk+XzyH6ibMgKt7vn/UoQg03BpnFj
	+8fs2XwQH2hfUQlO1nwPzT8YjOwe0h+X+DjoFHYurKqss2hKTNiXdR/cnBKzlUdpM3
X-Received: by 2002:a05:6122:20a4:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-56ba6fdbd33mr4227752e0c.1.1773925686574;
        Thu, 19 Mar 2026 06:08:06 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510325cfafsm2750565241.2.2026.03.19.06.08.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:08:05 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56cc67e01deso739425e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 06:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo9hOdz+nABDmZEz/0nrV+9KRhLDUQ1J1fvffKjeTC3z5z7+FEJX5pqzF+EaQdD9/4OG8njIaCOps=@vger.kernel.org
X-Received: by 2002:a05:6122:319a:b0:56b:7252:cbbe with SMTP id
 71dfb90a1353d-56ba71adbfamr4114004e0c.15.1773925684650; Thu, 19 Mar 2026
 06:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com> <20260319125143.230377-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260319125143.230377-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 14:07:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOU7fZS0eShPJon4z6v_fea7YjP19rX+Z57b+acJ0Hrg@mail.gmail.com>
X-Gm-Features: AaiRm50gi7Y9EQKJ2SmUg1rxd2DUh1wC-OtlGU9PhNwDlWiLJtXmuaffqKLo2Hk
Message-ID: <CAMuHMdUOU7fZS0eShPJon4z6v_fea7YjP19rX+Z57b+acJ0Hrg@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 19 Mar 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Replaced r9a07g043_critical_resets[] -> r9a07g043_crit_resets[] for
>    consistency
>  * Collected tag

Thanks for the update!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
>  };
>
> +static const unsigned int r9a07g044_critical_resets[] = {

With "everywhere", of course I meant for all SoCs ;-)
No need to resend just for this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
