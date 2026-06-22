Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E393AF64F
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133240; cv=none; b=BvFI63iTWX+/sVKVBIzez4Wak68/+Cdnxnh60Uu2AdxPQ/7B8ELKAoqU+5QCOUm0EGTcHk7PtWIRbXcyRtU8/d6t9tcs1QUeQSaSINo1xUnJ1FPIiTQrTSOQ8i+IzVYv96IlGWmZHOUH+FoJADlrYP/BfiPmyw1KYzC9g4Gx45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133240; c=relaxed/simple;
	bh=Ja7rWk0kCQqkDheHxLEOplvsTyShM6xX5CdHdSjeR8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvM9aIpC5y7z9N2CkkpPmkigbMXCi0tB6xkvRn4eHRvGh6tP4I4cO8m0N7QQ/fwJTJj6VJsGW3hW3aHHYTv6vkPIBnVUnY2/F1kf3xozZd2txdUEelexhw/VGTvKSLeKHppDOKJxKBanzSPo+qBsfme9Ct6PYRR6W47DS+3qNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6cfd17e9250so1795888137.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133235; x=1782738035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XHozepz9cMj0FQe/9LKFDJUBs+Bmee9aT9l7VnUUd0=;
        b=tJiZkKHw/vMLCSVDxDztlMnThH/pM1pj3Jpn6pMti/PrQsa/R/79kZ4auJj2ymUggN
         YBoJqpNq/WyhwwFtBouPzjm3smYx1KasQ6APnuD5xP7qZdxKNX82aHrfrqIqMraR3bzK
         g6P2Nqr3MzgK/HlucOfnbK1jF8VUDl54dfoKpZo598Mc7Y5Ml+eo3BVI5RD1Idh9iKAf
         jBhYecFPjHdugxnxfWq7fU2tYh9aui4/r0HFRX972eHsEqv77h9Qu7+YYUbXDpRrMvDB
         NvOjOurfHHSm1uPIf57sZGL/RU61TDuXk68Z7tFUNpkGwjvyudtu7BtT+nijtH8w0wRS
         YpOw==
X-Forwarded-Encrypted: i=1; AFNElJ8TwLXdXmHIBEHa4oHexRalDUr1DiyMc0gCpTGkFQnZKgej2eRPWy9ESU/VW8auGI1Qir9kpmrtplM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOwzPd8zOGv+/t1kGZo/YEirf4oyfrG21FiYmWhDdEbEAJaMa
	7SdsXi4Zs76bxq/1CiEQQUPjLo2pXtJsIVsHPUT5KbLNZkX9yRxTS/JyMzbwNKSL
X-Gm-Gg: AfdE7cnzhGpQGMLMu6cV0nfU0fLbVihGrc9r1ilWruQJU5MOwe1plnzAYs/lMyoDgW7
	nlPXYfIHiVPCia+WlrV3kxMTu1KZJYSQEuThXFyhHu2Jjxff+NQjElQm9srS3kd2cV7/MdSKl2S
	+2k7L3L5Qur7M4AbNva4c+1wp4tqiAawVnM3GqRh9oBLB8OnJTq73KBMfZm1I+s9NvtHIgTdgJ5
	V5IHrVYFNAJ3EsDvZ9Sy5iV9p1Da5DAovgMGQawump2wYf2OARynjNeWcswfA9q+NUv24J3Ykbi
	CSYmwr5E9UectBLTK/z8jeq2oof0BQup91hwXdTDC2nIsWRKlgX1lwi20JpGZPqdF6QqRp7Urdo
	qEoipCkVkhaWPbG/VdNdbmBmG7GhsrNfzIqAOvtn+kBYzUJghB5ng1/OfCcIW45RpM9UpEZwGHe
	KxsEKcPC+JM5E9aODKIWuUrcLRVHzRlWOVGSVCVAm8zfcvzBUG9PsrT3H1i6nE
X-Received: by 2002:a05:6102:2906:b0:612:21f8:5afd with SMTP id ada2fe7eead31-72a1d8332cemr6436595137.12.1782133235104;
        Mon, 22 Jun 2026 06:00:35 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba4f2926dsm5839391137.7.2026.06.22.06.00.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:00:34 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6cd01f6c11aso1433533137.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9e0wPWginvauTN/H0gM0e7sppHW6K84B9DTK22sc5i1VXUvXYYJ7mMCOnkL0v0LGgU8z1BAbobwSE=@vger.kernel.org
X-Received: by 2002:a05:6102:2906:b0:612:21f8:5afd with SMTP id
 ada2fe7eead31-72a1d8332cemr6436185137.12.1782133232462; Mon, 22 Jun 2026
 06:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:00:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcxQDzLDcmHwG_1VEnqCWs6xpusgebVoE96xNH4Jrtig@mail.gmail.com>
X-Gm-Features: AVVi8CcEKrlE5nTeAmO0YRJa0CgUPIQw3Lilj3_INcW21kOCcmviS8lE9_08Wos
Message-ID: <CAMuHMdWcxQDzLDcmHwG_1VEnqCWs6xpusgebVoE96xNH4Jrtig@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP
 delay logic for RZ/T2H LCDC and RTC
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
> Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
> satisfy the module-stop (MSTP) state release requirements specified in
> the RZ/T2H hardware manual.
>
> Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
> reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
> (142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
> being released from a module-stop state.
>
> Implement a conditional bitmask filter helper that switches wait
> intervals based on the packaged module clock index. In
> cpg_mstp_clock_endisable(), the clock index and individual target bits are
> known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
> where individual bits are not tracked, pass a fallback register index base
> (`reg * 32`) with bit verification masked out to match on the peripheral's
> register group block instead.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Added RB tag from Geert.

No need to resend queued patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
