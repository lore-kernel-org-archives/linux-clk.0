Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4323E2769;
	Wed, 30 Sep 2026 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763142; cv=none; b=DOCYy3zUm1qTe2dk30PFUsluiKV7/B3onaYabfFpZRL+M3DmGbXuCf72IJDPRIXzGJ3C44TsV3CnsKgh1IThNTwPD/yiNg1u0XQWFWSJkk3nH3gKGwSLOqbztBHe+humcdOWg59dz+fKGEV6h/WYmQ0c/zzRW20gRivnwVGtlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763142; c=relaxed/simple;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9HjF0L9veRGlGqPOpl0c1UPm9gnRLQQWXVZrR7tWUjmuHtI/WxWpAZ15YgL4ybYjvDYwz5RDl0zi0X0ZvSoJEI4NctJDJCTXjgpFINNIQd9SylI+CQGttqEdtXaA39jznlPF8NxZipZYFtVoMvpiJ/fp1NNVJilXVbwWah7xpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=R7PSEE70; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="R7PSEE70"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=; b=R7PSEE70K/QFTnGHB9WIW4gzJc
	1ylFt7T+MWYG5qEfkLdhthKgNWTrT0nMsJQ79ejoq6nXfOfR4GVRmY+EeEVUoZvG1iPZ1D17prYHL
	0RXzRYXPYHt3EtkXtzTzpWKTrW+EMq0gKFLJaDDtzPL/h3RRwNowfSnX7h3l4DVifWlXY6I4uf1A7
	1JEG90bi/jOCwWqixhWUnR743rng4WyQwfovKgU9x20lDMqrtqCLBCepb23bfEcSa52gqMHn2pLqe
	mDE2tnd1KVAsFMIOZjOBNjEKl8qxry72aGveQPMyTUdx7bOEmXmUkCryFovVt2jDg8GcmHtQT8jTb
	liz/qjGQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v5 17/21] phy: Add common Innosilicon HDMI PHY helpers
Date: Wed, 30 Sep 2026 12:11:50 +0200
Message-ID: <5147655.PYKUYFuaPT@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-17-82b4d8e3c6c7@samsung.com>
References:
 <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103241eucas1p27d80c31d14062ea876a2c16ddbd71e3a@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-17-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 29. September 2026, 12:31:14 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
> where the PHY register block sits in the register space and in which
> pixel clocks they support, but the pre-PLL programming sequence and the
> layout of its registers are the same.
>=20
> Add a small library holding that shared part: the pre-PLL configuration
> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
> and the pre-PLL register programming. Callers pass a regmap, a register
> offset for the PHY block, and their own pixel clock table.
>=20
> No driver uses it yet; the users are converted separately.
>=20
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


