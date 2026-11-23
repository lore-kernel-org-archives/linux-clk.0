Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427954;
	b=Apkz/MmpEHNFK3BlCVQJm5gFsanNQmtA6k7cuDLZ7DtK/Y+jheDUDYa9r/eRFM/Q1H8D
	 Jh0AjNuHzJ1ifVu00ZTqQbG9NRi1/GIjAu0WmPLZKynbXIZ+t6fhgO9jdaQwxIDQYTI3a
	 tmCcSgwqHr6eH88YsqnUlLUWypE3z+xRW7NpvKHBBIqHAPhmQq1e8cEesZ7ztdwiXQ9Hl
	 mQ3jeqa4RoIfZMKqWbemryh07RpBixPnoVtz1ZQZrczs/gcy6CHTywxf3Jt5K1tNw4c0j
	 ZOGhKqEpzRS4X+6K47Zb+V0ztH+XDqwPOQNqXDeV6ACGOTuitmZgdLrIGJYU8aYF44w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427954;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=GXSlddgNRhY7nn0Q9NC1Frayuyrx9J9bHxE9+gmRGzE=;
	b=XzXFFR6tpXcXUvn3dBBnHpTMdV9LVinyxMvbARzXU8UxBbk+6auv7ImqGNR/3TsWLaqZ
	 WPAN2ZEj34jCL2VA3CjaOCZ65LZiz+7rb2+KUOftxCWf+1y4iU76hwemIBh4rEmUEKu3p
	 ZLpWBj8ZcgK0+u8MpHX22lJddjv1IHN8HXStHccGsWsgdvn41zcJWOtLk3IwOL3Cq+Kbo
	 ZkaGMgl+V7v/zB7Q2Torteg+oksicNd57CM2GrGMNs75YkTZtmvi3cDXJJiw+7n5dl/9B
	 VtrdUpaWdKdseIUzhM5El15FAK5dcmj87xvsJGDxIazM/dFNGhRPXcKoy2evEE0KJCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="omSW/DAo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91DD606A6B5;
	Mon, 23 Nov 2026 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omSW/DAo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795427954;
	b=uaF8k9jsXRB4WKxJF130o6Tb7lFw57J35ApgBh8fqCOcbrKnaD15SqYQYS8Oqo2Sz5aw
	 McSqC3vBBk8Jm7DV0HGvvcdzeDx3+zdn+jTCtPDjUuG7HQ4Cut6521bm3fha9xhVmFSw5
	 Rk9BRY3jHBJ53EvYxLLn9am5ph0yBJ4NtW6PYJMlQ56+PsOS7060nt1oBbGw/OsJgdvzC
	 YuMswvnrtz9wBy2YD1P1zK7bPEF5P68DFmLeXBEKqcNPx6zOW1RmFmRFXdP+KxR12OnnE
	 2W41G6ybjq8V0847IDbnoTFuJizm8VvA1aN2FZrHBXmnwXB+iOzMXAE/LGJFWvktqfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427954;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=GXSlddgNRhY7nn0Q9NC1Frayuyrx9J9bHxE9+gmRGzE=;
	b=F5SO2rDv+KeS7pUjd9PRBlE4fxEUgJ60iBGIyW7A/jzPJAWwlJ1xS3Vnq8Pg7F6BZOFt
	 t5REVDNejj6mNNejNlQZSLuPry3mS5HzEojUdXWdOTDb88ULVL27MBqvilBe+qP4CQZhD
	 LfiacvfSCtZid1f8xgoLDCEJGqENzwuks9BRImGs9UL8rTiY1rbD+rEWy5DOS4uZF5nas
	 V+PQ8z7RBFQ7ZubKiHoiZGffHsyuOCsQP/JfUxhUsYP5iI8wjYyEItlFOG5B3WamJwaxj
	 w/4+PcxqAqf09qr7zsWHoTlHRhhNIuh5QRHckZZzs+AEP/w8hWdSA5rTz3QNjs1cemw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FACF1F000D4;
	Mon, 23 Nov 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427954;
	bh=GXSlddgNRhY7nn0Q9NC1Frayuyrx9J9bHxE9+gmRGzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=omSW/DAoifBgjxVzCqUkmQZk3cV/STgs49gpm62JcC872cjuM1mb42avAFlnCKTsr
	 iIwXrKcsFd0QYicMIfDPucRZ3o3TEd3D+GK9lLtQP12/eMV0qqJo11UB5OA9S9saaH
	 zndo7zOLHamOIBgFzbLFpkVBUVY9h0D96naT+HSrlYp6D630Lk5rp1AqwgV0cIFTYK
	 v+kg/G6zLP7tclNB83PZUpj2kkjn7PliEPxW4Wk18cive55TBucXbZgWDt1lOEo7ck
	 TJEaTKIFwZAu94OVOIy753uTPEVirIoGnpiaG/nUgmRCv1Fa0e1vFlaJWsiGw8bITq
	 +uNC+HuimNd8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D05494C3FF;
	Mon, 23 Nov 2026 09:59:02 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 23 Nov 2026 17:59:01 +0800
