Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF8254B18;
	Fri, 21 Nov 2025 02:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763693531; cv=none; b=D4vuGBzaCGLLl+ZBG+NA3Hwxld9HDXMYoh3KBAPgjPk7FJwL7PJmDlqoIWZ5EhXwerd7GO8/H5GtPCJ6a+NfGSGZT7DZdrQT0ZYK2CsoC+CBrIsYpSvo5wrAK7fCnaS1KGP/WyzX/IuVaBEy2lGgMqnjHRJ95fDadfoNhh+QTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763693531; c=relaxed/simple;
	bh=8brKe6TkCYFhYs7p0PO4bS6+PhI2Tma8a4+pvXPDMV4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ujIX4o8HphcvNuhwhK45uuDvvWdQQwgmDjshSppaVpmepCuEVB7I7muuDr/WZoIb4z1XN1tTzZ4Ru29SIseCOOf7tQNm9hwGndJfLLqVgiGIn8Ax6ve9v7tVrw3C5PIyTctIdVlSU5V2RawKGNHT+ZBloCnTjMO5G2xvjmaP/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Z74p3DZF; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Z74p3DZF"
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a5cdf301;
	Fri, 21 Nov 2025 10:46:48 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	finley.xiao@rock-chips.com
Subject: [PATCH v8 0/2] clk: rockchip: Add clock controller for the RK3506
Date: Fri, 21 Nov 2025 10:46:43 +0800
Message-Id: <20251121024645.360615-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aa44ea4fd03a3kunm5f873c0f1ba297
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08dTlYdT0wYSUlLGkoZQ05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Z74p3DZF2wn1qCFMHAjl+Gwb0C/ruJLkajUf/PJXymAMGEWwirnkdI9NrCObyFi37dS9SbmF5+7gDubCyHpAdVJ5EDDPqWVYVrTc3Z9qhcDFvybT/9ZxeL2IDF/A0K8yvSGZ3zkv5uHPM4ia3s1BtB4cT9twmkPXo51yQ7M9DV4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qwpUKm/T5N1XVGyOtAgJHx/jvuawl71cXH7S4pr1eec=;
	h=date:mime-version:subject:message-id:from;

[PATCH 1/5] ~ [PATCH 3/5] has applied.

Change in V8:
[PATCH v8 1/2]: Add explanations for "clocks"
[PATCH v8 2/2]: No change

Change in V7:
[PATCH v7 1/5]: No change
[PATCH v7 2/5]: Redefine clk id(start at 0), drop RESETN for reset id.
[PATCH v7 3/5]: Drop RESETN for reset id.
[PATCH v7 4/5]: Fix "description: |", drop RESETN for reset id.
[PATCH v7 5/5]: Drop RESETN for reset id.

Change in V6:
Drop pvtpll, others no change.
There are many questions about pvtpll and have some dependency issues.
They will be submitted separately later.

Change in V5:
[PATCH v5 1/7]: No change
[PATCH v5 2/7]: No change
[PATCH v5 3/7]: Drop RV1126B_GRF_SOC_STATUS0
[PATCH v5 4/7]: Drop syscon
[PATCH v5 5/7]: No change
[PATCH v5 6/7]: Add clocks and clock-names, fix id define
[PATCH v5 7/7]: Drop RK3506_GRF_SOC_STATUS

Change in V4:
[PATCH v4 1/7]: No change
[PATCH v4 2/7]: remove label
[PATCH v4 3/7]: No change
[PATCH v4 4/7]: remove label,fix order
[PATCH v4 5/7]: No change
[PATCH v4 6/7]: Add yaml and dt-bindings for the RK3506
[PATCH v4 7/7]: Add clock controller for the RK3506

Change in V3:
[PATCH v3 1/5]: No change
[PATCH v3 2/5]: Fix define error
[PATCH v3 3/5]: update driver,fix errir
[PATCH v3 4/5]: fix error
[PATCH v3 5/5]: No change

Change in V2:
[PATCH v2 1/5]: update commit message, rename v2 to multi_pll
[PATCH v2 2/5]: Modify DT binding headers license
[PATCH v2 3/5]: update driver
[PATCH v2 4/5]: fix error
[PATCH v2 5/5]: update commit message

Elaine Zhang (1):
  clk: rockchip: Add clock and reset driver for RK3506

Finley Xiao (1):
  dt-bindings: clock: rockchip: Add RK3506 clock and reset unit

 .../bindings/clock/rockchip,rk3506-cru.yaml   |  54 ++
 drivers/clk/rockchip/Kconfig                  |   7 +
 drivers/clk/rockchip/Makefile                 |   1 +
 drivers/clk/rockchip/clk-rk3506.c             | 869 ++++++++++++++++++
 drivers/clk/rockchip/clk.h                    |  13 +
 drivers/clk/rockchip/rst-rk3506.c             | 226 +++++
 .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++
 .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++
 8 files changed, 1666 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3506.c
 create mode 100644 drivers/clk/rockchip/rst-rk3506.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h


base-commit: 4f0744c46de2c40e7a8f35d730e322bf33f2bb63
-- 
2.34.1

