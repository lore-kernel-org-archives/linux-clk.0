Received: from mail2.ecloud.global (mail2.ecloud.global [135.181.6.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF91369990;
	Sat, 29 Aug 2026 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=135.181.6.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029586; cv=pass; b=Ba5n8lQy8PXkqyEgDXlVQvoZceCX0PPdaP3rtlkzhNkjCIgZozoJmEUItSQbQOfOUn8dq9Z9wP4pIA2IH8GNIBkXapWr8sx2crbnl5OjOhuR2gh+7MZBqcvgW/3urgNHWVw1QTs1zwkcIhYHftn/skaUa8ANLolsMTq75gN5UHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029586; c=relaxed/simple;
	bh=0S3rarkLgm8hZjcdbYjo6il3n4s7fIzlMMRW75K0Z14=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KYHcN/Bks5SSfgnX75kUKEDxZTLOIIjiuNTQODJSa3//FSdhoNnEasHnkI+Kj7l2Kso2VZx0YuG2nad86pa08Rf4vunbSIYsUlMOK9gR38xRQ3xVuORj7kL8rl9c0optMHWSW8wyAkM27k/FWvwIOmvqf+m39BGTHCXIK9QiboU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io; spf=pass smtp.mailfrom=murena.io; dkim=pass (1024-bit key) header.d=murena.io header.i=@murena.io header.b=kJRJxTyy; arc=pass smtp.client-ip=135.181.6.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murena.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=murena.io header.i=@murena.io header.b="kJRJxTyy"
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id 5727E721211;
	Sat, 29 Aug 2026 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1788029216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Ex6rfFvTScbg5DzrJ4/DiARiXFmhIWSUitin0MvHk=;
	b=kJRJxTyyQMcIlC2MG6VJ+b+oMXJ54a/2zuFGwzTwuo9CZxVz3F08ZVm8APsh+MsNYKfln7
	tpIsv3BQSMkVO12LdgK9AGcG0V01enJJzYdvOZtfj3rnOzMRJOcEh6TrpCo01U2nha2zrQ
	J0KsfHnCEfM1FmgUODuLp2W5PkBY6k4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1788029216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4Ex6rfFvTScbg5DzrJ4/DiARiXFmhIWSUitin0MvHk=;
	b=iKSP3zjFE39ry20mmXNOJsboV+El7n+ksWSaf4BjAJtPYNi4skVmgJEw/IqLzCMs+NZ86y
	cHJ15QP8zMHswrrFu0FfNfjOSV/qEbV8Ek28lmHwqTAZKytJ5ty9O6AZACMRpf/g7ac69l
	DPEMrfrnitQFB0w62FocUPfUBN3mVcU=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Seal: i=1; s=mail2; d=murena.io; t=1788029216; a=rsa-sha256; cv=none;
	b=PBSzIckDQ9J/rtP8kgKk6YirF5KsP0xzXMGk/+beKynJrp5wESTe2ODak8XzOi5hl0vL2A
	AuJUpLcNj2cEiZwG9EPCnizlv2HGbZHD4eFqrDaZ7+XptJc8z0BTYKf2fnW0YghpcFzZER
	e1LilsNtpR7oiPTe54yrwUcb9BlYx2Q=
Message-ID: <b9d39858-3531-4538-a4ab-eb34a0be6ad5@murena.io>
Date: Sat, 29 Aug 2026 20:46:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: m.wilczynski@samsung.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, alex@ghiti.fr,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, andyshrk@163.com,
 aou@eecs.berkeley.edu, bmasney@redhat.com, conor+dt@kernel.org,
 conor@kernel.org, db@domibel.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hal.feng@starfivetech.com, heiko@sntech.de,
 hello@big-grey.co.uk, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel@esmil.dk, krzk+dt@kernel.org, lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 luca.ceresoli@bootlin.com, m.szyprowski@samsung.com,
 maarten.lankhorst@linux.intel.com, maudspierings@gocontroll.com,
 mfd@lists.linux.dev, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, rfoss@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de, uwu@icenowy.me, vkoul@kernel.org
References: <20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
Subject: Re: [PATCH v2 14/15] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

Very happy to see an update to this series!

I have some very minor nitpicks I found in the devicetree

> Activate the display subsystem by adding the dc8200, hdmi and voutcrg
> nodes as direct soc children. Each references the PD_VOUT power domain
> through power-domains, so genpd powers the domain on demand, and the
> HDMI-PHY -> voutcrg -> HDMI-controller probe order is resolved by
> deferred probe.
> 
> The monolithic hdmi node is modelled as a container with hdmi_phy
> and hdmi_controller children. This lets the PHY (clock provider,
> depending only on xin24m) and the controller (clock consumer) probe
> independently, breaking the circular clock dependency with voutcrg.
> 
> voutcrg consumes the pixel clock from the &hdmi_phy node instead of the
> old fixed-clock, and dc8200 gets its pixel clocks from voutcrg's MUXes
> and is marked dma-noncoherent for framebuffer DMA. The old, incorrect
> hdmitx0-pixel-clock fixed-clock node is removed.
> 
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 119 +++++++++++++++++++++++-
>  arch/riscv/boot/dts/starfive/jh7110.dtsi        |  87 +++++++++++++++--
>  2 files changed, 196 insertions(+), 10 deletions(-)
> 

[snip]

>  
> +&dc8200 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dpu_port0: port@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			dpu_out_dpi0: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +
> +		dpu_port1: port@1 {
> +			reg = <1>;
> +		};
> +	};
> +};
> +
>  &dvp_clk {
>  	clock-frequency = <74250000>;
>  };
> @@ -99,8 +153,31 @@ &gmac1_rmii_refin {
>  	clock-frequency = <50000000>;
>  };
>  
> -&hdmitx0_pixelclk {
> -	clock-frequency = <297000000>;
> +&hdmi_controller {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_pins>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			hdmi_in: endpoint {
> +				remote-endpoint = <&dpu_out_dpi0>;
> +			};
> +		};
> +
> +		hdmi_out_port: port@1 {
> +			reg = <1>;

missing newline here

> +			hdmi_out_con: endpoint {
> +				remote-endpoint = <&hdmi_con_in>;
> +			};
> +

one newline to much here

> +		};
> +	};
>  };
>  

Kind regards,
Maud
