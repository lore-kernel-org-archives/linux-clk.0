Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FAEC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 07:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242005AbiDKH1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 03:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245373AbiDKH1P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 03:27:15 -0400
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B07539BBF;
        Mon, 11 Apr 2022 00:24:52 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc29b.ng.seznam.cz (email-smtpc29b.ng.seznam.cz [10.23.18.43])
        id 595c1c430252482a58f5d01d;
        Mon, 11 Apr 2022 09:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1649661870; bh=64oxfiB9uvQHDoXhBSdhceg/2Ie894/ZdFIbJq7XdNA=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=J+c4s69JnAQS8D2Oxkaa4U2blvJm1Udod1Qb02yGHmgmKr5EH9PRy3cQQWm5U29HI
         Uirs+Y/hY3jGla8da1rITmyBimhemlaWJlWrF5DzjqE/q1qigrEaJ4RDyKEwIEGE9x
         k1LwTRDFpYAR1y/mP6HjxxujbzD9ogbBeL546itU=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay18.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 11 Apr 2022 09:24:23 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND v9 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Mon, 11 Apr 2022 09:21:52 +0200
Message-Id: <20220411072156.24451-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411072156.24451-1-michael.srba@seznam.cz>
References: <20220411072156.24451-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <c68d9e92-70bc-48cb-baca-272240e4cf81>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

Add definitions of four clocks which need to be manipulated in order to
initialize the AHB bus which exposes the SCC block in the global address
space.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 CHANGES:
 - v2: none
 - v3: none
 - v4: none
 - v5: none
 - v6: none
 - v7: use imperative in commit message
 - v8: none
 - v9: none
---
 include/dt-bindings/clock/qcom,gcc-msm8998.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 72c99e486d86..1badb4f9c58f 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -186,6 +186,10 @@
 #define UFS_UNIPRO_CORE_CLK_SRC					177
 #define GCC_MMSS_GPLL0_CLK					178
 #define HMSS_GPLL0_CLK_SRC					179
+#define GCC_IM_SLEEP						180
+#define AGGRE2_SNOC_NORTH_AXI					181
+#define SSC_XO							182
+#define SSC_CNOC_AHBS_CLK					183
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
-- 
2.35.1

