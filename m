Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B01E882B
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289816; cv=none; b=QgWBzH3T4UplN06a84fU9QWrgJkFcP6tNsp1Cst9e6cS9swgc3m7F0PfqrevI2bnbyxVylVjKOMQ4FInU0VMZLT1AROHeM7tALd7biWknr5fQHqJb1VhpsrP1chiQY7nS0FzQidIC02W6QyrOtQX6B3TR34RVSMdHlw4K8KIGXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289816; c=relaxed/simple;
	bh=JY2oCrHIfhPJlZMIwcdNkVKSXrp1Y2lDTuMSPbRIb/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J9kbB9fiuDoOwq9ngkHaPn78L/lzgZlVsptMTzZkPDiHw+rS6horUjoIkkNhCKcS8xiVnjzgVeMOnCziEbOLs7XhgaQirDmtSE0RAdlPvXbY/ZJNgZDcmU0X3K+UX5Aywo2AZO/yWvg2CBMWVGAzxf9JJcNfmd3KHhXaoPRMsRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1t67Pu-0005ni-4E; Wed, 30 Oct 2024 13:03:14 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/2] clk: socfpga: add clock driver for Agilex5
Date: Wed, 30 Oct 2024 13:02:58 +0100
Message-Id: <20241030-v6-12-topic-socfpga-agilex5-clk-v1-0-e29e57980398@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHIgImcC/x3NTQqDMBBA4avIrDuQxJ9qryJdJNMxDhUTEgmCe
 PeGLr/NexdkTsIZXs0FiYtkCXuFfjRAq909o3yqwSjTadUqLANqg0eIQpgDLdFbtF42Pnuk7Yt
 Px7ZraXST66FWYuJFzv9hft/3DyzwQ+RxAAAA
X-Change-ID: 20241030-v6-12-topic-socfpga-agilex5-clk-7bea43c8b9b5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, netdev@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Teh Wen Ping <wen.ping.teh@intel.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The Agilex5 clock tree is compatible to the existing s10 drivers.
Therefore the pll,gate and periph drivers can be reused and only the
main clock tree is added.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Teh Wen Ping (2):
      dt-bindings: clk: agilex5: Add Agilex5 clock bindings
      clk: socfpga: Add clock driver for Agilex5

 drivers/clk/socfpga/Kconfig               |   4 +-
 drivers/clk/socfpga/Makefile              |   2 +-
 drivers/clk/socfpga/clk-agilex5.c         | 847 ++++++++++++++++++++++++++++++
 drivers/clk/socfpga/clk-pll-s10.c         |  48 ++
 drivers/clk/socfpga/stratix10-clk.h       |   2 +
 include/dt-bindings/clock/agilex5-clock.h | 100 ++++
 6 files changed, 1000 insertions(+), 3 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241030-v6-12-topic-socfpga-agilex5-clk-7bea43c8b9b5

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

