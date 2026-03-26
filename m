Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9527F271A7C
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533126; cv=none; b=Axw2Po6FrsI8mM1kkcOogv0tDuzx+cXd4bN+tECmJE4AVouQ2bIcPYIPKVgvHJ3uJLPQF30kl9UVjRSP2UKTdhB5hutPBuo/n0nnOPVfUiinVVsnG+syOjXcS7iuzbze6a9Fnwk85sH0OAuIEmBvHGQ4WHjl099ZHl8n9lQI3dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533126; c=relaxed/simple;
	bh=cDhfxyLE8KELmcN/V5Lg442JeUP5/oqeaxxHd9lzQWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9+pU8CwMPtqd9muR6OvWtdipeJMdW6vUuhdsMe+7GK4FiEyLsBCzWfNXnZc+BeIxzD052tl8CVVhHfYoKVoFWHAKq2Ngba1evHOm8PiJAtARTzbxBXQTlGT/7UjL6Sx5X3oI5U7w9kjFn2bgYyKqlIKcN2t46RIULofyUayFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56ccdd0044dso1511971e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533124; x=1775137924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMOdSdI6D4SgGqC7US2RBOxBiSABzWCafTcEjzVqecE=;
        b=NVfwYN5wYwrpI7X2aE7QdWBDRfdMwT4WI9DwL5a0a4sGOFgz91kT04VTH8xVHzKC/p
         lFFFf74XZ+OfkPauWaE8XuuLmMEUdO2gPpYpob55K98dJTrvU7YTk/9cMmidryxO8HB9
         ffkOpIhtZDRJOXplWjahQ6P216sP8Zi2bO5wNCjhX/PBBb3D3HeXR5B6ePHgIlYN4CUZ
         EUnRDGNmAt3LvME8nhjPj8dYb8lfEkg8Awn4vJ8iaXoep0nXWXV/UzLEb5zyo8nmRHr0
         CzA1UQ2GeatWvep3I4umjuUMRGee7stHHER+w5QhIC88/v1jCciFiwJkmvqyglE2q7Bm
         2CgA==
X-Forwarded-Encrypted: i=1; AJvYcCXfgTdVOb1CNL4cREGZsNSy+qqh8iqTFXPAX8wFGBxUZJhNtX8ZbkYnwDXKy1kitypPAhigNctHDj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXVZXJR33DTjRU3XoqKdxbdE7+eU2Hr/+GSiDH4kwRkAoi8qD
	GJML4/QzEEyA121I+ZTbGC2VsATYUh3hQCPanI+IUECd1DnUs1s1tJ32bDi4m/ZxGu0=
X-Gm-Gg: ATEYQzx3P0ZXfkqQfGdXMD45sJ6mI5hmP83yQgbGoz/fDgbO4f8E1aKlaLV7ePrsDuy
	GXoXaU01118lx2ezO8Slax/ZGNk9kjYY2i4ZjPkYpj4UM7CSq8t0GRMCJe5iGnlj6AxQ9/0wK9L
	HtiHL2hj/vojwdffUrfHaNdgl+9wpmAiCJ+w9yVpIXKrKodS5M3AQlHEN/DfyLDFHBE/Thzg4SS
	QZIE5wPf4ooFENJdRJ2CtF4uD78dtMCsZQq9bIQNMumFjRNcXZu0q7O7Z6Zbv2aZoP6H5PS87U3
	uqlxD/WxmEb+rc1hvWqIR/QFUektN9S9EiStcEWr+eGRcRvVrM8jlsa8JSF4yxmmJLOvNP67MUV
	yjoRTYuMaUAPC1L6krmOhaDESC00zMUYebrz4HpF1duVTpjS4eZNPnAnv6Ey2wtmGacclQRdQUm
	fs5Dx5zpnjE54TU84iW6vVGROlRN2U866aExk4wM6A8v22bVRVskOAReOxHCSp
X-Received: by 2002:a05:6102:f9e:b0:602:91be:3506 with SMTP id ada2fe7eead31-604e4c57d4dmr633469137.11.1774533124440;
        Thu, 26 Mar 2026 06:52:04 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50677f0sm3200645137.1.2026.03.26.06.52.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:52:03 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fff13d5a19so1417649137.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:52:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg200orrC9xAttvUS+He3EqFPGddTlvHCcuxi6dLNv84CkmkhY9TiJxaZXeDdYeGkzLMkPJhg5NBA=@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:600:ac0:ce33 with SMTP id
 ada2fe7eead31-604e49593d4mr560405137.5.1774533122927; Thu, 26 Mar 2026
 06:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:51:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1oJUo-EhNh4C57rOtDLZEW-e8A0bVov3Dc5cbxgnt5w@mail.gmail.com>
X-Gm-Features: AQROBzAhPvwgDpGj9pCBr2oWG2oTfnhn5pVp1V4thQwYeL1ZFQS0nUmqDfQ7e7o
Message-ID: <CAMuHMdV1oJUo-EhNh4C57rOtDLZEW-e8A0bVov3Dc5cbxgnt5w@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] clk: renesas: rzg2l-cpg: Add helper for mod
 clock enable/disable
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Refactor rzg2l_mod_clock_endisable() by extracting its logic into a new
> helper function rzg2l_mod_clock_endisable_helper(), which accepts an
> additional set_mstop_state boolean parameter. This allows callers to
> control whether the module stop state is updated alongside the clock
> enable/disable operation. No functional change for existing callers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
