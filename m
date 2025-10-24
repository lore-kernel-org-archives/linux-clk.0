Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00EC146585
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302304; cv=none; b=EyT58il1GP2jEluvWF5y98Jyg/PPurbbklont2nBnJVOHINOBDtsKxmOeb6pBliv2m0GbfIltW48eZjYluUxiZC4MN/zi8tIFwAnRiTzIF2Fvc2BBMzSV3LYYl4R6Ut+/jimvjU6F6fTTLgDmtSc/GCw8gml2+yVAX9sjK0q0/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302304; c=relaxed/simple;
	bh=WB5fApO8+rYBQab5f2Nym5kT+Se3DnyCljE8OKwhP3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4eLhQXJIXJhwajOER3Z+2YPHKr7G0w2eu09cRKOz+Jh55O71N5P1VW6aw7ZfH5Vyb75W1xRnqxwX+3v3N2wbEbjgwbjqo15zquzhwAiWwF8bi8vwNZ9uVV0w91QYCBf0s/EEZvjEMH+bHgbFLbLCATBT8m4fFcPnugcDuhXZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5db39d2ce9fso675023137.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302302; x=1761907102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpq8mZd6yHaCnXYSdFvmX21GokIxR+DEgALaIuhYRgQ=;
        b=q295xqAlW+yNUmckxSXSmGIWpjwPi81abZOkP/xr5di1xgwYP5WXuu9fmOzqa0J6ar
         11WqJ5y+LjKkTrEzNA7s0TRt4RYNGCRAVRbsDAFB5UoE1B9EwY+NC/Tw3rHUAj/El9n8
         yztDr1bJwIxxiJq3ZHbkbe2Z7nv/0tfvnOpTT3gN2cwhx3JfcndVwcYvew9OT2mmjB3M
         uIclad2SQoIr1wdfn5MMS02zNIZ0JK8/qAqq0B3S/riNLk4Um6WcqHX1YYNncKpDKPGa
         KTj3npkcrtwbiLhZdR0IzDA3y1lVMvLHzq5w2KXD6jHkNxq/z30ZvBZedjUgDJ4FBd6V
         vUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrvz94FsmHQ8WFx1JfU0rpVjnDHXr4UIL5uMdz4KFaNULYcPuo8shBhnEYghNnnoXvI+HWZrNzLx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxou9h7xCFCnFhlct9G5Hl3tQ8BFagKFoZg5w27ySitrMVeozEc
	4SDL1SIL0l6JEMDQLCO68gSUXCP13O4MuZUcbdixx1H1CJTiBF536dGdANxaTH/W
X-Gm-Gg: ASbGnctxG2co0uwxOw08xVQPUKYuAxEwgHd2SikYgCxUsptg/80eW6fFxXk6UyJZGfK
	8RsLyq9CsymM0pOXBaVFpm4uSYupJp0NGS3076Wj9kgrE1IWrt00pwz8kz1BF3YS2hQ9IU506kE
	NhCp7fAxQnefdTxjvb3STbG6w48+6U92390VyBZYhTkj9+mr/cfIP58oaHsqPolCgSSCNV/Wt1y
	+/pT8yy/W8d+YTGhsxNMtyHQ+3KCcnnlwk0pP3doo8mQugjlMY/DfAqoTabgknEXKq2+1pd/i25
	QurxDSb5UW2Oq74FtjarmvD49N575XP12dizlyElmd0zdxODPeQAFHS+eGo9Wt7WlDtJ3ymoVss
	YboAyLMcrPOaClfkhONFB9Whzwwwvkr87rXgWAmJpmMNOgRFjlPNAkWMeONHi+jHUKTPJxi1OCj
	/Hoqh5R8KCGnBJ20NNajXBYPhaWgCcFwOTE3cy4yLeVN50voII
X-Google-Smtp-Source: AGHT+IHPwYtjRo6neUEmqyM7gWL/xcoQrIvzOKVy04jB3KzAaVJT4Du6ondCb/dJbQwZ6evFDEuegw==
X-Received: by 2002:a05:6102:548d:b0:5db:2607:3c1f with SMTP id ada2fe7eead31-5db2e5b2c22mr1587213137.38.1761302301643;
        Fri, 24 Oct 2025 03:38:21 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2ca7d0ebsm2019477137.10.2025.10.24.03.38.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:38:21 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9231a251c01so946565241.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULj65kmEoEgQXUnt0tWRvb9bAp3ZzNbptDPV32RDIh+tFhL68QXW3F61HdHMYoC3w+L4UsQ5kGlZA=@vger.kernel.org
X-Received: by 2002:a05:6102:1497:b0:521:b9f2:a5ca with SMTP id
 ada2fe7eead31-5db2e4786abmr1811923137.13.1761302300586; Fri, 24 Oct 2025
 03:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:38:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXesP=oUwtH+mc8G+5b11hBz7VUdEKrFvAC59F6fRHLWQ@mail.gmail.com>
X-Gm-Features: AS18NWCQuTkOQsnhJUgy2vY_-eHhdBBMmfSA920Vmg-OjJTPAXTEY344anEjiXY
Message-ID: <CAMuHMdXesP=oUwtH+mc8G+5b11hBz7VUdEKrFvAC59F6fRHLWQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for
 DSI and LCDC modules
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset definitions required to support the DSI and LCDC
> hardware blocks on the RZ/V2N SoC. This includes new core clocks, clock
> dividers, module clocks, and reset entries, as well as PLL and divider
> configurations specific to these peripherals.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
