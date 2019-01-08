Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8E1C43387
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 00:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2077A2085A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 00:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="NAozP1ha"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfAHAd2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jan 2019 19:33:28 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2194 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfAHAd2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Jan 2019 19:33:28 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c33efcb0000>; Mon, 07 Jan 2019 16:33:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 07 Jan 2019 16:33:27 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 07 Jan 2019 16:33:27 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 8 Jan
 2019 00:33:25 +0000
Subject: Re: [PATCH V4 10/20] clk: tegra: dfll: build clk-dfll.c for Tegra124
 and Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190104030702.8684-11-josephl@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <e35cf7f7-e46c-43f0-7789-2f237f2ce9bb@nvidia.com>
Date:   Tue, 8 Jan 2019 08:33:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190104030702.8684-11-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546907595; bh=0C/9p+KQvbWVu1QlA9kj0iDcu2pPx+8XZUeatHR3wKw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=NAozP1haaQomSy3CHVgxlOWetCdGiAtToq/bgJM5kDta8WpTkXIunvyHdrOf8KERk
         9S9jb18ChJWk5iTq0uWrawic9StleAfIeAd1G5J00S7Vz+LItMwZ0czf/oXuPO6I02
         qV+Fp9yUtOWqAk9mJcjZfoRiH+jVX4sA29RaqKK7cH7oU01C9m1878RuD2MWd5NmMz
         6YomCmV1IYFMSKCm67AMJ3YOmFrvdszpWWOcg6bnIokDeYC2u4vlhcUpyc5+ri2V08
         hmyYLtBiQC0lLyTW2kBC5wTq6M9R6unrv6TmnXaZkVYGzu9q6Yunw/yYtq7DUcluJL
         GeNK8km4xrJvQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/4/19 11:06 AM, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Tegra210 has a DFLL as well and can share the majority of the code with
> the Tegra124 implementation. So build the same code for both platforms.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> *V4:
>   - remove parenthesis in Kconfig of DFLL driver
> *V3:
>   - no change
> *V2:
>   - add ack tag
> ---

Hi Stephen,

Could you help me to review this patch again?

Thanks,
Joseph
>   drivers/clk/tegra/Kconfig  | 5 +++++
>   drivers/clk/tegra/Makefile | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
> index 7ddacae5d0b1..1adcccfa7829 100644
> --- a/drivers/clk/tegra/Kconfig
> +++ b/drivers/clk/tegra/Kconfig
> @@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
>   config CLK_TEGRA_BPMP
>   	def_bool y
>   	depends on TEGRA_BPMP
> +
> +config TEGRA_CLK_DFLL
> +	depends on ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC
> +	select PM_OPP
> +	def_bool y
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 6507acc843c7..4812e45c2214 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -20,7 +20,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>   obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>   obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>   obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
> -obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-dfll-fcpu.o
> +obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
>   obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
>   obj-y					+= cvb.o
>   obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
> 
