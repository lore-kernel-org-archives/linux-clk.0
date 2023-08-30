Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3D0C6FA8F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Aug 2023 20:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238561AbjH3UXA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238739AbjH3UWs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Aug 2023 16:22:48 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0954C3A9C
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 13:15:07 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-34df008b0cbso551195ab.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 13:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693426418; x=1694031218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1KOegy06ogcAjmdzAViYXl4NQcN+91FD3LEAsWAkUdY=;
        b=NUTrYqrRJ58oIVjhrZrapgx71QoZY7Kql5HM+oxRxcFxqBsnPMgU3WOmgv+Nuc9Qxv
         VyJhluUzgpngBSYzYEKRG0Sq5tENHsFDZMi0OaFSvwQl/G6t0bBOYqsg5OWeDu8/SrCl
         qQus3CMAOP64iPOBr9+ncLbII4kduaAxTmlK0vnRuQ3YE2pSw6vQbi3G+hrWMWoAsnt0
         kTBWl+UexXyxHguq9fMUYf928PrqxhL+esjowDUWkJwCW6cN2RL+pOk+egSUe/b+yQF3
         ctS4NP0P2EroywrMEKYyybSPFGNWvlT8Xbp1HRnqq9W956QfcC0fUYpkzYzjSKVy+WyF
         /bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426418; x=1694031218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KOegy06ogcAjmdzAViYXl4NQcN+91FD3LEAsWAkUdY=;
        b=OKCp9+rBroKYK5sjmVrPqIdQ+JqWjHku0IOR+xbkfbhgPTzvHhzKcGxfu6xm6ERhd0
         /tmMHzFvp8zmyh+ITqHVN8yfBL9nmn+m1b5NQh/yN39gRxD+0vfIga6E1cwejgSam2ME
         1wSRNJwW8rK/8rqyjBxinUa+0tK3mIduOW9A9eBhBnGiDKsNEQTKLpE2BoORZ6BH2op/
         agA4/f/PrGu/INuaKHdSYb/0kMTWB51at8jDQJiLI+1AYHzNTKxO3T1dLQaFRQWxWkfa
         gJ/2LXQm0h/7wFZtEQ+cpigWGCfARRmYFWgtf4gtGRCByYukp3iAlY3i4LVDgFZ1xiLa
         BZqQ==
X-Gm-Message-State: AOJu0Ywqg1+9IJgbd9p3bIsvsORfrD4TK2F6W4IKURLbbDK8IHigazWI
        SPp4wDfEb57kkJ+lfEFlC0isQ3ZVsnPBfEPacNrwAJ0WaB1aVxgn
X-Google-Smtp-Source: AGHT+IG7TvoHuWNPaDhyhT+X0ymvRmY9e9DoTJccBmV6ELNz8an6E/b58h/EKFxkyXSfq0zQ3gZSQX9I0Ytk/qlKz3w=
X-Received: by 2002:a5b:41:0:b0:d7a:8e37:6d4d with SMTP id e1-20020a5b0041000000b00d7a8e376d4dmr3133168ybp.43.1693424561021;
 Wed, 30 Aug 2023 12:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230829095423.760641-1-quic_gokulsri@quicinc.com>
 <20230829095423.760641-4-quic_gokulsri@quicinc.com> <f457ee94-81d0-bd28-1432-ba2828dabb79@linaro.org>
 <efe09cb6-7b67-9307-28e7-99e238a3672b@gmail.com> <0941e2f4-6b58-a4e7-3dda-c1723f5503ac@linaro.org>
 <CAOX2RU4j57H51ceYdKk9K-2ZNO7N4MDA6BOKrP2N3DNbphQAow@mail.gmail.com> <f7a350a9-5580-c3b9-a917-69a9b16dbf41@quicinc.com>
In-Reply-To: <f7a350a9-5580-c3b9-a917-69a9b16dbf41@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 22:42:29 +0300
Message-ID: <CAA8EJpoE=oF86piKCnt-7-Nw8xa9nYg-TqSOaP1V-vb=Oxwwng@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018: enable the CPUFreq support
To:     Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc:     Robert Marko <robimarko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Aug 2023 at 21:32, Gokul Sriram P <quic_gokulsri@quicinc.com> wrote:
>
>
> >>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>>    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
> >>>>>    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> >>>>> +#include <dt-bindings/clock/qcom,apss-ipq.h>
> >>>> c is before r.
>   Sure, will update.
>
> [...]
> >>>>
> >>>>> +   cpu_opp_table: opp-table-cpu {
> >>>>> +           compatible = "operating-points-v2";
> >>>>> +           opp-shared;
> >>>>> +
> >>>>> +           opp-1008000000 {
> >>>>> +                   opp-hz = /bits/ 64 <1008000000>;
> >>>>> +                   opp-microvolt = <1100000>;
> >>>>> +                   clock-latency-ns = <200000>;
> >>>> And the rest of OPPs?
> >>> Hi Krzysztof,
> >>> IPQ5018 only supports running at 1.1GHz, but its running at 800MHz
> >>> by default from the bootloader so there is only one OPP.
> >> Isn't this contradictory? If it is running at 800 initially, then it
> >> supports running at 800...
> > I can only guess that it's not validated at 800MHz.
> As per the h/w design team, there is negligible power or thermal benefit
> by lowering to 800MHz clock.
> Hence, 800MHz opp wasn't included here.

Just my 2c. If 800 MHz is supported, it should be included. Even if
just to prevent the kernel from throwing a warning about the CPU
running at the unsupported frequency. Then one can use scheduler
tunings to prevent the CPU from going to 800 MHz state.


-- 
With best wishes
Dmitry
