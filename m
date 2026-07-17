Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26287396B8C;
	Fri, 17 Jul 2026 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273204; cv=none; b=PwCpLJGygE06vkjB2eKHMmEAwElnfo6CrZJiLHZKi1DBetgBf50kADNcVKYjTDW1TgIPpAP4u/Fx7gPJ5/k7zXIE7cGuF/v+irPmUwsXcGwojMs+2/QumNZT1cfIYIvhge82HRm0LweMxXiq4KLCEksXcuS+fzauYRWV4zjvTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273204; c=relaxed/simple;
	bh=jdxLhGznkgDupAqCdXkunU0hq5sAmj1K4l6yG/K9+Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGMy/HwppzhiPgIZ8NcJUHwy8ngUpWMqRnCqnl1DzXIuGa6uYWy2C+vhfADow1sOLhvxO3zK+/7MG18L6BEPzSRcmnJelJPH3XWf/gDgTGnlbDnsscYrDvoSr7UPWvJ2FAoHTTmaY5EKGQT3O1Has3Zdu5PI+9eXoIVoVN5/ayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jDjsGZ/s; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jDjsGZ/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273189;
	bh=38PhwQsCteVhWqZvbvzqZlrs6p1pYCdri5yp22jYWIc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=jDjsGZ/s0bQhabYDBqhJ+SLYfUQaN+b0+Nfo3jzE/QFlq+vb5L7U2tFG6IOuDCSZP
	 NcP+r2KSBR447cSzWM5XkhGmXmBqVnjHy/FmS2YfYof2L7jipetU9MVyeBWgmLP9tK
	 +WL2YlU8MAl1d1glIk+B0f/on/X9R9K1vtk8l5dU=
X-QQ-mid: esmtpsz16t1784273185t0cd49d46
X-QQ-Originating-IP: 0qEVPKCqEdQ1GXAUHe8Nd/dZrwlIlPynUoTPLD47rxs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11695669700659989284
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Jul 2026 00:26:03 -0700
Subject: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s sysclk
 dividers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=jdxLhGznkgDupAqCdXkunU0hq5sAmj1K4l6yG/K9+Gc=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGpZ2RGh+AjRw2mKqB/RlTGH2MU1+TNKyWxQw3vLFQRAyynTK
 4h1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmpZ2REACgkQmAnvgPkzNC+BLAEA7Uki
 nKszCL3B6P3wkkKECxf6bYm/ZqdNV9iiVEh5n80BAO39hlDprHKXIIw/+nK2k3F+aH1Aj99x1ae
 jGDlBe2sI
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MLlmX7a+SkXmi9JWNlYyOmZ7c1knpqu1sQfRoINWj/JdWJo+V+vtnlus
	sqU2DjA7KeQX82WYE7STGxEL1gWUrThiKySMdL8NVa78r5svVhVKB86B9GXK/ZVtMeid7er
	XKj/RzrsKpGSHYDGpg8BpwrzYKa5TJ+6WWkeenNKz8/tUAreXpwhmGqTl5kdXrSVSgMCmzA
	gtGhmQPD6oyFd6vRUh4ReNGazP+FiOdbcEvwZn1GTI0l/ppqBEE0nNYZItTXie5ueoMRzV8
	y4lljXAr3nFAUxdeKAIv+aOOqOKboDiJrp0SAvZ3vY25G2XxHRpu1TVmvuFNkm6acxpjma0
	YkxnvaX+ppDGHWU18BNip73BdelDpcLygRvgu+U2HdAa2F1yXIChoRUiztA3TMatxOeXn0f
	T2P6Ln1+qwa4ARpqnsDegoU46XFBQAVY31YNKJqsll2Lpyf49TgIZbIwrWzbmXERpBPxeWo
	lU2uw1K09AFgHSf+Q7MNcb438SVQ3q8Mo3SyQKX1p1sodcaUV2bvgZWa4zEYm3yi9jRxQAf
	YLCLX1WjNXcmx3hi8ijA8d1l5eQgSHD0P4F/79WEytqR2w0XwvCOBJL1ahHO6Y+Pg9RjqUj
	+n2HLRfCaiEa55P08ppFwyroYr92c8XGmE3OiHrclM828CbSJOK3nT5jx1Cf+MXE35rMDBs
	1pXFuXECRL3heaZZo/C8bYx+tH1L0QGyySTLhKHOpx63s6/4JqfJk+clihhAOVY3fDtbwZY
	wI5EGbNirljnUOmqCXSpZO1H3skuHbX4vzHqzrQSUrRfaL2+JQ/SC12rX/0+xxnODMm3wDs
	HmKPSFS+ChOZMdNj3znlcnG/eTfHuvtkBqxX7AGxLrCA8odz2B2bmyjegGrrUHfFb5fKs3K
	ZbgDvKEywd/EHOdYQeiKyrxfNSjiA5GcMU2cmepFLCetV5JhL1YJrfgzdvwcRQN75qJbgNL
	vokdCKJSU/5uim0s8bZGbX2zl+7glPFA1//kAmgYpsiWz23701mc9KMFsdRdQS61vki8nx0
	/dtiXfCYKOOBOoL5JDcdZvPpVPS+TCdaRknpM09BzgQwlz9nwZeKG+C9FqhA5HLbZJW8YFo
	n8m0amJZtK6BPLPJntKgUY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The i2s{0,2,3,4,5}_sysclk_div DDNs have an additional fixed 1/2
divider in the hardware IP after the configurable divider, so the
real output rate is:

    rate = parent_rate * num / (den * 2)

Set pre_div to 2 to account for it.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index abcc5caa67bd..675cf03d98f0 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -244,11 +244,11 @@ CCU_MUX_DEFINE(i2s3_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 12, 2,
 CCU_MUX_DEFINE(i2s4_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 16, 2, 0);
 CCU_MUX_DEFINE(i2s5_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 20, 2, 0);
 
-CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 1, 0);
+CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 2, 0);
 
 static const struct clk_parent_data i2s2_sysclk_parents[] = {
 	CCU_PARENT_HW(i2s_sysclk),

-- 
2.55.0

