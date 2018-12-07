Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1648C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9218920837
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:34:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="QGxfqf7t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9218920837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbeLGOe4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:34:56 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15043 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeLGOe4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:34:56 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a850f0000>; Fri, 07 Dec 2018 06:34:55 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 06:34:55 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 06:34:55 -0800
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 14:34:53 +0000
Subject: Re: [PATCH 08/19] clk: tegra: dfll: round down voltages based on
 alignment
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-9-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <677ca0fd-7d99-713d-fe40-f8b0d0a77cb4@nvidia.com>
Date:   Fri, 7 Dec 2018 14:34:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-9-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544193295; bh=YMUuIqs9mvCeFeam+ralgVvTkrhB56cef/mhPuP6CNI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QGxfqf7t0UivOBruvkakNjKsi4hxypcWa22VZOc4LPKqzZJAWX0eVyR1u4f4k6v/z
         m8wvL6TrkK1xD36oET42iGrBBRbGeakRYzIDJb/i4nzw8L2+Xw2mRGhoY0HkPXUit9
         O/GOYNjANtWTLmdL7K1H06QNu33eBu4BqyQyVIDcmmgQ7YI2WVFMVz3HvNzpOzQlCe
         5wuPu8zc3GBak+SxcPRA31PyH62U1Igai9Y93fjO7ZGdlgrN9DzTt35n4TfmLxB/ux
         xG5HOdy7E3mwHmIt7qMOu3LiuRiQ3PNnThVpbo35zHDb9kWM3kAnHb84XaqpEsSPxP
         BlCQdJUi1+0Lg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
> 
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index c294a2989f31..4a943c136d4d 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -804,17 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>  static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>  {
>  	struct dev_pm_opp *opp;
> -	int i, uv;
> +	int i, align_volt;
>  
>  	opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  
> -	uv = dev_pm_opp_get_voltage(opp);

This returns an unsigned long.

> +	align_volt = dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;

Nit-pick, the 'align_volt' variable does not contain an actual voltage
but a step index. So maybe consider renaming this 'align_step'. And the
same for other places in this change.

Cheers
Jon

-- 
nvpublic
