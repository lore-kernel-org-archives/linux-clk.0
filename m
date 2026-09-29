Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AD338B14B;
	Tue, 29 Sep 2026 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717509; cv=none; b=DJ/Nt1Pe/CCcMT/Rn2RF29QxP+BIoDkI8A9+sHyP2eSbAuzzMo15U4feL/Ac7Jw+sDkRwxI8V5+f6mFQ6wkDl/bfglSr7ghg1ynU/WYioWkl1STYEwldT5YFIDKJD8WUeSBA1Kaz2noFv79j14uQstw3xdQpH2XFkCU+0oNTw+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717509; c=relaxed/simple;
	bh=IjnfLL/m4Yheyu1gj3NKdKMK8iiY/3W9pMxeghlxdQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KghpxMCM6vhlh3LHd1NU3BHnZ/5Ipbx0JCZ46Q7GlwoDIx01lVWob3WLrslVtG473nys0XUIWoEFENfIbMG5ql3c0weuw0wi8h27DOAMm5cHf9S6oLFylZygoIKOhdmyVTIOz/q2BYGYYEeOI2w2Mzah+TKq/7bcCc70htFkW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImbjBSkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImbjBSkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BF31F000FF;
	Tue, 29 Sep 2026 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790717508;
	bh=R5j+6LYMMJZY9MNPTlC5mVgKgI6GPvSLq1ObM+lpJGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ImbjBSkcOU61+57dg13SS0sVfvDjpN/rEWW7THOLCk6E6Nxs4VPjJHzZO2j5+fDkX
	 TfTf75iO2Y6BdNjdUWXJWsbTiEqfWrlzQEGKOTe217sW/+R+PYhNrXc3Kcyn4uSv8L
	 fs4E52O2mRmO7rHKLqwREziJnRIT1RPwlGs7AfcUSZgH69XyPAlnNTaBt1qBZu1sCG
	 /E5HWQ6e7Sg5ocwxIL4R3qR7/vK5Y0ONLTtptiNdyacQ8N/KdUHTpQGL1naUUruJDc
	 8eIS+HB1CMJOiH2ZJxaQWnvcn9gSjrWtmkQkis5JDRoappoAHcmdmWK6Pho0jj1uu1
	 FYNlzkmofuYlw==
Date: Tue, 29 Sep 2026 16:31:47 -0500
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
Subject: Re: [PATCH v5 04/21] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20260929213147.GA2831360-robh@kernel.org>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103210eucas1p2d7e77f1147a03dac0536f6069505ea51@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-4-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-jh7110-clean-send-v5-4-82b4d8e3c6c7@samsung.com>

On Tue, Sep 29, 2026 at 12:31:01PM +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> 
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map and
> populates its two children: the PHY and the controller. This is
> necessary to resolve a circular clock dependency between the HDMI block
> and the VOUT clock generator.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
