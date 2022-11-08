Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DECC43217
	for <linux-clk@archiver.kernel.org>; Tue,  8 Nov 2022 16:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233727AbiKHQ4g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Nov 2022 11:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbiKHQ4f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Nov 2022 11:56:35 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7995986B
        for <linux-clk@vger.kernel.org>; Tue,  8 Nov 2022 08:56:33 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k19so22033177lji.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Nov 2022 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC7+VolI2Xokgb3dmDEH4B60P4b9V47rxRyDrGnv7BY=;
        b=Kvh1XU2ygifF8pd1pPYP3ss9QpfF5Pm4e3f1LTjwSDi8McME5MKp5XYnCoKryE5a4L
         LI10oVlOhIkZ5ZAlQa2vWVShH3If5lawcb1l+4YhnVKgTA8vjrdjmExReZS+4dU0xdrY
         29F0K2HTD4i/7U61F2duHKuWHCoVGdoF68T+gklopltu9ERau/FjUceOuEcWiUimBMBj
         vvmcoHNOFd3UBBwUwcbNoA5QloXV3ObbT+WHvHiCmxSSkkTvbkiJ6ttu+amvAHPp960H
         NXVtEsSN9z31KIxQVXmJEMh0L2RgPcpFPHoR+ATjYNAwpRnlKkvEaEtJSTPy88dkPVwC
         dXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hC7+VolI2Xokgb3dmDEH4B60P4b9V47rxRyDrGnv7BY=;
        b=4iOHMxAYcd/PN57yE8tq5x/4t8qec+tSH4/dyJBbH6RHcvOdWE/SCYLr/rSTrsFcTt
         +S6bmAIGs2fc0KAfN6rWG/COIIo/G+jwAO7Ma4Ey8EPQWlxsFZ7JNuJFQSyrtjeorApA
         Xi3NGiWoxAWwiwnATtNCbTZmNqprfoUJbUMxj+nnBLRA/q8kusWG6rguHuLwjcaPQvud
         sJBezcooL6vK1SdhCy90d/aiizqsLmghJkg69RU1uQPocQgHWH6Aiisix1GkdgAbldoV
         1ILaj0Ofgre2NpHnfV/j3PFi5uhi35xv/JcO6n2mcI6r5ajQQuL4+R64ERw1D0ZJmNGe
         U69w==
X-Gm-Message-State: ACrzQf02X1xSvMXk+LIiJuDLvQUBbMolkwEnJcZo0yUOzguAWbFNDDVJ
        sYbmHoZt8QCMdZ3CDtaQuJyBDg==
X-Google-Smtp-Source: AMsMyM4XfQkuOM+aro7Fw77Bc9UCPCloL04gi1Xnx+NAhUmjFjVBoBMf3JHPikC/1fibOF/L2SZuWQ==
X-Received: by 2002:a2e:a910:0:b0:26a:ed13:cda6 with SMTP id j16-20020a2ea910000000b0026aed13cda6mr18721501ljq.250.1667926591517;
        Tue, 08 Nov 2022 08:56:31 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id u3-20020a05651220c300b0049e9122bd1bsm1841693lfr.164.2022.11.08.08.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:56:30 -0800 (PST)
Message-ID: <34f22ebb-2b9c-080f-697d-b37cd6deeed0@linaro.org>
Date:   Tue, 8 Nov 2022 17:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SC8280XP display clock controller
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926203800.16771-1-quic_bjorande@quicinc.com>
 <20220926203800.16771-3-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20220926203800.16771-3-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 26/09/2022 22:38, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The Qualcomm SC8280XP platform has two display clock controller
> instances, add support for these. Duplication between the two
> implementations is reduced by reusing any constant data between the two
> sets of clock data.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Just a couple of bits:

- Use lowercase hex in constants
- I'm not sure I like hacking clocks up with magic writes.. this
driver can and will be compiled as a module by default and that
prevents a de-facto clean removal.

Other than that:
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
