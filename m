Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02EAC31E45
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 15:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A4C320896
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 15:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732892AbfFMPJg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:09:36 -0400
Received: from ns.iliad.fr ([212.27.33.1]:59686 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732357AbfFMPJf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Jun 2019 11:09:35 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 29F3320C0F;
        Thu, 13 Jun 2019 17:09:34 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 13F6920BC5;
        Thu, 13 Jun 2019 17:09:34 +0200 (CEST)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v2] clk: qcom: msm8916: Don't build by default
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Message-ID: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
Date:   Thu, 13 Jun 2019 17:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun 13 17:09:34 2019 +0200 (CEST)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
built by default. Let's bring them back in line with the rest.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Changes from v1:
- Drop the default altogether, instead of changing it to 'default MSM_GCC_8916'
---
 drivers/clk/qcom/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..6461a1aa7325 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -21,7 +21,6 @@ if COMMON_CLK_QCOM
 
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
-	default ARCH_QCOM
 	help
 	  Support for the A53 PLL on MSM8916 devices. It provides
 	  the CPU with frequencies above 1GHz.
@@ -31,7 +30,6 @@ config QCOM_A53PLL
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
-	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on msm8916 devices. The
 	  APCS is managing the mux and divider which feeds the CPUs.
-- 
2.17.1
