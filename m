Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761D5C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2857420989
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bddzFqKm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2857420989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbeLGOy5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:54:57 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15982 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbeLGOy5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:54:57 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a89bd0000>; Fri, 07 Dec 2018 06:54:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 06:54:56 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 06:54:56 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 14:54:52 +0000
Subject: Re: [PATCH 14/19] arm64: dts: tegra210: add CPU clocks
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-15-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5835991a-50aa-1fd2-f9c5-53238a38c993@nvidia.com>
Date:   Fri, 7 Dec 2018 14:54:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-15-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544194496; bh=8bcCTWY71m7zwQTgXwNIma/PabE+2jtfih5R9YMkTeI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=bddzFqKmr+MojYVZoeNJ5hBR5OlvHN6dsVVO4yCU5VKGPKdA1VIJ+EqjR3hMi6K7k
         1frNZiSogPMEIyY5AAb4A+d5JiaNJFXsouUr5diLWIZf5jh3e0E5rr/mNVh4RwMIzm
         G6BTnby8IjQIqZsr7gwXsAVLwrFWiHXB4R+B2yH+JaB1j3W/yx1D1gQRZQI02EhqxE
         eY/qfFNYCSDyHbBW5kWvo3A0tgFQF9hg3V+YxSEcb8LQwNh0eBSdJVqOrKXctoxBwB
         HnHQE7icolcjyiFCbdRK/xoPV4WugcUb4kFHOSoqcvX767x5igjoYOOQXvevIfSNt0
         78Q4T7I7Uypbw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add CPU clocks for Tegra210.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index a6db62157442..e2baf52fe1af 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1304,6 +1304,12 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a57";
>  			reg = <0>;
> +			clocks = <&tegra_car TEGRA210_CLK_CCLK_G>,
> +				 <&tegra_car TEGRA210_CLK_PLL_X>,
> +				 <&tegra_car TEGRA210_CLK_PLL_P_OUT4>,
> +				 <&dfll>;
> +			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
> +			clock-latency = <300000>;
>  		};
>  
>  		cpu@1 {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
