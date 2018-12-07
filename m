Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8057FC07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 13:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 451272146D
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 13:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CZLg7jQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 451272146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbeLGNxl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 08:53:41 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11486 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbeLGNxl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 08:53:41 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a7b580001>; Fri, 07 Dec 2018 05:53:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 05:53:40 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Dec 2018 05:53:40 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 13:53:38 +0000
Subject: Re: [PATCH 04/19] dt-bindings: cpufreq: tegra124: remove cpu_lp clock
 from required properties
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-5-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c8934ef1-5ada-ad9a-1b32-9b9860eccdc9@nvidia.com>
Date:   Fri, 7 Dec 2018 13:53:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-5-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544190808; bh=YlMd7u1SuJNsxaPIpH/r940bjR+4fxuRtjUixZwzsnY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CZLg7jQQqqVx5YKXr3oGQJy5fVw7x2XudKuRxdEqiWoTLT5FRx7mmd4sl+41FX2N3
         mLeHEtnErKCXcxz+wwUvz8gvgWz3rGJ1cpRpRrLNhdlda0gCwUcXxvDG/6+Eco3DJZ
         D2HDaKGNQUmlhj59RINw0KG7hCx249p6O6xiqc2kc3C8/D2rr5uwrU1r4GciEERBqR
         R70sktED3Tv0Y5zd8Et9if/b+khJmn7gsW/HXddXe0xkUz4qlIqruHTbJK4dulseIa
         Q0ddXZlh7sCPEroVwpKJJpnmKB5NjfLHGoASVbhk9rsSzJ+30L++1jcLMudLY3RKmP
         xzQw0bUkv3WYA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> The cpu_lp clock property is only needed when the CPUfreq driver
> supports CPU cluster switching. But it was not a design for this driver
> and it didn't handle that as well. So removing this property.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt   | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> index 031545a29caf..03196d5ea515 100644
> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> @@ -9,7 +9,6 @@ Required properties:
>    See ../clocks/clock-bindings.txt for details.
>  - clock-names: Must include the following entries:
>    - cpu_g: Clock mux for the fast CPU cluster.
> -  - cpu_lp: Clock mux for the low-power CPU cluster.
>    - pll_x: Fast PLL clocksource.
>    - pll_p: Auxiliary PLL used during fast PLL rate changes.
>    - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
> @@ -30,11 +29,10 @@ cpus {
>  		reg = <0>;
>  
>  		clocks = <&tegra_car TEGRA124_CLK_CCLK_G>,
> -			 <&tegra_car TEGRA124_CLK_CCLK_LP>,
>  			 <&tegra_car TEGRA124_CLK_PLL_X>,
>  			 <&tegra_car TEGRA124_CLK_PLL_P>,
>  			 <&dfll>;
> -		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
> +		clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
>  		clock-latency = <300000>;
>  	};
>  
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
