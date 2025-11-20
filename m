Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21533EB16;
	Thu, 20 Nov 2025 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644481; cv=none; b=ArvS59LEfmqK2kbrEwPLYRWsGcpAkuPNHLwyUo03ozzhKOFiMdLHdCdlwP949VIADfXrgXMpT2WFVU38NxKoFDO01OCpRqcNAN8cJshusSI6PzlRXrati/kgkSn2y5trCe2zMLyO2nsdP/C+v4zFUvDPmcg/cgbFA76B57s8uik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644481; c=relaxed/simple;
	bh=XIGihbXCm7fgxLcQi4CgQ1rGtLza+JqTLoULwYaBhnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhtOeibhTfF/bQpA2QgAhjP6r8lrTOb9jXwC1iNZUwokxrjY/BSeKsIKRcLbFI6dniIc1xQeU3Gc4M81yyKmCszs/3ofscp92qq+HVIlxfrmClF29zXG5MqZCrKqEjcixjZVWgwntmlRr1x4GUqQs/FjQURj2ryuw2PrPwxYswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RnfS0G5y; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RnfS0G5y"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AA1C925F58;
	Thu, 20 Nov 2025 14:14:36 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sM3jaTWwSMZl; Thu, 20 Nov 2025 14:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644476; bh=XIGihbXCm7fgxLcQi4CgQ1rGtLza+JqTLoULwYaBhnY=;
	h=From:To:Cc:Subject:Date;
	b=RnfS0G5yIGuXX4+gFa6hRSwbg14a2xcWyF2YHY8T6ZReiMc0H2sYDWcSxGW2CewXx
	 a9fOf/IeCoe7KWmzvXVfmEE9LaM6izTXxv+l4/JiIbkOdE9Ud8DbdY5dBONRwv4oIa
	 f0l/eGyp/DrT0+QznUCSxHkNCisXCUAyaMxO9006sCgF0BVl765jUDv6T4tbkp1HeV
	 YJpKK1t3VJ96DI0IZaK2qzVVF+Y/wGXwEM+8U+22AYl2HoeG3ERLoDEz0+fF5AR+vq
	 Nxt2lL5TQJFt57Lqg7yMZhiyOwyPWeQbKq0ATi2KxpDotrDeTug6v26Gw23ZP393AW
	 SV3m5iEIimxPg==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/7] Implement CPU frequency scaling for TH1520
Date: Thu, 20 Nov 2025 13:14:09 +0000
Message-ID: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
reparented to one of the two PLLs: either to cpu_pll0 indirectly through
c910_i0_clk, or to cpu_pll1 directly. This series fixes a bug in PLL
enabling code, supports rate change for PLL, and finally implements
frequency scaling support for c910_clk.

However, to achieve reliable frequency scaling, CPU voltage must be
adjusted together with frequency, and AON-firmware-based PMIC support
for TH1520 SoC is still missing in mainline. Thus PATCH 7 that fills OPP
table for TH1520 CPU and enables CPUfreq is only for testing purpose,
not intended for upstream (yet).

Testing is done on Lichee Pi 4A board, only operating points safe
to be used with the the default PMIC configuration are enabled in
devicetree. I've confirmed there's a performance gain when running
coremark and some building work compared to the case without cpufreq.

This series is based on next-20251120, thanks for your time and review.

Yao Zi (7):
  dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
  clk: thead: th1520-ap: Poll for PLL lock and wait for stability
  clk: thead: th1520-ap: Add C910 bus clock
  clk: thead: th1520-ap: Support setting PLL rates
  clk: thead: th1520-ap: Add macro to define multiplexers with flags
  clk: thead: th1520-ap: Support CPU frequency scaling
  [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for
    TH1520

 arch/riscv/boot/dts/thead/th1520.dtsi         |  35 ++
 drivers/clk/thead/clk-th1520-ap.c             | 350 +++++++++++++++++-
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |   1 +
 3 files changed, 379 insertions(+), 7 deletions(-)

-- 
2.51.2

