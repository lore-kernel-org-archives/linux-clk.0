Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0B0C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 13:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DF3620849
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 13:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="jWPOrWni"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF3620849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbeLMNLv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 08:11:51 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13059 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbeLMNLv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 08:11:51 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c125a930001>; Thu, 13 Dec 2018 05:11:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 05:11:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 13 Dec 2018 05:11:50 -0800
Received: from [10.26.11.125] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 13:11:48 +0000
Subject: Re: [PATCH V2 18/21] arm64: dts: tegra210-p2371-2180: enable DFLL
 clock
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-19-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <84fbfa0b-553e-72ee-23c6-e7772e75aaa8@nvidia.com>
Date:   Thu, 13 Dec 2018 13:11:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-19-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544706708; bh=71s2bZj5prrCJrAmhvNXu+5fUiyJfmuwkYkDURcMNaM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=jWPOrWniPzHRjehDwRLTUSTMxfDu2+h5VUlLp92eYf+xZODGjd305HDIXXZ3UDq3p
         ADkgT+Kwm2sw0dGpJ+N2nRHCmRjlMK+yu905ICV8be+k0rNHFiirFvqF+KRZ6Wpp7q
         aHxWffmcRpy4cHD6c6ujkKIRlq/qVKLzY90VWpkkysRk1ZCydzH5NpVRGYe4PGRTjc
         ZG3GDwxACEBvYJ0SQ07zebkFCqfeO8ijS18syUTyay1eX46byF2BhBsD86y35DUuO+
         DFWLUrOxeKSoEaTAFeCcIdKxxRSCQ4EJxvOBxtpv3Sa2xisSOBntskuGAu21JHFstL
         vHX9Sc59dnSMg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> Enable DFLL clock for Jetson TX1 platform.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - remove non exist DT bindings
>  - update the PWM DT bindings accordingly
> ---
>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> index 37e3c46e753f..99c016bfc601 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> @@ -78,4 +78,25 @@
>  			};
>  		};
>  	};
> +
> +	clock@70110000 {
> +		status = "okay";
> +
> +		nvidia,cf = <6>;
> +		nvidia,ci = <0>;
> +		nvidia,cg = <2>;
> +		nvidia,droop-ctrl = <0x00000f00>;
> +		nvidia,force-mode = <1>;
> +		nvidia,sample-rate = <25000>;
> +
> +		nvidia,pwm-min-microvolts = <708000>;
> +		nvidia,pwm-period = <2500>; /* 2.5us */
> +		nvidia,pwm-to-pmic;
> +		nvidia,pwm-tristate-microvolts = <1000000>;
> +		nvidia,pwm-voltage-step-microvolts = <19200>;
> +
> +		pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
> +		pinctrl-0 = <&dvfs_pwm_active_state>;
> +		pinctrl-1 = <&dvfs_pwm_inactive_state>;
> +	};
>  };

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
