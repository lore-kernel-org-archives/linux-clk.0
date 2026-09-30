Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4310B377A9C;
	Wed, 30 Sep 2026 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763592; cv=none; b=UNjO0uCCUZ6wfNORNLzWjvevFah7Dc/WrPzrOQStrhBYPWEQ+Lv5QrpNwSkXgMiX+Eu9d8rvYpUsjvt97KZ0Tj7sgv8hha4HK3wJBLJ35KoHEg3orvvvfnzoSivfXFeyoWFghRAcSNIL1ITOgPoMWXbWZEbzLB/GsORDDedyDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763592; c=relaxed/simple;
	bh=jJeVTal18ZboXas5TlF0vpQa6AGU2gJphl8DkP+LlWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H1keaB+LAtWMoYMFUEYf2vE8/bEQldl6jOq4wBIcQIjnSflyt1D1sp5rQtCFzTU5DhhrL+a1mylGVBWYnnxMAaVjqqfsgk8CuUeEBE9C7vbdu5/bIQRCGwAjFg23KBSji8SPUSc+2xza80/BFG2bUmhPyjjHyRmlNmiyEeS9X14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nNpZ6W6X; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nNpZ6W6X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jJeVTal18ZboXas5TlF0vpQa6AGU2gJphl8DkP+LlWE=; b=nNpZ6W6XiB5Nc5MTJcyBWGCqKX
	j6cKBfoDGI+MQo2ik+/teJHWq5My68+4ohp1EICY2XTXxoETiH5RxSOIKaYz5uwcM2Eb2A+uPeipm
	QtiyW5CYiCyIOjPZjqLy4HMSFCTKcm+EzdZJnODlw2RsZjvDgJHfSxa7PpiFtye5E6XNoebW9dP78
	6uUC/gndnqMIgVFE4+oAywabv8gajwt1ppnkUA3FIlsNkAi6R1bp+oKw0mNfy9CP0lRaOjC3YVk8b
	ILpDVJhvdbWddVOiV9r2YTk4kjdnK/cZdlOkTuSBdboUBH+YFGOedYVL25tTLbaShqPw/irPKUBjb
	1nRJGHOQ==;
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
Subject:
 Re: [PATCH v5 11/21] drm/bridge: inno-hdmi: Add .mode_valid platform
 operation
Date: Wed, 30 Sep 2026 12:19:15 +0200
Message-ID: <6458508.5fSG56mABF@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-11-82b4d8e3c6c7@samsung.com>
References:
 <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103229eucas1p2e440f2ec00fdf7986eed7597674bf6a9@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-11-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 29. September 2026, 12:31:08 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> inno_hdmi_bridge_mode_valid() validates the pixel clock against
> hdmi->refclk, but that clock is optional and is only present on
> platforms that describe a "ref" clock. Platforms where the pixel clock
> is produced by a separate device - such as the StarFive JH7110, whose
> PHY is both the clock and the PHY provider - have no "ref" clock, so
> the check is skipped entirely and every mode is reported as valid.
>=20
> A mode the platform cannot generate is then advertised to userspace.
> The subsequent modeset appears to succeed, since the atomic enable path
> cannot fail, and the display silently stays blank.
>=20
> Add a .mode_valid platform operation so platforms can reject modes they
> are unable to drive. Platforms that do not implement it are unaffected.
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

In patch 19 you add the jh7110-inno-hdmi-phy variant of the phy which
registers a clock provider for the pixel clock. Isn't that the refclk you're
missing?

Thanks
Heiko


