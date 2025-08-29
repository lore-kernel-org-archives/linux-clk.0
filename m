Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A318CC13
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756428480; cv=none; b=b94sUs84ZypiOCdlFVPI5pyLC9v+rjs/bOZZAHxB+pKp9CuQdb9BG19n0aGZIxHuZ0oaUWacMkPNKN0PPf1Ds5CstxUE3EosQ7TEMF4iWsl0p4/RLA6ytE/gLFRO5tuurgGCE42iYlu3wk2ifbgCiS7wITsWf0vPQcBzfO3xw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756428480; c=relaxed/simple;
	bh=2hr2jy4IpoCDgvk7s9IjtfXTVDQh1mDXQrhhYPQBqgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QImC3OAiiti6eDDINS/s2j4/bm8mFlFkrgpklJ9SgGUaEMfZGbN019jWFvlxmxAzFssHfsiy/LT+29HfDxSR44Fec8zhoYZBcqFE0HGxfBqktyIsbkQqGHB10Tz+V0O2zhDTtbgTK3uhzNWP9GHpadewMFqkMuTjFutz/cZaNq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRIyUMrs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRIyUMrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756428477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
	b=eRIyUMrsdAYkfHt4XKCp6uZVcaF8eYVW5PQTWDPnRfcFh/fZ/OCQknkdaU2gTo+kNSqclk
	KzFj050q9fo6aXu7Xs7kbYSaiSI49YudDmWSTgD9iJoxx+XvlV4TYN/0OL56J4V7l+IoYq
	yJFrdmdnuvJZ5NGYRkAj9b78M2tCnOs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-rTaGop68MWmIfubKLc3Zvg-1; Thu, 28 Aug 2025 20:47:55 -0400
X-MC-Unique: rTaGop68MWmIfubKLc3Zvg-1
X-Mimecast-MFC-AGG-ID: rTaGop68MWmIfubKLc3Zvg_1756428474
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7fc5584a2e5so95612785a.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756428474; x=1757033274;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
        b=s/+m3ZjtZXEpcmnf6pCn7ZlPNiNin5FbT+uW7tktg9n5lfj7b8Vb+t92Lguyz2Vovd
         +nV02xjOMkD5rNSIRMSG8shk5LveliwJFZjVMGLlwnP2OUQlNw8neuFv73nXw0e4LrPG
         PW3oL3ET1RQ9oT47Hr9DJUdTXBK5ZQrWRr1OlWyjqzueJwzl0NrMtF3J3Pv+81b9uogr
         ta2J7FMjKGFghg4WPvpz/sOIZYoLjaNdTKueJKdrxT4s7ncuQzMrh2YhK6QtZ0SwnsNl
         Aeyw4twCZ3gtn1TbojciEkVJSl7xC7UYgZBJCAGEci8EbTwikol1FGf32hah/jQ7lCGO
         yV8g==
X-Gm-Message-State: AOJu0Yxvw9+JOTGEafemoE81welZmN4afr7yFuqAP9A5saglniEdQrN0
	Pb3k1ofpyjFFsTNDBAJbEk/FfkedLfqb739quMNvNSYBzUglkcOVZ4Bdm/ZdztNWAwycNm2c97s
	Oe1IOqEX9ifsQfG/UL1X9gAj4E42wBRwse5Yophodj6xe0wZbvmaKRSJ110dXEg==
X-Gm-Gg: ASbGncvZKcedUk3OkvPXvlJwGTxDMoPhjst/pe48KwF+8pd0m81CUMullMwNVw2FdCs
	WOjkrRdpqC+zfP1nWaq4A9QtqzodZv122LMFHB7Y2qIhjgAPJiAesQcniPX0WizBSQ2PD2dTEls
	spSWnyX0vC+hHOR7rSD2w8rOvYLkQdqi5OMATIIYEsS89VJ4wdCocvjd08+0w57ndKmNTpofWZT
	jHm9r/kctufTb7oVnDUd6pJupirS/FYECIX/vlmQcBUvAxdAFm4XmFzv9jJJAM2sGR0lNbEuYjT
	b6ZYRcaWr1bDyC7BpSFp9sVPOxkkJszuTQ3lQP5IkSNoU4G+mRuZKoacYQbW4sSkV9L3u3y0p7V
	oj+OtW/yBkpJ5/l4xM5A=
X-Received: by 2002:a05:620a:408a:b0:7f3:caf0:8412 with SMTP id af79cd13be357-7f3caf08452mr1587634185a.46.1756428474351;
        Thu, 28 Aug 2025 17:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCgf4If/yLnG9xLRPpSvaRiEUxzvfevF39cHGHA+NM0Oih06WQG6xkNf8xHsAsX5EmFe8lQ==
X-Received: by 2002:a05:620a:408a:b0:7f3:caf0:8412 with SMTP id af79cd13be357-7f3caf08452mr1587627285a.46.1756428473789;
        Thu, 28 Aug 2025 17:47:53 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14754ee8sm80548485a.32.2025.08.28.17.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:47:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 20:47:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aLD4s0sGEaQKD9PQ@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.

I posted a v2 patch series with 8 patches from this series that needed a
v2 to:

https://lore.kernel.org/linux-clk/20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com/T/

Sorry I didn't put PATCH v2 in the subject. I noticed as soon as it
started to send.

In summary, it fixes one merge conflict introduced in linux-next, remove
one case of &*, fix a comment, and removes unnecessary space after a
cast on 5 patches.

There are currently 7 patches from this series that's currently in
linux-next (renesas, spacemit, samsung). 

The relevant remaining 99 patches from this series waiting to be merged
can be grabbed with this command:

b4 am --add-link \
	--cherry-pick 1-37,39-47,52-63,65-67,69-89,91-91,94-94,96-96,100-112,114-114 \
	20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com

There's no dependencies with the other series.

Brian