Subject: [PATCH v7 2/5] clk: rockchip: Add 24-bit fractional divider
 support
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
Message-Id: <20261123-add-board-ok3572-c-clk-v7-2-16f6860191a9@qq.com>
References: <20261123-add-board-ok3572-c-clk-v7-0-16f6860191a9@qq.com>
In-Reply-To: <20261123-add-board-ok3572-c-clk-v7-0-16f6860191a9@qq.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: Cunhao Lu <1579567540@qq.com>, Jonas Karlman <jonas@kwiboo.se>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795427940; l=15622;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=QBhBExUeuTzP9d4o550ALTWEGcQC0QAcSUVxnpy4M+M=;
 b=rKz8fKdaCqd9uBevYRFBDu/nncGcDyQjKYPyffCqTD24rLI+2o81FkI+RWq5BQyRpBebTaECT
 ScJ2/JkqycUCfPfPsiDury5Ng/gXzrlsSlKyQmQQNzWvMPKMlXS+DKL
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com

From: Elaine Zhang <zhangqing@rock-chips.com>

The RK3572 audio frac0-2 clocks use direct M/N encoding with 24-bit
numerators and denominators. Require 16 bits of each value in the low
register and 8 bits in the high register so programming and readback
use the same split.

Rockchip calls this layout v2. The original (v1) divider packs 16-bit
numerator and denominator fields into a single 32-bit register and uses
the common fractional-divider helper.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
[adapted to mainline rockchip fractional divider handling
 (determine_rate(), internal registration APIs);
 selected encodable compensated ratios with consistent integer-Hz rounding]
Co-developed-by: Cunhao Lu <1579567540@qq.com>
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v7:
- Fully initialize clk_init_data.
- Reject nonzero divider flags and field widths other than 16/8 bits.

Changes in v6:
- Explain the v1/v2 divider differences.
- Improve readability.

Changes in v5:
- Select encodable ratios within the compensation and field-width limits.
- Use consistent nearest-Hz rounding for rate determination and readback.

Changes in v3:
- Reject compensated ratios that exceed the actual field widths before
  multiplication or register writes.
---
 drivers/clk/rockchip/Makefile                    |   1 +
 drivers/clk/rockchip/clk-fractional-divider-v2.c | 354 +++++++++++++++++++++++
 drivers/clk/rockchip/clk.c                       |  10 +
 drivers/clk/rockchip/clk.h                       |  25 ++
 4 files changed, 390 insertions(+)

diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index 554b7eb83dc9..91d4ea4837e3 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -10,6 +10,7 @@ clk-rockchip-y += clk-pll.o
 clk-rockchip-y += clk-cpu.o
 clk-rockchip-y += clk-gate-grf.o
 clk-rockchip-y += clk-half-divider.o
+clk-rockchip-y += clk-fractional-divider-v2.o
 clk-rockchip-y += clk-inverter.o
 clk-rockchip-y += clk-mmc-phase.o
 clk-rockchip-y += clk-muxgrf.o
