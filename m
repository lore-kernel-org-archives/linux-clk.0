Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50C202C50
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 04:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755146151; cv=none; b=pdv2zBO4zGKchTUONTDQtBc6dHlwaCloOIEloOxNeU/9irVPkz3Tu6VxYH2fInDO6mmFXbMZHl52xI/UL8iKofy3lfAVkbNrYfaLTdOObS9Ng7tiMgEgzqZnHLGp0OIqHkELlSzAiBB7TakLavoPgzxFdcKemJPDpF32RghDn3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755146151; c=relaxed/simple;
	bh=QGb/WSxQrkoalS0PQR6chjMqXIC8l1e9Dtd3KAUUo7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOv8ib7zNdOoKYPy4bMf4ZMgLWJs9UZDiBrA18lwA198kQ/7lY1GMgkqFYJBGseooYjBwYmd4rRwDKm5bF4SinMIzXOHuQMf1wplKkMrI1OEJthTW80VkKCuiJC/Yr1/0aNdQbIGUpiGXPpqqBNuUDqBlwPKVi6fQ8/9u/+rd1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=kfBrl5m3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="kfBrl5m3"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b471754c159so256205a12.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 21:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1755146148; x=1755750948; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W68wJmIpwZKYrhZj9rQMZlkUfiQu51PmIXBdt9PMw2k=;
        b=kfBrl5m3X3pUKzeASIa5uThvSEb/zB82C2JruDgTOivhhSjhUjMBmcPL8IhJVxAjVG
         6qON9Ajt9fHHBWQKEfYsoV1u4jSeEE0qNkZh6VuTz41gtP/7s1I8dBc/NuAwLu/lt9KT
         CKKBnN/q50LzlMJEeWPS0cO85J+8t6tbmlZGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755146148; x=1755750948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W68wJmIpwZKYrhZj9rQMZlkUfiQu51PmIXBdt9PMw2k=;
        b=Y2CqZInk1VKBXLAm74U+LVvdkl8RKN5bicXjyp9rZfGNX9kSfDhd4x+gxfz7GE82Ao
         PVBNf8I8LR3+QuCfU4GRXM4f+dyEMOGNTuxBdZgSWjP5+D7UfkNfif9VbrIfGDUOds25
         r16kQ39fvhGMSlHYlB8Cu2RmkN+6yxDBBi2NOkaAbWV2zgMsQGVi/MoSFpyo+rjPbQvz
         R2va4w9ws0RVAbQDmw5V+nfrW2pxlj/JHoKz+T+EnQTHrFtUF7cnmTQ2ddjdVLlwmaZ2
         6FDm0ZeVOHf5CdJgET5GPgeDYnyYe+mK4vZce7OMlV24Y98GgEzpjGa0P8KQXZJtIsCj
         368A==
X-Forwarded-Encrypted: i=1; AJvYcCVQWruttelJxNFWUTggPULzNjaHxvo3N1nVnf92UuBoJsq8V4QMhvZ7LyC2hIuZOSL1sGtfJBu8DUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZBFRR7Z7aenNVbH4dcVpSCLYt1F3ivU3hM4soUHRtTurt8kw
	4rZD7Kq2EbyeK/FoxpKO259Pj1kqs6+bSaRcPHSN/JyZHIqab8D7ST47kabv3YxLKH8ylFIYPOG
	0UT2vKQXinI+pp2D83sn+JFoLR7jexRmSPOzPYcaLVA==
X-Gm-Gg: ASbGncuc0qR/jkO3DlGAHR4v3MqqXBdeCNFV6yGFPRD1g3QtsoWQ6plvGyGezFVUgRT
	P723PBkIkxCXe7KVffvfMk+GKD2lMF4FoU++zsIGsF4KHNJTIY8rDipBBtIX2dArjem83yp1Q4n
	DIm9OTy52xSmVJBqewzF0iY42tbbvLCoAjS6c10S6TX5L6vcHZtkSLznr2/Xi8ThkHp6WBZpBQK
	5DilIFGzxgO
X-Google-Smtp-Source: AGHT+IFjwIWeQGe9GR6r4b2M90JJvm8sY4wwHgdbP9dAwNnEibxW+RtNYUEdWU1EXNpbiBYlhjSbLxcOxiikHu61EP4=
X-Received: by 2002:a17:90b:58e7:b0:31f:6682:bd28 with SMTP id
 98e67ed59e1d1-32327a52880mr2616043a91.16.1755146147789; Wed, 13 Aug 2025
 21:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-84-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-84-b3bf97b038dc@redhat.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 14 Aug 2025 13:35:36 +0900
X-Gm-Features: Ac12FXxr3rvVXpJVntmlzZatJLppeB52b6KjThcDVumW6l6FaIvxvyr3Ex-UBYM
Message-ID: <CAFr9PXn=jJPKzMcTa-TJSNuNQknauEttNZg=jV3sBwkTYqxLcw@mail.gmail.com>
Subject: Re: [PATCH 084/114] clk: mstar: msc313-cpupll: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 12 Aug 2025 at 00:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/mstar/clk-msc313-cpupll.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mstar/clk-msc313-cpupll.c b/drivers/clk/mstar/clk-msc313-cpupll.c
> index a93e2dba09d3523199263494efd2bf6987bb4156..3e643be02fe2a79c043c1b79a5e95c869b757ba1 100644
> --- a/drivers/clk/mstar/clk-msc313-cpupll.c
> +++ b/drivers/clk/mstar/clk-msc313-cpupll.c
> @@ -140,20 +140,22 @@ static unsigned long msc313_cpupll_recalc_rate(struct clk_hw *hw, unsigned long
>                                              parent_rate);
>  }
>
> -static long msc313_cpupll_round_rate(struct clk_hw *hw, unsigned long rate,
> -                                    unsigned long *parent_rate)
> +static int msc313_cpupll_determine_rate(struct clk_hw *hw,
> +                                       struct clk_rate_request *req)
>  {
> -       u32 reg = msc313_cpupll_regforfrequecy(rate, *parent_rate);
> -       long rounded = msc313_cpupll_frequencyforreg(reg, *parent_rate);
> +       u32 reg = msc313_cpupll_regforfrequecy(req->rate, req->best_parent_rate);
> +       long rounded = msc313_cpupll_frequencyforreg(reg, req->best_parent_rate);
>
>         /*
>          * This is my poor attempt at making sure the resulting
>          * rate doesn't overshoot the requested rate.
>          */
> -       for (; rounded >= rate && reg > 0; reg--)
> -               rounded = msc313_cpupll_frequencyforreg(reg, *parent_rate);
> +       for (; rounded >= req->rate && reg > 0; reg--)
> +               rounded = msc313_cpupll_frequencyforreg(reg, req->best_parent_rate);
>
> -       return rounded;
> +       req->rate = rounded;
> +
> +       return 0;
>  }
>
>  static int msc313_cpupll_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> @@ -168,7 +170,7 @@ static int msc313_cpupll_set_rate(struct clk_hw *hw, unsigned long rate, unsigne
>
>  static const struct clk_ops msc313_cpupll_ops = {
>         .recalc_rate    = msc313_cpupll_recalc_rate,
> -       .round_rate     = msc313_cpupll_round_rate,
> +       .determine_rate = msc313_cpupll_determine_rate,
>         .set_rate       = msc313_cpupll_set_rate,
>  };
>
>
> --
> 2.50.1
>
>

Only visually inspected but seems correct.

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Thanks,

Daniel
