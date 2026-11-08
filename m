Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153501;
	b=LuZEY2DXAqgMArr0NSnAlIjaa877QdReV+U1quNiiZ4AmiQqyzrL/JR2y/E2S9cZKrPn
	 BQ4V0TUD11o3vQsDZUNBEUJpnBiR4cej2+5RkVtAY5YcUCS+to4W8dEfI28cNZj9HlWyM
	 ssddc6zAPO3SzUrk44f9Q6wgCWYUMAvfeX4lmRVDde6peeQYk+nKsi9Te0CaSREE5vSS4
	 +Xm0D76JKha4BXj8jUChEy5eN0O/s6BnZ7IRzI3iYdWk9495dERD4w1Q/wLW81jXSveGm
	 8aaUgbMoze5NcSWZr05T7JBHADrC8xHbrr0qn7L5dnFIQEj2cS9mfa2BPNvzLH2OjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MCgplqqWQtaAqXmK5vBowRmhSTG5TTv5KMf7lX33ePI=;
	b=0Qqvfg73uk/mQYPp8NJvVku9t2ygCA8BD6ALyVU4hKPh51YVnI1aSUzLhgmpYCu5s0X9
	 MAyo9e/XqsXrYkyOGXLXvmpcJ6A/SNEly1TFEVClvu7FIs3VJkt0r7PIRhcEpoECsb0Cg
	 WDotTTkvG9PCT2scK3jUmnFA5em3NeQAePUhaARHM5rVqSL8xz6b7CWxHHe18D/bFvsdK
	 NTtDHQvX7zZFyEPj+65tAelmrkAKYnm+kd5wA8dJBXbiEj9DRdAwlK0Iu4wAj2cOV8MOJ
	 34/lxGa2EbgU6Fo4BHnNo6xX/NPfqXux7ef+wpeQz2OZ6p2DeCgtp7WwyajZUG2tNcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T8/Vhs9w";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC91606A335
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 15:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC91606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8/Vhs9w
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so912825e9.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153499; x=1794758299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCgplqqWQtaAqXmK5vBowRmhSTG5TTv5KMf7lX33ePI=;
        b=T8/Vhs9wiLe2C13fKgYKV6vEE2YjAxSIQ23IGFF1e7PdHdPSZTnz5B4BVefWse87MB
         IdkqeQzUF8nBsvAQxdQ2Hv0iCCekxdiWtVsp2udOXiOaHvn2U5jAJ8Ny61n+otoOkSTG
         iydrX+r6ikPTtFJZBAsKBdfzQWOt+HyFrbCzHzBHLWaJHM5RvE9JEoyySRCbuBiJWn79
         Tcx9EEna8P+DJOPry36AayJP8/KX0CDTB3RiTjTqYqb2lzk0Ky1Vr85+bULc3rlxXDfr
         RAwMMRy/cQblbA4eZKCyeHZu2Sevdk/kKFz8yk2Nnge+1eQ4SrTQN+cqFQ2b/OxzGnDQ
         Jx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153499; x=1794758299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCgplqqWQtaAqXmK5vBowRmhSTG5TTv5KMf7lX33ePI=;
        b=NiEbWPbYXsDGKT5KOnW97EDT9EHDTJpTXTyeofjoWuBaffJSzQwrFsioYNUp3vweT6
         E3eWZHFY1J7Xm/1uPtv2zdxe72gc8gTNDHxBbmIqwBAfG2VU3dS7SuoMoR4claJngYVr
         ruPdi0ogrgLGUVenrSfoCLnIsJUJ6nQEpSykAO5RUeArYcMAo1ix8kc4NgEDH+oTsm7a
         mDgavpUEll8OLEiyKh7XMeeb8fSeS0zvNjlTme+I9UlO6Wu4G/ObhlZpqBwXgHvMEV/j
         WRaSrw0BUplZvVws66KylF3ErUlZ7FqEHpzz8uxBjL4R71tvSZYEvMo6kDXPJfoYk8ze
         j0Hw==
X-Forwarded-Encrypted: i=1; AL+hErF5KLAS7cTu814sC+0RiUXkKCFkHpf2Wpc+yfb2371w7mnBh90/jPUMaSsbWffOt9qjNjc8e+qRsq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GgU/18KNL1F/dCad8nE/ge5G6soHXFADLA0GffmlXTKVdr5Lv
	W5Q+dh+o3NGXlsrHf+oZmeZBMzOzNM8fgu0DaR/x24f2CK8PmOpkhJRYKxVJZjP6Drimsw==
