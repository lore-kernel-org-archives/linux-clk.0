Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEC12D238F;
	Tue, 24 Mar 2026 22:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393082; cv=none; b=T9l2oB/Agh1VJyVtc52scN7DVdKPgCLRQB65RxHDcCa9w4KqyepfuF20bPuiXz05RBFUbmfbdyk7EFEHiAxuLL9VKjTfARZxU66i5cBxMqOA5NAMF+IZgvGXV4ON6h4vT1RbJMdsH/F7QputJPzIuyO/fj0JM49WqbLUAnBPflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393082; c=relaxed/simple;
	bh=kbebKpZc+kOH/NCAbOn1JPHayuYXWSqmfRuqOsgshDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qq7dYz5mSoDVOGhCYdn7t1RaCEAoIq90MZLAxWODrUYq+fUBRkJo1JgjEFY7KXbg07tIdOS42EzAdk1SjFJz3SIRyoUKWgLGoITfe5N/6d9zy+h1v06WS42qOfFbVaZ5eRHng4n/jxWNswvu2picJSvLR1lLmj/1BjbAh8W34WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Vkd7Xo+HTQuLLxwzRJ6/dg==
X-CSE-MsgGUID: WOxQGzJTTm6/+mSk05czbg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2026 07:52:50 +0900
Received: from mind-2s.example.org (unknown [10.24.0.35])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E9800400B54B;
	Wed, 25 Mar 2026 07:52:46 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Remove WDT{0,2,3} support from RZ/V2N
Date: Tue, 24 Mar 2026 22:52:33 +0000
Message-ID: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear All,

The HW user manual doesn't explicitly state which cores
from the Renesas RZ/V2N SoC should use which watchdog,
however, it turns out that the original intention was to
only allow Linux access to WDT1.

The purpose of this series is to remove WDT{0,2,3} support
to prevent the CA55 cores from getting in the way of the
firmware running on the CM33 core.

Cheers,
Fab

Fabrizio Castro (2):
  arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
  clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ----------------------
 drivers/clk/renesas/r9a09g056-cpg.c        | 15 -----------
 2 files changed, 45 deletions(-)

-- 
2.43.0