diff --git a/drivers/clk/rockchip/clk-fractional-divider-v2.c b/drivers/clk/rockchip/clk-fractional-divider-v2.c
new file mode 100644
index 000000000000..c1d578e10303
--- /dev/null
+++ b/drivers/clk/rockchip/clk-fractional-divider-v2.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
+ *
+ * Adjustable fractional divider clock implementation.
+ * Uses rational best approximation algorithm.
+ *
+ * Output is calculated as
+ *
+ *	rate = (m / n) * parent_rate				(1)
+ *
+ * The helper uses direct M/N encoding with 16-bit low and 8-bit high
+ * fields. The nonzero field limits are
+ *
+ *	1 <= m <= max_m = 2^mwidth - 1
+ *	1 <= n <= max_n = 2^nwidth - 1				(2)
+ *
+ * For m < 4, keep even denominators unchanged to preserve the duty ratio.
+ * For odd denominators, raise m to at least 4 without changing the ratio:
+ *
+ *	factor = ceil(4 / m), (m', n') = (factor * m, factor * n)	(3)
+ *
+ * Check m <= floor(max_m / factor) and n <= floor(max_n / factor) before
+ * multiplying. A zero numerator means bypass; if the best fraction has
+ * m = 0 or cannot be compensated within (2), choose the closest usable
+ * positive ratio. For these field widths, this fallback is needed only
+ * when
+ *
+ *	requested_rate / parent_rate < 6 / max_n			(4)
+ *
+ * The largest compensated small numerator is 3 * ceil(4 / 3) = 6.
+ * At or above this bound, 6 / max_n would beat the overflowing fraction;
+ * below it, no numerator above 6 can improve on 6 / max_n.
+ *
+ * For each m from 1 to 6, try the adjacent usable denominators around
+ * parent_rate * m / requested_rate, clamped to the field range. Their
+ * step is 2 for m < 4 and 1 otherwise. Minimize the exact frequency error:
+ *
+ *	error = abs(parent_rate * m - requested_rate * n) / n	(5)
+ *
+ * Compare errors by cross multiplication, choosing the lower rate on a
+ * tie. The minimum usable output is parent_rate / (max_n - 1), since m = 1
+ * needs an even denominator. Lower positive targets saturate at this
+ * limit without assuming an additional prescaler.
+ *
+ * determine_rate() and set_rate() share ratio selection. Rate reporting
+ * in determine_rate() and recalc_rate() uses the same nearest-Hz rounding:
+ *
+ *	reported_rate = floor(parent_rate * m / n + 1 / 2)		(6)
+ *
+ * This keeps integer-Hz rates consistent when programmed again. Division
+ * in these formulas is exact unless floor or ceil is specified.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/device.h>
+#include <linux/math64.h>
+#include <linux/slab.h>
+#include <linux/rational.h>
+#include "clk.h"
+
+#define CLK_FD_V2_LOW_WIDTH	16
+#define CLK_FD_V2_HIGH_WIDTH	8
+#define CLK_FD_V2_LOW_MASK	GENMASK(CLK_FD_V2_LOW_WIDTH - 1, 0)
+
+struct clk_fractional_divider_v2 {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	void __iomem	*high_reg;
+	u8		mshift;
+	u8		mwidth;
+	u32		mmask;
+	u8		nshift;
+	u8		nwidth;
+	u32		nmask;
+	u8		high_mshift;
+	u8		high_mwidth;
+	u32		high_mmask;
+	u8		high_nshift;
+	u8		high_nwidth;
+	u32		high_nmask;
+	spinlock_t	*lock; /* Protects the low and high register pair. */
+};
+
+#define to_clk_fd_v2(_hw) container_of(_hw, struct clk_fractional_divider_v2, hw)
+
+static unsigned long clk_fd_v2_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
+	unsigned long flags = 0;
+	unsigned long m_low, n_low, m_high, n_high, m, n;
+	u32 val_low, val_high;
+
+	if (fd->lock)
+		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
+
+	val_low = readl(fd->reg);
+	val_high = readl(fd->high_reg);
+
+	if (fd->lock)
+		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
+
+	m_low = (val_low & fd->mmask) >> fd->mshift;
+	n_low = (val_low & fd->nmask) >> fd->nshift;
+	m_high = (val_high & fd->high_mmask) >> fd->high_mshift;
+	n_high = (val_high & fd->high_nmask) >> fd->high_nshift;
+	m = (m_high << CLK_FD_V2_LOW_WIDTH) | m_low;
+	n = (n_high << CLK_FD_V2_LOW_WIDTH) | n_low;
+
+	if (!n || !m)
+		return parent_rate;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * m, n);
+}
+
+static int clk_fd_v2_get_low_rate_divider(struct clk_fractional_divider_v2 *fd,
+					  unsigned long rate, unsigned long parent_rate,
+					  unsigned long *m, unsigned long *n)
+{
+	unsigned long max_m = GENMASK(fd->mwidth - 1, 0);
+	unsigned long max_n = GENMASK(fd->nwidth - 1, 0);
+	unsigned long num, den, step;
+	u64 error, best_error = 0;
+	int i;
+
+	/*
+	 * Compensation can overflow only for m < 4, at ratios below
+	 * 6 / max_n. No numerator above 6 can improve on 6 / max_n.
+	 * Numerators below 4 need an even denominator to avoid compensation.
+	 */
+	*n = 0;
+	for (num = 1; num <= min(max_m, 6UL); num++) {
+		u64 dividend = (u64)parent_rate * num;
+
+		step = num < 4 ? 2 : 1;
+		den = min_t(u64, div64_ul(dividend, rate), max_n);
+		den = max(den - den % step, step);
+		for (i = 0; i < 2 && den <= max_n; i++, den += step) {
+			u64 target = (u64)rate * den;
+
+			error = dividend > target ? dividend - target : target - dividend;
+			if (!*n || error * *n < best_error * den ||
+			    (error * *n == best_error * den && num * *n < *m * den)) {
+				*m = num;
+				*n = den;
+				best_error = error;
+			}
+		}
+	}
+
+	return *n ? 0 : -EINVAL;
+}
+
+static int clk_fd_v2_get_divider(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate,
+				 unsigned long *m, unsigned long *n)
+{
+	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
+	u32 factor;
+
+	if (!parent_rate)
+		return -EINVAL;
+
+	if (!rate || rate > parent_rate)
+		rate = parent_rate;
+
+	rational_best_approximation(rate, parent_rate,
+				    GENMASK(fd->mwidth - 1, 0),
+				    GENMASK(fd->nwidth - 1, 0),
+				    m, n);
+
+	if (!*m)
+		return clk_fd_v2_get_low_rate_divider(fd, rate, parent_rate, m, n);
+
+	/*
+	 * When compensation the fractional divider,
+	 * the [1:0] bits of the numerator register are omitted,
+	 * which will lead to a large deviation in the result.
+	 * Therefore, it is required that the numerator must
+	 * be at least 4.
+	 *
+	 * Note that there are some exceptions here:
+	 * If there is an even frac div, we need to keep the original
+	 * numerator(<4) and denominator. Otherwise, it may cause the
+	 * issue that the duty ratio is not 50%.
+	 */
+	if (*m < 4 && *m != 0) {
+		if (*n % 2 == 0)
+			factor = 1;
+		else
+			factor = DIV_ROUND_UP(4, *m);
+
+		if (*m > GENMASK(fd->mwidth - 1, 0) / factor ||
+		    *n > GENMASK(fd->nwidth - 1, 0) / factor)
+			return clk_fd_v2_get_low_rate_divider(fd, rate, parent_rate, m, n);
+
+		*n *= factor;
+		*m *= factor;
+	}
+
+	return 0;
+}
+
+static int clk_fd_v2_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	unsigned long m, n;
+	int ret;
+
+	ret = clk_fd_v2_get_divider(hw, req->rate, req->best_parent_rate, &m, &n);
+	if (ret)
+		return ret;
+
+	/* Keep integer-Hz requests stable when set_rate() selects the divider. */
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate * m, n);
+	return 0;
+}
+
+static int clk_fd_v2_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
+	unsigned long flags = 0;
+	unsigned long m, n, m_low, n_low, m_high, n_high;
+	u32 val, val_high;
+	int ret;
+
+	ret = clk_fd_v2_get_divider(hw, rate, parent_rate, &m, &n);
+	if (ret)
+		return ret;
+
+	if (fd->lock)
+		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
+
+	m_low = m & CLK_FD_V2_LOW_MASK;
+	n_low = n & CLK_FD_V2_LOW_MASK;
+	m_high = (m & GENMASK(fd->mwidth - 1, (fd->mwidth - fd->high_mwidth))) >>
+		 (fd->mwidth - fd->high_mwidth);
+	n_high = (n & GENMASK(fd->nwidth - 1, (fd->nwidth - fd->high_nwidth))) >>
+		 (fd->nwidth - fd->high_nwidth);
+
+	val_high = readl(fd->high_reg);
+	val_high &= ~(fd->high_mmask | fd->high_nmask);
+	val_high |= (m_high << fd->high_mshift) | (n_high << fd->high_nshift);
+
+	writel(val_high, fd->high_reg);
+
+	val = readl(fd->reg);
+	val &= ~(fd->mmask | fd->nmask);
+	val |= (m_low << fd->mshift) | (n_low << fd->nshift);
+	writel(val, fd->reg);
+
+	if (fd->lock)
+		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
+
+	return 0;
+}
+
+static const struct clk_ops clk_fractional_divider_ops_v2 = {
+	.recalc_rate = clk_fd_v2_recalc_rate,
+	.determine_rate = clk_fd_v2_determine_rate,
+	.set_rate = clk_fd_v2_set_rate,
+};
+
+static struct clk_hw *clk_hw_register_fd_v2(struct device *dev,
+					    const char *name,
+					    const char *parent_name,
+					    unsigned long flags,
+					    void __iomem *reg,
+					    u8 mshift, u8 mwidth,
+					    u8 nshift, u8 nwidth,
+					    void __iomem *high_reg,
+					    u8 high_mshift, u8 high_mwidth,
+					    u8 high_nshift, u8 high_nwidth,
+					    spinlock_t *lock)
+{
+	struct clk_fractional_divider_v2 *fd;
+	struct clk_init_data init = {};
+	struct clk_hw *hw;
+	int ret;
+
+	fd = kzalloc_obj(*fd);
+	if (!fd)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_fractional_divider_ops_v2;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	fd->reg = reg;
+	fd->mshift = mshift;
+	fd->mwidth = mwidth + high_mwidth;
+	fd->mmask = GENMASK(mwidth - 1, 0) << mshift;
+	fd->nshift = nshift;
+	fd->nwidth = nwidth + high_nwidth;
+	fd->nmask = GENMASK(nwidth - 1, 0) << nshift;
+	fd->high_reg = high_reg;
+	fd->high_mshift = high_mshift;
+	fd->high_mwidth = high_mwidth;
+	fd->high_mmask = GENMASK(high_mwidth - 1, 0) << high_mshift;
+	fd->high_nshift = high_nshift;
+	fd->high_nwidth = high_nwidth;
+	fd->high_nmask = GENMASK(high_nwidth - 1, 0) << high_nshift;
+	fd->lock = lock;
+	fd->hw.init = &init;
+
+	hw = &fd->hw;
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(fd);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+struct clk *rockchip_clk_register_frac_v2(struct device *dev,
+					  const char *name,
+					  const char *parent_name,
+					  unsigned long flags,
+					  void __iomem *reg,
+					  u8 mshift, u8 width,
+					  void __iomem *high_reg,
+					  u8 high_mshift, u8 high_width,
+					  u8 clk_divider_flags,
+					  spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	if (clk_divider_flags || width != CLK_FD_V2_LOW_WIDTH ||
+	    high_width != CLK_FD_V2_HIGH_WIDTH)
+		return ERR_PTR(-EINVAL);
+
+	hw = clk_hw_register_fd_v2(dev, name, parent_name, flags,
+				   reg, mshift, width, 0, width,
+				   high_reg, high_mshift, high_width,
+				   0, high_width, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+
+	return hw->clk;
+}
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 10df21178ba4..2053e0d67a1b 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -589,6 +589,16 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				list->gate_flags, flags, list->child,
 				&ctx->lock);
 			break;
+		case branch_fraction_divider_v2:
+			clk = rockchip_clk_register_frac_v2(NULL, list->name,
+							    list->parent_names[0], flags,
+							    ctx->reg_base + list->muxdiv_offset,
+							    list->mux_shift, list->mux_width,
+							    ctx->reg_base + list->div_offset,
+							    list->div_shift, list->div_width,
+							    list->div_flags,
+							    &ctx->lock);
+			break;
 		case branch_half_divider:
 			clk = rockchip_clk_register_halfdiv(list->name,
 				list->parent_names, list->num_parents,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 4da264f5f0c8..063e3d567a2f 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -781,6 +781,13 @@ struct clk *rockchip_clk_register_ddrclk(const char *name, int flags,
 					 int ddr_flags, void __iomem *reg_base,
 					 spinlock_t *lock);
 
+struct clk *rockchip_clk_register_frac_v2(struct device *dev,
+					  const char *name, const char *parent_name,
+					  unsigned long flags, void __iomem *reg,
+					  u8 mshift, u8 width,
+					  void __iomem *high_reg, u8 high_mshift, u8 high_width,
+					  u8 clk_divider_flags, spinlock_t *lock);
+
 #define ROCKCHIP_INVERTER_HIWORD_MASK	BIT(0)
 
 struct clk *rockchip_clk_register_inverter(const char *name,
@@ -806,6 +813,7 @@ enum rockchip_clk_branch_type {
 	branch_grf_mux,
 	branch_divider,
 	branch_fraction_divider,
+	branch_fraction_divider_v2,
 	branch_gate,
 	branch_grf_gate,
 	branch_linked_gate,
@@ -1014,6 +1022,23 @@ struct rockchip_clk_branch {
 		.child		= ch,				\
 	}
 
+#define COMPOSITE_FRAC_V2(_id, cname, pname, f, mo, ms, mw, do, ds, dw, df) \
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_fraction_divider_v2,	\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.flags		= f,				\
+		.muxdiv_offset	= mo,				\
+		.mux_shift	= ms,				\
+		.mux_width	= mw,				\
+		.div_offset	= do,				\
+		.div_shift	= ds,				\
+		.div_width	= dw,				\
+		.div_flags	= df,				\
+	}
+
 #define COMPOSITE_FRACMUX_NOGATE(_id, cname, pname, f, mo, df, ch) \
 	{							\
 		.id		= _id,				\

-- 
2.34.1


