Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F638460;
	Fri, 26 Dec 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766746932; cv=none; b=i1K24bYKbP8gH3whhtMSm3iVaHYqVXSlRom9HZ+n1wOeRtWgzNMctwWITFvzP25vOpDYlw8Hj3/xa4xOlNorVW3YtFCU4hzQlqYlDj9l/J5cpnRbMeoamW2XfXnmK7htNMst4vcOq3eXBaDnSRH12ilHhoI8V0yJkeyUPirBU6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766746932; c=relaxed/simple;
	bh=o5Q5BgWbikCBF7nY7vQ1yAQd1YSGpZSdccpou2ssT38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W0NsYRX8tX6TAILi+gFQxfyvlN+dURax18DxJos0YiERzdnd/Qq5yKGAxen8ic9thaQold4G/N5+XiSScJmXsQ2YhxyHKjmH8//jU+8ArBMSLqpFxZrlvsL5TwDDj2pTYYMF8JC713d0mdD6dHM7b3kiv4/nE4jPfC7/3Jk7RAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 840A9341F5F;
	Fri, 26 Dec 2025 11:02:05 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/5] Add clock support for SpacemiT K3 SoC
Date: Fri, 26 Dec 2025 19:01:15 +0800
Message-Id: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxqTmkC/2XP0W6DIBQG4FcxXA/DOaJCr/oeyy4QT5VYoQNnt
 jR991Htli67/An/l/9cWaLoKLFDcWWRVpdc8DlULwWzo/EDcdfnzFBgDSgknypuzxPvOxSgKqU
 NVSx/vkQ6uc8Nen3LeXRpCfFrc1e4vz4IgB9iBS64IpKtbYWtO3scyC8hlCEO7G6s+NRD8dvD3
 APUbScb01ZS/Ond9jGR3j/yMcu+iM2UktmOORQPr+Gi4RNspA3zHPwuo+pqLUF1sj89y9n9r4A
 WgAp0KaXQLXLgzgc7OjOb4zAbdy4znUfdvgFfoE17aQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=o5Q5BgWbikCBF7nY7vQ1yAQd1YSGpZSdccpou2ssT38=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTmsaQ7ZfBmrlUtfkPnHh+LPHIpJ2aX2ZqcOZM
 pkCgUBlKQ+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU5rGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2LSQ/+IDqhauokrIcSlXQQ8EuXY3blmyDIaRPVsV4Iwuo87ORtDit48PmsS
 7CNoxdPJR6Pn7NVLvGafzyyhbnBVZfFMNUQVpByAd/blIsd45XXQ95ilvNOg5412AER/faM1B/7
 sC+GbB2ore3GgkNxmY9kPP7Bq/4IJq+h7fhiRMcQoLyjm+A5Hx+w0md4nEI1RfXiL19pofIoxtp
 sjoCzxChu5KkW5EFxF0zjrcytf4NB+jOkVP78EsJSYWCSDnpCkeay/SQZ2XmTNP0bMjYCFf3I40
 x1fykP75O0xEebkjDEiZw8lWhCA+cIEidr3T1ivScvfGbN4VCZMuocSlQWs6JHTmsUFZvRO42vn
 OsAM9cGTdLJA6KixyLS8zzpJ4nMx+5kRRmWTJv6AfMjWbBSfHC3AbBXJYWr5CVPnnBsJ8lsBC+8
 YEiGhrqcF1OmnajDasAq7c7snN2ww5nx5tHbNGEzMvnu9CBonwWXge8yf9vi8oUOtfg4P2JcCQs
 16OGApuUXbKlPrUDQfIq3QluWUQkDx/1RXkvR0VLocCM9a4YhahlCkGD09y3mGvL3AvOkXtGUqj
 Dh8Q2gbofnaWi22c2mdi3HUEOWoJQgPntMHb022Z8vwdSHZkl6vzWgV5cYjJalMPzL5VipUeg/j
 sMl9PFKlcWNmAhqE7JjSM0D7zaWm2o=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

I've dropped the RFC tag as now the driver got tested on K3 SoC.

The SpacemiT K3 SoC's CCU (clock control unit) is similar to old K1 generation,
the clock and reset functionalities are distributed across several IP blocks,
therefore, we model them as several clock tree accordingly.

The PLL clocks has changed register setting layout, so introduce a PLLA type.
Some gate clocks has inverted enable/disable logic which writing 1 to disable,
while writing 0 to enable.

This patch will depend on two clock series a) fix building for modules [1],
b) refacor common ccu driver [2]

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- drop RFC, the driver is tested on K3 SoC
- extract common header file, shared by clock and reset
- fix reset name for auxiliary bus
- Link to v2: https://lore.kernel.org/r/20251220-k3-clk-v2-0-1297b46a7340@gentoo.org

Changes in v2:
- has dependency on ccu common patch
- fix wrong indention of DT docs
- fix kfree() missing header issue
- Link to v1: https://lore.kernel.org/r/20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org

---
Yixun Lan (5):
      dt-bindings: soc: spacemit: add k3 syscon compatible
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: extract common header
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
 include/soc/spacemit/k3-syscon.h                   |  276 ++++
 13 files changed, 2362 insertions(+), 20 deletions(-)
---
base-commit: 6ec25c2f81b39cbbf5e16c533e7ce3dc64a70ae8
change-id: 20251204-k3-clk-db2018389ae3
prerequisite-message-id: 20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org
prerequisite-patch-id: 478955b6a6ab7c82910cdd9de7caf2d8be95b99f
prerequisite-patch-id: 9d9f553c3430fa2bda0e980679efa60c46cdd8e9
prerequisite-patch-id: 50eb74bd253e779458b52b242144e79807675461
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan

