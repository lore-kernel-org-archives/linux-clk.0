Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D163446CA;
	Thu, 26 Mar 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517528; cv=none; b=cEjCD0glSwkqXJ6UnNplBu86byUuFkRdPhlvakGz10ApVpktcsjMepkqts8vttXOHPA7sCB7SuN6RwX7YpBQkSvNXlLF0f0wBdZK3YI98rDAmVt4xZyDDXv8R8ZDclnr2JxVIwZ8jCCQ7LGHpjHtdt9bOi0DfnT2WEEHEKCE3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517528; c=relaxed/simple;
	bh=5Wn8pMnSHriyYN9VcgOgkUBmSD7wDP6882vdHQNfcAE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S2raEnsTTE8S1NlVUC+gZalKD7qHWutjGzV4YtEPKqBjnvn5SN7q97AQW5WZy/mWrqwp3c1tfbGa/gKjyBTmmh7gkk0F2uD6yG5Uxu+JNMwelg2PtjoOaxD83a/b79LJxLGiIh/VzSBWDK9jhthw34KRGyXTBbzoCUDVoN11NbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 26 Mar
 2026 02:25:58 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>, Ferass El Hafidi <funderscore@postmarketos.org>
Subject: [PATCH v3 0/3] Add the missing mpll3 clock and clock controller nodes
Date: Thu, 26 Mar 2026 17:26:42 +0800
Message-ID: <20260326092645.1053261-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)

This series adds the missing mpll3 parent clock and completes the
Amlogic T7 SoC clock controller DT support.

- Fix redundant hyphen in for gp1 pll
- Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
- Add Amlogic T7 SoC clock controller nodes

Changes in v3 since v2 at [2]:

- Move Ronald's SoB tag to the top (as original author of the base patches)
- Add Krzysztof's Reviewed-by for Patch 2
- Update cover letter structure for clarity

Changes in v2 since v1 at [1]:

- Add Ronald Claveau's Signed-off-by to the first and third patches
- Fix compilation error for amlogic-peripherals-clkc.yaml
- Update commit message for amlogic-peripherals-clkc.yaml
- Add Fixes tag
- Remove the blank line in the watchdog node of meson-t7.dtsi
- Add 'reg' property to sram node
- Add a space after the clock controller label

### Background
This series is based on Ronald's initial T7 clock series [3], which aimed
to enable T7 EMMC DT but lacked a complete clock controller implementation.
The T7 clock tree in Ronald's series (fixed PLL, fixed fdivX and sys clocks)
is handled by the SCP firmware via SCMI [4]. Therefore, his clock drivers
do not need to be added. I have discussed with Ronald and agreed that I
will submit the T7 clock DT first, then he can proceed with his EMMC work.

### Series Overview
1. Patch 1: Fix redundant hyphen in amlogic,t7-pll-clkc DT binding
   - Based on Ronald's "[3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support"
2. Patch 2: Add missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
3. Patch 3: Add complete T7 clock controller nodes
   - Based on Ronald's initial PLL and peripheral clock nodes
   - Remove unused fixed PLL node
   - Add PCIe and HDMI PLL nodes
   - Add SCMI clock nodes for clocks handled by SCP firmware
   - Update fixed clock index in peripheral clock nodes
   - Add gp1 and mpll1 clock index in peripheral clock nodes

### Dependencies
- Patch 3 depends on Patch 2

### ABI Risk
The amlogic,t7-peripherals-clkc DT binding was merged in v7.0-rc1 [5],
but the corresponding Amlogic T7 SoC DT has not been submitted upstream
yet. Thus, no real users or systems are affected by the DT binding ABI
breakage in this series.

### Credit
- Patch 1 is based on Ronald's "[PATCH 3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support"
- Patch 3 is based on Ronald's "[6/7] arm64: dts: amlogic: Add clock and EMMC for T7"
- Patch 1 and Patch 3 retain Ronald's Signed-off-by
- Thanks to Ronald for pointing out the gp1 pll typo and initial clock work

[1]: https://lore.kernel.org/all/20260305074328.639993-1-jian.hu@amlogic.com
[2]: https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/
[3]: https://lore.kernel.org/all/20260218101709.35450-1-linux-kernel-dev@aliel.fr/
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/amlogic,t7-scmi.h
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml?h=v7.0-rc1

Jian Hu (3):
  dt-bindings: clock: amlogic: Fix redundant hyphen in
    "amlogic,t7-gp1--pll" string.
  dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
  arm64: dts: amlogic: t7: Add clock controller nodes

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  12 +-
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |   2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 125 ++++++++++++++++++
 3 files changed, 134 insertions(+), 5 deletions(-)

-- 
2.47.1

