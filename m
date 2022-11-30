Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBCBC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 13:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbiK3NWt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 08:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbiK3NWl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 08:22:41 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7670FBE6
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:22:39 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id d3so20867696ljl.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0oyNrzlnpaYoIAkZeB8C7OE2GsLyYZHZ6alIdq6onU=;
        b=s8AU5GQwH9XMXxfGJOgFNumFcEjukt8cMzXCY5Lp3PqGAOAengZVHR1TMoJt4qEBit
         dnP+xLQbDTkyJUmWikIl9j3uj66kbDK1nmyALX/Rs9I5UNDZi5Uie8pwrolIRPLDzPuf
         B+W2RGpC9jryWWX/Cyv5Sp0GpJ7krbmVf3sSr7WKpbvstiYO+VuiluZ83hSHsZrrTYDh
         C+vGeX7JP8d0sxYi/16RurZfrE/zP1btXei8xXBJYkcfM1dpNK2CWFCglxiiiy7JnmEF
         Aevbys1Fyo5lV9OPdDbW0bTEC3URwI47MzuOBK2BGAvrAeiNVK448UB6mHmGkmOKj9Oj
         aXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0oyNrzlnpaYoIAkZeB8C7OE2GsLyYZHZ6alIdq6onU=;
        b=5DN0BFdEHswmI2z6QnJdhFEWXyLnnCirT5suD4XgG5NwT8Vx1UuY0ZztsLbDctL2rZ
         hF9Hya3nPvllqGH8D74Klfz+a/QzsVNQpQn6hs9zJuEynAjkdsEbN3ZzYyqqjYItUzdr
         3EptM+53uOPYPqU/mSMipJswic9BrFyYhDehIUiTXQvYOlMAdl9CEr/pEDuD+r/MjxgW
         nI2rr/kYLwIL9TyaKb5KxHMTLmeTSPcoJu3SzznNPutU9HX6NfeGUA/MxlFmgBAEitmy
         skNiWeHZ4SZB8do2UnxGdlu4625eYG9Se3C8jQCuqZuCx8Bf94iwOqyN0l3Mlc8ptMrW
         k4bQ==
X-Gm-Message-State: ANoB5pm3qaS9d7otmpKrO8Mc2XKZ5MqBht37Cg1hoVyReLLIFt5HO3iS
        kAOET9KSR+/riIr4sGsxj0HHuQ==
X-Google-Smtp-Source: AA0mqf4IiCgHH6nensKyCVxeto/oGVKHK+5aN4bny9EmdBnQ8gjKlhDapeokBF6kexsdap4v6ozqCw==
X-Received: by 2002:a2e:a402:0:b0:279:9c11:ab12 with SMTP id p2-20020a2ea402000000b002799c11ab12mr5933238ljn.76.1669814557829;
        Wed, 30 Nov 2022 05:22:37 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id d23-20020a056512369700b0049d83646ce7sm253534lfs.110.2022.11.30.05.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:22:37 -0800 (PST)
Message-ID: <6a275649-fb3e-d90f-d493-73c2b0a7ae96@linaro.org>
Date:   Wed, 30 Nov 2022 14:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/8] clk: qcom: rpmh: drop all _ao names
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 30.11.2022 14:09, Dmitry Baryshkov wrote:
> In preparation for the further cleanup, remove the active only names,
> they can be easily generated from the standard ones.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
