Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41A202F70;
	Wed, 10 Jun 2026 23:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781134468; cv=none; b=JfT1VuyIaZMZw0x47eJ2zoNf1YHmkb31Xl2BUYvpNCZCMGXi2xr4OurzDJLcDFdcK7WIIeGpCHpLSGtfCnGygDGwdOCNWptgz/J5p5D4cPE/yariM97HoxovACuCNyzD2X0AeP0uIfw1F20gRigLGz7b+dKAsRCc4ZqQX/FvvwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781134468; c=relaxed/simple;
	bh=1C5BT+PWAuHbC8UL6zuNvAxCqq1MTTxJwQYB3lZXSsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVKM0qXCGOYnhD1gjkfQwzp55srPGbOIDdiW38stedDaG8Wj/UUMv2SqkJu9UPLbALuzQwnxkmBsxOIPhSuHKPqHtsM2hflVVpLk1SvK/pfYJzks+oojTqP84tojQNqu5wLPI5jivPgasUXa6xbWPv8ZnDuvILEHlhIIEeOhwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GEhPfC8l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GEhPfC8l"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 937B3228;
	Thu, 11 Jun 2026 01:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781134435;
	bh=1C5BT+PWAuHbC8UL6zuNvAxCqq1MTTxJwQYB3lZXSsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEhPfC8l2CbVV0e06sSA3Gr+2iRQ5xuezAaZXh4LJ+2+0xS1lhdnxQEDerm8RBrW1
	 zO6fexWbYwCiVeqFFHYategxlJYuWCHe5j2XuzQZn0gVwI+nIzSsdRZqy2RxjAGDry
	 tbNs2lbxeljHX3Imb2A9pSOK3SLRqg15PfNJGMpw=
Date: Thu, 11 Jun 2026 02:34:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: renesas: white-hawk: Add second
 mini-DP output support
Message-ID: <20260610233423.GF1632628@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-7-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v3-7-164157820498@ideasonboard.com>

Hi Tomi, Geert,

Thank you for the patch.

On Fri, May 15, 2026 at 12:09:32PM +0300, Tomi Valkeinen wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Add support for the mini-DisplayPort connector on the White Hawk
> BreakOut board.  This port is driven by a TI SN65DSI86 DSI to eDP
> bridge, which in turn gets the pixel data from the second DSI channel on
> the R-Car V4H SoC.  Note that this port is not present on the White Hawk

I would write "connector" instead of "port". The White Hawk Single
connects the DSI1 output to a GMSL serializer.

> Single development board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [tomi.valkeinen: added status=okay for dsc]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> index 784d4e8b204c..89d60b83ac4f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> @@ -12,4 +12,98 @@
>  / {
>  	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
>  	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
> +
> +	sn65dsi86_refclk2: clk-x16 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <38400000>;
> +	};
> +
> +	mini-dp-con2 {
> +		compatible = "dp-connector";
> +		label = "CN15";
> +		type = "mini";
> +
> +		port {
> +			mini_dp_con_in2: endpoint {
> +				remote-endpoint = <&sn65dsi86_out2>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsc {
> +	status = "okay";
> +};
> +
> +&dsi1 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			dsi1_out: endpoint {
> +				remote-endpoint = <&sn65dsi86_in2>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	pinctrl-0 = <&i2c4_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	bridge@2c {
> +		pinctrl-0 = <&irq1_pins>;
> +		pinctrl-names = "default";
> +
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2c>;
> +
> +		clocks = <&sn65dsi86_refclk2>;
> +		clock-names = "refclk";
> +
> +		interrupts-extended = <&intc_ex 1 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		enable-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
> +
> +		vccio-supply = <&reg_1p8v>;
> +		vpll-supply = <&reg_1p8v>;
> +		vcca-supply = <&reg_1p2v>;
> +		vcc-supply = <&reg_1p2v>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				sn65dsi86_in2: endpoint {
> +					remote-endpoint = <&dsi1_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sn65dsi86_out2: endpoint {
> +					remote-endpoint = <&mini_dp_con_in2>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pfc {
> +	i2c4_pins: i2c4 {
> +		groups = "i2c4";
> +		function = "i2c4";
> +	};
> +
> +	irq1_pins: irq1 {
> +		groups = "intc_ex_irq1_a";
> +		function = "intc_ex";
> +	};
>  };
> 

-- 
Regards,

Laurent Pinchart
