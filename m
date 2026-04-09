Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DAF142E83;
	Thu,  9 Apr 2026 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694599; cv=none; b=KZ9RKJcvAhImtznALP6lc6FZPXAk0qU6xd75XIvi9Rx+ejafaBquUWSpViBAwAPFPGkZ452aLXXTYiUwuB+gf/DBZRb/9EHyU4hto1FGX72pFVp/Ic9aOO8CaQoO4opKPmH9A9sbX1uZkk++0yzmbNIJW1GgR3Gnu4YaxP14a6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694599; c=relaxed/simple;
	bh=wtcHvpROXOpCW4quNWKG5Of8Nw5Rxs3LDUHaixy1rwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccq+ChYWeYqk7iA/9gjTEOeSANqSyzMDwJSF09kwyGgYlXfR3J8wSRdGR77EQZ13whQZw63UMSeGYPR4t2tpUIN2Et2UFtJtMv0zRJiqxyOzZ75Q5wJZV2i81tAa5c/wX2RfU2BuoFIJl9OSU9TJt1kvEgtpe9qozkJZtWcerHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=KQX2exGB; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="KQX2exGB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8FEC112BBB;
	Thu,  9 Apr 2026 02:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775694596; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ZNnjAj/KTRiAov5Jv/106cCzWPD9YcZmJH4vhv4K9A=;
	b=KQX2exGBO96Q5MXNmt/dNVWhMI1j3zFk/AQ/CbM/ZVed3y3AXJO5k4XC5xB9h/XoOc0wkh
	LgpO7lNUD5MlXBR6wBWTwPHWlxHar/nSCxQmPgH3m70dhApfkHAjXQc/1LHX7iT5WKJB4y
	+T90QTZmpfQoyMrCNr1+viC+fJOdtzBAWXhxCceX+Z3P+ZU0q/ZB/txAyJbDKieOP6K0ek
	2vRPLkHAXPDyuEPayece/6folQjjY4qz/cQomZFVHEAyg8HjKbmOsf3+eNKQRcBIHCuoiB
	H/m26FEECakKnkfJ9hi+DjOc0ncVGg5CJO5eHPm6NVxypnyAp/ftiHIfqAx40g==
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
Subject: [PATCH v6 2/6] clk: fsl-sai: Sort the headers
Date: Thu,  9 Apr 2026 02:29:02 +0200
Message-ID: <20260409002952.319668-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409002952.319668-1-marex@nabladev.com>
References: <20260409002952.319668-1-marex@nabladev.com>
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
V6: No change
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

