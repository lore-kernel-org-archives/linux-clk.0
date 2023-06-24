Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625E7EB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 01:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjFXBuT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 21:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjFXBuR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 21:50:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50022733
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:50:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f955def3a5so1703027e87.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687571414; x=1690163414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNi2d6GmsftsJ+atPufVKVknTeQVWLkwlnja8uNA9c8=;
        b=m5zubTS7oBIrjbyDTIEZ70Ok3zRH35JGiZlJ+HvMXP4Rf+sYzCxyoiNnFKShU1Zybd
         MDkEf31vdnyRuh3sTsMoTVjKtOfcVkQQijadv4L+OB8vzhXxaLxK3uW9bfmso/4HxCl3
         S81Jc0QmDnvLDrsrhySdOLBAgTbBoVdHJgYZwr1Re12BtRutcLicpRi6U5RaWRDGsA6+
         EKTLuvBI6H/p8lAQtcNdPWzds8VnSUGGoVHeZfEb+xTDJGLbm3GYxj31sKfv5xZl+stb
         ex2yCYlve/n2ZNjyFrF+FmEyddtiU2s5HL1NFdjV++dartYeFJ7GSEWJvM1qQoUV7WMd
         +9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687571414; x=1690163414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNi2d6GmsftsJ+atPufVKVknTeQVWLkwlnja8uNA9c8=;
        b=Zhfaar1c4c8OVmoGzo1ZtLioGhO5xfqdSH4TAiOyDh5cVoWAVprJlzAbj0GEYK7rt6
         Ggg7m8cofaaSHBW45e1Y41JxkP/P3huW8/kBlcrB+ZLx8yb7xp85P5/DyaCYinLUt21H
         krUk8wejQKY8zNFp6E7wy864tYkewkBF6+gHeCQHf40svIdhPUKXyKL7G6+fFokS0Yvn
         JPgszMv4B8Oh6OrUMsWzcf3v7FbEjvZmiJ6rjQQSz0CB8qHtR6YWqo7/v3NM6Z6EzuHT
         MlL1EX+h5sMWayo0ezyDPjX07uD2u0qY114cOodUag7zHZhsYCSz3YyQQ71PcSkVmsqe
         kz8Q==
X-Gm-Message-State: AC+VfDyZDbCO0ct0Fm/yxo94K6wOuwNQJ2nMJ4PKsdx0lZ4JTm/YprPc
        CXq0ijNzQ6tJUh4Dr3Voyq/v5Q==
X-Google-Smtp-Source: ACHHUZ4ST6i4QwIPfFE/arAJEjZ1Unxfc3+rXtHy6iSUDTWDUfFTNvhW18l63q3mvwcSzTNDem0v7w==
X-Received: by 2002:a05:6512:44c:b0:4f8:7803:5559 with SMTP id y12-20020a056512044c00b004f878035559mr9156150lfk.6.1687571414126;
        Fri, 23 Jun 2023 18:50:14 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id z6-20020ac25de6000000b004f86aef886asm100843lfq.54.2023.06.23.18.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 18:50:13 -0700 (PDT)
Message-ID: <8acfeaf2-2181-4ce7-5edb-1f23004dcd3a@linaro.org>
Date:   Sat, 24 Jun 2023 03:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 12/15] arm64: dts: qcom: sm6125: Switch fixed xo_board
 clock to RPM XO clock
Content-Language: en-US
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-12-1d5a638cebf2@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-12-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24.06.2023 02:41, Marijn Suijten wrote:
> We have a working RPM XO clock; no other driver except rpmcc should be
> parenting directly to the fixed-factor xo_board clock nor should it be
> reachable by that global name.  Remove the name to that effect, so that
> every clock relation is explicitly defined in DTS.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 722dde560bec..edb03508dba3 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -22,7 +22,6 @@ xo_board: xo-board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
> -			clock-output-names = "xo_board";
>  		};
>  
>  		sleep_clk: sleep-clk {
> @@ -306,6 +305,8 @@ rpm_requests: rpm-requests {
>  			rpmcc: clock-controller {
>  				compatible = "qcom,rpmcc-sm6125", "qcom,rpmcc";
>  				#clock-cells = <1>;
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
>  			};
>  
>  			rpmpd: power-controller {
> @@ -713,7 +714,7 @@ sdhc_1: mmc@4744000 {
>  
>  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
> -				 <&xo_board>;
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
>  			iommus = <&apps_smmu 0x160 0x0>;
>  
> @@ -740,7 +741,7 @@ sdhc_2: mmc@4784000 {
>  
>  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
> -				 <&xo_board>;
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
>  			iommus = <&apps_smmu 0x180 0x0>;
>  
> 
