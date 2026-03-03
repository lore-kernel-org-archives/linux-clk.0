Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13852253EE
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544614; cv=none; b=qgI9HNlapgk0pdaIXRSh4l78OmtPcfEWQWGgq/XW8Q3WPbQxsnAJ1iieXbTAewK0qu+3B27HakligK/Rya1BwbJ80MXBnJgrwqW7clHGNaO6G/ouNpiqiNzvnkWlecM0chO6sEDBD7G1wnz2b7fc3jTYZLcp2XlYf94ndiVTHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544614; c=relaxed/simple;
	bh=237yIWVIGSqP8Nr5OxXm6vlm1rkrjBql5SlE9/8gnlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDQLRrGIKETJrDO0d462gbw9D2RXJOG0NXAeZKlnLxldGzJNqqCbG7tZIjCD8bYmVvQ3CVbgdLx+400/IMe7B/sPJhdOU9HjKz/fZTjqQVu09RxwWUfYbo/K60OM2MBXwiCc7XmWa/74L6EGDbI9xkKQoABF15US36mzSjXgVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5637886c92aso3033302e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544613; x=1773149413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAwQLMiHJNmA+WgXHi1U8N28xuUzy6H6o/lizldAOqQ=;
        b=oSr29d4P+GGOm/gd9F4OX5WoxLKX76XPVCvmoY7iRjS5geik5wJDIHF3ikOtyDaAjj
         qkfIagDyZm9usjdWqu6B2F6a2PG+9B6MMDUvFpYWH/1UtUwFwhUqXasHFpuJU96EIK8B
         ryftoVngXFfxuul71rSchrqdfTn15PD/EJDTkx4ZS6DzwzvBxKeHuxji/V41ouBa6N3g
         6iN38CbvoYZx3ym3/0RW2pdxurY26AbmI06yJP4s8dle/NBChvVJfqgbMWXtEN4N7Mqn
         p3JAZV4ZbtItI9j/o++Q/cylIFkMVF0OfYM5M/AJzfkgaRRqXY5FRNlfsl9eE5ZYRu0E
         XF2A==
X-Forwarded-Encrypted: i=1; AJvYcCVG7aheBJh5UWPjvvTxR2qvm1KTMXqVq7iy0ZmWMMPtNDClDuybmdm/t6FmJa3PMxU3ORVgRr0Cjsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/xhIZpZe1X5v3w1XdGeasX+FOxm7qvihw5pZGBB9S/SKfPAy
	krkhhDq8ukMRQY7nNcwa5mqrmWPLE8IhK5Fao78goyRffteVpX0TZ/VWFYzcQbtX
X-Gm-Gg: ATEYQzxkWfKc+n0LiJJ25/+Cuty1LkePESIbcTCimsjpgNp9hGPVH2YpzVa9IXoDG7d
	mNbdQ7HD+yM41Vo2XPdtrG/eWPXHyX2ukMyRw8yKWz5l8PZjP4OaZw3FIWUGZ4WgocKpMyIEJ7z
	g/o5q4nU4jBDuPHRGLSBVXyGMmJgL6h9FPP68RHHJAH8uiVEonsoqgiTc8xbY2c7iGMs3wyVwDb
	+1/0JIwPBEWk2vMKSL+PHSnsP65oau44koxZxgD42dzHL97uFSxWGTTlK+GeYh/DetC+9HKdlt1
	x6rguQorYBkQkhgQepBo5auSo39VpChkcP2QPlEYlg+grTpNx+oJAvo4r6JXF0JeIuQwVytSDw2
	k3MAu0a92wN5WqJx0HFOuZRf1IARTbytojClpJPbbzxMadb/du5AXWwszu2DgX8xRIHvFfrmXp3
	NriDxND8DDCiBAetcfADCRqyvSAD/lOaJmyNG2lrLq3ci4gKhE8iNCHkdROuPV
X-Received: by 2002:a05:6122:2218:b0:567:5a54:5443 with SMTP id 71dfb90a1353d-56aa0a8bdfemr6147756e0c.11.1772544612651;
        Tue, 03 Mar 2026 05:30:12 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91659421sm20455253e0c.0.2026.03.03.05.30.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:30:12 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ff05af29b4so1952698137.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:30:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAJ/bYE8RQrVtTTVwzH7wJi1bdQLpqSm3gMHxb9lQ+8EBulvPiqKlCKETn9nWhOkAVuMqoWHZCHpo=@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5ec:daec:580e with SMTP id
 ada2fe7eead31-5ff325a1577mr6210023137.36.1772544609268; Tue, 03 Mar 2026
 05:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:29:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
X-Gm-Features: AaiRm5008H6GA2iSW5UrwIeeY5Wgcg_c3Mk5GG-msQ01mr1Ry27aQjZHaY7c6iY
Message-ID: <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Fabrizio,

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/V2H(P) SoC specifies
> that only the WDT1 IP is supposed to be used by Linux,
> while the WDT{0,2,3} IPs are supposed to be used by the CM33
> and CR8 cores.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 and CR8 cores.
>
> This change is harmless as only WDT1 is used by Linux, there
> are no users for the WDT{0,2,3} cores.
>
> Fixes: 3aeccbe08171 ("clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-fixes for v7.0.

Apparently the same applies to RZ/V2N.  Shall I just apply this patch
to drivers/clk/renesas/r9a09g056-cpg.c, too, with the SoC name
and part number updated, and

    Fixes: e018f9f8973760fa ("clk: renesas: r9a09g056: Add clock and
reset entries for WDT controllers")

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
