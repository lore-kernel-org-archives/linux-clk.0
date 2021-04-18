Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B8FC433ED
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 14:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B5B66109F
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 14:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhDRO6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Apr 2021 10:58:35 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:45703 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231445AbhDRO6f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Apr 2021 10:58:35 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id Y8r3lCRdYpK9wY8rCla5WO; Sun, 18 Apr 2021 16:57:07 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618757827; bh=hqdToKdXep6rD2t3+5/OUkGokVRGwUGIXwri9qp4guU=;
        h=From;
        b=ukfclx4Q9bNZDUDnC3HXht2MhymDv+SwelR8fG7E8Stxx90JmOUHnfFCJeiaFzfN9
         Vmggve3e23Cm+XS+YDq3fYL/LEfK6Day+puWKP/3GVBWN7Ey1nVsKSpqQLDNGq2oZd
         dR2cMXEXw/oJsCBYeMUh4iWutMBT+QZLt87FujpGWSunLZdd1Lafusv0Erg27UWUUO
         pRM7OgJu/s6a2WQ6A+bpi4GdDJx8lxp0ZSPz89ZKfmhpm8NnAhCNNxi+Aq+K9SHB7Z
         g+KR90AQ/WQyry6A53vq14suI61wu5vJwrtgxYOXMB5t/yjqKSV5jWXSADMq4y3DAO
         4kNH91i0IPO6g==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=607c48c3 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17 a=VwQbUJbxAAAA:8
 a=IXkOJODCewQtKEFu2i4A:9 a=5yUOnwQy5QICz8m5uxDm:22 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v5 2/5] dt-bindings: ti: dpll: add spread spectrum support
Date:   Sun, 18 Apr 2021 16:56:52 +0200
Message-Id: <20210418145655.10415-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210418145655.10415-1-dariobin@libero.it>
References: <20210418145655.10415-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfCc/eL8KPvanqo4c66nGxCaSMb1fJqL16U04ooYl6EE9xkSXXnlxZfVZvE851n15GRrslKkdwQxT/KAJIJ5A5eSXtuFYeaCZmh95jJI3rnOcaP9AYvZY
 Dir4KfjFzv+JjLWeWywRs8V3a5ZH813DKQJhFOTieyD192vLD0HVEWYPAsWv6q80kJbloDrNiMivVtEhO7UdCtxqDYhImbnevu/lKW7NCbo9FWO2IGWCI9lh
 9vc6ED47bCvoO7qHmlTn5M8FoXUJYnq+xd8eIA73n6OGk5uxcUSa6TrSpX7MwNsM4LvMDSyE1gAYzbOfLiG2/EjPiVmOCsAR10Hr/TE/wqAG/b4Mai7XH4DB
 ll2O7xbiSPLHq9ezI+GulaEqrmzB9lmynAhG5fE0RjOfLSHhYPAVcsBDtNJiousWi/PAjm5roFDwUltxTUE8OG8CBH6iitlmiJoXa6SFAZW997aS7uW/TkGp
 EmkG6CYaqGjQxWmUIfaFdlboKPNpOnl9wnaGWw==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DT bindings for enabling and adjusting spread spectrum clocking have
been added.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Reviewed-by: Rob Herring <robh@kernel.org>

---

(no changes since v4)

Changes in v4:
- Add Rob Herring review tag.

Changes in v3:
- Add '-hz' suffix to "ti,ssc-modfreq" binding.

 .../devicetree/bindings/clock/ti/dpll.txt     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index df57009ff8e7..37a7cb6ad07d 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -42,6 +42,11 @@ Required properties:
 	"idlest" - contains the idle status register base address
 	"mult-div1" - contains the multiplier / divider register base address
 	"autoidle" - contains the autoidle register base address (optional)
+	"ssc-deltam" - DPLL supports spread spectrum clocking (SSC), contains
+		       the frequency spreading register base address (optional)
+	"ssc-modfreq" - DPLL supports spread spectrum clocking (SSC), contains
+		        the modulation frequency register base address
+			(optional)
   ti,am3-* dpll types do not have autoidle register
   ti,omap2-* dpll type does not support idlest / autoidle registers
 
@@ -51,6 +56,14 @@ Optional properties:
 	- ti,low-power-stop : DPLL supports low power stop mode, gating output
 	- ti,low-power-bypass : DPLL output matches rate of parent bypass clock
 	- ti,lock : DPLL locks in programmed rate
+	- ti,min-div : the minimum divisor to start from to round the DPLL
+		       target rate
+	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
+			  spreading in permille (10th of a percent)
+	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
+			      spectrum modulation frequency
+	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
+			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
@@ -83,3 +96,10 @@ Examples:
 		clocks = <&sys_ck>, <&sys_ck>;
 		reg = <0x0500>, <0x0540>;
 	};
+
+	dpll_disp_ck: dpll_disp_ck {
+		#clock-cells = <0>;
+		compatible = "ti,am3-dpll-no-gate-clock";
+		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
+		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
+	};
-- 
2.17.1

