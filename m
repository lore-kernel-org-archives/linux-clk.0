Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174663D524D
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878231; cv=none; b=YlZ1kzYylHJZEXdpb0yk7z24wu2ogdTKNm+YRQ2M3TZKKT+X17xAvN8dRsi+Orx80fWMDXCuCkHazyuRk9lIjrvCqxd/fFyG47HArF8jzwORV3MnwIumuaflibM1uDdN8PenNlkMS/8jzPu+B7wW0ktVrpTQpYSWctdG1D66DWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878231; c=relaxed/simple;
	bh=LwY5xmZY/IE7X0h8PDYYjDasIhhiQ9s5H+/9EkzpTUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQznK7f1i9wSQlvYgnaXZkLfP124gD4Km1X/Q1en8oU2N/seeJbtp3ekBPmWH75DUaX3D4+AjhCahWOXr73oU7g1dErpUAaPkALYRHvDVqurBUMsStIf432mpDF3jGAuBxqCOOQ2c/HJwmYaYYg73Z6Q3YCcFi8CE9eZ5BSpwDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so1455323241.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878227; x=1775483027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zojjIrplT+gpNV1OAKG7fdmSOmBuVtlnIyFAXOobv7A=;
        b=rXufumos6UC+3F0Rbv7dTkAsQuR8CCwYXCAl7K7cGZzPdG+yIkqrZxRCWjd2/avqRO
         cwQrfD8ph1H2BmiiI/hpeJWJzsgc/9pG/F2Q2543tY0AmSQWnX3wfOYByiBfNj+0d8xq
         ECU74wEReBNwNWqbj0I/NQ5saW6eGC1uo4p5yYJwttK2OmRJPQecOdaTQp1VwwYaB4A/
         uxa7u1uSSgZaUWxmMUN4I2qE3lmL+DYQ3LVV5+euuuIkD6q9awUMurmVdkGey/ybOg+B
         wPmZeaKCgZZNpZhAffz0/0Vp9hMAYUCCtDPewkT5e8Z/6CpqnNzLpSDQHAkRgYVb/7vh
         BO+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZehBgc6CG8JNsZJRW7YqBaqtPH81v1aSteb6mpmp6RBahHtTWKBHoeE5VjoiAhPkp5b3Bt63fXcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YywF7uQCMlziVSVd2sabyESpZrGTxS5A3ml5e6PFThYiTai6PU4
	SMr8VUfb1ixXjAwgpRV0sYLHnp5FVjrqrUM3vOTrmz4xZIxf0k2FBP/xB/KdOqLz
X-Gm-Gg: ATEYQzyUK/HqNW5u/Prhw3LjliTF8lSXDZ83hpOJ46NXePDUMx7Q8ooDKoEWGZvd1X/
	bsRjYLEbD5AYUAExcKxH89Qiwr5LoSTwIFQ8UqfBzFjX1eGH+n4Rgmn5UdR8HfalNI3Pn4HazeT
	oDbHd1RtzSzBZGzRgEMZaiheX6moE9Xs4ziiKV8Yi5oiw2CYXm4SS9Ljcqo0b65f04PWn+o/6fG
	Ki2u4Qx9aW0E4MQd6EhkZ62HUvnHP+pz9xFtgc+HI/bHJMQmzDPMMoGBTU9uVNEFcsiNLxFBVfz
	+8v30kIOGQixilT1XK0aeMUmDMNtEwirjnq9jh9Y8Seu5Pojc0w7y2dS+h80w+FvDjJ9ZvwlkEI
	ET5TsTrQ6qnOmBIYWI5ru1sX7jCYul0sb//LGyszlTHkSn84DMj1ovz3WWon2CslsEsOaBEDizp
	6xujqKpiQvfEkLIm8uV+rfGfMGra/NIcTRq10Khl5etdvvYOBS20pc4VVSkaQxkv9KZC6YAdY=
X-Received: by 2002:a05:6102:3fa6:b0:602:7881:5802 with SMTP id ada2fe7eead31-604f90e1c3amr5409888137.13.1774878226627;
        Mon, 30 Mar 2026 06:43:46 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e258601sm7029089241.3.2026.03.30.06.43.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:43:46 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffc8987050so3669687137.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEkyswYz5oWedf1NdthzNxgJ+X8XG9d3wWFVZN36a7UqVPOb/gn4kbUzED/h6P0OAlB0/vepaAjEs=@vger.kernel.org
X-Received: by 2002:a05:6102:26c3:b0:5f7:307e:80d9 with SMTP id
 ada2fe7eead31-604f92dc7e9mr4671146137.28.1774878226000; Mon, 30 Mar 2026
 06:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 15:43:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVo6ypHJi9TVqbc+wAmFDU==HQCCG=hEOXuk-66GPXUhg@mail.gmail.com>
X-Gm-Features: AQROBzBtp_yzyGavzy6mnYDxA573W6U-3D6Ay8n3dxuZTqDsa4ZE-WFADhGn73k
Message-ID: <CAMuHMdVo6ypHJi9TVqbc+wAmFDU==HQCCG=hEOXuk-66GPXUhg@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: renesas: r9a08g046: Add {GPIO,CA55,WDT,SCIF,I2C} clk/resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> This patch series adds support for {GPIO,CA55,WDT,SCIF,I2C} clk/resets for
> RZ/G3L SoC.
>
> This patch series is depend upon [1]
> [1] https://lore.kernel.org/all/20260326110648.29389-1-biju.das.jz@bp.renesas.com/
>
> Biju Das (5):
>   clk: renesas: r9a08g046: Add GPIO clocks/resets
>   clk: renesas: r9a08g046: Add CA55 core clocks
>   clk: renesas: r9a08g046: Add WDT clocks/reset
>   clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
>   clk: renesas: r9a08g046: Add I2C clocks/reset

Note that you already have submitted 60% of the patches in this series
as part of other series...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
