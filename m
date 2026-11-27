Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773386;
	b=NDm6B7BGz2xbhRWpZGexD7v0C/nnPm9xKOeeLXk1QkPCRapA+nEvh9kmr2nIf+jL3TFH
	 EGGZWPq2yWSX9MkhoAVo6p6T5iEnpjTpTlLZuz2aKypMIgB3r+xYYI5QH31bzW4CoZiw7
	 XyuNkwbYrururI2lMTUZ3WVSYWqtDvScyVnEpNAIsHdwDUK6DQ3A8AiGrRJ9y6KZt3WAy
	 ZuuIFCx2vTuLbYtAjXr2aS0Su8JV5+IdyoppUN5X40AjJXaoa1KHoQJkUxvb/ImM8a2r0
	 JX2FV0z2LCLaX1hmCxa5G2rrA/PO0cpxXRz++qqEI4Ws1yBMeCqxzn9mmSq0hdccIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773386;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cghKiIhIs3WHdTzauouM7yuuYOP4RHk/lDCEL2J3FDw=;
	b=R7TbWi6Wiys1uJq5PRHjxwTno0bcwHUu20DVIOU8JIPgiYGiOHO/a0bgn4oz1j/4hG2H
	 Zb/bJ9ldA+5rLVu8vPIBzB9Op4AIrmc97B6OgcH/j4WufPQFcSmznlOjgQtxpQrXkZzgO
	 vJTsiNvVQB1Cvsnx30H8U0DuyLKcUo+eYQZ/h1pSLs8Rtuu4Wq09o7wrVrDZ0OsP2CVzH
	 Z/fCQ+4UiKUcMP37esEE8l8MgStYofY1/ow4eOV/NgeQ9lxU3UJNGMA3EYQzGOk/Y9l26
	 D325TpPaVOMdaKUIlQ2ivKXhRp5zax3GUoxJwelPYt97edh9a2pi6fnD1g/u9TIQhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O5pnT0OT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31A4606A31E;
	Fri, 27 Nov 2026 09:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O5pnT0OT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529671758;
	Fri, 27 Nov 2026 01:56:22 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B3533F959;
	Fri, 27 Nov 2026 01:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795773385; bh=P0Ygt22URPNRtmd0Nyy4UP8exHQvtkyPWnL1LCnEUKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O5pnT0OT1erQHzgvnkdXZbX3pSxTodazlHC5PpMaAS69pDc30zEVloGcAS0ARILJE
	 EJ6elfFV7fPP+4Awmwe6erpmecbzlXZ/vZqUhbdC3Pc9n0pw5NMV6sMqnNPiuuI3BS
	 U8uhoq+9hJd2gDbpHsVet5b0Cplqq3HA/0ZfQOvs=
Message-ID: <114b03ba-914f-4494-be12-d967be62da00@arm.com>
Date: Fri, 27 Nov 2026 09:56:18 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] arm64: dts: allwinner: Add Allwinner A733 USB 3.0
 support
To: Alastair D'Silva <alastair@d-silva.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261127073231.1776847-1-alastair@d-silva.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alastair,

On 11/27/26 08:32, Alastair D'Silva wrote:
> This series adds USB 3.0 host support for the Allwinner A733 SoC and
> enables it on the Xunlong OrangePi 4 Pro.

I think you should step on the brake for a bit, sending out (AI 
generated?) patches like crazy is not going to make you friends with the 
maintainers and reviewers. At the moment we are trying to get the basic 
A733 DT merged (for v7.5), so anything non-essential has to wait. And 
the list of out-of-tree dependencies below already shows that this is a 
bit early.

So I'd say wait for v7.5-rc1, which is probably going to happen in early 
January, then you have a much saner base, and we have more time for 
reviewing more fancy features.

Oh, and also: please try to look beyond your particular board. It's not 
just the OrangePi 4A that is out there, we have other well documented 
boards as well. Peeking at their schematics should make it easy to add 
the respective USB nodes to their DT.
The OPi 4A is benefiting from work of other people as well, so it would 
be nice to do the same for other boards. It's fine if you can't test it 
there, just mention that and others can test. That has also the 
practical benefit of keeping the dependencies together.

Look at Jernej's H616 HDMI series[1], for instance, he just enables a 
bunch of boards in the final patch.

Cheers,
Andre

[1]
https://lore.kernel.org/linux-sunxi/20261126214433.3562326-1-jernej.skrabec@gmail.com/T/#m8df03e7de13c7152685c921605b000e0a7236bc5

