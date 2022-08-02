Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607D4C19F2D
	for <linux-clk@archiver.kernel.org>; Tue,  2 Aug 2022 07:02:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbiHBHCr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Aug 2022 03:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233542AbiHBHCq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Aug 2022 03:02:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCA21EAE9
        for <linux-clk@vger.kernel.org>; Tue,  2 Aug 2022 00:02:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x39so11065554lfu.7
        for <linux-clk@vger.kernel.org>; Tue, 02 Aug 2022 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/ySHTyzeX/H7MclcVdbanxVutrzYknZPMky5Ufc/cco=;
        b=ILkBFGqDuBCm81NrzjcIfk8v3fifksnPm3jgAYKIm1BAm3lRuNREbalAI0fcXnz7IF
         JrlZx82CDX0uqldmBtxSkHAwRsYgW/DoTJ/9BnUGVTwk73vx/GRAjghPbY6AEzGREj79
         pPIip6BBlJqM7gCDwLMRFLhCfHfXauIlXdJPxY2PCV0z9Zl7M74xX4hH8FFsT5d/GTS7
         2fkW1xVwAX6Da7nQgCrqpe1Kp1UGxmIb417ZoswTZ2HUNFKYLNARs8l3WNnR6TdiOMfo
         G2UhGeT2lPVHtLKb0qRt3SLBhgiVVcQhbu2mu/2+M5KSR5xECr+ASZdEJnmTtlWyhaS3
         wqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/ySHTyzeX/H7MclcVdbanxVutrzYknZPMky5Ufc/cco=;
        b=IYoXJJ0OFwGvhBFjuutlczawkBztmbX781geSSXdmzeB17P2ZAQfIiTB8K7VmqWsy7
         9ZWQY7uL0bWpinPCG3dsGiexNpBr6P2QwtxlluQ/QwOeymjzdc1HR2XjJI40YXaraHI1
         JnDuKIPpjxdiRS3lFiujxXEDDBOdrAhSi6P/y9nOegzLgc9AUTKVHylsbvGRCQsEw67F
         28kraRs+kqjScuTVDRPSATGrHvgaRP+TFhpZJWeZWLjsX5Id3jDZLo0SJ93hnm2BwiII
         jX37QbM86LDCBsCmLB0PdvVYyZ02AILfEeh/fQ5WaJNpumbeDLueMjMUlfmooQCSP0mS
         WRiw==
X-Gm-Message-State: ACgBeo3IunvfAhcq6gwRqD9m7ky7z92fNQqDJ3bViEOLtYtJV4MCt8j3
        wBp0eQEILj1QygSDJP/N744RvQ==
X-Google-Smtp-Source: AA6agR4N7si8u20TMih2xTB+Z2+BSt/eBM4OC4TX8ZhEGP1kPVnVDh9g8o9nA0BSsYDSlm57b6YqfQ==
X-Received: by 2002:a05:6512:3d8f:b0:48b:12f3:c9c7 with SMTP id k15-20020a0565123d8f00b0048b12f3c9c7mr161931lfv.23.1659423762780;
        Tue, 02 Aug 2022 00:02:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i17-20020a056512341100b0048a7fa5bff1sm1085463lfr.248.2022.08.02.00.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:02:42 -0700 (PDT)
Message-ID: <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
Date:   Tue, 2 Aug 2022 10:02:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
Content-Language: en-GB
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/07/2022 12:17, Akhil P Oommen wrote:
> 
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal.

If this is votable, do we have any guarantee that the gdsc will collapse 
at all? How can we proceed if it did not collapse?

> To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.

Trigger the polling made me think initially that we will actually 
trigger something in the HW. Instead the client uses reset framework to 
poll for the gdsc to be reset.

> 
> This series is rebased on top of linus's master branch.
> 
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
> 
> 
> Akhil P Oommen (5):
>    dt-bindings: clk: qcom: Support gpu cx gdsc reset
>    clk: qcom: Allow custom reset ops
>    clk: qcom: gpucc-sc7280: Add cx collapse reset support
>    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>    arm64: dts: qcom: sc7280: Add Reset support for gpu
> 
>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>   drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>   drivers/clk/qcom/gdsc.h                       |  7 +++++++
>   drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>   drivers/clk/qcom/reset.c                      |  6 ++++++
>   drivers/clk/qcom/reset.h                      |  2 ++
>   include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>   7 files changed, 46 insertions(+), 4 deletions(-)
> 


-- 
With best wishes
Dmitry
