Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF02BDC1C
	for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517072; cv=none; b=tqTB8xbu74he09VD0fSQPKNLzL2Qjp0OwUoXf+G+8Als7YifAAY+3gGSCM11AKUlnSWtaxuR7r8zRuDWZajPCbW1h2x6fyGOSDPE1xeCPXYDx5ovPxn7B2R6ghG4abcDweI/CLir63a+LBN9oTthcpvxcGTpKlqZhq1k9kV0x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517072; c=relaxed/simple;
	bh=4xYmgybZuIZtjSnb7/aPKTUrgeBPIO8Jv2wpF7I5zbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPe7T2Tk40xLwmjQzG3/5Iq334MpY18Z9gqNbO89TSuCzJuPhxfjxEoFsWSJotJUqFkn12blbT7offbEKJ0oDBglVuUwM5wXZE3kwpP57Q/Bw+xtcYzTBBXlIJcU0+zejq3+1ckpNTRSTh3wY32KwMZCfw2HrMmOnQ7j3J6CumI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9SR/CDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9SR/CDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705751F00A3F
	for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787517070;
	bh=Hz9a2/4b0H2hGIuQcX4i4J6vhXjz7a1tVe8/vJ1mK5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z9SR/CDW2+RChZ3knjritt88WVf6xuW1xAcW5680A4MsxFF1qx3Cyc2rapAylHwmY
	 i01kHvJ/Qt8Az6ftSP9Wlfop6xlECrhrEo73TxjT0/f/TMQve4hcix+HMncPTM1HJF
	 PaB7k9Vh9OJ+gqrSWVZQTIzVw2l2P5vSW5Kxn344fH7uIP+cOEvTizQYaQ/F5cUzA7
	 p+sPgYQkVyJ1IO3DrZBKDbMjn5pO1E6mwMBR6s32rJgu0EpbBk5Sz2CzP916HdHBSq
	 EsQUo4o2t5BYNwQt0xwWwIZl0XHOiTkx56XOJJ9rE7ywoOqP3O2l4SCAosPzB/PYLc
	 Yuaa9lHQxDn9A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so4799012e87.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 13:31:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqRPm6ezWDij0tIbiXzMTA/0e8O+G2D1f8uIinpLPJhUXQs5V7D2uGsneJDry4+2+b4sk1FsKE2whw=@vger.kernel.org
X-Gm-Message-State: AFuF++nps/lKSil84WBeXlNtVxa8TmL/VZkskDE8Ditm8MXgGqgcY5GW
	G97MOLJHPXYbA21n+SB7FqqAF8pM0zagJM1akKKgYAY0q+906gMNQgFMzFI7dHaQEZeCsYFa9HY
	PQvt8nUQG3PyNaFtmjxCwpZ308vKm+Yw=
X-Received: by 2002:ac2:51c5:0:b0:5b3:12b1:be93 with SMTP id
 2adb3069b0e04-5b484736c8amr4269481e87.0.1787517068028; Sun, 23 Aug 2026
 13:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 23 Aug 2026 22:30:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkYE8Fh_HpKPYjL0-ksVQA8f_iLRFNkPU5Jvq+ihay5ww@mail.gmail.com>
X-Gm-Features: AcwNN1U1aXPtuwFV8knvjn18BtYzZuPH0iZTVosQkZ_l23SVekgfIt7U_k24f4g
Message-ID: <CAD++jLkYE8Fh_HpKPYjL0-ksVQA8f_iLRFNkPU5Jvq+ihay5ww@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
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
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

OK I trust you on this one:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
