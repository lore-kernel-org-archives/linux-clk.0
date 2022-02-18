Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002C8C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 10:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbiBRKMp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 05:12:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233930AbiBRKMp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 05:12:45 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E821454BCF;
        Fri, 18 Feb 2022 02:12:27 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc7b.ko.seznam.cz (email-smtpc7b.ko.seznam.cz [10.53.13.195])
        id 7bf2bda020fce9c97a5b71fe;
        Fri, 18 Feb 2022 11:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1645179138; bh=fbOE4GUwVnOhJEUysUofaLkOFZu1/QnQGiinJ0luo6o=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=CFIDMoRXuCwNtGLIfS7SlldUxpsfdT7aOPOfFtKhfLghU4igdbsE3qYzI8Gm8DpdT
         ER9gzJ+YQVsiZSdyVqxOr5GBvYBcMgKYoikVn0IaHJvQJ0CWZP/CRwhyXlql9QYEzM
         v3F4MdvgjI/HTAaHxOg/tAEgDk7RzRW/mVFWIDR0=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay21.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Fri, 18 Feb 2022 11:12:01 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Fri, 18 Feb 2022 11:09:29 +0100
Message-Id: <20220218100933.32736-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <bd1a576a-776f-4ecd-bc68-3a2233656d91>
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

