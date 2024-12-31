Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5D10F9;
	Tue, 31 Dec 2024 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735625769; cv=none; b=MdzmBvC5+V45cXe8S8bD/EvXCU0cL/BqAwi1e38Pw8L4GQWf7ffnc1k2Cr1XO/eRYSSu4zLuq3911ftk9uH8cRn5PbmOLDH8ojeOFgWglneqguGCxJmjdDTDavPkVqM9xlcLVg3OJTSl4t6cnal3hAzcjr5L/OaVFDdkcIcw9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735625769; c=relaxed/simple;
	bh=iA6It8tuCHaIX5ztfjwkGUtuhq3cqw4YnmFJV2bHc4c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A4Rz+HPiZFfnkNQrHADiYGVJOYFGvId/uvdC8ECaYNxcHsb0PoNJ0qyS/0h/fDYq19QCxz8WEOi4w2hFxsGjrPFJCAgifu4XaFC4TcLEMHDPDaZq1FFKZPNpcXoJfbD4umanxP70ifmVmiHE54EWE5RMPjrnljk7J5ISuQoMKMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Tue, 31 Dec 2024
 14:00:50 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/5] add support for T7 family clock controller
Date: Tue, 31 Dec 2024 14:00:42 +0800
Message-ID: <20241231060047.2298871-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It intrduces three clock controller: 
- scmi clock controller, these clocks are managed by the SCP and handled through SCMI;
- PLL clock controller;
- peripheral clock controller.

Jian Hu (5):
  dt-bindings: clock: add Amlogic T7 PLL clock controller
  dt-bindings: clock: add Amlogic T7 SCMI clock controller
  dt-bindings: clock: add Amlogic T7 peripherals clock controller
  clk: meson: t7: add support for the T7 SoC PLL clock
  clk: meson: t7: add t7 clock peripherals controller driver

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  111 +
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  115 +
 drivers/clk/meson/Kconfig                     |   27 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/t7-peripherals.c            | 2319 +++++++++++++++++
 drivers/clk/meson/t7-pll.c                    | 1192 +++++++++
 .../clock/amlogic,t7-peripherals-clkc.h       |  231 ++
 .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   57 +
 include/dt-bindings/clock/amlogic,t7-scmi.h   |   48 +
 9 files changed, 4102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

-- 
2.47.1