X-Gm-Gg: AYBFou0bdGZngT81jaDGUN7c+5arHtMPokBMlWpW73qAZrWIwqsLZjQX1d8iN4YCMWi
	Whzrdys3NxPmO32KLW5/V+2DHcBxvUTPKN8hXxwWQJzmg6NAIWjHz6T+V8/3kRXe4Bqvml8hu41
	2k4J02ISwpL6g0GWsP94B8DwYWExZk/Euy0eQ/DIGsNMKCatZhiRiRnIt5mm4J46D7yK7byqkwd
	OJwd0HzAPbPapJq1tiMihm/wDlPuT+/TGI1/IkP3xOssincAKLz/+BQR/mO6sMis2L0JsIy9l+1
	wjKDcs5DbZA9gOZkPpqhqJQd0EgNb48Qhe2Dcy7lC+BEjHdQXEtUpeWIJisvHpsWhRn1huFZ1VM
	YYjKGaXzOSZC+hNsU12OeOlLhRsu1VQXkKSR313MuMfWw/xPWwGj4w/yoqrxECcocqaHREdbIY/
	5jnbDuVkDPuRHJZL3NL0riSn6VTeGV6MxZliVvK1Ih0ZMlMnkjvM8S5VOf7p4LPl0bRmJVtoXG2
	h7KaDUuQ2XqnLFrxtakg80bcFtd3fDwD0yhG/0OYA7ClfhbjddTWVgydZ7jcreHTFoxgwQxW8y9
	4TMJxogu9LlSyJ+j10TgJMbdjkxBE/pIrruG6oe2WtDlTWIlZxBy+unykuLCPAc=
X-Received: by 2002:a05:600c:1c04:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4b94d76337cmr42522555e9.1.1794153498478;
        Sun, 08 Nov 2026 07:58:18 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:17 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] clk: sunxi-ng: add a table front end
Date: Sun,  8 Nov 2026 15:57:00 +0000
Message-ID: <20261108155702.361022-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let a SoC describe its CCU as one table indexed by DT clock ID, instead
of a structure per clock plus the ccu_clks and hw_clks lists and a reset
table. The core builds the usual ccu_* clocks from it at probe time,
derives each bus gate's reset from the generation's register layout, and
provides the clocks that a generation shares as templates.

Only the A31 generation is described for now.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/clk/sunxi-ng/Makefile    |   1 +
 drivers/clk/sunxi-ng/ccu_table.c | 510 +++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_table.h | 233 ++++++++++++++
 3 files changed, 744 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.h

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index a1c4087d7241..796f443f4d76 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_SUNXI_CCU)		+= sunxi-ccu.o
 sunxi-ccu-y			+= ccu_common.o
 sunxi-ccu-y			+= ccu_mmc_timing.o
 sunxi-ccu-y			+= ccu_reset.o
+sunxi-ccu-y			+= ccu_table.o
 
 # Base clock types
 sunxi-ccu-y			+= ccu_div.o
