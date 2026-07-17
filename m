Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C19638D69D;
	Fri, 17 Jul 2026 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273194; cv=none; b=HiTv3sEnyXBRHj8DaSe1q/qTHznRJQtryphkiY+9HKhPgclumfHf9oBrdob5jfmdA35z8smS5cBorNsP5FXIT7ZIHjLaYrCRj9CM+wYumzLikr4HD8RxgexwNWOr8zrb+EIX9IY2TXHurUy8sE6K1TvLbZXZEOgomzhDt/8Sdtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273194; c=relaxed/simple;
	bh=ccCpnKQ15ic8pJiIzlgrsDeRCORSw6fGPFWzhkR936U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdtBTE4bDGbPTSm862cEdYDztHbde4GZB2fFHo0ta317RWWfpHzcG1mjKvgY/wzaKloJm0kE+BvmPEB3CY6r43AEm2QV27tx23YA1/OdPjttwNK1ygP11p//s6rqcsuNZsjWvA3ioW5UEJ4oKceWwFgeXKwnCmOkjYUGF8YXAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mOiwfw89; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mOiwfw89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273187;
	bh=3sqi+qTYcpi2NJ4kQU7sMVmsgzOJTpn+3qWETJCDzUA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=mOiwfw89k1VnRRc4JlaFWerAJ5/h3ATDl16IohOVNNMkFFukhUqEOM5kj35CzbOou
	 83eocMnRa5doWLpiePyAqaN+pO/e6Zavm0IYRlK3wFDVzv5d2ZI1XGUi398F0i7puC
	 JRDBib1ceOPG7ADc7tNk1qxK+44DrdA5sqSSZc7Q=
X-QQ-mid: esmtpsz16t1784273181te34484dd
X-QQ-Originating-IP: jhJhuuxRTxxyu4B4UrVc9so84zNiH/hNsX0G8dLdNDM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8878662463003206756
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Jul 2026 00:26:02 -0700
Subject: [PATCH 2/3] clk: spacemit: k3: fix i2s clock topology
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-clk-fix-i2s-v1-2-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4976;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=ccCpnKQ15ic8pJiIzlgrsDeRCORSw6fGPFWzhkR936U=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmRN/k5l1XOS3lZFvpm0efdSw/mf2G8IBYpz2Z092P86
 a4Xf/4s7ChlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIrThGhp2nAuNLfBatz8me
 ovFh8qmuiSqLzz9e+yxvT+W+DomNW4sZGQ6wzmJ6sfZf9Ub+12qWSycyxdY5RB+yy7f44VtxWVJ
 YnhEA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWth7vBa++Gdi9gh1igUg3F2KH2WcwTrhlFIlVhPFUhhPb8GLs3sCPVx
	30eHDydKk14gywhg8L9HpTOcVfeeQnEY8B2k4WxhXi/g0+2aAgl3jOcb82Bdptr1Ogdc3Fn
	XMvt4WKuOYvgxmBV+kXpAfkIy+QxMmbo/qiTAEMog5sqZBrveh7I5I0m5XF4Cs9551gqCEn
	SpaMMbDKvBCBHIX3uiUPh2aKCRe7sNDB7cKzV0cmOWAfCNBR6lHIHnbPq91c0rJlVn0kn/C
	x+vE/5Gq9WRSr6Lin9HqCgo26vgzYvVG+2qxxcjM8UAF/sSg63I/dqGzBphNmnJgJHsu9ht
	EzKSPhHDw4WDolvkutSQsJJnOWvdsHItoEOooVsY9ZZf2MIudIKD6JvldFJYtwZf8WgONvP
	wyWItrpA5zjEw4cUB7GRJGTSaZxRGZKIqfJS7B8DMtHURIkp+gTwCZSVVBHI/SmYMhMYB98
	ptXqrp8Pj7U6i+wFwi0ZWMFLnmCLsc+/v/AqH11qJt7RubiadDaf80FiKnbkh206w+4lybH
	tKifDFT/WLwSBLZJ+oQiXKQhbYkoybns3hcAKEwYRHaSJoxVOVJIEUvAvcc9xEeIqc/JYt1
	S7oAXLkTsxGAk7Z5Bi0HDTA09z/1wmYAXF46HG9D+sB7tAq/kmMwdCdD3Is2tuhFRhiA8aD
	64Q3YSGLNukvWQhIX9PEy2Mwym9+qmDC8Hq8AbfCLhmVAK+FhJqUZfEAEivk83r3t/0Yyt1
	hJllkkPqeSHw0EyhmTpuJQgOYsXaWlutaXQDWYGPjk+yNdIgRoo2qu3HO6/0nhqcPRj3Pqc
	ZDo2iJ7JtyrQh4jG0R3rGuZkv0kWiIXvA7ASZav4d77VguHXWkMpRNEUllLBasFHFxrcJpy
	pHBwxN0QQ6p5yvyOUVp9vI2mjccj9Hn9vY2z0v0dZwZIyMHFyf+0MQf2jXUIRFAp+rWn6zV
	HLcRXU4eq21Sxj33HXwmsUvSHro3X0ITVUHRegPjz1QwnmsIZWsZOKIoCTkCO0zjDEVorCQ
	fTQ5VM49nh8jJSUeshLJZLV9fEM7Gm0xQv+meojKCEkBuNT9Glbl6wzApzjtso3dGNbvTU+
	A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The K3 i2s clocks were modelled as a single path behind one MPMU
