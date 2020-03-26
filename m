Return-Path: <SRS0=aVCd=5L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133B9C2D0E8
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 11:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4E6920748
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 11:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNH21gEY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgCZL4L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Mar 2020 07:56:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41129 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbgCZL4L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Mar 2020 07:56:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id h9so7391019wrc.8
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2020 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rodsdY0zvUyRYzlEGixeF0Vd0Tks2dsjibM89BK++fE=;
        b=UNH21gEYZjfQW2108/T8kLQyY2apNwuh7tkXiELa7laew/D8wMD3xh4rTmfSEInqPr
         wGAgVfxvIk75OQNkWTgox3Jqf06nmgUlR/y+6ttCN+v5D8WLNTyC6JOObxyjhvSXOwYg
         I0cGX35Hozzyo45fKU8eXpmTds9QLjOAFNjB5YWwcjIGybxCv6ZfAqVVRVIA8eXeZZjJ
         FulR/Hz9dj2xbkPG2oSjDQU12vbuauFaCE2IJctAcKjOuG/fy0xyTvoLSXmP5DbQerhq
         ExuggdeDz3xhztxDwxeaSpDslfWyyQioNE1FZev5Jm19Bie2ks6aSxcw8cZD79qUCYPO
         Swdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rodsdY0zvUyRYzlEGixeF0Vd0Tks2dsjibM89BK++fE=;
        b=DteB9w5wRzDq/zU4Idpx6CM5Mx8Jjn7ba3anuT1aRE2WoXPE2zE97aB7bm0rbh8ukR
         Ys7ApJ2lWGasyKHwyf9PS7kud+7seps65c4OEebdNn3Ej5bZJRen4X0dEel5lSk0kvRr
         9v7rm8zXpGqPdHtgf6AA/11JzAcLxhOkWYVgmgSYEtIOuxIxCTv1CVL+SKXcgcwdlI/R
         r3+adhOXlIjKCFJ5pyUUvi+01QsodtvNdHnsaYkVl/p7guRUC4QwAlYgC+NMEFAPnUw/
         hSksJTgHPvjxwQf5FTlnX27YqsmXn2yReJjtCR5ikkh/sdCb1jNUbBKAEqczQ/tDQ3pu
         BTgA==
X-Gm-Message-State: ANhLgQ00pWdzDtJci8pboUKa99+3mkH1/iBcZujLNpz+V90yyuuh6B13
        NETF/k97BWJTL2gZToNntZqJYw==
X-Google-Smtp-Source: ADFU+vvm3+pNEq7XpARYJv//xeg4PgL1k6+T7EqHz5UuErlOKSVp+GLBtBzDLUXpPyLJDYGzgrqRnA==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr8557622wrl.278.1585223767321;
        Thu, 26 Mar 2020 04:56:07 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id o14sm3103270wmh.22.2020.03.26.04.56.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 26 Mar 2020 04:56:06 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/4] soc: qcom: Separate kryo l2 accessors from PMU driver
Date:   Thu, 26 Mar 2020 13:00:05 +0100
Message-Id: <1585224008-15730-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ilia Lin <ilialin@codeaurora.org>

The driver provides kernel level API for other drivers
to access the MSM8996 L2 cache registers.
Separating the L2 access code from the PMU driver and
making it public to allow other drivers use it.
The accesses must be separated with a single spinlock,
maintained in this driver.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/perf/Kconfig                 |  1 +
 drivers/perf/qcom_l2_pmu.c           | 90 ++++++++++--------------------------
 drivers/soc/qcom/Kconfig             |  3 ++
 drivers/soc/qcom/Makefile            |  1 +
 drivers/soc/qcom/kryo-l2-accessors.c | 56 ++++++++++++++++++++++
 include/soc/qcom/kryo-l2-accessors.h | 12 +++++
 6 files changed, 97 insertions(+), 66 deletions(-)
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 09ae8a9..8e6510c1 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -89,6 +89,7 @@ config HISI_PMU
 config QCOM_L2_PMU
 	bool "Qualcomm Technologies L2-cache PMU"
 	depends on ARCH_QCOM && ARM64 && ACPI
+	select QCOM_KRYO_L2_ACCESSORS
 	  help
 	  Provides support for the L2 cache performance monitor unit (PMU)
 	  in Qualcomm Technologies processors.
diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index 21d6991..02ca1fa 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -23,6 +23,7 @@
 #include <asm/barrier.h>
 #include <asm/local64.h>
 #include <asm/sysreg.h>
+#include <soc/qcom/kryo-l2-accessors.h>
 
 #define MAX_L2_CTRS             9
 
@@ -79,8 +80,6 @@
 #define L2_COUNTER_RELOAD       BIT_ULL(31)
 #define L2_CYCLE_COUNTER_RELOAD BIT_ULL(63)
 
-#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
-#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
 
 #define reg_idx(reg, i)         (((i) * IA_L2_REG_OFFSET) + reg##_BASE)
 
