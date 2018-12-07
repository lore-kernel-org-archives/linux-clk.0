Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA04C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65DB520838
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="BspJh3Ji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65DB520838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbeLGOkb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:40:31 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13580 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbeLGOkb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:40:31 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a86520000>; Fri, 07 Dec 2018 06:40:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 06:40:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 06:40:30 -0800
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 14:40:28 +0000
Subject: Re: [PATCH 10/19] clk: tegra: dfll: build clk-dfll.c for Tegra124 and
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-11-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <88de4304-7090-77c8-189d-c77de568293a@nvidia.com>
Date:   Fri, 7 Dec 2018 14:40:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-11-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544193618; bh=ijqYOTHhp3xHy/9gqs32ZwEczZQKIAc4lK+PdzVbDM4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BspJh3JiWiaQHfQJncJ7dowejAgCjkGgqgoUiabCQNn4nETqei+duGqOoFIs1OH2/
         vSF3ZA9r9Z0vgysxm58dz5eJxODlIYjH/a5yEM1MomS/8+QQTO17nQIMaJf71h0E8m
         U5+ifGh1obD3kaQH/LPUVJsdWSR51HeNQqH+wLy5fM5Kh8FXpqNNXH+yrZLxtcyTul
         VhiG1OKrcksMVcMyGfX2wOs7ZJj11IaOisi1be8x7UkFdy7PupSmsEV/Q18qQpGOEb
         sptwVkSGehfy1gkaEPzyAApUgJmxqLSN9KvpljRJbZgxivHqlt7+GVWb2RvxSYA7M7
         pw9A3Fh9O4uOg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Tegra210 has a DFLL as well and can share the majority of the code with
> the Tegra124 implementation. So build the same code for both platforms.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clk/tegra/Kconfig  | 5 +++++
>  drivers/clk/tegra/Makefile | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
> index 7ddacae5d0b1..57902ab43f4a 100644
> --- a/drivers/clk/tegra/Kconfig
> +++ b/drivers/clk/tegra/Kconfig
> @@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
>  config CLK_TEGRA_BPMP
>  	def_bool y
>  	depends on TEGRA_BPMP
> +
> +config TEGRA_CLK_DFLL
> +	depends on (ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC)
> +	select PM_OPP
> +	def_bool y
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 6507acc843c7..4812e45c2214 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -20,7 +20,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
> -obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-dfll-fcpu.o
> +obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
>  obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
>  obj-y					+= cvb.o
>  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
