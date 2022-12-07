Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87B6C4708E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 13:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbiLGNtI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Dec 2022 08:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiLGNtB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Dec 2022 08:49:01 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C2054B08
        for <linux-clk@vger.kernel.org>; Wed,  7 Dec 2022 05:48:57 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id a16so995898qtw.10
        for <linux-clk@vger.kernel.org>; Wed, 07 Dec 2022 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1m6QhBfItvzCyf6N0lXKPxnJF2cCk3WTq5AdAaVm4Dw=;
        b=dZ+//nSa0gxrqTc5cCbT9fAIMhABBb7i9UroMGsb5F+QLbmKfJfGk1Uf/HP4oFopRn
         rSyR49n/bqtV+cqmHu58anci2UQ51RMn/nlajBcitKGgGDky+qGoWS9jOnLtrpAJuz/K
         YL9uSv/We0PMgiEkTX/Ygrba9wlV7WsZU0kiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1m6QhBfItvzCyf6N0lXKPxnJF2cCk3WTq5AdAaVm4Dw=;
        b=58dLOMolQcsSrQCsiYof8CqYWwrDhrZk9lQXZ9VlWTgUOb8wYQWPIwq9UdnKlOHo+X
         mL7/Kiit4I63adAFPlN4JA25yB6YP9taEiwFTr4rqi/bVzKi2rwoA3Q/y4mjp7IWcWO9
         xnp7y+iUHGrw5SDKjICOQ/7s04sd2wOrAHF9n8ltLCvvfQEPyCpq54Cuik7W65mOunVB
         /eQ+G7THRSanwYhr7zrwHHakIV820/UfYfZQ9lCVUQSgoZuAJK9Mji5blqhBh+GF1S68
         Nu4crRy7A+61FSGgbsztWemKQMTPM0vbLLDMJcQJwdpoLdAZPr+6dPnPMaOjVe4B+lh0
         xSSA==
X-Gm-Message-State: ANoB5pnLfsDJmwXNPKpN5oRx0bzGKOPQ/XU2k3iQKp/NF+NtoZHl+9Y/
        G/FsdGB0Y3sFzqeEKSvAzUjopA==
X-Google-Smtp-Source: AA0mqf4SDn1IptPJc5cgdJVFmgIWEB/fuNFvb3O8UHTJtIqqmlptsq2R1OVzB21NpcL8vpbKhMpTow==
X-Received: by 2002:a05:622a:1f8b:b0:3a5:1fa1:4b7e with SMTP id cb11-20020a05622a1f8b00b003a51fa14b7emr83787363qtb.161.1670420937259;
        Wed, 07 Dec 2022 05:48:57 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id v15-20020a05620a440f00b006fc2b672950sm17906166qkp.37.2022.12.07.05.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:56 -0800 (PST)
Message-ID: <115194d9-5bfb-486d-71d4-05fb9212627c@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/18] clk: qcom: smd-rpm: fix alignment of line
 breaking backslashes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-11-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/6/22 6:14 PM, Dmitry Baryshkov wrote:
> The commit 52a436e0b7fe ("clk: qcom: smd-rpm: Switch to parent_data")
> introduced ragged right alignment for the line breaking backslash. Fix
> it to make the code look consistently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Very pretty.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 2075cfd34f99..7e43ecdda763 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -36,10 +36,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_ops,			      \
>   			.name = #_name,					      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	};								      \
> @@ -53,10 +53,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_ops,			      \
>   			.name = #_active,				      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	}
> @@ -74,10 +74,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_branch_ops,			      \
>   			.name = #_name,					      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	};								      \
> @@ -92,10 +92,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_branch_ops,			      \
>   			.name = #_active,				      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	}

