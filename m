Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD36C004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 19:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjASTMS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 14:12:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjASTLm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 14:11:42 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4889AABB
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 11:11:00 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qx13so8171194ejb.13
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 11:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DgmdxISYxAGF0PfZ9BcThxW09Vbi+MCyPhr6BazLtw=;
        b=dF8f7+PhLfU04sVIxxubHrCV5k3rKFiQPk/NlLGGZjXyAhv59R5ETnUwaQSVV6o5oq
         LLCqFaMNdZ4DUMCLO81WV675QdK6ZpZYVTRtAdaHe/3bIItQGayb3kW3vnY4MmSBq9CB
         hXbQ/cZrxPcXxwM5i/SjMTGaY3kRebVG086IZp7fjtiXc+FBAjOQN8Y0K7nngY1hr8dP
         bCltMfxrQ5U2GcnTVKss5uS7PrfUaeBttESr6oHzodTXO6Q9sdlpbp9aUzIP893zxEsi
         NClVFM/dzDrrxhhOiFRuEpqhM+E8592P0yWU6NGiLy8CECmyOGrfakA4ev+LuV6mMYM1
         1/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DgmdxISYxAGF0PfZ9BcThxW09Vbi+MCyPhr6BazLtw=;
        b=qDv4KgncLV90bGeRw78TGIN9z/l064sGCj3PuHleXe1xIfVgxoGA2XfDV0+qAtG3RX
         Iq5p8AqtBoJIwJrzf6+q97T2OvrUG5jlIkXuBuEYl84SRiMIUi/5O16xZfbP0c9AxnnD
         rXtzJBwGXKl1Vz1Rv0hXRIZxYPnH3QYPNvsdG+6Ubz0iA/r8bmVM/0bpeNoQomwTMcud
         PhZdSdz+KAY7Ywoc7hlsmh1e7HdM8DvpsOk0MbWkQ+rBTz4D77JsVxsFowniQh78T0Ty
         3IS+CLq6YkjmkjXLXJRcrLLGKcOpsgpPT83Tk6Cs0BrZauYixr6cVyhPOyMfC5+REAvq
         f/yw==
X-Gm-Message-State: AFqh2kpTaL1l+hHTGAX34OeF2v2TZLrHMCuW0ztIJuoxMKwKR8JNpuoU
        1a7EriGPDI1NOBE3fi3sSlIjTA==
X-Google-Smtp-Source: AMrXdXv9JqeohpG7e780c+S2XWGSDjRglnr6mSNdrJpNsLuGu/s9a2hyjayxnK0PpkQB3Nq/m/u6dA==
X-Received: by 2002:a17:907:c019:b0:867:ef3f:dd85 with SMTP id ss25-20020a170907c01900b00867ef3fdd85mr9077419ejc.56.1674155407507;
        Thu, 19 Jan 2023 11:10:07 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906304e00b0077077c62cadsm16677521ejd.31.2023.01.19.11.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:10:06 -0800 (PST)
Message-ID: <fc97247a-300f-dc46-aaa4-932259702136@linaro.org>
Date:   Thu, 19 Jan 2023 20:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] clk: qcom: smd: Add XO RPM clocks for
 MSM8226/MSM8974
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230119190534.317041-1-rayyan@ansari.sh>
 <20230119190534.317041-2-rayyan@ansari.sh>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119190534.317041-2-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 19.01.2023 20:05, Rayyan Ansari wrote:
> Add the XO and XO_A clocks to the MSM8974 clock list, which is also
> used on MSM8226.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index fea505876855..42ea3bb37f63 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -549,6 +549,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5, 19200
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6, 19200000);
>  
>  static struct clk_smd_rpm *msm8974_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC] 		= &sdm660_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC] 		= &sdm660_bi_tcxo_a,
I think that's gonna conflict with Dmitry's recent cleanup..

Konrad
>  	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
>  	[RPM_SMD_PNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
>  	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