register:

    pll1_d96_25p6 / i2s_153p6_base
      `-- i2s_sysclk_src (mux+gate, MPMU_ISCCR)
            `-- i2s1_sysclk (DDN, MPMU_ISCCR)
                  |-- i2s_bclk (div+gate, MPMU_ISCCR)
                  `-- i2s2_sysclk (mux, parent 0)

The hardware actually has two i2s clock control registers, ISCCR0
(0x0040) and ISCCR1 (0x0044): ISCCR1 drives the common sysclk shared
by i2s0/2/3/4/5 and the common bclk, whose divider always implies a
fixed 1/2 factor in front, while ISCCR0 drives a dedicated path for
i2s1:

    pll1_d96_25p6 / i2s_153p6_base
      |-- i2s_sysclk_src (mux+gate, MPMU_ISCCR1)
      |     `-- i2s_sysclk (DDN, MPMU_ISCCR1)
      |           |-- i2s_bclk_factor (fixed factor, /2)
      |           |     `-- i2s_bclk (div+gate, MPMU_ISCCR1)
      |           `-- i2s2_sysclk (mux, parent 0)
      `-- i2s1_sysclk_src (mux+gate, MPMU_ISCCR0)
            `-- i2s1_sysclk (DDN, MPMU_ISCCR0)

Because of this mismatch, i2s_bclk reported twice the real rate, and
the dedicated i2s1 clock path could not be described in DT at all.

Model the tree as above: split the MPMU_ISCCR register macro into
MPMU_ISCCR0 and MPMU_ISCCR1 to match the hardware register names,
rename the common DDN to i2s_sysclk, insert the fixed 1/2 factor
i2s_bclk_factor in front of i2s_bclk, and add the i2s1_sysclk_src mux
and i2s1_sysclk DDN backed by MPMU_ISCCR0. CLK_MPMU_I2S1_SYSCLK now
refers to the dedicated i2s1 clock; no in-tree user references this
ID, so nothing is affected by the change of meaning.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c    | 21 ++++++++++++++++-----
 include/soc/spacemit/k3-syscon.h |  3 ++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..abcc5caa67bd 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -218,11 +218,19 @@ static const struct clk_parent_data i2s_sysclk_src_parents[] = {
 	CCU_PARENT_HW(pll1_d96_25p6),
 	CCU_PARENT_HW(i2s_153p6_base),
 };
-CCU_MUX_GATE_DEFINE(i2s_sysclk_src, i2s_sysclk_src_parents, MPMU_ISCCR, 30, 1, BIT(31), 0);
+CCU_MUX_GATE_DEFINE(i2s_sysclk_src, i2s_sysclk_src_parents, MPMU_ISCCR1, 30, 1, BIT(31), 0);
 
