Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD79379C38
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247252; cv=none; b=XEvqlv5ae92G76pesFiWcEBd0SRwjcC0BCJrRczsrA7VxXw6FD2UWXIwNz/ARW3/bcdCFxFyn6qPt9rnuRZ78KxMPAjCL3vHPJXH8OCXQS5XpesuGdNL1xWeOobnf1Qe01jYA7To9V58kBWxV8cIP/7C5ahmSlmR8P1noxmCOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247252; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H55qSdiAmF4xOR2wcjdLeqZceJydpstAGzvZR8IbfaUk9eLScOz6E3KBUZnjftbMeZVF2/kcwS43nS8hlPZdNWuAns/if7wKzjEE0tVHMPTEkEkvqlGX0icnq2w6l/QM1U8VUDvsjo6p+VCfMhM1T/v56FSIhJlCdZ0a5UfTIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93906e8a5feso451649785a.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247250; x=1788852050;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=aq2SAaBcMlYoh0VqVtALONM1a4lDU1vBBMbgLeAzW5J9HfJGkkVqzJEI/VC48VVqas
         vKol6FmbkN7sKKnmNtHmiTEWguzw36AXiQE4/gQl8W/Gi1fB7xHf4zUC/p33PryrpaN8
         I9s29DOhcS0WNN3+XhHkk+qdRBDOp3j5V3146kmy1flZi40Zt0rfGHrscm8e3gWV0EGM
         XLQzP5TDSG4YCSjuUp4BBxZu0/+5R+wYLKfzetbFLh9+eo1qh8KOMrMIAGQRhwXsl5zz
         gG1soXNEiHe8NPu83lBeSAR8XOrIt8sOVDNVTs1B0iYSsd49IEf8i5fqY3bZFpBuvZYU
         b0aA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9kMqEZvkbgHN4MyM/9fdZxP52xEUFbOOtXWcNhShJPVVXz8rQaSetho5Q1Mq8lKbWCGcQhxHitqE=@vger.kernel.org
X-Gm-Message-State: AFuF++lvEUC3JpRo1JQvYpPkd3SQJ2L5dsrVAYgdzwphHTQgaz84Z8PJ
	Pzmnu7XOiH1G/edC4DAOHP7HWYbUdEy4cnYPoi1VUrqM3aVmFDi/yHiSmD6xv7tu
X-Gm-Gg: AR+sD12UHWkqRGWefwgisDlRk9i5cDZ508cgv6TapXFBfRF9ScoyZhgw5F2qTwgHVlo
	7LyoGGnmq8l5vNRWgHtuhBlZFmKJjDJs++2IFy0OVaTsbzaqOqh59yUqqYtPn7J6UcJrO8TEyPL
	G3W8kw++/KsrAkkABHKvAQmhPzem8pX7sZneFv4flDFQi4R53KlAGZR2q5gTRVRrlVSeqMX0kXL
	pAkuAYjYt7YFEXSPM2wHPT++MseyNebv/e6CLBfsEBvftaUEv3JAzkntc+HUqD22BAEh/MK74rT
	WoKx3lE6oyn1WPjqrZVeINeQPgDXpX3jzf/ETiE01dtasBllpaOqizn/+yTP//3ahpoF62ydJRd
	SbSUlR3A+cmGoJDAcWIyWSbZNlbQtg9FLQWp3+6oQqj9+7et/Pj1izHGw3p32BD5TeFyPOnxlCv
	Km8zF8lGWfPxhZmpQoTCgjmDfUNPZUDvI1j/dTvLddHDGxlUCNFQCsDnR5EZ1ABXnl+QzqsS46B
	UH1z+3MxhXIi+XbvtVHpQUrhhs+1Q==
X-Received: by 2002:a05:620a:6d0f:b0:92e:fc45:3472 with SMTP id af79cd13be357-93913923068mr2973682885a.29.1788247249506;
        Tue, 01 Sep 2026 00:20:49 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a6be1sm970457685a.27.2026.09.01.00.20.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:20:49 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9382fbb1208so464572285a.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqr2CKrX6i0cpOsR/NJFcEDdZ787jVcpPBbRY/RGYDTqp4Dqn5Dh1rkJJIQ2Xi/psZxCuTXbhj9Wvs=@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
