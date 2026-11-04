Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776868;
	b=tWwZ+ZfupR41M36gHGGkdUFkoY57MBykDNZ+gSgSkNQ6JuKFWRN8pz4QCkPTXWZnmF7B
	 SWcoMcyg4SxJxPWte30/CHVD3zfeCXYj5RsTIGo5sBLmziBswkBgIFNrvsjjFeOGrirj4
	 biATBOUSfh+mJI44ZhhrMON/NnrL7W5x8hzvjkBHLe+6wSmY2aRreN80Z0hTOQb1JYgPw
	 JexeWE94dA6WuF/xFu7LqDT66fmfn3DMVCQiPIHPxap4L+2ijlW2w0Rrc4qR0OJj5aB+K
	 V8LNl7nE/6nGAzh2V/e9uhsBI/X8DKkw1XIW8+7bzILT5xrQLOdp8q21ne6NXvvh7hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776868;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=bUPTF5q15YoMUn2xj6I+clqNCR9RFnUqBPvgPPEy6lE=;
	b=OC4R8UYFXE4GyxPQJ45P4WezA1R/23b1CeYnO5phBfIsllC1ElkIwAhPUWlbXrp9ZQzX
	 KetDKRCXWM2zULyVsZC3JxtvrKXqze/aviBfY5QkBS6pprT8q6JmIEm9zaYgJOybgBQAB
	 fre0vGRlY+DdS4g/lvTF+hPruGwT7PIyruyER2XDRC/LeCqwMZcK6GLG1INnIwQfjbPoJ
	 RMUSRrk+aimT7VGYVqiGf2tUK6LYJJPdyRNYk9Cytf4DUhsWisph9bRnXS+TLLoOLmXWr
	 sJRrudAiApfB9JmsW6Fnm6Hkw4apg3Q0J/Y5R+k9RUd/573tjXliH+NPM10pxQcKGeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MruAvaes;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50F606A333;
	Wed,  4 Nov 2026 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MruAvaes
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776867;
	b=m0w8CSsWZAUt7SHMQ0Fq7oXIXbxt1IMR4DptgcI7tMd8KKfbuzl3Tiuad5LFOvPU3zlp
	 NsOIkitdJjXOsUR9jeaHBkJpfLuDTV+Kb0AkjOwjzijSzVjFUhcky4AvrH+yKHVrTTfj+
	 Bjxxu3AaiV54DKNADtad/im1+loj/wVDWmDBTkD2rrCyRT5BODOBY+/xZ2pyRGC3F/hGD
	 X5V9srmnJWMqFvVcw4CgntLx5Js3UF21YVUpBQGmMnMyHhjEGALcesWEL4xXkry0AGSKL
	 tJ6WC9YQkIjsRyONmqGTIYkGVCnM3lCwtDzU657cUoJ0fKCo0kasN5+AoxCEUQ+garA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776867;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=bUPTF5q15YoMUn2xj6I+clqNCR9RFnUqBPvgPPEy6lE=;
	b=0ptFob2fRQ55Z/huphVu4nWUOL08ICCIllN4j43yzCUYnwvcrkUxKW6nwDaihqZ7kVaG
	 6aAQzaieIPn4MrK+GUXy0uvY6SnV+Nf2quWx8hb3GbGL1S3O0Fyk8YUa9UN1Vw+l8kF75
	 GO0Yf7pXGUfoPip1d7NAs3Dpu/FuKXQKMI5zH/yFH0dVl/HBehMEmVlnj+lfHCeYUD+HJ
	 yqhgvnCxaoROtffDXNoi4G+hLAqO3hxfe85PRhlUu5W9HI/VNZDAQMP8eVfRzSquHFAqb
	 PvXvEmyMJpeKPHYAQC3SoAwE1Yt2Ao9RneYaMpBCCOjgsb/0cjzjxQc/ZfXjqvPzJ/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 197CC1F00919;
	Wed,  4 Nov 2026 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776867;
	bh=bUPTF5q15YoMUn2xj6I+clqNCR9RFnUqBPvgPPEy6lE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=MruAvaesuLI7GFieQeDNbySwPD+uPDkyOWWRQ672swn9t5m3rDeUl1ySuK/F4vYqi
	 7TuQRlpZQabYciVhjpIX9RIr7dBo0BlB6trjpOxOfG/6PQbPBSaqr1GRPZOhTDu8zL
	 yLbuq6fnlCUiXaB5JK8QddVStYRfGl6EolhKaGLWK52Q0/SSTubTVN1YqSXu78IlKC
	 jYx/Zg3NtfIUWW98q3kTu2058UUh/ngSKeK+5Fc09ctRrx2HJH1cH7uEiU/2Bc+wV2
	 VnPrMd8yu6YZr4mM6Mqxrzj8beABdWF4gqpv15D524ahitW5DCNAilk1xuFf8K44o7
	 NdRUShJwAxlUA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 939A946CED;
	Wed,  4 Nov 2026 07:21:06 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH 0/4] clk: Add the Siflower SF19A2890 clock manager and
 peripheral clock and reset managers
