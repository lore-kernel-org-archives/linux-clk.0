Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60131E0F4
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596994; cv=none; b=ScjCSZ0DzF6lco1YZor8ktB6DXJevGBacpRzzfdta6NBteLLM3e3qfwDZPrWrMO9sBu9sl4/uEq7nm0QumPs8HSW4FieNzMe+9I5nsoY9neI25emNoeqDlFFp59LjShIEBoKs/Ssb2LDi4d74Cfa6S/Otoasw9sUn8STLhLPPmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596994; c=relaxed/simple;
	bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmYbCaEqw5JXwIkPZKJwRaPcgmGoNOrj/oYtxYO0qzcKGkNTFWHh0C8AGXYPcFM8DGO1uQbdmN7lBd81+WOTsHj5Kz/g1YxfNMLoKGOH6hA+dBu4OAtnW+1AvfplgIXxJ0rXKT+GfMGOp5a9cANyC0lG4sg7yMhiqt+wNiC5AfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUGfaqai; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUGfaqai"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso5543720e87.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596990; x=1756201790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
        b=xUGfaqailfILgnn9twlZVvknsFLdaaDvd0vqvVv3J2OlV1wmvU4DB0M/sM11KDa2xe
         i8YagmU7rgfupxhwmH+NBPI4s9Vy/uFYXiXNocNTdb+er7NFgOK8bIpnx0DGn9jhhYV+
         iqoLOLHkNqu/hMI2X+KiHL/6IJ7eTiJR3DmkRidipAG7dnS3oyjcpyF6/rW3du8ZMFKR
         dhCSQYm1/LFv+CMJiBBA6OFpM3NfciPZPNmd8f0/u0Qs2dh+1GajWVxUMdsl3UQAcjeN
         G2699YMNi3HziBPSD/pLEVDhCNo0nEaddDRxLpkI2T5pa4zsATVAXEzgm7aNhn1uAL4h
         yJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596990; x=1756201790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
        b=jOenUergvZ7HGOM+fCilH/0QVu/OPSsqTOtIlIUj+oRIvUvGtiQt41eMCIH0aFfz/C
         rBYhBCjXBXGEA0bfpH8TcaoJg3hN6xN+NZLFDIhsL+7+CwKX/VYtBHwnrqv8nI+F6kd1
         OxtiYAPU1TQwyrx62Qg8tC8947ypzD4GTsKzBYRdbkXC3dbbUpK802cwAeiIzXXKJWvq
         29B7u51evwdkvMkbCxGMS/AKoboVeLSJbAbgtCrwoWb3kos0GblOWqbSn59HWOTypvET
         3XbVxryfhWRQHwN69L1LYn/Goiarhtrg5Nu+M4gJgheuXmuxqxK7YX+7EoiXEE6fygif
         Ml/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyhmLMg+BnDHQf6YMi1mTR+gijfO5Wna//u+GJMEGM8GiohDoISLk9rLME8O/m+LTkmSBgGhSMmE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qwBeLWkmHp0gHb/eXgkoExJmbdNQ5Y2VYUNySOf95c0+r4Jf
	cyfZQtz72qUYHdiJUId1VuIj1pNfNWrBjhkZ13mILkRzM5aFk9els2mEnnJ9EeYS6HUw38/JAB5
	FJKJ7PweBa9qyIECwCX+dUz7Nm5sjPMEVW6iEhzu/8Q==
X-Gm-Gg: ASbGnctrFwBL2gmI+C6g2gYFfi4jB7a7o9Uxvrp0Gt8/ivISx0OLHScV+YyIArNIIbs
	54I9MKpNo0uWsSmegys7G4yNqzlNBt1f8e0gdR9xnCZ2ColWG+sZVPdzVagsqtFCvOnBzPXoxU3
	22rcSE593+625iWplkzLI1ixHEuX9R6J7hxN9nMltNbPIBLRbsu3BS6QsUlJvqZAYAySl8QsgEi
	9vUyW3SXiiO
X-Google-Smtp-Source: AGHT+IEt8RlqWWvwC2uqrmb7EU75OBtpQ0q0kJ1zr3PFW1jsKW7QqgA/pBKXOLyxKfth/q0XXJuPhRlLhC58Y7ZaIjE=
X-Received: by 2002:a05:6512:ac9:b0:553:51a2:4405 with SMTP id
 2adb3069b0e04-55e00850835mr590681e87.45.1755596989499; Tue, 19 Aug 2025
 02:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:49:38 +0200
X-Gm-Features: Ac12FXyEOw7KCbkbFT2OqCP4TngpQPKLbvy9M6n90z-zmlM7tVP9PQNq8vVGJnI
Message-ID: <CACRpkdaW=f7xm+rsD8XUUx-qhuh8sk1mCU-erve-_9S4uUpHbA@mail.gmail.com>
Subject: Re: [PATCH 109/114] clk: versatile: vexpress-osc: convert from
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:21=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
