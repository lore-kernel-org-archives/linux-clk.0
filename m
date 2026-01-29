Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF5A37C0E5;
	Thu, 29 Jan 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680951; cv=none; b=acllCKaovnYRnUPbZ/pbr5SBt7LFu/FhqbW8vaD2lDBERBCqq08ZdRsiB/48irSSJvVU2a8MgMHq6n8rg1iipGF3Z0xA+2JUvFLfJZgLqKgSnB/N3mbyrve6RtZRpTh7zBnt2DB42EHO4xyzClwNdVu9DKbDbBM7hx2Zh3w7kzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680951; c=relaxed/simple;
	bh=nmykiSQjlORtjP50XPTEnb6X4mH8tc4PmDU2XkTECS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vFgVcMLq/93qASuXqrLxeB9bcfZTOq/AbOJP/veI9Z/cyWJEiMbjXt/FaW8PCwN1NiT/uV5g3e0MLwTnTTeISBKA0C+aDbdeTErC966B4V8oq3aokUJphsq1Cx5/8mkgvXcHHjbzxnQ2A63iaPQy/lPjg93bAxoHJWlM5elCPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JCuUXI5L; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JCuUXI5L"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 627CC10E738;
	Thu, 29 Jan 2026 10:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680502; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3pgM6avLqsCtrGK80NsdaWmYzCzxVsls3CgWCMhqdM=;
	b=JCuUXI5LhJvz3XA3QtFZ92Wk2jd4+yJtK2ZWn+UWPC95107rElRbberBdr1cvRzOJCv/N7
	odMfZ5VGzRCynomjSyRoW70z/oi0kVj5aQt/8nUtUL6SwpEWtPge/GSeXotmrUqDnlMfru
	OkoQUc5w7MchZkwrZIkiJRGUuV19vCea5wCamBszOxwGl357E2aEIHoS4uoUhY7QO6l1kn
	zXm/KuPg2wSaxWkCyTnZ77SwpmQIq07goAvvnHJS8VAwcqE6qav3VdZFc4dI+zsMgtqAjn
	JQBOf5CsKGOTIXud6lwzw2VgdmJYwJZGg/TSk6QINYOdO1FHS3epjspblXOYjg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 1/4] clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
Date: Thu, 29 Jan 2026 10:54:39 +0100
Message-Id: <20260129095442.1646748-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The VF610_CLK_END was previously defined in vf610-clock.h to indicate
the number of clocks.

It is solely used in the clk driver to allocate proper size of the clk
table.

Moreover, when new clocks (like e.g. ones for MTIP L2 switch) are defined
its value also changes, so it shall be locally adjusted.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v4:
- Separate patch
- Add comment regarding value of VF610_CLK_END
---
 drivers/clk/imx/clk-vf610.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..457156944c67 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -11,6 +11,13 @@
 
 #include "clk.h"
 
+/*
+ * The VF610_CLK_END corresponds to ones defined in
+ * include/dt-bindings/clock/vf610-clock.h
+ * It shall be the value of the last defined clock +1
+ */
+#define VF610_CLK_END 191
+
 #define CCM_CCR			(ccm_base + 0x00)
 #define CCM_CSR			(ccm_base + 0x04)
 #define CCM_CCSR		(ccm_base + 0x08)
-- 
2.39.5

