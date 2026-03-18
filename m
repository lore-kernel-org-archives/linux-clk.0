Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698D3A2553
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849801; cv=none; b=NCPJTYI4xQSoUkWW2jQDEn0Gmi8BcbPzCgwxBSTSF0F9FQvwVHFOPcxokPZcLgyFYblSV+Ur242oPwQhzCn+fPoPMq3NBnefNt22QDeF5ka0Tcz+6hsucvBdm+cxOOiiMdJERG5W4KXp3R7QT5kSU3W0bDnJ1O76b2uXyOHb5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849801; c=relaxed/simple;
	bh=XVuxTIuxemn5HdUQiQr8DhvvEOWckmMMrPQjvcKJhm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3lC01RlOdakCo3ethgoGV8/ntSPx72ck4SgQ7C5NbimYvjtdxLi6NdaQ00KGGHsyHcOkn9zA0zkRWjTV429XnCdQCiowh10S2bT9TXGoTaMayYLMO1AhRltw3DQqFtNgZC8a5qCWbUCwXylwt3cf6NdZeE9Vdj/U1AA6MfRVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso6669096e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849795; x=1774454595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo5OHzsqXu4hR47Gp7Kdyr+G1caq7dBmUC13A5J+n80=;
        b=kUd2gZF7pcC2qqRrj2S3UGbfLSdKogdHyUBeGdszQ1LJ2NidV1wh/MZGyrn8IrLWas
         oFil5ROobm8ass19V8FFjvuEHPw+2TYn4TCGdcgXHdufhou0GhbbMA/Ib/drJDCTwUks
         smjpM+vHm8CaMl+OI6NJ19jllYi3Ggg0Y+Rf5cqVLQvFaL2QPWvFpuLPlpyyxfuWtDUw
         Jid7kVPB7LdiWSFRxqJmbZV1sQz30ALeQYXXKmReLuTwMie/2As6T5KVB9I2LgaKB9sq
         8tyQVGwDJj2AMD9rNjYUS85AHR22PdMWX6nEzVzIBpyZW7bn85fW/RmJ44sP6pbwj1rH
         QP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+fb9AFWewjxYZB18NnPDTg+BUSvHSdTh1FBCCZz86y6Z6Kw3oyyzKNG8vakUdsRisJSgD2K+Obik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxleli0KkMv5/266LFoE1IZ6r3vOkyOuwwAsrkICNon6PXeYXrR
	WyZEsjJlZKQrUCLEbVxwCoi1Dp8HeMMhGtWKZqZMHYZt9eH4ZjtiQ/V/v2ns/HbsxEM=
X-Gm-Gg: ATEYQzzBqobrZR51TTyfk6HWRNrcXnpVfeIKw+Gia+MoX1y+PHm4iWY5Dv77J9iGqTY
	GyZHMkFFyQMxHtknBduXFNtxDKHJ3/khHZbPxZqBkYt6+13xcmJvTNX7rSnf94DxTprmP5EZffc
	106hvpT0nAPzzRPTdML2oF2COfXheRxcCLcjU5BizM/oFFwfBFsr4h6aObmGvLe1euzmhJ/MZ8q
	Ut91Nqa42+cMvKoGw83oRSwuXQlBAUP1wdeNZBkMIOS5R8esIObl/NMnjXdC6kwfjhXaOjNhKOI
	nTpElckX2rvJmQSEwXYn9yTuuMw8piz0ea+y/jUb/GwSHrKq+ilXygUXL0HNqYVym2FIHCoK2hY
	LTM42Kof6dd3dEb7EQmZRixIGltzm7uWlH/8xmfYolA3E+D+aq1BYyS5Xc8BZ0Dh+YKBgt2rSoR
	MDtuy1bxidOArQUJeJ+wMdubxnrsyC0mSeRRPnSpqjWo4khnW7f5e1yVg9khQ8
X-Received: by 2002:a05:6122:88d:b0:568:c905:2e68 with SMTP id 71dfb90a1353d-56ba70049ccmr2581858e0c.1.1773849794784;
        Wed, 18 Mar 2026 09:03:14 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6fed64csm1813392e0c.9.2026.03.18.09.03.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:03:14 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so3777794241.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4iMh/kBvoymrsGEvfpGD0bOLhtM1x+AxOhKrY9t4S/eoqdupMarO2UAL0M8V241xpMFg5ntBg7qA=@vger.kernel.org
X-Received: by 2002:a05:6122:2521:b0:563:83b2:ef2d with SMTP id
 71dfb90a1353d-56ba71e7eaamr2380106e0c.16.1773849792902; Wed, 18 Mar 2026
 09:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <ca59fdcc6c32b8f6659aa9218f1a42d2bcd258c3.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <ca59fdcc6c32b8f6659aa9218f1a42d2bcd258c3.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:03:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-DeV5hfQAqK=ChxLATm+S1MjOsObYsssi4JFQmwn5Lw@mail.gmail.com>
X-Gm-Features: AaiRm51eNz-z-fsHN9TtWH7481RQArMChCwXzqF0AFf2HRP5BqKDYm-f9uccbZQ
Message-ID: <CAMuHMdX-DeV5hfQAqK=ChxLATm+S1MjOsObYsssi4JFQmwn5Lw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g047: Add entries for the RSPIs
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 17:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add clock and reset entries for the Renesas RZ/G3E RSPI IPs.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
