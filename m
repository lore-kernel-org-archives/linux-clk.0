Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5604EECAAD3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 10:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiIIKWp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 06:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiIIKWo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 06:22:44 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB91DBF36E
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 03:22:42 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k10so1915349lfm.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hFwC0LzTCzxgDbKrtB3n4gX8c2ZFjHdWwADeZvJUcTE=;
        b=vQDUEtsMJuwtSahkY9XhJLyBtT8peYu+jywzO+YFmKPQmhLyVapSLSmhak4cxVALms
         1+akpunGrJm3qLc0uAVM8u+UUVdpXLbYsFrN8tutn9DS6e7XmmAsf9mjL7/WUwywDalz
         I6tL4QAtK/7V9vQzrDmtlppXfvYETYbo5NdMhMyWEMf3KZ9TufK/JN0iXm0HAfou5NFY
         smi39JmcTg2P7db9SzSdTN1oUQDb+ijsZ9JuUo2QsT0IDmKPEO/tPdO8K6l+MDWRS3uE
         J4mj3GrIVatt36hnpHMuP5bYhZycn/YO9yUuiP5z6OuuJjfQD1hmNhdRobIzgQ/AtdP5
         5WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hFwC0LzTCzxgDbKrtB3n4gX8c2ZFjHdWwADeZvJUcTE=;
        b=R3l2flqrMnBOHGSQqM6Viz4YgnmdFdEchIOACNlMiBGCuCzpHsmP1AQfz3f8qOqS0d
         YptkyqB7NI5l0d8pFuYULSAyH1ztbu4PIPl/Z60namlf0IIQnb+09ARYhMOu40DzNb3P
         iNgkvOLwIKeMEnWWStzq6sJjnrRa+FMubgdhJLbf4sboipgjTdIyN0Q9YyZFNfzVD4e8
         lAD72yF8D7kuCvT3Ov1hNk+0XErX2thdiSxLm5NvDgXmhbyX8J3aPbBkuxt/CAaUEdo9
         99Hq8HPrVgeFq8vZOhvx1Faupon2n7XY7Xxkjo82AAW7lzph3IyXsIC5ytwKVZIxK+E6
         1DeQ==
X-Gm-Message-State: ACgBeo3QhH9MiJWlXSjPgBodPXUX0z8SBSkHXOcxw617tM+1fra6H4Uv
        t9JGF3dwZV6PH5CUyjxTW575Sg==
X-Google-Smtp-Source: AA6agR4YkjdmTN55cEBvfhAJnG9I3czjJ3mbl7ljMQEjMtU+b+F0fiGAXZCvP+hpnO3J1jwpGqqW5g==
X-Received: by 2002:a05:6512:23a9:b0:498:fc07:4ee6 with SMTP id c41-20020a05651223a900b00498fc074ee6mr523209lfv.344.1662718961127;
        Fri, 09 Sep 2022 03:22:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w23-20020ac24437000000b004947555dbc2sm27241lfl.100.2022.09.09.03.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 03:22:40 -0700 (PDT)
Message-ID: <013f2dd7-c15f-5b0e-c98a-595dd4d5a2c5@linaro.org>
Date:   Fri, 9 Sep 2022 13:22:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the
 driver
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/07/2022 13:03, Dmitry Baryshkov wrote:
> This patch series depends on patches 1-5 from [1].
> 
> Path 1 is slightly fixed version of patch 6 from the mentioned
> patch series (fixed to use parent_hws where applicable). The rest is
> minor cleanup of the driver.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/
> 

Gracious ping. Yassing, Bjorn, Konrad?

> 
> Dmitry Baryshkov (5):
>    clk: qcom: cpu-8996: switch to devm_clk_notifier_register
>    clk: qcom: cpu-8996: declare ACD clocks
>    clk: qcom: cpu-8996: move ACD logic to
>      clk_cpu_8996_pmux_determine_rate
>    clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
>    clk: qcom: cpu-8996: use constant mask for pmux
> 
> Yassine Oudjana (1):
>    clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
> 
>   drivers/clk/qcom/clk-cpu-8996.c | 191 +++++++++++++++++---------------
>   1 file changed, 100 insertions(+), 91 deletions(-)
> 
> 
> base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
> prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
> prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
> prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
> prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
> prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9

-- 
With best wishes
Dmitry

