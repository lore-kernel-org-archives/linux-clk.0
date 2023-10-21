Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3593C004C0
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 15:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjJUPy6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 11:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjJUPy5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 11:54:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA32135;
        Sat, 21 Oct 2023 08:54:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B1DC433C9;
        Sat, 21 Oct 2023 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697903695;
        bh=rcEYEWKYNxS47UPMQRuxqJFK+sR94sFCOFCn6b91mRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q8Qix3ePnoIddfIR+8Vsx5eXpvPP7imE26F4bbMGGMV+NPQ1ce39Ms1kETMNQG5l6
         pltvWjCIP2o2XTQenuNolhunYhQD+DQ/l0ON/9wj1IG5GzFNKvm1nASzOIplCp1WUS
         6RD5GCPfM93+OGWXkvZG2jL9ybyUSSfyA/DMVGWXtqY5+vveSVnTwBAczCw+vhTo7I
         5n1DbORKNViG2sI7cwcpHBfW9T2u09Rpa3Xhs0+TETQtEE5YUXNzD0f7lQsTzoMXd2
         +7Fn1pgcRmbpzyK7EzSCr8/H3v5Drnfp1z8VBL0zDFWn4OAbw6NZ78MDAdHk8RARxu
         t+ybrdPE0yBTQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
Date:   Sat, 21 Oct 2023 08:58:31 -0700
Message-ID: <169790390709.1690547.3509014745837126552.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
References: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 16 Oct 2023 11:43:55 +0300, Dmitry Baryshkov wrote:
> Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
> alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
> function to configure the PLL.
> 
> 

Applied, thanks!

[1/2] clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
      commit: 21134ec8af94981b3127a691df2d73540ba4d8aa
[2/2] clk: qcom: videocc-sm8550: switch to clk_lucid_ole_pll_configure
      commit: a2620539ae2529916a98585c6d7311c48fb67e9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
