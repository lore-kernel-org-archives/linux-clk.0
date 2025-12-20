Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499F15746E;
	Sat, 20 Dec 2025 01:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766194831; cv=none; b=K9/XCn+GZ+gTbz9uk5OZTGyjOQfJ5rHGfyGloFdv3Xb0rfo3jo8CR+h4Bt7h/tSYzGa02b3uvL78BspUP0C/NO443gdKX/M/lwWKQOYxtjrZcxFWeTzCjlRheQ6h+qmbAm/8ONCFyucfYfRlfuDrTbgQ7YM3g+A351fN0Wd9Ph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766194831; c=relaxed/simple;
	bh=3hXRpQvFyucVlxMLGngwSvQY5C6Miw94XqZj97q0aI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vdf3E7Qo9kObWcmwceDL+QRRF1dCK9vsyynf6Z3C5Yk5QZHhQlI9P+hNlo/kwA8uZzNg3zj6PU/fVQr2G1yj8T5mfJ6hBOl1VlsLyDPIyHJaR0IQykjfR1Ofq2gOMn+qHFQ8Taq5khPypAWI1stAZiadyGwT/I8hmXXUzPKy4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 67DA43415E7;
	Sat, 20 Dec 2025 01:40:25 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC v2 0/4] Add clock support for SpacemiT K3 SoC
Date: Sat, 20 Dec 2025 09:39:54 +0800
Message-Id: <20251220-k3-clk-v2-0-1297b46a7340@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGz+RWkC/2XOS2rDMBCA4asErTtGM3ZiqatAoQfotmShyBNbO
 JJayTUtIXevkFsodDkPPv6byJwcZ/G4u4nEq8suhjLQw07YyYSRwQ1lFiRpjyQ7mFuw1xmGM0l
 UrdKGW1Ge3xJf3GeFXsXL85M4leXk8hLTV8VXrKfNQfx1VgQJirnrbS/t/myPI4clxiamUZzum
 5z4/aOULT+855xNLSuh1SMJ8gAzVtJG72PY5OFCykij8UD4Vy7ufwW1RFKom66TuidAcCHayRl
 vjqM37toUukTdvwEEa7L4NgEAAA==
X-Change-ID: 20251204-k3-clk-db2018389ae3
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3hXRpQvFyucVlxMLGngwSvQY5C6Miw94XqZj97q0aI8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRf55LlAlPyhdM/vbDPipNg024LU0U722zw2+j
 ysQPPQ7DD2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX+eRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0Rgw/8DWOgPhKFPbtrETwlA5Xg4P8rz0wsYQFQSR/KX0myK7RXyEDvHxNK9
 FqVveJan/3xQ9eWP+/aqvtk+SkkXmlD4h4+UwVvF8yOz+yDKaeL+HoyenkRiTVTK+wgznrEwsm5
 mKNUd1BWGW53m2rvKu00QkCR/MByks+2YAqdhaLdE11NgRSQq/bov48IS5D8QzkFAMjl/Myid4Q
 zJYmmm3bUloAJti/MjCM/7JmU1VzuMvVFBBYeMzRCjHNMklz5NCr1LR35R+IexsXZ/0RSYs4r94
 RQS+/Y/HA7zG3GEGc4yQv5jNSxiaJEC1CVQBepESFgIzTx32C829pNAKEoByuJ+jfLTjnyDIaGU
 2Y+zr7o4sPrCfEag24uZGLAufHyH2XY/BEnhpbmopXuBiA1rs2Q3qkC1E6Y9Nezfn+khEVVS7sO
 Mz/Lgxas3EQSeH9gQG6FaPcyAq5UW/RJxXSDaEsCb3BtvgZRieKixfi3boOSzFhQJXQ/3K7MQ7L
 wOee2q5cvEXQoH8bJbgq6jQE4q/IY+eJIH5eiR7jl2rNnbi+c8f45lXPF2tggCYL+gDTwwHR6kd
 qlOkDLFsaw3LSBbe53A55EWyfMEjO2bj8HsoB3mixGDEWH/P4t7ehH21iL5yR5HSNIGzq3qko3M
 8lUWtLUJ4VoPgP5aYWJvqHL2WrFNZM=
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

This patch will depend on two clock series a) fix building for modules [1],
b) refacor common ccu driver [2]

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org [2]

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- has dependency on ccu common patch
- fix wrong indention of DT docs
- fix kfree() missing header issue
- Link to v1: https://lore.kernel.org/r/20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org

---
Yixun Lan (4):
      dt-bindings: soc: spacemit: add k3 syscon compatible
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   13 +-
 drivers/clk/spacemit/Kconfig                       |    6 +
 drivers/clk/spacemit/Makefile                      |    3 +
 drivers/clk/spacemit/ccu-k3.c                      | 1482 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.c                  |    3 +-
 drivers/clk/spacemit/ccu_common.h                  |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   12 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  118 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 ++++++
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 13 files changed, 2359 insertions(+), 20 deletions(-)
---
base-commit: f2e01863fa4ca97dfd4b94654cadd805d34cf986
change-id: 20251204-k3-clk-db2018389ae3
prerequisite-message-id: 20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org
prerequisite-patch-id: 273ee04bcff7701d6645e78566d8624fd8a2cbd9
prerequisite-patch-id: 64047b0d0d79d767c9686cc7876316d983bea4e6
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan

