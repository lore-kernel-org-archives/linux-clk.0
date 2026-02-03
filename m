Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C842D3A0B3B;
	Tue,  3 Feb 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126716; cv=none; b=A9L05MW+2LiHQGuvh4aZovYEHtKF86tW5YFYYnQn/AFufGBGHIAwrFEP4IoNLwdl1g/PyJ7Vk4sF/5dMzpUprslnVAhNNOBHYE74uL+tD0ROEo2eaaCzGcT+uiVZ4dfh5LH/6uCwwcelXT0vauPivWGMOlub1RiUeQOpgiPgHaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126716; c=relaxed/simple;
	bh=C3bdus2WtTzcQe+u+bKGTdm1/X2cWSeluF0Obtmw+RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJjMN/xxnKQjgPv81K8nIzXjd00oTInYGjdmoGxEho2fqbijCVh+JlEdR0hhCSBY1nF4gvIkH9KOXdNH22tg3weq0I0zCbcjHWeH2ntZursvlzmGDD7rnYYh47Cw0gDdz4C7QxwmRWEQ9Hc80FaSrvZdo1bj/NLqw3aW2c/X/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: V4IttBeMTGiG3+J685U/6A==
X-CSE-MsgGUID: 3F8sns8qQkSG/hkS6jKriQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2026 22:51:54 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A09F421BAE7;
	Tue,  3 Feb 2026 22:51:50 +0900 (JST)
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
Subject: [PATCH v3 2/8] clk: versaclock3: Remove unused SE2 clock select macro
Date: Tue,  3 Feb 2026 13:51:33 +0000
Message-ID: <20260203135139.28151-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
References: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
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

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes:
- Added "Reviewed-by" tag from Fabrizio.

 drivers/clk/clk-versaclock3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 6dcf3d94db7b..18ef0f38c85b 100644
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