Date: Wed, 04 Nov 2026 02:20:57 -0500
Message-Id: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnc6moC/y2N3QqCQBBGX0XmuoWdgUJ7lehif2ZzBK12VBLx3
 d3KywPnO98KyllY4VqtkHkWledQAE8VhNYNDzYSCwNZuiBaMpqwcVQ31uiivXEBkw+eMMYzlNE
 rc5LPL3i7/1kn33EYv5XDyPyeytN4aNu2Azm2mpWHAAAA
X-Change-ID: 20261102-sf19a2890-sysm-ac1fbcb21dd5
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776865; l=3209;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=0jX11La/VS5MQPtenvFdwlHA+r9r5Mqnpr1EmOgdYCY=;
 b=P7wQLj3jIHJltUhMTiJw74lswKMgKPQUsuM9lzZA9YSlpd+wsscDhrtemQ08qXOdEuNyLzI0Q
 z9s3GD/+oQJDEwpLVuOKwKJ7TH7UuBhFDl/tCYiQHQvrskomv0HnOdo
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The Siflower SF19A2890, a MIPS SoC for home routers, has a clock manager
with its PLLs and the muxes and dividers that feed the CPU, the buses
and the peripherals, and for each peripheral block a small clock and
reset manager with its gates, its resets and a bus output enable. This
series adds bindings and drivers for both.

Both drivers are Chuanhong Guo's, from his SF19A2890 branch [1], with
his authorship kept and my changes noted in each. The clock manager's
driver is unchanged apart from fixes. The peripheral managers' binding
is rewritten: Chuanhong's described every block with one compatible and
its bit layout in properties (siflower,valid-gates, siflower,reset-masks
and so on); here each block has its own compatible and the layouts are
tables in the driver. Clock N of a block is its input clock N, gated.

Following Conor's review of Chuanhong's SF21 clock binding, the header
has no count at its end.

The clock manager registers from CLK_OF_DECLARE because the GIC timer
runs from the CPU clock. The SoC support itself (MACH_SIFLOWER_MIPS)
goes through the MIPS tree; until then the drivers build with
COMPILE_TEST.

The MAINTAINERS entry that covers these files comes with the MIPS series
"MIPS: Add support for the Siflower SF19A2890"; this series applies on
its own. That entry is also why checkpatch's question about updating
MAINTAINERS for the new files is left unanswered here.

Tested on a GL.iNet GL-SFT1200: the rates in clk_summary match the
vendor firmware's (CMN PLL 1.5 GHz, buses 300, 300 and 375 MHz, PBUS
100 MHz, UART 125 MHz, GMAC reference 125 MHz, USB PHY reference
50 MHz), and the CPU clock reads 800 MHz, the rate the GIC timer was
checked at against a reference clock with the MIPS series; the console,
DDR and buses survive the unused clock sweep; the UART, SPI NAND, I2C,
GPIO, GMAC, USB and watchdog drivers probe with these clocks and resets;
and the I2C controller works again after an unbind and bind, which
cycles its reset.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Chuanhong Guo (2):
      clk: siflower: Add SF19A2890 clock manager driver
      clk: siflower: Add SF19A2890 peripheral clock and reset manager driver

Joseph Telaak (2):
      dt-bindings: clock: Add Siflower SF19A2890 clock manager
      dt-bindings: clock: Add Siflower SF19A2890 peripheral clock/reset managers

 .../bindings/clock/siflower,sf19a2890-clk.yaml     |  57 +++
 .../clock/siflower,sf19a2890-periph-crm.yaml       | 169 +++++++++
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/siflower/Kconfig                       |  22 ++
 drivers/clk/siflower/Makefile                      |   2 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c     | 360 ++++++++++++++++++
 drivers/clk/siflower/clk-sf19a2890.c               | 406 +++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h |  27 ++
 9 files changed, 1045 insertions(+)
---
base-commit: fc1f8f0ceb3b949b58c2f7819976644f5cf84249
change-id: 20261102-sf19a2890-sysm-ac1fbcb21dd5

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


