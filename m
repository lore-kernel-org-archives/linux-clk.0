Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C893D649C;
	Tue, 29 Sep 2026 21:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717589; cv=none; b=M185q0BC2Cufpqz7RtMvufN9bPCuK3z39hqQG2+cnEtHF4H0MR2V5k3PUB5MjJIBd/wuknpYP7DvRk6m1fFkcavRxxQASnPM5BQAYuGXZNh17tLRIGBZ45LzokqZ3Dweh+Go5d1xini+gaFhx3bf99HxPFPSEK+YrCdRst7ZWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717589; c=relaxed/simple;
	bh=PEQY/M19oRt3OSgh0U5AHHJg963xsWG/Kz7hSemMT1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSzT5Mlg31tMZDfnvmcU9IK9mppCwnCg8Ho9ab17knnXOhb3M6lD4RejN+OY1VjPF88mNZ5ZOQPRyWAMb5wDU5conKELbvKeqs6fjLX/tbSCgGyDdpePFst63S27OtpCDM6rHqzqSDWKfY09lfBMefQ4lrIwinSyTyjEwWluBm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfnygp67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfnygp67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC841F000FF;
	Tue, 29 Sep 2026 21:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790717582;
	bh=lelsT5w70qSo6Jz1QIPHWdCUzI8GluF0Gnl5Y70qLj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gfnygp67yJoU6wYQYLDHLLsHUQOt3WctNaX7omRMnGuvm1Trzfh2TcVbInjG0SRzC
	 l4y/e5J59XBb1uIJP6uCTkR0bnAHoy5KZmTycC4CSKePUIMHTg2oFKWSR90/GCzXDh
	 o/fmm64t4CTs+61hfFGioN1k3ZiSaTjYvXdPDSKMiXb3wp0ZPFGOfYOxeQ9QHv4Akn
	 Og0tnEZ8BBAP+QxJLIqo/7plV4g/0Hyny+aTmJ+DzDhuuDMv9P330XmTikiI9Yw/R1
	 98tcZsMmJpAdRX0uFEOjwsYZu/vNfp5EYAwW8P6DJogbkEBOgl3chBUEfU7QR0lnOL
	 KIpRVJAVlPBvw==
Date: Tue, 29 Sep 2026 16:33:01 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v5 06/21] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
Message-ID: <20260929213301.GA2839911-robh@kernel.org>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103214eucas1p20a39791b0286596d4c33c2e459030943@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-6-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-jh7110-clean-send-v5-6-82b4d8e3c6c7@samsung.com>

On Tue, Sep 29, 2026 at 12:31:03PM +0200, Michal Wilczynski wrote:
> The JH7110 embeds a DC8200. The binding requires an SoC specific
> compatible ahead of the generic one, so add the JH7110 to the enum.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
