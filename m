Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854226F464
	for <linux-clk@vger.kernel.org>; Mon,  5 May 2025 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478529; cv=none; b=gZliKj15LtySror6gxmU4u3Wc/sPD5yYw+j171MuwF8Tf/OESNvQmkg3ut0CWziHGgOIhS4J7xbPVdoAimuJrajTaIqV+dPUWswgAJJIvQhjWHLDCCodsmzve7R6/isIV2GGZoZmAJDqf+G5VWSORV/1h1h/TFOZAGCdUEG3nm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478529; c=relaxed/simple;
	bh=CcZ1jORXsXUNNI5DmPwrvSmetMSvhSPTegSj1nPNGfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gt5MnFLfDR+0+pdbAbVV8aDe0dwaRCnosObE2qlsjotOIMe7fAMsE9KoYpYFjN1jb/e/6HPb9NDAJZoUa0iWLUnT1mhKFP5XqZ4JzkHveb8A6YXsekX8U1Xgr9ES8mXlyqZ0gIdJGYRy8yvAT1O9cY+8wulVcJY6+vFtnEkmebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Y2/U5xCJ; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Y2/U5xCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746478527;
 bh=qQneQiujTp667QxrLtu0L+PuxYk5iu271S89xRTqn6s=;
 b=Y2/U5xCJdt2epUMc3iO2/5uL2wGNoS6mKHsEdeGmo4FyZe/9TOiE/czKy4BF4QrgXICkbFlpk
 rXK4Lp3FuiJuI6x0Ng1jVJUagsPtl4TjVYkHPbKbx5t0KzB8mNYesqNippAPpJDPKFzO8bZnVDP
 BM2E2NzYuD+8faEUfK4CMlKZ7EKzb1rklPbihFlj+rVBlGsbesrkiCLtEZxrHoEDFfxx4WEm43v
 GPgIBW4q92GE3xcr1PCI3aXxGcX6OiXojKQd41yk6Pv2e+028wh3kCkzHbsLw3aHJiu1KcszjsB
 +kJ47UR6Ys8epbFn1GcWynR7/oNnFU/iR9GIHQWk4CNA==
X-Forward-Email-ID: 681925af46c37f8647c20276
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <f0ef6679-7ddf-4deb-98a3-755ac2b61a57@kwiboo.se>
Date: Mon, 5 May 2025 22:55:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250417143647.43860-1-ziyao@disroot.org>
 <20250417143647.43860-5-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417143647.43860-5-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-17 16:36, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller, describe
> them in devicetree. Since their sample and drive clocks are located in
> the VO and VPU GRFs, corresponding syscons are added to make these
> clocks available.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

SD-cards and SDIO WiFi is detected on my RK3528 boards with help of this
so this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 69 ++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 826f9be0be19..931d4ac004c5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -321,6 +321,16 @@ qos_vpu: qos@ff280400 {
>  			reg = <0x0 0xff280400 0x0 0x20>;
>  		};
>  
> +		vpu_grf: syscon@ff340000 {
> +			compatible = "rockchip,rk3528-vpu-grf", "syscon";
> +			reg = <0x0 0xff340000 0x0 0x8000>;
> +		};
> +
> +		vo_grf: syscon@ff360000 {
> +			compatible = "rockchip,rk3528-vo-grf", "syscon";
> +			reg = <0x0 0xff360000 0x0 0x10000>;
> +		};

Adding these two syscons could possible be split out into a separate
patch as they are also needed for adding support for the two Ethernet
controllers [1], the GMAC driver already landed in v6.15-rc1.

[1] https://lore.kernel.org/all/20250310001254.1516138-1-jonas@kwiboo.se/

Regards,
Jonas

> +
>  		cru: clock-controller@ff4a0000 {
>  			compatible = "rockchip,rk3528-cru";
>  			reg = <0x0 0xff4a0000 0x0 0x30000>;
> @@ -501,6 +511,65 @@ sdhci: mmc@ffbf0000 {
>  			status = "disabled";
>  		};
>  
> +		sdio0: mmc@ffc10000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc10000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO0>,
> +				 <&cru CCLK_SRC_SDIO0>,
> +				 <&cru SCLK_SDIO0_DRV>,
> +				 <&cru SCLK_SDIO0_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <200000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;
> +			resets = <&cru SRST_H_SDIO0>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
> +		sdio1: mmc@ffc20000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc20000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO1>,
> +				 <&cru CCLK_SRC_SDIO1>,
> +				 <&cru SCLK_SDIO1_DRV>,
> +				 <&cru SCLK_SDIO1_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <200000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdio1_bus4>, <&sdio1_clk>, <&sdio1_cmd>;
> +			resets = <&cru SRST_H_SDIO1>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
> +		sdmmc: mmc@ffc30000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc30000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDMMC0>,
> +				 <&cru CCLK_SRC_SDMMC0>,
> +				 <&cru SCLK_SDMMC_DRV>,
> +				 <&cru SCLK_SDMMC_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>,
> +				    <&sdmmc_det>;
> +			resets = <&cru SRST_H_SDMMC0>;
> +			reset-names = "reset";
> +			rockchip,default-sample-phase = <90>;
> +			status = "disabled";
> +		};
> +
>  		dmac: dma-controller@ffd60000 {
>  			compatible = "arm,pl330", "arm,primecell";
>  			reg = <0x0 0xffd60000 0x0 0x4000>;

