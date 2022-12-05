Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AA4C47089
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 17:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiLERFX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiLERFW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 12:05:22 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78091A226
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 09:05:20 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id z144so3679163iof.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 09:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EnHu3c1UhHs7RcBoP+ZGYo0qzAAA13UXzJ0zOnvwpU=;
        b=ODYubYMVYPsEDw96NqTq5fGjDvim5gAzD5p0gGTu5qILrMUzgEkA9oaA87p9gZ1hqV
         liN2ol0GdOxAAkmZW8FelyMGzfHAE5GP7bodAccnzIqX4a6rrvMIa7BupaBUbepjsur7
         mzwLEv7+D9gq1mNDneMHWD6ZRDKl/cmE701ueK75w2QtgXy2Qh+Odld/OVrYcH5AvCmK
         ji7fyLRBUcbanY/SVzQSBGy+xAkX7W6/kBxbvXS7RyDdQIotdZmMhlEcsf/yoJEg7unn
         afJmoe3SL1LhmgiRhtTNDKdK7YbeFc4o22zVUCcV5I0CMsDXKtwlqq54n5+AzHIgGMz+
         a1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EnHu3c1UhHs7RcBoP+ZGYo0qzAAA13UXzJ0zOnvwpU=;
        b=eWGQT2WBu2UwocvTsUPVW+htj4DSDmV/iEUTEGmNx89xvc3SvRVXe/3Q8D3IL7ZrED
         QJPsW04MH2l7v7QeudULTmJtue2Ux8IfRboNsls/Re4RgQvaUKfNDdDUc0hKqvMH/0iL
         SCQg0yUC+urW7Iw45SsVes84pVk1T/DpJiUPkOPbxL2C51MiagKuVnkIn/K22xJMAhCn
         De6Tjzc6peRs9BzvbZupDs24Fy+BTwiUtSO1Vi5apE61Y/5A3RHBWxgr5J21+t4x60cu
         6ENG4MYd3+/DDF2O2ddXo3+Yl+EWxAkd2DzblGeTLO2sH87OYtYk6ZovxxkWbwj126xD
         3WUQ==
X-Gm-Message-State: ANoB5pnr8gVaDv4INet2xTE/YeH/P6G/y9ZHEKpdzK5DSywXSDr9xU1V
        xWV7lOSwT1BAPsbig7SrOODE1M3T3sSO67Fm
X-Google-Smtp-Source: AA0mqf6dq7oCggwKP+X0hdsJFyc+fpHi78LXlCMK+OwoBgWyfz50BEIkwZ/8wLnGk6+4UDye4EDIjg==
X-Received: by 2002:a02:b01d:0:b0:38a:3421:be23 with SMTP id p29-20020a02b01d000000b0038a3421be23mr4364958jah.288.1670259920163;
        Mon, 05 Dec 2022 09:05:20 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id d10-20020a92ddca000000b00302a52ca9d9sm5343105ilr.74.2022.12.05.09.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:05:19 -0800 (PST)
Message-ID: <0bae98ff-8302-8ef7-1db3-a8bcb9cc4afc@linaro.org>
Date:   Mon, 5 Dec 2022 11:05:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/16] clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS
 clock definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-13-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
> Remove the duplication between the names of the normal and active-only
> clocks by moving common sufixes to the clock definition macros. This
> simplifies adding new clock definitions and reviewing existing defs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 90 ++++++++++++++++++----------------
>   1 file changed, 49 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 9f33dbd60e96..59abc6bf475d 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -62,7 +62,7 @@
>   	}
>   
>   #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
> -				    r, key)			      \
> +				    r, key)				      \

Thank you for fixing the alignment above.

>   	static struct clk_smd_rpm _platform##_##_active;		      \
>   	static struct clk_smd_rpm _platform##_##_name = {		      \
>   		.rpm_res_type = (type),					      \
> @@ -100,16 +100,24 @@
>   		},							      \
>   	}
>   
> -#define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> +#define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
> +		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_RATE)
>   
> -#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
> -		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> +#define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
> +		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk_src, _name##_a_clk_src, type, r_id,   \
> +		QCOM_RPM_SMD_KEY_RATE)
> +
> +#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_clk, _name##_a_clk, type,  \
> +		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
> +
> +#define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a, type,\
>   		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>   
> -#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> +#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
> +		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_STATE)
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
> @@ -410,51 +418,51 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
>   	.recalc_rate	= clk_smd_rpm_recalc_rate,
>   };
>   
> -DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
> -DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
> -DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
> +DEFINE_CLK_SMD_RPM_BRANCH_A(sdm660, bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
> +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss, QCOM_SMD_RPM_MISC_CLK, 1);
> +DEFINE_CLK_SMD_RPM_BRANCH_A(sm6375, bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
>   
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
>   
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
> -DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
> +DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk, QCOM_SMD_RPM_BUS_CLK, 5);
> +DEFINE_CLK_SMD_RPM(msm8916, pcnoc, QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8916, snoc, QCOM_SMD_RPM_BUS_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8974, cnoc, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb, QCOM_SMD_RPM_BUS_CLK, 3);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_periph, QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, cnoc, QCOM_SMD_RPM_BUS_CLK, 1);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass, QCOM_SMD_RPM_BUS_CLK, 5);
>   
> -DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
> -DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk, QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> -DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM_CLK_SRC(msm8974, gfx3d, QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8974, ocmemgx, QCOM_SMD_RPM_MEM_CLK, 2);
> +DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu, QCOM_SMD_RPM_MEM_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
> -DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8992, ce1, QCOM_SMD_RPM_CE_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8992, ce2, QCOM_SMD_RPM_CE_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8994, ce3, QCOM_SMD_RPM_CE_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8976, ipa, QCOM_SMD_RPM_IPA_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, hwkm, QCOM_SMD_RPM_HWKM_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmnrt, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmrt, QCOM_SMD_RPM_MMAXI_CLK, 1);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, pka, QCOM_SMD_RPM_PKA_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcs404, qpic, QCOM_SMD_RPM_QPIC_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, qup, QCOM_SMD_RPM_QUP_CLK, 0);
>   
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, 1, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, 2, 19200000);

