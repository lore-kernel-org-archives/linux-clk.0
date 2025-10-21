Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C9D338915
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053728; cv=none; b=BkAW2NO4gP/lCdo5Mo99DNiaY9N9Vfks5tBY/eC1MmcjflhbnrJ2/JF5Ti78gxeCswRAVLQd6XD7ILd/UwgrKWaoZ8vhaE6K7S9jxiBJqyHTMvvWrzFax4vVKscI/IaLj4RkubKAfobq9IuCNqKeQmJwGueD1fxs3Vw3qKZvXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053728; c=relaxed/simple;
	bh=gnF9AkJgPkgv+c5e70+0S/TuXUz2qGPWDAKnDZ2oFUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATYDpU2I11Wbpv0AqmRKnYh9FPjFdKW5Y1Tw78+4w/PuFvcMrn68GPYBrScMY+4h0eBNLDz04URB5iStMKp1gJQRHoqKQAHJcEYrz4n/1p6gPwx6pBQd2Br6ulUJVQhE3RQ/qdwAG8FJaBIs++KyNq20AON4kwZPeULBThRUL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bc04b9d07so2194164e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053725; x=1761658525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TkKqx+vxrv5wCaSsuSiP+PuBVA5+FMh9B80POq+sr0=;
        b=FwLTiVlRjt3yAU++0qLIii6VRd3GdVzbZPAy12bvyEdytrJpv3mFTbzvIoSDq0Dwo7
         ri+TQ90r6U/yTGoNYVvhcq0gbgLHxTITUzbQ+izs5KJaDTZJwi7asWqAEraODNdoO3si
         YtGRdOcwy+/Mq6hjHE7RIx9LOM2TqsOotmowJwMrcVNyOs4mRV6MxdTYzkzb/huDH15b
         uOC7ncaCOGKKzo5UyyPkpGbV2DInlIdzVY9shYxHqRB84UlcChXJ2CQGtC2vCR3d3tPL
         eTQ8mKmM3iongLvtlZ+m6ncVDgw+1zo6h8CrFhgwJ1IY6kk+JG5eUGd9YTeVsGbbgZAc
         AsEg==
X-Forwarded-Encrypted: i=1; AJvYcCWuG0hlS8t+IsXjE61GuV9XBIusDcqbAwtLS6nnkXxrGJaEs4dHFI3Xv7MbcBYbLZrLt6TeQnNmomY=@vger.kernel.org
X-Gm-Message-State: AOJu0YylobCKN2Pxs40+KZ7eFWtNAoFzhDoAeDcfqbfxg872DncjNbWc
	SzzF1RpzSAmsMpcnL9Tvgc6GCqD4PfJuDp7oGhXKL4Z4ef8nEtNZy0/K1is78fM6
X-Gm-Gg: ASbGncuterf54ZF8HoWq2FEKDR95a1iHyX1zxy8g2GDIKqdWwB1ffeD/SoWlAkOro/B
	tCf4QaOFt3uTeAdRIcvulWhXmy9AxBDNtPWk/ooP+Q5UQco46N8UBIQoKTVE8yJ24TOTqcUMHE6
	SJDvslxougtolvZju7ZxsXMSQ3EWMG1gWaaAvmJ5vqdHCeEvF/+D6q0ZM+KvlEKNFBbfD2lErgZ
	hk+4UFYcDf34sqgRPMz7iFrjchp+KrFwwJnUlXVlyvmKSnN8ZRPE6ynFchzdfyjX3WZdMhAlaKp
	3yIFwW2zEsgKcxoWTNzMvqw3BBJijz0IFVWI9hqFZGD3sWSg3J/K4+9Cy9st2vOs4I+yQDByqqQ
	25Vga/j5ea8ZuVuLZNM+JXhvA4xK/4StbVli1ybHQG/APeXBREiP+MXyNMf6CRNguMlhMlDzJVw
	Xh59xLURAQkEmdt92B6GbjwtBu5o+2LuVfzBhzuA==
X-Google-Smtp-Source: AGHT+IE2DLawvnITyoxEOLGKoz84EF/2TroEUyd1o3fKOlZpFdmCu5W/VB9szvbMP7zTOCTtPi8tmA==
X-Received: by 2002:a05:6122:1e04:b0:544:87b0:d1d1 with SMTP id 71dfb90a1353d-5564ee60603mr4305248e0c.6.1761053724970;
        Tue, 21 Oct 2025 06:35:24 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661fc8608sm3374161e0c.11.2025.10.21.06.35.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:35:24 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-932cf276843so647141241.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:35:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoNMzU4qz4QfuZVAO4Hof4Zo3JgeJgwI5l+EK2IM4Sad0rO1+J9EQgAfb9f+v+WVcP3/mt3TcLgoQ=@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5d5:f6ae:38de with SMTP id
 ada2fe7eead31-5d7dd6ba33emr4614068137.41.1761053723732; Tue, 21 Oct 2025
 06:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com> <20251021080705.18116-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251021080705.18116-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:35:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+=c-HseXicppm+185qq3fcc7=qq3Nu4LjoKZuYF0d-A@mail.gmail.com>
X-Gm-Features: AS18NWDE7aRGEcmYizQFJmtQta7msQIG0JXTbcDHGFqFLxinOoGCd4ViST3rwwc
Message-ID: <CAMuHMdU+=c-HseXicppm+185qq3fcc7=qq3Nu4LjoKZuYF0d-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] clk: renesas: r9a09g057: Add clock and reset
 entries for RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the RTC module on the Renesas RZ/V2H
> (R9A09G057) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
