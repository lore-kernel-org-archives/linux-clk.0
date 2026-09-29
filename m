Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45B3B05B8;
	Tue, 29 Sep 2026 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715169; cv=none; b=trj/87OWF4dhQm9M4k8t8tAu8iOEKfQCY29p3L+CMRiQhB9CYqASzc2cShAgQ1AJoGPWxz7kY7+YpjNDVBSCQhw0ifN/DXsecPa5jBQyqzAy5SpTu31WJsI5oMhfBVF/8mH8S61+/qvnYwQdmWY1aS33AIS9OvK/7wjKt5kS/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715169; c=relaxed/simple;
	bh=71+uzWND4ihwtlskkKp99vUabIzIX40ej284OCWJEik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYoNQAYXVDGEh7wPsy0TXS9blObDjKx4ZvPmPPMmzDEbeu2a23NYqCqLFxlduIz3qEKR0MSx1xR/qe97luN9s5sCtGkZHR/s9qPxuJuagNjjN5KLQ/hb+HIxFVwDlhSP1rIX7NqExrvq/Vdz2wyI3SggFJhZMJYeggWa7HQMzvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnBRxJie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnBRxJie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6301F000FF;
	Tue, 29 Sep 2026 20:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790715168;
	bh=WKRMoTp7+IN8XnrAVGFYFXo21Tjr4j0cVDkiRsvfBRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FnBRxJieEPyR9E4fHeRNqHy4r4AQL4VhSOq5V6NZrpIoyz3lM0JBuYnM2DeHhLIaA
	 0hKFQR69pNlHdul9AsMqNqAVmRxW/sjzHXkHz9RhFRXXmssO8xmmIvdfNWQTyQfRC6
	 kf6v8uBGf7FzZx2mf0ijCN99DBFiv1Ia0ynpIt9WHk/bUUt8WWGeWCbk9dGzpM092v
	 6RciCU3fvBlcUiaKyAlRZ4Fop0mYaQU7WnvCrN7wfef0ymhzeFJjTKHesLZ2wyKUi1
	 pgCyh/SyKuIOTU73WrQHTArLiaehugiozFNa1rnR4snZdPxkXzweZiUY7oRFTJff9C
	 t7F3ITFOt4yHw==
Date: Tue, 29 Sep 2026 15:52:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Robert Foss <rfoss@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>, Alexandre Ghiti <alex@ghiti.fr>,
	dri-devel@lists.freedesktop.org,
	Dominique Belhachemi <db@domibel.de>, Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Graham Markall <hello@big-grey.co.uk>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Maud Spierings <maud_spierings@murena.io>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Paul Walmsley <pjw@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH v5 02/21] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Message-ID: <179071516475.2696249.11006849650480539327.robh@kernel.org>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103205eucas1p202b12d36f2ec9378ceb6dba29ee4ef32@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-2-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-jh7110-clean-send-v5-2-82b4d8e3c6c7@samsung.com>


On Tue, 29 Sep 2026 12:30:59 +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
> 
> This device is a child of the starfive,jh7110-hdmi-subsystem node. It
> functions as both a PHY provider for the controller and as a clock
> provider for the variable pixel clock (hdmi_pclk), which it generates
> from its refoclk.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

