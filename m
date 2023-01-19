Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB8BC004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjASLZD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjASLZC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:25:02 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02FC4672E
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:25:00 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id q8so1234448wmo.5
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNSTyBmPKm6Klhu4IpDVUP4XVH5FLzHMQW5eiv8RUgM=;
        b=DvJnoD85O3tSaMrrmTrCxBgYd8+PRIzsyHlywp1nTWQLgzegC5g0KsHd4ijZfHOGb1
         scCckOv3/QeJ647THkhc7TD4NtugF2IgiPxjxGYmjunLCqcrn99e4+tXITPusbmYaj1G
         bzGsB1s4ioCY4VHLw2QBiiiSYECfWInqNUCuo/ifSyDa0uoKlJ31M5Wm8CuX1dzsbK9k
         3xPdTLiTBl7onqaVsyuvbq8Lu7QlNMTga6C+vmrduNHzv9g+n6J/ry0KxM48JjwkL+2r
         snFEsfyWzdG1tLmhPVbk/d4Xxyyw5ftrOEzyykKPiA9jRncJ1AF+fd0JAzjcQ83uTAnw
         XyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNSTyBmPKm6Klhu4IpDVUP4XVH5FLzHMQW5eiv8RUgM=;
        b=3p7wq/mmHRqPZDJBKuXOA2dASStXyGtb3+XNsANn+3cKlm5sUiNZaeL5FHzJQnYUyt
         V3BziblrNyN7aQR5r1aXOU79L+86wKvijv4bM9DcZB5OU0+SPBgI0fISPaQAauX3W5oP
         aSGA1aaQdD0prey3rezhCC4tEoDzi0b8ERhWx4EwDjPwy6Mgn1XN+xRP2hDN2CXo77Y4
         8mjRZJNf3BRabWz/kMRw5EuRyK/Fuxazpvh3nb0ENokLHxuHshdsNb1D2Ypu+0+eqJGj
         T8ifElhGBbujxuYmP3VnPgJ/AZscgkLCsa9layxIzjrl16T5MYdcTerJh4OPF3xsUdNk
         S34A==
X-Gm-Message-State: AFqh2kqkZYsypc9h5EhEyoiBBqJRQkD0TQ675wvRIrzXNcLL2dzwmF9O
        FESrd3gAZXc1lxbbnHft1aST0A==
X-Google-Smtp-Source: AMrXdXuc1nQgKLQ2x4m4hZQPRwAKM1ot7sNk9xJfc2vqacAhujofMApEuuvwfVEWvASRJ+SnUg555A==
X-Received: by 2002:a05:600c:16d3:b0:3d3:513c:240b with SMTP id l19-20020a05600c16d300b003d3513c240bmr9838358wmn.7.1674127499469;
        Thu, 19 Jan 2023 03:24:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x23-20020a1c7c17000000b003d974076f13sm4451861wmc.3.2023.01.19.03.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:24:59 -0800 (PST)
Message-ID: <bc9361a0-8177-e85b-f52c-c3d018c2b910@linaro.org>
Date:   Thu, 19 Jan 2023 12:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 5/6] clk: qcom: lpassaudiocc-sc7280: Merge lpasscc into
 lpass_aon
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1674120444-23706-1-git-send-email-quic_srivasam@quicinc.com>
 <1674120444-23706-6-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674120444-23706-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/01/2023 10:27, Srinivasa Rao Mandadapu wrote:
> Merge lpasscc clocks into lpass_aon clk_regmap structure as they
> are using same register space.
> In existing implementation, lpasscc clocks and lpass_aon clocks are
> being registered exclusively and overlapping if both of them are
> to be used.
> This is required to avoid such overlapping and to register
> lpasscc clocks and lpass_aon clocks simultaneously.
> 
> Fixes: 0cbcfbe50cbf ("clk: qcom: lpass: Handle the regmap overlap of lpasscc and lpass_aon")

I don't think this is suitable.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index 1339f92..18f7a50 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -642,11 +642,6 @@ static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc = {
>  	.flags = RETAIN_FF_ENABLE,
>  };
>  
> -static struct clk_regmap *lpass_cc_sc7280_clocks[] = {
> -	[LPASS_Q6SS_AHBM_CLK] = &lpass_q6ss_ahbm_clk.clkr,
> -	[LPASS_Q6SS_AHBS_CLK] = &lpass_q6ss_ahbs_clk.clkr,
> -};

This is now an ABI break because these IDs will stop working.
Additionally it is an ABI break marked for backporting to v6.1...

Best regards,
Krzysztof