@@ -99,48 +98,7 @@
 #define L2_EVENT_STREX                     0x421
 #define L2_EVENT_CLREX                     0x422
 
-static DEFINE_RAW_SPINLOCK(l2_access_lock);
 
-/**
- * set_l2_indirect_reg: write value to an L2 register
- * @reg: Address of L2 register.
- * @value: Value to be written to register.
- *
- * Use architecturally required barriers for ordering between system register
- * accesses
- */
-static void set_l2_indirect_reg(u64 reg, u64 val)
-{
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&l2_access_lock, flags);
-	write_sysreg_s(reg, L2CPUSRSELR_EL1);
-	isb();
-	write_sysreg_s(val, L2CPUSRDR_EL1);
-	isb();
-	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
-}
-
-/**
- * get_l2_indirect_reg: read an L2 register value
- * @reg: Address of L2 register.
- *
- * Use architecturally required barriers for ordering between system register
- * accesses
- */
-static u64 get_l2_indirect_reg(u64 reg)
-{
-	u64 val;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&l2_access_lock, flags);
-	write_sysreg_s(reg, L2CPUSRSELR_EL1);
-	isb();
-	val = read_sysreg_s(L2CPUSRDR_EL1);
-	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
-
-	return val;
-}
 
 struct cluster_pmu;
 
@@ -211,28 +169,28 @@ static inline struct cluster_pmu *get_cluster_pmu(
 static void cluster_pmu_reset(void)
 {
 	/* Reset all counters */
-	set_l2_indirect_reg(L2PMCR, L2PMCR_RESET_ALL);
-	set_l2_indirect_reg(L2PMCNTENCLR, l2_counter_present_mask);
-	set_l2_indirect_reg(L2PMINTENCLR, l2_counter_present_mask);
-	set_l2_indirect_reg(L2PMOVSCLR, l2_counter_present_mask);
+	kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_RESET_ALL);
+	kryo_l2_set_indirect_reg(L2PMCNTENCLR, l2_counter_present_mask);
+	kryo_l2_set_indirect_reg(L2PMINTENCLR, l2_counter_present_mask);
+	kryo_l2_set_indirect_reg(L2PMOVSCLR, l2_counter_present_mask);
 }
 
 static inline void cluster_pmu_enable(void)
 {
-	set_l2_indirect_reg(L2PMCR, L2PMCR_COUNTERS_ENABLE);
+	kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_COUNTERS_ENABLE);
 }
 
 static inline void cluster_pmu_disable(void)
 {
-	set_l2_indirect_reg(L2PMCR, L2PMCR_COUNTERS_DISABLE);
+	kryo_l2_set_indirect_reg(L2PMCR, L2PMCR_COUNTERS_DISABLE);
 }
 
 static inline void cluster_pmu_counter_set_value(u32 idx, u64 value)
 {
 	if (idx == l2_cycle_ctr_idx)
-		set_l2_indirect_reg(L2PMCCNTR, value);
+		kryo_l2_set_indirect_reg(L2PMCCNTR, value);
 	else
-		set_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx), value);
+		kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx), value);
 }
 
 static inline u64 cluster_pmu_counter_get_value(u32 idx)
@@ -240,46 +198,46 @@ static inline u64 cluster_pmu_counter_get_value(u32 idx)
 	u64 value;
 
 	if (idx == l2_cycle_ctr_idx)
-		value = get_l2_indirect_reg(L2PMCCNTR);
+		value = kryo_l2_get_indirect_reg(L2PMCCNTR);
 	else
