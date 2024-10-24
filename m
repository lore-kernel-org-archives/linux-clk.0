Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81911ABEC5;
	Thu, 24 Oct 2024 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793788; cv=none; b=V53SGc48lNAjnFpeQv1WU/GbpqQxHm8Edwd08PM2fcsxvoN0XabH5wYH0/OtAzH7thVLpnJnFV+dFnsr+oSgKj7R+TM+vJfV14RbS8u8uUP0lvIPjOrdloiZM/jyxa7RmY3OK6TFIqq1zRvmuY5rCvFzxswKd9L8F/aAnir9x/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793788; c=relaxed/simple;
	bh=e8Qe84wNa3ak4bpxn+ExVY7B/6mI6kx1FcZfyj9rIzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jzC51Q3v9eqmSPbtKSKw+VDCPvmKfWL8mOI73NH/3XWDX87vq3q7GU9DuIJvPmE/vBXv0/5Q1v3Zym6w3cf+xjfdpwfvTj1+YFIEUQ/QsVduCl2nQRfCysyMRaWXfnzfc4gT27+w0vAeTQp3cnWu8ajdQdDgJHCBXcdb3r5pU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CNfxlxBJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CNfxlxBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729793783;
	bh=e8Qe84wNa3ak4bpxn+ExVY7B/6mI6kx1FcZfyj9rIzY=;
	h=From:To:Cc:Subject:Date:From;
	b=CNfxlxBJtIsSFWqFhQHXlYlf8RlNdxl4S/eewIBQLExECvNXSjWWZD/WXR6YLwchv
	 qMpkqupH4xtvobsuWDyNcoSH9KEKt83e0DZ6BV6O8yxZoD8Vqbw4xR9TFuVpgumokR
	 PpuNkqimAyazplqTN1TCCZ+iky/MrbswkBxVrW94gh5KzPsdIBF+JtFJ6nP7jDAS+O
	 tHHmlCmsulZ1IuaWhN3baqSo13/OXkqURYw/o/uQuI9AUpMMXFMjUUDvjZR69Wd2WV
	 444sCUkaTvIr15lq6i4/2CXZhZVFZFxP6fXdu6pmba8UAKx3dEZQjC3Q+XAyGoZA8I
	 2v+uWhABuPcsA==
Received: from jupiter.universe (dyndsl-091-248-214-110.ewe-ip-backbone.de [91.248.214.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F332617E36CB;
	Thu, 24 Oct 2024 20:16:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A2F374800EA; Thu, 24 Oct 2024 20:16:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
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
Date: Thu, 24 Oct 2024 20:15:27 +0200
Message-ID: <20241024181621.210509-1-sebastian.reichel@collabora.com>
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
pmdomain driver (failed to set idle on domain '%s'). Last but not least it is
a first step towards reducing usage of CLK_OF_DECLARE_DRIVER() registered
clocks, which should only be used for early clocks needed for the system
timer (see this talk from LPC: https://www.youtube.com/watch?v=dofbbVuIAPk ).

Changes since PATCHv10:
 * https://lore.kernel.org/linux-rockchip/20240913184720.57381-1-sebastian.reichel@collabora.com/
 * rebased to v6.12-rc1
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

-- Sebstian

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

