Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327E5C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 20:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234340AbiBXUyo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 15:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbiBXUyn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 15:54:43 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D27A1C6EDD
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 12:54:13 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id l25-20020a9d7a99000000b005af173a2875so2216669otn.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 12:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/N1WrL28Utrh8BfXfn+pcRHI8/UBv9HnnB4a8HQcyiw=;
        b=zEWcpsx4YK1p6lsZYtNPdZ/Oe4+gXRXMusfIP437eLHzQ7CCfoDc2Lm7PcpnUvFi5R
         yNvWUDEFzEqIRAXVAOb+I24Sd2lpGQU2BC2f6I7Q8lrAT3xBBT+g+F+YWWPE2iKJXzFP
         2/uWLSJKfFyXLVwnxEFF2eUJa8oitfk7ZG+s3c0pnOxSjFNZ++6AX+tf/gvvW2ej1PGt
         /cI1ddKQSmwpwJOAThJDRL0N4bYiBoL+eIWaazIbh31FGrp1175sOC/rDLCC2Hn1D0/S
         0Hv4Eoq+1AkZdNGlSR5NxwsTEyX5t/aERagrouAr5+b0S4h88saQk1X5AJwtgirETPNS
         2M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/N1WrL28Utrh8BfXfn+pcRHI8/UBv9HnnB4a8HQcyiw=;
        b=hdf2Ir0FCw2wCWFDR8xnKeAX5L1FPtJN+K3BkWrq357KjBjKSq91QGp/lZqgEy6dmC
         rwXOK7TWqAcAhA8N/1QncwxkZrZmrF65vWWfVbcM52Gs7Z2APQN+rQGE3tzOYEaozqnL
         oBsSaF9BUeC219izcFxYnRI9PbfcEPPQ6KzovR/isauf0hiPvtJi+XRS4A3kaLLkdQjz
         9jAWfSstu9ZVEw/h5hIzrtFSPy+00N28NYvBs1yPXXKCFhAON43HU2a8U0Ox4nmfQqFH
         l9U9w9sG05Wov7qjiRLFzOY8twtCMFs0FKdiRoDTeAPOcyRNDQihUbCBhOiVrQee9zfM
         zw6g==
X-Gm-Message-State: AOAM532w26tsTYrLj0EPXKvXdRMXxW5tP+gT1R2+zWoloyT5g6CSVs4a
        Ceyh9hkFIfSteGy6l8/rnDflXw==
X-Google-Smtp-Source: ABdhPJxeAhHUZN7EK8ykF7DhK96G6gvD71eTymo8p6+778tRD/eZ3mqu8lZX3c23p1LuyQtrYnFMLQ==
X-Received: by 2002:a05:6830:4119:b0:5af:143c:76ad with SMTP id w25-20020a056830411900b005af143c76admr1649645ott.183.1645736052418;
        Thu, 24 Feb 2022 12:54:12 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:54:11 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] sdm845 and msm8996 clock updates
Date:   Thu, 24 Feb 2022 14:53:59 -0600
Message-Id: <164573604161.1471031.18366594019169463270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Feb 2022 23:15:34 +0300, Dmitry Baryshkov wrote:
> This is a dts (and bindings) counterpart for the
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=601612
> 
> sdm845.dtsi (camcc) and msm8996.dtsi (gcc) are updated to
> use DT clock bindings rather than global clock output names.
> 
> Dmitry Baryshkov (5):
>   dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
>   dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
>   arm64: dts: qcom: sdm845: add bi_tcxo to camcc
>   arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
>   arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
      commit: a0d61d02c102d93e8c8f653cbfdc3bf485d45aaf
[2/5] dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
      commit: 2564aa7544f493c64b397e02a2b477591016aa24

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