-		value = get_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx));
+		value = kryo_l2_get_indirect_reg(reg_idx(IA_L2PMXEVCNTR, idx));
 
 	return value;
 }
 
 static inline void cluster_pmu_counter_enable(u32 idx)
 {
-	set_l2_indirect_reg(L2PMCNTENSET, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMCNTENSET, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_counter_disable(u32 idx)
 {
-	set_l2_indirect_reg(L2PMCNTENCLR, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMCNTENCLR, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_counter_enable_interrupt(u32 idx)
 {
-	set_l2_indirect_reg(L2PMINTENSET, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMINTENSET, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_counter_disable_interrupt(u32 idx)
 {
-	set_l2_indirect_reg(L2PMINTENCLR, idx_to_reg_bit(idx));
+	kryo_l2_set_indirect_reg(L2PMINTENCLR, idx_to_reg_bit(idx));
 }
 
 static inline void cluster_pmu_set_evccntcr(u32 val)
 {
-	set_l2_indirect_reg(L2PMCCNTCR, val);
+	kryo_l2_set_indirect_reg(L2PMCCNTCR, val);
 }
 
 static inline void cluster_pmu_set_evcntcr(u32 ctr, u32 val)
 {
-	set_l2_indirect_reg(reg_idx(IA_L2PMXEVCNTCR, ctr), val);
+	kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVCNTCR, ctr), val);
 }
 
 static inline void cluster_pmu_set_evtyper(u32 ctr, u32 val)
 {
-	set_l2_indirect_reg(reg_idx(IA_L2PMXEVTYPER, ctr), val);
+	kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVTYPER, ctr), val);
 }
 
 static void cluster_pmu_set_resr(struct cluster_pmu *cluster,
@@ -295,11 +253,11 @@ static void cluster_pmu_set_resr(struct cluster_pmu *cluster,
 
 	spin_lock_irqsave(&cluster->pmu_lock, flags);
 
-	resr_val = get_l2_indirect_reg(L2PMRESR);
+	resr_val = kryo_l2_get_indirect_reg(L2PMRESR);
 	resr_val &= ~(L2PMRESR_GROUP_MASK << shift);
 	resr_val |= field;
 	resr_val |= L2PMRESR_EN;
-	set_l2_indirect_reg(L2PMRESR, resr_val);
+	kryo_l2_set_indirect_reg(L2PMRESR, resr_val);
 
 	spin_unlock_irqrestore(&cluster->pmu_lock, flags);
 }
@@ -315,14 +273,14 @@ static inline void cluster_pmu_set_evfilter_sys_mode(u32 ctr)
 		   L2PMXEVFILTER_ORGFILTER_IDINDEP |
 		   L2PMXEVFILTER_ORGFILTER_ALL;
 
-	set_l2_indirect_reg(reg_idx(IA_L2PMXEVFILTER, ctr), val);
+	kryo_l2_set_indirect_reg(reg_idx(IA_L2PMXEVFILTER, ctr), val);
 }
 
 static inline u32 cluster_pmu_getreset_ovsr(void)
 {
-	u32 result = get_l2_indirect_reg(L2PMOVSSET);
+	u32 result = kryo_l2_get_indirect_reg(L2PMOVSSET);
 
-	set_l2_indirect_reg(L2PMOVSCLR, result);
+	kryo_l2_set_indirect_reg(L2PMOVSCLR, result);
 	return result;
 }
 
@@ -767,7 +725,7 @@ static int get_num_counters(void)
 {
 	int val;
 
-	val = get_l2_indirect_reg(L2PMCR);
+	val = kryo_l2_get_indirect_reg(L2PMCR);
 
 	/*
 	 * Read number of counters from L2PMCR and add 1
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index d0a73e7..e4f7702 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -62,6 +62,9 @@ config QCOM_LLCC
 	  SDM845. This provides interfaces to clients that use the LLCC.
 	  Say yes here to enable LLCC slice driver.
 
+config QCOM_KRYO_L2_ACCESSORS
+       bool
+
 config QCOM_MDT_LOADER
 	tristate
 	select QCOM_SCM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 9fb35c8..1c76901 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
+obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
diff --git a/drivers/soc/qcom/kryo-l2-accessors.c b/drivers/soc/qcom/kryo-l2-accessors.c
new file mode 100644
index 0000000..75fd07a
--- /dev/null
+++ b/drivers/soc/qcom/kryo-l2-accessors.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/spinlock.h>
+#include <asm/sysreg.h>
+#include <soc/qcom/kryo-l2-accessors.h>
+
+#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
+#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
+
+static DEFINE_RAW_SPINLOCK(l2_access_lock);
+
+/**
+ * kryo_l2_set_indirect_reg() - write value to an L2 register
+ * @reg: Address of L2 register.
+ * @value: Value to be written to register.
+ *
+ * Use architecturally required barriers for ordering between system register
+ * accesses, and system registers with respect to device memory
+ */
+void kryo_l2_set_indirect_reg(u64 reg, u64 val)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2_access_lock, flags);
+	write_sysreg_s(reg, L2CPUSRSELR_EL1);
+	isb();
+	write_sysreg_s(val, L2CPUSRDR_EL1);
+	isb();
+	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
+}
+EXPORT_SYMBOL(kryo_l2_set_indirect_reg);
+
+/**
+ * kryo_l2_get_indirect_reg() - read an L2 register value
+ * @reg: Address of L2 register.
+ *
+ * Use architecturally required barriers for ordering between system register
+ * accesses, and system registers with respect to device memory
+ */
+u64 kryo_l2_get_indirect_reg(u64 reg)
+{
+	u64 val;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2_access_lock, flags);
+	write_sysreg_s(reg, L2CPUSRSELR_EL1);
+	isb();
+	val = read_sysreg_s(L2CPUSRDR_EL1);
+	raw_spin_unlock_irqrestore(&l2_access_lock, flags);
+
+	return val;
+}
+EXPORT_SYMBOL(kryo_l2_get_indirect_reg);
diff --git a/include/soc/qcom/kryo-l2-accessors.h b/include/soc/qcom/kryo-l2-accessors.h
new file mode 100644
index 0000000..673c534
--- /dev/null
+++ b/include/soc/qcom/kryo-l2-accessors.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H
+#define __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H
+
+void kryo_l2_set_indirect_reg(u64 reg, u64 val);
+u64 kryo_l2_get_indirect_reg(u64 reg);
+
+#endif
-- 
2.7.4

