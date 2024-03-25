Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E812B77;
	Mon, 25 Mar 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395375; cv=none; b=FgSoL5qwIaT+nOCdLIFIneptO6506rL5GX4LVLPIm95C2hnlUGVfc7cavMMRTHLkIIGm3iZi5wTRSbC2zyeEpsKXvLYhwixKuyqDxu7aja5TrMJPyNPyx+Q4akMizYgBq0IzDRUBVy/rNky0MQ9RGU0Da9kWKmKmJjQDhCPSujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395375; c=relaxed/simple;
	bh=ns2j/1xbq6BTPWqUJG3b2GwBYjyqRHljKR5mnkkMGU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RR1+AY3EQCohRZgfNgXNzr0hziRh/H2LTPkc72ICxw0ehY7ukUlyan8lcinpWyzK6lkU2BvswOGOC/g23rG6ksUSVXp+p+Mj48jA9xUtSI+//RG5XUV0BZnLgUipL313E5f3MbkrCg1HR/ZJsNyC/1WL5OX2lyIxyjVuao9ITkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B697wdui; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B697wdui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711395371;
	bh=ns2j/1xbq6BTPWqUJG3b2GwBYjyqRHljKR5mnkkMGU8=;
	h=From:To:Cc:Subject:Date:From;
	b=B697wduiQcwgu9tNrSJ7sTGIjT+DrQVFCSufUafFKE2l1bNs/SwCIOwGpK2q5XNip
	 9b25E+JFedcQ40kDC4v94I1hmIt74wohUdwEzrdmAHCbiNG9cTTbgmHtzNSBASHHYz
	 7jGaiXmdQN+r92OptRwr/6U2zTnbXHCf4uBFBNZFwgueG21yfhClv1hU9EBcr6YUuO
	 hlb1uK3eGr51f5Q2gUAFwbvjeWzEjZmYXBbAsOLcO7yUOkvUxQI1Yg+aPXE/qm8xMQ
	 0zdfwS/6/vJ5lrFb1rhcMyYNA+0mNYWvJfpcpWT9NnRt7iLsbIW1w7Rf0ksA5Zfinr
	 DWW5uQpqEXEnA==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 66AC83782082;
	Mon, 25 Mar 2024 19:36:11 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F4364800CD; Mon, 25 Mar 2024 20:36:11 +0100 (CET)
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
Subject: [PATCH v9 0/7] rockchip: clk: add GATE_LINK support
Date: Mon, 25 Mar 2024 20:33:31 +0100
Message-ID: <20240325193609.237182-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Sebastian Reichel (7):
  clk: rockchip: rk3588: drop unused code
  clk: rockchip: handle missing clocks with -EPROBE_DEFER
  clk: rockchip: rk3588: register GATE_LINK later
  clk: rockchip: expose rockchip_clk_set_lookup
  clk: rockchip: fix error for unknown clocks
  clk: rockchip: implement linked gate clock support
  clk: rockchip: rk3588: drop RK3588_LINKED_CLK

 drivers/clk/rockchip/Makefile     |   1 +
 drivers/clk/rockchip/clk-rk3588.c | 124 +++++++++++++-----------------
 drivers/clk/rockchip/clk.c        |  71 ++++++++++++++---
 drivers/clk/rockchip/clk.h        |  37 +++++++++
 drivers/clk/rockchip/gate-link.c  |  99 ++++++++++++++++++++++++
 5 files changed, 251 insertions(+), 81 deletions(-)
 create mode 100644 drivers/clk/rockchip/gate-link.c

-- 
2.43.0

