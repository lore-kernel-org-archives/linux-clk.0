Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65A9C43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 14:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CB372087A
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 14:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="VaCZvNLD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB372087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbeJJWN4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 18:13:56 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44895 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbeJJWNz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 18:13:55 -0400
Received: by mail-lf1-f66.google.com with SMTP id m18-v6so4196431lfl.11
        for <linux-clk@vger.kernel.org>; Wed, 10 Oct 2018 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xl9O8IEpp2cEN5QUJI0GUcCgTVO1EUGLNZR6+ed6+4o=;
        b=VaCZvNLDTKfPxlEoXCKCPg5LZOmZfywxO31wdH0LPDblueXGNBkuAqEe3WjxbTSVAQ
         FGyDSSxO8rcw4dXnjsiAVMmlZynUju/uBgtNj2j22suJEwojlLX+sHP5aAEiB1kGY4O2
         LAuOqjGUvLKC/GxjdTCzO8Fc1qtec1SoXtCA+y/Ii1U2ZWgZ+JB4RW07BvC4Zc/X6gKq
         ITeSPM7IE+WUqmWNxMMvsZulK7Uc6F+hARFphq7L6krJtU95BLOnsPSrcHgxw1SeqpSn
         JRYCmRhemVUT00yYKPUM6f9XLRdPizSibgz3jQLZ1T7nrO+N+L9Z079Fk2lLj24USTV8
         VQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xl9O8IEpp2cEN5QUJI0GUcCgTVO1EUGLNZR6+ed6+4o=;
        b=JT5k5ES14wieZKPcj/vPHIJoc+Gc3SbZhOlnlyokH0HcNBx9DULqp1izVY+3YmWRgT
         pXwxzmaWj1pAC8kIVdpvJdeZ4X1AZlp438zz0Eco0KqMH977jkk2GSRlvxRK9q4VWkgv
         pWZVliS9q4hMb54TugjCXASdD/FQc4n6ftU5bXkmnFJCbZyRunbHMpr3eV3fVvVgq9gz
         rS+boJ5LqMEiD9BqmCN8pq0KSmm3/kKVcHX0CjKykxigZ7752ECcGSsxCCglcm0UypBZ
         FzxxjTClPvYbIP4HY5tox4eG/azqHZ86sREdTxNXZd7yU4hfkT1sy3Ko+t9FiaMnD2Lb
         qsXw==
X-Gm-Message-State: ABuFfoiQn4uOhAEj+VPQ4+iwkeNYDo1MUuT2ygT8/g5VuGqo1ozb+B+8
        6MU3bRm32kO8BbZsTsvnUmulUQ==
X-Google-Smtp-Source: ACcGV614Yn0IEF2V5gnzJBgJCHvvsAr2Sn/NE+Un6FUwh6B3kN54UvHAfhpQXhL37NIrpOMiLho+pQ==
X-Received: by 2002:a19:e013:: with SMTP id x19-v6mr17792981lfg.89.1539183082232;
        Wed, 10 Oct 2018 07:51:22 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.247])
        by smtp.gmail.com with ESMTPSA id v19-v6sm5557992lji.10.2018.10.10.07.51.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Oct 2018 07:51:21 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
To:     Chris Brandt <chris.brandt@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20181010123713.67541-1-chris.brandt@renesas.com>
 <20181010123713.67541-3-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fbb500df-239b-4c67-98ed-3aa606c9cc57@cogentembedded.com>
Date:   Wed, 10 Oct 2018 17:51:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20181010123713.67541-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello!

On 10/10/2018 03:37 PM, Chris Brandt wrote:

> The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
> with some minor differences.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Made comment clearer
> ---
>  drivers/mmc/host/Kconfig                      |  5 +++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 +++++++++++++++++++++++++--
>  2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index cf984f0f0246..33840ce2221d 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -636,13 +636,14 @@ config MMC_SDHI_SYS_DMAC
>  
>  config MMC_SDHI_INTERNAL_DMAC
>  	tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
> -	depends on ARM64 || COMPILE_TEST
> +	depends on ARM64 ||  ARCH_R7S9210 || COMPILE_TEST

   Double space hardly needed here...

[...]
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index e5e5015ca680..89066237d6f0 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
[...]
> @@ -81,6 +84,21 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>  	},
>  };
>  
> +static const struct renesas_sdhi_of_data of_rza2_compatible = {
> +	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +			  TMIO_MMC_HAVE_CBSY,
> +	.tmio_ocr_mask	= MMC_VDD_32_33,
> +	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +			  MMC_CAP_CMD23,
> +	.bus_shift	= 2,
> +	.scc_offset	= (0 - 0x1000),

   Parens hardly needed here...

[...]

MBR, Sergei

