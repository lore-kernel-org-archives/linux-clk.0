Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315C233711;
	Thu,  8 Jan 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767838311; cv=none; b=nD0DTPxyZ7ZV0fsbzzOIzlTyWpEYgEx0KCOt2boOmODOZg1oGFqCKbnlLEbn6L3oLOjPK8MEDDy3URnmv4nV+0UBF8+0ViKR1ZMvxEGla/kUXT5CA2Y2kc0On8BoNgbQ7wdmD9sP9p1tNCCNjJWP96mBfBDsoU5iF2BeMwmwbCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767838311; c=relaxed/simple;
	bh=MKf7Ad3QNaUrSy/KcMc+P78nwKgoqgOepx0vBDSKhyQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EEr1lCn3zR7kaPzA4GJQLJfqp3+IFJ6WZI9lpv2WILmhF8i97oGsQPNDY1hM2c141lCgsxL2vkh2SBu4Y5+6vYzjqW+wy9W6Wb6PLcDzcOpxJULD/6B438DYrdQYFkcBPGmvbm5kp53cnrH568TLdd9HATfnINsTRTkZNYzd+0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 67EAF341D13;
	Thu, 08 Jan 2026 02:11:43 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5 0/5] Add clock support for SpacemiT K3 SoC
Date: Thu, 08 Jan 2026 10:11:04 +0800
Message-Id: <20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgSX2kC/2WQQW7DIBBFr2KxLtEMYANe5R5VF4AnDkpsWuNar
 aLcvcRJ00Rd/tG8p5l/YpmmSJm11YlNtMQc01hC/VKxsHdjTzx2JTMBokYBih8kD8cD77wANNJ
 YR5KV5feJdvFrFb2+lbyPeU7T9+pd8DK9KRB/FQty4IZI6aAh1D5sexrnlDZp6tnFsYgHTsCdE
 4VDYbVXjdNSwT9OPnLNnZOFa0AEstL7Jsgn7nx9YqKPz1LCfP3kr4O2up2vORQjrsaQhiGN3HQ
 Yam1tDUq3y1rHQDm7Z9ACCoN2oxRYLTjyOKawj25w235w8bgptgvqXabVHOe2MjvwKgRSyuDOl
 2dq2VhdBp3poAMFQgePZMr95x/Ke7hEzAEAAA==
X-Change-ID: 20251204-k3-clk-db2018389ae3
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3558; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=MKf7Ad3QNaUrSy/KcMc+P78nwKgoqgOepx0vBDSKhyQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpXxJLjNJO64W1MF153pJvKYP3XxqLF9WjINVsj
 L48p/4Ss9KJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV8SSxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1pbxAAlY9iuexWw4dh4ib4ylDIRaD9MRmNoAnB8gJ2p1Y8GEri0l9ioFUOr
 kB5zAsrFcxaGAEZjXF5tj57lDHgj3bCOghKiCJW4iyK54aAcds2jKV6rzFPnmfkl8QdmInnyq5F
 lW8DSq5GxolbEzOgKvxgaSyKkV/xeRRbuHp2nsSgySonfRnDWQ1q9tb8EMQ2+6Ht6dcuyHg5Ic3
 UlWjIcpneEXpaFnKLj9t4ffn8qOhx2Mr9cgcK94kTE4pJQjL+OPs+rH0kIZp7RDwjK4UEBJYjua
 GXRIEzjPvPJuanhZ8b0eDR5v/lNi34re19oPs8BAtRgrcIaZARM22Az5ldf0LY95geWQPSZGxOg
 hR3y/FcB5kag9ukS2V52YiCb/rvsLb0SMPb5sx8lCi+Ms4QolHSTzqxuQ5CXHvQOrJfN8bzgRhw
 RP/0vHmY9ZYZ2tzC2d5XqP/OiSOw17CjGMMkw+1KpFTB/r+jYs/s2Ggmju/G1fCUuYU+NxoKvxi
 rw4jJphnCrH3JNRS8/AZkXS5gRIsmkPhMVgD3s50dQMWGuduIUe5/iQ4l1nEoffb13uIZPCpXQX
 cfg0xpECvzmN2X+s6SrIi3H5Hb6q+mabF2HAZoE+CXd++Fh2rHYzZurIFKYyV386bWuK4hHYeZX
 ysC33lc5FdvhrWnTUMjX7sRyStR0O4=
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
Changes in v5:
- update dt-binding search path of valid clock id indices
- collect tags
- Link to v4: https://lore.kernel.org/spacemit/20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org/

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

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   14 +-
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
 12 files changed, 2363 insertions(+), 19 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251204-k3-clk-db2018389ae3
prerequisite-change-id: 20251217-06-k1-clk-common-8d1c57995047:v3
prerequisite-patch-id: 96cd13293b888c05f400daf529c3cacf17ddf002
prerequisite-patch-id: 5f6579799919c4e2e12c8c836ac4164b00ccaaa3
prerequisite-patch-id: 11e8d5cbe6f3610aa362dc0051b3173001d0a5f4
prerequisite-patch-id: 622d6606913609be04f66006609550e8c3e7f22b
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan

