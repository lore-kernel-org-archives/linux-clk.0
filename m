Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9763523C368
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710940; cv=none; b=BY9t9uo7HpRFWWL7lG4RETBF+rpGL0prAu0d485pr2zkE2puBtu9Maxht1WQGFiIqIMsrszwINdYcclsS6Y5JJDfQ0zy4W005qkO3kzglnu9ltIwYheS86xH5gAqYs9uD4fFjpiOGQcGGpeZTz7IjW0P5XB+bpJ3fpGkKc2agTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710940; c=relaxed/simple;
	bh=mriR7x08gkRw7T+Z1DsGxxWSZ3VG/5RiGgPdQbqyaEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3B44q4mpoFvgNgsAKUIjhqJ1SMCl0bypYxg5Q1j0kwCA3Rh3ZbdUMClelHkdyqMoM/VoeX9vNIHBtiES4suuVyZtOA1u5+xeAijmeD6an+fOVMO/3K6fzW5t/N12uF9yVfuPoXN5T1luV8+E0C71nGrp5ppk+3qEdo0qtAGzZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so1378077a12.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710937; x=1787315737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBz0qWkjPoeHXwmwUAFk9AMptjW62XkJH6HIJQAVVZc=;
        b=OUT/f6g9QFbkDji5BI70TBKY7UnzkP6fHsTHdUuo9om9Hv+48Vs3j11z7fE24MikDO
         o2fJjHoRqGgl+AwncSExYZb/xajNia/S6P65r0Ip2GkIx3pT7LuTLk80MYB8aCqbiFvp
         8C39rpeRJ0jPwANAXPlGVtmWWRsizcuNJ3LRzAPZmAeNBjJ+iTwmhmRY3m719aZzliDe
         eRnubl1cNXAxTYnJ6pe2Nf4yhZAtMUCzF5x9rNFcvkeNQ5ei7L5H3lBkJ4xZ9r6J5jV7
         sSHdoV/rBTetSvksz8lkWKjHJ6iR0Im23SAR8HnXhaNqgR/S+YGY9kbn6OqoXbyDBmf+
         2iLA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ROeHgdaBrvv3CruXKnagxjzbmX5sBlub4YAe6W153tnBzhPZjSuhLmcP1sEbRueo8OZfhW/ZrV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt88ru4CvnJix0ArCNm+M0nDWLuDiRmAcnzaYWCuQYopj2zXZ4
	rvYGh+xny3byg0cn4Czz4DsPtQ8Xe8pf0Ubk826WTld0dxzJDzxbctShEDKyIirGILo=
X-Gm-Gg: AR+sD12df6v7bQZfnFoAleKKpSTVpAKbdYvbsorR7SaeaexBDzK49Wk+DTb519qw6s9
	qLaXYQOg5rlE764rFeb1g+1NzkjLK6ivkCvxlc8ixAM4fbLCBGPxjr8bEmFlRqFg49hWW6pXNzv
	wh/Ot2HRsiHd6WivMja1Wg9vLjXil6azbl5jVgtBk2IJifDcXc+ug01C/9P/aeBKU+ptMAhGqZq
	7a1B0wxYArY/yrvrf29DOMFK9y3ZEk2iC3E3U+MFAQXbCGWka3ucZbXNsnfQlb5JuYvxYUsmqDS
	xD0l2T5fGlLr25Od9PyQsSLMieoMhcuvBou0YiCN2gJXpF7jrAR6UEP7Aw2TxUsAkpkyULnMv9k
	fZUgVkpe0IsMHP0Qe2rDTBafL6oM0wX6NbFQ3J0ZWoJoR2wpC/f2BUDN487qcquqpTYu9NvOi+W
	7PCy0VUuZPVzhEKMUg+PP8WGIfGPO8m/g2v/U+6B9louO+CZw2Tbxb30QQ7weZQ4bBZQ9GGzUj4
	Sz54XwHyCQPWY1pPItNGRuN+A==
X-Received: by 2002:a05:6402:21d0:b0:6a0:a65a:a0c2 with SMTP id 4fb4d7f45d1cf-6a38a8fb008mr2623281a12.7.1786710936713;
        Fri, 14 Aug 2026 05:35:36 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9e55dcsm811749a12.7.2026.08.14.05.35.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:35:35 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1279974a12.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:35:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RokDgNZ9WUJabbMGT/MklwZq1OKR+Qbj7xk8qiCdwd1N3coCFcRrEhWMzeFCAOZKVnNW6j6pVA6c5U=@vger.kernel.org
X-Received: by 2002:a05:6402:2499:b0:6a0:9468:a025 with SMTP id
 4fb4d7f45d1cf-6a38a987f5emr2620460a12.15.1786710934803; Fri, 14 Aug 2026
 05:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRNj1EyHmc4qMoLU=3698U6J9RaXe5KjjKbOZU6GXsvg@mail.gmail.com>
X-Gm-Features: AUfX_mzr39GriWtj-uBW2z5GWyYiRtWdDL-JXFwCBGDDES7ZpttXY5iLcyqCPI4
Message-ID: <CAMuHMdWRNj1EyHmc4qMoLU=3698U6J9RaXe5KjjKbOZU6GXsvg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L DSI mux that supports 2 duty cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped rzg3l_cpg_dsi_smux_get_duty_cycle().
>  * Updated Mux flags with CLK_DUTY_CYCLE_PARENT and
>    CLK_SET_RATE_NO_REPARENT
>  * Determine rate now forward to clk_mux_ops.determine_rate().
>  * Dropped the duty cycle macros.
>  * Dropped struct rzg3l_dsi_mux_clk and to_plldsi_clk_mux.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
