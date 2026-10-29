Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793266271;
	b=oSLF8W4rgWJLtCVS9+09nUsAtolVbbpSahthntaE4pZxYb//lNCd4vzylSCPEi6keZ4k
	 s+rGUBndIMgScc4Fah/dq+ULTC0p+fL9sgwHRbJqYO4lHoXEudXmMSbXyhINhpXX2pNR+
	 LQTuQoWAZBRWnoqtuZAKIssKRT3HSxLQBMcZnec32RnSd9BBk8bzdZ/fxpEVZH2ek3FOS
	 mwJ427eFjqE8b9ZSeclG4iClVJ0IAnjsYwCuUN2sxNVGzEaGTWozj3ftEb+oTh03TmvsV
	 +SA82xPC1JMc9CB8RDp6IZGpRuhx78jDbxKkY52YT3afqH43G83SqkZBlwpRiECiqgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266271;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=68BtqR7gpnmRO64Vr6Raq7UmjQqttR0m1LXAmQYas9U=;
	b=DkrjMPXRRwzTHxWaPLiM9XldsOokFRj5uoIButYwkYStVCdBq/bBMnL4eNrLmkfzq9pM
	 VNWFxHpl+GLwWRYV+urvEg76qn6becxAkP7OFW0e+Ekvv4Stuz/sXjncxwYGcxXkbnYFz
	 iViEvED16an8iO1bHgH20lunZdYmi+Tl9ZepemtQieXSNUqDWV0EsIe7fNy5feYUWkNsq
	 csuYGjFZMtPeIKnFUa51ICynfYjryK3MyH8NT9mGqMkj1EQw4DkE8vJeDDUTT1Gg9CsP5
	 WouZU5PkEPdtYtbkiaJrr1JqIsLfQYMOBImMCa5OcozGu1Lgr2TQK3TllIuxd3zwmNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4NAJEwS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9524606A32A;
	Thu, 29 Oct 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4NAJEwS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793266270;
	b=1lEQrzVz7/xWs93KqhRYWb8a3YBu2VpX51YrXoyTHX50g8hULoztgVab+GtHONIyN00A
	 r+3eSTmsowFp2s5fp/41RDNfUdaL0WoEdi4yvXLTutMmU7OhYGWJgyzX8p8AP6mqtDvz9
	 VcPTfetQ063X5jQ0K1gF7bcL9C86DBZVD6Ebm5IukjZYZhP7p9Ca0i5Hg2TKfS3auCwCy
	 ErW//+eG+SGhvbH7GnNqKoUlGa1dDYFrsm1KIvaw6km6TCYthsyEGNQ9HeMGVRBqpfo3i
	 GC0bIDuyXxq1IgAhEnNcHxeFC0YoXau2k01Nl+CqobotFa+1iQ+SLdOy03STe2XydRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793266270;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=68BtqR7gpnmRO64Vr6Raq7UmjQqttR0m1LXAmQYas9U=;
	b=Reh3sJbPppzP3SGYHOyRd8SDSoA0UHzUR64EDEITBFuyo9nr8AOQffasEBAJ/32aAlIr
	 /rRvqDjIJS4hnfmVTl5zcR/5Kmypan1obJIZTYjX5Iq6Jm67Pq9a044y+h4TJtBpdlrQ7
	 08IJ0/gsBDFYaPJq6fd6gJKAlsa8OeisEHyuPVaN/1b+us0n3+4yySPS036BWZC/VZ60N
	 F799xP1+38X6KUAC8PpCetO/Bl3wXoMWXxfEva6fEoyIqoBS69+uKAbZD+pdiO+CmCxDN
	 dYH18VdJOZ77PiFEo5Iq+QDtU/4Lq9Li7FibtM4m3MWL+Eyf72CYT5HsTTS5llLpWJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8514E1F031E8;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266270;
	bh=68BtqR7gpnmRO64Vr6Raq7UmjQqttR0m1LXAmQYas9U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=K4NAJEwScOA0W6nCuZ0qOD2ID56+zvH+qDrMuTlWOW3nsk+5/vnr40OQE0xEbmFXT
	 VWQBx6XzGjx1Nj50ZA1P9ObchqBmE60S/rnqVU0BrztIfBXXDFEOmhzx6r3+MIcQww
	 TYvqfC9/6fm3Qh7zk8mZ8ptRH1m3tagdQUadmQnUNmg2MhEaS1/EhRjgFM4fhUVUdv
	 ydHb+HnmenSWu87bNzVZ3HqyIUAQW2lb9OYjddlnCT4WvfNyOE/LnFheOthv95UUpI
	 7x/YjNUeYfWCf5P3bYsA7cn7dynksgOrqX/aLxw9ROQv0rC9uBKv5lymA4SKl+66IZ
	 R+5DguhXJXHqQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 163D3457BC;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as a
 divider clock
