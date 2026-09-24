Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11F84A263D;
	Thu, 24 Sep 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263806; cv=none; b=AwE7zFSOnB9jmkMStOUVLu3n3FnK/4yNZezjxetsIk5ZBdeoxDcU4GzsiUJriPI4Y5Kc1p/n8UilujJ0uOh1oY5Ibq3UaljrpC/AqoefsupuKmK7gvSjKe3/pQ9JAWGA/ca6mo7Vnr1xQ7xkLGqfL/sCh3QpTK7e6MDdwrJy4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263806; c=relaxed/simple;
	bh=6Kd3H8OgG7G5CfVYho6YrPmqzUbKDh3yoZfacF7ygBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLL1HOSAuexLaI+SIlOZqLqLmTts6H8CsN5nD5Srh4bFT7d5K4LrSnHCUpo0lupxBBjdyUvAbjBee9DjUXjioAtDgBNPdCGKearD6P9dv/RwlWh1CwDi2c20t2cw2VSlnO3HNziXlFNGTSxPlZOjpu5rJZTkZrwcUIM+NHfafnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EW0B7Nc6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EW0B7Nc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8C91F000FF;
	Thu, 24 Sep 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263805;
	bh=3xaD1IMfAyp/uIU4MITG18na4g3zXQJFSDgCzveCcZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EW0B7Nc6zPIXKvae2h9udoFtfnvLgEztZgFp0GIOtPQU6aa0CKVM4BU/HUwpZ0vKr
	 1Ng2uL1PApIcsZ4dt5R5rJKBtQ+ejpuIHqzHFWmmVVwhmekO997ypwXY7o1b50WfWZ
	 jNFyYcsC4YxISGl8X5n0lAnADzdfFjebSuXNuMX4ChHZy2l4ud2CDTfr6dJYsj4GSw
	 /HSilVBl9WDa93bYPAWt+PWertSA1Ap0Lu9AOmmd31jcJF3mOw6bQ5CoDyBZirCmh8
	 972QlyXRwXWLAAYyvARx/fHNTHXFpJ4VQs7bNe/4FU9mINsUnDG7ZOXj72PcCtGHg4
	 yo2B1+UfXTs2Q==
Date: Thu, 24 Sep 2026 10:30:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maud Spierings <maud_spierings@murena.io>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, mfd@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Graham Markall <hello@big-grey.co.uk>, linux-clk@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Robert Foss <rfoss@kernel.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dominique Belhachemi <db@domibel.de>
Subject: Re: [PATCH v4 06/20] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-subsystem
Message-ID: <179026380151.180820.13279134510036926790.robh@kernel.org>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153224eucas1p1c19b20f6af600b1c3228a9a8f4bb4490@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-6-f0e4fd6f2cc8@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-jh7110-clean-send-v4-6-f0e4fd6f2cc8@samsung.com>


On Tue, 15 Sep 2026 17:32:14 +0200, Michal Wilczynski wrote:
> The JH7110 groups its display hardware into a video output subsystem,
> dom_vout_top, covering the DC8200, the HDMI transmitter, the video
> output clock generator and the video output system controller.
> 
> They share one NoC port whose clock and reset gate access to every
> register in the region, and the region sits in the PD_VOUT power
> domain. Describe the subsystem as a bus node so those resources are
> owned by the block that shares them, rather than by whichever consumer
> happens to probe first.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 +++++++++++++++++++++
>  1 file changed, 218 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

