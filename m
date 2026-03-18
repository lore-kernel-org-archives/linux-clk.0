Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420813DBD7E
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844418; cv=none; b=SbIED+tYj5jPTaMr+xjXMlQrlEC/OW7QCw31iqPG3GrPXefjx6LPV6gT0paqoa51Sh6aw9wUDBuNDMkww4FwXAs66NbXa2OE3fnOgYeqWAwdjmm3erCFdQUxZtN5xox+KRL4Nmv7iOmUgYIg0NFH+dDQK4tVnv0TE2fTCpaXbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844418; c=relaxed/simple;
	bh=Lm81v3X2hopJu4HkS2XTSZZIGVqR68LKUdtuY/WsRic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRKPGa4SDzDE4n9JJFCsFUheu0kAbFyO/21Dt/kE/DpcvkhdynfMHSsDgvfdvyGHrSkyDswFZF0Opydcsj44pwJdeB6QbhqDxtaztrbFX5o9Wdw6JZk+sCOvUozRLLYtlMo7Og8NWku9+zgcl3mdZ0Cz9QN/Y1gPIM+7KrOxVPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56739adfa1aso5341820e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844415; x=1774449215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0dzTiRw9+wmXHZEQW0d3m+CW5azAN7PobPRJxwWyKM=;
        b=CL0E+JWE4iR6XJUGa/kieZmgKBpc1jU677O6/IXNsJoCVyB5+A3FpMZf7YnXbv//+Z
         Uefvza/0Wep4EL4WcEK1OPMmrri2hOYq4mrBnHrzBeimWKydtnAHva+XEQNxj4o+2qzC
         GmnYrW87Z1MNjpqcF6mS49KU5vSXtXkhsZefzqUeF5YTT0gDW43fS0bwFTfKocIWm1tk
         7HIMuOwo8JuYeBbcQaoCvXyXDEUIildaY/JA4ZxbGbG8UIhkCIsi99BDlI4BccHfgwjL
         5Reh7DBdZquHq9CMnqsxa8nanwzbU0VdfqreM26uQG8Wne4TI11e2CS+o3FwxspJgoAZ
         tFIw==
X-Forwarded-Encrypted: i=1; AJvYcCWff2DdFd+Gn3U8RG1Ax1kX5MOj7QeWLdsjx0hXVscA6EDnRinYOiLY+bHgtQA8Fx3M/ZLKZVUIWyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyewuOR8RfyTfSg56Sum8GDs7A+nlQwnUNFueX4kfHUt6sTvUIl
	SnbYGzPS8huQkaRB286JtuKva6JMbUSRpIcJwf6K1w8PyI3+MVESTtI8GsvR2ip1lvc=
X-Gm-Gg: ATEYQzy5djzIw6MF0QSUMOhrvDOSG/1ikYFq2wQOOFpmkY2TvW7EDPtRyvzCLZ62awy
	eCAQ2CEKfsyLjDNDT17cArAEZd2/GOgreGYZd/wr9//i2H/fXyGKU56WKaqJOaMRwMK+N69Vcim
	mmcUjVJkJ345FEXWpoRsLQSD1YJ3pxtkcHw+juJ9Ok9sGCpdPchUt6ymTUT4XzmhJ6x2FvYUIFM
	0BFio2+wpeSZe5DS9GZFhUFONgObp8UUOsPds4+gfBZ07Xttqu9Rgt/NHsiHZ8jYabopDlobGxm
	NAUplJ0j+xMB0yVjjLjHdfb+M6rUzzOEZGLztcOb+1WMr7YrLCjm7aPNSLb/tV4UjoAs/1/6btI
	aWnJCyBlQotOL7ksbe87jQGLv6LfSdk3DNbQMHv0z5W20AfuOlyWR4W0rkl+Z9oDmgocd7swwmf
	eVsVtPG2ipf73l9LQTKkchEy1XJ3d6/FBEJSajwt1diDIplwHFW7nXvJTxSvyY
X-Received: by 2002:a05:6122:208b:b0:566:cd52:313d with SMTP id 71dfb90a1353d-56ba71d221dmr2132755e0c.16.1773844415066;
        Wed, 18 Mar 2026 07:33:35 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e737cfsm1695190e0c.6.2026.03.18.07.33.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:33:34 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so4026620241.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq1qT3nYRArxVh7AcMvyqEc/GgkMMx7z4xEOwg3R45oGEzLh5KZpP7XSIJ+ZdNkWqIwsvAPfXi4Qo=@vger.kernel.org
X-Received: by 2002:a05:6102:370c:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-6027d2c07acmr1775626137.19.1773844414146; Wed, 18 Mar 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:33:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzYa-+oP+Kg4cFmoZ64s-7GcFW_NQ1SgC2y1OZB-S=7w@mail.gmail.com>
X-Gm-Features: AaiRm53aZ3vOKz3xOV0p41g2dKm3hv4oZar4whKMHd360-1-SNNOc-RjUNHJAH4
Message-ID: <CAMuHMdXzYa-+oP+Kg4cFmoZ64s-7GcFW_NQ1SgC2y1OZB-S=7w@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] clk: renesas: r9a09g047: Add PCIe clocks and reset
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add necessary clocks and reset entries for the PCIe controller
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Looks like you forgot to apply a few tags from Claudiu and Prabhakar?
Fortunately b4 kept track; will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
