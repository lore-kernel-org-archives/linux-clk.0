Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35085468C16
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152991; cv=none; b=ror8cdsQTYhnC2wsT9xlV5TkkHUFdgbF1zNBC6YzBXpmcayZBbjsXz6z+dFEAUAtym1XjMeYTO0/7lWsNY0sfemeklwtHeuCet/3WNBn78uH83+we5lQvBPV8aEasUVaRrmeQj3f/XxihvVtj1EtSdFdmVRGoMlh9GguaK2aUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152991; c=relaxed/simple;
	bh=GH+G9KX9bwnt80PIq4IHwR7csOlpK4ojIMLf2aneyAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMarei/bYOF1uq3yjshziOmh8zRbqyJPZYBW/F9ktFzv34BYpxWPquXhEPyFty8BpBMMGo4fjFBHQi4xmTtS+du+V+/gEzFhMbfBXhRr8eYNhdWSHDwDLUIzMsjmvpzSlV2KEwU6j679IQinQyVdknn9gEsc25K6kbszUwHom8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea5bd53b4so258595241.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152984; x=1790757784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=//oHg8gtYum1A3YUGYDpbh5UIJ1fkAr09bh3+8ifa0I=;
        b=SCO5a3wGvy+zG9HKjyYEdYPOWdgOd2VhIpuax8h8nzeAWPq/mR1OoWtvWYdrzNttES
         jL0j/IT0kZqWDnNrZp/3DSWkySsqTYmdBRcQbcXQG5DAdlmY2AEO/0w95pVl5TUwq3XX
         KjCKcE4h+oSePnet9x7OuQr5aFjyb5srOrE5iUgTVkDrI3OhFMfFLSuezoChrem8LBJO
         4Mof3rornYKB7ZRPCweQygWlSzS88GhqIHyUI46hw/6EheTXfdxvWfO0mTR2gh/6JuIG
         cuPwrxYcsKzrjY/m/GG8tbI+OVPTfimgvK/hUCaEVgNjgcKHTKnO1vGbAH/r2Wxb83mX
         dBFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS8OX0clZ0IAqe1M6Z3UMlCwsU4UwfczzhpajxmASa2mHjQWMQXzVqimEj+KyGUzKCrJU1sip/+ok=@vger.kernel.org
X-Gm-Message-State: AFuF++lcWen3OmSwP43X5Vat/oFN+1+MS0IvOEym3QcKzvj2hmfxhHlI
	f/TwVnop3DnuacZy+UrG8SPUKRfSKtkkM5wsiuoVZvbo9AnvHxOFfSN4D6hWiUdZ5BI=
X-Gm-Gg: AYBFou0l/nYjAiS6sgWYEOwmwilCwsNbHSC6KR0BViCctKju0DxVZylyNNmpYCtVF/s
	3Pj4kpFeAgY/JAuA9Ymdgya/JjC54GxyjU/MaYXFrOuApWErYFUEezPI18f0QAkXDMmm52uJ82u
	upspF8kB1Z7AKirjCBbEtY7+wTLm/qqoudF8WKghex1R5tkSUl8mCS07gOZ79ixQp5vdJNyszSq
	HtujgtiRVnqw4BfQzjx6LYXK1Wt7ejMstQw9bCxD8jIkrE4GeMYGS5dywhCckyZXeVT9+s3OBUW
	qy7ZpewSPpSbe3kSOaTw4lu4koj+sgZh1iTnAd/3/IUzTNmloBjn0gXRqEUsHpvx1OdXZJ+5U+6
	j1OLMkLkIIAaHc5qXf8AG2xSOHebnRB2ONUMft8mFES2b3De58vi4+vD3/42KALlDEJs8bWrAbp
	uVXpv0AMdtjK4VkUAI8v9g+kEkukRQmbosFAHD+TRRTBJlvTb8cH6cucKnvml3s9chyPevpFyVF
	Fsh7GUXCEYLXd/kOZBGvzMGDLA85i6NxBU2
X-Received: by 2002:a05:6102:54a5:b0:7a6:cd3d:4990 with SMTP id ada2fe7eead31-7ac1b1f5230mr1935399137.1.1790152984273;
        Wed, 23 Sep 2026 01:43:04 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm2711715137.11.2026.09.23.01.43.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:43:03 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso260317137.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 01:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYgrKSP7gIopPfk2BgaoHPHvyjrbNvjVLxLEyPahzPG1SSqWueRpNS2p4Xlwd/DdgO7TXJRMCA+L4=@vger.kernel.org
X-Received: by 2002:a05:6102:424d:b0:7a7:79c5:d465 with SMTP id
 ada2fe7eead31-7ac180f12bemr1838325137.0.1790152983610; Wed, 23 Sep 2026
 01:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 10:42:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCeM3yEQjDX8xiUqCBHtzNQQGuOPHUx7-Ws+kHQDLAPg@mail.gmail.com>
X-Gm-Features: AclHuK848QBrvgpclPFCihicUGmIUafEaGDYy_N1SWQIWhJH-OczPXLCQn8Gw34
Message-ID: <CAMuHMdUCeM3yEQjDX8xiUqCBHtzNQQGuOPHUx7-Ws+kHQDLAPg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX
 mux clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 18:51, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CLK_SET_RATE_PARENT flag to the sel_eth0_tx and sel_eth1_tx mux
> clocks so that rate-setting requests on these clocks propagate up to
> their parent clocks. Without this flag, a clk_set_rate() call on the
> downstream GBETH clocks has no effect on the actual PLL/divider
> chain feeding the TX clock, leaving the requested rate unapplied.
>
> Fixes: d55a0dfec40b ("clk: renesas: r9a08g046: Add GBETH clocks and resets")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
