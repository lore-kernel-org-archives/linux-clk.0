Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C913E329E7E;
	Mon,  6 Apr 2026 21:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512322; cv=none; b=KHe0HM8pIXKrAyMH6XdVMj/RTrBsK5W/h7W/5d3pH6Ct2a9vciJ9ICG0DXmgLkRiYopBA3ZMyTuks4nxrqkNm9cBSsS1VMF5SpFnytd/yO12/XCfKLfZHo+Q1tOSs64Kgbho/tkTjmL2xIAjl2hhssIoteUBnO6xKHKIn2h5Avc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512322; c=relaxed/simple;
	bh=sXDqVOhuYtZv6dVOiv/m193iRz9rqTdNRm0JXraZZmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjGlFPYb8BESjRxBMzX6l2OUf1zUHCWA1QiW6BwokmPMtHJ37TxckfOESCmGyzaAKgtP2zmgqbu0qvo6b7baT93+cwXNRki1p6GoGMZIC/LHYex/J2VG7GvnHOTffOqGC4UnYVUEQX5T87X/Jid4J0jzSUoll3ukiezX8UuGz6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Z6ALV4w+; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Z6ALV4w+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0A5A1132DE;
	Mon,  6 Apr 2026 23:51:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775512319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BnNoaVscZjGiPmWxjYY1aPUb7ghuc3NUVzwVbpt2SV8=;
	b=Z6ALV4w+utyut7xExQ98PccPcYpTnyLVtE4xFDMn+Q7lF3De315on+v7BeCZ7glHcCmJGV
	FJ0yQzvE0wP8smd/Ib5aB+BbTWLldZdyd67rRVM7dQwYQNktYOCDnzCbhVgs0YwsnHGrNe
	9f2bIVNxgCzeyrUodyLk/z04UGiGbLH2EeUspBaNAQuvFzHar1mHsgLMVVzdoKEvZKTMX+
	RPpnNjBRvQ+0fV8ikqiRgHVL0wpO6gZdyIPaC76t3oeEAMXSRkGNZM5c71Yces/2rMhN65
	XmH9Zy+Wq5PzDPwoDPvqU+QW8edF2qNh8HG+efXmAXx3RBPm1rkHjYB02aHNFg==
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
Subject: [PATCH v4 4/6] clk: fsl-sai: Sort the headers
Date: Mon,  6 Apr 2026 23:49:44 +0200
Message-ID: <20260406215150.176599-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406215150.176599-1-marex@nabladev.com>
References: <20260406215150.176599-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Sort the headers. No functional change.

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
---
 drivers/clk/clk-fsl-sai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index 336aa8477d0ea..2a68e32c3167b 100644
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

