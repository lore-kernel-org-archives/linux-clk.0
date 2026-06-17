Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE913F4125
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691599; cv=none; b=enZJfAEocxq8eWmEYbouYOxIIK9fPFp90FOMi6zatnZior0EqNzaD/7iNgMkfHRGIZ//o4qEf/oYBtl0PIBI9aD/Mzya+/8LLZnZBnzAZv5vAWRCYeow4rsvLwcNyBMtiHFXlIsy3SNkzZOmQmwWeuq1zTaJeyayoyf02G/ZYxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691599; c=relaxed/simple;
	bh=fhhVqur+2oyADwXnCGlIiz3wYgJIfSyj6S2t50E6LsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhQpR3wZodMb17eJ8QbUjlD7sOrHZu4KCAqKy2BBcODmNzy+hsHR+277S8UaT5dPkuaJeKGXPaTFcYccGo3iV/W/7bEgYDP17/N0VMYRTLH8YD9kN+Z2o5jprnAr0UXJVonMIoYTjUhmmktuDUu03icavbYDRVE6xyHYUXpctyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6c5ac3fa819so1864450137.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691593; x=1782296393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbhigZJZc2KejwaKau8dWpZN526FbWqjZpYcysnO3xI=;
        b=bPiTR4ncus1IbczC7nVJYC/dskSNKv1oLFDQq8S6YHs+5MnxkAFv5x4uEarJWuk81Z
         RurpkpFpALvmpcQmxRzKghZ0myJfh8Oq6TdzJWMANm0ck2VAMVMP1nI80Vn0SGbV0MFq
         wETUCtJ83k+EY33hri4o80/OJ6uZhTbjhGUTF0f0zcTLaU6zzhLTTrTeurhTNH0MmtG6
         3XG1bVGYMRBo4lnnT4sD0o3i8y1S8s6yU+hfvBhfTfMS8GoSRWjtfi6mVP3iMT2d79Wx
         Me5XX5Y51/TCDS+7sfqYsLZbZGEtqutjoKngDt74X3Fhb1voytbhsD3TjKkMj9J4m8Jx
         DNbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GJhqox1Q4N+2fv3bOFLB50IqeKZe2bOsTOKGVTw6uoZV8F2jZLDbM+0ZVymowPRp6/T1JjuuxjEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPDvHpTQSzqDcE4wYYcnFn2TS0OESe4a3Ion5rcIZm9F+pQq2
	JYvVUjMfsSGFBmlDOwYtNX3HSFDPxIxCIg7XozLJGkL3s7QSmW+EenTAABrTqesU
X-Gm-Gg: Acq92OGmTKPxlwPMBqRNvzPKkEIL57uJ+v95Acfpyt/21qS0YmkcmqHk2d78VW+om/S
	RTZmDx/dZcAYTmC/vfmbJj9s9ZF6cEbwVSc9L1ZhSNo1EBWwAd73NBm6S5kyKI6x/ZV0enDXRd2
	P8DRAs5DYuW+ETRxIrUj6FBuIMGvfIsseZ3T3h7oT3K0vzeGi+9+Q08DHqOZsV9BuL4EjaixBIC
	c0HGWpeBR5nc9qNqoX+THNOdQl6N0qp1bucAVj1WBQFvVCqbTsuwjIM8+glxQmukM/lGHvtbXB3
	mfADrOIjh8gcZL6811N05yc3/HNlUtXQYHWpfOJ03SO6/eiT25WLjEnMVVUJnf2WxpLgytjUOVB
	PcDgFbNTvY3o1D+nr3EM7C35tQwBMb6o0pkBu6Xtx5JTXB5PiV3/VdmuOs5gbVuvfqg9StjTjTw
	vHSAmHVQz1Z4N2ilwnG82slQB5V6O0sRXejNEJkTQpoOdcAH+WIA==
X-Received: by 2002:a05:6102:3f8f:b0:633:2389:3a82 with SMTP id ada2fe7eead31-7246d53574amr1482592137.28.1781691593554;
        Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966ce0beeabsm2373505241.3.2026.06.17.03.19.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so1210195241.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9S2PKmWy6OpHsJ7eMnFoMCkWm4jGpUBsexOW6SGhGUHZ+ca7/suiR9MF9GlIcLf/rRNeyzFPC5EZw=@vger.kernel.org
X-Received: by 2002:a05:6102:f95:b0:631:af51:7d8e with SMTP id
 ada2fe7eead31-7246c886ef2mr1476763137.17.1781691592901; Wed, 17 Jun 2026
 03:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:19:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
X-Gm-Features: AVVi8CdHxDV0xPCDU1TgXe-cGUQHmtLwiKcsibD6yTiuMTrRlEAumDcsx_2I-f4
Message-ID: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC
 clock ID
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

Hi Prabhakar,

Thanks for your patch!

On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC)
> on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> Note that the LCDC_CLKD clock is utilized as the operating clock source

PCLKRTC

> for the RTC IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-dts
with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
