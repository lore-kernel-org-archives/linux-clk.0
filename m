Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440563A6B85
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264614; cv=none; b=Oel0PHaHcHDvaZfGRg7kKPZIXb3sSdLNE2St8ZZcMegzcXo3gnw7kqMpbMGOXxqMuHpOTpHMzEeNssfs//sCRQuw6f+P5tIoGe+Op5MlOZr7/9aOp3NAj+gMn/AMrTGpDgpqhTZAE4XMSvNHBm2WsEh8Ex0+lHAe1ZI71aUeC+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264614; c=relaxed/simple;
	bh=IOo8AWuxTIJ+k+Dyvuuz2q7JZDzyTuhjrqS4OcfSgXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgbbRnsta8DjD1MUooLpgI5vW/mlH0DZi5KM1G47jeiss+Z5GLlIcOd0El0nbB/aj2DZuRPfGF/oZJzeqScXBiCDQCYfxJkSc9UxcW6koqjSSIOdJozEYRjSGC0V7u4FCTjJsW1SsShlDhbv+UmJuQWjbo1xgNKqZnTig9uJs7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57533363201so1324716e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 01:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264610; x=1779869410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7VdhJSDBkYzak9LDT4UkpAtfl9KPk9NUyHcgdGQUxs=;
        b=rQLE5zpwRsr16KHV2OjR3QDiTIMHnRIiGSbwO0mlfHJ0o3pgxINMYGwhTn5N+zCOL9
         /zVl5zncSlo6PtZOUVK7zbsKua3Eb6ZrXUIPj19nKQzbpTIZWyuyIi0PJkXvtW7S5n39
         U8EuHIpRZAETksWpE299e6aH5kUohQfri5D2CxjayQ4keZYqiTEp+5moZs/lKWvbGvMU
         /mZeIQ7a0nqAXtYNQpQkpyKdNz+/5EQZR27iVm/Az9RUWnt1GPHOLFyGoyUKCab+wJfU
         fqvTlAtSVYw/fuk5ekRRsxBg3hieDfnGo3CaTBJtCI3OyeuT4feW3rrwqdZIcDTQdYDK
         +EDw==
X-Forwarded-Encrypted: i=1; AFNElJ8iyOOVYn/FogAuFFqHevN7wTQ2YtrfnxZ1NQu1+tYhPwHagKcZYBHoL8mv+qtvjWA4MXFbFj+F87w=@vger.kernel.org
X-Gm-Message-State: AOJu0YynrZi3zKXMVh93725y6FB9lb5U4nb2C12MDxBRqOvihbJWfI4a
	6RDmd4Ebqcam/i1/M4AWUI51yB0ERRz4fL9xog++DEOXNYavwr/v8jEEm9jjyrq0tvg=
X-Gm-Gg: Acq92OFhdGdDXSjTwSdqAndo4iA9X1GxJOPIwUWNS2nDThNEdn30/b/OO8s0rYB0BDH
	2fpM0sre9yHFYcG4C/uPpI8YvemLDFX/DKs62Y0FePfydiVuzKC+ZwjLXnSINHlWvjPd7Lj+ZOE
	Q4OdT+nuQToZdwC3jtgDwH4Zvc0lX05iCJ+Rwv6Gb965PGhxyVnJIauYaU2w7Pmp/9VpE1rWR91
	dQaBq70WEW3czhoLLp47seV6IrN5UMXoP1PUtlITsvfFJImOuk4tsWF5WI9IsFMzYCLgZlrQkZR
	glaIZxAX2h38xmF5P/qJgFWbg1o+ZqD+ULqQuJkAQAD/Yn2fu+3iIxcGfkLB/cyJNxgGiQvdd2Q
	8qXTLiwBnxCDmm8fy7/Lt34jcra694lNmaZ9OzfggNUbYMP6xM48UBgZukt5zQB+S9S49c9m1an
	/+zWV4EjocMbOUXKgpjK5tPfTzhd9JvYm5PPFZE5ivP3rqEx9yCO+2PAZX6ISnxtw1YrU3CabWz
	Lk=
X-Received: by 2002:a05:6123:86:b0:575:29ef:7df3 with SMTP id 71dfb90a1353d-5760c05e326mr11364823e0c.12.1779264610336;
        Wed, 20 May 2026 01:10:10 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa59b2esm9997326e0c.9.2026.05.20.01.10.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:10:09 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57513a91514so1375939e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 01:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+z9Ku2RWDrL0b0Niiud6IEQXw3lOps4SRKWd/Rvsi0SV7T6wmDAfOCBwuo4X+RpvvmpABfOSN5W1c=@vger.kernel.org
X-Received: by 2002:a05:6123:86:b0:575:29ef:7df3 with SMTP id
 71dfb90a1353d-5760c05e326mr11364808e0c.12.1779264608558; Wed, 20 May 2026
 01:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com> <20260519141518.389670-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519141518.389670-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 10:09:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWv3aN5gBUGRwJnpSj3NZQ=U0CKxDsvPZS2xzRDKZ4NxQ@mail.gmail.com>
X-Gm-Features: AVHnY4K0YwXkoWQK4hs4FQNx_sQUKymIyLyfuSxkPAB17ObH2eKA6DsPNF7Kc4M
Message-ID: <CAMuHMdWv3aN5gBUGRwJnpSj3NZQ=U0CKxDsvPZS2xzRDKZ4NxQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL
 macros to CPG-prefixed ones
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 16:15, Biju <biju.das.au@gmail.com> wrote:
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to renesas-clk.

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
