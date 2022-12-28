Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92E1C3DA7D
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 15:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbiL1PHS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 10:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbiL1PHQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 10:07:16 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038F413D79
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 07:07:16 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id w37so10718852pga.5
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 07:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KgQT/alxlLYW0WFupTnnqaIko3uIyucGCDE9ru/lFUk=;
        b=u+i9ifEFN8xTXhij5j2STaK7a8nJTPFtyzhvF1AfWoOJ9S0Q9Ti2Qhqs9a6QTBaXaK
         j8qSX9KwDLTx1kZ+9Gpg7pbuUX44/1FBE3nsBTM93qUqDfGqkl651Rqf05uuBT0IfLQd
         7VuNzwxzY2XKTnCly5ayNyNHE/U91Rg+5vwMREYwRQ1s5EK3y4wcQ7I0pvAekQWPFMaq
         Wt9ckX2CutbfeQgmR74awci4X/2ONaUjdWmzIkTP7DX8cGxey59LmLz8tn011DnCxqNV
         yWxbgXsuikRgwDdabdpVXGIbeqheWkmhvMCpymYNkqXWQYOTaIS8SMVqgslipJ9Tgwsh
         p4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgQT/alxlLYW0WFupTnnqaIko3uIyucGCDE9ru/lFUk=;
        b=Wdu/k2/CSaNFLCB8ccmeXCpcN8Vohf3L8pKW6NZEwHWTJDpf/BSwmL7JwRs1axGQVH
         0SMpU860f3nH94owAq0HqpCwd0vtOZT+BV7dwE/vsS+XUZTEM5WcdWieAhrLVxhflP5H
         U3SXQbd5JfyiR0cGi+FgyI8VWg7MTDs+EQHmWYmoKODFifXAfP/CEmDqdchhkyhyZ0QU
         PYsuOvroTv37m+tIS5nYReljA3C4YRW2MYTIfXQrIdBkpzz/owKx3cfyT/Aw3AQizlDB
         f6e8L+/J25rVP+T8JZ9iPTALpDETBavf09MzgX3PNVJCA0U3Q9LWVnvSxS1NVciv1ekS
         uxXw==
X-Gm-Message-State: AFqh2kqik99R89twmiNLfS1s3Bm6YcDkiyEiQ62v/N479AbQWcggVjVL
        JtNHao+SV6S6gDwAJePXd29p
X-Google-Smtp-Source: AMrXdXtBESYjT/Prx4f+YrYEUwbmivOJ0hGM8ZWl3dM7aTOi6spZlddrNBZSu8CHzCESycLIaORBJA==
X-Received: by 2002:a62:19cd:0:b0:580:9935:ffdb with SMTP id 196-20020a6219cd000000b005809935ffdbmr14481895pfz.20.1672240035482;
        Wed, 28 Dec 2022 07:07:15 -0800 (PST)
Received: from thinkpad ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id c134-20020a624e8c000000b00572198393c2sm10380770pfb.194.2022.12.28.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:07:13 -0800 (PST)
Date:   Wed, 28 Dec 2022 20:37:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 00/16] clk: qcom: get rid of core_bi_pll_test_se
Message-ID: <20221228150706.GD30143@thinkpad>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 28, 2022 at 03:32:27PM +0200, Dmitry Baryshkov wrote:
> Drop core_bi_pll_test_se from all Qualcomm clock controller's bindings
> and drivers. The clock is not used by anyone.
> 

For the series,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks for the nice cleanup!

-Mani

> Dmitry Baryshkov (16):
>   dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,mmcc-msm8998: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom: gcc-sm8350: drop test clock
>   dt-bindings: clock: qcom: gcc-sm8450: drop test clock
>   clk: qcom: dispcc-qcm2290: get rid of test clock
>   clk: qcom: gcc-msm8998: get rid of test clock
>   clk: qcom: gcc-sc7180: get rid of test clock
>   clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
>   clk: qcom: gcc-sdx55: get rid of test clock
>   clk: qcom: gcc-sm8150: get rid of test clock
>   clk: qcom: gcc-sm8350: get rid of test clock
>   clk: qcom: mmcc-msm8998: get rid of test clock
>   arm64: dts: qcom: msm8998: get rid of test clock
> 
>  .../bindings/clock/qcom,gcc-msm8998.yaml      |  4 --
>  .../bindings/clock/qcom,gcc-sdx55.yaml        |  9 +--
>  .../bindings/clock/qcom,gcc-sdx65.yaml        |  8 +--
>  .../bindings/clock/qcom,gcc-sm8350.yaml       |  2 -
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  |  2 -
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         |  4 +-
>  drivers/clk/qcom/dispcc-qcm2290.c             |  6 --
>  drivers/clk/qcom/gcc-msm8998.c                | 13 ----
>  drivers/clk/qcom/gcc-sc7180.c                 | 16 -----
>  drivers/clk/qcom/gcc-sdx55.c                  | 64 ++++++++-----------
>  drivers/clk/qcom/gcc-sm8150.c                 | 17 -----
>  drivers/clk/qcom/gcc-sm8350.c                 | 15 -----
>  drivers/clk/qcom/mmcc-msm8998.c               | 25 --------
>  include/dt-bindings/clock/qcom,gcc-sm8350.h   |  1 -
>  include/dt-bindings/clock/qcom,gcc-sm8450.h   |  1 -
>  15 files changed, 32 insertions(+), 155 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
