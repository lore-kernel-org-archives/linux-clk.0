Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE7D1EE7C6;
	Wed, 11 Mar 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239571; cv=none; b=PO3XGpRFkvQPSsY2wo43QZqVjAiATG1hJrM7xw0TypdQVaBZZvHcDv5c5wPAAb94uJwdRUCPu7yQkNOEnr8rPHVWCHWm3xvt7K911+KGUpbKIW2/u0fwZgNDaFD50Ts9CiK95eoxLswe1MNf685yymraWBRpeekaRl5HV3LVZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239571; c=relaxed/simple;
	bh=wCEZMFEIe9N1fRThoO8UVaTOZnxRpccdK7arnQBKo6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzIo94FE5xC1Q26PX/oYRMumaoq0BdR/jhdDulvGIh8/49bIZV49RASn+LjAQOEGmyG9veu8rWWNpL/ZHgiRtJyW/v6zLaASgT3f6I+ijxo8BAA8+sVa2WZUATyXOIoxoBXcIr4snLt2mHzZVKwcm5X5Jv6JrpzEt8zwGC/8h5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OCbYZYhZ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OCbYZYhZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Kkt3A1e6l/KLgh24uOCTImlNQ3maInjpGSRh0bHez1U=; b=OCbYZYhZQZHRhApD9dltpqMqGE
	exnAuIcBSkHoBUv8XAPktsZGgy+TznUd2rbhWKCmRQyAfyzF1GSV9gTahWyfEPFgDSl07LG/lSxgf
	HuR2ZKlys9vb/3zv0T2FgDun2nTOWbllECxBs83qQNnQoyEHqQULl3r4Uf+gck3NzmtCZclWL1Wjt
	OKimXou+JaXkpAvx46qICQKiJvtmU8JE29+b9r2vEvxOrrSO/51/quZtmVimgEIQdQ/0U1uRaE91u
	FmZNY6I9cl68khuX2aXXDb9hWmwjZ0rj3cXv3CYvJ0RBQnCFucXRTg5BbZlWvPE6PsG9INRChP8ho
	Qka1h+xA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kc5-000Or3-1z;
	Wed, 11 Mar 2026 15:32:41 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kc4-000GoI-39;
	Wed, 11 Mar 2026 15:32:41 +0100
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
Subject: [PATCH 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Wed, 11 Mar 2026 15:32:03 +0100
Message-ID: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)

Hi,

this series adds support for parallel and LVDS displays on MBa91xxCA, both for
TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].

The first two patches add required (Video) PLL configurations to achieve the
necessary pixel clocks for both displays.
The last 4 patches add the overlays for TQMa91 and TQMa93, although the
overlays for TQMa91 use the same overlay for TQMa93.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de/

Alexander Stein (6):
  clk: imx: fracn-gppll: Add 333.333333 MHz support
  clk: imx: fracn-gppll: Add 477.4MHz support
  arm64: dts: imx93-tqma9352-mba91xxca: Add parallel display overlay
  arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
  arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
  arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay

 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 ...3-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso | 56 ++++++++++++++++
 ...93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso | 66 +++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c             |  2 +
 4 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso

-- 
2.43.0

