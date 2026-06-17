Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB239F162
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690265; cv=none; b=fFktthTurTycRzecly0cn6EvDpiCHzY3pf34EDHZQWwM2AdiGV+bU//ai1rWvIchdotPgvHICJprRwfT6x+CnKg26sOZqjO68pRGzcTJ2BY5gZLiTLsHXeSN9sjSEmCvmo0n3F2yeCWqReC78kPLp2xoP9EAfAuMB0j9WXZcS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690265; c=relaxed/simple;
	bh=jP5ExbFfsnARbi1hQgzABvYQm048KE6u4XKnezIt6f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAj2YVO7IXAkWR4YLO22+kz+G8Ft4jW1VqoJq6zyYaZsCPk7AQjaLNqyzvgkGSNDh1LTECCI3aUaBTljSnsU5tJrbkAhWSVV3Z9b4cVJJb4EN74QSsg4NiAmSJtV6EobxVKcSgioeK3K3a0GJg+FdiWOPMTZO9/Aup4q5ELPRmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9667fa9a3e1so1739331241.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 02:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690263; x=1782295063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHipzLKixYX8/nI/Atoa1w9c10s6+nrRqAvRxdIc4Bo=;
        b=jjkL1MzoumtCX493yYjnFGVCpV83RWDDIMZ43hDLye7PZS8BfDS7w8V5DNC0XvtU+C
         w4lo6sCPdReYhsNvK/RDH/yxzJCv6AX0qBSHvYru8VHlMPyRGpIsBi8E6FDSoyONzhoz
         fQlD2mS8pdeS87ZgjaFDGJ2NHK5oGGg4xkLUIKpa3CyO8DIckCUlDaOzdy6+QYsS7n+4
         6E+ewxOFO0UDXzN9Q7oARVKJ8OpK/JRJG5lH75hKJPt0Op5cY6IN2gcdk4pti3sO93MD
         aAErH3R/mtxLqVXV5cNDm2lcnIel7FsuHoDJR0Yx+RQFiTud2KLsyxW98wRNY7pXVwKA
         Xs7A==
X-Forwarded-Encrypted: i=1; AFNElJ8lsjWzbcFIvicdgH/wJiLJQOpaxYX8MKMur/zk9AiM9nryHkloBmeXaW2HeyMLdEFLZ1d0CLBqQ1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOXHeK8hCQ7AASsLdYuVaSwFxjao8jC3ZMWbvxvF9xxJ+96as
	gFpCzOk1L7dSY3sWm8wpI7snIFZQerTyxMs2bmRuUqzK8QP8SOfW2E/DoBNnBWGx
X-Gm-Gg: Acq92OHtOPfz1E0oSnBh4WHOcyTXeFmTd5GSoU+9fzbLZOA4dcGo7OQPfPVXmujjoAq
	SBsJKZ+uUNdKjRVce5wGs6qdMaO8qJSaNvVyoxoCCC/6KGOS6qVGSiVlNkVla6qpzBeGw3ZzLKB
	5CafF94f9/9P0lLx+9J/9HjdB9z6Bv60eJCVRd+8xiUp5xYnIQeHWHndY6Vl63blrvlaieKYZG8
	ZQtszioSa8ZrGA7FcCigZyeXde0ANSvqemqmbmB9UcqjzT+rz8SAZvGUOID4AJZ7cS0erIlnYzF
	MHw/W6J2qVbV1R5v+9+ufeSOlWFum0heG/K6CTCf7CLMSmoJX/e7zbmTQQqNTRKoeobHKTptSVM
	FeYYrpn8ImTm6sNnRV1EVXk9/CAwErHtk8rN4w5Xh0SNsVDXlaRtrxA90BTBZh0VGh7udCTBCv+
	RP3KlIG+1ouI/Z63d7hCqRvfTnjMyYuhcevIIm6Zf4FP7bEciSDQ==
X-Received: by 2002:a05:6102:440e:b0:722:826e:1423 with SMTP id ada2fe7eead31-7246cef0d9cmr1525805137.20.1781690263574;
        Wed, 17 Jun 2026 02:57:43 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720847c15a5sm6521278137.3.2026.06.17.02.57.43
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:57:43 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9639130b20fso3192216241.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 02:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CTvPKY48xvRD6UBU9oM2n+JyZLOemdhrBzDrzyBIPJI+k4XAdc7D8orJsfiIYlah97RJxlIwc/oM=@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:6c1:85f8:29b3 with SMTP id
 ada2fe7eead31-7245d206e3dmr1531191137.6.1781689885289; Wed, 17 Jun 2026
 02:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9FpBQ+o+XVq3WbkWt9ikgHSwVC7EFm7pcQtBJ4NpqGQ@mail.gmail.com>
X-Gm-Features: AVVi8CdyHqrRZRx_CVpL2JiiRrjJWpJK494TwcetUu3aOvWoejYL7P2mBGPpsc4
Message-ID: <CAMuHMdX9FpBQ+o+XVq3WbkWt9ikgHSwVC7EFm7pcQtBJ4NpqGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in a branch shared by renesas-clk and renesas-dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
