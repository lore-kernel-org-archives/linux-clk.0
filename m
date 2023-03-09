Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8219FC678D5
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 00:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjCIAy5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 19:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjCIAym (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 19:54:42 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354D499246
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 16:54:40 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b10so269414ljr.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 16:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678323278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFpiU/cDHrNG5Ecbtj3MT0sZcVTwQ7WyT5+kW0Z518E=;
        b=xFlLtINx4/clhAWv+VOHVpz/7QHiWyVGhhLOLbK1wrAHuB2sG9reO9NTkq443zI3b8
         1kDEsGQhZ5aKuxl4Wx4n8ifI3VxErS/u/VohA8VbFg2j7lmXOEv2wcyxK2MkOQgwZGxL
         kyUJa7CplILZFqM5q1CjKCvR9tpJPYyU4LesDkjcRSA8KirEmBcebT9sdtGnplSgOQGa
         jbjWtrRtDL9c9ECrph0nrSIHrsn4yhwLhrbmEmW33fiEJK3t65dIf/vQ7x5v6yFZT6Ry
         h1YxhGmNtmiQvuh/AGh/YKtxoBlFIpiRK1AtJ8WSiK37mP9S3y2560ETMylmEj/FIPZ7
         9faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678323278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFpiU/cDHrNG5Ecbtj3MT0sZcVTwQ7WyT5+kW0Z518E=;
        b=tM5+wKjL52cdCbaoSbo/h5JS/5L4xScwowpyJfwyw0rawDphGlj61G+K1Py3TRUzJb
         BQL7yso223clb7e82f7pCxqhST9THAYPXBTVy5BJyGeQJMbKZ7kXcMznCkDKcMI+sV3x
         Bvx4k/P9de2ajs8eySiVue1GSYf78Akr1iRJTB9QSDY2HqQuMkOukY4KWpyqQOl7dvF2
         V29urb8Q2R987RQeLSvBJjcmQsJP7/KyL+WNliDtpJ9cX7kIYb0IVwYYT/ZYuBG5/WlW
         FqdN+mT3p2/YfDdPxcxhXOeUip+TMHx+V/xNvueUtJtdEEsPVJnRQOBZVklZ9gq3RWgk
         itNg==
X-Gm-Message-State: AO0yUKUpHHD8orJq3ua8827ezjjc36F8VpLj7WJMIU8yc4SHGNT61tzq
        xXtsU5z92OEmjwBmbFoW7YYsPg==
X-Google-Smtp-Source: AK7set+3p+UYVgPLTJFgkKYpuWAqu+WzbFpJfYdRSuE/Y2PFSGXyM6HyvTzcfCEJHXgD3QRLqatvwA==
X-Received: by 2002:a05:651c:1a26:b0:298:7018:e2e7 with SMTP id by38-20020a05651c1a2600b002987018e2e7mr1424279ljb.22.1678323278220;
        Wed, 08 Mar 2023 16:54:38 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q66-20020a2e2a45000000b0029599744c02sm2736559ljq.75.2023.03.08.16.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:54:37 -0800 (PST)
Message-ID: <091c0851-6f07-c7bc-0a40-b6910c33ab4f@linaro.org>
Date:   Thu, 9 Mar 2023 02:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 09/14] clk: qcom: smd-rpm: Add support for
 keepalive votes
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-9-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-9-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> Some bus clock should always have a minimum (19.2 MHz) vote cast on
> them, otherwise the platform will fall apart, hang and reboot.
> 
> Add support for specifying which clocks should be kept alive and
> always keep a vote on XO_A to make sure the clock tree doesn't
> collapse. This removes the need to keep a maximum vote that was
> previously guaranteed by clk_smd_rpm_handoff.
> 
> This commit is a combination of existing (not-exactly-upstream) work
> by Taniya Das, Shawn Guo and myself.
> 
> Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index eb7781e5c8c1..d89918f9ae60 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -45,15 +45,17 @@
>   		},							      \
>   	};								      \
>   	__DEFINE_CLK_SMD_RPM_AO_PREFIX(_prefix, _name, _active, type,	      \
> -				       r_id, key, ao_flags)
> +				       r_id, key, ao_flags, false)
>   
>   #define __DEFINE_CLK_SMD_RPM_AO_PREFIX(_prefix, _name, _active,		      \
> -				       type, r_id, key, ao_flags)	      \
> +				       type, r_id, key, ao_flags,	      \
> +				       _keep_alive)			      \
>   	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
>   		.active_only = true,					      \
>   		.rpm_key = (key),					      \
> +		.keep_alive = (_keep_alive),				      \
>   		.peer = &clk_smd_rpm_##_prefix##_name,			      \
>   		.rate = INT_MAX,					      \
>   		.hw.init = &(struct clk_init_data){			      \
> @@ -170,6 +172,7 @@ struct clk_smd_rpm {
>   	const bool active_only;
>   	bool enabled;
>   	bool branch;
> +	bool keep_alive;
>   	struct clk_smd_rpm *peer;
>   	struct clk_hw hw;
>   	unsigned long rate;
> @@ -198,11 +201,16 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
>   		.value = cpu_to_le32(r->branch ? 1 : INT_MAX),
>   	};
>   
> +	/* Set up keepalive clocks with a minimum bus rate */
> +	if (r->keep_alive)
> +		req.value = cpu_to_le32(19200); /* 19.2 MHz */


Should this be set to cpu_to_le32(max(19200, ...)) ?

> +
>   	ret = qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
>   				 r->rpm_res_type, r->rpm_clk_id, &req,
>   				 sizeof(req));
>   	if (ret)
>   		return ret;
> +
>   	ret = qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
>   				 r->rpm_res_type, r->rpm_clk_id, &req,
>   				 sizeof(req));
> @@ -438,12 +446,29 @@ static int clk_smd_rpm_is_enabled(struct clk_hw *hw)
>   	return r->enabled;
>   }
>   
> +static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +
> +	/*
> +	 * RPM resolves the rates internally. All we have to do on the kernel
> +	 * side is ensure that we don't accidentally put down the keepalive
> +	 * clocks, which could happen if they received a vote below 19.2 MHz.
> +	 */
> +	if (r->keep_alive)
> +		req->rate = max(req->rate, 19200000UL);
> +
> +	return 0;
> +}
> +
>   static const struct clk_ops clk_smd_rpm_ops = {
>   	.prepare	= clk_smd_rpm_prepare,
>   	.unprepare	= clk_smd_rpm_unprepare,
>   	.set_rate	= clk_smd_rpm_set_rate,
>   	.round_rate	= clk_smd_rpm_round_rate,
>   	.recalc_rate	= clk_smd_rpm_recalc_rate,
> +	.determine_rate = clk_smd_rpm_determine_rate,
>   	.is_enabled	= clk_smd_rpm_is_enabled,
>   	.is_prepared	= clk_smd_rpm_is_enabled,
>   };
> 

-- 
With best wishes
Dmitry

