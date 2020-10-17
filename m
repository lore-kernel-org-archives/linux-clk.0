Return-Path: <SRS0=sSu3=DY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22266C433E7
	for <linux-clk@archiver.kernel.org>; Sat, 17 Oct 2020 19:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6C222076D
	for <linux-clk@archiver.kernel.org>; Sat, 17 Oct 2020 19:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="HWav2NEJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439413AbgJQTVc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Oct 2020 15:21:32 -0400
Received: from z5.mailgun.us ([104.130.96.5]:50138 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439279AbgJQTVb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 17 Oct 2020 15:21:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602962491; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=w3XBZtDYMSOGf1b1iEGY4J4TyZg0rOzlWwKlB0140jE=; b=HWav2NEJBzcPv+okSuGZi5yfbKvTGrRnJaQQRgJgo9SYiVYAT10+hTg12sENKAlM4nPunHWX
 LMFYvir9QXqmCPqoZTCpjghSSkEQkCuST9pAd4Oa5/N+gj+LPXF3HXIldxLk13+R7lvHCn6j
 ddWPkQi1EQqIp3t7rAPltveP0oM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f8b4438aad2c3cd1ce88114 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 17 Oct 2020 19:21:28
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A398C43382; Sat, 17 Oct 2020 19:21:28 +0000 (UTC)
Received: from [192.168.0.106] (unknown [49.204.182.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE5C7C433CB;
        Sat, 17 Oct 2020 19:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE5C7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gdsc: Keep RETAIN_FF bit set if gdsc is
 already on
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
References: <20201017020137.1251319-1-sboyd@kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <1d87c476-cd40-2954-bdfc-bd13dd911c07@codeaurora.org>
Date:   Sun, 18 Oct 2020 00:51:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201017020137.1251319-1-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 10/17/2020 7:31 AM, Stephen Boyd wrote:
> If the GDSC is enabled out of boot but doesn't have the retain ff bit
> set we will get confusing results where the registers that are powered
> by the GDSC lose their contents on the first power off of the GDSC but
> thereafter they retain their contents. This is because gdsc_init() fails
> to make sure the RETAIN_FF bit is set when it probes the GDSC the first
> time and thus powering off the GDSC causes the register contents to be
> reset. We do set the RETAIN_FF bit the next time we power on the GDSC,
> see gdsc_enable(), so that subsequent GDSC power off's don't lose
> register contents state.
> 
> Forcibly set the bit at device probe time so that the kernel's assumed
> view of the GDSC is consistent with the state of the hardware. This
> fixes a problem where the audio PLL doesn't work on sc7180 when the
> bootloader leaves the lpass_core_hm GDSC enabled at boot (e.g. to make a
> noise) but critically doesn't set the RETAIN_FF bit.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Fixes: 173722995cdb ("clk: qcom: gdsc: Add support to enable retention of GSDCR")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>   drivers/clk/qcom/gdsc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index bfc4ac02f9ea..af26e0695b86 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -358,6 +358,14 @@ static int gdsc_init(struct gdsc *sc)
>   	if ((sc->flags & VOTABLE) && on)
>   		gdsc_enable(&sc->pd);
>   
> +	/*
> +	 * Make sure the retain bit is set if the GDSC is already on, otherwise
> +	 * we end up turning off the GDSC and destroying all the register
> +	 * contents that we thought we were saving.
> +	 */
> +	if ((sc->flags & RETAIN_FF_ENABLE) && on)
> +		gdsc_retain_ff_on(sc);
> +
>   	/* If ALWAYS_ON GDSCs are not ON, turn them ON */
>   	if (sc->flags & ALWAYS_ON) {
>   		if (!on)
> 
> base-commit: 9ff9b0d392ea08090cd1780fb196f36dbb586529
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
