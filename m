Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD7717B50A
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728421; cv=pass; b=A/qS/l+IfGtWWOLAOLncBwZczhK3sH7g2mYSefi6ZMgPaZZVBHeiu6uWbwRFPNtgfKYkk8xGugEVgwvW8P/fIjzvUNCE5K0vLd+8RSfz4OOoIT0AcdWHGm7NdRH1bL6j30XJONRfSYBKS7EhETcFdjqeMz5mJxqEkbUKzhQ3QQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728421; c=relaxed/simple;
	bh=aBp8xR1iTTFcZBMVQ+foO9mCkmwjd/5ncvfXOCgU/6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYyPQp68dclVnxMwOwVEbPI6f2cMVXAVYF5oC9YQMZtMZ/2mqfj2xjoZftkFmO3q4OmBPeXqLk/VIyzXKcq5U49fo9vvFZptE5NTFpVblIh0gThYiG85SWQERhf1ScE7OM+eqHw0fkzNBmZka8OpdF8SLAOakJs9g7QfWVkHsNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NL8hJ/RT; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NL8hJ/RT"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772728406;
 b=sjAB/iBkgoAXuq8GdZllEaAsGHLpHC71wUpMxtR5NAgnp6U0z4vcUqjR0GVll/xi4rIguF4i
 gssPF+zllgfUpkCtPLr/XdB+SKMTj72FbRYN+RbbhWm8IcDMKhah+QkNES8n7frt6pbzKbhilvO
 le8lTraTt01WRIcIvTjpdQRe+PtMQzBqP0uSz+tmSA8i0jVhGXtG7O3gtNnHV+jVmfImm2qtYnH
 ZYjA4LqLDOwG1NGleavCOAHwF3TOemiaogV6WfmugTk1c153iRvqTCw7rHlygLj6Yy6bemNusdu
 OnCyw7KDooWYToCoiKiPIAk2G3vUN3IXSnoMs4Bcqevjg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772728406;
 b=sYCFNslB47VaCf8bFyNJCmZop2Cct6k5ePUpcbvi+ikTu9nVzxbmsB3PGgjKNp+0PaVmdNh0
 W2qfw3YODIyM5G65OsFNBe0Xp/e/iFm3FDgjpyrFfuqDYZS2VJ+uGONQmPVn4EtgdN91lsdq2Mc
 KRZKBo/EJ7D3QetgbC7WNvRFs1Vh4ACMfpkVv6w3frZk+Q8uZIrFVB1zKmcHOzrEzsJiaa/jSqz
 9PbgoX9nb7HvxThJeLD1LjgyLwSZ9fj6iFpMQnjkS5F252ttZCef6HNekZcZWT/V5AwF0Hn4eG1
 vFvfO0SzHZC6peC/RbudZGxK6ml74hX6rSh6DXxAetXzQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Thu, 05 Mar 2026 17:33:26 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 88EA3CC0D36;
	Thu,  5 Mar 2026 17:33:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: imx: fracn-gppll: Add 333.333333 MHz Support
Date: Thu,  5 Mar 2026 17:33:13 +0100
Message-ID: <20260305163314.2642523-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fRZpj1jQSzWj0k
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e09355286075a816d83ad3ff6a06a7b0
X-cloud-security:scantime:1.332
DKIM-Signature: a=rsa-sha256;
 bh=kQ0KzDnbu1PlI/JdLZkDqAqrxLxl5G06+OR7mjHBzrw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772728405; v=1;
 b=NL8hJ/RTC9ewmEsulo+lSC/Q3DAxNKp2+vSc3nJRvN0+UHlPDdyUqZYnABJVlvLVucgJ1V5P
 gxsnP9MiQrgDWuLaERdwxReR+MCq5DIu4994DG7TzA8vaERISg6J5uhQFcJ4+4loOhqQfBivZOk
 u87q1padf384FW8BoUJQMUBwQ8GtDwxRIeIfJ5t/bE3iuyE5h4ATGKxLFeAuC5Xeq5DOtN7fAAO
 pFv0eB3eqsqEzW0/vclSTUtk3FuQhT8l0chP7iRH/peuSg9UbCe1DsGiVzY8VC9blkRB+sjx4z4
 r/IvaNNro4OHdQW+9Vu1Ykx1yV0hSg1gqSSgVhmIgDnMw==

Some parallel panels have a pixelclk of 33.30 MHz. Add support for
333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 89ed7749bf47e..fe6ee77ba1485 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
 	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20),
-- 
2.43.0

