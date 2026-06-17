Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D2E3FE658
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701031; cv=none; b=FvLI3MD5zSXX1id1ubIpWpF75EtCtJcEqjI9yJAC1SuzOOgkU+URd4eBlalugNaW/ilf4Bpg4SbOd40Mnxju/A+dwgAW2jAFejupaDAQZtSAbd9/Wc9h+kMr9QDZQ/YzRLgc7asqJb+qgDzdhivYchFQDXU64e9ZcaQ02MQBBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701031; c=relaxed/simple;
	bh=eAJa5Z7c17TZStR9rqFEHsqcvbsjvgQzGzaVPiveyPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDgq9KK3BnDebcBmUzvZW+QnHiLhZunkJ+B7yK/xPrW3bQwl4dIvNMjMdJs1ZN9SyUs/VpREw4IepE4UyJcCvNLU5QIZAvrHaWjkw4jbJNvAousWOgnJ9MQi8ILlx3lkAzTFN/1979BGQNAGqrJ9PnyS/ERNbwdN4+ah34e7L38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59be89d310aso689677e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701026; x=1782305826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEtTfrrI/Wz6zTu9ke3mlvoO8DQaZTH3OhHIc46SAvM=;
        b=KHcJhSU4vNkkuI4WOFZYP0HgmzQ44kzKXYHqHmjDBBf2MtS7/DfQQXLMorSmqA4Y3H
         BRAGBDnsB0B8E1VwnonkCrpAK9Pyy9Z0iPIDpkgG2wO5pXbIlHwWRAz8UxlFuDgo+NRV
         QkwB2UeQ7XbDBbBGMf9m4NDYgMxCkZx0IV90xYFULqp5lELcMOdVnkqDGpquxs24RB2v
         /eNPwDJu4DlgHqnXzfPNGjWtRyVuGTJ9eZ0SeYINxFu9HCoWYNIIrVdvB2fO7ciDklqc
         5YeRA1JZZ36eY2X69ngl4TR1W6JSv00K6GMOVsR3sjf5S60byX9DdPmk0HkrYB41QlbY
         B3+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PKRfgV5VFSmP4fFS2Nhq+sqO/kLUch3cA35Gy179enjV4Qofo0EQGqEhA7ep8SRcMmaxw/LSGDDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWb0WlsJB1wZK6bIMuZtdhlTooaS02OrrwmN4kunVuZkIHnae
	t6W4+tgtXbjKOSKK492Bf9qT4WC1w3fdZR4DYZMdBtBhBaX4nemMTpGid5pogEkQ
X-Gm-Gg: AfdE7ckNobG4bOx9sTXRNu/BY1jrk7cBY0B2U/IGt0ny0j4WZpRQv6rmerV4t7OFX7f
	YSMztWN/iGRL8Xwx2Gfl83geovEVt4pDRl3hsHiXeBRNFSMzqtpYHEj/o7Fo8FGU4G2hTW4Mw1V
	5COP9EqoQtcQXwufVsMStPE1LmvazTbFOcdVptyFu7narYl7j1IrhhwNgYROYep7NalLfStcg14
	c3WURRtkDRg5eFMiQjxc3vxTv63O6oV/VfFziIt6i6QwLVcISlTIYXYBGCx6LqM0rblQFkChmNz
	vzmCftDlHgYkPHmZWSKeHAzyafZlhwXPxpnjD4lc3aP1/u6SD+vx7ErTHPzcsW3ZakIyrKy4e3X
	L05APaMXHmHe0FNF7HKqHD+votv/GIqg+OngVwWMO0yc/DCYYu17nu1QQQWnAPx01uFs/ZsjGX+
	uurlZ7hKGFTQzkYeFm2BB8BgBZpnC7/I+/YM8+xt5pr/A/M/AfUg==
X-Received: by 2002:a05:6122:a29:b0:56f:696a:4fec with SMTP id 71dfb90a1353d-5bbc12ce2f9mr814231e0c.5.1781701025910;
        Wed, 17 Jun 2026 05:57:05 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac206sm8276853e0c.14.2026.06.17.05.57.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:57:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966db0b76daso386082241.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/W82wBGbxEAD2e4bO1ZKSpv1Po0ISb/tAF5xBr2UWudMP7kKULCBm8nxBme/TdcOKUJt3CVR3mL6g=@vger.kernel.org
X-Received: by 2002:a05:6102:8641:20b0:6c8:c356:16c9 with SMTP id
 ada2fe7eead31-724f1a0615amr792991137.20.1781701025499; Wed, 17 Jun 2026
 05:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com> <20260616104459.410743-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260616104459.410743-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 14:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvLONcWTQTXnhgZKggeuH+AbGjGQRy-27NSsj3kahQhQ@mail.gmail.com>
X-Gm-Features: AVVi8CcSTexP1elil-Cs_kpT3RJ3HOMSGc_nsDjzYQ7yPZXpnlMWYOf0IebDQ68
Message-ID: <CAMuHMdUvLONcWTQTXnhgZKggeuH+AbGjGQRy-27NSsj3kahQhQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] clk: renesas: r9a08g046: Add USB2.0 clock and
 reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 12:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add module clock and reset definitions for the USB2.0 interfaces on the
> RZ/G3L (r9a08g046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
