Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867EF228C9D;
	Thu, 11 Dec 2025 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416040; cv=none; b=j9BkgIpqEFXCFsKinszKkPGRvR+TTsHKENlTO7QbF8N8zauiyO92VPDovwpy8hflx4OfL1Spc7eGukL+SpZzPRAe1GYo9RHcCPCLhC+fq6GQ84u9+sWJjTuLLTHqo1jBVGHUydGkRg4lK43UYhYhtK0JkpxChkiDfFkf9AXI2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416040; c=relaxed/simple;
	bh=7wM8kl3qX0xkz3vzrVtu3bOKqohyKqDnNPPd+XJd05Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gU8BPoqBOWraWsJn0Z1VF7zQydM1dG3OmVF9z7q3WPl101GaMGAhuCqqDvm6DSp8tDDk1ifHSCUPhG82QkuaqV/S/EYhMfFIjUltsxqqPLExPCI/R7b0v24613KW2mhGBJb8Ra3IlZ2tFcpsszYoZDKXmgmM4anb9JAB3aY6p4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 68C9E34076D;
	Thu, 11 Dec 2025 01:20:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC 0/4] Add clock support for SpacemiT K3 SoC
Date: Thu, 11 Dec 2025 09:19:40 +0800
Message-Id: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwcOmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwMT3Wxj3eScbN2UJCMDQwtjC8vEVGMloOKCotS0zAqwQdFKQW7OSrG
 1tQC/nYvtXQAAAA==
X-Change-ID: 20251204-k3-clk-db2018389ae3
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=7wM8kl3qX0xkz3vzrVtu3bOKqohyKqDnNPPd+XJd05Y=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpOhxSgE8RY7oRxus5DTWEvVfuqPsiOXvJ/5p24
 ZzRX/jullqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaTocUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3jqxAAjcVO0Kp1VVSuADxzZ9oL4tR0X0qeWU3MKw5I6T7EEcs+5T1qm+YVE
 mv1Yry8Im1G5gR49icpkDbLjEknypIijczfs28aDdxfOEIyaBXKqclMQN66x0/5X7l0sUOzhKi8
 /9lf2kFC8fA3afu3xGeE+JDabx05+B3fZvrB3eAnilzdBHEGjBsY38zLVmjm4tW//tmwTJcqwZB
 z7IQ0QkaH3H90MUNDOYxee7yrENiRNK3PYzeuPCThbMPmVli7VxbDlaQ0kXSgfejfdLGWIKBsSC
 Ls8V81iqP2ojjEDZaHJU97vJ1cFZsachOv1aCJH69M2eFsljOBIOX6GMP9ccwFdnClScUXa2C+I
 5v2atu9teYxzamZAxl2PVyzydcg7Aa+GlVDtErxGn61LFcm2VxFmF3PD90XttSmqh909hijqiiS
 ms6+3JEmhK1tyblAipf9dYOMiM0d4BMJ8mMLof3lSq7on4GhgcLFRyqWGMW9PCa5Cb7Gxe1T68/
 4BDvX89KAANgu06V8BxfpVFqLZuE6xmTnzfaGrR7VMB758rahOHcUld8/L3aisTMZvx341T4clY
 Z1cHBBU+VwAHdV9bkdZqcmXwhZlB8gqbGfbvXgy3BTUItpzJxMLr1agJEe4YLNhszq5srdjuPjY
 XofTqLD7cYbTrePjKJjmsipreaBR7o=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

I'm marking this series as RFC for now, as the driver is based on vendor code,
and only tested on FPGA, the production SoC chip isn't ready yet.

The SpacemiT K3 SoC's CCU (clock control unit) is similar to old K1 generation,
the clock and reset functionalities are distributed across several IP blocks,
therefore, we model them as several clock tree accordingly.

The PLL clocks has changed register setting layout, so introduce a PLLA type.
Some gate clocks has inverted enable/disable logic which writing 1 to disable,
while writing 0 to enable.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (4):
      dt-bindings: soc: spacemit: add k3 syscon compatible
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   13 +-
 drivers/clk/spacemit/Kconfig                       |    6 +
 drivers/clk/spacemit/Makefile                      |   11 +-
 drivers/clk/spacemit/ccu-k3.c                      | 1641 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h                  |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   12 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  117 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 +++++
 include/soc/spacemit/ccu.h                         |   18 +
 include/soc/spacemit/k1-syscon.h                   |   12 +-
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 14 files changed, 2539 insertions(+), 33 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251204-k3-clk-db2018389ae3

Best regards,
-- 
Yixun Lan

