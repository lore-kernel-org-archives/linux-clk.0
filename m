Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321C400DF9
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661355; cv=none; b=o/QfVVIIx01mWuUkG0GlFvEH0L+6jnlwBUhTmXHSYn2u06d5m1vkXuaMyJ0Hr0ySiHoejMbATidOWp9wwO7L3nG2XHIrNTF1I7EevI03nTi8yb74maSsybGTO13/LqiylrhqnRwyYVoA6/rnniJphQ5Fyky43JCPjZlAgORj84I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661355; c=relaxed/simple;
	bh=vTlIBThix6p5ACZNkCu4XDSKPza1TCok1RZWv9Vcpu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcj0kgYWivQs6Zc7G420Zfy4pQJtQVxBBIXgjctj5h7xoMkWNpm5Ar4Ktiz786AA26LYIyc7YkR63pj3262r1yAee1AK16aR7WxYv0zr2wblb/ict3By3ByC5bvMxyNnbkMIzAYP2Yz3jOL7mQsKA3cvfVDcQ3JDdE5ol9RtQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso1393985ad.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661342; x=1788266142;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oIDFWZS6RDEUFbtSxS2ibtPun+j6l9sII3nkgLpimSA=;
        b=S86dZN+cR01qbhTj0RFKeA52eZhRNswgFN6KEH4qw15NjId/eS0O2ooiJJQ4KG8O+u
         oGP4JJe6w6V2jAQGPgskXb1+5yfIM63J9mwhZStmrrs1uQmW30+qtyj1PNuqj2NjEf7v
         mispYcGU4FW3CM9HkzMWOQzpkCg70wbvQQgdhFYYM6PSw88Ug/cvsRgWwWeMkBB29c09
         qcKkGrfJ6M/2l2qipfQuTVhhfKzdiNCLbQ6pR4GDuLvD5BoCyrBeFvxMu+80TquMFAe1
         RlHycV9j4YwotPE8wTijwwn8vrNP4677yMxiYGwdJdkbYJIW2W4fF6aGjv1SUdSjf6gw
         DT7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqgaDrEUSMaNlCeJzrNunkT9jV7ppiIStupBY6xZrznrNdOCoLbZJEbdUUIjEow/2PW/TBMYSAllYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lMyGCnltBiR5pWuNdbYaYj2l9o4e2cK2RxPedkjo3y8LgBnxlY
	2kIrEqlcYAR/wPGnbZ0FdHDgH9ROW4LUKJSrMXeKAgYq5eTCwREXuFcY1v+O8QEgTq0=
X-Gm-Gg: AR+sD13TjScjA4Ti3G6w1+x0TVW/oUmhfxQiMpcjPsHSCwmmoZJmF8u5EEbCMjGpGR6
	heWgUSlo5Re/g3jxXvDZ44GleYe884/J3oObFo/ZvqrAcNkTU5x4Qqkm6hQH5wECVEke4X/Vc/p
	g7dTvVE27OwgivB3TfEn7gZAuB+k1m90Fmo1/xUs+6K88w5awK36mDM+e6lksdqhEXbHXyneraj
	rDl9v5HOLqRsCQbPMoX7fNc0P/vCoh4AMchN0XzWekA4u6Gli+LKStem2/dvcZaJCU0ngbMT4Yd
	XrmnmanH3y8YYm5GETU9XwsN5JZ6mLwEmTPMEkoyhFPDeb/YKtA2rrnGZEAHP8GrwWjecBKUC4I
	EtIgqTnung9Nx7Ueo3SYid42SH7fV+jhuoyH4eKIIQpE1sbsjfaniNyw8lsotdAivIj8Fg0eAn9
	zXQBKpoOtFZ7aEjfme+t6oraEAjku6OpvqKVIWElPY57VHnugiOUbPNL95uNJdYs0hKVF4khAm3
	/RZSqlUZCq//tEuGaszfMe0PFO82A==
X-Received: by 2002:a17:902:d48f:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d670b85236mr409515695ad.4.1787661342545;
        Tue, 25 Aug 2026 05:35:42 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761beasm27377475ad.5.2026.08.25.05.35.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:35:42 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca7c1176317so3956378a12.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOmU53mDdbgvMXhwUVvyi9oH55MMZANd19CkQzWhnaxEnNdHRuwTjMqNfwi1mvN1Bg/2lfOAdW9+8=@vger.kernel.org
X-Received: by 2002:a05:6102:956:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-77bd288c901mr8408694137.11.1787660869267; Tue, 25 Aug 2026
 05:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:27:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyq0pO-ZDMiSx6k5HoT4Y1W+Ov2KRWRr_OCE_ng8BEVA@mail.gmail.com>
X-Gm-Features: AcwNN1VVA1JsDEFfJkQvCcAZH1nZvL8L6xNDA-rPHWfx8tfe-s3NaRctdvNNt_w
Message-ID: <CAMuHMdXyq0pO-ZDMiSx6k5HoT4Y1W+Ov2KRWRr_OCE_ng8BEVA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: renesas: r9a09g087: Adjust CPG
 register region sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Increase the size of both CPG register regions from 64 KiB to 128 KiB.
>
> On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
> apart from clock and reset handling, it supports other features including
> clock monitoring, write protection, and peripheral configuration registers.
> Expand the mapped register regions to cover the entire register space of
> this block so these additional features can be utilized.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
