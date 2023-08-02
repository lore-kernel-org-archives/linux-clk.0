Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C33C04E69
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 17:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbjHBRoD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 13:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbjHBRnz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 13:43:55 -0400
X-Greylist: delayed 1193 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 10:43:42 PDT
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B8F2D7B;
        Wed,  2 Aug 2023 10:43:42 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 9674F1C0182;
        Wed,  2 Aug 2023 19:05:58 +0200 (CEST)
Received: from fluffy-mammal.fritz.box (dslb-092-072-013-079.092.072.pools.vodafone-ip.de [92.72.13.79])
        by srv01.abscue.de (Postfix) with ESMTPSA id 0343D1C0181;
        Wed,  2 Aug 2023 19:05:57 +0200 (CEST)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-clk@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 0/2] clk: qcom: gcc-msm8917: Enable GPLL0_SLEEP_CLK_SRC
Date:   Wed,  2 Aug 2023 19:03:15 +0200
Message-Id: <20230802170317.205112-1-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I left this clock disabled for some reason and this made GPLL0_EARLY
report a zero rate because it has this clock set as the parent clock.

This is fixed in this series by adding the clock to qcom,gcc-msm8917.h
and the clock list. The clock definition is also changed to use the
correct enable/disable operations for this type of clock.

Otto Pflüger (2):
  dt-bindings: clock: gcc-msm8917: Add definition for
    GPLL0_SLEEP_CLK_SRC
  clk: qcom: gcc-msm8917: Enable GPLL0_SLEEP_CLK_SRC

 drivers/clk/qcom/gcc-msm8917.c               | 3 ++-
 include/dt-bindings/clock/qcom,gcc-msm8917.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)


base-commit: 626c67169f9972fffcdf3bc3864de421f162ebf5
-- 
2.39.1
