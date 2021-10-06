Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B59C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 11:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08DE161056
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 11:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbhJFLof (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 07:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238339AbhJFLoc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 07:44:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3162C061755
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 04:42:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n8so9082517lfk.6
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8B8LgJqjXvPVN+8wmzLYmPH7BuhH8dFjk677P8yjNhU=;
        b=eVqiiFT5cCAsA+y2800EvVS6q/KgWIVvXr+fmYCCeivoYtPO77RPBze9rin8lhEfE5
         3DaA/xGWEF+9W8AIRSdZ3/YT204dCyIOpS83R1NWnQsI349pkm2s6rpXRy27h2bsngwJ
         8OImeTnH9hVSlFLFNrVTjhilNR+/mfc8FGT3ohUxU2qM2GBp48raOMoyzelfp/hEk6Q1
         giwyvM2H7GvpFXYGgsdXbOQ7J5P1/ffokqQ5m0v58aTVxH+GCLaIIiCB+nbYZ/79Ubc2
         hoS+55R71fP9fRQ0hIanaOlqNhYnbWyiX2ZyZTmYtxtIf/2yjoTe+2vyAeRSdry0uxq8
         q8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8B8LgJqjXvPVN+8wmzLYmPH7BuhH8dFjk677P8yjNhU=;
        b=GnM+2KyOXLsemL/1PtBjFSa4YNOehU0JZxZhawX76oawQHD49Y5k8+L9yD+akGcYXJ
         68nxfmciVyMCDvsLD3eyW5GsgH6puBD07wjVyeBr5jh10MIdg3BxCyQW1GoHTgSmoZgF
         h7nEz4PkUZk7j/UWP8JVt2D2BXJjIFH+J6sTcHG0qukUeYNzc42K1lQYmDCRI3cKf8Uf
         erUmQGDrS8aKP/qxCrCRteYuC4M1Pgrd0CnnFCFkEAbmLBUrvO9ksj5//rbwu2bArS5r
         abynUOi9HRdltZR1kGRekE2QCOzqhb4iwp31/bY6CI0EOCidqTqu2vHfKVUKDHJ4Hc3T
         IA3g==
X-Gm-Message-State: AOAM532vCnTY059SXYfJTP0GbKlK3QZ0KfrCltiDaukF6A+fY3Avz3nS
        q29zSH+oZanal8l8mDPRpNYLRQ==
X-Google-Smtp-Source: ABdhPJzr+T4YhM3TMRJbJl9Ib0aDzjmeV2kENMZ4j5e6xf4wbh59d0amwUPJVUCHkqM5Z6xQ21ytPw==
X-Received: by 2002:a2e:5418:: with SMTP id i24mr27806152ljb.115.1633520554670;
        Wed, 06 Oct 2021 04:42:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c5sm2243836ljd.94.2021.10.06.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 04:42:34 -0700 (PDT)
Subject: Re: [PATCH v7 0/6] clk: qcom: use power-domain for sm8250's clock
 controllers
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
Message-ID: <a152a5eb-33f8-ebf4-27c3-3be10852e1a4@linaro.org>
Date:   Wed, 6 Oct 2021 14:42:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 29/08/2021 18:47, Dmitry Baryshkov wrote:
> On SM8250 both the display and video clock controllers are powered up by
> the MMCX power domain. Handle this by linking clock controllers to the
> proper power domain, and using runtime power management to enable and
> disable the MMCX power domain.
> 
> Dependencies:
> https://lore.kernel.org/linux-pm/1628767642-4008-1-git-send-email-rnayak@codeaurora.org/
> (pending inclusion into 5.15)


Gracious ping for this patch series.

> 
> Changes since v6:
>   - Dropped dependency on Bjorn's patches
>   - Restored required-opps properties
>   - Held pm device state while gdsc is powered on, removing dependency on
>     genpd's power_on() powering the domain into required state.
> 
> Changes since v5:
>   - Dropped devm_pm_runtime_enable callback to remove extra dependency
> 
> Changes since v4:
>   - Dropped pm_runtime handling from drivers/clk/qcom/common.c Moved the
>     code into dispcc-sm8250.c and videocc-sm8250.c
> 
> Changes since v3:
>   - Wrap gdsc_enable/gdsc_disable into pm_runtime_get/put calls rather
>     than calling pm_runtime_get in gdsc_enabled and _put in gdsc_disable
>   - Squash gdsc patches together to remove possible dependencies between
>     two patches.
> 
> Changes since v2:
>   - Move pm_runtime calls from generic genpd code to the gdsc code for
>     now (as suggested by Ulf & Bjorn)
> 
> Changes since v1:
>   - Rebase on top of Bjorn's patches, removing the need for setting
>     performance state directly.
>   - Move runtime PM calls from GDSC code to generic genpd code.
>   - Always call pm_runtime_enable in the Qualcomm generic clock
>     controller code.
>   - Register GDSC power domains as subdomains of the domain powering the
>     clock controller if there is one.
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (8):
>        dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
>        dt-bindings: clock: qcom,videocc: add mmcx power domain
>        clk: qcom: dispcc-sm8250: use runtime PM for the clock controller
>        clk: qcom: videocc-sm8250: use runtime PM for the clock controller
>        clk: qcom: gdsc: enable optional power domain support
>        arm64: dts: qcom: sm8250: remove mmcx regulator
>        clk: qcom: dispcc-sm8250: stop using mmcx regulator
>        clk: qcom: videocc-sm8250: stop using mmcx regulator
> 
>   .../bindings/clock/qcom,dispcc-sm8x50.yaml         | 13 ++++++
>   .../devicetree/bindings/clock/qcom,videocc.yaml    | 13 ++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi               | 13 ++----
>   drivers/clk/qcom/dispcc-sm8250.c                   | 28 ++++++++++--
>   drivers/clk/qcom/gdsc.c                            | 51 ++++++++++++++++++++--
>   drivers/clk/qcom/gdsc.h                            |  2 +
>   drivers/clk/qcom/videocc-sm8250.c                  | 31 ++++++++++---
>   7 files changed, 130 insertions(+), 21 deletions(-)
> 
> 
> 


-- 
With best wishes
Dmitry
