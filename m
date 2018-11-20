Return-Path: <SRS0=sCFe=N7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1100C43441
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 04:30:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AE3B20870
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 04:30:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="OvAV9bWS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="a3OfIgnR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE3B20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730328AbeKTO5a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 09:57:30 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33430 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbeKTO5a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 09:57:30 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 56CBA60B73; Tue, 20 Nov 2018 04:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542688223;
        bh=vNF32HzawJqjzC2ybK6qbF28xr1LbG9yi2n21e7305s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OvAV9bWS6sVt6DiDw11O6WyaRkj3NFTElYz1B1ZSO3KZKuT2cE9GEQ27mAhzuxzNg
         8uvY38fdcLi+fm3BXfnDY8Rc1W3NvZp+h66BR5pQ6SRgQfjMBmT10/EpK0RE0etikX
         6rqEBulI5CZR83bL2X1FY0/Ke8c33wxnWWOXvhgc=
Received: from [10.79.128.175] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A86ED60588;
        Tue, 20 Nov 2018 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542688222;
        bh=vNF32HzawJqjzC2ybK6qbF28xr1LbG9yi2n21e7305s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=a3OfIgnRTgfDen1AUlW6H6mu2nV8vlPYmeAh5FVk1iC6+7vktbe/5wf+lRUHBF1GQ
         Jelvn/ES/BLBiORtUIy1Los8bpSDuJU1K78pAAkr17u9JsQG4DyWQadxTpl+8jC5KQ
         CcS//Z2Asno7XkeBSO4bMOGvNZPWVp8TIch4IqjM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A86ED60588
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/4] clk: qcom: gdsc: Don't override existing gdsc pd
 functions
To:     Jordan Crouse <jcrouse@codeaurora.org>, sboyd@kernel.org,
        mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.orgi, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, robdclark@gmail.com,
        freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
 <20181119234706.5821-3-jcrouse@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <2a3d0b09-7335-3120-47b5-d3b06c294770@codeaurora.org>
Date:   Tue, 20 Nov 2018 10:00:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181119234706.5821-3-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11/20/2018 5:17 AM, Jordan Crouse wrote:
> In very extreme cases an individual gdsc may wish to override the
> power domain enable or disable callback functions for their own
> purposes. Only set the generic gdsc callback if the function pointers
> are not already set.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Looks good to me,
Acked-by: Rajendra Nayak <rnayak@codeaurora.org>

> ---
>   drivers/clk/qcom/gdsc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index b6adca1f3918..7b55368b9a9c 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -394,8 +394,10 @@ static int gdsc_init(struct gdsc *sc)
>   	else
>   		gdsc_clear_mem_on(sc);
>   
> -	sc->pd.power_off = gdsc_disable;
> -	sc->pd.power_on = gdsc_enable;
> +	if (!sc->pd.power_off)
> +		sc->pd.power_off = gdsc_disable;
> +	if (!sc->pd.power_on)
> +		sc->pd.power_on = gdsc_enable;
>   	pm_genpd_init(&sc->pd, NULL, !on);
>   
>   	return 0;
> 
