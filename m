Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D9C3DA6B
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 23:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiH2Xqi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 19:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiH2Xqa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 19:46:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB4298CAA;
        Mon, 29 Aug 2022 16:46:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1BC461376;
        Mon, 29 Aug 2022 23:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BCEC433C1;
        Mon, 29 Aug 2022 23:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661816785;
        bh=QicLx3CDF/6XPlM4MfaIiP2juJWn7X3sUrsbwNCbMHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=STQoTQIVpIuNtq8kodUaer+LIrX/UPR3W1YMReBpN4ran0Qxq68vLc7mM+3SkidD5
         /JSV02oxqBbwN1C0+uD+EHwdfALPzhHSKvswdDDM6bujNRKT4WGLc0AimqDdUJYXr8
         tFL6tY5cIaLyGbzY2r41YT6FigJourFCk7SjxrSNxBmNKaaPpMmN0lx4CoBRAQmUdw
         Rr7+M9IDR50LbFkQ3ltrIChBxgtK7OC7Brfhi49w7qUalWw7WyXUCrlbeO+h+uc3aO
         8juSTg2LIUo3h1Y4O1Ehg5yQDXx0C14UK6ojBuures59VZqLxhILfyzknkneJ0dBg8
         qTCggsXctj8Gw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org,
        Bjorn Andersson <andersson@kernel.org>, robh+dt@kernel.org,
        mturquette@baylibre.com, konrad.dybcio@somainline.org,
        quic_tdas@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Mon, 29 Aug 2022 18:45:47 -0500
Message-Id: <166181675957.322065.16262746648167341214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 4 Jul 2022 20:24:46 +0300, Dmitry Baryshkov wrote:
> Update gcc-msm8916 driver and bindings to use DT-specified clocks
> rather than fetching the clocks from the global clocks list.
> 
> Changes since v3:
>  - Describe that ARRAY_SIZE conversion fixes the issue in the driver
>    (noted by Marijn),
>  - Rephrase commit message for the move of GPLL/parent tables patch
>    (suggested by Marijn),
>  - Fixed the placement of gcc_mss_q6_bimc_axi_clk clock (again, Marijn).
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: qcom: msm8916: add clocks to the GCC device node
      commit: 8373f5d50095c497305162ba8d076568862e867e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
