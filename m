Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15CDC07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 647572081C
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="kAYGhslp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647572081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbeLGOzh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:55:37 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16035 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbeLGOzh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:55:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a89e70001>; Fri, 07 Dec 2018 06:55:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 06:55:36 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 06:55:36 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 14:55:34 +0000
Subject: Re: [PATCH 15/19] arm64: dts: tegra210-p2597: add pinmux for
 PWM-based DFLL support
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-16-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <42aa5b73-cd1f-5a2f-249f-589bb1319fc0@nvidia.com>
Date:   Fri, 7 Dec 2018 14:55:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-16-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544194536; bh=a1QclYpHK8Ge4XDuB5UtBQksdbhLVdRoWZFyc7FRLtw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=kAYGhslpAL4DfDzG/yWp9virSCQIJP0+qGGyIvtA0voFL5u/uYBKIZzB5nYcJJHhW
         q622fWvvyiC5nBSqikVlsa/B3S1vWb/YoY/BqxljP+tbWvze5Qq2yl3bR8qwVHAr27
         t9zaMch8L0RrpnCe3t9bx2pQRhCbeAq5TE9jowXdnscb1aF/0/8GOsHEZWrdxp+Qu7
         qqQD6hJn31v37V/8DaPQmURLFUfZsMvgcIAJKGtBG32+IF4olEWrK7lAJ7TYJKBO5G
         TbC0RmVfgkH4ChS1ZI4jeLjjzLLAlizakxdUccwqZQgO6GkO1yGQi2R2tpo8bv9uCX
         kvaN9eIsOTN8w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add pinmux for PWM-based DFLL support.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> index 365726ddd418..db5dc0ad466d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1278,6 +1278,20 @@
>  				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
>  			};
>  		};
> +
> +		dvfs_pwm_active_state: dvfs_pwm_active {
> +			dvfs_pwm_pbb1 {
> +				nvidia,pins = "dvfs_pwm_pbb1";
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +			};
> +		};
> +
> +		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
> +			dvfs_pwm_pbb1 {
> +				nvidia,pins = "dvfs_pwm_pbb1";
> +				nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +			};
> +		};
>  	};
>  
>  	pwm@7000a000 {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
