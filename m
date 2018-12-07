Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7D5C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB55320989
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bJBUrlqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB55320989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbeLGOyR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:54:17 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4241 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbeLGOyR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:54:17 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a89970000>; Fri, 07 Dec 2018 06:54:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 06:54:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 06:54:16 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 14:54:14 +0000
Subject: Re: [PATCH 13/19] arm64: dts: tegra210: add DFLL clock
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-14-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9ea7b938-32a7-5afe-b740-68a6da8ad442@nvidia.com>
Date:   Fri, 7 Dec 2018 14:54:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-14-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544194455; bh=4Xo3NUiWPZXFHDHoroeyPns6npHSdiqPFwiMNusv4d0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=bJBUrlqFZwPego77v/MPYrMkyEJsDbIIAdCL6eAHbB8Fu47dy2fCtfE91Xxgzr683
         SwOo74/eJhHGGRdVGp6u3CDJtLM56Jtb0kadlTvj2eS+ZPrgkTbrmyq1HsetNu3Io/
         YxXMUrVrmGIuhhxxBq9YMDfxF/B5afNMIBt/JG5E/oPKKDldtrhS3vf16V14/pjCVI
         AT9I0FfiGHmSmqz1qOuhwwydtYtNWRqg5xNjpZu6poT7+u2qlijUj/p8mBgI0yPY2d
         DRvB/LyAqEl0fVKucIXnA319aW6IxvvgquuK2m2l4IX1DM7I2XeJh0+KsxUZ5QQU16
         3rxSzKQdPN4Ag==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add essential DFLL clock properties for Tegra210.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 2205d66b0443..a6db62157442 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/memory/tegra210-mc.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
> +#include <dt-bindings/reset/tegra210-car.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/tegra124-soctherm.h>
>  
> @@ -1131,6 +1132,24 @@
>  		#nvidia,mipi-calibrate-cells = <1>;
>  	};
>  
> +	dfll: clock@70110000 {
> +		compatible = "nvidia,tegra210-dfll";
> +		reg = <0 0x70110000 0 0x100>, /* DFLL control */
> +		      <0 0x70110000 0 0x100>, /* I2C output control */
> +		      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> +		      <0 0x70110200 0 0x100>; /* Look-up table RAM */
> +		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA210_CLK_DFLL_SOC>,
> +			 <&tegra_car TEGRA210_CLK_DFLL_REF>,
> +			 <&tegra_car TEGRA210_CLK_I2C5>;
> +		clock-names = "soc", "ref", "i2c";
> +		resets = <&tegra_car TEGRA210_RST_DFLL_DVCO>;
> +		reset-names = "dvco";
> +		#clock-cells = <0>;
> +		clock-output-names = "dfllCPU_out";
> +		status = "disabled";
> +	};
> +
>  	aconnect@702c0000 {
>  		compatible = "nvidia,tegra210-aconnect";
>  		clocks = <&tegra_car TEGRA210_CLK_APE>,
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