diff --git a/drivers/clk/sunxi-ng/ccu_table.c b/drivers/clk/sunxi-ng/ccu_table.c
new file mode 100644
index 000000000000..7be783e623f7
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_table.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Table front end for the sunxi-ng clock types.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include "ccu_common.h"
+#include "ccu_div.h"
+#include "ccu_gate.h"
+#include "ccu_mp.h"
+#include "ccu_mult.h"
+#include "ccu_mux.h"
+#include "ccu_nk.h"
+#include "ccu_nkmp.h"
+#include "ccu_nm.h"
+#include "ccu_phase.h"
+#include "ccu_table.h"
+
+/*
+ * A31 generation (A31, A23/A33, A83T, H3/H5, R40, V3s, A64, ...): a bus
+ * gate's reset is the same bit of a paired register.
+ */
+static const struct ccu_tbl_rst_pair ccu_tbl_a31_rst_pairs[] = {
+	{ 0x060, 0x2c0 },
+	{ 0x064, 0x2c4 },
+	{ 0x068, 0x2d0 },
+	{ 0x06c, 0x2d8 },
+};
+
+static struct ccu_sdm_setting ccu_tbl_a31_audio_sdm_table[] = {
+	{ .rate = 22579200, .pattern = 0xc0010d84, .m = 8, .n = 7 },
+	{ .rate = 24576000, .pattern = 0xc000ac02, .m = 14, .n = 14 },
+};
+
+static const struct ccu_sdm_internal ccu_tbl_a31_audio_sdm =
+	_SUNXI_CCU_SDM(ccu_tbl_a31_audio_sdm_table, BIT(24), 0x284, BIT(31));
+
+/* AHB1 divides PLL_PERIPH0 by a pre-divider at [7:6] */
+static const struct ccu_mux_var_prediv ccu_tbl_a31_ahb1_predivs[] = {
+	{ .index = 3, .shift = 6, .width = 2 },
+};
+
+static struct clk_div_table ccu_tbl_a31_apb1_div_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 8 },
+	{ /* Sentinel */ },
+};
+
+static const struct ccu_tbl_clk ccu_tbl_a31_std[CCU_TBL_STD_NUM] = {
+	[CCU_TBL_STD_PLL_CPU] = {
+		.type	= CCU_TBL_TYPE_PLL_NKMP,
+		.reg	= 0x000,
+		.n	= { 8, 5 },
+		.k	= { 4, 2 },
+		.m	= { 0, 2 },
+		.p	= { 16, 2, 0, 4 },
+	},
+	[CCU_TBL_STD_PLL_AUDIO] = {
+		.type	= CCU_TBL_TYPE_PLL_NM,
+		.reg	= 0x008,
+		.n	= { 8, 7 },
+		.m	= { 0, 5 },
+		.sdm	= &ccu_tbl_a31_audio_sdm,
+		/* the sigma-delta table assumes the P divider is 1 */
+		.init_clear = GENMASK(19, 16),
+	},
+	[CCU_TBL_STD_PLL_VIDEO] = {
+		.type	= CCU_TBL_TYPE_PLL_NM,
+		.n	= { 8, 7 },
+		.m	= { 0, 4 },
+		.frac	= true,
+	},
+	[CCU_TBL_STD_CPUX] = {
+		.type	= CCU_TBL_TYPE_MUX,
+		.reg	= 0x050,
+		.mux	= { 16, 2 },
+	},
+	[CCU_TBL_STD_AXI] = {
+		.type	= CCU_TBL_TYPE_DIV,
+		.reg	= 0x050,
+		.m	= { 0, 2 },
+	},
+	[CCU_TBL_STD_AHB1] = {
+		.type		= CCU_TBL_TYPE_DIV,
+		.reg		= 0x054,
+		.m		= { 4, 2 },
+		.m_flags	= CLK_DIVIDER_POWER_OF_TWO,
+		.mux		= { 12, 2 },
+		.var_predivs	= ccu_tbl_a31_ahb1_predivs,
+		.n_var_predivs	= ARRAY_SIZE(ccu_tbl_a31_ahb1_predivs),
+	},
+	[CCU_TBL_STD_APB1] = {
+		.type	= CCU_TBL_TYPE_DIV,
+		.reg	= 0x054,
+		.m	= { 8, 2 },
+		.m_table = ccu_tbl_a31_apb1_div_table,
+	},
+	[CCU_TBL_STD_APB2] = {
+		.type	= CCU_TBL_TYPE_MP,
+		.reg	= 0x058,
+		.m	= { 0, 5 },
+		.p	= { 16, 2 },
+		.mux	= { 24, 2 },
+	},
+};
+
+const struct ccu_tbl_gen ccu_tbl_gen_a31 = {
+	.rst_pairs	= ccu_tbl_a31_rst_pairs,
+	.num_rst_pairs	= ARRAY_SIZE(ccu_tbl_a31_rst_pairs),
+	.mod_m		= { 0, 4 },
+	.mod_p		= { 16, 2 },
+	.mod_mux	= { 24, 2 },
+	.mod_gate	= BIT(31),
+	.pll_enable	= BIT(31),
+	.pll_lock	= BIT(28),
+	.pll_frac	= _SUNXI_CCU_FRAC(BIT(24), BIT(25), 270000000, 297000000),
+	.std		= ccu_tbl_a31_std,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_tbl_gen_a31, "SUNXI_CCU");
+
+static struct ccu_mult_internal ccu_tbl_mult(const struct ccu_tbl_field *f)
+{
+	return (struct ccu_mult_internal)
+		_SUNXI_CCU_MULT_OFFSET_MIN_MAX(f->shift, f->width, 1,
+					       f->min ?: 1, 0);
+}
+
+static struct ccu_div_internal ccu_tbl_div(const struct ccu_tbl_field *f)
+{
+	return (struct ccu_div_internal)
+		_SUNXI_CCU_DIV_MAX(f->shift, f->width, f->max);
+}
+
+static struct ccu_mux_internal ccu_tbl_mux(const struct ccu_tbl_field *f)
+{
+	return (struct ccu_mux_internal)_SUNXI_CCU_MUX(f->shift, f->width);
+}
+
+/* Expand a template entry into a full one */
+static const struct ccu_tbl_clk *ccu_tbl_resolve(const struct ccu_tbl_gen *gen,
+						 const struct ccu_tbl_clk *c,
+						 struct ccu_tbl_clk *buf)
+{
+	if (c->type != CCU_TBL_TYPE_STD)
+		return c;
+
+	if (c->std >= CCU_TBL_STD_NUM || !gen->std || !gen->std[c->std].type)
+		return NULL;
+
+	*buf = gen->std[c->std];
+	buf->name = c->name;
+	buf->parents = c->parents;
+	buf->parent = c->parent;
+	buf->flags = c->flags;
+	if (c->reg_set)
+		buf->reg = c->reg;
+
+	return buf;
+}
+
+static struct ccu_common *ccu_tbl_alloc_ccu(struct device *dev,
+					    const struct ccu_tbl_gen *gen,
+					    const struct ccu_tbl_clk *c,
+					    const struct clk_ops **ops)
+{
+	struct ccu_phase *phase;
+	struct ccu_nkmp *nkmp;
+	struct ccu_gate *gate;
+	struct ccu_div *div;
+	struct ccu_mux *mux;
+	struct ccu_mp *mp;
+	struct ccu_nk *nk;
+	struct ccu_nm *nm;
+
+	switch (c->type) {
+	case CCU_TBL_TYPE_GATE:
+		gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
+		if (!gate)
+			return ERR_PTR(-ENOMEM);
+		gate->enable = c->gate;
+		*ops = &ccu_gate_ops;
+		return &gate->common;
+
+	case CCU_TBL_TYPE_DIV:
+		div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+		if (!div)
+			return ERR_PTR(-ENOMEM);
+		div->enable = c->gate;
+		if (c->m_table)
+			div->div = (struct ccu_div_internal)
+				_SUNXI_CCU_DIV_TABLE_FLAGS(c->m.shift, c->m.width,
+							   c->m_table,
+							   c->m_flags);
+		else
+			div->div = (struct ccu_div_internal)
+				_SUNXI_CCU_DIV_FLAGS(c->m.shift, c->m.width,
+						     c->m_flags);
+		div->mux = ccu_tbl_mux(&c->mux);
+		if (c->n_var_predivs) {
+			div->mux.var_predivs = c->var_predivs;
+			div->mux.n_var_predivs = c->n_var_predivs;
+			div->common.features = CCU_FEATURE_VARIABLE_PREDIV;
+		}
+		*ops = &ccu_div_ops;
+		return &div->common;
+
+	case CCU_TBL_TYPE_MUX:
+		mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+		if (!mux)
+			return ERR_PTR(-ENOMEM);
+		mux->enable = c->gate;
+		mux->mux = ccu_tbl_mux(&c->mux);
+		*ops = &ccu_mux_ops;
+		return &mux->common;
+
+	case CCU_TBL_TYPE_MP:
+	case CCU_TBL_TYPE_MOD: {
+		bool std = c->type == CCU_TBL_TYPE_MOD;
+
+		mp = devm_kzalloc(dev, sizeof(*mp), GFP_KERNEL);
+		if (!mp)
+			return ERR_PTR(-ENOMEM);
+		mp->enable = std ? gen->mod_gate : c->gate;
+		mp->m = ccu_tbl_div(std ? &gen->mod_m : &c->m);
+		mp->p = ccu_tbl_div(std ? &gen->mod_p : &c->p);
+		mp->mux = ccu_tbl_mux(std ? &gen->mod_mux : &c->mux);
+		if (c->postdiv) {
+			mp->fixed_post_div = c->postdiv;
+			mp->common.features = CCU_FEATURE_FIXED_POSTDIV;
+		}
+		*ops = &ccu_mp_ops;
+		return &mp->common;
+	}
+
+	case CCU_TBL_TYPE_PHASE:
+		phase = devm_kzalloc(dev, sizeof(*phase), GFP_KERNEL);
+		if (!phase)
+			return ERR_PTR(-ENOMEM);
+		phase->shift = c->m.shift;
+		phase->width = c->m.width;
+		*ops = &ccu_phase_ops;
+		return &phase->common;
+
+	case CCU_TBL_TYPE_PLL_NK:
+		nk = devm_kzalloc(dev, sizeof(*nk), GFP_KERNEL);
+		if (!nk)
+			return ERR_PTR(-ENOMEM);
+		nk->enable = gen->pll_enable;
+		nk->lock = gen->pll_lock;
+		nk->n = ccu_tbl_mult(&c->n);
+		nk->k = ccu_tbl_mult(&c->k);
+		if (c->postdiv) {
+			nk->fixed_post_div = c->postdiv;
+			nk->common.features = CCU_FEATURE_FIXED_POSTDIV;
+		}
+		*ops = &ccu_nk_ops;
+		return &nk->common;
+
+	case CCU_TBL_TYPE_PLL_NM:
+		nm = devm_kzalloc(dev, sizeof(*nm), GFP_KERNEL);
+		if (!nm)
+			return ERR_PTR(-ENOMEM);
+		nm->enable = gen->pll_enable;
+		nm->lock = gen->pll_lock;
+		nm->n = ccu_tbl_mult(&c->n);
+		nm->m = ccu_tbl_div(&c->m);
+		if (c->frac) {
+			nm->frac = gen->pll_frac;
+			nm->common.features = CCU_FEATURE_FRACTIONAL;
+		}
+		if (c->sdm) {
+			nm->sdm = *c->sdm;
+			nm->common.features = CCU_FEATURE_SIGMA_DELTA_MOD;
+		}
+		*ops = &ccu_nm_ops;
+		return &nm->common;
+
+	case CCU_TBL_TYPE_PLL_NKMP:
+		nkmp = devm_kzalloc(dev, sizeof(*nkmp), GFP_KERNEL);
+		if (!nkmp)
+			return ERR_PTR(-ENOMEM);
+		nkmp->enable = gen->pll_enable;
+		nkmp->lock = gen->pll_lock;
+		nkmp->n = ccu_tbl_mult(&c->n);
+		nkmp->k = ccu_tbl_mult(&c->k);
+		nkmp->m = ccu_tbl_div(&c->m);
+		nkmp->p = ccu_tbl_div(&c->p);
+		*ops = &ccu_nkmp_ops;
+		return &nkmp->common;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static struct clk_hw *ccu_tbl_alloc(struct device *dev,
+				    const struct ccu_tbl_gen *gen,
+				    const struct ccu_tbl_clk *c,
+				    struct ccu_common **common,
+				    const struct clk_ops **ops)
+{
+	struct clk_fixed_factor *ff;
+	struct clk_fixed_rate *fr;
+
+	*common = NULL;
+
+	switch (c->type) {
+	case CCU_TBL_TYPE_FIXED_RATE:
+		fr = devm_kzalloc(dev, sizeof(*fr), GFP_KERNEL);
+		if (!fr)
+			return ERR_PTR(-ENOMEM);
+		fr->fixed_rate = c->rate;
+		*ops = &clk_fixed_rate_ops;
+		return &fr->hw;
+
+	case CCU_TBL_TYPE_FIXED_FACTOR:
+		ff = devm_kzalloc(dev, sizeof(*ff), GFP_KERNEL);
+		if (!ff)
+			return ERR_PTR(-ENOMEM);
+		ff->mult = c->mult;
+		ff->div = c->div;
+		*ops = &clk_fixed_factor_ops;
+		return &ff->hw;
+	}
+
+	*common = ccu_tbl_alloc_ccu(dev, gen, c, ops);
+	if (IS_ERR(*common))
+		return ERR_CAST(*common);
+
+	(*common)->reg = c->reg;
+
+	return &(*common)->hw;
+}
+
+static int ccu_tbl_set_parents(struct device *dev,
+			       const struct sunxi_ccu_table *tbl,
+			       const struct ccu_tbl_clk *c,
+			       struct clk_hw **hws, struct clk_init_data *init)
+{
+	const u16 *ids = c->parents ? c->parents->ids : &c->parent;
+	unsigned int i, num = c->parents ? c->parents->num : 1;
+	struct clk_parent_data *pd;
+
+	pd = devm_kcalloc(dev, num, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++) {
+		switch (ids[i]) {
+		case CCU_TBL_HOSC:
+			pd[i].fw_name = "hosc";
+			break;
+		case CCU_TBL_LOSC:
+			pd[i].fw_name = "losc";
+			break;
+		case CCU_TBL_IOSC:
+			pd[i].fw_name = "iosc";
+			break;
+		default:
+			if (ids[i] >= tbl->num_clks || !hws[ids[i]]) {
+				dev_err(dev, "%s: invalid parent %u\n",
+					c->name, ids[i]);
+				return -EINVAL;
+			}
+			pd[i].hw = hws[ids[i]];
+		}
+	}
+
+	init->parent_data = pd;
+	init->num_parents = num;
+
+	return 0;
+}
+
+static struct ccu_reset_map *ccu_tbl_resets(struct device *dev,
+					    const struct sunxi_ccu_table *tbl)
+{
+	const struct ccu_tbl_gen *gen = tbl->gen;
+	struct ccu_reset_map *map;
+	unsigned int i, j;
+
+	map = devm_kcalloc(dev, tbl->num_resets, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+	if (tbl->resets)
+		memcpy(map, tbl->resets, tbl->num_resets * sizeof(*map));
+
+	for (i = 0; i < tbl->num_clks; i++) {
+		const struct ccu_tbl_clk *c = &tbl->clks[i];
+
+		if (c->type != CCU_TBL_TYPE_GATE || c->rst == CCU_TBL_NO_RST)
+			continue;
+
+		for (j = 0; j < gen->num_rst_pairs; j++)
+			if (gen->rst_pairs[j].gate_reg == c->reg)
+				break;
+
+		if (c->rst >= tbl->num_resets || j == gen->num_rst_pairs ||
+		    map[c->rst].bit) {
+			dev_err(dev, "%s: invalid reset %u\n", c->name, c->rst);
+			return ERR_PTR(-EINVAL);
+		}
+
+		map[c->rst].reg = gen->rst_pairs[j].rst_reg;
+		map[c->rst].bit = c->gate;
+	}
+
+	return map;
+}
+
+int devm_sunxi_ccu_table_probe(struct device *dev, void __iomem *reg,
+			       const struct sunxi_ccu_table *tbl)
+{
+	struct clk_hw_onecell_data *hw_clks;
+	struct ccu_common **ccu_clks;
+	struct clk_init_data *inits;
+	struct sunxi_ccu_desc *desc;
+	struct ccu_reset_map *resets;
+	unsigned int i, n = 0;
+	int ret;
+
+	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
+	hw_clks = devm_kzalloc(dev, struct_size(hw_clks, hws, tbl->num_clks),
+			       GFP_KERNEL);
+	ccu_clks = devm_kcalloc(dev, tbl->num_clks, sizeof(*ccu_clks),
+				GFP_KERNEL);
+	inits = devm_kcalloc(dev, tbl->num_clks, sizeof(*inits), GFP_KERNEL);
+	if (!desc || !hw_clks || !ccu_clks || !inits)
+		return -ENOMEM;
+
+	hw_clks->num = tbl->num_clks;
+
+	/* Create all clocks first, so that parents can be looked up by ID */
+	for (i = 0; i < tbl->num_clks; i++) {
+		struct ccu_common *common;
+		const struct ccu_tbl_clk *c;
+		struct ccu_tbl_clk buf;
+		struct clk_hw *hw;
+
+		if (!tbl->clks[i].type)
+			continue;
+
+		c = ccu_tbl_resolve(tbl->gen, &tbl->clks[i], &buf);
+		if (!c) {
+			dev_err(dev, "%s: no such template\n",
+				tbl->clks[i].name);
+			return -EINVAL;
+		}
+
+		hw = ccu_tbl_alloc(dev, tbl->gen, c, &common, &inits[i].ops);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		if (c->init_clear)
+			writel(readl(reg + c->reg) & ~c->init_clear,
+			       reg + c->reg);
+
+		inits[i].name = c->name;
+		inits[i].flags = c->flags;
+		hw->init = &inits[i];
+
+		hw_clks->hws[i] = hw;
+		if (common)
+			ccu_clks[n++] = common;
+	}
+
+	for (i = 0; i < tbl->num_clks; i++) {
+		if (!hw_clks->hws[i])
+			continue;
+
+		ret = ccu_tbl_set_parents(dev, tbl, &tbl->clks[i],
+					  hw_clks->hws, &inits[i]);
+		if (ret)
+			return ret;
+	}
+
+	resets = ccu_tbl_resets(dev, tbl);
+	if (IS_ERR(resets))
+		return PTR_ERR(resets);
+
+	desc->ccu_clks = ccu_clks;
+	desc->num_ccu_clks = n;
+	desc->hw_clks = hw_clks;
+	desc->resets = resets;
+	desc->num_resets = tbl->num_resets;
+
+	return devm_sunxi_ccu_probe(dev, reg, desc);
+}
+EXPORT_SYMBOL_NS_GPL(devm_sunxi_ccu_table_probe, "SUNXI_CCU");
+
+/* Probe for a CCU platform device whose match data is its table */
+int sunxi_ccu_table_platform_probe(struct platform_device *pdev)
+{
+	void __iomem *reg;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	return devm_sunxi_ccu_table_probe(&pdev->dev, reg,
+					  device_get_match_data(&pdev->dev));
+}
+EXPORT_SYMBOL_NS_GPL(sunxi_ccu_table_platform_probe, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_table.h b/drivers/clk/sunxi-ng/ccu_table.h
new file mode 100644
index 000000000000..8ceaff55fdd2
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_table.h
@@ -0,0 +1,233 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Table front end for the sunxi-ng clock types: a SoC lists its clocks
+ * as one table indexed by DT clock ID, and the core builds the usual
+ * ccu_* structures from it at probe time. Clocks that are the same on a
+ * whole SoC generation come from the generation's templates.
+ */
+
+#ifndef _CCU_TABLE_H_
+#define _CCU_TABLE_H_
+
+#include <linux/clk-provider.h>
+
+#include "ccu_common.h"
+#include "ccu_frac.h"
+#include "ccu_mux.h"
+#include "ccu_reset.h"
+#include "ccu_sdm.h"
+
+struct platform_device;
+
+/* Parent IDs naming the CCU inputs from the device tree */
+#define CCU_TBL_HOSC		0xfff0
+#define CCU_TBL_LOSC		0xfff1
+#define CCU_TBL_IOSC		0xfff2
+
+#define CCU_TBL_NO_RST		0xffff
+
+struct ccu_tbl_parents {
+	const u16	*ids;
+	u8		num;
+};
+
+#define CCU_TBL_PARENTS(_name, ...)					\
+	static const u16 _name##_ids[] = { __VA_ARGS__ };		\
+	static const struct ccu_tbl_parents _name = {			\
+		.ids	= _name##_ids,					\
+		.num	= ARRAY_SIZE(_name##_ids),			\
+	}
+
+/* A register field; min and max only apply to some of them */
+struct ccu_tbl_field {
+	u8	shift;
+	u8	width;
+	u8	min;
+	u8	max;
+};
+
+enum ccu_tbl_type {
+	CCU_TBL_TYPE_FIXED_RATE = 1,
+	CCU_TBL_TYPE_FIXED_FACTOR,
+	CCU_TBL_TYPE_GATE,		/* ccu_gate, reset from the generation rule */
+	CCU_TBL_TYPE_DIV,		/* ccu_div: M, optional mux and gate */
+	CCU_TBL_TYPE_MUX,		/* ccu_mux: mux, optional gate */
+	CCU_TBL_TYPE_MP,		/* ccu_mp: M and P, mux, optional gate */
+	CCU_TBL_TYPE_MOD,		/* ccu_mp with the generation's layout */
+	CCU_TBL_TYPE_PHASE,		/* ccu_phase */
+	CCU_TBL_TYPE_PLL_NK,		/* ccu_nk */
+	CCU_TBL_TYPE_PLL_NM,		/* ccu_nm, optional frac or sdm */
+	CCU_TBL_TYPE_PLL_NKMP,		/* ccu_nkmp */
+	CCU_TBL_TYPE_STD,		/* one of the generation's templates */
+};
+
+/* Templates every generation may provide */
+enum ccu_tbl_std {
+	CCU_TBL_STD_PLL_CPU,
+	CCU_TBL_STD_PLL_AUDIO,
+	CCU_TBL_STD_PLL_VIDEO,
+	CCU_TBL_STD_CPUX,
+	CCU_TBL_STD_AXI,
+	CCU_TBL_STD_AHB1,
+	CCU_TBL_STD_APB1,
+	CCU_TBL_STD_APB2,
+	CCU_TBL_STD_NUM
+};
+
+struct ccu_tbl_clk {
+	const char			*name;
+	u8				type;
+	unsigned long			flags;
+
+	/* Either a set of parents, or a single parent ID */
+	const struct ccu_tbl_parents	*parents;
+	u16				parent;
+
+	u16				reg;
+	bool				reg_set;	/* overrides a template's */
+	u8				std;
+	u32				gate;
+	u16				rst;
+
+	struct ccu_tbl_field		n;
+	struct ccu_tbl_field		k;
+	struct ccu_tbl_field		m;
+	struct ccu_tbl_field		p;
+	struct ccu_tbl_field		mux;
+	u32				m_flags;
+	struct clk_div_table		*m_table;
+	const struct ccu_mux_var_prediv	*var_predivs;
+	u8				n_var_predivs;
+	u8				postdiv;
+
+	bool				frac;
+	const struct ccu_sdm_internal	*sdm;
+
+	/* Bits of reg cleared before the clock is registered */
+	u32				init_clear;
+
+	unsigned long			rate;
+	unsigned int			mult;
+	unsigned int			div;
+};
+
+/*
+ * Layout shared by a SoC generation: where a bus gate's reset lives, the
+ * standard module clock register, the PLL control bits, and the clocks
+ * that are the same on all of its SoCs.
+ */
+struct ccu_tbl_rst_pair {
+	u16	gate_reg;
+	u16	rst_reg;
+};
+
+struct ccu_tbl_gen {
+	const struct ccu_tbl_rst_pair	*rst_pairs;
+	u8				num_rst_pairs;
+
+	struct ccu_tbl_field		mod_m;
+	struct ccu_tbl_field		mod_p;
+	struct ccu_tbl_field		mod_mux;
+	u32				mod_gate;
+
+	u32				pll_enable;
+	u32				pll_lock;
+	struct ccu_frac_internal	pll_frac;
+
+	const struct ccu_tbl_clk	*std;
+};
+
+extern const struct ccu_tbl_gen ccu_tbl_gen_a31;
+
+struct sunxi_ccu_table {
+	const struct ccu_tbl_gen	*gen;
+
+	const struct ccu_tbl_clk	*clks;
+	unsigned int			num_clks;
+
+	/* Resets without a bus gate, indexed by reset ID */
+	const struct ccu_reset_map	*resets;
+	unsigned int			num_resets;
+};
+
+int devm_sunxi_ccu_table_probe(struct device *dev, void __iomem *reg,
+			       const struct sunxi_ccu_table *tbl);
+int sunxi_ccu_table_platform_probe(struct platform_device *pdev);
+
+/* Table entries */
+
+#define CCU_TBL_FIXED_RATE(_id, _name, _parent, _rate)			\
+	[_id] = { .type = CCU_TBL_TYPE_FIXED_RATE, .name = _name,	\
+		  .parent = _parent, .rate = _rate }
+
+#define CCU_TBL_FIXED_FACTOR(_id, _name, _parent, _mult, _div)		\
+	[_id] = { .type = CCU_TBL_TYPE_FIXED_FACTOR, .name = _name,	\
+		  .parent = _parent, .mult = _mult, .div = _div }
+
+#define CCU_TBL_GATE(_id, _name, _parent, _reg, _bit, _rst)		\
+	[_id] = { .type = CCU_TBL_TYPE_GATE, .name = _name,		\
+		  .parent = _parent, .reg = _reg, .gate = BIT(_bit),	\
+		  .rst = _rst }
+
+#define CCU_TBL_DIV(_id, _name, _parent, _reg, _ms, _mw, _flags)	\
+	[_id] = { .type = CCU_TBL_TYPE_DIV, .name = _name,		\
+		  .parent = _parent, .reg = _reg,			\
+		  .m = { _ms, _mw }, .flags = _flags }
+
+#define CCU_TBL_DIV_MUX_GATE(_id, _name, _parents, _reg, _ms, _mw,	\
+			     _xs, _xw, _gate, _flags)			\
+	[_id] = { .type = CCU_TBL_TYPE_DIV, .name = _name,		\
+		  .parents = &(_parents), .reg = _reg,			\
+		  .m = { _ms, _mw }, .mux = { _xs, _xw },		\
+		  .gate = _gate, .flags = _flags }
+
+#define CCU_TBL_MUX_GATE(_id, _name, _parents, _reg, _xs, _xw, _gate,	\
+			 _flags)					\
+	[_id] = { .type = CCU_TBL_TYPE_MUX, .name = _name,		\
+		  .parents = &(_parents), .reg = _reg,			\
+		  .mux = { _xs, _xw }, .gate = _gate, .flags = _flags }
+
+#define CCU_TBL_MOD(_id, _name, _parents, _reg, _flags)		\
+	[_id] = { .type = CCU_TBL_TYPE_MOD, .name = _name,		\
+		  .parents = &(_parents), .reg = _reg, .flags = _flags }
+
+#define CCU_TBL_MOD_POSTDIV(_id, _name, _parents, _reg, _postdiv,	\
+			    _flags)					\
+	[_id] = { .type = CCU_TBL_TYPE_MOD, .name = _name,		\
+		  .parents = &(_parents), .reg = _reg,			\
+		  .postdiv = _postdiv, .flags = _flags }
+
+#define CCU_TBL_PHASE(_id, _name, _parent, _reg, _shift, _width)	\
+	[_id] = { .type = CCU_TBL_TYPE_PHASE, .name = _name,		\
+		  .parent = _parent, .reg = _reg,			\
+		  .m = { _shift, _width } }
+
+/* PLLs; the enable and lock bits come from the generation */
+#define CCU_TBL_PLL_NK(_id, _name, _parent, _reg, _ns, _nw, _ks, _kw,	\
+		       _kmin, _postdiv, _flags)				\
+	[_id] = { .type = CCU_TBL_TYPE_PLL_NK, .name = _name,		\
+		  .parent = _parent, .reg = _reg,			\
+		  .n = { _ns, _nw }, .k = { _ks, _kw, _kmin },		\
+		  .postdiv = _postdiv, .flags = _flags }
+
+#define CCU_TBL_PLL_NM(_id, _name, _parent, _reg, _ns, _nw, _ms, _mw,	\
+		       _flags)						\
+	[_id] = { .type = CCU_TBL_TYPE_PLL_NM, .name = _name,		\
+		  .parent = _parent, .reg = _reg,			\
+		  .n = { _ns, _nw }, .m = { _ms, _mw }, .flags = _flags }
+
+/* Generation templates: at their usual register, or at _reg */
+#define CCU_TBL_STD(_id, _name, _std, _parents, _flags)		\
+	[_id] = { .type = CCU_TBL_TYPE_STD, .std = CCU_TBL_STD_##_std,	\
+		  .name = _name, .parents = &(_parents), .flags = _flags }
+
+#define CCU_TBL_STD1(_id, _name, _std, _parent, _flags)		\
+	[_id] = { .type = CCU_TBL_TYPE_STD, .std = CCU_TBL_STD_##_std,	\
+		  .name = _name, .parent = _parent, .flags = _flags }
+
+#define CCU_TBL_STD_AT(_id, _name, _std, _reg, _parent, _flags)	\
+	[_id] = { .type = CCU_TBL_TYPE_STD, .std = CCU_TBL_STD_##_std,	\
+		  .name = _name, .parent = _parent, .reg = _reg,	\
+		  .reg_set = true, .flags = _flags }
+
+#endif /* _CCU_TABLE_H_ */
-- 
2.52.0

