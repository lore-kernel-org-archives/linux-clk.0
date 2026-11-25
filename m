Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586470;
	b=YG2Sfr1JuK0SYBusqkcu2C2oyMaZMGiCxJYsgJUuQ71nZu07hdi+w5bZVTygZ05slwsL
	 gtdUMvIByV0+K/hEl0ENET6b9LkXD7QOvkcdCpaDM27zUbimiqHmsFyvY5I8kRCsb8ehn
	 4lRWW+yy4XZzdZOVr/CWFlACDYrWafmy4a8vBMwTY9WCMsJqdTusYwBt7h5hYPi6cN3qY
	 2HVw+OTKKD77lEGqPxwftf58P21rn9o7Dk77qSQjHbdvXhu6BByLy9FOy9TM8mPOd0XAZ
	 fbZEVDqItBdkHZvY2N5BR+nIjqoPlNf/ifxPOI/6E1g5fnMFe0gSq8IK1XLopejqsmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586470;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=wv8k67Y8zI0PqxvD7bv/2QGM6XQaMnNPdMrhzbE88CY=;
	b=r+o4kpkRDi5YTXmsrLr64tR96KO7CC+u/3HLBmWNZAA4ZJtPZ74Trf1MFI+ValmFkMgN
	 eZT/UBI9gwlqpsNy2s9+J7qtGvPBNrI+R1kZlfnjzmJbvUvrZVoVhwgY7kW1Sw4tr9E9o
	 MSmF/VRdGeUbWzYtGHJQ/sG1tFO4y2qHDylZicxgx5Hv9Dir/8yTYY/O/ntdWWVHzVpoU
	 HrcupVHLZtJfndO0NJ59nVriE3RAHbVunDyrQqGEb2TfTMxK00mklkiL3d4PqthvQGArG
	 8JVPghQDU6cSAfr0iGmmG/+y0qi17JPJ6EBzMp54v/ACNn47T90QF/VnBrQCWvlr/HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fer3kku7;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE8D606A332;
	Wed, 25 Nov 2026 06:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE8D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fer3kku7
X-UUID: 9414c110e89511f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=wv8k67Y8zI0PqxvD7bv/2QGM6XQaMnNPdMrhzbE88CY=;
	b=fer3kku7pyoWJv86GvR5QcZVnj4MEzeQvuCJ8ks9d1JZMuRpjqDeGb7jGRdE9M3Olu9oSpA8WQS3U4CCPjLqMA8XSV0m+jP5uF6AD67LzVVRKd6bDReSKHnh4HQbwkwYsOVvF5cLVkVfV10ckKjiKdpt0PhIlInHI9yK1TPYq68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:89f6235b-7ac5-4cfd-87b4-4a1ed34e8de5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:1410c266-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9414c110e89511f1b1788b6acf885367-20261125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1346752295; Wed, 25 Nov 2026 14:00:55 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:53 +0800
From: Echo Zhang <echo.zhang@mediatek.com>
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, <kyrie.wu@mediatek.com>,
	<ming-fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH 3/7] soc: mediatek: add MMDVFS core driver
Date: Wed, 25 Nov 2026 14:00:08 +0800
Message-ID: <20261125060037.649659-4-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125060037.649659-1-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
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
Content-Type: text/plain

Add the common MediaTek MMDVFS driver framework.

The core driver handles device probing, SoC data selection, clock provider
registration, power-management notification, and dispatch to the
microprocessor transport used for runtime performance voting.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 drivers/soc/mediatek/Kconfig                  |  19 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mmdvfs/Makefile          |   6 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c      | 462 ++++++++++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c     | 581 ++++++++++++++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h | 305 +++++++++
 include/soc/mediatek/mmdvfs.h                 |  72 +++
 7 files changed, 1446 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmdvfs/Makefile
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
 create mode 100644 include/soc/mediatek/mmdvfs.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..bb273a4461f0 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -60,6 +60,25 @@ config MTK_REGULATOR_COUPLER
 	default ARCH_MEDIATEK
 	depends on REGULATOR
 
+config MTK_MMDVFS
+	tristate "MediaTek MMDVFS support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_VCP_RPROC
+	help
+	  Say yes here to add support for the MediaTek Multimedia Dynamic
+	  Voltage and Frequency Scaling controller. The controller provides
+	  virtual clocks for multimedia hardware blocks and coordinates
+	  performance votes with platform voltage resources.
+
+config MTK_MMDVFS_MT8196
+	bool "MediaTek MT8196 MMDVFS support"
+	depends on MTK_MMDVFS
+	help
+	  Enable MMDVFS support for the MediaTek MT8196 platform.
+	  This adds the MT8196 multimedia clock voter topology and
+	  hardware voter operations used by the common MMDVFS driver.
+	  Select this option only on MT8196 based systems.
+
 config MTK_MMSYS
 	tristate "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 0665573e3c4b..f54ee4e2775c 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_MTK_DVFSRC) += mtk-dvfsrc.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
+obj-$(CONFIG_MTK_MMDVFS) += mmdvfs/
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
 obj-$(CONFIG_MTK_SVS) += mtk-svs.o
