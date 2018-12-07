Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AEBC64EB1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 15:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF1F2208E7
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 15:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hZWa2Pvc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF1F2208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbeLGPE0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 10:04:26 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4765 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbeLGPE0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 10:04:26 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a8bf70002>; Fri, 07 Dec 2018 07:04:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 07:04:25 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 07:04:25 -0800
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 15:04:23 +0000
Subject: Re: [PATCH 19/19] arm64: defconfig: Enable MAX8973 regulator
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-20-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2b0002fa-ce19-e3e3-3b39-a2383d8c0eb7@nvidia.com>
Date:   Fri, 7 Dec 2018 15:04:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-20-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544195064; bh=e6eSIYsJ3MM+M0ILgzYrOHGbhWxpOMEKv8xYlBlvtro=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=hZWa2Pvc9egaBRio0mM74iBlLBLGmgDdelli4xlJFBF7Iib+TvESZba2+RPoTlK8Y
         5THc1G/qnGTEXb2pucj59VpDaFvKehnPlz3JY+Z9EGs2bu6ymiFRC5wpTnQ1KGSV13
         HQFSdMbxr0DyqO4A0mdl4FIdqAtIXN7r5MF1QPgAuKQf553n34G0tjCZDH4FxzD+sl
         Nqxwbt7GZ/3MWnzVrBoCVNlFJNaUOxDAzWnvzczgNvoQbclAhDd4Cb9+K5uxE3O/k/
         Z7aghvTm0crOQn5wJWwEqz7PsOC/MJZb+q9e9pF4n78RyIMiH2+4hsrUYifjVbH8A5
         vv31jl0r5eKWQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> The Tegra210 Smaug board uses MAX77621 for both CPU & GPU rail. Note
> that max8973 and max77621 share the same driver. So enable this driver
> for the PMIC.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5c2b1f6842f8..8dab129395a1 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -420,6 +420,7 @@ CONFIG_REGULATOR_GPIO=y
>  CONFIG_REGULATOR_HI6421V530=y
>  CONFIG_REGULATOR_HI655X=y
>  CONFIG_REGULATOR_MAX77620=y
> +CONFIG_REGULATOR_MAX8973=y
>  CONFIG_REGULATOR_PWM=y
>  CONFIG_REGULATOR_QCOM_RPMH=y
>  CONFIG_REGULATOR_QCOM_SMD_RPM=y
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
