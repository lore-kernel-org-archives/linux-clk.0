Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446D364035;
	Fri, 13 Mar 2026 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385668; cv=none; b=nznyRIzEh/fGjwM4zw9tgjTnZ72lyEvlXU4E2SUod+yKuu75eSnDJmcF9qlBvgYD1PzuoYEC4mmtU4JaSdZoNXt1NuUtEKIFkGkF4jRtIRpdjje6w8DIg/3aN8z3b7BftWzwc84UlsTF6FvHwD1zAa5s1+r4fpUpbCg7Hg7JZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385668; c=relaxed/simple;
	bh=z6u96ssWX3Cd+QLEJ+Me1atRxrEW6w2WxuMO74kiGs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fktgvNvdtlouOWQYvea48h8cQWPqkwgcVWzD0UHrPQYwwiaYURr9/8Ll/4UW9C7amnCdT0i9jAhHQFseavOM/aXRAdX0fKYrbyHxOHlk9BLZK/b2jgSnoKsSDTYI/zeGhP+bFLuF4vBZE8gTNEMiVTCMcJkXgFVIEv2ePR1OpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fBe/aQSZ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fBe/aQSZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QculMYzqOcVS5jqBwThraH5L2YlIJzL3vCNO5HmuC5E=; b=fBe/aQSZPtuW8bVkeLBXabxaIe
	pcfA5/L23ACYF8jF4e2UA8FHmzb+N+jyek7vMjJ05znqfmf+kDxMJcPYi6cKI5lNogI+JiRQutoJo
	NZp6G6psGHWXNIYslCRKQjMTTyjW6cVRyuFSbwW8T3aMZRiD4GD2JJhvvfa9+GII7vjaV8s8jBjcQ
	WPgqulUyco1R+VgT4g5DK+wZDhqr3zXzHjSMqJs43qYc0wRuZh7QVFH9IvQmKXFqNwEL+5y7AwOFv
	X4ae8pIm7hyO4mpBMqL8EVfauj+8mbVlYqFBRJmigYsDxnbH8vO9A77QNEGyc4ca5pVv94YQ/BB2q
	SGCkyp1A==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcb-000CVJ-17;
	Fri, 13 Mar 2026 08:07:45 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wca-000IYT-2H;
	Fri, 13 Mar 2026 08:07:44 +0100
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
Subject: [PATCH v2 2/6] clk: imx: fracn-gppll: Add 477.4MHz support
Date: Fri, 13 Mar 2026 08:07:32 +0100
Message-ID: <20260313070740.585043-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Add the 477.4MHz frequency support that can be used for display with
pixelclk of 68.2 MHz. The divider of 7 is important for LVDS output on
imx93. It is also usable for parallel output.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index fe6ee77ba1485..4048c16c0578b 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -85,6 +85,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(519750000U, 173, 25, 100, 1, 8),
 	PLL_FRACN_GP(498000000U, 166, 0, 1, 0, 8),
 	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
+	PLL_FRACN_GP(477400000U, 119, 35, 100, 0, 6),
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
-- 
2.43.0

