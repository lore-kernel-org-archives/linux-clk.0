Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9D7261A
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241616; cv=none; b=qgrIQ01j31+C+oeSXMFojryZN9ajNE1LhVOcDB4SJcn+D5Oy+DslJF2fhW7eWUphKyNvpl0C6VYZiUzFdlQaoRON08lee22K8fYnsDMvD9mkp4UhK0iK3T3GszUvZleHXJP5FqSkZKrIQBIIu0eGRY/MM4idba+IQxJgql2Q6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241616; c=relaxed/simple;
	bh=5k3j6TyOgnw+p/MGx+/JP6KVxppwh0ZoXJqEFM9+zCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbG76a7xDOzGFnMMw7jrUy3C9HmirdLAblRO3mVyqiX4bkyqjwkKBFzBZ8Gm9SqmBeQADsykYw8TwzUBHz+DmWYsAQ2WwRXYLGHEhvZSkVdaxqu5pZYxlmKfxsk0kYX17Cxa7+jPigJVyySdsgEm2y4NW7y09nx/YwupdxjUCRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k97OotMz; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k97OotMz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6PdZxm8Bv5Fbg4zOWMT2q2pQephq0yrmqiozPXOooSw=; b=k97OotMzaQz1BjA29wfuhZEXkP
	erNZdJmdZk2xUASWVECRZRpVjFYXaG+bStBQrvzhw4BZ/q1jNEuhriR66GHUUPENVs4fShIq625iY
	emp46hlEdmb/51vta9GfyPhL/vAo+Xqe/2kVzh4bxWIJjZ915HLw+JW9d7sT28eo6MLC3a776SF8i
	Kz10477fL5+Y24UcIzjuiIQ7PGU3R6Ki6lsDYXwlg6fXmXQuF0e40OhNB2m/GfXO9EM4vQGJUKs7u
	q/15SIvBewwDVS7V+gjPZHY35layRSFDN51ajZkYWkkmtXq2kVEiXFAGzQsn27vWmpDdRslCr3avS
	UQxrNOTQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KcF-000Ow5-38;
	Wed, 11 Mar 2026 15:32:52 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KcF-000GoI-14;
	Wed, 11 Mar 2026 15:32:51 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay
Date: Wed, 11 Mar 2026 15:32:09 +0100
Message-ID: <20260311143217.1700704-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)

This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
on MBa91xxCA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 64fe9487b1003..60aafadce0725 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -418,7 +418,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 
+imx91-tqma9131-mba91xxca-lvds-tm070jvhg33-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
 imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
-- 
2.43.0

