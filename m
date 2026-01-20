Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6844DB63;
	Tue, 20 Jan 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921584; cv=none; b=j6Fj+r3/hZgM7SraIcDG6pnHZXrZw2ABpXsoM/xtcdts2zdGFGTzIHenVYIU45FlfWsGpK+rze5Lj4MUFDudvIWLMys38DSkhSiXU8UicotXFvN2mbNqn/xNE72kvci21wCEEl43gNwmtOrH1kRcfHXmiwZcN58/HNPyd6bTC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921584; c=relaxed/simple;
	bh=g74mkjYd/T1r49iTPjhmB5mxAtAAYnDMu7MuP8yatps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcFWB1THE8ckzp/7zWxMXK8UQuwzmAzDFKKxYyrbgr4A8RqkjsGTBrKiW8xXtY07rrKxb9Vigi/8wflhpkojv8ag6nkqXsgvRsYdJ8zYSovphOhbmiMql3Nradh64tOwlQeltPjnd1tmWeF68sKkrODRl4R9wkR2OJzX6ffkfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: NS3+FQE1SNuDrS2ILb8POQ==
X-CSE-MsgGUID: LcuSTYA9R6ysKuhq9B6G5w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2026 00:06:16 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C65F2402261F;
	Wed, 21 Jan 2026 00:06:12 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/5] clk: versaclock3: Remove unused SE2 clock select macro
Date: Tue, 20 Jan 2026 15:06:02 +0000
Message-ID: <20260120150606.7356-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VC3_SE2_CTRL_REG0_SE2_CLK_SEL macro is no longer used since
commit ae6040cd7c7f8 ("clk: versaclock3: Prepare for the addition of
5L35023 device"), which switched SE2 clock select handling to use
variant-specific OF data (se2_clk_sel_msk).

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: None.

 drivers/clk/clk-versaclock3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1849863dbd67..f387cdb12f48 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -61,7 +61,6 @@
 #define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
 
 #define VC3_SE2_CTRL_REG0		0x1f
-#define VC3_SE2_CTRL_REG0_SE2_CLK_SEL	BIT(6)
 
 #define VC3_SE3_DIFF1_CTRL_REG		0x21
 #define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
-- 
2.51.0