> It adds the USB 2.0 UTMI PHY driver, USB 3.0 mode for ComboPHY0, USB2
> CCU gates, DWC3 glue support, an xHCI W1C port change quirk, and DT
> nodes.
> 
> Verified on the Xunlong OrangePi 4 Pro with a SuperSpeed (5000M) USB
> 3.0 flash drive.
> 
> Prerequisite series:
> - arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support (v2):
>    https://lore.kernel.org/r/20261127065343.1449675-1-alastair@d-silva.org
> - Add Allwinner A733 (sun60i) PCIe and Combo PHY support:
>    https://lore.kernel.org/r/20261125062948.1234677-1-alastair@d-silva.org
> - Allwinner A733 PCK-600 power domain fix and DT node (included in
>    prerequisite-patch-id below).
> 
> Alastair D'Silva (11):
>    dt-bindings: phy: allwinner,sun60i-a733-u2phy: Add Allwinner A733 USB 2.0 PHY
>    dt-bindings: phy: allwinner,sun60i-a733-combophy: Add combophy0 USB 3.0 support
>    dt-bindings: clock: sun60i-a733: Add USB2 bus and sys clock IDs
>    clk: sunxi-ng: sun60i-a733: Add USB2 bus and sys clocks
>    dt-bindings: usb: allwinner,sun60i-a733-dwc3: Add Allwinner A733 DWC3
>    phy: allwinner: Add Allwinner A733 USB 2.0 PHY driver
>    phy: allwinner: sun60i-combophy: Add USB 3.0 PHY mode support
>    usb: dwc3: Add Allwinner A733 DWC3 support
>    usb: host: xhci: Add W1C port change quirk for Allwinner A733
>    arm64: dts: allwinner: sun60i-a733: Add USB 3.0 controller and PHYs
>    arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 3.0
> 
>   .../phy/allwinner,sun60i-a733-combophy.yaml        |   5 +
>   .../bindings/phy/allwinner,sun60i-a733-u2phy.yaml  |  58 +++
>   .../bindings/usb/allwinner,sun60i-a733-dwc3.yaml   | 103 ++++
>   .../dts/allwinner/sun60i-a733-orangepi-4-pro.dts   |  31 ++
>   arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi     |  61 +++
>   drivers/clk/sunxi-ng/ccu-sun60i-a733.c             |  10 +-
>   drivers/phy/allwinner/Kconfig                      |  17 +-
>   drivers/phy/allwinner/Makefile                     |   1 +
>   drivers/phy/allwinner/phy-sun60i-combophy.c        | 573 ++++++++++++++++++++-
>   drivers/phy/allwinner/phy-sun60i-u2phy.c           | 233 +++++++++
>   drivers/usb/dwc3/core.c                            |  18 +-
>   drivers/usb/dwc3/core.h                            |   8 +
>   drivers/usb/dwc3/dwc3-generic-plat.c               |  15 +-
>   drivers/usb/dwc3/glue.h                            |   6 +
>   drivers/usb/dwc3/host.c                            |  10 +
>   drivers/usb/host/xhci-hub.c                        |  53 +-
>   drivers/usb/host/xhci-plat.c                       |   3 +
>   drivers/usb/host/xhci.h                            |   2 +
>   .../dt-bindings/clock/allwinner,sun60i-a733-ccu.h  |   2 +
>   19 files changed, 1177 insertions(+), 32 deletions(-)
> 
> base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
> prerequisite-patch-id: 19691099774bd3dc41f56585c03ddefb7bdc6f9c
> prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
> prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
> prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
> prerequisite-patch-id: ef2f0344452092edb2221b93c44a3e82cb896a2d
> prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
> prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
> prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
> prerequisite-patch-id: 090c5ff78d4e2150804aa8d294581cd338b1e971
> prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
> prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
> prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
> prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
> prerequisite-patch-id: 4555860586ef50f27bf787a23f6ba693e9c3b0d6
> prerequisite-patch-id: 0279f281cd59cf54bceee39b0fa4d0b6a7b87c48
> prerequisite-patch-id: 14424bd8324b6cae2b8c4d6840df0db626d1385f
> prerequisite-patch-id: 7b42728bc8271e5dfd57fffec47a7f5745eff357
> prerequisite-patch-id: 74f5c7d066477024a374a789b3180e841398fb07
> prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
> prerequisite-patch-id: 55e543b9854c7ae2fa86969233d05ccadd3792e9
> prerequisite-patch-id: cfcad85224e288ec2168e7f245b4a1c63e9a34a7
> prerequisite-patch-id: 18dadb9c1e41141d015422b658b7dd0d153b7d69
> prerequisite-patch-id: 47a863f533ee9ae1589e25618f27a7282a0f8d37
> prerequisite-patch-id: 54181ce00a78f9f69031d3964f14bf800dd98e0f
> prerequisite-patch-id: 5a6d6dac4f6b42edf911fbca2078508e977bdce9
> prerequisite-patch-id: e919d9591e97e3b69fa86625a868583ee74d16db

