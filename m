Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D1199FAB
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519551; cv=none; b=nL4ArFWIhcCTWdDPzCNz+rUZ0S7ZqX5kA2YvsngtIr9kBag10/1hKc+8H8rVwONNpfLwCW+3dgbP//S/P6ZRSYhZPC1Wlg44mo9Kl0MRQ9fTRyWp+BV4Pp2qV8ZCXZOKIWAdbxth1DUn9s6eaf+7DexaxIVi6k3K9bWpuseaYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519551; c=relaxed/simple;
	bh=RMvbwBxno+Tb07Mx42tPhYykW/4X6mwmOraQ9Jzivcs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OjDbOuHB738wn70y5vrv75Uipc2TOeiF0n50LYSGpWjmcXkZ/J00+fBb3Sf+3eYmgkzRoPyywIxY/0FX/lPMu58zgWw4L12QDzDrRruTAlDDcSS9JyR/9BJhDqDb9Sg4ecIzyVrO/MRZE5M22wtVbpacoxSoKYAtOCRici3uYJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=Yfkr5AeR; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="Yfkr5AeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1789519541;
 bh=s2V8BnF8h+8Uq8u8VZxp/reb7V9zH1peGA2ahNF542Q=;
 b=Yfkr5AeRKQVwcq3DQfTCnTG7jeXq+7qEgqgIb5toGGsWYLirjA3GDDKq629GdjHYQUoXO2XH2
 yj3ZLstdOZfIeMJAAZibBuGqSSCtrrN6YPBXniVOT/5L/kpjQFV5SVDstEjmlgYRUadMagWhbkX
 pEsWvKMICDFRQz7O89umQTbMLbU4q/K3cROu7/WeETmL1X7JOk0T5ZOmtcGJHmqba3ykJ8R/wcz
 6HPGF0mu5xUyJwIxEP/jC379etfmCKR8wrE7kQMCuTeGbnr4CPjl7RY60aqoCCVjN2q0zzh2J4R
 gU70Nel6T9xWz9UjvQhkL+LY2qEV1ZYvgnu98Gf95AXA==
X-Forward-Email-ID: 6aa9e69076866d48a84e7189
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 15 Sep 2026 20:45:01 -0400
Message-Id: <DLGBPXP4F8E0.9X0QMZ9GFQVF@ubuntu.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mfd@lists.linux.dev>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maud Spierings"
 <maud_spierings@murena.io>, "Graham Markall" <hello@big-grey.co.uk>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Chaoyi Chen"
 <chaoyi.chen@rock-chips.com>, "Joshua Peisach" <jpeisach@ubuntu.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 00/20] drm: starfive: jh7110: Enable display
 subsystem
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Lee Jones" <lee@kernel.org>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Emil Renner Berthing" <kernel@esmil.dk>, "Hal
 Feng" <hal.feng@starfivetech.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Dominique Belhachemi" <db@domibel.de>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>
X-Mailer: aerc 0.21.0
References: <CGME20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61@eucas1p1.samsung.com> <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>

On Tue Sep 15, 2026 at 11:32 AM EDT, Michal Wilczynski wrote:
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>
> Tested on a VisionFive 2 v1.3B using modetest.

I.. got nothing. I did have to manually modprobe the modules, but
unless I am doing something wrong.. I didn't get anything and modetest
just gave -2.

> ---
> Michal Wilczynski (20):
>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>       dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-control=
ler
>       dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem
>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-syscon
>       dt-bindings: display: verisilicon: Add starfive,jh7110-dc8200
>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-subsystem
>       drm/bridge: inno-hdmi: Split probe out of bind
>       drm/bridge: inno-hdmi: Allow the register map to come from a parent
>       drm/bridge: inno-hdmi: Add .disable platform operation
>       drm/bridge: inno-hdmi: Add .mode_valid platform operation
>       drm/bridge: inno-hdmi: Make the PHY configuration table optional
>       soc: starfive: Add jh7110-hdmi-subsystem driver
>       soc: starfive: Add jh7110-vout-subsystem driver
>       clk: starfive: jh7110-vout: Allow pixel clock rate propagation
>       drm/bridge: starfive: Add JH7110 HDMI controller driver
>       phy: Add common Innosilicon HDMI PHY helpers
>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>       riscv: dts: starfive: jh7110: Update DT for display subsystem
>       MAINTAINERS: Add StarFive JH7110 display subsystem entry
>
>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++
>  .../bindings/display/verisilicon,dc.yaml           |   1 +
>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        |  95 ++++
>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>  .../soc/starfive/starfive,jh7110-syscon.yaml       |   1 +
>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 ++++++++
>  MAINTAINERS                                        |  13 +
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 121 ++++-
>  arch/riscv/boot/dts/starfive/jh7110.dtsi           | 105 +++-
>  drivers/clk/starfive/clk-starfive-jh7110-vout.c    |   6 +-
>  drivers/gpu/drm/bridge/Kconfig                     |  11 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/inno-hdmi.c                 | 112 +++-
>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c          | 297 +++++++++++
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-inno-hdmi.c                        | 298 +++++++++++
>  drivers/phy/rockchip/Kconfig                       |   1 +
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 168 +-----
>  drivers/phy/starfive/Kconfig                       |  20 +
>  drivers/phy/starfive/Makefile                      |   1 +
>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 579 +++++++++++++++=
++++++
>  drivers/soc/Kconfig                                |   1 +
>  drivers/soc/Makefile                               |   1 +
>  drivers/soc/starfive/Kconfig                       |  43 ++
>  drivers/soc/starfive/Makefile                      |   3 +
>  drivers/soc/starfive/jh7110-hdmi-subsystem.c       |  73 +++
>  drivers/soc/starfive/jh7110-vout-subsystem.c       |  82 +++
>  include/drm/bridge/inno_hdmi.h                     |  10 +-
>  include/linux/phy/inno-hdmi-phy.h                  |  85 +++
>  30 files changed, 2337 insertions(+), 188 deletions(-)
> ---
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
> change-id: 20251031-jh7110-clean-send-7d2242118026
>
> Best regards,

By the way, something weird happenined while I applied the patches
using git am. Somehow, some were out of order. The 10th patch
adding .mode_valid tried to be applied before .disable even though
in the series, the order is correctly set? git would obviously
fail because the .disable entry did not exist in the header, so I had
to manually put those in.

I guess it's possible that something went wrong here? I personally
pulled the mailbox from the lore.kernel.org mbox.gz file.
