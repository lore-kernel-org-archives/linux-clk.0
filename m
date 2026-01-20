Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E91243C076;
	Tue, 20 Jan 2026 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921582; cv=none; b=RKmSFlhtAuu4dClepe4FQyFiA5juEBjmOs+ZlQn019cjvD7q5/NMsDL8+jkCQ7qtmlrB+sJn/pUwIXrZPFnR3qWIWv0b0Kdz2FpWKsf8tez0VmZRGu+eTzjbgWpplIKK+mT/j+hx4vIyShvW08Hk8zb6cggvf+fNawrpSaTaKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921582; c=relaxed/simple;
	bh=iMcAVcZi0JvK1BoRXW/xhNQDvSGDtgDC6QX7DEPzLcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AXrkeDi25rylG/R6kxd3HNwqttVa5954+cFVlYYPe53lF5CrlW1jTWcWxnUlY13NKyjDEYimhohIJ7x3xu2oFHw4UPnZ/hTRkhwyL3Lk5fiFRyFRMeHZI6jMHiccdauUN4FT8Kmj1Ri57gdiQsppym8oPKEvizYjQnKm3QYUE1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: W7e0F+Q8RK6LGWO1Q/TJBw==
X-CSE-MsgGUID: NHrdqL1ZRfqwDoJrc+m9UQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2026 00:06:12 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E8BE402261F;
	Wed, 21 Jan 2026 00:06:07 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/5] Add versaclock3 support for RZ/V2H and RZ/V2N EVKs
Date: Tue, 20 Jan 2026 15:06:01 +0000
Message-ID: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series extends the versaclock3 driver to support the internal
freerunning 32.768 kHz clock, which is used on the Renesas RZ/V2H
and RZ/V2N SoCs as RTC counter clock. It also adds the dts nodes for
the RZ/V2H and RZ/V2N EVKs.

Best regards,
Ovidiu

v2:
- Added versaclock3 dts node for RZ/V2N EVK.

v1: https://lore.kernel.org/all/20251021175311.19611-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (5):
  clk: versaclock3: Remove unused SE2 clock select macro
  clk: versaclock3: Use clk_parent_data arrays for clk_mux
  clk: versaclock3: Add freerunning 32.768kHz clock support
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
    generator node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add versa3 clock
    generator node

 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  25 ++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 ++++
 drivers/clk/clk-versaclock3.c                 | 126 +++++++++++++-----
 3 files changed, 145 insertions(+), 31 deletions(-)

-- 
2.51.0

