Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F737E2EC;
	Thu, 29 Jan 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680951; cv=none; b=fEWIlcEvZ8/3bAtdnAXV9YNXpzedqI7JzL3O8nazEGYoR0pQT1IWoZkMBYt7gjhML2LT90f9JLMlQCZw7KHwWWl/IBboMCgW9e/UuzaWM9Oo2B/6exAOb5HRgsuXZUg0xrW0+KVbXJe2AvHkMDq0sZB2TQQLguQ9tGkJyBIqZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680951; c=relaxed/simple;
	bh=YPXowlMRj5xHqun6D/AYKPRcLJcRYokVA1SxHCq14+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=plzGu02xO2fINIudDSQjKT3Bb5hLs3wAH/k2FHjJlov/Tfauco0cAamN9YBdyMDq5wnm/tjkfoSQKepXIcaI1OfSdSMA0FA5v2gHR1jVrwF+5f+VtdwEpD5F6cZrpJldJ521t5ZRVn7v/CQLIH9Z1TP/15N+ATFbHe0DKc3PbbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fEbSVsxw; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="fEbSVsxw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E680810F4FD;
	Thu, 29 Jan 2026 10:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680500; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TNf7l43MX55crtLyATkZX7s/kbESvyujXOEVyv/5/Yc=;
	b=fEbSVsxwx5FJdG0tkvHTWRAJdGY72k44WhwRUeb6ayrhzX85DL6K30IPTbc31xy5rFoFhq
	osVlRlOfEUCno5Gtung0eSw9X+vTbu7Q5AcyJnrpVdmF++wZhWXDKJOPoJqxolHwQIk25c
	TrNH0H7dy9M+KVPKVzg9wWkXalIu6ZC9B+u5Cr1ND9cI/WHbmaVS5OppXJgAnLLQr/TQj4
	Ajm9EF3GmUBfiLukKLFVOcSsuRQ+kYTpeGPmONkXoVClgM9kABA3ulewJY+u3vpXFchxg1
	G0LHj9wv5d+t5Whsy/g4vp2mcPZB6tCVKZ+/QzIzqYY/j6RpMfcsT0DGxEijYQ==
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
Subject: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Date: Thu, 29 Jan 2026 10:54:38 +0100
Message-Id: <20260129095442.1646748-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This patch series:
- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
  to driver code
- introduces support for several clocks required by MTIP switch IP block

Lukasz Majewski (4):
  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
  dt-bindings: clock: vf610: Drop VF610_CLK_END define
  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
  clk: vf610: Add support for the Ethernet switch clocks

 drivers/clk/imx/clk-vf610.c             | 12 ++++++++++++
 include/dt-bindings/clock/vf610-clock.h |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.39.5

