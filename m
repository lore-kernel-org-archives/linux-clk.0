Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56BC3A543C
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005425; cv=none; b=MDaRCVbZ2d2ewNDoNmutziXrs23IvGH2VIzPw3Rjt5gV3hj3imLPRdt1jrovTuH0Gf38RLCY93SnhgHGF7D0yFnDguZqVH1PEoJTnyQ5TjkxpaYUS02DAIzoWB5XuSTgFsYeIf0sUOCtIWV/Rj/QO+SmTFK7CnPBidOqyHQfr/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005425; c=relaxed/simple;
	bh=9ovGQYlOjYxK3plbHA0lDCx38GOv5tYaaRGjIx9Ah74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwCH6/kxQupwfb9BM4N7ZM4tkvNI3Du4aLB8nEo3AyL8G0XojrFQTkUFvCvZ34PYp8rU+MP9h9ofvBAstVpXIfXUBLFMBLKn6+BbebKGnIAPC2Pwz37mj+bQ4mA78qLiXD9W9NL1n/aSogDPmuV5EyI/jqUSsFeYipiQFMkgrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so913683241.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 04:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005423; x=1774610223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS48mKiSSOgr/13p71hpFJpaqE1/Y7kt2W9Pgmdu1rI=;
        b=Zy4Pw3oX5LNFi404XPfNreJb3/aDHzFZ8+KFhzT7TA6tJIbK515r0o3re0szjFHh2u
         /cQlNRpRdJBYsAQ2BFd/krvGwTv/y1Mr9xI4A0g7heGrmayyA9yoA6i7h/KEjz2F1y2E
         vWejhpjuP4EIYc4x5Jwi0JTS7j+xEC0gZYjq7KkmMK3MErFBeAB8LkBVCZhOHiOtHw4a
         ZPn1YY9ILkFXykoutcdF3Ujw7aR1wOZJqrL+rSK895fnMGbBThVvzZ344SbyWZiWQIRY
         b/IK3jc60/y+Zq/KHWcMOUJ5f8cb4bPi22xl5uELnmu52Iw+m3MYYNkyNny6ZtVcQz25
         OH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMgw+9jMHZ5IozaFY15TWtnplt9mH2NlZVZRXl7BHKlnIt+57uKfFTISEWZ+JbUsVwwCOtoGRojBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjDLFiEjCdi90bvL+ZcexBM2wOTiPkPtlR6pEKi66IFBL6mA6
	v1k4J6Vu15Fmyz5ScFp5PdCJLytbUWl0l8eoGqLRpidJufWDRm/5jnRggZiJLNc1qQg=
X-Gm-Gg: ATEYQzyX1PZp1I6x5aOxMw+Gw4lxNo0e6vTUr5DqMuAyp4LJ6h7lgma643KBez8cm96
	cmWMtfUBeaiO/7zjtHV5OnM1SU3/+zcuqZferznxuTrw3xk+giuPpcfh/G0g1fjppt3N6oELv/x
	dLuRi7cWdvQegybBxepwQ38g2+YbCWqsjqxiIa7QkfLQun0xo+IX4/Y4QLxTwuj+Z+tnX4MWN/1
	Tr+VtlXXEH+kiAQv3yXJFJd+oCIKVPOp80hCPYMAwc5r4n14GSzMiPSJNLyao0gLVEi9KVOtgPC
	IjiG6NMS+JHEMuUysBfksXnPdvFhPAg4lVoDSwzALQZ3jbxH+AVqWv9DRvadG0HHgHi9PgADJGX
	p9BD0lvbdcNbjCvm76z8CKw7wxLaM+c1lZSNwkb5YUdaBMHN9SU5zVfHNmGURB00uemy0bJpVrv
	90Q1xl22WD+qa28WGcqwZj3WwGWSHY9POsDfmHVDEVBLdiF41cb0U5u66QHHXbcV5uH5NmgwA=
X-Received: by 2002:a05:6102:54a7:b0:5ff:a4e0:194b with SMTP id ada2fe7eead31-602aeaac78amr1465183137.5.1774005422871;
        Fri, 20 Mar 2026 04:17:02 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af853b1dsm1004860137.2.2026.03.20.04.17.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 04:17:01 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6027ef7e068so1287588137.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 04:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhkdAihRbGWnxuU1cyi6TYebCslUPlXnJxBOregU0htG+1CpR/Ndh3CQ2SzZAb+FLFrp1HJJyz5Vo=@vger.kernel.org
X-Received: by 2002:a05:6102:a46:b0:5ff:b8d8:b40b with SMTP id
 ada2fe7eead31-602aeb16725mr1396805137.11.1774005421334; Fri, 20 Mar 2026
 04:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <b634c10e632fed07b5652c11de060deca27ead90.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <b634c10e632fed07b5652c11de060deca27ead90.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 12:16:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxUzTbABO4LXMKV3EVxYhBhFRnM4haxkhryypmaCL6xg@mail.gmail.com>
X-Gm-Features: AaiRm51HNwZDCeJmEpbXlgoq873Qn3LQLzzhwtaltybEWlaMXE_ceM8X-KrNbxY
Message-ID: <CAMuHMdXxUzTbABO4LXMKV3EVxYhBhFRnM4haxkhryypmaCL6xg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

On Tue, 17 Feb 2026 at 17:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable RSPI0 on RZ/G3E SMARC EVK.

which is available on the PMOD0 connector.

> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -167,6 +167,13 @@ rsci9_pins: rsci9 {
>                 bias-pull-up;
>         };
>
> +       rspi0_pins: rspi0 {
> +               pinmux = <RZG3E_PORT_PINMUX(M, 4, 2)>, /* MISOA */
> +                        <RZG3E_PORT_PINMUX(M, 5, 2)>, /* MOSIA */
> +                        <RZG3E_PORT_PINMUX(M, 7, 2)>, /* SSLA0 */
> +                        <RZG3E_PORT_PINMUX(M, 6, 2)>; /* RSPCKA */

I will exchange the last two lines while applying because of sort order.

> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
