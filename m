Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0040E8C7
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666738; cv=none; b=oUZnanUP8fBt8SGHgjU+9/crJYXmx6km8uZ4uDc1CCYg9k39HvAi8+F2m97HXoEnTN77lqoOAXkxQYTNpXWQpHccjHNoeemzw1UfGprWImIfYVA7yarQqNnZXa0am0U2zTT8HyoleovDK4xABQligweCpVkQ7J3ETGUdgscH/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666738; c=relaxed/simple;
	bh=FBNPG9V/1qWiz8sOxK8CKje3/Q9dzTuF8Px0Wy6/lMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdQaO+iDkMuDtfUKecT9NkTKqtQBVB2MtH23XuLTcMwOKIqK0OQ3x4mtk1NWDbX7TMJ0XAaM4zj+hpgEkZDkWxmahMjbv7IUn8zBZV7I5h0TlJH7TR76sHMqx0tJbWYPTaIuJtB1tD5txXI/d/KlDcdOTGTTuwOnzo3ZZPgTqd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9640111c168so622051241.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666737; x=1781271537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3BFc1Io0VDxVIM/lXxZrvbjyw3H3uz5gUx8im1vWJQ=;
        b=r0poH3N6kb38J362xSdw08lagNBQaaXd7l9gWOF1ak14EtW3UZQVgKukPxjeK2sNA/
         NX8Xa+suQ4Nj1n2Fr6IPZivEZYU+crpwgKZi/tNi59Aj6iNK7nSMQIRqtov72hItyz3f
         4ME5ruDMwCNaq2wLDUQaJeCweAW/NXCPbgEaAN72zduWVjysl+X3dim9IKB6XVMKElzP
         2iLwirezAhQRERMIs9x2BOuFeo/7Zd0TGIgklN6QHec5NBhIPFmXWU3fpWc40azx/wXJ
         tW/4U4IXwZcg248Fanixadz6hVH1ATNVT258IGBNcQLcJ0LuxU2Ruk+ByLixObK3krtn
         sB7A==
X-Forwarded-Encrypted: i=1; AFNElJ/wb5u/JjSe+eu9OAEOCbWz2RrIwxyg2H1nFf/sPqywI+I+dfUxa0xJh0Viq2DTXAK7DV/qjNWCk4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT00h4eGfZrQ0aq2lumvEBuerK9qedxbQK6usSoPWLJDVeQCQ1
	8o2LbIHQZV6LxI55SgrrISQhgjxQQdXQHUVhpPnxOjMHuUXyLNCsGy+LVCd5LYmt
X-Gm-Gg: Acq92OEwMG2BLapzzjLWZw9edz1RIFAY30oXw9fkNFdt8RRqj3pyewYuFdZyqvmi1jZ
	0SG5M8JR9Cea0ynAOFiBNG/O6EASGAWxr+AQO+fwivgJh/3KSoSBE6gg2D4yQVfAuhiBteGgBAF
	wbGJUb1b14xDz7dsl1h5/c9TpU2XiXMAwkJSMn6A9Y1ZKcOZc1DCKaEBdqldIo/9VvVd3eb3Xif
	L8Mc/o4ie2lEPqhjxQOxmUYmCTESxWAQyQeIee4YKlQrAMKJxLp9RmNLX6nfCvFtrdQceZ23hFp
	3e/M0v1VwxbZbr/0Jky6sGS0WpP4RTz72GQLxabTgpW0b5JGNR6wTejxPDxa4wlJtBioE7+1lYj
	P0x9FWi8Fd8lYiyMI4Un4BbgXrfLSFo3byHN0GER1dJeyMdv3Bet2YyZCsik4KVO24+CMb8lptY
	ZZ2Xads7Qu4jy2MMEGKZcJpW6yIilx6meXPvDze4krWGr+QxqzwxQ6niDGFmkIzshvAqIQm9u20
	E3f1FMmOkTK6w==
X-Received: by 2002:a05:6102:e0c:b0:62f:357a:3297 with SMTP id ada2fe7eead31-6feef474e29mr1769292137.5.1780666736896;
        Fri, 05 Jun 2026 06:38:56 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb36325d59sm7866551137.0.2026.06.05.06.38.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:38:56 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59dc1714d44so614464e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 06:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80uR8uzT3wlptVTCEVBmiRrVd5QXWphNjOPAn+FUpP6ZcG0KaVpz2mgX/VIAQkanZ/hujzztoP1H8=@vger.kernel.org
X-Received: by 2002:a05:6122:3d45:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5ac4f952082mr1666770e0c.7.1780666736147; Fri, 05 Jun 2026
 06:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO=u=kEAYSqywiMkvjCcBHXVfLL7na7kwEFsuaWKMToQ@mail.gmail.com>
X-Gm-Features: AVVi8CdVv3RVEHPhsDaqredkoNGzyv__zq92-0m6DeV88WQhNmXx0Ns2Vk-vkl8
Message-ID: <CAMuHMdWO=u=kEAYSqywiMkvjCcBHXVfLL7na7kwEFsuaWKMToQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
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