Date: Thu, 29 Oct 2026 17:30:51 +0800
Message-Id: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
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
X-B4-Tracking: v=1; b=H4sIAEsS42oC/3VN3QqCMBR+FTnXLbZjanYVBD6AdBciYx31QNtiC
 ynEd29539XH979ApMAU4ZQtEGjmyN4lgrsMzKTdSILviQNKLGWNubAUvesDDdq8fOidoGrAopY
 HKvISUu2ZPH5vkzdom8tPa5srdAknjqn02d5mtSX+D89KSJHroyGsFCqNZ20ffmSzN95Ct67rF
 zwQkza+AAAA
X-Change-ID: 20260923-meson_refactor_n-e7f25904e536
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266267; l=3965;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=+xz8hM24ZaI8tpLRSfQtNJtwQnB5D4aMVwHyBZ3ov9g=;
 b=zNADH7GFiXTzeR3FlkuLyerMA/cjtZxzMP3X4vmtMB4MI98CrbRZptm66+UdHRaKtW+buP8Wt
 Ti+T/HM8Z7JAv7z0+Z1AGAIQVM71D78R9g7jp21GZGBZV0yv6eRtnac
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

This series refactors the Meson PLL framework to remove the dedicated
PLL pre-divider (N) parameter from the PLL implementation and model it
as a separate divider clock.

Currently, the Meson PLL framework models the PLL pre-divider using a
dedicated n field in struct meson_clk_pll_data. This makes the
pre-divider part of the PLL-specific implementation, although the
Common Clock Framework already provides a generic divider clock.

The pre-divider is not intended to be dynamically adjusted. Each PLL
has a fixed N value as part of its configuration. Most PLLs use N = 1,
while a few special cases use N = 3 to satisfy their PLL input frequency
constraints. Modeling the pre-divider as a separate divider clock
removes PLL-specific handling and simplifies the PLL framework.

The series updates the Amlogic SoC clock drivers to use standalone
pre-divider clocks, with the PLL DCO taking the pre-divider clock as
its parent instead of the input clock directly. It also adds the
required clock IDs.

Some Amlogic PLL pre-dividers read as zero after reset, which
does not produce a usable clock. The existing divider implementation
reports the parent rate for a zero divisor, potentially hiding this
invalid state. In addition, when the requested pre-divider rate equals
the parent rate, the divider must be configured with a divisor of 1.
The zero value read from the register after reset must not prevent the
divider from being configured correctly.

To address these issues, the series introduces
CLK_DIVIDER_INVALID_ZERO, allowing dividers with an invalid zero
value to report a rate of zero instead of incorrectly reporting the
parent rate.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Add CLK_DIVIDER_INVALID_ZERO.
- Add all SoCs prediv clock index.
- Support table for pll m.
- Fix the `determine` logic: when `best_parent_rate` equals 0,
  recalculate a new `parent_rate`.
- Add all SoCs pll prediv clocks.
- Link to v1: https://lore.kernel.org/r/20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com

---
Jian Hu (3):
      dt-bindings: clock: amlogic: Add PLL pre-divider clock IDs
      clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
      clk: meson: pll: Remove the dedicated n parameter

 drivers/clk/clk-divider.c                       |   3 +
 drivers/clk/meson/a1-pll.c                      |  69 ++++--
 drivers/clk/meson/axg.c                         | 230 ++++++++++++------
 drivers/clk/meson/c3-pll.c                      |  99 ++++++--
 drivers/clk/meson/clk-pll.c                     | 203 ++++++----------
 drivers/clk/meson/clk-pll.h                     |  17 +-
 drivers/clk/meson/clk-regmap.h                  |   2 +-
 drivers/clk/meson/g12a.c                        | 265 ++++++++++++++++-----
 drivers/clk/meson/gxbb.c                        | 304 ++++++++++++++++--------
 drivers/clk/meson/meson8-ddr.c                  |  39 ++-
 drivers/clk/meson/meson8b.c                     | 238 +++++++++++++------
 drivers/clk/meson/s4-pll.c                      | 128 +++++++---
 drivers/clk/meson/t7-pll.c                      | 186 +++++++++++----
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h |   3 +
 include/dt-bindings/clock/amlogic,c3-pll-clkc.h |   3 +
 include/dt-bindings/clock/amlogic,s4-pll-clkc.h |   4 +
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
 include/dt-bindings/clock/axg-clkc.h            |   5 +
 include/dt-bindings/clock/g12a-clkc.h           |   8 +
 include/dt-bindings/clock/gxbb-clkc.h           |   4 +
 include/dt-bindings/clock/meson8-ddr-clkc.h     |   1 +
 include/dt-bindings/clock/meson8b-clkc.h        |   4 +
 include/linux/clk-provider.h                    |   6 +
 23 files changed, 1271 insertions(+), 556 deletions(-)
---
base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
change-id: 20260923-meson_refactor_n-e7f25904e536

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


