Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE17EB64D9
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 12:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244116AbjFNMRo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 08:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243985AbjFNMRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 08:17:43 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB58C1BF9
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 05:17:41 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-bd729434fa0so615965276.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686745061; x=1689337061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bwFHPYhlT3RfthlTjpPS85ddabPhpew1qG/qUrIvT/E=;
        b=ZE7z0PBOhTN7OCLEZIYRfVxCFCP7jG7T5T8l+rJ9PWQ9FnIaqiMIQYrUHb0OS7jD5B
         XOOz90b2gjuTDdRo5Nuxv3QNpBX19NxZAlEKkee6NhTOj3+owBXQLBKDQuKePHVIqHWH
         Zr5cIMCeDt3B8/1TsIrIj6TJYAGcoJGmKXOCWdf1Cvx6830cJiJxOS3SzH1ydfcLAXWw
         lrI7XOfbmOhRloHyBDgHy+iyWFCJeCZ1WmUG3UII6zFBjFJsthXvv+TGBjQ2Qr4fpV39
         D05laDWul/NKId+FKRUgIrvvzMzs+qb1vAal5rERfMpdfxTnfpBS4rOlN5x1D5BbaMCv
         dhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745061; x=1689337061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwFHPYhlT3RfthlTjpPS85ddabPhpew1qG/qUrIvT/E=;
        b=U376/oU4rep8HiEHKwj+24Ka36BP8gCfEEaDd/aRNqBprVl93JarE3IJKlsDpC82QC
         Mwyra/s4w+PpkoMCVtP7Vvy7bX144jaTpcE0nuHbEzOkqtpyYT4EZvTFNTA/TQSCBmus
         RH+r1BFLVhT9ANDOkFEe7Y/Z/2bW2R28sXkH8YuCp1QHemqkAVMD+fImYoG3ehJ+D7Y8
         TScktT5fH15WO6nONDXS6yTrZp5b3sRPcQr5IeIVQGl5TaZKRGkpbLEkgGpI9di8wVkB
         ItA8vDbFsrT0yxp3XhBaUlFSZvwU4RkLLQpiJTzIXvFboRDQJirnYbLzBxluA7h/GGmh
         vVTw==
X-Gm-Message-State: AC+VfDz6uJRZu8vV0WRN7IC+/zU0ngYAPiDrWJK4DhfYFDcSa/X/f4Cl
        yxFAcmEcm7fnsGBgDgjEtYnU7G2LM4ZwTDtSPCn72Q==
X-Google-Smtp-Source: ACHHUZ7BbfR2gwme9IAt2E/2MfRJmNQkjtnOv8ERZreRKQ3CY+OoH6bRLuIYMYRdkWELrelaMW6I2ZCXGS5utx7/bSk=
X-Received: by 2002:a25:44c3:0:b0:bad:bb0:4d37 with SMTP id
 r186-20020a2544c3000000b00bad0bb04d37mr1968881yba.31.1686745060842; Wed, 14
 Jun 2023 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230609115058.9059-1-quic_jkona@quicinc.com> <88b41c0f-e515-ce94-e4fd-befbeef53781@linaro.org>
 <65fd51f1-56d9-7b7b-7757-229cbb65051d@quicinc.com>
In-Reply-To: <65fd51f1-56d9-7b7b-7757-229cbb65051d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 14 Jun 2023 15:17:30 +0300
Message-ID: <CAA8EJpoLWm4=1J2QTfh9N55U-FjuYA7CwJeoG=Zv4mOhC1nytQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/4] Add camera clock controller support for SM8550
To:     Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 14 Jun 2023 at 14:58, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
>
>
> On 6/9/2023 6:24 PM, Konrad Dybcio wrote:
> >
> >
> > On 9.06.2023 13:50, Jagadeesh Kona wrote:
> >> Add bindings, driver and devicetree node for camera clock controller on
> >> SM8550.
> >>
> >> Jagadeesh Kona (4):
> >>    dt-bindings: clock: qcom: Add SM8550 camera clock controller
> >>    clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
> >>    clk: qcom: camcc-sm8550: Add support for qdss, sleep and xo clocks
> >>    arm64: dts: qcom: sm8550: Add camera clock controller
> > What's the final verdict on RINGOSC_L etc.?
> >
> > Konrad
>
> We would like to pass RINGOSC_CAL_L field directly in config->l value
> itself and reuse existing code rather than adding a separate function
> for lucid ole pll configure.

As I wrote in another email, it doesn't sound like a good approach.

>
> Thanks,
> Jagadeesh
>
> >>
> >>   .../bindings/clock/qcom,sm8450-camcc.yaml     |    8 +-
> >>   arch/arm64/boot/dts/qcom/sm8550.dtsi          |   15 +
> >>   drivers/clk/qcom/Kconfig                      |    7 +
> >>   drivers/clk/qcom/Makefile                     |    1 +
> >>   drivers/clk/qcom/camcc-sm8550.c               | 3585 +++++++++++++++++
> >>   include/dt-bindings/clock/qcom,sm8550-camcc.h |  187 +
> >>   6 files changed, 3801 insertions(+), 2 deletions(-)
> >>   create mode 100644 drivers/clk/qcom/camcc-sm8550.c
> >>   create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h
> >>



-- 
With best wishes
Dmitry
