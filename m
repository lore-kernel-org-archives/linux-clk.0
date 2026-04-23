Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B663E3C5D
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937060; cv=none; b=ScFl5zDJVdPySE0+x9bW8WG7k1KTJTRI8et4GiK2RhG/2Rn+Kc+BvjL5j0k+KSqcJ6jWmhfi+YOBmyQ3/AB6PmDSC4obA9TarEMy1CNZJSx1pRmhhoLPSclA/sdahzMx32CHuLvpemA50+oo806x3jAuETedN/8R7tvbYZ9MXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937060; c=relaxed/simple;
	bh=49P1ANy6/XGJGB1NNommdNWD+0xmIT+v6QWy7dtyDN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOe4nHyzbKJ8Q7wmSXShUqRyuMR7oVcSvCRMGsf52bYkJiOEGjDfznbnkN0JSxPDkS1lsfRKRh6DlkyO7y2+b4HbJnSEjL5pf8zJREmf2sVPz+kAA7PDMoSCduivXoGfDmy4KCJ2n6YLgy+qh9TQhsMX4gngGi3lXAm+CLWBE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6137374b106so4402237137.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 02:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937058; x=1777541858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4avnyk2r/thqEE/8ekAW8GXrcxQQiB8UiCWb8+JQfs=;
        b=oeifVTRJ8dCOIe1bIU8dfYosRdFy9IEy8KjiVykSHZ588g7/DhTrJr6yWewR2AQ/ZW
         qKmTERcIcfXexfZN+LGHiVPuab28B1wcbGPw702qo50OePOyK2QGbymdP43ZEpUD8bmt
         hQav/0cj+NIYW31FinQqs4RpRdDJNkImcvLawfSu/kDjitHZZs51G+vRqKAuRPnK8p1A
         51jHdaQZe4Z49YksiSEOgsfQEl6W0cGfhX47Mw9T0FGl1vxsLFYXMFXF8jB0qP2R9TtD
         cNIdBjBnXVHXXDJL4hn+ngY1iOfD+iUGKnFsDGXdWbetfCSbYEQJfaq62iXCSToSshkx
         XoLA==
X-Forwarded-Encrypted: i=1; AFNElJ+xYuOer+gkWSszufWZnnS9Y39aemu8V4/5X7FJOTYhcbBBz/2fk+hKXWmtVSSt9A1gktMI0gobX9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxkRMcNZgeK1WIimlV9h9yld6pfEz18CusIjW+IxqZTiX9R8O/
	StoV6+MJLEkJhRNX/aXvjdXcGB4rv1AOtWwj7TUI5ynucusN7k1i4ulNQc5zOUVjz7I=
X-Gm-Gg: AeBDievE7WdWVY1jQkHhfG50zv+vmmZRTD5YzBOk9y8Br4QpybnT6vBZHC+oW8/lbyV
	41IsyXEtxxftJ5F4bBf1N5vjXHetCZcsqEHMjGwg8g8bZFw/SPjLGCFAgwQcN8q1qKx2oAjLeus
	KMJZ64MqghXTOJiFosvYr0GTkQKfw1AiEmKKH6p4B5OFnv/6QB/tNvBu+uonTEJt/3kzMk3+fSU
	Fkb4vQoOykLS6yOnL77yr6VXcKcVg4aGF8OAzBGCRVgMSgjm9FuSLuLUw/OxREiqdEGtVfVS9f6
	wAmllLJXczsWFIY5vR6ce3RnxxTDIVmhACoNo1q4WEs46XEM/FmG+3AbYAgUKuFesk81RgoQOzn
	TrxCshf65pL0eQN4uYC+FRAL0Ka4BEYy7/KDqd+8riDx9Dtzbior0BXTdGFqveNOaNIS7CsV1Pu
	7sNm+6L6DKW1wgdv4vk5bN026D+PAgQFo6Q1MsepXo/V/BuYe4txsrGmhVP5xjqhDmHeNr8Xo=
X-Received: by 2002:a05:6102:3e1a:b0:610:eb3d:bb2f with SMTP id ada2fe7eead31-616f7a45fc9mr13821819137.28.1776937058548;
        Thu, 23 Apr 2026 02:37:38 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e51bsm10022392137.4.2026.04.23.02.37.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:37:38 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95687f6ce13so1927848241.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 02:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qzWUZMhoIHB27SnYGE/x+rs8Pzq+FJn1Qbf6YSwoxNhsrmvyUhQH1G8oL/qb/totrd+SqG+sU1mI=@vger.kernel.org
X-Received: by 2002:a05:6102:dcd:b0:612:b3af:39f1 with SMTP id
 ada2fe7eead31-616f68d1bafmr13648560137.18.1776937057736; Thu, 23 Apr 2026
 02:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 11:37:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
X-Gm-Features: AQROBzBb1MKj-k5CTCdcl13Ho8NscavUFViNzxMLmeCGP4nXMPTVcdPIbSR_3Lo
Message-ID: <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for PLL6 clk by registering with rzg2l-cpg driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
