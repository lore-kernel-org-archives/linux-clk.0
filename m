Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CBD1A23A6
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454448; cv=none; b=s1OIbCXZTMk0vEiqqkF0EnASq44Ry3GnrZuXQ+z3D9xEfcTKAsMq4c7p3XEPGp+WX0CQ57UVB5+5k3cLkX5TBaHOehOt7lGbOtDcu5E61Ffd0rR7tNOUjo6K1JcKmVLYR/MvNp5D+iKu1xN6G+YbBxUX3NkKWBA5VG53BFa90Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454448; c=relaxed/simple;
	bh=y0f0zDcXdnnkLBeUUpPjjNjoTVeherK6Gnt2N+WMLIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+y8LfzbLx8zVKm/DM8ChmJNOPaYgKjzcvR+/H558W3SGjRqRwpwbd72ThN5xx0wwSJVEMtHINS5MidnHRev5i1pxsFTLQvpsWTgiOIoRSk4cVhmpAEeJ/pcbgBHWc6Pt+VEoDJdbWCNEBOFA+Z+ekB1NfnDpxrkfjop8YCe+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57513733658so2475371e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 05:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454445; x=1780059245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3quGHjyGKvPfNTVLHbhsH4A9LYn3Ygi87Pw363YCUbE=;
        b=AQN9FD58NPNRmiopgx+jm535Eff7EvxQBz3DiQztZ83mKSAdPurBGjPlf1CsNYWvLY
         XjQjT6uj32OvaalN0QByG2Tr2NH6iJaXYriU3u0VTmB8p1ppVCKwpd5BhjLrJgs/73ay
         hPRvfNhjggC08rWwAEKMTfPljVtdY0DZqbJLilMhnLbCg1JRt5uG9n+NIyvSQZstQh2e
         /eHCgNp42K25nqH3rOEVWlCmS+GjKAu6SaGxg5XdDLleLD5qTaFLWlLlSpcb6Ua8Ao6G
         MJw7TeZ4uwUG1jMnPJEXg7EICKd5LdB+YhpiM0hs6TN8Rk1442TgUhCKJowOpcLQDyYe
         GB4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8G96YnXza7k09wFdgfSx63fqh+rZzycgQbYEG3TXtl7Qe7+tcwo7GvXfhMtaz7u3bg6UAUoXZ/MvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEC2iEwO1OVM/luHPKVptwNT/kVhIyzQ5lvJlpV/7hXJO/2RK
	xnQKkuhS0IgbB+UHpg6kmPCsJt2TFMWwoyIDMAd92hr8x38F3HpKMd4B++oygdRl
X-Gm-Gg: Acq92OEyiPcwRnP/rQJDKr4+5ST14L2iX5PvFWY/leHCnlRBbIwwTY4vFJPf5D+lvGH
	rkFyjrdhIHHoQPhaCfUqdvQHRXLvMZNmuch6oy7iyJeit2ERCOy/8qx9Gr5mnCrnb96SzPRqJTo
	bBOQCIWvTVZtY5pGhJiUHJJOWC2yUnpWN51Hm+67MvT8WyvEQ48+sMhPcGl7TrTV+fWImbV7OJK
	cKUXLnOgAUEOGrBQjVQIxflo4zq1tR3ER6T5ukC01PohSpsw6FYMKuFZ79vRu4kO91qxRGkkLpR
	UBqTyrfXmiGM7AnkQQlIFWvBQnsGpeRwfxXcKwO1bnXkRiqeVXHZaBbn80uQrct4pF/fNfcVvKA
	JJjXB3QHFfuWwgnz6Q6dfRX6oLhVCHcc7Vn9iEMFRtJzH52H3+q7QsMIKocmPQylB2XBcwsbPI3
	ltx6wnrdCRMQvsdbcXf4PcGr79BbP9lvudnoFKqa+xvUzW2FHLwLmviGzBWmxy
X-Received: by 2002:a05:6122:3405:b0:575:36c4:8900 with SMTP id 71dfb90a1353d-5866395ff77mr1593721e0c.14.1779454445101;
        Fri, 22 May 2026 05:54:05 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm2033889e0c.16.2026.05.22.05.54.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:54:04 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-63270abd14fso2385839137.1
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 05:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PNliikq7W4LaeeWFYOrCgbpYWuNGsv8oR3bB6O1gFQEN2eRXocZa986cFMd3mAfO287ajXdqAg0w=@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:65a:fcea:5a4 with SMTP id
 ada2fe7eead31-67c749055f5mr1527775137.4.1779454443355; Fri, 22 May 2026
 05:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520092947.70596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260520092947.70596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 14:53:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjp2bWkvPraNz13afhENWU0zdu3Zy0VP1dpU5HPB0PzA@mail.gmail.com>
X-Gm-Features: AVHnY4LtzrzzorNjSfvxyjhEkppUb04Rmj1TXYpE3QgN6Qn4KvJMw-KEJ4D4Cvw
Message-ID: <CAMuHMdWjp2bWkvPraNz13afhENWU0zdu3Zy0VP1dpU5HPB0PzA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Rename iterator in
 for_each_mod_clock() to avoid shadowing
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 11:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Rename the internal loop iterator variable in the for_each_mod_clock()
> macro from 'i' to '__i'.
>
> The current naming conflicts with local loop variables named 'i' inside
> code blocks that utilize the macro, triggering compiler warnings due to
> variable shadowing:
>
>   drivers/clk/renesas/rzg2l-cpg.c:1494:36: warning: declaration of `i` shadows a previous local [-Wshadow]
>    1494 |                  for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)
>
> Using a unique identifier for the macro-internal iterator resolves the
> shadowing warnings globally across all macro expansions.
>
> Fixes: 3fd4a8bb4b63 ("clk: renesas: rzg2l: Add macro to loop through module clocks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
