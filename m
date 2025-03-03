Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F313FFD;
	Mon,  3 Mar 2025 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999888; cv=none; b=Ztgkd+oRQYY8qtmEIVEa9GIAobP5RiLkhrcO1+PjF6AjOrLX54UJi7nBOJG0ka/sHBgtA2T/2Fnu5bXpmTlLm9ATrqx20qFQX6aaNuowFrG0GO0LtOkjcP4bU/RbbzWmW3XrcbI6QQTmrpgG7k61pe3mXITcK0zExNAcysYQZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999888; c=relaxed/simple;
	bh=elpD1mKFw7kt/7235GxfSMt5DHMLcOEMFwXOLyf+zAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nz7ay+PnFa9SeOqCUNN8ANrfGr2YqweqyS0TayK7SVRayWOlR+c1NsgQkWIoumptHVNjvhOc3+pyk0ZBw2LLgv1thFO21NjWpqKdI/hWwItzAPPv3zzwD9fLDUn3X+hW7ZVKULSvSAbbv064HAAOLazgYswxejSjKFiNC63aBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: iIBEnxaASP6m/drLN51JOQ==
X-CSE-MsgGUID: DOk3iX44T3O1urkx/tGXkQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2025 20:04:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.114])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B052C400C742;
	Mon,  3 Mar 2025 20:04:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G3E XSPI clocks
Date: Mon,  3 Mar 2025 11:04:18 +0000
Message-ID: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E XSPI has 4 clocks{ahb, axi, spi, spix2). spi and xpix share the
same CPG_ON bit, but they have different monitor bit. Added coupled clk to
handle this. The mux smux2_xspi_clk{0,1} used for selecting spi and spix2
clocks and pllcm33_xspi divider to select different clock rates.

Note:
 This patch series depend upon[1]

[1] https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Biju Das (4):
  clk: renesas: rzv2h-cpg: Add support for coupled clock
  clk: renesas: rzv2h-cpg: Add support for static dividers
  clk: renesas: r9a09g047: Add support for xspi mux and divider
  clk: renesas: r9a09g047: Add XSPI clock/reset

 drivers/clk/renesas/r9a09g047-cpg.c |  40 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 112 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  34 ++++++++-
 3 files changed, 181 insertions(+), 5 deletions(-)

-- 
2.43.0

