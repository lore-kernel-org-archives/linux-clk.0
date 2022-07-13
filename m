Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B495ECCA47C
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 21:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237396AbiGMVcw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 17:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237557AbiGMVcr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 17:32:47 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FB5252AA
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 14:32:46 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso6854583otv.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KMcZaOI1pkMPzYIua3VuB4fL4UqUR3gQmB+xGyPu7QM=;
        b=EgJHs96mxk4tNDPUW3eCN/fvFCRBhPOzRXy6DAY0v+0GdsJseQ8CgMTxM7fCZYt73w
         BOI38G2Dn+JUoNK8C+UshRHgMS09ajx3F+gCN1kLJCot8clpn+7B/D9mKFFHeWj6gVyf
         vkJRPIcEZUfVDWBuZzRIHyd0neo6xM5XFYBXPn7slT7yXMyZJp1RaslAeoY+/Hp1/5JO
         Z5nI9TSKNxnzpo4+3oxuSUFfQsJZYgly2IUp9sPm1a6tDJZqG8oGp4KzOVrdDbIx09TQ
         TeiSBJ4ZsB10pY41WmA+t0accVkpA3iPhTZ4vSka+f2Q6MppAyjc1JQffSUY9TEW/ty5
         AVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KMcZaOI1pkMPzYIua3VuB4fL4UqUR3gQmB+xGyPu7QM=;
        b=Lg4bH6m0WnwTeME2o1h2Gr1u+S0EKaJosnR7hEbhHOrDLavAIbcvB0hlAjFuq3GGha
         p/GkbbJwTH3+eP9N0jVTtMcsqywoaIyze1qgEd8qjIP0UwvsL+g08D6dzPo7hFuFqJPj
         hRa+68QlTLAqB5aHcsczWu2P1501APzjS95F4//7RlzLbtPSPL2CugESK9+auIAsBxJR
         /7LN9KL+6OqdqtjnZOCOsGsUgW9GnFK94kSTOX+DU89Y0HFHjjAiBukXjWIsRRjat7Fs
         1VkbWM7YIMBCfMFPS9VR7kUOcljq0JQsQ6UUtMSvdJrsEhtWhuf3BebOJaC0zZgnBtQi
         OthA==
X-Gm-Message-State: AJIora8h94LW7yQBINXZ/+Tib3/t+GI8VuGQSDI0ZNpZk5ficT8QSdfE
        UUPTdbzy5sU4Y+wWwJPNGObQITny0RkU9w==
X-Google-Smtp-Source: AGRyM1tdI/BVkfAWRhAGpOWIOiePCL5uX9PVHFsgBKsefi693i/n4CRhg9lEq6x/dmREF/ZscHgi1w==
X-Received: by 2002:a9d:19c9:0:b0:618:ce28:bcf7 with SMTP id k67-20020a9d19c9000000b00618ce28bcf7mr2108300otk.285.1657747965648;
        Wed, 13 Jul 2022 14:32:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v37-20020a05687070a500b000f342119f41sm6559223oae.42.2022.07.13.14.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:32:45 -0700 (PDT)
Date:   Wed, 13 Jul 2022 16:32:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: qcom: msm8996-cpu: Cleanup and migrate to
 parent_data
Message-ID: <Ys85+7rYjQOSPvD/@builder.lan>
References: <20220621160621.24415-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621160621.24415-1-y.oudjana@protonmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 21 Jun 11:06 CDT 2022, Yassine Oudjana wrote:

> This series includes some cleanup of the MSM8996 CPU clock driver, as well as
> migration from parent_names to parent_data for all of its clocks. The DT schema
> is also fixed in this series to show the actual clocks consumed by the clock
> controller and pass checks.

This series looks almost ready to be merged, could you (or Dmitry?)
update the two outstanding items?

Thanks,
Bjorn

> 
> Yassine Oudjana (6):
>   clk: qcom: msm8996-cpu: Rename DIV_2_INDEX to SMUX_INDEX
>   clk: qcom: msm8996-cpu: Statically define PLL dividers
>   clk: qcom: msm8996-cpu: Unify cluster order
>   clk: qcom: msm8996-cpu: Convert secondary muxes to clk_regmap_mux
>   dt-bindings: clock: qcom,msm8996-apcc: Fix clocks
>   clk: qcom: msm8996-cpu: Use parent_data for all clocks
> 
>  .../bindings/clock/qcom,msm8996-apcc.yaml     |  15 +-
>  drivers/clk/qcom/clk-cpu-8996.c               | 235 ++++++++++--------
>  2 files changed, 140 insertions(+), 110 deletions(-)
> 
> -- 
> 2.36.1
> 
