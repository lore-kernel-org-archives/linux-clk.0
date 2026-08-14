Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EFF46C4BF
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710797; cv=none; b=iUY+WfNUrFUCyCPFzIeO3Tdufw3Ga7rqTnJlPj+nYDSzWYm00uZZjZzewPgof+6Arue23nlGXalzwnb1eZl825kH3PYCMublx/3Gs/Sez0EfxROT3GNu3XpCegXh1Qajg/G19nSeG1xu5qQVJOVIEUDI7PonpJANjc7LDZzHHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710797; c=relaxed/simple;
	bh=lpDKeu4gnJGfhZbEt2GaXRuJjB5sw59Lf/Fn95Ptb3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhvUcXHJOjWnPKV6j+2yu8il0HR7bqJFslRoWSW/lgDPoyTHy4DUjZJyXOJLpj9lSBkxMX20GLHXBxcnDOmnhzCnPPi4B8814Nf3NIHtaLLHhWTaY1H83WwJXMZSSSbH+1vt6nxNTKtFSn9Z4MEhvalMLh+XtvFTsFQsgjbKl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c26d7e951so157699266b.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710793; x=1787315593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GbV4OWs8XFK7SLn1+udzJUHUarHLrWsKwUB5GORF0Vg=;
        b=DiiRWzUYMT55k/zxwSEjUlUsW5TFko5xWXWSWcryBCs9fXmk1X97tT5U/2O2yypmBT
         nXAa3vZKFvMI5kGEkc6OsbnRO+qNq0Uhp/tQf/3EcqcWU3+5z3/rMyml91aJg6/A+MeL
         rzLls6PQVPI3KeroP2/rH3xoaB8k9bPRHbfMJK/yC0ozd3YK/pRCmiQhs1kM8AuVZhdK
         QC0JD9ynNTO/04YOZHR54OPDNYxzcY7ZxcUsvpftFAOS4NaZltd/z0ijl0nThyntHLrj
         VsQxOXJpWNtHZ8b3VXjsqKynKGIizPIGG3dmzaakOYryGMsTFyZ0bqHOYDS/mD97IdjJ
         jJ6w==
X-Forwarded-Encrypted: i=1; AHgh+RooxEspDXiTcHdc0uJgl+e82+wO01pU0VK5HMi/7AGa5Ji4D8RGLXrlHMETOZdNzJTX6qyJfHHiRXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdh/EE6vcvadPEWXYk7zbiMaykpHC7mOkbugkC7I3T3Q7czz4f
	FcYEbY0/Ef6F9rva0nw4tOuGo9X+1tHHASttxWDI00H4vBB8kv5krJiSav20al9d9ts=
X-Gm-Gg: AR+sD11bx/ZrAuDneT41qgWEojZNkGl/O5iyIJFpOohz8pe4UvYY50IbgPPGBvlMxrg
	a8fUs5b394gRPG6fPUr8UxHzu8Gds4tiyYKd4xmYGEZA3hv6yr6z8f/huWE8USnbVP1qVX2Y+Zu
	c2JvdXFpGxrZY1CrKUhjaCK3wzSCENs87PlLRsOIoplSApAEjabJZTRG+/lqD3emo6c2E1TwtLF
	6jfPxzQnF9l87dF8FuGoUgyqwTv32hHDRg6m5R7/++dEjrDAT1nKkAW+pK5Alx5YzGqsFQYvqmF
	kJcz2T9lmtCNJQMDvaobW8n+edTMhsipEhenBTuVjdOzktBYOiBM9hYqiBJusU+CXgKLX7EsFhK
	IBbARRYaBDQLRzzqRATSCQ02D5C4TjFv49orH3L8nauEaXvL4Bp4+DHfYtl14Iiq1LHCiVuyahU
	q8m+SqYUSBYek0ikuaPOXUfLQrqPSgVydPSCg3jJE/iIBVMrHMdrafiTCJeM5HzAE4TM+RHFSvN
	74H1yU1YZnqLx/WdKQfI7WAwA==
X-Received: by 2002:a17:907:97ce:b0:c1c:2c32:1163 with SMTP id a640c23a62f3a-c212aa88c6fmr224230166b.25.1786710792566;
        Fri, 14 Aug 2026 05:33:12 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234b3feesm106568266b.14.2026.08.14.05.33.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:33:10 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1362439a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrVczqL2BOIIBSYzvp6nX8JTBr6h2NwFUSJ9pV15YKqT+1j5kfCx/o09pYU/Mu1BZ2GvAFAw4n+VpY=@vger.kernel.org
X-Received: by 2002:a05:6402:5484:b0:69a:a4cb:2882 with SMTP id
 4fb4d7f45d1cf-6a38a8ff103mr2505014a12.9.1786710789414; Fri, 14 Aug 2026
 05:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:32:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNZzMYgCcMCnL0WFRu6Y2-64msBsaMc+EUmTK93Z7F2A@mail.gmail.com>
X-Gm-Features: AUfX_mysmNYT0DocB6TyyIzLkjU41VqoAr8h9dGeeAp5etkkWrmICu7IwdklYpo
Message-ID: <CAMuHMdXNZzMYgCcMCnL0WFRu6Y2-64msBsaMc+EUmTK93Z7F2A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
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
> Rename the 'flag' member of struct cpg_core_clk to 'core_flags' for
> clarity and to better distinguish it from mux_flags. Update all
> users and DEF_* macros accordingly. No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
