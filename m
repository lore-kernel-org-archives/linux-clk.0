Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD173191A9;
	Wed, 24 Dec 2025 05:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554657; cv=none; b=rMch/DECQ6JFMI2S41v4VxLofpeC0Z9iuR+UTcmIdnlBIIhFBrEEAduVJ5xufkHi/o0qTLoDACLGK3Dkz7Q/ZBtGXbk/U0GKd28Gcv16YJDJfy6RYVaLFWJSDdJVNhqZ8GrgrLcSkURDyQtq50i8falBDqnaRQuo3ticbqgQhfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554657; c=relaxed/simple;
	bh=GAvow/VegJcR+SznQ1U89Bb19y2myE8OgX+jpQtvYRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Py08MA8Viy4delt88sZNL1KoWsOtGiVoy6PdELfXN8lhTK44gBNfXo239yQEYeJro0DAUkja/ZF2J99GDxIzdb24e7XS7Yw/D34zsbIJGNOf03T766QVY3c9JIakXMhqIJfujKyyWjMfccwyF5vRN+2ZhBdGvLE4WLu7L8ebfTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Dec
 2025 13:37:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Dec 2025 13:37:23 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Dec 2025 13:37:23 +0800
Subject: [PATCH v16 2/3] MAINTAINERS: Add entry for ASPEED clock drivers.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251224-upstream_clk-v16-2-8c1318f56c3c@aspeedtech.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
In-Reply-To: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766554643; l=829;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=GAvow/VegJcR+SznQ1U89Bb19y2myE8OgX+jpQtvYRM=;
 b=0DgzmB1KgK1DHqUvIXQ+w1pgqYdQkPpiyiGNpTYJXmQBzfbrQ1S43sjL/D4pBPjFjW/16Nqes
 UiwN46W0Fd+AT3WHmRBKTz68a4DoaUzUtQMvUsxIYuFGP/6ZZXeNcRt
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add support entry for ASPEED clock drivers.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..201ff5d5c31c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3836,6 +3836,15 @@ L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	drivers/net/phy/ax88796b_rust.rs
 
+ARM/ASPEED CLOCK SUPPORT
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
+R:	Joel Stanley <joel@jms.id.au>
+L:	linux-clk@vger.kernel.org
+L:	linux-aspeed@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+F:	drivers/clk/aspeed/
+
 ASPEED CRYPTO DRIVER
 M:	Neal Liu <neal_liu@aspeedtech.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)

-- 
2.34.1

