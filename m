Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69405C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D3852081C
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="dgJ3trRp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3852081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbeLDPhK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 10:37:10 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4708 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbeLDPhK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 10:37:10 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c069f270000>; Tue, 04 Dec 2018 07:37:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 07:37:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 07:37:09 -0800
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 15:37:09 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 48AD4407B1; Tue,  4 Dec 2018 17:37:07 +0200 (EET)
Date:   Tue, 4 Dec 2018 17:37:07 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Joseph Lo <josephl@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 04/19] dt-bindings: cpufreq: tegra124: remove cpu_lp
 clock from required properties
Message-ID: <20181204153707.GB26056@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-5-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181204092548.3038-5-josephl@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543937831; bh=suxuU4hx+hDKXy/SxFoGVMGYMNWY+N/hdV6JEtOX8BI=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=dgJ3trRpD8vzFwueidDl2AKZRnXZ7l8M5EHLbp+YHPoPrRycsdXG8XvlnCxlDgjS9
         xLZYZfe/bhWvQsTOWELrrwitvvVXmYjAsFW24HQR3jMfT9rSqjlW8FcOFnxGJkPwgJ
         Es0MXls+DJpDmEHW0XOirF6km6xsFM0iNdq85ZpGfZdALCIlp5Ebrd4p0MniexnJD5
         Pc2VvCml+yJ15Jp82jyLqAfNQ41EuLTtSmG/KKe/fiWZgogISneCRAQP1SLxzMswH6
         3PhVP/oFF65UkEIMVFUqeBd8ep+69EjyCj9gaOEeFuXk1n3/wgYQEHTTITO+XCpqMW
         Aem9tzS3ZR74g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 05:25:33PM +0800, Joseph Lo wrote:
> The cpu_lp clock property is only needed when the CPUfreq driver
> supports CPU cluster switching. But it was not a design for this driver
> and it didn't handle that as well. So removing this property.
> 

I would mark it optional. This means current DTs will still be
technically compatible with this binding doc.

Peter.

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
> -- 
> 2.19.2
> 
