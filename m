Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EAE199FD0;
	Thu, 19 Sep 2024 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726737117; cv=none; b=buNWBao+5UzlnVLzQIp337aXy8/8eEbhLL2IiIRmuGRr8CuF8zbXxhlRcOjFRp4ywlmlG35X9qMPumJBGvBl6y5k8PB43WDFWnx0QCoBMg3nCI5zWcTS+I6RrQUm2Jnt6/Aihn0j4tNoiLyiZTMdaPUd1i1hTJGQSboeLVQa3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726737117; c=relaxed/simple;
	bh=pNaf7kLwQz0ZXW1YTJO3AvZykLEvEWfqetO/wNMvKO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECWyClSARUFKZ3IrzyY2zHunMh1gcdoci9aJZy7hnwSMkL+6zFWxhkfuR4RBR/xVwsyvE+EA1QQuWRZSEPYqChX72L+AZjhCL2w7xT4/ioCyFPMaSH7kZm3lHOJvDMv2BxCqDeql/y52VrM3lVJ3b+iemYPXXmITPWffKgHFt/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cy/feXQK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cy/feXQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726737107;
	bh=pNaf7kLwQz0ZXW1YTJO3AvZykLEvEWfqetO/wNMvKO4=;
	h=From:To:Cc:Subject:Date:From;
	b=cy/feXQKL3OC3cDGxm1U2KdxCwlOLI6/oIb2sKRdp3WkBcbRfjOshWDxLI1n1FA36
	 PIQW0XR0vs2smFCB2AJpIA1M7wFqqM8oyAu3HehQnv4+H1Di/v2UEEYPvxOOVz1ssN
	 gmy7wCyZf7D9Ctb/Q8LZiHJVjdHUaqUy5fqsvy0+T6rjcPTl4bocgZOvVoxhfdt8M4
	 YdStS1emcDwSvr0v6jINHR3vPiIg2xMhUrmn3TiDqg3Vl4Skr/XGhFOTCfPIkDKxR7
	 +I3Bxx/Xe2PC0DNwdkXrMgkPs3iDKF0CBs+KE+rGjAcAWoqg07oTTPPQdmz3gVeiV6
	 GBPggaluXozdQ==
Received: from jupiter.universe (dyndsl-091-248-208-160.ewe-ip-backbone.de [91.248.208.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D1A117E1073;
	Thu, 19 Sep 2024 11:11:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1F97D480076; Thu, 19 Sep 2024 11:11:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v11 0/5] rockchip: clk: add GATE_LINK support
Date: Thu, 19 Sep 2024 11:09:43 +0200
Message-ID: <20240919091129.83500-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This implements proper GATE_LINK support following the suggestion from Stephen
Boyd to use clk PM operations by creating MFD dynamically. This required some
restructuring, since CLK_OF_DECLARE() is called before devices are available.

Apart from improved power consumption, this fixes the runtime errors from the
pmdomain driver (failed to set idle on domain '%s').

Changes since PATCHv10:
 * https://lore.kernel.org/linux-rockchip/20240913184720.57381-1-sebastian.reichel@collabora.com/
 * make struct platform_driver static

Changes since PATCHv9:
 * https://lore.kernel.org/linux-rockchip/20240325193609.237182-1-sebastian.reichel@collabora.com/
 * drop patches 1 & 5 (merged)
 * keep reporting ENOENT for missing clocks after CRU has been fully initialized
 * drop module remove support for the linked gate clock driver

Changes since PATCHv8:
 * https://lore.kernel.org/linux-rockchip/20240126182919.48402-1-sebastian.reichel@collabora.com/
 * rebased to v6.9-rc1
 * dropped all merged patches (i.e. all but the last one)
 * rewrote and split the final patch
   - should be easier to review
   - properly calls pm_clk_suspend/pm_clk_resume
   - now works on Orange Pi

Changes since PATCHv7:
 * https://lore.kernel.org/all/20231213185114.47565-1-sebastian.reichel@collabora.com/
 * rebased to v6.8-rc1
 * Collected Reviewed-by/Acked-by from Krzysztof Kozlowski for DT binding patches
 * support nr_clk=0 in rockchip_clk_find_max_clk_id() for smatch

Greetings,

-- Sebastian

Sebastian Reichel (5):
  clk: rockchip: support clocks registered late
  clk: rockchip: rk3588: register GATE_LINK later
  clk: rockchip: expose rockchip_clk_set_lookup
  clk: rockchip: implement linked gate clock support
  clk: rockchip: rk3588: drop RK3588_LINKED_CLK

 drivers/clk/rockchip/Makefile     |   1 +
 drivers/clk/rockchip/clk-rk3588.c | 116 ++++++++++++++++++------------
 drivers/clk/rockchip/clk.c        | 101 ++++++++++++++++++++++----
 drivers/clk/rockchip/clk.h        |  40 +++++++++++
 drivers/clk/rockchip/gate-link.c  |  85 ++++++++++++++++++++++
 5 files changed, 285 insertions(+), 58 deletions(-)
 create mode 100644 drivers/clk/rockchip/gate-link.c

-- 
2.45.2

