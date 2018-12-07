Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4B3C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 15:03:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 137CC208E7
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 15:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hpyKsua+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 137CC208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbeLGPDT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 10:03:19 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16421 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbeLGPDT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 10:03:19 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a8bb60000>; Fri, 07 Dec 2018 07:03:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 07:03:18 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 07:03:18 -0800
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 15:03:16 +0000
Subject: Re: [PATCH 17/19] arm64: dts: tegra210-smaug: add CPU power rail
 regulator
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-18-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c0cc7c30-ab84-3811-ea5e-11bc6babd570@nvidia.com>
Date:   Fri, 7 Dec 2018 15:03:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-18-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544194998; bh=BSzkXkJ00aJT3iniFN3tGMArJvthyHKizEv033fwXx4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=hpyKsua+G+GC317DKqgKCIasdjoT8BxxD2AZ8UonjVSdUybw61OJf46q4YkzdmCbC
         THgRcUpyRyOaaeqEudwrcmcY67qhwNTOi1Ni55a/AajAer09A9fDXfddtERu7w8jgI
         LjOE6d8+b2MvdSiOdlkLiGdG+Ichxj/aI9AdD7iUiFJ0NY3d7OFdVle7qQbB3WdxYa
         Fx86H/GOqBAZrKj9HVBcu/qeQwqGprgfwNjvpdfRja8wLz/ZNXP4gHWzhnXyIerjct
         8SshIXltEHFlXxzLCfogO9Rg/Gue7g96KCsalLX7qd2Ti8a5AotYG+neZFth8RCUg8
         u3WWlj6RkNIQw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add CPU power rail regulator for Smaug board.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 43cae4798870..b3930a9dd139 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1340,6 +1340,25 @@
>  		status = "okay";
>  		clock-frequency = <1000000>;
>  
> +		max77621_cpu: max77621@1b {
> +			compatible = "maxim,max77621";
> +			reg = <0x1b>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <TEGRA_GPIO(Y, 1) IRQ_TYPE_LEVEL_LOW>;
> +			regulator-name = "PPVAR_CPU";
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <1231250>;
> +			regulator-ramp-delay = <12500>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +			maxim,dvs-default-state = <1>;
> +			maxim,enable-active-discharge;
> +			maxim,enable-bias-control;
> +			maxim,enable-etr;
> +			maxim,enable-gpio = <&max77620 5 0>;
> +			maxim,externally-enable;
> +		};
> +
>  		max77620: max77620@3c {
>  			compatible = "maxim,max77620";
>  			reg = <0x3c>;
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
