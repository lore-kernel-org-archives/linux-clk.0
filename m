Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E4CEB64D9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jun 2023 10:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjF2K4p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jun 2023 06:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbjF2Kzq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jun 2023 06:55:46 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3612693
        for <linux-clk@vger.kernel.org>; Thu, 29 Jun 2023 03:55:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6adef5c22so6949091fa.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Jun 2023 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036130; x=1690628130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uR/dK7cnl1TOAv90dRpkTTyWoJWXcXjhVWHMYmmHHe0=;
        b=r1y1qbZUFPs/jNqQXZH0XiAheiLYuBDah3ATxxVptmzHTlxJj8dBwooas4cthzoTdy
         WzIt81N5dWa0MyHtFb2+pEI/zfvnIw+m3CrEelDHbsHfsb8IK/BCCX0Mzs7ROIYmaJ6F
         TL5+5m9ZwdS2nnvNF03NM+fUOnQqDEX4Kxf7U14Kw72zCrG/gu6JOr7tgsvBsLafamOE
         iugAJfsqUjZ4NjUpiNoiycqa5637iOu0kODUB6zOip+VSbu8IgBx+5CCo0T1CX5Qrlpp
         ZJhR9+6jPSThdp755+Aqoejnv9IAm8GQGGxuRCEmrR+ochB/0tyJoxL4CPOF+q0Lvyx5
         5d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036130; x=1690628130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uR/dK7cnl1TOAv90dRpkTTyWoJWXcXjhVWHMYmmHHe0=;
        b=LnijDv2ON6EjJkC3xHsZMuiwJqYLhfg8QwLXiAzgFcQuD/ySUoOP/W7eAI4zJ3Q+fY
         yyDGgT7rD77KIOJe6GruOiKhsch7bl2oaq1SU+hLiXAx39GK0Ctl/bT7PvkWyZA6lwjH
         gLcSDzfwHh+bBzVWvHK4Qr+N0Bcg1qvhC9DoIp4L+JxBFGEnBC7nCxxkIVgWahEWi831
         9pGp10GZTy+JnIXzSOh+Zaowwb5+YMEu5kzUEOoFJ4E91CUrrjTx2Df2DeUWx/56uZUi
         i6zaa0x5fJ4lXKfkDV9IBaKoRl0w7I7CpPX65zqVqRRgiueNjT/yUS/7sTTh/QoIg19p
         2tuw==
X-Gm-Message-State: AC+VfDwOnJsJzqQmCRgVaC3YYbkYynCxlOidfHAvAJtwaC+Sci7m6x5M
        rQiRDrx+7PGv/3gKU1EcGQxdoA==
X-Google-Smtp-Source: ACHHUZ5p8UBH7vKbUX3uxCQ+NHRtzhhvbvpOuj87ASCvmdXdOVMcyeDyv3SSYzDcrclrVJPlH3520Q==
X-Received: by 2002:a2e:96d0:0:b0:2b6:9e1e:f048 with SMTP id d16-20020a2e96d0000000b002b69e1ef048mr11474428ljj.31.1688036130360;
        Thu, 29 Jun 2023 03:55:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020a05651c010c00b002b6a5dfc7f3sm1640778ljb.30.2023.06.29.03.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:55:29 -0700 (PDT)
Message-ID: <84eb1d40-436b-a5b4-a4e3-75a511ad5a90@linaro.org>
Date:   Thu, 29 Jun 2023 13:55:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm6125: Switch fixed xo_board
 clock to RPM XO clock
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2023 23:14, Marijn Suijten wrote:
> We have a working RPM XO clock; no other driver except rpmcc should be
> parenting directly to the fixed-factor xo_board clock nor should it be
> reachable by that global name.  Remove the name to that effect, so that
> every clock relation is explicitly defined in DTS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 722dde560bec..edb03508dba3 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -22,7 +22,6 @@ xo_board: xo-board {
>   			compatible = "fixed-clock";
>   			#clock-cells = <0>;
>   			clock-frequency = <19200000>;
> -			clock-output-names = "xo_board";

Why? I'd say, leave it.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   		};
>   
>   		sleep_clk: sleep-clk {
> @@ -306,6 +305,8 @@ rpm_requests: rpm-requests {
>   			rpmcc: clock-controller {
>   				compatible = "qcom,rpmcc-sm6125", "qcom,rpmcc";
>   				#clock-cells = <1>;
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
>   			};
>   
>   			rpmpd: power-controller {
> @@ -713,7 +714,7 @@ sdhc_1: mmc@4744000 {
>   
>   			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>   				 <&gcc GCC_SDCC1_APPS_CLK>,
> -				 <&xo_board>;
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>   			clock-names = "iface", "core", "xo";
>   			iommus = <&apps_smmu 0x160 0x0>;
>   
> @@ -740,7 +741,7 @@ sdhc_2: mmc@4784000 {
>   
>   			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>   				 <&gcc GCC_SDCC2_APPS_CLK>,
> -				 <&xo_board>;
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>   			clock-names = "iface", "core", "xo";
>   			iommus = <&apps_smmu 0x180 0x0>;
>   
> 

-- 
With best wishes
Dmitry

