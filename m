Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739F1DA60D;
	Sat,  3 Jan 2026 07:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767426326; cv=none; b=Hq3QWsO0yqmLiZR2xnw2OdvPnS+6Bwui84QYSjMlhNK5epinxwil5hoe4SgOFBicQlyJhEqW+/tvE37+LkB1bxuw59RJ6LFWR0LExHbotr/0dCPV1SM4h3ILJEwFEYj3talVmpMRGYgYqyVA8B8iag+yWxgHPU4GuxKYIdigrvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767426326; c=relaxed/simple;
	bh=fOY4MCBg/eHd79/SpPKWRIdnmf4x7JgugHw128N2O5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZtyJXjaaCmR6vPgcP5IROGsZLpZmTy7MW3TRoJdK6ca8F30W/VymLrjjiy9vC0QRUxJywydiqM5fTuUCjtdBvxOkO4tTiUne8Hv/yk8wp/Fgog/wA3E7BUILPOod4MP2yjJw28IAKyi5+S7a7dK19wWaOAO91AlDGqo+sh80TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1C4F934108C;
	Sat, 03 Jan 2026 07:45:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/5] Add clock support for SpacemiT K3 SoC
Date: Sat, 03 Jan 2026 15:44:15 +0800
Message-Id: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/IWGkC/2XQS27DIBCA4atYrIvFDPhBVrlH1QXgiYMSmxZcq
 1WUu5fYreUqy0H8n2BuLFH0lNihuLFIs08+jHlQLwVzZzP2xH2XZ4YCK0Ch+EVyd73wzqKAVrb
 akGT58nukk/9aoNe3PJ99mkL8XtwZHqe/BMAfMQMXvCVSjWuEq6w79jROIZQh9uxhzLjrUGwd5
 g5QN1bVppFKPHVy39VbJ3NXC3SkpbW1k/+6+/qJSB+feQnT+hM2UEpmWcKh2DyRSVhIF4YhjOu
 LsLWVVtBa1Z32cnafFdACsAVdKiV0gxy4H4M7ezOYYz8Yfy0znR91/wFd3FrGoQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=fOY4MCBg/eHd79/SpPKWRIdnmf4x7JgugHw128N2O5Q=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMj8KtgiXlJVDsgkTbFM1TYjSUlVn9uMDPuqk
 xw+uXjb8AeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjI/BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2INw//Vz8/XZWxop+qYVLYMsOE/E/3IKPMnGoIpXBOxRkohr0h+zMsUqcfC
 kWhg8LW4A6BwZdqHmcWjPf/YVwN+874bNs8WclTA+sBrTBUHYyiCg6fphHJDIiiPZu0iLCM+y0d
 StJUlWmCnQjp8pWqJttWhbiOjr6WpjMe6IQA0TAcoeAoL3ob1XwbM1gIIGRZvlXx2dNVH9XymOV
 TbLMICtJVnNxLvm/3BmthgZkjQB8+A+k9zD67tgJP4aCXRlFHyi3HHi3p3m/1AsC4cJplSHuemS
 HwW06VBPQCThOKg4OIJVdKsTY9mCeepaI3Eu8zeom0C2XxEyLnfpT47Z84PXK1qdqQ2qTT/Jvjt
 YKu4aIyKrVp5yY9Uh2TZat+Zt4sleAwPE9nKNr+vs7QG34/BEKuwdGwspVJqSkexlRQl8/J7q51
 oE+F5g3cuLoNNYiJJxg4M3XHokroMsJVwqs/nL3TcOD6eoBpzulnPqy271UdyvglN8PB78rTRKx
 eJMfxlg6Vo/yBFUXxwoCtDrnuiZ3bvAMe3lcBiGrEY2wrtrBdiiCc/eYU9oU1a/xVHJASZfqzGk
 /x7H3I7yrrmTzu0il53yq6yqOfrZwbbKt3wJgCZT4xxaBOG0RzqrnA84qWKqSO5E9vtMsk4EASO
 2GiXJEbKOcqaJQGuaSnQSAYma6KZ1M=
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
Link: https://lore.kernel.org/spacemit/20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org/

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- improve commit message for dt-binding
- fix dt-binding property, drop unnecessary 'contains'
- drop _K_RST() macro, use raw string
- use common spacemit_ccu_probe(), implement SoC specific probe() function
- Link to v3: https://lore.kernel.org/r/20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org

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
      dt-bindings: soc: spacemit: k3: add clock support
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: extract common header
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    8 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   13 +-
 drivers/clk/spacemit/Kconfig                       |    6 +
 drivers/clk/spacemit/Makefile                      |    3 +
 drivers/clk/spacemit/ccu-k3.c                      | 1487 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h                  |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   12 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  118 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 +++++
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 12 files changed, 2361 insertions(+), 19 deletions(-)
---
base-commit: 3c02b506fd1baf55da9a31a8e73a9aea7f120628
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

