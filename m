Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162F63C277B;
	Thu, 10 Sep 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029487; cv=none; b=LyUPFJXxyR+FJleUqgsaMhuakcdNN7s/6NhRRts+A2vTZjkK1J9WooyNrYueyE9FdkCV88MV82q1bLWHRnkvvhVdocaawAunWEdzckPL0O5R7tN0dcrNmOMdw7BqjgT5ER5eCVMw2JogTwFSL1ILZ654DhkkJhOnuHZ9tHcOLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029487; c=relaxed/simple;
	bh=yOOXWXHM2+5YroYJ2g1ayyRggEFN5VM6tshAWAfszyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J21bTT86lHCsSOZtMeRIHnF91RK1EbYXpjCYQnS557VPjETmCrClc6s4ItZCtStwP2N2GZkeEuZPIJ2L0lQratEVSN/zhhdqj49j+tUO5+0PZDNwOyFI45PcDyX0yQ1pMax+9rNHp+aBPLxUVSrvcXMu/Eo2xz8gVaev0EuG59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqDayxOB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqDayxOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C261F000FF;
	Thu, 10 Sep 2026 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029478;
	bh=EZGyD4HcrjDRUcR2xnLZUcoNWJUpQvPh9c9ez8Kckcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqDayxOBxh7RZhoahGQfIr5nqGXH1m09RD+JiuwnolPYrMt+KHGlvS9sqRNJrXINB
	 AQ2AARvY1wPptsSFIQ4l/Mp6QDdD4MsSgiKeO5MuXqRMSmSZTY5eIt/faPDLK8jtQA
	 KGAn403hcc0XarQhKfmXw5n5QfIxqO1LREKhekOND+u4NjMteJlota8eMUE+bPD6bO
	 9SM8b6qVaEhkHHeZxrpmGfP/uTOBj4hTNR6CSPKaatn7SIg23PURpI/HPDRlt5yOP7
	 8VS2JFKZEcCb/Wgds0zeLjWin3qqBM+h7QUWvcJlWtu3taZkeWKWkCu26ah+Pz81Lo
	 LVrIAcdhmb+oQ==
Date: Thu, 10 Sep 2026 10:37:55 +0200
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
Subject: Re: [PATCH v3 18/19] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
Message-ID: <20260910-determined-fantastic-seriema-3ff701@quoll>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-18-484f9ae72715@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-18-484f9ae72715@samsung.com>

On Fri, Sep 04, 2026 at 03:27:19PM +0200, Michal Wilczynski wrote:
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 9c3e4598747eb5541effe697044484715569a285..0f981f4c89586269b987be8591037c9461e04703 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -290,12 +290,6 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
>  		#clock-cells = <0>;
>  	};
>  
> -	hdmitx0_pixelclk: hdmitx0-pixel-clock {
> -		compatible = "fixed-clock";
> -		clock-output-names = "hdmitx0_pixelclk";
> -		#clock-cells = <0>;
> -	};
> -
>  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>  		compatible = "fixed-clock";
>  		clock-output-names = "i2srx_bclk_ext";
> @@ -352,6 +346,13 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells = <0>;
>  	};
>  
> +	xin24m: xin24m {

Other clocks are called foo-clock, so follow this as well (even though
it does not follow recommended practice of clock-foo, but at least some
consistency).

Best regards,
Krzysztof

