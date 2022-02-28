Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541B3C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 13:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbiB1NTf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 08:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiB1NTd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 08:19:33 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AFC22539;
        Mon, 28 Feb 2022 05:18:53 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc21a.ng.seznam.cz (email-smtpc21a.ng.seznam.cz [10.23.18.26])
        id 47c6f9961cc8adff466f35c8;
        Mon, 28 Feb 2022 14:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1646054301; bh=W7972r94uMya9eNzt6Na1vfiTr1xFVNtmuq7kNbu6sE=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=g9zuo8hFY2E+s1R3W2Sx+ha0+lCyzBaJMzPscC8tWbWSauSi7TVDHP6K2G0cKljue
         Hw9GCSoQS5ztDtIVNPMl4ThuVhjBCd4Qt2cWDpWCiZoo/kAItzvnXSN5Nib2SdQzft
         qsYEiR7PXsu3Nn3DO9x6xE+4V1JVUZ9DHF6eEEuE=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay10.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 28 Feb 2022 14:18:19 +0100 (CET)  
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
Subject: [PATCH v9 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Mon, 28 Feb 2022 14:14:31 +0100
Message-Id: <20220228131435.29207-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <142f1733-7f96-448d-8a35-2caac9d5b76e>
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
2.34.1

