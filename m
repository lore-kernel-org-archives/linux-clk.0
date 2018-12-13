Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D5BC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB8FC20645
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eZm7gj1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB8FC20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbeLMMuV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 07:50:21 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1401 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbeLMMuU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 07:50:20 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1255870000>; Thu, 13 Dec 2018 04:50:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 04:50:20 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 04:50:20 -0800
Received: from [10.26.11.125] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 12:50:17 +0000
Subject: Re: [PATCH V2 10/21] clk: tegra: dfll: add CVB tables for Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-11-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8fda3564-ab10-bb24-6d2a-6bd26358fe88@nvidia.com>
Date:   Thu, 13 Dec 2018 12:50:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-11-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544705415; bh=VD00aS8WOo+8qGe8n1HKIfYNnLVTOQfzRv+0x4i6JAc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=eZm7gj1GHO+lllu9yAbLnVe5hisK9WAGDWYOM80/DpeaIfxCFEF5MgQOKrqODMrZi
         oj/wmIPVznuNcTuvsUtaxayOK32/2FoZAvfP5CCdub/RS65YdvKj7HlUMKeEgp0rZp
         9yFqQTC+8wfl4OF2/hJZ4qTEMWS1JqOCnkT97D8DxVIpEIJy5tQ6UOvEBZ5xi37luN
         VUEXCAlmOiF6YMCbuIuoV0tIR2FB5k0H58Sky//9B2crwcmMKql3mwWyoocJyKA9iA
         /plRK3IqCvoaYj0AR9RHHCcMYYDVtWHKyc1GVRq+3jOXg+RJoZJ/N4mb7Vl8uqIwTi
         ZV24qlwbEQoDg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> Add CVB tables with different chip characterization, so that we can
> generate the customize OPP table that suitable for different chips with
> different SKUs.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>

...

> diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
> index bcf15a089b93..91a1941c21ef 100644
> --- a/drivers/clk/tegra/cvb.h
> +++ b/drivers/clk/tegra/cvb.h
> @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
>  	u32 tune0_low;
>  	u32 tune0_high;
>  	u32 tune1;
> +	unsigned int tune_high_min_millivolts;
>  };

Sorry, I forgot to respond to this on the previous version. I think that
it is OK to add now, but please add a comment in the changelog to
reflect that this is not currently used, but we have plans to use it and
so we are adding all the data now.

Cheers
Jon

-- 
nvpublic
