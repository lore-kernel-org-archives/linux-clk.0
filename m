Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8A2C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 13:52:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E59EA208E7
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 13:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="VOlSsbjW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59EA208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbeLGNwp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 08:52:45 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12991 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbeLGNwp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 08:52:45 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a7b2c0000>; Fri, 07 Dec 2018 05:52:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 05:52:44 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 05:52:44 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 13:52:42 +0000
Subject: Re: [PATCH 03/19] dt-bindings: cpufreq: tegra124: remove
 vdd-cpu-supply from required properties
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-4-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cfcaa547-a28a-ea7c-5f1e-8e1c4f32b023@nvidia.com>
Date:   Fri, 7 Dec 2018 13:52:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-4-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544190764; bh=+CKwdwfBDNa+S9nJwEyg2R4dxQIwRTLysMom7Yk7YAw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VOlSsbjWsz/TaixWsG44A580zUkCOJ2EyTBJg3ejUdHrmOrS6aDwkRF7WMjtG0eUh
         qJjsk/LPZhoG9iStgFCnj6nL8jJ1GHcDFbq0TAGsTLeOISGxH8iiCljcntFUVFZPHA
         FyYAzDFFveM418sVEF4KciXjOpV66jdL/flnIS51xWIjggG2kWxRQe+LiU5S9zbfkM
         HeiiFaDdCSbF54lTNvi9ac82E4Kk4ejdxUiXlxmrsvQNMyh8uhd2LgXwRxarhqQNIz
         etTj4Q5WrSkjQElfhH79CaX9tqDLe8kePVqZ4J4VKMsxpnKQwi7OQdOlPPXEMim0ys
         YmiYhkDFSj0iA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> The Tegra124 cpufreq driver works only with DFLL clock, which is a
> hardware-based frequency/voltage controller. The driver doesn't need to
> control the regulator itself. Hence remove that.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> index b1669fbfb740..031545a29caf 100644
> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> @@ -13,7 +13,6 @@ Required properties:
>    - pll_x: Fast PLL clocksource.
>    - pll_p: Auxiliary PLL used during fast PLL rate changes.
>    - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
> -- vdd-cpu-supply: Regulator for CPU voltage
>  
>  Optional properties:
>  - clock-latency: Specify the possible maximum transition latency for clock,
> @@ -37,7 +36,6 @@ cpus {
>  			 <&dfll>;
>  		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
>  		clock-latency = <300000>;
> -		vdd-cpu-supply: <&vdd_cpu>;
>  	};
>  
>  	<...>
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
