Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88A438023
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698641; cv=none; b=u3GE+xnSXaYMU0gzhXQVEkVwYo3Q6oASIDL/TjeVPz7OU5I87OKj59BOQG0yyrsXx1P4OdVZJsnVGjnzw2/yWON0P+RIpKkzRQvYTaA7lwVaXpXDo10YfobT4/RCIUWRbkOE65mSq4EYgU4sA1BNvOaLiN63j9ATVGatpoq+Q0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698641; c=relaxed/simple;
	bh=7siWu5tOBAOWAK8D+hTW+WuI2Xn9CN6SJH65H7cpEYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwBKCU/UghIcWSOV9CRX2bF72o+fFdowGC5qiQS+n+8tcKbY9K68EGyCPHTYxesOhymXna38nC+SDrky/5mkY88OT6T0i0H53OYYqK/cNqjn8kMVVelgsKLpvwE0m7OjQtqOetCqrnF4kC9XQw0G1C5WpToRYyBzt5VWA75cavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-738b39dad22so434747137.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698636; x=1784303436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=COq9xMLib3DzhYnSQrCEEFddJljJERP911HcL/5Bs7Q=;
        b=QcPA9mNW6QghOPd5b5NQ5azu7AAurr76f4hWS69FV1AdxA3yK7MxX5DIXPHe+mFD69
         Zkmm1Q9yYV8XZZNkIPWmXnWeiUWR+SBabWtgaQNHYZgokMsi/xOBr71UI4jYRIeA9jQp
         /UZlPzNx/ig9/zQS+BkgjpCPVhP10wDMCsX5ptoaSMkGIYg9Nqzu1jWItgAP611Z3zZa
         Hzd7Tr6rtaSLI/J+yLmOQu8pBzpujIH0//EYlUvjBfgL4R/ZkcfY14rD3uhcnj4W0Wvy
         WQFrfHqx4uQXjYSKERCYEEv55wMRo3U68Q19T8i1hlxL7/1vSQ9SbzUzY3XX3WOjTGOL
         xLaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Balk1diE596dG2+4lXZS9hZDvfyJQCrwkmwdsAQkmZYzW6sZt3emSibL+LHpxDgpK0P/lJb53MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEMVozUc5cwf6HM6rz8gASy/McmXKhfeWCZNwv21/tRNBvoS9
	3y6YS/9cOhc3+Ee0WteSQUYwz+dfKXoBON+MnUjNe2MKV4/x3vvmME9HE1wiaMMS
X-Gm-Gg: AfdE7cmJul8kMmokiPM5B9BtCxS6XkmiDK6BMo2GYc6O08t2E45gUyflAKAodfulyo+
	CfGKyGY8HfntGKoiz9VC6x9XNuvw4jbe0KevERQ9gTgovLRdB6zFqmNMDCL/gh8iGXzZc3vDTDU
	mUgUBDQfHiqbIxoBvz55spihD/slgsLqDeGkDZZzMnhPjpa0eCTH62sBsO7fN9ZaecwWPo9jbnJ
	5Eu8vLSPpfiGx7Efcd9lNkXo0j2ZO0gzvE4/GkvROa2kGLY0RyIFhE+PvscLDi77WwR3gQjs2Ys
	pyyLdHaiDiAQ9eCArR7r0I+QbEHLFQ3BFEZNkTDsjEKE8DzC4SNIKVU9n0MnqgLH2SW1hpNWzUg
	9jXyhYCk6B72ANjGv4zt14ZZdgwiMIBeIDqpFdzt2VAR9rWX6aRmu8Bws5Pg8KcxXgaM4vbYZ5s
	vo1IcwGtS3N3amE5yJ+s+zaR+qULesX+Uvs2O/AcAmrUmpfAdqIyM+Ynz7s9iHz614
X-Received: by 2002:a05:6102:579a:b0:73e:8694:c6de with SMTP id ada2fe7eead31-744e0322652mr7082595137.23.1783698630834;
        Fri, 10 Jul 2026 08:50:30 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3ee7csm5309513137.2.2026.07.10.08.50.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:50:30 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso467052e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:50:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8HEFw7tZjWkStqm6lwMhhpAcccGUTDpkI882XsDHqPqCQ1GT4mcrnV2t6Qs14BTG5CQjyyA6YLxM=@vger.kernel.org
X-Received: by 2002:a05:6123:102:b0:5ab:26f:49e3 with SMTP id
 71dfb90a1353d-5bf75d07354mr6081672e0c.3.1783698629559; Fri, 10 Jul 2026
 08:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:50:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxV-iErH=Kq6tm427MAgokh4hYzJYPr4PLqfmLG8JqgA@mail.gmail.com>
X-Gm-Features: AUfX_myJ2dro8QO_CpOJ1eUm20yID6JHmWFTNfxFEckms8jxuihDYFh0fr0o1Lo
Message-ID: <CAMuHMdWxV-iErH=Kq6tm427MAgokh4hYzJYPr4PLqfmLG8JqgA@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: renesas: r9a08g046: Add clock and reset entries
 for LVDS
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for LVDS.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


> ---
>  drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
> index 7cea2c6d2c42..273e147dca7a 100644
> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -574,6 +574,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_MCPU3, BIT(11))),
>         DEF_MOD("rsci3_tclk",           R9A08G046_RSCI3_TCLK, R9A08G046_CLK_P16, 0x618, 11,
>                                         MSTOP(BUS_MCPU3, BIT(12))),
> +       DEF_MOD("lvds_pllclk",          R9A08G046_LVDS_PLLCLK, R9A08G046_CLK_M2, 0x61c, 0,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(11))),
> +       DEF_MOD("lvds_clk_dot0",        R9A08G046_LVDS_CLK_DOT0, R9A08G046_CLK_M3, 0x61c, 1,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(11))),
>  };
>
>  static const struct rzg2l_reset r9a08g046_resets[] = {
> @@ -637,6 +641,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
>         DEF_RST(R9A08G046_RSCI1_TRESETN, 0x918, 9),
>         DEF_RST(R9A08G046_RSCI2_TRESETN, 0x918, 10),
>         DEF_RST(R9A08G046_RSCI3_TRESETN, 0x918, 11),
> +       DEF_RST(R9A08G046_LVDS_RESET_N, 0x91c, 0),
>  };
>
>  static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
> --
> 2.43.0
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
