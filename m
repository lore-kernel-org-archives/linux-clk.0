Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160C3C43381
	for <linux-clk@archiver.kernel.org>; Sun, 14 Mar 2021 15:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFF7B64EE2
	for <linux-clk@archiver.kernel.org>; Sun, 14 Mar 2021 15:21:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCNPVb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:21:31 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:32989 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231329AbhCNPVB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Mar 2021 11:21:01 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id LSPzlDn2etpGHLSQ6lAQ8X; Sun, 14 Mar 2021 16:12:42 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1615734763; bh=bPt3Xo7JUBwWpbYRr+p2dw+OmrF+kpNURiohZr3XXj0=;
        h=From;
        b=D11kqISY/mpVZGkU3tE0cHvKaxFHypT8+V9EVFdl3DPbHOBac6gtnntpdPVuo6Z0X
         EAHd7ngttB82CLXheS3YLF7W3BGU9fhAtNK4uQI95qoNVexgac29PF5f+F444B4+vt
         xrfSRVxX6Payq6m34cbqq/EV2eWulsp6LQC6gfKURif505aC4AVcV6xLCzXFg3ymlO
         oLm011decIlLhtYL2YLngH8pk2IN9atm3ElFAc3wEP9jjamY38CsA9NEsld6GaBUpm
         cbK7otZpvnvEp7hZ2ZQWMWR/0SgqhNJ1izVh1UHrLDaOoxvEic0U1qNwHQQ/VCdYx9
         aNz103bOE58Tg==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=604e27eb cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=gUdohDFUAsczsVxzKVAA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: ti: dpll: add spread spectrum support
Date:   Sun, 14 Mar 2021 16:12:31 +0100
Message-Id: <20210314151233.23243-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314151233.23243-1-dariobin@libero.it>
References: <20210314151233.23243-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfDCcah2L8AiZCR5ZNO4FJMg4iLk9zRZZUojTuqIoj2FZ6RtybJAp3t7FPpY9nlLSe0KSZhldj17oQtRdGxJ6QMFSxI68/CtX0wWkyugPmaxEmuyrSxCK
 3ycIPrgQBC4i/FV9M8O1q2i50lsk9tbh4Q4JVn+tWGzn7JnqEqiC3odweimA9BzDAhSDzLFOis0b7dgOaUkBspI37obPqPhoZOLg1ir7ZjLLVBoGtrPnaHZb
 CED/F/seORDr1wvC3S8N+S7zKAYanu8xZ6+snFEo3wNtNrZM8MYBbJjT+kCJ4RIW6PqxYgEonNt/3HRWViEa2L4zCRcunPgJqorZ2YbX10l8lNkRduqUzLHq
 JgNsH0APdOVtTFBxZ3T1EsYxs/PXptW4s0RhomgAxX+Ucb7JexAjDlBho+rtYt4YMUe9bj6QxhQb5Mvv6wePEQ47uJPG5Q==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DT bindings for enabling and adjusting spread spectrum clocking have
been added.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 .../devicetree/bindings/clock/ti/dpll.txt     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index df57009ff8e7..0810ae073294 100644
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
+	- ti,ssc-modfreq : DPLL supports spread spectrum clocking, spread
+			   spectrum modulation frequency in kHz
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

