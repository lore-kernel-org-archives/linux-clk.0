Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21A37F728;
	Thu, 29 Jan 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680952; cv=none; b=cjW3tJBQowR37zWiDAm1VoHIjhrgePmZMAXVmdNdxlAP33TNHbYe4Ux36eg4DfPb+qDFKhFQrW2KzF5U1hPCBn+G4tnA4Q9byRAT27wPejWDAWHhSxwDThCxCz1GsoGsS4l1Ggn3veO7a0jth/CE6hTijxdW17uAxPVYxq/nwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680952; c=relaxed/simple;
	bh=CmSpETRcIzwY4tZopGHm5gWk97+Cn9LeZW2zvBVgq60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N0xZvaAu+YKIobl77GbA3hnVDQgMk/TNabU+O8cJzgdrChLycw/qCAEnt/RQdNs03n1RLy0c9dEK9zEU8oX8xbh6+PvnT2+Z9rn9zre8rViiCbhp9ufCdFqbnCOaiNSd379wrHcU6b9SyLHr7mWuH6ZPDuICqSbGg6jCAJPGQH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=X+yQ6ZuG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="X+yQ6ZuG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD67B10F7AF;
	Thu, 29 Jan 2026 10:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680504; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=TLJaerXYvnpdMf7J9w74jiDoCWj2bcuZe3+nMmYuDnE=;
	b=X+yQ6ZuGn+yS9bESPkdaopJOYwR6cOZWhLOnf0qmkl5nQdrJ6EjwrDT672CD6zrunULtKq
	NqdLgcPFIjkSVG3uc4rfL7GY+WG3DA43aZ8/MQReE4jyj5zMTAy+ftp7jAMtJHrRCoEbFV
	48jA5J8cXS4/EFlp2UQLPBw4SxLBEIBmI+q3E+F8tG2JH5OTUEEQoO6rDl1JWDM833KsoL
	d2+UBNHIpqFi1md+CN3nHlPwT9v0bJQqCPKcLUbzgm3NN/xqvFvyH1MsVbL425NMo7hC5H
	IXCykC2d8IvgF4eFCyRa5sHUThvuhKY1oQQHQn+mdCs6JAWmY33r5XEMLDvZ9g==
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
Subject: [PATCH v4 3/4] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
Date: Thu, 29 Jan 2026 10:54:41 +0100
Message-Id: <20260129095442.1646748-4-lukma@nabladev.com>
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

This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
macros definitions for L2 switch.

Those definitions describe clocks for MoreThanIP switch IP block;
the switch itself and the MAC address lookup table clocks.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v4:
- Do not change VF610_CLK_END
---
 include/dt-bindings/clock/vf610-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index c91fb86fa9a1..5d94bd561a2e 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,5 +197,10 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
+#define VF610_CLK_ESW			191
+#define VF610_CLK_ESW_MAC_TAB0		192
+#define VF610_CLK_ESW_MAC_TAB1		193
+#define VF610_CLK_ESW_MAC_TAB2		194
+#define VF610_CLK_ESW_MAC_TAB3		195
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.39.5

