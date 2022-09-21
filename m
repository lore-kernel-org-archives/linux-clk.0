Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B38C32771
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 07:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbiIUHvX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Sep 2022 03:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbiIUHvK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 03:51:10 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3853383F2F
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 00:51:05 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r7so8481846wrm.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=vHvPgyZXtdTUVL+2zbQ6BjAvak8aoLLPjJOxCcUCMJY=;
        b=NAfBeUZlU5NMe8lfXlyDKEvEtXYBTQkPVnvGFLrOsUayOoVMVypK+gV9KjOlcM+Uii
         19TOVKMjEtyFisv8oKgQkupSCgvPBW1lqTlWHIpWd8bE3S0pEb6UfhLweWgNDqYJAjI/
         aquX5irubOve9rPG2wuoQ1KMMoTnd5RjGvWrAChDGWogMNkhrgviMBM6b9oX4/YFW0Qa
         XeOWfXRmmJ/ngJLsUhqOm9DKAxJbt+V9LwhusidhcNrpH6YVbiciHf05eG4OVghadb2l
         TK4NJfUK2O1bTVpjkIm2gXdz11GIOkxQfY1C6Ii45mLZm4jvqdydKzvDPA6YdrUOF2DJ
         KuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=vHvPgyZXtdTUVL+2zbQ6BjAvak8aoLLPjJOxCcUCMJY=;
        b=4cJk3gPD+peXyuDVw8xdRIsfGVtpbajgtf3tkEOCe5+gVffv3GE4qvB/TiPb35p/kv
         RwFZF8KZwLzBlp3xZHWztMVVUGap3vMnn2pUIzIbIR9uDCLyYcR6ivHJzi2uOqwY5PrI
         sIvuVs/nW+w9YzGdTszUgVMtCkND94BbVmVpx/x/+pEpkeonczfXlzsqtcuQOmFT9xw8
         desxvLVSdWfz7ooKUtgFHUG/MZADTEQun315ONXTK2x3yCJC0bsOQ7gL1x+48HTXdRRO
         KX0vC806ipLTAuvfiNrWH6g7H9nB/u7iH2NSgPdbuy4Ix5unYYaWWVlZt7iN38nLefwP
         +dmw==
X-Gm-Message-State: ACrzQf3BKyjLGwUZWUonWmvVenMFlYfIHYdawxisRbE9z3CgXrI6d9Xi
        TtDwMlONzAr9An6qquTUvFNdPw==
X-Google-Smtp-Source: AMsMyM4G+pLlHNhdvu/xC2xd5y7LgDyvtb3M56ZdAIFnfNAXsKeC/1SiLaT/H07cg39aGjnLLLD9Ow==
X-Received: by 2002:a5d:6da2:0:b0:228:64cb:5333 with SMTP id u2-20020a5d6da2000000b0022864cb5333mr15543049wrs.428.1663746663752;
        Wed, 21 Sep 2022 00:51:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3? ([2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d6642000000b0022ac61ebb14sm1786885wrw.22.2022.09.21.00.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:51:03 -0700 (PDT)
Message-ID: <36adf055-d963-1034-919a-97f3eeff02ef@linaro.org>
Date:   Wed, 21 Sep 2022 09:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add the reset reg for lpass
 audiocc on SC7280
Content-Language: en-US
To:     Satya Priya <quic_c_skakit@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@kernel.org>
Cc:     mka@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
References: <1663674495-25748-1-git-send-email-quic_c_skakit@quicinc.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <1663674495-25748-1-git-send-email-quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/09/2022 13:48, Satya Priya wrote:
> Add the reset register offset for clock gating.
> 
> Fixes: 9499240d15f2 ("arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers")
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 8d807b7..353c137 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2295,7 +2295,8 @@
>   
>   		lpass_audiocc: clock-controller@3300000 {
>   			compatible = "qcom,sc7280-lpassaudiocc";
> -			reg = <0 0x03300000 0 0x30000>;
> +			reg = <0 0x03300000 0 0x30000>,
> +			      <0 0x032a9000 0 0x1000>;
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
>   			       <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
>   			clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg_clk_src";

Checked against the already merged bindings change adding the reset reg (be9439df2353).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
