Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AC1DE884;
	Wed, 11 Dec 2024 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936409; cv=none; b=VWF/rI3z99c7UCod2pwpBj5kinuZKnDx21rntbafgdxM7Id8BWqosDgUuWQLleiI1xgOASjYnmGyrxFenG//13b+frvG5Uf2Q/5NNL/Ks2x546TXl9lxv34k2KdlwBqFovI8HmAHsYGmSpK99eVugzlcOmwJasx2jk3ar+I5Gvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936409; c=relaxed/simple;
	bh=bwaO47C/VDBLli4uK24DxQvuVZGRCzTeS8I7FFz++X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0+dW4Tpw3wFZjZZJoI7L3EhFwn4Az3h1dMPgBzlQR0yzTdzN28XThfsBAvJtgPazbpM6Vts1CNAH1/xGTewLEW7ptGPT6/xFiVjF2hojFuIldsoghCjeRcsggreocqu4hIb7d4qOqlRC2XXEGFY3l4nbyAz7KLd+T1Rmd+BEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EKkSP7CA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EKkSP7CA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733936399;
	bh=bwaO47C/VDBLli4uK24DxQvuVZGRCzTeS8I7FFz++X4=;
	h=From:To:Cc:Subject:Date:From;
	b=EKkSP7CAyFZKwzhXEbg0pgRDCzeqdyuvFiLTmVXdKCmf3bR63zLQUnJ860nLD9I/f
	 BOq9XGgi4apIRWVOoh1nVfQzLdZcXTiKxyyGm2C7Gmq7GaQDPubYAMI057Ur/rTiim
	 NUWn4uDhgtX93QlKY8YtaguOwcHfujvGO45A/V6Kye5L72r4ZqlxDeGcHHzWOtf5fU
	 4ubxYQjv0+ee9hgJuqnXfTTlrgyKsb6cb/CPIb72yMfpxIMJvxGw67q33Vydx5JjDK
	 t8zsVkq3/ArjdP9CqV5F83kipesJpXeIyditY5RKMuK1kqKVk7f7QgXPX+LcB9ph0g
	 gE3NoqwgAr4Mw==
Received: from jupiter.universe (dyndsl-091-248-215-089.ewe-ip-backbone.de [91.248.215.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E6CD17E37C2;
	Wed, 11 Dec 2024 17:59:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 78C0E48CC8A; Wed, 11 Dec 2024 17:59:58 +0100 (CET)
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
Subject: [PATCH v12 0/5] rockchip: clk: add GATE_LINK support
Date: Wed, 11 Dec 2024 17:58:49 +0100
Message-ID: <20241211165957.94922-1-sebastian.reichel@collabora.com>
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

Changes since PATCHv11:
 * https://lore.kernel.org/all/20241024181621.210509-1-sebastian.reichel@collabora.com/
 * rebase to v6.13-rc1 based for-next branch from Heiko
   - no changes needed, so v12 is more or less a resend of v11

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

