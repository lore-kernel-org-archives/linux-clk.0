Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B73CEB8B;
	Thu, 10 Sep 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028489; cv=none; b=sgV3/UCQNzwEZ9cnG7arv2mxzFMDff+/yOBQA5IDSuTRPxXIW+VN9o7IgmNudJWS7hS0/gt8D7ix3nFxr+cy8rrsaBGm3WvEYI8f1UKD+MPb3Nr+TKOC7hjuqgsyTccotF2EBBUqqpueM4/TbkMKpSdVbJ1R/57weUomLLV0dpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028489; c=relaxed/simple;
	bh=sQ9zTAPjip1SsCb64XQ6yKANNf8ZTY/UO75xHhswMok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tynrZL7zUwGPwaKN13q+ipNqcNV31VWHh73Xzp52GehgUz+eq+oSEeEvQGeOr7S0UCywEzziFRNz6g7EgOh2Ls9fh013VLtcTrOE9zVXTcq2cSC80SThyO7mY1JPau3TTQOHTamy2MopBJL/wy/JTA+wVWTzUsnHSxz06dr4nGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SllDECNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SllDECNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3BD1F00893;
	Thu, 10 Sep 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028485;
	bh=b8OHYvCSBYyRbDNK6D6vHOOn+SptlIIhGNZi4JZDPlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SllDECNa3s2zNkb1HVPesbrnWCPLKnNHsO5faNovcWhQiujmw92AMGSnA0A1nwJl3
	 xFNUPTxAaQ6HPmipvPou4iP4SnIf1Y/D8XQOzG8JXXKA08BONQlfoV1P3HLRfMPtzq
	 1U6yjBH+cPPO1miJ21i4FtjmgiA7hABKL1XpDQIxvlSkcFXqcEeoqiWvYtjkHi4F0c
	 43hdMBK9+F7ZTvfl4zqRBeTxfdA6WMCc4icVwa2p7M1wnqeMXu8vxE9U5fe7MRGkYD
	 a5iGuZfa1Ey+RBxJcsp3WyyaDRFAb+2wj/c74ONmIzOEvCL+frpUdRNQRZ1xUwIUqg
	 u8W+X2x4cdfew==
Date: Thu, 10 Sep 2026 10:21:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 05/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-subsystem
Message-ID: <20260910-chestnut-capuchin-of-current-ad15a0@quoll>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132718eucas1p1b25abe6cd0562e47dfeb75f8877e47b0@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-5-484f9ae72715@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-5-484f9ae72715@samsung.com>

On Fri, Sep 04, 2026 at 03:27:06PM +0200, Michal Wilczynski wrote:
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        display-subsystem@29400000 {
> +            compatible = "starfive,jh7110-vout-subsystem";
> +            reg = <0x0 0x29400000 0x0 0x200000>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +            clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
> +            dma-noncoherent;
> +            power-domains = <&pwrc JH7110_PD_VOUT>;
> +            resets = <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> +
> +            syscon@295b0000 {
> +                compatible = "starfive,jh7110-vout-syscon", "syscon";
> +                reg = <0x0 0x295b0000 0x0 0x10000>;
> +            };

Please make the example complete.

Best regards,
Krzysztof

