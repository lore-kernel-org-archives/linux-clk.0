Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0801A28C;
	Mon, 16 Sep 2024 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477852; cv=none; b=SRPZIoBxIlqJ0WnnjKeUqRmexJ3JOMDqvI+hZHPIOnInAN4hk0gfrVdHswpz/x6SjAdu/Mi7nrp2Lq+qaNrBskNVusNJZ2jwl7wneaaCYzApe6ORpsXKVVM+SHRtbNfsRE1/L2B4q1GOAzSX7DRQtWeszc5/DV7cU+pgi8hLvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477852; c=relaxed/simple;
	bh=HhVA/UfFZpsHqsd2nCV7wZbaAQSuck3g1WZ5ATB/m/U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CiAWyrSbz/534yQLpLlprl4t58nazA8CrahLawbkO7VLG7YGuspzHTez16XsFQ0505CAsqa/M9y6S2ug2Ha0kbRC4Y0aaNZazCPxOvH5X9K+X1j18HAATaJLWg9Xb1iTvM7e7F9m3+OyahTIpZ3k9vJvX5Vu3kdhN2Ld3WQMmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 16 Sep
 2024 17:10:39 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 16 Sep 2024 17:10:39 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 0/4] Add support for AST2700 clk driver
Date: Mon, 16 Sep 2024 17:10:35 +0800
Message-ID: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series is add clk driver for AST2700.

AST2700 is the 8th generation of Integrated Remote Management Processor
introduced by ASPEED Technology Inc. Which is Board Management controller
(BMC) SoC family. AST2700 have two SoC connected, one is SoC0, another
is SoC1, it has it's own scu, this driver inlcude SCU0 and SCU1 driver.

v3:
-yaml: v2 missing send yaml patch, v3 add.
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number.
-dt-bindings: merge clk and reset to be one patch.
-reset-aspeed: add auxiliary device for reset driver.
-clk-ast2700: modify reset to be auxiliary add.
-clk-ast2700: modify to be platform driver.
-clk-ast2700: modify each clk to const clk array.

v2:
-yaml: drop 64bits address example.
-yaml: add discription about soc0 and soc1
-dt-bindings: remove (), *_NUMS, reserved.
-dt-bindings: remove dulipated define number
-clk-ast2700: drop WARN_ON, weird comment.

Ryan Chen (4):
  dt-bindings: mfd: aspeed: support for AST2700
  dt-bindings: Add AST2700 bindings
  reset: aspeed: register AST2700 reset auxiliary bus device
  clk: aspeed: add AST2700 clock driver.

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |   13 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-ast2700.c                     | 1548 +++++++++++++++++
 drivers/reset/Kconfig                         |    6 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-aspeed.c                  |  259 +++
 .../dt-bindings/clock/aspeed,ast2700-clk.h    |  163 ++
 .../dt-bindings/reset/aspeed,ast2700-reset.h  |  124 ++
 9 files changed, 2121 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/clk-ast2700.c
 create mode 100644 drivers/reset/reset-aspeed.c
 create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
 create mode 100644 include/dt-bindings/reset/aspeed,ast2700-reset.h

-- 
2.34.1

