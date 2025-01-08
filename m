Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933A61F63E3;
	Wed,  8 Jan 2025 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330140; cv=none; b=uf5bHnzD5pC6fzhb0keeZlJ+qKBuZfGzU5jmo9gRCQPOPjfT7Gpq6pfZKuMGeO47Fwb7L6y5dRuLs0Fw/FwBhbErUSvsiQLBZZIcwmmYpWP4wf/VV7omc9gAg2ekXrXEVzEVeyBi45UXgoeEah3w3S5OCRNSPAKrBPx6ekyuXh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330140; c=relaxed/simple;
	bh=5spmVVgRAeG3CJm5Rz+zOc5mQdu90lpzu3wLhl7iYuA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SSbyPy2a3JZxhv78BvIDfN7W7vfvtllATzTH2e4TrRVUFresrS3Pb0mijz9t/PZX0Y4c4dgtrU5ICJpE5z3+G/Pgm0VhRV9dmorgS2MxOeluhaheYEj1FgnotLkYZ+OOHzqhuTMvmCu0JPfxhm7miZeD1glwjg9U/LeY+/byDzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Wed, 8 Jan 2025
 17:40:27 +0800
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
Subject: [PATCH v2 0/5] add support for T7 family clock controller
Date: Wed, 8 Jan 2025 17:40:20 +0800
Message-ID: <20250108094025.2664201-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It introduces three clock controllers:
- scmi clock controller, these clocks are managed by the SCP and handled through SCMI;
- PLL clock controller;
- peripheral clock controller.

Changes v2 since v1 at [1]:
- add CLK_MESON import 
- add const for clkc_regmao_config in pll driver
- fix eth_rmii_sel parent
- update T7 PLL YAML file

[1]: https://lore.kernel.org/r/20241231060047.2298871-6-jian.hu%40amlogic.com

Jian Hu (5):
  dt-bindings: clock: add Amlogic T7 PLL clock controller
  dt-bindings: clock: add Amlogic T7 SCMI clock controller
  dt-bindings: clock: add Amlogic T7 peripherals clock controller
  clk: meson: t7: add support for the T7 SoC PLL clock
  clk: meson: t7: add t7 clock peripherals controller driver

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  111 +
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  103 +
 drivers/clk/meson/Kconfig                     |   27 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/t7-peripherals.c            | 2323 +++++++++++++++++
 drivers/clk/meson/t7-pll.c                    | 1193 +++++++++
 .../clock/amlogic,t7-peripherals-clkc.h       |  231 ++
 .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   57 +
 include/dt-bindings/clock/amlogic,t7-scmi.h   |   48 +
 9 files changed, 4095 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

-- 
2.47.1

