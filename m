Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1090230BD5;
	Wed, 30 Sep 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762880; cv=none; b=CNMi7MSkvTmtdBm80gx7zjyzK76lr1w4Bjm/S3XKG9tSJm0nv6azzxBOWV3L8Mvg+snYkaOVW3rec8yfuDgGCuKjr1jHf3zy5rTLEmfwrxExPm2TrmS7R45Kycub/TSlrni8cpNiyClz6VbyuXSfZ4HKf6FzPFzCByYEyStFNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762880; c=relaxed/simple;
	bh=SHJ8hA6cabe4Iy/NBsVsa6CmVruqC9L/5DF3S0RW1vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6rnNCxPbcaop7nGcUfW6+Tj+ErZjvfdTEs/GpyQvnwU3qsUfSH85ii+GYTKt0LMmq9KwGyEEHsZ1CkdQpRfvo2+TSbXQ2l1NxXHyIJZ6N9AaI4RUMTbgAeAKiFzGXjXHIvizCSnBqPpTb+dqP680KXvFcOv/VKKtYoeBiYlQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eGdlbMWQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eGdlbMWQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SHJ8hA6cabe4Iy/NBsVsa6CmVruqC9L/5DF3S0RW1vM=; b=eGdlbMWQKzvcgAr9rF59gzttIy
	jXONQXqjCqmZb+u+8sNnSDDe5skaRKLMeyYQoUIIkcy6HJUOWKNlnI7ksYql+vlBiLdcgvzrogEv7
	PLBHtKCRmBsZXFFKy40faSAFGvnWPQTXnBnb+4Kvof8aib58IF1z6yOIjhq2BNvYszN69p1CBsYzr
	eXQX1glxoZF+RH85bDcvcAhFgnRWk+sCqNOQsRCfT+464eRQhiEpILP9h9pCqQUnd/Eo1HmscTBTL
	7RSQnrYdBIabM4vgGm5f8uMlKOKwx5/emEh6AH8Jjb46UsVtYJqp2q8LV8ZDgqVm/Dnl8V0SRwsQW
	gVUsPr4Q==;
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
 Re: [PATCH v5 10/21] drm/bridge: inno-hdmi: Add .disable platform operation
Date: Wed, 30 Sep 2026 12:07:35 +0200
Message-ID: <14018012.nUPlyArG6x@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-10-82b4d8e3c6c7@samsung.com>
References:
 <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103227eucas1p1a8ef8d6ebb77a6f2cca192e8bc0b4e1c@eucas1p1.samsung.com>
 <20260929-jh7110-clean-send-v5-10-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 29. September 2026, 12:31:07 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> The Innosilicon HDMI driver supports platform-specific behavior through
> the `inno_hdmi_plat_ops`. While it provides an `.enable` hook for
> platform-specific power up sequences (like enabling PHYs), it lacks a
> corresponding hook for power down.
>=20
> This patch adds a new `.disable` op to the `inno_hdmi_plat_ops` struct
> and calls it at the beginning of `inno_hdmi_bridge_atomic_disable()`.
>=20
> This allows platform specific drivers, such as the StarFive JH7110,
> to implement their own power down sequence (e.g., calling
> phy_power_off() and clk_disable_unprepare()).
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