-CCU_DDN_DEFINE(i2s1_sysclk, i2s_sysclk_src, MPMU_ISCCR, 0, 15, 15, 12, 1, 0);
+CCU_DDN_DEFINE(i2s_sysclk, i2s_sysclk_src, MPMU_ISCCR1, 0, 15, 15, 12, 1, 0);
 
-CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s1_sysclk), MPMU_ISCCR, 27, 2, BIT(29), 0);
+CCU_FACTOR_DEFINE(i2s_bclk_factor, CCU_PARENT_HW(i2s_sysclk), 2, 1);
+/*
+ * Divider of i2s_bclk always implies a 1/2 factor, which is
+ * described by i2s_bclk_factor.
+ */
+CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_bclk_factor), MPMU_ISCCR1, 27, 2, BIT(29), 0);
+
+CCU_MUX_GATE_DEFINE(i2s1_sysclk_src, i2s_sysclk_src_parents, MPMU_ISCCR0, 30, 1, BIT(31), 0);
+CCU_DDN_DEFINE(i2s1_sysclk, i2s1_sysclk_src, MPMU_ISCCR0, 0, 15, 15, 12, 1, 0);
 
 static const struct clk_parent_data i2s_sysclk_parents[] = {
 	CCU_PARENT_HW(pll1_d4_614p4),
@@ -243,7 +251,7 @@ CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16
 CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 1, 0);
 
 static const struct clk_parent_data i2s2_sysclk_parents[] = {
-	CCU_PARENT_HW(i2s1_sysclk),
+	CCU_PARENT_HW(i2s_sysclk),
 	CCU_PARENT_HW(i2s2_sysclk_div),
 };
 CCU_GATE_DEFINE(i2s0_sysclk, CCU_PARENT_HW(i2s0_sysclk_div), MPMU_I2S_SYSCLK_CTRL, BIT(2), 0);
@@ -1161,8 +1169,11 @@ static struct clk_hw *k3_ccu_mpmu_hws[] = {
 	[CLK_MPMU_I2S_153P6]		= &i2s_153p6.common.hw,
 	[CLK_MPMU_I2S_153P6_BASE]	= &i2s_153p6_base.common.hw,
 	[CLK_MPMU_I2S_SYSCLK_SRC]	= &i2s_sysclk_src.common.hw,
-	[CLK_MPMU_I2S1_SYSCLK]		= &i2s1_sysclk.common.hw,
+	[CLK_MPMU_I2S_SYSCLK]		= &i2s_sysclk.common.hw,
+	[CLK_MPMU_I2S_BCLK_FACTOR]	= &i2s_bclk_factor.common.hw,
 	[CLK_MPMU_I2S_BCLK]		= &i2s_bclk.common.hw,
+	[CLK_MPMU_I2S1_SYSCLK_SRC]	= &i2s1_sysclk_src.common.hw,
+	[CLK_MPMU_I2S1_SYSCLK]		= &i2s1_sysclk.common.hw,
 	[CLK_MPMU_I2S0_SYSCLK_SEL]	= &i2s0_sysclk_sel.common.hw,
 	[CLK_MPMU_I2S2_SYSCLK_SEL]	= &i2s2_sysclk_sel.common.hw,
 	[CLK_MPMU_I2S3_SYSCLK_SEL]	= &i2s3_sysclk_sel.common.hw,
diff --git a/include/soc/spacemit/k3-syscon.h b/include/soc/spacemit/k3-syscon.h
index a68255dd641f..959d8d0786fe 100644
--- a/include/soc/spacemit/k3-syscon.h
+++ b/include/soc/spacemit/k3-syscon.h
@@ -45,7 +45,8 @@
 #define POSR_PLL7_LOCK			BIT(30)
 #define POSR_PLL8_LOCK			BIT(31)
 #define MPMU_SUCCR			0x0014
-#define MPMU_ISCCR			0x0044
+#define MPMU_ISCCR0			0x0040
+#define MPMU_ISCCR1			0x0044
 #define MPMU_WDTPCR			0x0200
 #define MPMU_RIPCCR			0x0210
 #define MPMU_ACGR			0x1024

-- 
2.55.0

