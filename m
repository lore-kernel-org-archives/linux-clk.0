Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEBEECAAD3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 10:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiIIKQu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 06:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiIIKQp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 06:16:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7A912D1B3
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 03:16:43 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bs13so1243014ljb.8
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0hHJbDJozeiOdflyzPme+RUJuaG9ou6Dad/+xNPiITI=;
        b=B9WaXRC6b0pg9snfXwe0yY0B8pjF+5zrlbpTJEHG3Hb5Ctcxp2qKsv6hT4I8aUrlrA
         Ub24plFv/JQoiMb/0+7Tqk566mLb3XpPu2rFnHuF8xezKgqKiWYqQa8w+P6Qbeh7OhAd
         PpKY+soP4LDbhzzhAo+o7O+wq+FE23aYSjtLMqMkfy8IpBjD/wIDTFdP3e4GLH+GEFy3
         u5dRSqKj/eUEEqFnJbLttFe10eqSkoFhG3vCkY1Glv4IcGhF6x/GAKOAlPtM52jTHJkD
         raVuQi+Ue/FbN5sCk5tBIZlwUXKDzuJoqm1kSMy9j+UghooMEB4dHIgIGRliQ56/jDWF
         ZKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0hHJbDJozeiOdflyzPme+RUJuaG9ou6Dad/+xNPiITI=;
        b=KuWIesxhKkCUDH9KAxdUiFuuX6bOMaTWaXoVsS8329AyjvTl9TrW9UTDBHlWZvje1U
         JFcVvpwrr9MDA2+NpDobMyAv64I2WHOS0uw3UE2Zy0qIoy1SbAAaQ792QrMJfogCrfMY
         oqHiuuI0K8Varo8iTlh5GQmy1C0Sh8t0ST5gY01ed7sq6DWRtfxDkFdEfAJ1NJXCEq6n
         jINCPMnkyF0X2iRrChKh5wvnGtERKpHFR6N1J0XAgatq6qLkkdDIvdMtSxAZqfsRi8bg
         zL+v3/DvbvVYItL4RYH12FCcWUi37fElf71eMYXdqdsnqL97CeVKaSoBD+YGPoRckVoM
         IBlg==
X-Gm-Message-State: ACgBeo2uQeJ1M8vtTCIP/NLTTAVvDHxCirKJmWHzTLoNy3WRWYls75EF
        mHLhlfO4rJTWd03RtcOUR5+/QA==
X-Google-Smtp-Source: AA6agR5KrrFFOiQVW89EmX5vGuFt0DXTOis53C0E/66tuD+7a3B8NxZR221OVuzaSBYeNnZ2qqlzAA==
X-Received: by 2002:a2e:a176:0:b0:26a:cb67:c392 with SMTP id u22-20020a2ea176000000b0026acb67c392mr4040350ljl.451.1662718601361;
        Fri, 09 Sep 2022 03:16:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651236c900b0048a7c162bbesm13459lfs.279.2022.09.09.03.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 03:16:40 -0700 (PDT)
Message-ID: <a7bd2a82-4015-7899-47ed-da7a5ce6141c@linaro.org>
Date:   Fri, 9 Sep 2022 13:16:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 00/15] clk: qcom: use parent_hws/_data for APQ8064 clocks
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2022 15:04, Dmitry Baryshkov wrote:
> This series converts the APQ8064/MSM8960 clock drivers, bindings and DTs
> to use parent_hws/_data and excplicit clock binding in DT.
> 
> Dependencies: [1] (whole series), [2], [3]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220521151437.1489111-1-dmitry.baryshkov@linaro.org/
> [2] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-2-dmitry.baryshkov@linaro.org/
> [3] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-3-dmitry.baryshkov@linaro.org/
> 

Bjorn, Gracious ping for this patchset

> Dmitry Baryshkov (15):
>    dt-bindings: clocks: qcom,gcc-apq8064: define clocks/-names properties
>    dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8960
>    clk: qcom: gcc-msm8960: use ARRAY_SIZE instead of specifying
>      num_parents
>    clk: qcom: gcc-msm8960: use parent_hws/_data instead of parent_names
>    clk: qcom: lcc-msm8960: use macros to implement mi2s clocks
>    clk: qcom: lcc-msm8960: use parent_hws/_data instead of parent_names
>    clk: qcom: mmcc-msm8960: use ARRAY_SIZE instead of specifying
>      num_parents
>    clk: qcom: mmcc-msm8960: move clock parent tables down
>    clk: qcom: mmcc-msm8960: use parent_hws/_data instead of parent_names
>    ARM: dts: qcom: apq8064: add clocks to the LCC device node
>    ARM: dts: qcom: msm8960: add clocks to the LCC device node
>    ARM: dts: qcom: apq8064: add clocks to the GCC device node
>    ARM: dts: qcom: msm8960: add clocks to the GCC device node
>    ARM: dts: qcom: apq8064: add clocks to the MMCC device node
>    ARM: dts: qcom: msm8960: add clocks to the MMCC device node
> 
>   .../bindings/clock/qcom,gcc-apq8064.yaml      |   9 +
>   .../devicetree/bindings/clock/qcom,mmcc.yaml  |  31 ++
>   arch/arm/boot/dts/qcom-apq8064.dtsi           |  35 ++
>   arch/arm/boot/dts/qcom-msm8960.dtsi           |  39 +-
>   drivers/clk/qcom/gcc-msm8960.c                | 436 ++++++++++-------
>   drivers/clk/qcom/lcc-msm8960.c                | 211 +++-----
>   drivers/clk/qcom/mmcc-msm8960.c               | 454 +++++++++++-------
>   7 files changed, 713 insertions(+), 502 deletions(-)
> 

-- 
With best wishes
Dmitry

