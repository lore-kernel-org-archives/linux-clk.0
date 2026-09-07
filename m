Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com [220.197.31.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A638F65B;
	Mon,  7 Sep 2026 03:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751292; cv=none; b=BOkhfhtUhG6B5icoGxokTZzP50WLjUnJ60lntmpo44QdT0kBlerBjucBXEHGyUDLdKEAEChyAz92J8+wXk7cOAx62f4N/tMWNJ/YgvRhTX34fQm2iIHLcktCU0menda/3vGi8QcMhMa6m68Grz6exM7u/d/ZQ0SSv8k3nP4LRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751292; c=relaxed/simple;
	bh=aKf8DhaQ5x5i8jhOQEfA7qapAwbpflbQ/fj5C6rVTU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzyayPuFzgboIBPvnkf/AhasYTOg7Iy671eEXowj0Qja9m6qTTooftuoupDkUie9bgeH3pw6m2fmcbUEbc1kI2e4Xzv90NLqoHU+qwqP1yoFwKy3pBzrYeZPXbHYAQjYI5DfXS8TErNKYVkiU1HxTzXL7plH+FSvDfav8ahjBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Ku4RR7ub; arc=none smtp.client-ip=220.197.31.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ku4RR7ub"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cbfa21e5;
	Mon, 7 Sep 2026 11:16:05 +0800 (GMT+08:00)
Message-ID: <d4cfd407-9cf7-4907-9ef9-8bb52b5ec669@rock-chips.com>
Date: Mon, 7 Sep 2026 11:16:04 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/19] phy: Add common Innosilicon HDMI PHY helpers
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Andy Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132737eucas1p240d02860355b180ff9c5e8e4c6941ec0@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-15-484f9ae72715@samsung.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-15-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa079ddac6403a7kunm8546d35235ff8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEtCVkoZHU1OHUwdTx5OSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ku4RR7ubhkME7SdU7Q1vR5N4bs9Jd9O9dvZ9PeeRSteOPVUkDArQId4e3ukUTnqz+qWufSkjKXJ2R4/U363WXT4BSsLmk0+jXlh+bAmQV7Motws9BeZFvlX3PDZsY+ze3KEL/3yqEcWz8+aHEvsZGtdV4HknbJNEDvGIuMZ8U48=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+vkcaZtmTBN2qJZBZCZ7S5klbEWaaU26s6Uci6PmceU=;
	h=date:mime-version:subject:message-id:from;

Hello Michal,

On 9/4/2026 9:27 PM, Michal Wilczynski wrote:
> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
> where the PHY register block sits in the register space and in which
> pixel clocks they support, but the pre-PLL programming sequence and the
> layout of its registers are the same.
> 
> Add a small library holding that shared part: the pre-PLL configuration
> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
> and the pre-PLL register programming. Callers pass a regmap, a register
> offset for the PHY block, and their own pixel clock table.
> 
> No driver uses it yet; the users are converted separately.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/phy/Kconfig               |   8 +
>  drivers/phy/Makefile              |   1 +
>  drivers/phy/phy-inno-hdmi.c       | 298 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/inno-hdmi-phy.h |  85 +++++++++++
>  4 files changed, 392 insertions(+)
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

