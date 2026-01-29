Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FCC4CB5B
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647598; cv=none; b=TssVib+rVFc1Tq0iFGCOsSrGe2lwDYbnU7dRt+wbKW79XVeoeqmhQs4s/4f1Gy89sP/PLgzYUB/ht59c+WHtiR30ztuU0dZc/+4uip5/OubeiHT87o9ctGQ+TQMWK+tGMsfUC6UqK+KyO6KHMc+kIkzfTvB8og3KH1Jo/2D5Gy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647598; c=relaxed/simple;
	bh=+O4vZFI31vxJLzZF1PnnSBdGqvfgFnBCs9noGUASIXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fi8600M1Xjh3/ydDudKOe/LT+fsvldA8+EPoCbfOlMrdWVhtQ93es1EgdgKQNPVBU6i/mfQZNDSZxOd377v57q6Kn6hkSfxfC3qdKoNvafRKj/d9eGwMo/8rIzwNxffuf9YyX9iFSUPa1jd4RKYd/FhR0hGGlpvtIo4+g6R9diQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MpZ9phN5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MpZ9phN5"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BFBBC2C0373;
	Thu, 29 Jan 2026 13:40:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1769647256;
	bh=6OBFTNbtAvXWe/DmDj7X14aeJWpHww0tL9DFBVJoboU=;
	h=From:To:Cc:Subject:Date:From;
	b=MpZ9phN57145acfYiLF6m22M040Y84FEalbMriBy5Ig40BVi9O4tid90vqbif6zNr
	 SdOLFdnz4vGG9qOdGwy+EL2E+CLxLz2w273XHShrB4fxPCzrGiPgnAkEcyCfW3TjyM
	 MB0bdDKpURsWPXm2agUihXkFFyO6WEH0kzp6ZJaOIjnpmrpz+8tBjJKqwN2RjSwkZW
	 NDHdfga59xV2BczFwt0371gHBjhVGUFyIQGlqgqGo5kYujyqAGLypUcxfuW697hy3s
	 okFYZBfZU6uXJHGGB6RWeF+Q7oqMekcJId1mwuXDzCphbcTLmvpHhhTB2URCnvjSWg
	 IOgonS2temSIQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B697aac980001>; Thu, 29 Jan 2026 13:40:56 +1300
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 973EF13ED5B;
	Thu, 29 Jan 2026 13:40:56 +1300 (NZDT)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
	id 9389E413CF; Thu, 29 Jan 2026 13:40:56 +1300 (NZDT)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: sboyd@kernel.org,
	rjui@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] clk: bcm: iproc: Fix overflow in clock calculation
Date: Thu, 29 Jan 2026 13:39:58 +1300
Message-ID: <20260129003958.1410626-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=b/UR4cGx c=1 sm=1 tr=0 ts=697aac98 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=vUbySO9Y5rIA:10 a=4mRyPwOywgnOSQ-qQ9IA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Some BCM iproc devices run at 1.25GHz. This comes from a 50MHZ crystal
with a pre-divider of two, a post-divider of two and a PLL multiplier of
100. As the multiply is done first (50M * 100) this overflows a 32-bit
value. The multiplication was done as a 64-bit multiply, but the result
assigned to a 32-bit variable before the division was done. To fix this,
use a 64-bit temporary variable and use the do_div() macro to perform a
64-bit/32-bit division.

Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/clk/bcm/clk-iproc-armpll.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-armpll.c b/drivers/clk/bcm/clk-ipr=
oc-armpll.c
index 9e86c0c10b57..665f1c531c4f 100644
--- a/drivers/clk/bcm/clk-iproc-armpll.c
+++ b/drivers/clk/bcm/clk-iproc-armpll.c
@@ -180,7 +180,7 @@ static unsigned int __get_ndiv(struct iproc_arm_pll *=
pll)
  *   mdiv =3D ARM PLL post divider
  *
  * The frequency is calculated by:
- *   ((ndiv * parent clock rate) / pdiv) / mdiv
+ *   (ndiv * parent clock rate) / (pdiv * mdiv)
  */
 static unsigned long iproc_arm_pll_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
@@ -189,6 +189,7 @@ static unsigned long iproc_arm_pll_recalc_rate(struct=
 clk_hw *hw,
 	u32 val;
 	int mdiv;
 	u64 ndiv;
+	u64 rate;
 	unsigned int pdiv;
=20
 	/* in bypass mode, use parent rate */
@@ -216,8 +217,9 @@ static unsigned long iproc_arm_pll_recalc_rate(struct=
 clk_hw *hw,
 		pll->rate =3D 0;
 		return 0;
 	}
-	pll->rate =3D (ndiv * parent_rate) >> 20;
-	pll->rate =3D (pll->rate / pdiv) / mdiv;
+	rate =3D (ndiv * parent_rate) >> 20;
+	do_div(rate, pdiv * mdiv);
+	pll->rate =3D rate;
=20
 	pr_debug("%s: ARM PLL rate: %lu. parent rate: %lu\n", __func__,
 		 pll->rate, parent_rate);
--=20
2.52.0

