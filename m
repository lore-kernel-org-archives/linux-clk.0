Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41AF3EC827;
	Wed, 30 Sep 2026 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763305; cv=none; b=TT8jZ/JoBcrAvIFDl/YEM0U00aRr+ET5yjwAEf7BoCNpBWuYJjcTVClakkXfVFSawjuuJpKLcD9A4Y5AODQ35GrwS/ntlBuZY/G5e4oTBLRaFK3Vi4XbG1VLIfe+YX00eYKJpYrK1k7Hp0cAhrp3Hzy/9nan6DInrcczFT0bhUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763305; c=relaxed/simple;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tou+C4h1DL5oVTwjo6zmZ1wKmjpMMn9lmFskun0CWBdt0fcLir9CiJBnPHA55noD/89Opgasu8PYHqQ8LMKzRn+sYxps4S3sd741wl9ejVX0ua3mjpM24gtYICVMxitMXfxmkmVuyVHY+odfh36bm6ZTCxJONGpg9RrkPbxD0Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=aZGZGfJG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="aZGZGfJG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=; b=aZGZGfJGrtsB20BtlHvOPFQKSe
	AZVuyaf4pho61ToIbowX2dFtcUR1oOw8x7uPdS14NJadzDDQ2RLI69MhxozNFa1H4KsLGCx8j55Q3
	dMhTWz1qQTyilGbZZPovjP9NLeuLpRHDeI/8xmfvrD85DXGbXfChVP30VXyK0J6q3aA/gpMWZeLj5
	fHO6cXX6d32eZ8cyOVsKMB0/6LBq9lD19lVRLXTT9RebJUybRmZV0Tf/SCokesG1QZsavYz4AqY43
	MgRXkJdKSjJ9IUdwOzH2f9FhaEksRgk6PswKV+l7pnz/7VyAAO3LlNHjkC4gSXpdwgEPUgFaR+Bm+
	oPVV8jjg==;
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
 Re: [PATCH v5 18/21] phy: rockchip: inno-hdmi: Use the common Innosilicon PHY
 helpers
Date: Wed, 30 Sep 2026 12:14:31 +0200
Message-ID: <7069377.kQq0lBPeGt@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
References:
 <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103243eucas1p25abf97a357cfae14640092e35fe479fc@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 29. September 2026, 12:31:15 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
> determine_rate implementations are the generic Innosilicon ones, so drop
> the local copies and use the shared helpers instead.
>=20
> The RK3228 pre-PLL sits at different register addresses, so it keeps its
> own register level code and only shares the table lookup.
>=20
> The now unused RK3328 pre-PLL register macros go with it, as does the
> local pre-PLL config lookup wrapper; both call sites already have the
> TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.
>=20
> The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
> shared helper logs it too, and reports the actual VCO frequency
> alongside the rate, which is the value with the 1.4-3.2 GHz constraint.
>=20
> The register writes, their order and the values written are unchanged.
> No functional change intended.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Only thing I cannot really make up my mind about, is if this and the
previous patch should be merged ("move common code from rockchip
variant to shared helper").

As I said, can't really decide what would be the better solution ;-) .


Heiko


