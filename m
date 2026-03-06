Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C11226CE39
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800545; cv=none; b=oyFIUG6VuGuYnqMMp3lzXF87qMVTdhldcTZpuFZCg4g4f2EM9dpO5ogaSpvqizv+5X3Pjm6Fn2lEbCXxZZqOHonnTMP98zHuH9BY5mWjGxlC/ISIuqle//IV74LMEHkAV44LwN7LZkUJpG1rbYnbsNH6DL8maGB5w4AXPOKnlHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800545; c=relaxed/simple;
	bh=t+zhrRtHdxJ0egPar6qDHLUgu1o7nIbY/t2grbrBnTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFIlWXa6iy7x8fidt79W9HPT1LaFo1PsIeRz4hmwxTQVy7is7qSrUDi426JFbDbqpC5NKm9QuS4gAPoRsqW1Lfzw6E/hkMdYo5w1u1kQ6oZDHSiBQuaI/2kSMwiMK8rg3SnB+teFdZTfD9xzgMnlsRR/wbL6lO+a4YIsPZoiWq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56adf76631cso1548766e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 04:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800543; x=1773405343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96m0o8Clxl4fOeYKH2P2MIwu6gx/EjFZuUHZ+Kn4U/g=;
        b=C9rp294pwqyoUdSk5sek+DKaQpuuDWC1jaw0PYB5AnkyGfvkJ/GRde54GYrAZJIsTc
         9sFQ6c5DWx/U+/VVrYrnIDNvChed2DxksvyYuA9ONawyifATRpLRQrr0r+iVqXCafMl9
         sOS/bqaNWlByP5rj6wwh0mj+O115+IeqildqzbgWDbrZbOx6yHqcT93cDOJPRIJIlgvU
         usCDT9AqX1hWqJdz/SR4oTYwOUApvFE7guVTUvjMKPGzYWzTLqm7J71MuThDLXas+ruk
         nXru/5DQ1yVOrWzgbX6qigLnwRBDZOGukDniZJOWhepdsI8OIZC2xmgNxCJHLmGzWkNO
         +Dpw==
X-Forwarded-Encrypted: i=1; AJvYcCX1kWha8pgRXc09Wl/FjpMy9l+L+KT1gfQMxaiqWIiKzF7NBPrCB/j6Eezg3Nww8N8IYbs6IcsuT3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEUR7IfJ8vWZAoAS+TE3KLCDXbqwQCrpYpLpQxhefZRW2/IzV+
	Esk+hVri5KzQLyTWyBIRVsaQUvQCsV9Ds8VvCIH1x70P1xP3ZUHbNCDjT7ecKV1yWYk=
X-Gm-Gg: ATEYQzyP2ueM0zk+57Q/Gv++acRF3sSYyZ/1ue4SG/T/ayFgvGoEHQeySekrYvtR+ho
	miVm3Po+VHxvE2slwMempVyOPEC+9Sd1tjEOsUIFBgKwaEfIRx1er/Nm79pRFcLk2ZXqB02EaM6
	xEwto+rlYAxPPB2yelBOOJfgwBgtdBhJUGd5Y5zy4/o8rCvCOkkZOYWhPMJ7EnkmWDeqfDOpEr5
	DAvN68GZixDkI8eWcp20l4jhym0zOmUqCjS5PXN/i3H/1qeQzFDN9277T1jASI3WQyi5szvcYxI
	1qi2YKqn+5ayfplVaeUjV50s11k8vGwKzL7lPRnb+vksoaOaz6T8AS6q+UakDjfi2B6LDbxRM+I
	Dl6XL86SzAM5l6NTkq5Yp+O6FWAGVF+OBvXhc1laPTTgPypuhbb7Yv/jmaloauTSg0Vl/tU28HT
	ivglQTyoKZA7FyqPWCFNGFaE3qo+siNDefIPO2EICjcFev8G28F5LntYGJsWun
X-Received: by 2002:a05:6122:4d0a:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-56b07e73ac9mr506097e0c.17.1772800543084;
        Fri, 06 Mar 2026 04:35:43 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b1f5f6sm1298960e0c.14.2026.03.06.04.35.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:35:41 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so2056899241.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 04:35:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpFIaikouqCDA0NX8RJEyjo4P0G9OX9c7/NPkbSMClaHKGmTghi42rK9AT0y/8XCoEm3DW84F0OJc=@vger.kernel.org
X-Received: by 2002:a05:6102:2908:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-5ffe632e0d7mr598649137.35.1772800540255; Fri, 06 Mar 2026
 04:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
 <20260125192706.27099-2-ovidiu.panait.rb@renesas.com> <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
In-Reply-To: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:35:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyo3hYbWYzdYUUzk=OQJzKn4Q4DdxXZi_0C2zH_goK3w@mail.gmail.com>
X-Gm-Features: AaiRm526yeK4Pkoal5L7g4NriLGd-kQ5uifyBQ0CVN8Qd9yNZfzNgOUcuHaBmPw
Message-ID: <CAMuHMdXyo3hYbWYzdYUUzk=OQJzKn4Q4DdxXZi_0C2zH_goK3w@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 16:27, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
> <ovidiu.panait.rb@renesas.com> wrote:
> > The r9a09g056_mod_clks array is sorted by CPG_CLKON register number and
> > bit position. Move the RSPI 0/1/2 module clock entries to their correct
> > position to restore the array sort order.
> >
> > Fixes: 1f76689d1715 ("clk: renesas: r9a09g056: Add entries for RSCIs")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.21.

Promoting to renesas-clk-fixes for v7.0, as I have other fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
