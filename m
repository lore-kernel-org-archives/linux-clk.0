Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF1012B94
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133188; cv=none; b=fS6xhgPDaDjaM1C2KYjJx7Z66FAwAK59TXJq0zphEzZFcAhOH+cSL930NRzD9PSx0/7CCfM27gAzTIkoUjEIWxM6KPHvL9IPtc4ocefc6hDUDp4j8u09+cDxHfxbzZOFM76z/CayCZPN5QJ5bvzJlPbPzEDVr8aF/8PlvVN9CjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133188; c=relaxed/simple;
	bh=SM9VHBXV6TBGOikkFpTdL1XsyNkeAn7us1yu5cqpdvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXae840FxVccfqQnS6og9Vy4ulY42hTzDrzBmtO8qSohtF9dLjkmOO9CeIbtSrlhk7MvdgAr2qatp3us2Mn3BZBukWaYcUAdgyy0KerJ3/ob9/qrTRWma4RE/sg82SlMlskWE3V3LYrZMwxX3bXyEN1o3oqwyRmEnxlLoRYcQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966d4da9fa6so909562241.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133185; x=1782737985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WkmFP8EgfTBK7Rgts2GV0gt8NlsFBfLpTTFR4+sUd8=;
        b=cNvMR/ASyZjXoRR4JJRpDgbUzObzvOyx0lT5BQoZTUv1UJX/rWyAWhPj8/0F3b73O0
         9EprV0ePUh3LYmufGiJxyAjN9IxnSRWjkM5QmCveI8NtrQqc8tM7KYGUxmyNSpESoX03
         TIZey0B3ZknJ3UYgK7JdX2ZgeSAhXnk9kLfmTl8EuT4uGXIKyNg7MVgHMe5WSl26cYcA
         Oe+1RiyylvVtzxRDhQ9KJooo1mLUT/w2buZfXqI/8eS41ZQL4mBAyMyFktx998Vh1KEF
         /tstVUhhI1oC3tMRREa1kjA0vmNnVdgY5v8IglRaa9UhwggQDjxgItt7wj3u5mqsFki3
         fSoA==
X-Forwarded-Encrypted: i=1; AFNElJ8Sb/HOVjD0bRZHe4uYdzi91DgNp8KFoN5p+OOSAZ0IpcczywyojLi3wIZdgkLeyvr+fsb4Zf9YDqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwU8aBfDqWHjV/3ynvmNoPpinO02QoORbY0qqxIXZJGC7vJKEB
	q/zXOBLlomqCVYRXPtErKuvncfDS2Py9l17Jf7xeMeg1hqjurIaGmer6Kf7a4WTm
X-Gm-Gg: AfdE7clPsgwf4qcczTnY2zNV8bzAyJChppeOesJMC7TYZ7+J0bjilpSNTjafKiHnDNz
	g2k7AZJvEJGS6UJ2/88jOZDsf6whty7V9l27U2+moecYjAikascp0ICL7TQAc163SC5C0mzfRLP
	2SpxHD+1i4vtMggDu3o4iBoSthhWvtoVYJoJZbahlVQSGm6ZAbNC3y0FmzQbq/PMF8aZ/l8jq4g
	ZN0924dOusMqumTjAcGxe+35WkwItJwEBBhMNmy7R5JfIlnEMl4zd7KWScPs4rLDGmt6lQD3i1x
	pG2n+sa3VS65P5G/PliTYmiBWB3hLarXLaFdFUQ6+hyTr0HU3SOC13jM3GJZ50a4ephIBopZhJX
	IVOabfr9mOu2pBlWnR29BJaUTzBIF6+3UKQxA1oRRyXAxEEfcqpZ/lqTdYJQZBJMRNwS6Y7S/ql
	85cPndbkWJrIdruLUWHHE9kKuOMhBQxjFVTEnAu+bJXdkaMJK5Ag==
X-Received: by 2002:a05:6102:3e83:b0:728:89af:8ecc with SMTP id ada2fe7eead31-72a7680bddcmr6767205137.9.1782133185350;
        Mon, 22 Jun 2026 05:59:45 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba26ba1d5sm6015373137.4.2026.06.22.05.59.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:59:44 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6efdb57db0cso1243589137.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9MMob3jfxbDx+UyCGxS4XHPVyiVOvIhVhsEUHQnDyKJBHUIS8flFT2IkuccH61mlby1USei4etYgE=@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:728:3f9a:897d with SMTP id
 ada2fe7eead31-72a791ced61mr6106327137.27.1782133184732; Mon, 22 Jun 2026
 05:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 14:59:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWEmc8ihrAqBKc1E411mHk80t5ky6e4zvKPGwa2s0vtg@mail.gmail.com>
X-Gm-Features: AVVi8CdvOYFyC2YUihLVLYtBBghtLclJxlI0ynR5jdq3sSBLsDEr397xBO2_96g
Message-ID: <CAMuHMdXWEmc8ihrAqBKc1E411mHk80t5ky6e4zvKPGwa2s0vtg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
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

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> Add an input_fref member to struct rzv2h_pll_limits. In the core
> calculation helper rzv2h_get_pll_pars(), derive the base input clock
> rate from limits->input_fref, utilizing the conditional ternary operator
> to fall back to 24MHz if the struct field is left uninitialized (0),
> and drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
>
> This abstraction permits the reuse of the common PLL divider logic on
> newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
> clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> disrupting existing platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Fixed MHz to Hz for input_fref in the doc comment for
>   struct rzv2h_pll_limits.
> - Added RB tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
