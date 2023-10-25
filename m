Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D68C0032E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 08:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbjJYIlT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjJYIlR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 04:41:17 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C567012A
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:41:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c594196344so24288751fa.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223273; x=1698828073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwbaq49bUIJIzGkkWKUf0VmMFkjnuPsGrEUtSJczEhU=;
        b=M1KJj6oaJs1lxK0kDgMxKtcYBHJyp5Ot1UpWuoae9u4OphyRH+QpjYe2SGdD39vzLV
         xiCDVzJFeqzFrbE1l/IFf264NIyVqoe7HPCeIk5esbX5OMhpYYFMOpBczL2+sOOwEjZJ
         zz7Rq8wJI2/c9QxGcm/ItxasllfqEI9WSlk7EGt9kVSudilgQLXvhtzuSsPA3FVOo4LR
         GUz+Qm5Se2c6Ny/Xu6vCOVYD5saHLEwPwBWBLqfrTFOfUtrOw/jnTkBknUVWUeU3T4pw
         CM9P3YT1rrp12aHrIPdXOaY67CsBWJhbeX/u66DQOeGoysCAdD09QNl5m63qYPz4ptsL
         kDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223273; x=1698828073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwbaq49bUIJIzGkkWKUf0VmMFkjnuPsGrEUtSJczEhU=;
        b=R8sm9mm6KKq3Bllc9Da6+cKrQmU2tjemvuANumoiWAKpRy3Ly6kr0oXr+cR+oxxHh8
         Kv7n/x9yy05PRfDbLFN6bnNvzQAEYCGEbnoFvrdm6Dsty728/M9Kh6+J0g/YjPTlrXwY
         SMRiMyp7mx1E2y6oC4yDnT/617wh0g/3nzykmXpELfw+XtCkXFBxw+A227W/PSdBhOvW
         9hu1oONyRGP30wSjbRsGDXvTlouSH+JI1sLK5IhdWvjMXxk8r3NgLcshAxfvflwd9te0
         uI2hwoLh9bniWnn95TP/9GTbuHXF0c5bLMhFV4uQoC0xpQcUXuu9R+nIj+1NbprevO8D
         Soaw==
X-Gm-Message-State: AOJu0Yz7U4Tyf7V2ILFKNPpzfbOtH+Itx91gHk2meMvsU+P7tXeAjW8v
        /3U7RkPBxUKJLXPJGrDWrpE2+Q==
X-Google-Smtp-Source: AGHT+IFbZCmqnL+To2ghaph1BbbLrSVf/oae4tU1RJTeeP+QGgB2Y2IDMC0Pdfc+1HXMun1MVY+fvA==
X-Received: by 2002:a2e:a589:0:b0:2c5:21e3:f209 with SMTP id m9-20020a2ea589000000b002c521e3f209mr10149890ljp.23.1698223272898;
        Wed, 25 Oct 2023 01:41:12 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z14-20020a2eb52e000000b002b724063010sm2355545ljm.47.2023.10.25.01.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:41:12 -0700 (PDT)
Message-ID: <ccd24edd-b713-49f3-96f4-af653a8fd6b7@linaro.org>
Date:   Wed, 25 Oct 2023 10:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: qcom: add the SM8650 Global Clock Controller
 driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
 <20231025-topic-sm8650-upstream-clocks-v1-6-c89b59594caf@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-6-c89b59594caf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/25/23 09:32, Neil Armstrong wrote:
> Add Global Clock Controller (GCC) support for SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Just a couple remarks

1. looks like there's no usage of shared ops (corresponding
    to enable_safe_parent or something along these lines
    downstream)

2. none of the GDSCs have interesting flags.. I have this
    little cheat sheet that you may find handy:

qcom,retain-regs -> RETAIN_FF_ENABLE
qcom,support-hw-trigger + set_mode in driver -> HW_CONTROL
qcom,no-status-check-on-disable -> VOTABLE
qcom,reset-aon-logic -> AON_RESET
domain-addr  = clamp_io_ctrl

3. gcc_cpuss_ubwcp_clk_src uses the XO_A clock as parent, but
    it's not there in the ftbl.. Could you confirm whether this
    clock should even be accessed from HLOS?

[...]

> +static int gcc_sm8650_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gcc_sm8650_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> +				       ARRAY_SIZE(gcc_dfs_clocks));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Keep the critical clock always-On
> +	 * gcc_camera_ahb_clk, gcc_camera_xo_clk, gcc_disp_ahb_clk,
> +	 * gcc_disp_xo_clk, gcc_gpu_cfg_ahb_clk, gcc_video_ahb_clk,
> +	 * gcc_video_xo_clk
> +	 */
Could you make these comments inline, i.e.

regmap_update_bits(regmap, 0x26004, BIT(0), BIT(0)); /* gcc_camera_ahb_clk */

?

Konrad