diff --git a/drivers/soc/mediatek/mmdvfs/Makefile b/drivers/soc/mediatek/mmdvfs/Makefile
new file mode 100644
index 000000000000..33a280827006
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_MTK_MMDVFS) += mtk-mmdvfs.o
+
+mtk-mmdvfs-y += mmdvfs-core.o
+mtk-mmdvfs-y += mmdvfs-clk.o
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
new file mode 100644
index 000000000000..114f3148cf46
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS Clock Provider
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "mmdvfs-internal.h"
+
+/* clkdev uses a 16-byte con_id buffer, including the trailing NUL. */
+#define MMDVFS_CLKDEV_CON_ID_MAX	16
+
+static const char *mmdvfs_get_clkdev_name(const char *name, char *buf, size_t size)
+{
+	if (strlen(name) < MMDVFS_CLKDEV_CON_ID_MAX)
+		return name;
+
+	return NULL;
+}
+
+/*
+ * mmdvfs_set_rate - Set operating frequency for a multimedia clock
+ * @hw: Clock hardware handle
+ * @rate: Requested frequency in Hz
+ * @parent_rate: Parent clock frequency (unused)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int mmdvfs_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct mmdvfs_user *user = to_mmdvfs_user(hw);
+	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_data *data;
+	struct mmdvfs_mux *mux;
+	struct mmdvfs_rc *rc;
+	u8 level = 0;
+	int i, ret = 0;
+
+	if (!user) {
+		pr_err("mmdvfs: Invalid user reference\n");
+		return -EINVAL;
+	}
+
+	mmdvfs = user->mmdvfs;
+	if (!mmdvfs || !mmdvfs->data) {
+		pr_err("mmdvfs: Invalid device reference for user %s\n",
+		       user->name ?: "unknown");
+		return -EINVAL;
+	}
+
+	data = mmdvfs->data;
+
+	if (!data->init_done)
+		return -EPROBE_DEFER;
+
+	if (!mmdvfs_is_valid_user_id(user->id) ||
+	    !mmdvfs_is_valid_mux_id(user->mux)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid user config: id=%d, mux=%d\n",
+			   user->id, user->mux);
+		return -EINVAL;
+	}
+
+	if (rate == 0) {
+		mmdvfs_dbg(mmdvfs->dev, "Zero rate request for user %s\n",
+			   user->name);
+		return 0;
+	}
+
+	mux = &data->mux[user->mux];
+	if (!mmdvfs_is_valid_rc_id(mux->rc)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid mux config: rc=%d for user %s\n",
+			   mux->rc, user->name);
+		return -EINVAL;
+	}
+
+	rc = &data->rc[mux->rc];
+	if (rc->level_num == 0 || rc->level_num > MMDVFS_MAX_LEVELS) {
+		mmdvfs_err(mmdvfs->dev, "Invalid RC level_num=%d for user %s\n",
+			   rc->level_num, user->name);
+		return -EINVAL;
+	}
+
+	if (mux->freq_num == 0 || mux->freq_num > MMDVFS_MAX_LEVELS) {
+		mmdvfs_err(mmdvfs->dev, "Invalid MUX freq_num=%d for user %s\n",
+			   mux->freq_num, user->name);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < mux->freq_num && i < MMDVFS_MAX_LEVELS; i++) {
+		if (rate <= mux->freq[i]) {
+			level = i;
+			break;
+		}
+	}
+
+	if (i == mux->freq_num)
+		level = mux->freq_num - 1;
+
+	if (!mmdvfs_is_valid_level(level)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid level=%d for rate=%lu, user=%s\n",
+			   level, rate, user->name);
+		return -EINVAL;
+	}
+
+	if (user->level == level) {
+		mmdvfs_dbg(mmdvfs->dev, "user %s: already at level %d, skip\n",
+			   user->name, level);
+		return 0;
+	}
+
+	mmdvfs_dbg(mmdvfs->dev, "user %s: rate %lu -> level %d (freq=%llu)\n",
+		   user->name, rate, level, mux->freq[level]);
+
+	mutex_lock(&mux->lock);
+
+	if (data->ops && data->ops->hw_vote) {
+		ret = data->ops->hw_vote(mmdvfs, user->id, level);
+		if (!ret) {
+			user->level = level;
+			mmdvfs_dbg(mmdvfs->dev,
+				   "Hardware vote successful for user %s\n",
+				   user->name);
+		} else {
+			mmdvfs_err(mmdvfs->dev,
+				   "Hardware vote failed for user %s: %d\n",
+				   user->name, ret);
+		}
+	} else {
+		mmdvfs_err(mmdvfs->dev,
+			   "Hardware voting mechanism not implemented\n");
+		ret = -EOPNOTSUPP;
+	}
+
+	mutex_unlock(&mux->lock);
+
+	return ret;
+}
+
+/*
+ * mmdvfs_recalc_rate - Recalculate current operating frequency
+ * @hw: Clock hardware handle
+ * @parent_rate: Parent clock frequency (unused)
+ *
+ * Return: Current frequency in Hz, or 0 on error
+ */
+static unsigned long mmdvfs_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct mmdvfs_user *user = to_mmdvfs_user(hw);
+	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_data *data;
+	struct mmdvfs_mux *mux;
+
+	if (!user) {
+		pr_err("mmdvfs: Invalid user reference in recalc_rate\n");
+		return 0;
+	}
+
+	mmdvfs = user->mmdvfs;
+	if (!mmdvfs || !mmdvfs->data) {
+		pr_err("mmdvfs: Invalid device reference for user %s in recalc_rate\n",
+		       user->name ?: "unknown");
+		return 0;
+	}
+
+	data = mmdvfs->data;
+
+	if (!mmdvfs_is_valid_user_id(user->id) ||
+	    !mmdvfs_is_valid_mux_id(user->mux)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid user config in recalc_rate\n");
+		return 0;
+	}
+
+	if (!mmdvfs_is_valid_level(user->level)) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Invalid level=%d for user=%s in recalc_rate\n",
+			   user->level, user->name);
+		return 0;
+	}
+
+	mux = &data->mux[user->mux];
+
+	return mux->freq[user->level];
+}
+
+/*
+ * mmdvfs_round_rate - Round requested frequency to supported value
+ * @hw: Clock hardware handle
+ * @rate: Requested frequency in Hz
+ * @parent_rate: Parent clock frequency (unused, may be NULL)
+ *
+ * Return: Rounded frequency in Hz, or negative error code
+ */
+static long mmdvfs_round_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *parent_rate)
+{
+	struct mmdvfs_user *user = to_mmdvfs_user(hw);
+	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_data *data;
+	struct mmdvfs_mux *mux;
+	struct mmdvfs_rc *rc;
+	int i;
+
+	if (!user) {
+		pr_err("mmdvfs: Invalid user reference in round_rate\n");
+		return -EINVAL;
+	}
+
+	mmdvfs = user->mmdvfs;
+	if (!mmdvfs || !mmdvfs->data) {
+		pr_err("mmdvfs: Invalid device reference for user %s in round_rate\n",
+		       user->name ?: "unknown");
+		return -EINVAL;
+	}
+
+	data = mmdvfs->data;
+
+	if (!mmdvfs_is_valid_user_id(user->id) ||
+	    !mmdvfs_is_valid_mux_id(user->mux)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid user config in round_rate\n");
+		return -EINVAL;
+	}
+
+	if (rate == 0) {
+		mmdvfs_dbg(mmdvfs->dev,
+			   "Zero rate request in round_rate for user %s\n",
+			   user->name);
+		return 0;
+	}
+
+	mux = &data->mux[user->mux];
+	if (!mmdvfs_is_valid_rc_id(mux->rc)) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Invalid mux config in round_rate\n");
+		return -EINVAL;
+	}
+
+	rc = &data->rc[mux->rc];
+	if (rc->level_num == 0 || rc->level_num > MMDVFS_MAX_LEVELS) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Invalid RC level_num in round_rate\n");
+		return -EINVAL;
+	}
+
+	if (mux->freq_num == 0 || mux->freq_num > MMDVFS_MAX_LEVELS) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Invalid MUX freq_num in round_rate\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < mux->freq_num && i < MMDVFS_MAX_LEVELS; i++) {
+		if (rate <= mux->freq[i]) {
+			mmdvfs_dbg(mmdvfs->dev,
+				   "round_rate: user %s, rate %lu -> %llu\n",
+				   user->name, rate, mux->freq[i]);
+			return mux->freq[i];
+		}
+	}
+
+	if (mux->freq_num > 0) {
+		unsigned long max_freq = mux->freq[mux->freq_num - 1];
+
+		mmdvfs_dbg(mmdvfs->dev,
+			   "round_rate: user %s, rate %lu -> %lu (max)\n",
+			   user->name, rate, max_freq);
+		return max_freq;
+	}
+
+	return -EINVAL;
+}
+
+static int mmdvfs_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	long rate;
+
+	rate = mmdvfs_round_rate(hw, req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+
+	return 0;
+}
+
+static const struct clk_ops mmdvfs_req_ops = {
+	.set_rate	= mmdvfs_set_rate,
+	.determine_rate	= mmdvfs_determine_rate,
+	.recalc_rate	= mmdvfs_recalc_rate,
+};
+
+/*
+ * mmdvfs_register_clocks - Register clock providers for MMDVFS
+ * @mmdvfs: MMDVFS device structure
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int mmdvfs_register_clocks(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_data *data;
+	struct clk_init_data init = {};
+	int i, ret;
+
+	if (!mmdvfs || !mmdvfs->dev) {
+		pr_err("mmdvfs: Invalid device reference in register_clocks\n");
+		return -EINVAL;
+	}
+
+	data = mmdvfs->data;
+	if (!data) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Invalid data reference in register_clocks\n");
+		return -EINVAL;
+	}
+
+	if (data->user_num == 0 || data->user_num > MMDVFS_MAX_USERS) {
+		mmdvfs_err(mmdvfs->dev, "Invalid user count: %d (max: %d)\n",
+			   data->user_num, MMDVFS_MAX_USERS);
+		return -EINVAL;
+	}
+
+	if (!data->user) {
+		mmdvfs_err(mmdvfs->dev, "User array not allocated\n");
+		return -EINVAL;
+	}
+
+	mmdvfs->clk_data = devm_kzalloc(mmdvfs->dev,
+					struct_size(mmdvfs->clk_data, hws,
+						    data->user_num),
+					GFP_KERNEL);
+	if (!mmdvfs->clk_data) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Failed to allocate clock data structure\n");
+		return -ENOMEM;
+	}
+
+	mmdvfs->clk_data->num = data->user_num;
+
+	for (i = 0; i < data->user_num; i++) {
+		struct mmdvfs_user *user = &data->user[i];
+		char clkdev_name[MMDVFS_CLKDEV_CON_ID_MAX];
+		const char *con_id;
+
+		if (!user) {
+			mmdvfs_err(mmdvfs->dev, "User %d is NULL\n", i);
+			ret = -EINVAL;
+			goto cleanup_clocks;
+		}
+
+		user->mmdvfs = mmdvfs;
+
+		if (!user->name || strlen(user->name) == 0) {
+			mmdvfs_err(mmdvfs->dev, "User %d has invalid name\n",
+				   i);
+			ret = -EINVAL;
+			goto cleanup_clocks;
+		}
+
+		if (!mmdvfs_is_valid_user_id(user->id) ||
+		    !mmdvfs_is_valid_mux_id(user->mux)) {
+			mmdvfs_err(mmdvfs->dev,
+				   "Invalid user config: name=%s, id=%d, mux=%d\n",
+				   user->name, user->id, user->mux);
+			ret = -EINVAL;
+			goto cleanup_clocks;
+		}
+
+		if (user->mux >= data->mux_num || !data->mux) {
+			mmdvfs_err(mmdvfs->dev,
+				   "User %s references invalid mux %d (max: %d)\n",
+				   user->name, user->mux, data->mux_num);
+			ret = -EINVAL;
+			goto cleanup_clocks;
+		}
+
+		memset(&init, 0, sizeof(init));
+		init.name = user->name;
+		init.ops = &mmdvfs_req_ops;
+		init.flags = CLK_GET_RATE_NOCACHE;
+		init.num_parents = 0;
+		init.parent_names = NULL;
+
+		user->clk_hw.init = &init;
+
+		ret = devm_clk_hw_register(mmdvfs->dev, &user->clk_hw);
+		if (ret) {
+			mmdvfs_err(mmdvfs->dev,
+				   "Failed to register clock %s (user %d): %d\n",
+				   user->name, i, ret);
+			goto cleanup_clocks;
+		}
+
+		mmdvfs->clk_data->hws[i] = &user->clk_hw;
+
+		if (user->clk_hw.clk) {
+			con_id = mmdvfs_get_clkdev_name(user->name,
+							clkdev_name,
+							sizeof(clkdev_name));
+			if (!con_id) {
+				mmdvfs_warn(mmdvfs->dev,
+					    "Skip clkdev alias for long clock name %s\n",
+					    user->name);
+			} else {
+				ret = devm_clk_hw_register_clkdev(mmdvfs->dev,
+								  &user->clk_hw,
+								  con_id, NULL);
+				if (ret) {
+					mmdvfs_err(mmdvfs->dev,
+						   "Failed to register clkdev for %s: %d\n",
+						   con_id, ret);
+					/* Non-fatal, continue */
+				}
+			}
+		}
+
+		mmdvfs_dbg(mmdvfs->dev, "Registered %s id=%d mux=%d\n",
+			   user->name, user->id, user->mux);
+	}
+
+	ret = devm_of_clk_add_hw_provider(mmdvfs->dev, of_clk_hw_onecell_get,
+					  mmdvfs->clk_data);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev,
+			   "Failed to register clock provider: %d\n", ret);
+		goto cleanup_clocks;
+	}
+
+	mmdvfs_info(mmdvfs->dev, "Successfully registered %d MMDVFS clocks\n",
+		    data->user_num);
+
+	return 0;
+
+cleanup_clocks:
+	mmdvfs->clk_data = NULL;
+	mmdvfs_err(mmdvfs->dev, "Clock registration failed, cleanup completed\n");
+	return ret;
+}
+
+/*
+ * mmdvfs_unregister_clocks - Unregister clock providers
+ * @mmdvfs: MMDVFS device structure
+ */
+void mmdvfs_unregister_clocks(struct mmdvfs_device *mmdvfs)
+{
+	if (mmdvfs && mmdvfs->dev)
+		mmdvfs_dbg(mmdvfs->dev, "MMDVFS clocks unregistered\n");
+}
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
new file mode 100644
index 000000000000..c32fa11557af
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS Core Framework
+ */
+
+#include <linux/atomic.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/sched/clock.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/suspend.h>
+#include <linux/workqueue.h>
+
+#include "mmdvfs-internal.h"
+
+static int mmdvfs_register_device(struct mmdvfs_device *mmdvfs);
+static void mmdvfs_unregister_device(struct mmdvfs_device *mmdvfs);
+
+struct mmdvfs_device *mmdvfs_find_device_by_version(enum mmdvfs_version_type version);
+struct mmdvfs_device *mmdvfs_find_device_any(void);
+
+struct mmdvfs_device *mmdvfs_find_device_any(void)
+{
+	return mmdvfs_find_device_by_version(MMDVFS_VERSION_HWCCF_DVFS_VOTER);
+}
+EXPORT_SYMBOL_GPL(mmdvfs_find_device_any);
+
+/**
+ * mmdvfs_get_version - Get MMDVFS voting mechanism type
+ *
+ * Return:
+ *   0 - No hardware voter
+ *   1 - HWCCF DVFS voter
+ */
+u32 mmdvfs_get_version(void)
+{
+	struct mmdvfs_device *mmdvfs;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs || !mmdvfs->data)
+		return MMDVFS_VERSION_NONE;
+
+	return mmdvfs->data->version;
+}
+EXPORT_SYMBOL_GPL(mmdvfs_get_version);
+
+/*
+ * mmdvfs_validate_topology - Validate RC/MUX/User topology consistency
+ * @mmdvfs: MMDVFS device structure
+ *
+ * Return: 0 on success, -EINVAL if topology validation fails
+ */
+static int mmdvfs_validate_topology(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+	int i, j;
+
+	if (!data || !data->mux || !data->rc) {
+		mmdvfs_err(mmdvfs->dev, "Invalid data structures for validation\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < data->mux_num; i++) {
+		struct mmdvfs_mux *mux = &data->mux[i];
+		struct mmdvfs_rc *rc;
+
+		if (!mux->name || strlen(mux->name) == 0) {
+			mmdvfs_err(mmdvfs->dev, "MUX %d has empty name\n", i);
+			return -EINVAL;
+		}
+
+		if (mux->rc >= data->rc_num) {
+			mmdvfs_err(mmdvfs->dev,
+				   "MUX %d (%s) has invalid RC reference: %d (max: %d)\n",
+				   i, mux->name, mux->rc, data->rc_num);
+			return -EINVAL;
+		}
+
+		rc = &data->rc[mux->rc];
+
+		if (rc->level_num == 0 || rc->level_num > MMDVFS_MAX_LEVELS) {
+			mmdvfs_err(mmdvfs->dev,
+				   "MUX %d (%s): RC %d has invalid level_num: %d\n",
+				   i, mux->name, mux->rc, rc->level_num);
+			return -EINVAL;
+		}
+
+		if (mux->freq_num == 0 || mux->freq_num > MMDVFS_MAX_LEVELS) {
+			mmdvfs_err(mmdvfs->dev,
+				   "MUX %d (%s): invalid freq_num: %d\n",
+				   i, mux->name, mux->freq_num);
+			return -EINVAL;
+		}
+
+		for (j = 0; j < mux->freq_num; j++) {
+			if (mux->freq[j] == 0) {
+				mmdvfs_err(mmdvfs->dev,
+					   "MUX %d (%s): incomplete freq table at level %d/%d (freq=0)\n",
+					   i, mux->name, j, mux->freq_num);
+				return -EINVAL;
+			}
+
+			if (j > 0 && mux->freq[j] <= mux->freq[j - 1]) {
+				mmdvfs_warn(mmdvfs->dev,
+					    "MUX %d (%s): freq not ascending: freq[%d]=%llu <= freq[%d]=%llu\n",
+					    i, mux->name, j, mux->freq[j],
+					    j - 1, mux->freq[j - 1]);
+			}
+		}
+
+		mmdvfs_dbg(mmdvfs->dev,
+			   "MUX[%d] validated: name=%s, rc=%d, freq_num=%d (RC levels=%d), freq_min=%llu, freq_max=%llu\n",
+			   i, mux->name, mux->rc, mux->freq_num,
+			   rc->level_num, mux->freq[0],
+			   mux->freq[mux->freq_num - 1]);
+	}
+
+	for (i = 0; i < data->user_num; i++) {
+		struct mmdvfs_user *user = &data->user[i];
+
+		if (!user->name || strlen(user->name) == 0) {
+			mmdvfs_err(mmdvfs->dev, "User %d has empty name\n", i);
+			return -EINVAL;
+		}
+
+		if (user->mux >= data->mux_num) {
+			mmdvfs_err(mmdvfs->dev,
+				   "User %d (%s) has invalid MUX reference: %d (max: %d)\n",
+				   i, user->name, user->mux, data->mux_num);
+			return -EINVAL;
+		}
+
+		mmdvfs_dbg(mmdvfs->dev,
+			   "User[%d] validated: name=%s, id=%d, mux=%d\n",
+			   i, user->name, user->id, user->mux);
+	}
+
+	mmdvfs_info(mmdvfs->dev, "Topology validation successful\n");
+	return 0;
+}
+
+/*
+ * mmdvfs_init_from_soc_data - Initialize from per-SoC topology data
+ * @mmdvfs: MMDVFS device structure
+ * @soc_data: Per-SoC static topology data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int mmdvfs_init_from_soc_data(struct mmdvfs_device *mmdvfs,
+				     const struct mmdvfs_soc_data *soc_data)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+	int i, ret;
+
+	if (!soc_data || soc_data->rc_num == 0 || soc_data->mux_num == 0 ||
+	    soc_data->user_num == 0) {
+		mmdvfs_err(mmdvfs->dev, "Invalid or missing SoC data\n");
+		return -EINVAL;
+	}
+
+	if (soc_data->rc_num > MMDVFS_MAX_RCS ||
+	    soc_data->mux_num > MMDVFS_MAX_MUXES ||
+	    soc_data->user_num > MMDVFS_MAX_USERS) {
+		mmdvfs_err(mmdvfs->dev, "SoC data exceeds max limits\n");
+		return -EINVAL;
+	}
+
+	data->rc = devm_kcalloc(mmdvfs->dev, soc_data->rc_num,
+				sizeof(*data->rc), GFP_KERNEL);
+	if (!data->rc)
+		return -ENOMEM;
+
+	data->mux = devm_kcalloc(mmdvfs->dev, soc_data->mux_num,
+				 sizeof(*data->mux), GFP_KERNEL);
+	if (!data->mux)
+		return -ENOMEM;
+
+	data->user = devm_kcalloc(mmdvfs->dev, soc_data->user_num,
+				  sizeof(*data->user), GFP_KERNEL);
+	if (!data->user)
+		return -ENOMEM;
+
+	for (i = 0; i < soc_data->rc_num; i++)
+		data->rc[i] = soc_data->rc_table[i];
+
+	for (i = 0; i < soc_data->mux_num; i++) {
+		data->mux[i] = soc_data->mux_table[i];
+		mutex_init(&data->mux[i].lock);
+	}
+
+	for (i = 0; i < soc_data->user_num; i++) {
+		data->user[i] = soc_data->user_table[i];
+		data->user[i].mmdvfs = mmdvfs;
+	}
+
+	data->rc_num = soc_data->rc_num;
+	data->mux_num = soc_data->mux_num;
+	data->user_num = soc_data->user_num;
+
+	mmdvfs_dbg(mmdvfs->dev, "Initialized SoC data: rc=%u mux=%u user=%u version=%d\n",
+		   soc_data->rc_num, soc_data->mux_num, soc_data->user_num,
+		   data->version);
+
+	if (data->ops && data->ops->probe) {
+		ret = data->ops->probe(mmdvfs);
+		if (ret) {
+			mmdvfs_err(mmdvfs->dev, "Platform probe failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = mmdvfs_validate_topology(mmdvfs);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Topology validation failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * mmdvfs_parse_dt - Parse device tree configuration
+ * @mmdvfs: MMDVFS device structure
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int mmdvfs_parse_dt(struct mmdvfs_device *mmdvfs)
+{
+	struct device_node *node = mmdvfs->dev->of_node;
+
+	if (!node) {
+		mmdvfs_err(mmdvfs->dev, "No device tree node found\n");
+		return -ENODEV;
+	}
+
+	mmdvfs_info(mmdvfs->dev, "Device tree parsed (hardware attributes)\n");
+
+	return 0;
+}
+
+/*
+ * mmdvfs_pm_notifier_callback - PM notifier callback for suspend/resume handling
+ * @nb: Notifier block
+ * @event: PM event type
+ * @data: Event data
+ *
+ * Return: NOTIFY_DONE
+ */
+static int mmdvfs_pm_notifier_callback(struct notifier_block *nb, unsigned long event,
+				       void *data)
+{
+	struct mmdvfs_data *mdata =
+		container_of(nb, struct mmdvfs_data, pm_notifier);
+	struct mmdvfs_device *mmdvfs = dev_get_drvdata(mdata->dev);
+
+	switch (event) {
+	case PM_SUSPEND_PREPARE:
+		mmdvfs_dbg(mmdvfs->dev, "System suspending...\n");
+
+		if (mdata->ops && mdata->ops->suspend_prepare)
+			mdata->ops->suspend_prepare(mmdvfs);
+
+		mdata->pm_suspended = true;
+		break;
+
+	case PM_POST_SUSPEND:
+		mmdvfs_dbg(mmdvfs->dev, "System resumed\n");
+
+		mdata->pm_suspended = false;
+
+		if (mdata->ops && mdata->ops->post_suspend)
+			mdata->ops->post_suspend(mmdvfs);
+		break;
+
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+/*
+ * mmdvfs_probe - Main probe function
+ * @pdev: Platform device
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int mmdvfs_probe(struct platform_device *pdev)
+{
+	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_data *data;
+	const struct mmdvfs_platform_data *pdata;
+	int ret;
+
+	mmdvfs = devm_kzalloc(&pdev->dev, sizeof(*mmdvfs), GFP_KERNEL);
+	if (!mmdvfs)
+		return -ENOMEM;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mmdvfs->dev = &pdev->dev;
+	mmdvfs->data = data;
+	data->dev = &pdev->dev;
+
+	mutex_init(&data->lock);
+
+	platform_set_drvdata(pdev, mmdvfs);
+
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (!pdata) {
+		mmdvfs_err(mmdvfs->dev, "No matching platform data\n");
+		return -ENODEV;
+	}
+
+	data->ops = pdata->ops;
+	data->version = pdata->soc_data->version;
+
+	if (data->version == MMDVFS_VERSION_HWCCF_DVFS_VOTER) {
+		data->hwccf_voter_priv = devm_kzalloc(&pdev->dev,
+						      sizeof(*data->hwccf_voter_priv),
+						      GFP_KERNEL);
+		if (!data->hwccf_voter_priv)
+			return -ENOMEM;
+
+		data->hwccf_voter_priv->mmdvfs = mmdvfs;
+	}
+
+	ret = mmdvfs_parse_dt(mmdvfs);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to parse device tree: %d\n", ret);
+		return ret;
+	}
+
+	ret = mmdvfs_init_from_soc_data(mmdvfs, pdata->soc_data);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to initialize from SoC data: %d\n", ret);
+		return ret;
+	}
+
+	if (data->ops && data->ops->init_hw) {
+		ret = data->ops->init_hw(mmdvfs);
+		if (ret) {
+			mmdvfs_err(mmdvfs->dev, "Failed to initialize hardware: %d\n", ret);
+			return ret;
+		}
+	}
+
+	data->init_done = true;
+
+	ret = mmdvfs_register_clocks(mmdvfs);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to register clocks: %d\n", ret);
+		goto err_deinit_hw;
+	}
+
+	data->pm_notifier.notifier_call = mmdvfs_pm_notifier_callback;
+	data->pm_notifier.priority = 0;
+	data->pm_suspended = false;
+	ret = register_pm_notifier(&data->pm_notifier);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to register PM notifier: %d\n", ret);
+		goto err_unregister_clocks;
+	}
+	mmdvfs_info(mmdvfs->dev, "PM notifier registered\n");
+
+	ret = mmdvfs_register_device(mmdvfs);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to register device: %d\n", ret);
+		goto err_unregister_pm_notifier;
+	}
+
+	mmdvfs_info(mmdvfs->dev, "MMDVFS driver probed successfully\n");
+	return 0;
+
+err_unregister_pm_notifier:
+	unregister_pm_notifier(&data->pm_notifier);
+
+err_unregister_clocks:
+	mmdvfs_unregister_clocks(mmdvfs);
+
+err_deinit_hw:
+	if (data->ops && data->ops->deinit_hw)
+		data->ops->deinit_hw(mmdvfs);
+
+	return ret;
+}
+
+/*
+ * mmdvfs_remove - Remove function
+ * @pdev: Platform device
+ *
+ * Return: 0 on success
+ */
+static void mmdvfs_remove(struct platform_device *pdev)
+{
+	struct mmdvfs_device *mmdvfs = platform_get_drvdata(pdev);
+	struct mmdvfs_data *data = mmdvfs->data;
+
+	unregister_pm_notifier(&data->pm_notifier);
+	mmdvfs_dbg(mmdvfs->dev, "PM notifier unregistered\n");
+
+	mmdvfs_unregister_clocks(mmdvfs);
+
+	if (data->ops && data->ops->deinit_hw)
+		data->ops->deinit_hw(mmdvfs);
+
+	mmdvfs_unregister_device(mmdvfs);
+
+	mmdvfs_info(mmdvfs->dev, "MMDVFS driver removed\n");
+}
+
+/* Platform data definitions for device match table */
+#if IS_ENABLED(CONFIG_MTK_MMDVFS_MT8196)
+static const struct mmdvfs_platform_data mmdvfs_mt8196_pdata = {
+	.soc_data = &mmdvfs_mt8196_soc_data,
+	.ops = &mmdvfs_mt8196_ops,
+};
+#endif
+
+static const struct of_device_id mmdvfs_of_match[] = {
+#if IS_ENABLED(CONFIG_MTK_MMDVFS_MT8196)
+	{
+		.compatible = "mediatek,mt8196-mmdvfs",
+		.data = &mmdvfs_mt8196_pdata,
+	},
+#endif
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mmdvfs_of_match);
+
+static struct platform_driver mmdvfs_driver = {
+	.probe = mmdvfs_probe,
+	.remove = mmdvfs_remove,
+	.driver = {
+		.name = "mediatek-mmdvfs",
+		.of_match_table = mmdvfs_of_match,
+	},
+};
+
+module_platform_driver(mmdvfs_driver);
+
+/* Device lookup mechanism to replace global variable */
+static DEFINE_MUTEX(mmdvfs_device_list_lock);
+static LIST_HEAD(mmdvfs_device_list);
+
+struct mmdvfs_device_node {
+	struct list_head list;
+	struct mmdvfs_device *mmdvfs;
+};
+
+struct mmdvfs_device *mmdvfs_find_device_by_version(enum mmdvfs_version_type version)
+{
+	struct mmdvfs_device_node *node;
+	struct mmdvfs_device *found = NULL;
+
+	mutex_lock(&mmdvfs_device_list_lock);
+	list_for_each_entry(node, &mmdvfs_device_list, list) {
+		if (node->mmdvfs && node->mmdvfs->data &&
+		    node->mmdvfs->data->version == version) {
+			found = node->mmdvfs;
+			break;
+		}
+	}
+	mutex_unlock(&mmdvfs_device_list_lock);
+
+	return found;
+}
+EXPORT_SYMBOL_GPL(mmdvfs_find_device_by_version);
+
+static int mmdvfs_register_device(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_device_node *node;
+
+	node = kzalloc_obj(*node, GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	node->mmdvfs = mmdvfs;
+
+	mutex_lock(&mmdvfs_device_list_lock);
+	list_add(&node->list, &mmdvfs_device_list);
+	mutex_unlock(&mmdvfs_device_list_lock);
+
+	return 0;
+}
+
+static void mmdvfs_unregister_device(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_device_node *node, *tmp;
+
+	mutex_lock(&mmdvfs_device_list_lock);
+	list_for_each_entry_safe(node, tmp, &mmdvfs_device_list, list) {
+		if (node->mmdvfs == mmdvfs) {
+			list_del(&node->list);
+			kfree(node);
+			break;
+		}
+	}
+	mutex_unlock(&mmdvfs_device_list_lock);
+}
+
+int mtk_mmdvfs_camera_notify(bool enable)
+{
+	struct mmdvfs_device *mmdvfs;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
+	    !mmdvfs->data->ops->camera_notify)
+		return -EOPNOTSUPP;
+
+	return mmdvfs->data->ops->camera_notify(mmdvfs, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_mmdvfs_camera_notify);
+
+int mtk_mmdvfs_genpd_notify(u8 idx, bool enable)
+{
+	struct mmdvfs_device *mmdvfs;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
+	    !mmdvfs->data->ops->genpd_notify)
+		return -EOPNOTSUPP;
+
+	return mmdvfs->data->ops->genpd_notify(mmdvfs, idx, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_mmdvfs_genpd_notify);
+
+int mtk_mmdvfs_set_avs(u8 idx, u32 aging, u32 fresh)
+{
+	struct mmdvfs_device *mmdvfs;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
+	    !mmdvfs->data->ops->set_avs)
+		return -EOPNOTSUPP;
+
+	return mmdvfs->data->ops->set_avs(mmdvfs, idx, aging, fresh);
+}
+EXPORT_SYMBOL_GPL(mtk_mmdvfs_set_avs);
+
+int mmdvfs_set_lp_mode(bool enable)
+{
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(mmdvfs_set_lp_mode);
+
+int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable)
+{
+	struct mmdvfs_device *mmdvfs;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
+	    !mmdvfs->data->ops->camsv_dc_enable)
+		return -EOPNOTSUPP;
+
+	return mmdvfs->data->ops->camsv_dc_enable(mmdvfs, idx, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_mmdvfs_camsv_dc_enable);
+
+int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx)
+{
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(mtk_mmdvfs_enable_ccu);
+
+MODULE_DESCRIPTION("MediaTek MMDVFS Driver");
+MODULE_AUTHOR("MediaTek Inc.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
new file mode 100644
index 000000000000..df16e38d78c8
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
@@ -0,0 +1,305 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS (MultiMedia Dynamic Voltage and Frequency Scaling) Driver
+ */
+
+#ifndef __MMDVFS_H__
+#define __MMDVFS_H__
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+
+struct dentry;
+
+#define MMDVFS_MAX_LEVELS		8
+#define MMDVFS_MAX_USERS		64
+#define MMDVFS_MAX_MUXES		16
+#define MMDVFS_MAX_RCS			4
+
+/* MMDVFS voting mechanism types */
+enum mmdvfs_version_type {
+	MMDVFS_VERSION_NONE = 0,		/* No hardware voter */
+	MMDVFS_VERSION_HWCCF_DVFS_VOTER = 1,	/* HWCCF DVFS voter */
+};
+
+#define MAX_OPP				8
+
+/* MMDVFS RC domains */
+enum mmdvfs_rc_domain {
+	MMDVFS_PWR_VCORE = 0,  /* PWR_MMDVFS_VCORE */
+	MMDVFS_PWR_VMM   = 1,  /* PWR_MMDVFS_VMM */
+	MMDVFS_PWR_VDISP = 2,  /* PWR_MMDVFS_VDISP */
+	MMDVFS_PWR_NUM   = 3   /* PWR_MMDVFS_NUM */
+};
+
+/**
+ * struct mmdvfs_rc - Resource Controller
+ * @id: RC identifier
+ * @pa: Physical address base
+ * @level_num: Number of supported levels
+ * @rc_base: Virtual address base (mapped from pa)
+ */
+struct mmdvfs_rc {
+	u8 id;
+	u32 pa;
+	u8 level_num;
+	void __iomem *rc_base;
+};
+
+/**
+ * struct mmdvfs_mux - Multiplexer
+ * @id: MUX identifier
+ * @rc: Associated RC id
+ * @pos: Position in RC
+ * @shift: Bit shift for this mux in registers
+ * @hwccf: HWCCF voter register offsets and update bit
+ * @name: MUX name
+ * @freq: Frequency table for each level
+ * @freq_num: Actual number of frequencies in freq array (from OPP table)
+ * @lock: Serialize updates for this MUX
+ */
+struct mmdvfs_mux {
+	u8 id;
+	u8 rc;
+	u8 pos;
+	u8 shift;
+	struct {
+		u32 hwv_set_ofs;
+		u32 hwv_clr_ofs;
+		u32 hwv_sta_ofs;
+		u32 hwv_upd_ofs;
+		u8 hwv_upd_id;
+	} hwccf;
+	const char *name;
+	u64 freq[MMDVFS_MAX_LEVELS];
+	u8 freq_num;
+	/* Protects this mux vote state. */
+	struct mutex lock;
+};
+
+/**
+ * struct mmdvfs_user - MMDVFS User/Client
+ * @id: User identifier
+ * @name: User name (e.g., "CAM", "DISP")
+ * @mux: Associated MUX id
+ * @level: Current level
+ * @clk_hw: Clock hardware structure
+ * @clk: Clock pointer
+ * @mmdvfs: MMDVFS device reference
+ */
+struct mmdvfs_user {
+	u8 id;
+	const char *name;
+	u8 mux;
+	u8 level;
+	struct clk_hw clk_hw;
+	struct clk *clk;
+	struct mmdvfs_device *mmdvfs;
+};
+
+/**
+ * struct mmdvfs_hwccf_voter_priv - HWCCF DVFS Voter specific data
+ * @hwccf_voter_support: HWCCF voter support flag
+ * @step_idx: Step index
+ * @dpsw_thr: DPSW threshold
+ * @mmdvfs: MMDVFS device reference
+ * @genpd_wq: GenPD workqueue
+ */
+struct mmdvfs_hwccf_voter_priv {
+	bool hwccf_voter_support;
+	u8 step_idx;
+	int dpsw_thr;
+	struct mmdvfs_device *mmdvfs;
+	struct workqueue_struct *genpd_wq;
+};
+
+/**
+ * struct mmdvfs_ops - Platform-specific operations
+ * @probe: Platform-specific probe function
+ * @hw_vote: Submit frequency/voltage vote to hardware
+ * @get_current_level: Get current hardware level
+ * @init_hw: Initialize hardware
+ * @deinit_hw: Deinitialize hardware
+ * @suspend_prepare: Prepare for suspend
+ * @post_suspend: Post-suspend cleanup
+ * @camera_notify: Camera power notification
+ * @genpd_notify: Generic power domain notification
+ * @set_avs: Set AVS (Adaptive Voltage Scaling) parameters
+ * @camsv_dc_enable: Enable/disable CAMSV DC mode
+ *
+ * MT8196 implements hw_vote through the HWCCF voter.
+ */
+struct mmdvfs_ops {
+	/* Platform-specific probe function to attach IC-related ops */
+	int (*probe)(struct mmdvfs_device *mmdvfs);
+
+	int (*hw_vote)(struct mmdvfs_device *mmdvfs, const u8 user_id, const u8 level);
+	int (*get_current_level)(struct mmdvfs_device *mmdvfs, u32 pwr_id);
+	int (*dvfsrc_rg_dump)(struct mmdvfs_device *mmdvfs);
+	int (*dvfsrc_record_dump)(struct mmdvfs_device *mmdvfs);
+	int (*init_hw)(struct mmdvfs_device *mmdvfs);
+	void (*deinit_hw)(struct mmdvfs_device *mmdvfs);
+
+	/* Power management operations */
+	void (*suspend_prepare)(struct mmdvfs_device *mmdvfs);
+	void (*post_suspend)(struct mmdvfs_device *mmdvfs);
+
+	/* HWCCF DVFS voter - Extended operations */
+	int (*camera_notify)(struct mmdvfs_device *mmdvfs, bool enable);
+	int (*genpd_notify)(struct mmdvfs_device *mmdvfs, u8 idx, bool enable);
+	int (*set_avs)(struct mmdvfs_device *mmdvfs, u8 idx, u32 aging, u32 fresh);
+	int (*camsv_dc_enable)(struct mmdvfs_device *mmdvfs, u8 idx, bool enable);
+};
+
+/**
+ * struct mmdvfs_data - Main MMDVFS data structure
+ * @dev: Device pointer
+ * @rc: Array of Resource Controllers
+ * @mux: Array of Multiplexers
+ * @user: Array of Users
+ * @ops: Platform-specific operations
+ * @version: Hardware voting mechanism
+ * @platform_data: Platform-specific private data
+ * @rc_num: Number of RCs
+ * @mux_num: Number of MUXes
+ * @user_num: Number of Users
+ * @lock: Device-wide mutex for synchronization
+ * @hwccf_voter_priv: HWCCF DVFS Voter private data (dynamically allocated)
+ * @init_done: Initialization completion flag
+ * @pm_notifier: Suspend/resume notifier
+ * @pm_suspended: Whether system suspend is in progress
+ */
+struct mmdvfs_data {
+	struct device *dev;
+	struct mmdvfs_rc *rc;
+	struct mmdvfs_mux *mux;
+	struct mmdvfs_user *user;
+	const struct mmdvfs_ops *ops;
+	enum mmdvfs_version_type version;
+	void *platform_data;
+	u8 rc_num;
+	u8 mux_num;
+	u8 user_num;
+	/* Protects device-wide state. */
+	struct mutex lock;
+
+	/* Hardware-specific private data (dynamically allocated) */
+	struct mmdvfs_hwccf_voter_priv *hwccf_voter_priv;
+
+	/* Shared status and control */
+	bool init_done;
+
+	/* PM notifier for suspend/resume handling */
+	struct notifier_block pm_notifier;
+	bool pm_suspended;
+
+};
+
+/**
+ * struct mmdvfs_device - MMDVFS device structure
+ * @dev: Device pointer
+ * @data: MMDVFS data
+ * @clk_data: Clock provider data
+ */
+struct mmdvfs_device {
+	struct device *dev;
+	struct mmdvfs_data *data;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+/* Helper macros */
+#define to_mmdvfs_user(hw) container_of(hw, struct mmdvfs_user, clk_hw)
+
+/**
+ * struct mmdvfs_soc_data - Per-SoC topology and configuration data
+ * @rc_table: Array of RC (Resource Controller) configurations
+ * @rc_num: Number of RCs in this SoC
+ * @mux_table: Array of MUX (Multiplexer) configurations
+ * @mux_num: Number of MUXes in this SoC
+ * @user_table: Array of User/Client configurations
+ * @user_num: Number of Users in this SoC
+ * @version: MMDVFS voting mechanism
+ *
+ * This structure defines the per-SoC topology statically in code.
+ * Allocated and configured by each per-SoC driver file.
+ */
+struct mmdvfs_soc_data {
+	const struct mmdvfs_rc *rc_table;
+	u8 rc_num;
+	const struct mmdvfs_mux *mux_table;
+	u8 mux_num;
+	const struct mmdvfs_user *user_table;
+	u8 user_num;
+	enum mmdvfs_version_type version;
+};
+
+/**
+ * struct mmdvfs_platform_data - Platform-specific data for device match table
+ * @soc_data: SoC topology and configuration data
+ * @ops: Platform-specific operations
+ *
+ * This structure is used in of_device_id match table to associate
+ * compatible strings with their corresponding SoC data and operations.
+ */
+struct mmdvfs_platform_data {
+	const struct mmdvfs_soc_data *soc_data;
+	const struct mmdvfs_ops *ops;
+};
+
+/* Core functions */
+int mmdvfs_register_clocks(struct mmdvfs_device *mmdvfs);
+void mmdvfs_unregister_clocks(struct mmdvfs_device *mmdvfs);
+int mmdvfs_parse_dt(struct mmdvfs_device *mmdvfs);
+
+/* Platform-specific functions to be implemented */
+extern const struct mmdvfs_ops mmdvfs_mt8196_ops;
+
+/* Per-SoC topology data */
+extern const struct mmdvfs_soc_data mmdvfs_mt8196_soc_data;
+
+/* Platform-specific operations */
+u32 mmdvfs_get_version(void);
+int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx);
+int mtk_mmdvfs_camera_notify(bool enable);
+int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable);
+int mtk_mmdvfs_genpd_notify(u8 idx, bool enable);
+int mtk_mmdvfs_set_avs(u8 idx, u32 aging, u32 fresh);
+int mmdvfs_set_lp_mode(bool enable);
+
+/* Utility functions */
+static inline bool mmdvfs_is_valid_user_id(u8 user_id)
+{
+	return user_id < MMDVFS_MAX_USERS;
+}
+
+static inline bool mmdvfs_is_valid_level(u8 level)
+{
+	return level < MMDVFS_MAX_LEVELS;
+}
+
+static inline bool mmdvfs_is_valid_rc_id(u8 rc_id)
+{
+	return rc_id < MMDVFS_MAX_RCS;
+}
+
+static inline bool mmdvfs_is_valid_mux_id(u8 mux_id)
+{
+	return mux_id < MMDVFS_MAX_MUXES;
+}
+
+/* Logging macros */
+#define mmdvfs_dbg(dev, fmt, args...) \
+	dev_dbg(dev, "[mmdvfs] " fmt, ##args)
+#define mmdvfs_info(dev, fmt, args...) \
+	dev_info(dev, "[mmdvfs] " fmt, ##args)
+#define mmdvfs_warn(dev, fmt, args...) \
+	dev_warn(dev, "[mmdvfs] " fmt, ##args)
+#define mmdvfs_err(dev, fmt, args...) \
+	dev_err(dev, "[mmdvfs] " fmt, ##args)
+
+#endif /* __MMDVFS_H__ */
diff --git a/include/soc/mediatek/mmdvfs.h b/include/soc/mediatek/mmdvfs.h
new file mode 100644
index 000000000000..459f1adcab34
--- /dev/null
+++ b/include/soc/mediatek/mmdvfs.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS (Multimedia Dynamic Voltage and Frequency Scaling) API
+ */
+
+#ifndef MTK_MMDVFS_H
+#define MTK_MMDVFS_H
+
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+enum mmdvfs_version_type {
+	MMDVFS_VERSION_NONE = 0,
+	MMDVFS_VERSION_HWCCF_DVFS_VOTER = 1,
+};
+
+enum {
+	CCU_PWR_USR_MMDVFS,
+	CCU_PWR_USR_IMG,
+	CCU_PWR_USR_NUM
+};
+
+#if IS_ENABLED(CONFIG_MTK_MMDVFS) && IS_ENABLED(CONFIG_MTK_VCP_RPROC)
+int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx);
+int mtk_mmdvfs_camera_notify(const bool enable);
+int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable);
+int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable);
+int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh);
+int mmdvfs_set_lp_mode(bool lp_mode);
+u32 mmdvfs_get_version(void);
+#else
+
+static inline int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int mtk_mmdvfs_camera_notify(const bool enable)
+{
+	return 0;
+}
+
+static inline int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable)
+{
+	return 0;
+}
+
+static inline int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable)
+{
+	return 0;
+}
+
+static inline int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh)
+{
+	return 0;
+}
+
+static inline int mmdvfs_set_lp_mode(bool lp_mode)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline u32 mmdvfs_get_version(void)
+{
+	return MMDVFS_VERSION_NONE;
+}
+#endif
+
+#endif /* MTK_MMDVFS_H */
-- 
2.45.2

