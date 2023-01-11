Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F617C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbjAKVAe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbjAKVAM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:00:12 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969553FA29
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:59:29 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j17so25430823lfr.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QyAJuZFFqvNr/D0h9ACf61BFr27KTfRszm5K4wFIax0=;
        b=t+WMkvoI5qbVVsxNumMG0KmrmXohDtZwIH6eNGnDNpg11o8yw1vxIuc17VxlcziMGd
         2iXmy+9Wa572VBn+sReHTD01NTMJgMynx+Mg3qotHIlDghUv/FhKMThgiJsDbZ4aPNie
         fWVGH2YSzRr7DjogQsgkvN79UyXl/J9flenWpP0/g2KXl3E1H6VucPTof0xeekBnOxnr
         T90PpbAta1tDEQAzChpCkIBnxJnDx36MioeghS5Ksdo+uQsAKmUkP9v+JwLIwlYRtc5/
         OSRH9tZUxp0GiQj0nsq7L7BnjzMoRFerFCFfPPK5H8PDqUHcJnZQOsO4j6tc9/8qk1Kg
         KXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyAJuZFFqvNr/D0h9ACf61BFr27KTfRszm5K4wFIax0=;
        b=dp3cwTsxaO9gn7HjJmJ6oHatfTgrh+89M/HzMkn/Zs1A6rams+6pDpjSnj6SsM02H1
         J31QcwP2C9AycwkuTgMtz5kIjS4O04fII20QEaRjSAZK9VN+gLOrA/8I0JaYedlEIwzr
         OsNUhiF3glXNeNb+SvyZwKPkwXvVKMBK1Vno9C/fyfORwSMigFrjggcJY4BvTFBOUBUz
         4kEgARjWAtKM+HorVA1MTphDavQiJ9yvaFopNEXIf5FX+8mnNnwssEIPghH4DTDq8Boo
         70G24ly0T4fY0j6jwdek1/o53/pQkhnJtPxTWhF4Z/mFp1nHUeQNFeJtqGFc+XtwOpFG
         t6bQ==
X-Gm-Message-State: AFqh2kp6ki2njajQ1vHPOHl4K+E9099ncj3OfV59hLkbMggwcnfUVTl5
        LF0jRaP4c9L6bOvL0Pslw2F8+Q==
X-Google-Smtp-Source: AMrXdXsiWTd7xOhayDmMPUpBu/+3bKoKxSX+g/AzagGPc8JkGbMcyCEUuA/auPNDUd2uKVcuhw1aMQ==
X-Received: by 2002:a05:6512:2805:b0:4b5:a53f:ac18 with SMTP id cf5-20020a056512280500b004b5a53fac18mr24232292lfb.69.1673470767738;
        Wed, 11 Jan 2023 12:59:27 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2894980lfc.229.2023.01.11.12.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 12:59:26 -0800 (PST)
Message-ID: <33a6bf2c-bb93-c183-3915-5b90b72e4503@linaro.org>
Date:   Wed, 11 Jan 2023 21:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/13] clk: qcom: cpu-8996: support using GPLL0 as SMUX
 input
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 20:19, Dmitry Baryshkov wrote:
> In some cases the driver might need using GPLL0 to drive CPU clocks.
> Bring it in through the sys_apcs_aux clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Oh that's new.. downstream doesn't talk about this..

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index d51965fda56d..0e0c00d44c6f 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -12,6 +12,8 @@
>   *                              +-------+
>   *               XO             |       |
>   *           +------------------>0      |
> + *               SYS_APCS_AUX   |       |
> + *           +------------------>3      |
>   *                              |       |
>   *                    PLL/2     | SMUX  +----+
>   *                      +------->1      |    |
> @@ -310,20 +312,29 @@ static const struct clk_ops clk_cpu_8996_pmux_ops = {
>  	.determine_rate = clk_cpu_8996_pmux_determine_rate,
>  };
>  
> +static const struct parent_map smux_parent_map[] = {
> +	{ .cfg = 0, }, /* xo */
> +	{ .cfg = 1, }, /* pll */
> +	{ .cfg = 3, }, /* sys_apcs_aux */
> +};
> +
>  static const struct clk_parent_data pwrcl_smux_parents[] = {
>  	{ .fw_name = "xo" },
>  	{ .hw = &pwrcl_pll_postdiv.hw },
> +	{ .fw_name = "sys_apcs_aux" },
>  };
>  
>  static const struct clk_parent_data perfcl_smux_parents[] = {
>  	{ .fw_name = "xo" },
>  	{ .hw = &perfcl_pll_postdiv.hw },
> +	{ .fw_name = "sys_apcs_aux" },
>  };
>  
>  static struct clk_regmap_mux pwrcl_smux = {
>  	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
>  	.shift = 2,
>  	.width = 2,
> +	.parent_map = smux_parent_map,
>  	.clkr.hw.init = &(struct clk_init_data) {
>  		.name = "pwrcl_smux",
>  		.parent_data = pwrcl_smux_parents,
> @@ -337,6 +348,7 @@ static struct clk_regmap_mux perfcl_smux = {
>  	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
>  	.shift = 2,
>  	.width = 2,
> +	.parent_map = smux_parent_map,
>  	.clkr.hw.init = &(struct clk_init_data) {
>  		.name = "perfcl_smux",
>  		.parent_data = perfcl_smux_parents,
