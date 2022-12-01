Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8D5C43217
	for <linux-clk@archiver.kernel.org>; Thu,  1 Dec 2022 20:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbiLAUhO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Dec 2022 15:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiLAUhM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Dec 2022 15:37:12 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EAEBFCD4
        for <linux-clk@vger.kernel.org>; Thu,  1 Dec 2022 12:37:11 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id o13so7059052ejm.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Dec 2022 12:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hE5h+8rRjLNCj0/pX3t5+ZT8C/pnxKbEUZXqAsiIlMw=;
        b=JIYi/ZagkG/clC/ihYFdyROdp8o1gTA8WAw9Um6lFO8nbFVG2rJvFtu8kkyTOxXUKJ
         V3H3SZhNgHdshKHBBvBaim442karZRGEInJm3Iyn9P0b4EUajxYJVpWNoDNqfWPNy+Oo
         cBTTo+nH4n8d/wkdiDyQgVAr69dR0IjFleXlWc39aJtFPUXWEissJW20fq9jUKbd2Tmc
         sEjrVm9nEfq6gzDfE/43JmvHMBTpv2k6wSds78es5hCZMsQiDbB4CHPnDgmBfK033J9J
         4m5rLXGelIQ95Tjenb5FKD+YMFak3aS+uCaYsBJzJvxbF804bfK/J5zLoAdOnVK9V3us
         V6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE5h+8rRjLNCj0/pX3t5+ZT8C/pnxKbEUZXqAsiIlMw=;
        b=FJVx6SdgW0eVVrMKXG8TsmpHkjO5Ag8T+n1G+oXLWjW4K4GaTHbGCbwMGKbb+w2O2G
         YrnPCS2Q7M3Ui7FZ4A6aNj3PLf9SN0ynfj4fiu7niq6i7wyjXRNvhbxEMVMUAaMGh8u7
         b4e/5avFRFRSlM0HJSNXQ4/Qw8tL4Zw1lymNQdy6p4gv9z5gxYnOg0/Cc/wQ/59iPptI
         LEJLY0XZKg+L46vx0tB83X7wo5Zgg0WXDBGSW/xzxTyUfmFFGtuEk08ia43TZOioTxEF
         JXTuFolVNmI8U5pEswaCyoZ0OSukI2WmOm6Tf61Y9sxjbdpfd8dPHwm19kvgU28gNuuB
         8Q6g==
X-Gm-Message-State: ANoB5pkzikn/dfnmRRg/aq0MvTZEEwiMCuCLbT5o8jZ6uQ27pc8YbqGs
        Ac0W2GxwYMkgaKxk1ndQQiUU6Q==
X-Google-Smtp-Source: AA0mqf44F+yK7qTvdSdVanmU/ZNeVNttBuSKLAP6ZSyPE4yj0QxInTg+pNTr693XPegwQTeJYN6xIw==
X-Received: by 2002:a17:906:2998:b0:78d:3ff8:6ec8 with SMTP id x24-20020a170906299800b0078d3ff86ec8mr41534025eje.568.1669927029690;
        Thu, 01 Dec 2022 12:37:09 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0046aa78ecd8asm2109362edb.3.2022.12.01.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:37:09 -0800 (PST)
Date:   Thu, 1 Dec 2022 22:37:07 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 3/8] clk: qcom: rpmh: drop all _ao names
Message-ID: <Y4kQc82F7kgpBlI9@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-30 15:09:56, Dmitry Baryshkov wrote:
> In preparation for the further cleanup, remove the active only names,
> they can be easily generated from the standard ones.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I was actually thinking of this when worked on SM8550. Thanks for doing it.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/qcom/clk-rpmh.c | 62 ++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c4852bbd00bf..00c0c8f851bd 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>  
>  static DEFINE_MUTEX(rpmh_clk_lock);
>  
> -#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>  			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_name_active;		\
> +	static struct clk_rpmh _platform##_##_name##_ao;		\
>  	static struct clk_rpmh _platform##_##_name = {			\
>  		.res_name = _res_name,					\
>  		.res_addr = _res_en_offset,				\
>  		.res_on_val = _res_on,					\
>  		.div = _div,						\
> -		.peer = &_platform##_##_name_active,			\
> +		.peer = &_platform##_##_name##_ao,			\
>  		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>  				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>  				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,7 +92,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  			.num_parents = 1,				\
>  		},							\
>  	};								\
> -	static struct clk_rpmh _platform##_##_name_active = {		\
> +	static struct clk_rpmh _platform##_##_name##_ao= {		\
>  		.res_name = _res_name,					\
>  		.res_addr = _res_en_offset,				\
>  		.res_on_val = _res_on,					\
> @@ -102,7 +102,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
> -			.name = #_name_active,				\
> +			.name = #_name "_ao",				\
>  			.parent_data =  &(const struct clk_parent_data){ \
>  					.fw_name = "xo",		\
>  					.name = "xo_board",		\
> @@ -111,14 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		},							\
>  	}
>  
> -#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
> -			    _res_on, _div)				\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
> +	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>  			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>  
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
> -				_div)					\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
> +	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>  			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>  
>  #define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> @@ -342,33 +340,33 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>  };
>  
>  /* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> -DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, "xo.lvl", 0x3, 1);
> +DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
>  
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
> +DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
>  
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
>  
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
>  
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
>  
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
>  
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> +DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
>  
>  DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
>  DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> -- 
> 2.35.1
> 
