Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624E39CD1B
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 06:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738690; cv=none; b=IEx5wWscqD8mWulqbS5vl3w3fOxb6fYTnLnXZNGDfAtqi1Ej+lTxxUHkApxgW8+imUYlBoPUx7RbO1qzAOLPtKkXxVy59Rw6v3kQDdYHJRg1hU60SiS5Sx2QUFgtAO2bdEYLr1uc79DEkf1ZYlf+stjm2dHOGQ58LUizvgKGjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738690; c=relaxed/simple;
	bh=jBkDa28eOn+klGv+NMO1GCwx57dyB2nn2LKV33wAvlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HK2560aSJCldHaY2xI9t3ewtkWasvS+TCeQaMMFMm8th2HdiSFAfo5fg2axxkvrLa+8Hkez3drbzseWvlimgF7aRp4jF0Sc3guh41R24C9CL5eOOpFvUgMB/XzMohTjevVPoYg0IDKRrI39x/26YDCSCGZ1q/vuGbWYCQJ/xNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApAWbnbr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApAWbnbr"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1496087a12.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 23:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785738688; x=1786343488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KppttdmRA/osqRgYgVIKOVyovbhKli4YO+D+/pf5Fl4=;
        b=ApAWbnbrYFD6va5cfUIvoTiP/VcEX6dEKqYdFdA5sAkrkU+7qEkEcX9TYbhi4JsDQe
         8DFhhE1nAvR9MXC3WBsRGgFzhPpV47M5E5/CfYj86DQMYs0y3KShr1Z2iOmsiEjZ85Fk
         4jDJweuFTdua8TjMQ3dX2HO2VxDULRaqdvYheiuhuOv9LbwzNieAuwFGomdxOKxjs9Ug
         lAsv8lO07QDhrfi8+kpzCmUNxYi13wNvdAbFwABFJ1w/dBVWCy/HuHOdE8Nt4wksR4Ce
         a5EBNQSEl020SCsDPrWr9vlZNcEPye0svMbWdiIe4yVpbqqAldgSMLw12vPuqxdOqCpL
         KDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785738688; x=1786343488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KppttdmRA/osqRgYgVIKOVyovbhKli4YO+D+/pf5Fl4=;
        b=YulS+RtrTi5yIqWIKqmPvNah3K1RPWytY+2qh+z6vYt30scgb7lfvHhwNiTVMarozz
         n6uHhqazR/A2iJR9tRHicEq+biEayuePPPNZH0FzVRcXGAljLHsEpiD+AouzRWOtquW9
         XLsM3XHneSUQ+BnBuz4IyPZuRpS28U92YtD13VeE5HW6tn54GYyqVtsel6w3yf0kZoPe
         VwHWX8IfkL5+TL4uz0Tj0vsN+OZKiNyze8AWFrAy2vMOz97EC6ttUlYeFDJkxkWplXY6
         cHs+lsLBjB0gzufP+cAtGsZvjkTdFYnWwMjGLs4TYJ4tw+ItI3EQ6BzmsdhFAJ7caAnd
         n4eg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8LBpO2aJHmnzqdeQZ0MhQkV4Bc5lGZios1jrHNYzI+fzhxWB+Zk0LtgdaQwNVNWJDMRlE4vZR70Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YytGKJBapfOOa6HrOASql8Omr4jaABSlpz+URZwthgsA2GERCMt
	iQqiAldNMpj+wlel0Ed5+kL0f1klGDwlBM4g1hJ7hWe48wZpEdwDv9kh
X-Gm-Gg: AR+sD13JayTx4gBoY9MD4904KsIvfitqlFXrN2mlDIDD/d7FG9FS75ojLHf01YtqOmd
	QitSbEWTTkmRD93CH8hdlw0YOZ2AuPqQi2tZK60dmfVy1f7225WnLLPCDBmNUYabHEDmSmkSsnq
	B8leI3GdS6DLsngXWFHHV5eLsMxHYoyFPeE2I2rwc0wz1CzNlK8vymvCx8geIKBHkYcmTTs1osF
	iAUBRXfjGRRhfd898Xvbg7ngOULW07TVLMci9AE2ngm0LU6RRPB+0ior7kE20bWn2MiLfCjfkWO
	KPaDMzoqrlMNLwPbimzVqxtJ73PnBSA8C0L5ZjUvqFKj4uny2lw024U69WtgGSL1AxFbK9VW6eo
	P/XXtZDhWTvr4PPmleztfvPxTIRXshRj7kidcctbnhnKXXt8pTZNDvhLBbPVGDNw+JSZDe4hw0p
	CycVprCBQmc9GhEDnxc/J+jgtIqAT+b02UedocuqFb12hgxrY5eOUkKovyaehAHzDJkcz8xSg=
X-Received: by 2002:a05:6a21:648f:b0:3c9:e7d:b170 with SMTP id adf61e73a8af0-3c92a8f3f7dmr8746275637.58.1785738688068;
        Sun, 02 Aug 2026 23:31:28 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963ddc3sm3173682a12.7.2026.08.02.23.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:31:27 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate() conversion
Date: Mon,  3 Aug 2026 06:31:26 +0000
Message-ID: <20260803063126.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
determine_rate()") replaced zynq_pll_round_rate() with
zynq_pll_determine_rate() but left its kernel-doc block behind, so the
block still names the old function and documents the removed @rate and
@prate parameters instead of @req.

Retitle the block and describe @req. The Return: line described a
frequency and referenced the removed @rate; the function returns 0
unconditionally and the rounded rate comes back in @req.

No functional changes.

Assisted-by: Claude:claude-opus-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Changes in v2:
- Say "Return: 0 always" instead of "Return: 0 on success". The function
  has no failure path, so there is no success case to distinguish
  (Michal Simek).
- Rebased on v7.2-rc6; the file is unchanged, so the diff is the same
  apart from that line.

v1: https://lore.kernel.org/all/20260802013252.7-1-bbnpreetsingh@gmail.com/

 drivers/clk/zynq/pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 44c6093783641..fe90b50e1545d 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -42,11 +42,11 @@ struct zynq_pll {
 #define PLL_FBDIV_MAX	66
 
 /**
- * zynq_pll_round_rate() - Round a clock frequency
+ * zynq_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
- * @rate:	Desired clock frequency
- * @prate:	Clock frequency of parent clock
- * Return:	frequency closest to @rate the hardware can generate.
+ * @req:	Clock rate request, updated with the frequency closest to the
+ *		requested one that the hardware can generate
+ * Return:	0 always
  */
 static int zynq_pll_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
-- 
2.43.0

