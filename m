Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34D37BE6D;
	Tue,  7 Apr 2026 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596294; cv=none; b=IeD3cAQHPYIiFnImUJ+9APFud6eS75gBAHVeWcy2x/DPXNTu6FDJdTV3bSpuIYizwtTry1Uo8lenQd9vX/XSfMgYwyg1yedQuuIJlWaYx/x3rCN3ySMFQ20NVvDbTvdccqI16crvMdH4sNR/4CT8wfynNEEsdAiGuLA60m0dbnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596294; c=relaxed/simple;
	bh=jVSsa70hAx2ukhvlNqCo93OaU4T2v9FKvKIhloziMs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtOD/CnnAyOJOKKHrG9WpFoHF0Z2fI5E48mqVim2rZ9ogxRerlnza727pfSPa5gxw8/t/2Qz9UsnkL4cCP6W9dks0hQPykJ5cBOTH5VZ0xnpR4mf4BZy9z8t77ELTYby7dTp/mRe6PIzaNY5Tyi/IPtpVCHyKoRPYUxzmRevocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Wu/ghMSG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Wu/ghMSG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88C90113375;
	Tue,  7 Apr 2026 23:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775596290; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GqxEylt11BTxDqsRfRfjr99v4nY1Ctb11xtDHijvoNk=;
	b=Wu/ghMSGhHuYCCbcqWK+V/2o+790KG1PluAXz5yv71PWcaScJDQcklalHfWp8qjMRFc3Ds
	mN9KUTI28MkgsZ5qPUpg5g3H/vLitrsQDhWcwSj6z48Fyh27/94nrmq9BvNvdFhCGmcDkB
	oDViCRsi5Gl3SGmBAX8pv+Gny/ZwXqf3jAfLwMC5QIUw+yGUkqFgeax814YY2//0Sk+xyv
	lm3aPokbIbsSx3ob1mX3Aqz2G5u1AGOttoclJ2icUuGQhtTimhdETnzAoIa9qy0cG2JjPG
	pBFOL7YODWg4Bs/HOElX2Sk52gvM7Jm4nQl/+oSQKExGhZBOrTf4ExMgPstoLg==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] clk: fsl-sai: Sort the headers
Date: Tue,  7 Apr 2026 23:09:59 +0200
Message-ID: <20260407211123.77602-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407211123.77602-1-marex@nabladev.com>
References: <20260407211123.77602-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Sort the headers. No functional change.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V4: New patch
V5: - Reorder this into 2/6 position
    - Add RB from Brian
---
 drivers/clk/clk-fsl-sai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index cba45e07562da..c59ddd519f9f5 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -5,12 +5,12 @@
  * Copyright 2020 Michael Walle <michael@walle.cc>
  */
 
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #define I2S_CSR		0x00
-- 
2.53.0

