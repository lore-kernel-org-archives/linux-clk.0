Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EBF381AF;
	Fri, 13 Mar 2026 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385543; cv=none; b=Ch+QgGHsv1IeA9C5glSIm6og+j8xpKoAoSkiGDRP+glCWRMYtxtgk3UbC6wM0oZSVLp7gNP9tSwUwkN7Say4c2sjr17DYm2//crbzFP7ntplFhvs/X9kijf/nXB/GM1Rq5/M6wA98R+bFnlCOxNaK1jlbVys/uQXAmVOVCPRPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385543; c=relaxed/simple;
	bh=07HMM8eUN0XXLisdjDFI7UuHqKzgfQTJqHd+9PmnYdg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o61rAKVJ/fYzBCr1KUxRW5WzbRyeknBbQmK111K+N7trEod0TbFgUt3F+Jnf+g2n7Qp/PAc5RcvvZxJXjPEPRigEFztOAQHV61bJPds3p5B5bDzletS7lAF15WKzNuyNP5Jcmj/r1OPtwQG7phRBSsJzY6CImt++MsfPtG0SYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 12 Mar
 2026 23:59:36 -0700
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
Subject: [PATCH v2 0/3] Add the missing mpll3 clock and clock controller nodes
Date: Fri, 13 Mar 2026 15:00:19 +0800
Message-ID: <20260313070022.700437-1-jian.hu@amlogic.com>
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

- Fix redundant hyphen in for gp1 pll
- Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
- Add Amlogic T7 SoC clock controller nodes

Changes in v2 since v1 at [1]:

- Add Ronald Claveau's Signed-off-by to the first and third patches
- Fix compilation error for amlogic-peripherals-clkc.yaml
- Update commit message for amlogic-peripherals-clkc.yaml
- Add Fixes tag
- Remove the blank line in the watchdog node of meson-t7.dtsi
- Add 'reg' property to sram node
- Add a space after the clock controller label

[1]: https://lore.kernel.org/all/20260305074328.639993-1-jian.hu@amlogic.com

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

