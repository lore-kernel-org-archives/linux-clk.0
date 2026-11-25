Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586464;
	b=5W9vOUqGx1Vce9rihZxWZKTi67hJz/guyCvdSteIevfjjrE+g/ZBX58q6Suitpi+BMz6
	 6y+9QRLhlwQokWF2ZFvJVKXMWQ8Je3PwmpmVYqXKgl6qvKy/3JpX5G3ouVTGWyjJcXt+k
	 pYZzCWmC8RoX40OVv4odPOhl0GB35ER6pN0wGdhixN2YVesdakZPK59vtEXpppfDVawnL
	 9/4+n0yGp5uRNGv4ui23Z/sd209nGYlsZUm8MztgmJ8iLIOBSwTSVGGuOls7cMsGP+rE4
	 NZbi/CjiazdTaAz+J7BE6diT6nVRZb0+dsMcWrgC/ryZNexWMbSS0RtTpzdTTwAJH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586464;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=SR2rcgA0lS/KYSV2JfWp3Oe6QLYTGWVRVOb/kQz0ANs=;
	b=nCZ7/NGRKK0IwM9d1gfhBBeUdgcdjtznHylnJ4SuFHfNcR1aQW79pH6DEPHWHSEJACn7
	 T9/Yop4davdDB5YCKMI3ZUQ1pFo3d/cDVedv1F8qSh+UMhTTNYWUU0BL/KiduJde78B+E
	 3l6ycp7L7obpnPAlk2YQpGTuz6meELlZDUXF51Rj9ZL09htNXNe124ncxRS2XtFtFsNjt
	 HyZPE7bLn+mY/hYQyAOZEbYRi9xJGfF2X+uo/mmeHCdq/MjQz4nLyA2TZSUfYiWr0tLsd
	 QdJc3Vs056YHHkLy5/8pxVFKz/eU1tF7Q5vtQbgy6nIMw42hjquFjV0RMnCQGbqZK8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Q3QoWfbT;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353E606A321;
	Wed, 25 Nov 2026 06:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4353E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Q3QoWfbT
X-UUID: 95791c90e89511f18dc8c9802ae25ab1-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=SR2rcgA0lS/KYSV2JfWp3Oe6QLYTGWVRVOb/kQz0ANs=;
	b=Q3QoWfbTAzLCcFTlcHFc9suKQI2sEEpwAmAc/UTwI2u4dzIXQ6HnV6hs8v6gBI9wOEP7QwLDI2SxLeM1X9k4e8YEeccWi3Ow+F8YWUrJpMbkxB4ByrflC5atxHX/c8+PYoFgE6bAzsAyQsdrE1N8iRsxGBgX+mR7txXLGPJPCKs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e688b3e5-d9cb-43de-b127-35cd45eee452,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:b0318ac,CLOUDID:4e38badc-cd93-4271-b1c5-c14ee34c3ca6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95791c90e89511f18dc8c9802ae25ab1-20261125
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1580077196; Wed, 25 Nov 2026 14:00:58 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:55 +0800
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
Subject: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Date: Wed, 25 Nov 2026 14:00:09 +0800
Message-ID: <20261125060037.649659-5-echo.zhang@mediatek.com>
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

Add the VCP transport used by MMDVFS to map AP and firmware shared
memory, manage feature power references and send IPI commands.

Wait for VCP readiness and handle the selected MMUP or VCP READY
notification to initialize firmware after boot and resume. Serialize
IPI transactions while shared memory and acknowledgment state are in
use.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 drivers/soc/mediatek/mmdvfs/Makefile          |    2 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c      |   39 +-
 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c     |  272 +++--
 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h |  160 ++-
 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h  |   57 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c       |  275 +++++
 .../soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h   |  104 ++
 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c      | 1075 +++++++++++++++++
 include/soc/mediatek/mmdvfs.h                 |   66 +-
 9 files changed, 1846 insertions(+), 204 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c

diff --git a/drivers/soc/mediatek/mmdvfs/Makefile b/drivers/soc/mediatek/mmdvfs/Makefile
index 33a280827006..16ecee30bff6 100644
--- a/drivers/soc/mediatek/mmdvfs/Makefile
+++ b/drivers/soc/mediatek/mmdvfs/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_MTK_MMDVFS) += mtk-mmdvfs.o
 
 mtk-mmdvfs-y += mmdvfs-core.o
 mtk-mmdvfs-y += mmdvfs-clk.o
+mtk-mmdvfs-y += mmdvfs-up.o
+mtk-mmdvfs-y += mmdvfs-vcp.o
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
index 114f3148cf46..b9025427782d 100644
--- a/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -27,9 +26,18 @@
 
 static const char *mmdvfs_get_clkdev_name(const char *name, char *buf, size_t size)
 {
+	int ret;
+
 	if (strlen(name) < MMDVFS_CLKDEV_CON_ID_MAX)
 		return name;
 
+	if (str_has_prefix(name, "mmdvfs-vcp-")) {
+		ret = snprintf(buf, size, "mmdvfs-v-%s",
+			       name + strlen("mmdvfs-vcp-"));
+		if (ret > 0 && ret < (int)size)
+			return buf;
+	}
+
 	return NULL;
 }
 
@@ -66,7 +74,7 @@ static int mmdvfs_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	data = mmdvfs->data;
 
-	if (!data->init_done)
+	if (!READ_ONCE(data->init_done))
 		return -EPROBE_DEFER;
 
 	if (!mmdvfs_is_valid_user_id(user->id) ||
@@ -76,12 +84,6 @@ static int mmdvfs_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	if (rate == 0) {
-		mmdvfs_dbg(mmdvfs->dev, "Zero rate request for user %s\n",
-			   user->name);
-		return 0;
-	}
-
 	mux = &data->mux[user->mux];
 	if (!mmdvfs_is_valid_rc_id(mux->rc)) {
 		mmdvfs_err(mmdvfs->dev, "Invalid mux config: rc=%d for user %s\n",
@@ -118,17 +120,17 @@ static int mmdvfs_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
+	mutex_lock(&mux->lock);
 	if (user->level == level) {
 		mmdvfs_dbg(mmdvfs->dev, "user %s: already at level %d, skip\n",
 			   user->name, level);
+		mutex_unlock(&mux->lock);
 		return 0;
 	}
 
 	mmdvfs_dbg(mmdvfs->dev, "user %s: rate %lu -> level %d (freq=%llu)\n",
 		   user->name, rate, level, mux->freq[level]);
 
-	mutex_lock(&mux->lock);
-
 	if (data->ops && data->ops->hw_vote) {
 		ret = data->ops->hw_vote(mmdvfs, user->id, level);
 		if (!ret) {
@@ -237,13 +239,6 @@ static long mmdvfs_round_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	if (rate == 0) {
-		mmdvfs_dbg(mmdvfs->dev,
-			   "Zero rate request in round_rate for user %s\n",
-			   user->name);
-		return 0;
-	}
-
 	mux = &data->mux[user->mux];
 	if (!mmdvfs_is_valid_rc_id(mux->rc)) {
 		mmdvfs_err(mmdvfs->dev,
@@ -450,13 +445,3 @@ int mmdvfs_register_clocks(struct mmdvfs_device *mmdvfs)
 	mmdvfs_err(mmdvfs->dev, "Clock registration failed, cleanup completed\n");
 	return ret;
 }
-
-/*
- * mmdvfs_unregister_clocks - Unregister clock providers
- * @mmdvfs: MMDVFS device structure
- */
-void mmdvfs_unregister_clocks(struct mmdvfs_device *mmdvfs)
-{
-	if (mmdvfs && mmdvfs->dev)
-		mmdvfs_dbg(mmdvfs->dev, "MMDVFS clocks unregistered\n");
-}
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
index c32fa11557af..3388a5a3a145 100644
--- a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
@@ -7,22 +7,23 @@
 
 #include <linux/atomic.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/remoteproc/mtk_vcp_public.h>
 #include <linux/sched/clock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/suspend.h>
-#include <linux/workqueue.h>
 
 #include "mmdvfs-internal.h"
+#include "mmdvfs-up-priv.h"
 
 static int mmdvfs_register_device(struct mmdvfs_device *mmdvfs);
 static void mmdvfs_unregister_device(struct mmdvfs_device *mmdvfs);
@@ -34,14 +35,13 @@ struct mmdvfs_device *mmdvfs_find_device_any(void)
 {
 	return mmdvfs_find_device_by_version(MMDVFS_VERSION_HWCCF_DVFS_VOTER);
 }
-EXPORT_SYMBOL_GPL(mmdvfs_find_device_any);
 
 /**
  * mmdvfs_get_version - Get MMDVFS voting mechanism type
  *
  * Return:
  *   0 - No hardware voter
- *   1 - HWCCF DVFS voter
+ *   1 - HWCCF DVFS voter (VCP IPI with MMUP SRAM)
  */
 u32 mmdvfs_get_version(void)
 {
@@ -96,7 +96,8 @@ static int mmdvfs_validate_topology(struct mmdvfs_device *mmdvfs)
 			return -EINVAL;
 		}
 
-		if (mux->freq_num == 0 || mux->freq_num > MMDVFS_MAX_LEVELS) {
+		if (mux->freq_num == 0 || mux->freq_num > rc->level_num ||
+		    mux->freq_num > MMDVFS_MAX_LEVELS) {
 			mmdvfs_err(mmdvfs->dev,
 				   "MUX %d (%s): invalid freq_num: %d\n",
 				   i, mux->name, mux->freq_num);
@@ -112,10 +113,11 @@ static int mmdvfs_validate_topology(struct mmdvfs_device *mmdvfs)
 			}
 
 			if (j > 0 && mux->freq[j] <= mux->freq[j - 1]) {
-				mmdvfs_warn(mmdvfs->dev,
-					    "MUX %d (%s): freq not ascending: freq[%d]=%llu <= freq[%d]=%llu\n",
-					    i, mux->name, j, mux->freq[j],
-					    j - 1, mux->freq[j - 1]);
+				mmdvfs_err(mmdvfs->dev,
+					   "MUX %d (%s): freq not ascending: freq[%d]=%llu <= freq[%d]=%llu\n",
+					   i, mux->name, j, mux->freq[j],
+					   j - 1, mux->freq[j - 1]);
+				return -EINVAL;
 			}
 		}
 
@@ -249,45 +251,61 @@ int mmdvfs_parse_dt(struct mmdvfs_device *mmdvfs)
 	return 0;
 }
 
-/*
- * mmdvfs_pm_notifier_callback - PM notifier callback for suspend/resume handling
- * @nb: Notifier block
- * @event: PM event type
- * @data: Event data
- *
- * Return: NOTIFY_DONE
- */
-static int mmdvfs_pm_notifier_callback(struct notifier_block *nb, unsigned long event,
-				       void *data)
+static int mmdvfs_init_up(struct mmdvfs_device *mmdvfs, bool stoppable)
 {
-	struct mmdvfs_data *mdata =
-		container_of(nb, struct mmdvfs_data, pm_notifier);
-	struct mmdvfs_device *mmdvfs = dev_get_drvdata(mdata->dev);
+	struct mmdvfs_data *mdata = mmdvfs->data;
+	int retry = 0;
+	int ret;
 
-	switch (event) {
-	case PM_SUSPEND_PREPARE:
-		mmdvfs_dbg(mmdvfs->dev, "System suspending...\n");
+	ret = mmdvfs_up_register(mmdvfs, MMDVFS_UP_VCP);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to register HFRP: %d\n", ret);
+		return ret;
+	}
 
-		if (mdata->ops && mdata->ops->suspend_prepare)
-			mdata->ops->suspend_prepare(mmdvfs);
+	while (!mmdvfs_up_get_cb_ready(mmdvfs, MMDVFS_UP_VCP)) {
+		if (stoppable && kthread_should_stop()) {
+			ret = -ECANCELED;
+			goto err_unregister_up;
+		}
 
-		mdata->pm_suspended = true;
-		break;
+		if (++retry > 100) {
+			mmdvfs_err(mmdvfs->dev,
+				   "Init timeout: VCP/MMUP callback not ready after %d seconds\n",
+				   retry);
+			ret = -ETIMEDOUT;
+			goto err_unregister_up;
+		}
+		ssleep(1);
+	}
 
-	case PM_POST_SUSPEND:
-		mmdvfs_dbg(mmdvfs->dev, "System resumed\n");
+	mmdvfs_dbg(mmdvfs->dev, "Init complete after %d seconds\n", retry);
+	ret = mmdvfs_vcp_release_init(mmdvfs);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to release VCP INIT feature: %d\n", ret);
+		goto err_unregister_up;
+	}
 
-		mdata->pm_suspended = false;
+	return 0;
 
-		if (mdata->ops && mdata->ops->post_suspend)
-			mdata->ops->post_suspend(mmdvfs);
-		break;
+err_unregister_up:
+	if (mdata->up_count)
+		mmdvfs_up_unregister(mmdvfs, MMDVFS_UP_VCP);
 
-	default:
-		break;
-	}
+	return ret;
+}
 
-	return NOTIFY_DONE;
+/*
+ * mmdvfs_init_kthread - Async initialization thread
+ * @data: MMDVFS device pointer
+ *
+ * Wait for VCP/MMUP ready before completing initialization.
+ *
+ * Return: 0 on success, -ETIMEDOUT on timeout
+ */
+static int mmdvfs_init_kthread(void *data)
+{
+	return mmdvfs_init_up(data, true);
 }
 
 /*
@@ -328,16 +346,6 @@ static int mmdvfs_probe(struct platform_device *pdev)
 	data->ops = pdata->ops;
 	data->version = pdata->soc_data->version;
 
-	if (data->version == MMDVFS_VERSION_HWCCF_DVFS_VOTER) {
-		data->hwccf_voter_priv = devm_kzalloc(&pdev->dev,
-						      sizeof(*data->hwccf_voter_priv),
-						      GFP_KERNEL);
-		if (!data->hwccf_voter_priv)
-			return -ENOMEM;
-
-		data->hwccf_voter_priv->mmdvfs = mmdvfs;
-	}
-
 	ret = mmdvfs_parse_dt(mmdvfs);
 	if (ret) {
 		mmdvfs_err(mmdvfs->dev, "Failed to parse device tree: %d\n", ret);
@@ -358,38 +366,52 @@ static int mmdvfs_probe(struct platform_device *pdev)
 		}
 	}
 
-	data->init_done = true;
+	if (pdata->soc_data->vote_requires_up_ready) {
+		ret = mmdvfs_init_up(mmdvfs, false);
+		if (ret) {
+			mmdvfs_err(mmdvfs->dev,
+				   "Failed to initialize UP before clock registration: %d\n",
+				   ret);
+			goto err_deinit_hw;
+		}
+	}
 
 	ret = mmdvfs_register_clocks(mmdvfs);
 	if (ret) {
 		mmdvfs_err(mmdvfs->dev, "Failed to register clocks: %d\n", ret);
-		goto err_deinit_hw;
-	}
-
-	data->pm_notifier.notifier_call = mmdvfs_pm_notifier_callback;
-	data->pm_notifier.priority = 0;
-	data->pm_suspended = false;
-	ret = register_pm_notifier(&data->pm_notifier);
-	if (ret) {
-		mmdvfs_err(mmdvfs->dev, "Failed to register PM notifier: %d\n", ret);
-		goto err_unregister_clocks;
+		goto err_unregister_up;
 	}
-	mmdvfs_info(mmdvfs->dev, "PM notifier registered\n");
 
 	ret = mmdvfs_register_device(mmdvfs);
 	if (ret) {
 		mmdvfs_err(mmdvfs->dev, "Failed to register device: %d\n", ret);
-		goto err_unregister_pm_notifier;
+		goto err_unregister_up;
 	}
 
+	if (pdata->soc_data->vote_requires_up_ready) {
+		mmdvfs_dbg(mmdvfs->dev,
+			   "UP ready before MMDVFS clock provider registration\n");
+	} else {
+		/* Initialize VCP/MMUP asynchronously and wait for callback ready. */
+		data->init_task = kthread_run(mmdvfs_init_kthread, mmdvfs,
+					      "mmdvfs-init-kthread");
+		if (IS_ERR(data->init_task)) {
+			mmdvfs_warn(mmdvfs->dev,
+				    "Failed to launch init kthread: %ld (non-fatal)\n",
+				    PTR_ERR(data->init_task));
+			data->init_task = NULL;
+		} else {
+			mmdvfs_dbg(mmdvfs->dev, "Init kthread launched successfully\n");
+		}
+	}
+
+	mmdvfs_debug_init(mmdvfs);
 	mmdvfs_info(mmdvfs->dev, "MMDVFS driver probed successfully\n");
 	return 0;
 
-err_unregister_pm_notifier:
-	unregister_pm_notifier(&data->pm_notifier);
-
-err_unregister_clocks:
-	mmdvfs_unregister_clocks(mmdvfs);
+err_unregister_up:
+	if (data->up_count)
+		mmdvfs_up_unregister(mmdvfs, MMDVFS_UP_VCP);
 
 err_deinit_hw:
 	if (data->ops && data->ops->deinit_hw)
@@ -409,14 +431,20 @@ static void mmdvfs_remove(struct platform_device *pdev)
 	struct mmdvfs_device *mmdvfs = platform_get_drvdata(pdev);
 	struct mmdvfs_data *data = mmdvfs->data;
 
-	unregister_pm_notifier(&data->pm_notifier);
-	mmdvfs_dbg(mmdvfs->dev, "PM notifier unregistered\n");
+	mmdvfs_debug_exit(mmdvfs);
 
-	mmdvfs_unregister_clocks(mmdvfs);
+	if (data->init_task) {
+		kthread_stop(data->init_task);
+		data->init_task = NULL;
+		mmdvfs_dbg(mmdvfs->dev, "Init kthread stopped\n");
+	}
 
 	if (data->ops && data->ops->deinit_hw)
 		data->ops->deinit_hw(mmdvfs);
 
+	if (data->up_count)
+		mmdvfs_up_unregister(mmdvfs, MMDVFS_UP_VCP);
+
 	mmdvfs_unregister_device(mmdvfs);
 
 	mmdvfs_info(mmdvfs->dev, "MMDVFS driver removed\n");
@@ -447,6 +475,7 @@ static struct platform_driver mmdvfs_driver = {
 	.driver = {
 		.name = "mediatek-mmdvfs",
 		.of_match_table = mmdvfs_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
 
@@ -478,7 +507,6 @@ struct mmdvfs_device *mmdvfs_find_device_by_version(enum mmdvfs_version_type ver
 
 	return found;
 }
-EXPORT_SYMBOL_GPL(mmdvfs_find_device_by_version);
 
 static int mmdvfs_register_device(struct mmdvfs_device *mmdvfs)
 {
@@ -512,69 +540,111 @@ static void mmdvfs_unregister_device(struct mmdvfs_device *mmdvfs)
 	mutex_unlock(&mmdvfs_device_list_lock);
 }
 
-int mtk_mmdvfs_camera_notify(bool enable)
+/* HWCCF voter - Memory and SRAM management via multi-UP architecture */
+void *mmdvfs_get_mmup_base(phys_addr_t *pa)
 {
 	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_up_instance *hfrp_instance;
 
 	mmdvfs = mmdvfs_find_device_any();
-	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
-	    !mmdvfs->data->ops->camera_notify)
-		return -EOPNOTSUPP;
+	if (!mmdvfs || !mmdvfs->data)
+		return NULL;
 
-	return mmdvfs->data->ops->camera_notify(mmdvfs, enable);
+	/* HFRP UP returns MMUP base with MMDVFS_MMUP_MEM_ID */
+	hfrp_instance = mmdvfs_up_get_instance(mmdvfs, MMDVFS_UP_VCP);
+	if (!hfrp_instance || !hfrp_instance->ops || !hfrp_instance->ops->get_base)
+		return NULL;
+
+	return hfrp_instance->ops->get_base(mmdvfs, MMDVFS_MMUP_MEM_ID, pa);
 }
-EXPORT_SYMBOL_GPL(mtk_mmdvfs_camera_notify);
+EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_base);
 
-int mtk_mmdvfs_genpd_notify(u8 idx, bool enable)
+void *mmdvfs_get_vcp_base(phys_addr_t *pa)
 {
 	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_up_instance *hfrp_instance;
 
 	mmdvfs = mmdvfs_find_device_any();
-	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
-	    !mmdvfs->data->ops->genpd_notify)
-		return -EOPNOTSUPP;
+	if (!mmdvfs || !mmdvfs->data)
+		return NULL;
+
+	/* HFRP UP returns VCP base with MMDVFS_VCP_MEM_ID */
+	hfrp_instance = mmdvfs_up_get_instance(mmdvfs, MMDVFS_UP_VCP);
+	if (!hfrp_instance || !hfrp_instance->ops || !hfrp_instance->ops->get_base)
+		return NULL;
 
-	return mmdvfs->data->ops->genpd_notify(mmdvfs, idx, enable);
+	return hfrp_instance->ops->get_base(mmdvfs, MMDVFS_VCP_MEM_ID, pa);
 }
-EXPORT_SYMBOL_GPL(mtk_mmdvfs_genpd_notify);
+EXPORT_SYMBOL_GPL(mmdvfs_get_vcp_base);
 
-int mtk_mmdvfs_set_avs(u8 idx, u32 aging, u32 fresh)
+bool mmdvfs_get_mmup_sram_enable(void)
 {
 	struct mmdvfs_device *mmdvfs;
 
 	mmdvfs = mmdvfs_find_device_any();
-	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
-	    !mmdvfs->data->ops->set_avs)
-		return -EOPNOTSUPP;
+	if (!mmdvfs)
+		return false;
 
-	return mmdvfs->data->ops->set_avs(mmdvfs, idx, aging, fresh);
+	return mmdvfs_vcp_get_mmup_sram_enable(mmdvfs);
 }
-EXPORT_SYMBOL_GPL(mtk_mmdvfs_set_avs);
+EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_sram_enable);
 
-int mmdvfs_set_lp_mode(bool enable)
+void __iomem *mmdvfs_get_mmup_sram(void)
 {
-	return -EOPNOTSUPP;
+	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_up_instance *hfrp_instance;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs || !mmdvfs->data)
+		return NULL;
+
+	/* HFRP UP manages MMUP SRAM */
+	hfrp_instance = mmdvfs_up_get_instance(mmdvfs, MMDVFS_UP_VCP);
+	if (!hfrp_instance || !hfrp_instance->ops || !hfrp_instance->ops->get_sram)
+		return NULL;
+
+	return hfrp_instance->ops->get_sram(mmdvfs);
 }
-EXPORT_SYMBOL_GPL(mmdvfs_set_lp_mode);
+EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_sram);
 
-int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable)
+/* HWCCF voter - Power management through HFRP UP architecture */
+int mtk_mmdvfs_enable_vcp(const bool enable, const u8 idx)
 {
 	struct mmdvfs_device *mmdvfs;
+	struct mmdvfs_up_instance *hfrp_instance;
+	int ret;
 
 	mmdvfs = mmdvfs_find_device_any();
-	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
-	    !mmdvfs->data->ops->camsv_dc_enable)
+	if (!mmdvfs || !mmdvfs->data)
+		return -ENODEV;
+
+	mmdvfs_dbg(mmdvfs->dev, "[VCP] %s VCP (idx=%u)\n",
+		   enable ? "enable" : "disable", idx);
+
+	/* Get HFRP UP instance (VCP + MMUP unified) */
+	hfrp_instance = mmdvfs_up_get_instance(mmdvfs, MMDVFS_UP_VCP);
+	if (!hfrp_instance || !hfrp_instance->ops || !hfrp_instance->ops->enable)
 		return -EOPNOTSUPP;
 
-	return mmdvfs->data->ops->camsv_dc_enable(mmdvfs, idx, enable);
+	ret = hfrp_instance->ops->enable(mmdvfs, enable, idx);
+	mmdvfs_dbg(mmdvfs->dev, "[VCP] %s complete, ret=%d\n",
+		   enable ? "enable" : "disable", ret);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(mtk_mmdvfs_camsv_dc_enable);
+EXPORT_SYMBOL_GPL(mtk_mmdvfs_enable_vcp);
 
-int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx)
+bool mmdvfs_get_mmup_enable(void)
 {
-	return -EOPNOTSUPP;
+	struct mmdvfs_device *mmdvfs;
+
+	mmdvfs = mmdvfs_find_device_any();
+	if (!mmdvfs)
+		return false;
+
+	return mmdvfs_vcp_get_mmup_enable(mmdvfs);
 }
-EXPORT_SYMBOL_GPL(mtk_mmdvfs_enable_ccu);
+EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_enable);
 
 MODULE_DESCRIPTION("MediaTek MMDVFS Driver");
 MODULE_AUTHOR("MediaTek Inc.");
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
index df16e38d78c8..2aaec44a8db7 100644
--- a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
@@ -10,10 +10,12 @@
 
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/kthread.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 #include <linux/platform_device.h>
 
+#include "mmdvfs-up-priv.h"
+
 struct dentry;
 
 #define MMDVFS_MAX_LEVELS		8
@@ -27,6 +29,60 @@ enum mmdvfs_version_type {
 	MMDVFS_VERSION_HWCCF_DVFS_VOTER = 1,	/* HWCCF DVFS voter */
 };
 
+/* HWCCF voter configuration - Power User Definitions */
+/*
+ * VCP Power User Index - must match VCP firmware definition
+ * Used by mtk_mmdvfs_enable_vcp() to track per-user power reference count
+ */
+enum mmdvfs_vcp_pwr_usr {
+	VCP_PWR_USR_MMDVFS_INIT = 0,
+	VCP_PWR_USR_MMDVFS_RESERVED1,
+	VCP_PWR_USR_MMDVFS_RESERVED2,
+	VCP_PWR_USR_MMDVFS_VOTE,
+	VCP_PWR_USR_MMDVFS_CCU,
+	VCP_PWR_USR_MMDVFS_RST,
+	VCP_PWR_USR_MMQOS,
+	VCP_PWR_USR_CAM,
+	VCP_PWR_USR_IMG,
+	VCP_PWR_USR_PDA,
+	VCP_PWR_USR_SENIF,
+	VCP_PWR_USR_VDEC,
+	VCP_PWR_USR_VFMT,
+	VCP_PWR_USR_SMI,
+	VCP_PWR_USR_DISP,
+	VCP_PWR_USR_MDP,
+	VCP_PWR_USR_MML,
+	VCP_PWR_USR_VENC,
+	VCP_PWR_USR_JPEGDEC,
+	VCP_PWR_USR_JPEGENC,
+	VCP_PWR_USR_NUM
+};
+
+/* IPI function codes used by this driver; values match VCP/MMUP firmware. */
+enum mmdvfs_ipi_func {
+	FUNC_MMDVFS_INIT = 0,		/* Initialize firmware-side MMDVFS */
+	FUNC_MMDVFSRC_INIT = 9,	/* Initialize resource controller */
+};
+
+/**
+ * struct mmdvfs_vcp_ipi_data - VCP IPI message format
+ * @func: Function code
+ * @idx: Index parameter
+ * @opp: OPP level
+ * @ack: High 32-bit of 64-bit parameter
+ * @base: Low 32-bit of 64-bit parameter
+ *
+ * For FUNC_MMDVFS_INIT/MMDVFSRC_INIT, the 64-bit shared memory IOVA is split
+ * across ack and base.
+ */
+struct mmdvfs_vcp_ipi_data {
+	u8 func;
+	u8 idx;
+	u8 opp;
+	u8 ack;
+	u32 base;
+} __packed;
+
 #define MAX_OPP				8
 
 /* MMDVFS RC domains */
@@ -102,35 +158,16 @@ struct mmdvfs_user {
 	struct mmdvfs_device *mmdvfs;
 };
 
-/**
- * struct mmdvfs_hwccf_voter_priv - HWCCF DVFS Voter specific data
- * @hwccf_voter_support: HWCCF voter support flag
- * @step_idx: Step index
- * @dpsw_thr: DPSW threshold
- * @mmdvfs: MMDVFS device reference
- * @genpd_wq: GenPD workqueue
- */
-struct mmdvfs_hwccf_voter_priv {
-	bool hwccf_voter_support;
-	u8 step_idx;
-	int dpsw_thr;
-	struct mmdvfs_device *mmdvfs;
-	struct workqueue_struct *genpd_wq;
-};
+/* Forward declarations for internal types */
+struct mmdvfs_up_instance;
+struct mmdvfs_up_ops;
 
 /**
  * struct mmdvfs_ops - Platform-specific operations
  * @probe: Platform-specific probe function
  * @hw_vote: Submit frequency/voltage vote to hardware
- * @get_current_level: Get current hardware level
  * @init_hw: Initialize hardware
  * @deinit_hw: Deinitialize hardware
- * @suspend_prepare: Prepare for suspend
- * @post_suspend: Post-suspend cleanup
- * @camera_notify: Camera power notification
- * @genpd_notify: Generic power domain notification
- * @set_avs: Set AVS (Adaptive Voltage Scaling) parameters
- * @camsv_dc_enable: Enable/disable CAMSV DC mode
  *
  * MT8196 implements hw_vote through the HWCCF voter.
  */
@@ -139,21 +176,9 @@ struct mmdvfs_ops {
 	int (*probe)(struct mmdvfs_device *mmdvfs);
 
 	int (*hw_vote)(struct mmdvfs_device *mmdvfs, const u8 user_id, const u8 level);
-	int (*get_current_level)(struct mmdvfs_device *mmdvfs, u32 pwr_id);
-	int (*dvfsrc_rg_dump)(struct mmdvfs_device *mmdvfs);
-	int (*dvfsrc_record_dump)(struct mmdvfs_device *mmdvfs);
 	int (*init_hw)(struct mmdvfs_device *mmdvfs);
 	void (*deinit_hw)(struct mmdvfs_device *mmdvfs);
 
-	/* Power management operations */
-	void (*suspend_prepare)(struct mmdvfs_device *mmdvfs);
-	void (*post_suspend)(struct mmdvfs_device *mmdvfs);
-
-	/* HWCCF DVFS voter - Extended operations */
-	int (*camera_notify)(struct mmdvfs_device *mmdvfs, bool enable);
-	int (*genpd_notify)(struct mmdvfs_device *mmdvfs, u8 idx, bool enable);
-	int (*set_avs)(struct mmdvfs_device *mmdvfs, u8 idx, u32 aging, u32 fresh);
-	int (*camsv_dc_enable)(struct mmdvfs_device *mmdvfs, u8 idx, bool enable);
 };
 
 /**
@@ -169,10 +194,10 @@ struct mmdvfs_ops {
  * @mux_num: Number of MUXes
  * @user_num: Number of Users
  * @lock: Device-wide mutex for synchronization
- * @hwccf_voter_priv: HWCCF DVFS Voter private data (dynamically allocated)
+ * @up_instances: Multiple UP instances (VCP+MMUP simultaneous support)
+ * @up_count: Number of UP instances
  * @init_done: Initialization completion flag
- * @pm_notifier: Suspend/resume notifier
- * @pm_suspended: Whether system suspend is in progress
+ * @init_task: Async initialization thread
  */
 struct mmdvfs_data {
 	struct device *dev;
@@ -185,19 +210,18 @@ struct mmdvfs_data {
 	u8 rc_num;
 	u8 mux_num;
 	u8 user_num;
-	/* Protects device-wide state. */
+	/* Protects UP instance registration. */
 	struct mutex lock;
 
-	/* Hardware-specific private data (dynamically allocated) */
-	struct mmdvfs_hwccf_voter_priv *hwccf_voter_priv;
+	/* Multiple UP instances (VCP+MMUP simultaneous support) */
+	struct mmdvfs_up_instance up_instances[MMDVFS_UP_MAX];
+	u8 up_count;
 
 	/* Shared status and control */
 	bool init_done;
 
-	/* PM notifier for suspend/resume handling */
-	struct notifier_block pm_notifier;
-	bool pm_suspended;
-
+	/* Async initialization thread */
+	struct task_struct *init_task;
 };
 
 /**
@@ -210,6 +234,9 @@ struct mmdvfs_device {
 	struct device *dev;
 	struct mmdvfs_data *data;
 	struct clk_hw_onecell_data *clk_data;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *debugfs_dir;
+#endif
 };
 
 /* Helper macros */
@@ -224,6 +251,7 @@ struct mmdvfs_device {
  * @user_table: Array of User/Client configurations
  * @user_num: Number of Users in this SoC
  * @version: MMDVFS voting mechanism
+ * @vote_requires_up_ready: User votes require the UP backend to be ready
  *
  * This structure defines the per-SoC topology statically in code.
  * Allocated and configured by each per-SoC driver file.
@@ -236,6 +264,7 @@ struct mmdvfs_soc_data {
 	const struct mmdvfs_user *user_table;
 	u8 user_num;
 	enum mmdvfs_version_type version;
+	bool vote_requires_up_ready;
 };
 
 /**
@@ -253,7 +282,6 @@ struct mmdvfs_platform_data {
 
 /* Core functions */
 int mmdvfs_register_clocks(struct mmdvfs_device *mmdvfs);
-void mmdvfs_unregister_clocks(struct mmdvfs_device *mmdvfs);
 int mmdvfs_parse_dt(struct mmdvfs_device *mmdvfs);
 
 /* Platform-specific functions to be implemented */
@@ -262,14 +290,26 @@ extern const struct mmdvfs_ops mmdvfs_mt8196_ops;
 /* Per-SoC topology data */
 extern const struct mmdvfs_soc_data mmdvfs_mt8196_soc_data;
 
+/* UP management functions (public API) */
+int mmdvfs_up_register(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type);
+void mmdvfs_up_unregister(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type);
+struct mmdvfs_up_instance *mmdvfs_up_get_instance(struct mmdvfs_device *mmdvfs,
+						  enum mmdvfs_up_type type);
+const struct mmdvfs_up_ops *mmdvfs_up_get_ops(enum mmdvfs_up_type type);
+void *mmdvfs_up_get_priv(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type);
+int mmdvfs_up_set_priv(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type, void *priv);
+int mmdvfs_up_send_ipi(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type,
+		       void *ipi_data, u32 len, const bool vcp);
+bool mmdvfs_up_get_cb_ready(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type);
+
 /* Platform-specific operations */
 u32 mmdvfs_get_version(void);
-int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx);
-int mtk_mmdvfs_camera_notify(bool enable);
-int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable);
-int mtk_mmdvfs_genpd_notify(u8 idx, bool enable);
-int mtk_mmdvfs_set_avs(u8 idx, u32 aging, u32 fresh);
-int mmdvfs_set_lp_mode(bool enable);
+void *mmdvfs_get_mmup_base(phys_addr_t *pa);
+void *mmdvfs_get_vcp_base(phys_addr_t *pa);
+bool mmdvfs_get_mmup_sram_enable(void);
+void __iomem *mmdvfs_get_mmup_sram(void);
+bool mmdvfs_get_mmup_enable(void);
+int mtk_mmdvfs_enable_vcp(const bool enable, const u8 idx);
 
 /* Utility functions */
 static inline bool mmdvfs_is_valid_user_id(u8 user_id)
@@ -292,6 +332,22 @@ static inline bool mmdvfs_is_valid_mux_id(u8 mux_id)
 	return mux_id < MMDVFS_MAX_MUXES;
 }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void mmdvfs_debug_init(struct mmdvfs_device *mmdvfs);
+void mmdvfs_debug_exit(struct mmdvfs_device *mmdvfs);
+#else
+static inline void mmdvfs_debug_init(struct mmdvfs_device *mmdvfs) { }
+static inline void mmdvfs_debug_exit(struct mmdvfs_device *mmdvfs) { }
+#endif
+
+/* VCP power info for debug */
+int mmdvfs_vcp_get_power_info(struct mmdvfs_device *mmdvfs, int *power, int *pwr_usage);
+bool mmdvfs_vcp_get_mmup_enable(struct mmdvfs_device *mmdvfs);
+bool mmdvfs_vcp_get_mmup_sram_enable(struct mmdvfs_device *mmdvfs);
+void mmdvfs_vcp_lock_cb_mutex(struct mmdvfs_device *mmdvfs);
+void mmdvfs_vcp_unlock_cb_mutex(struct mmdvfs_device *mmdvfs);
+int mmdvfs_vcp_release_init(struct mmdvfs_device *mmdvfs);
+
 /* Logging macros */
 #define mmdvfs_dbg(dev, fmt, args...) \
 	dev_dbg(dev, "[mmdvfs] " fmt, ##args)
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h b/drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h
new file mode 100644
index 000000000000..592db7f46d29
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS Microprocessor Abstraction Layer - Private Header
+ */
+
+#ifndef __MMDVFS_UP_PRIV_H__
+#define __MMDVFS_UP_PRIV_H__
+
+#include <linux/types.h>
+
+/* Forward declarations */
+struct mmdvfs_device;
+
+/* UP (microprocessor) types */
+enum mmdvfs_up_type {
+	MMDVFS_UP_VCP = 0,	/* Video Co-Processor (VCP RV55 with MMUP RV33 support) */
+	MMDVFS_UP_MAX,
+};
+
+/**
+ * struct mmdvfs_up_ops - Micrsoprocessor abstraction operations
+ * @init: Initialize microprocessor communication
+ * @deinit: Deinitialize microprocessor communication
+ * @send_ipi: Send IPI message to microprocessor
+ * @enable: Enable/disable microprocessor power
+ * @get_base: Get microprocessor base address by mem_id (MMDVFS_VCP_MEM_ID or MMDVFS_MMUP_MEM_ID)
+ * @get_sram: Get SRAM virtual address
+ * @get_cb_ready: Get callback ready status (VCP/MMUP ready)
+ *
+ * This structure defines the operations that each UP implementation must provide.
+ * Different microprocessor types (VCP, ADSP, SCP) implement these operations differently.
+ */
+struct mmdvfs_up_ops {
+	int (*init)(struct mmdvfs_device *mmdvfs);
+	void (*deinit)(struct mmdvfs_device *mmdvfs);
+	int (*send_ipi)(struct mmdvfs_device *mmdvfs, void *data, u32 len, const bool vcp);
+
+	/* Hardware-specific microprocessor operations */
+	int (*enable)(struct mmdvfs_device *mmdvfs, bool enable, u8 idx);
+	void *(*get_base)(struct mmdvfs_device *mmdvfs, u32 mem_id, phys_addr_t *pa);
+	void __iomem *(*get_sram)(struct mmdvfs_device *mmdvfs);
+	bool (*get_cb_ready)(struct mmdvfs_device *mmdvfs);
+};
+
+/* UP instance structure for multiple UP support */
+struct mmdvfs_up_instance {
+	enum mmdvfs_up_type type;
+	const struct mmdvfs_up_ops *ops;
+	void *priv_data;
+};
+
+/* UP implementation declarations */
+extern const struct mmdvfs_up_ops mmdvfs_vcp_ops;   /* VCP (Video Co-Processor) with MMUP support */
+
+#endif /* __MMDVFS_UP_PRIV_H__ */
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-up.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
new file mode 100644
index 000000000000..cdf994889390
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS Microprocessor Abstraction Layer
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+
+#include "mmdvfs-internal.h"
+#include "mmdvfs-up-priv.h"
+
+/* ========== UP (Microprocessor) Management Functions ========== */
+
+/*
+ * mmdvfs_up_register - Register UP instance
+ * @mmdvfs: MMDVFS device structure
+ * @type: UP type
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int mmdvfs_up_register(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type)
+{
+	struct mmdvfs_data *data;
+	struct mmdvfs_up_instance *up;
+	const struct mmdvfs_up_ops *ops;
+	int ret = 0;
+
+	if (!mmdvfs || !mmdvfs->data) {
+		pr_err("mmdvfs: Invalid device reference\n");
+		return -EINVAL;
+	}
+
+	data = mmdvfs->data;
+
+	if (data->up_count >= MMDVFS_UP_MAX) {
+		mmdvfs_err(mmdvfs->dev, "Maximum UP instances reached\n");
+		return -ENOSPC;
+	}
+
+	ops = mmdvfs_up_get_ops(type);
+	if (!ops) {
+		mmdvfs_err(mmdvfs->dev, "UP operations not found for type %d\n", type);
+		return -ENODEV;
+	}
+
+	mutex_lock(&data->lock);
+
+	for (int i = 0; i < data->up_count; i++) {
+		if (data->up_instances[i].type == type) {
+			mmdvfs_err(mmdvfs->dev,
+				   "UP type %d already registered\n", type);
+			ret = -EEXIST;
+			goto unlock;
+		}
+	}
+
+	up = &data->up_instances[data->up_count];
+	up->type = type;
+	up->ops = ops;
+	up->priv_data = NULL;
+
+	data->up_count++;
+
+	if (ops->init) {
+		ret = ops->init(mmdvfs);
+		if (ret) {
+			mmdvfs_err(mmdvfs->dev,
+				   "Failed to initialize UP type %d: %d\n",
+				   type, ret);
+			data->up_count--;
+			goto unlock;
+		}
+	}
+
+	mmdvfs_info(mmdvfs->dev, "Registered UP type %d\n", type);
+
+unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+/*
+ * mmdvfs_up_unregister - Unregister UP instance
+ * @mmdvfs: MMDVFS device structure
+ * @type: UP type
+ */
+void mmdvfs_up_unregister(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type)
+{
+	struct mmdvfs_data *data;
+	struct mmdvfs_up_instance *up;
+	int i, found = -1;
+
+	if (!mmdvfs || !mmdvfs->data) {
+		pr_err("mmdvfs: Invalid device reference\n");
+		return;
+	}
+
+	data = mmdvfs->data;
+
+	mutex_lock(&data->lock);
+
+	for (i = 0; i < data->up_count; i++) {
+		if (data->up_instances[i].type == type) {
+			found = i;
+			break;
+		}
+	}
+
+	if (found < 0) {
+		mmdvfs_err(mmdvfs->dev, "UP type %d not found\n", type);
+		goto unlock;
+	}
+
+	up = &data->up_instances[found];
+
+	if (up->ops && up->ops->deinit)
+		up->ops->deinit(mmdvfs);
+
+	for (i = found; i < data->up_count - 1; i++)
+		data->up_instances[i] = data->up_instances[i + 1];
+	data->up_count--;
+
+	mmdvfs_info(mmdvfs->dev, "Unregistered UP type %d\n", type);
+
+unlock:
+	mutex_unlock(&data->lock);
+}
+
+/*
+ * mmdvfs_up_get_instance - Get UP instance
+ * @mmdvfs: MMDVFS device structure
+ * @type: UP type
+ *
+ * Return: Pointer to UP instance, or NULL if not found
+ */
+struct mmdvfs_up_instance *
+mmdvfs_up_get_instance(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type)
+{
+	struct mmdvfs_data *data;
+	int i;
+
+	if (!mmdvfs || !mmdvfs->data) {
+		pr_err("mmdvfs: Invalid device reference\n");
+		return NULL;
+	}
+
+	data = mmdvfs->data;
+
+	for (i = 0; i < data->up_count; i++) {
+		if (data->up_instances[i].type == type)
+			return &data->up_instances[i];
+	}
+
+	return NULL;
+}
+
+void *mmdvfs_up_get_priv(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type)
+{
+	struct mmdvfs_up_instance *up;
+
+	up = mmdvfs_up_get_instance(mmdvfs, type);
+	if (!up)
+		return NULL;
+
+	return up->priv_data;
+}
+
+int mmdvfs_up_set_priv(struct mmdvfs_device *mmdvfs,
+		       enum mmdvfs_up_type type, void *priv)
+{
+	struct mmdvfs_up_instance *up;
+
+	up = mmdvfs_up_get_instance(mmdvfs, type);
+	if (!up)
+		return -ENODEV;
+
+	up->priv_data = priv;
+	return 0;
+}
+
+/*
+ * mmdvfs_up_get_ops - Get UP operations
+ * @type: UP type
+ *
+ * Return: Pointer to UP operations, or NULL if not found
+ */
+const struct mmdvfs_up_ops *mmdvfs_up_get_ops(enum mmdvfs_up_type type)
+{
+	switch (type) {
+	case MMDVFS_UP_VCP:
+		return &mmdvfs_vcp_ops;
+	default:
+		pr_err("mmdvfs: Unknown UP type %d\n", type);
+		return NULL;
+	}
+}
+
+/*
+ * mmdvfs_up_send_ipi - Send IPI to UP
+ * @mmdvfs: MMDVFS device structure
+ * @type: UP type
+ * @data: IPI data
+ * @len: Data length
+ * @vcp: true = use VCP, false = auto select VCP/MMUP
+ */
+int mmdvfs_up_send_ipi(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type,
+		       void *ipi_data, u32 len, const bool vcp)
+{
+	struct mmdvfs_up_instance *up;
+	int ret = 0;
+
+	if (!mmdvfs) {
+		pr_err("mmdvfs: Invalid device reference\n");
+		return -EINVAL;
+	}
+
+	mmdvfs_dbg(mmdvfs->dev, "[VCP_IPI] send_ipi: type=%d len=%u vcp=%d\n",
+		   type, len, vcp);
+
+	up = mmdvfs_up_get_instance(mmdvfs, type);
+	if (!up) {
+		mmdvfs_err(mmdvfs->dev, "UP type %d not found\n", type);
+		return -ENODEV;
+	}
+	if (!mmdvfs_up_get_cb_ready(mmdvfs, type))
+		return -EAGAIN;
+
+	if (up->ops && up->ops->send_ipi) {
+		ret = up->ops->send_ipi(mmdvfs, ipi_data, len, vcp);
+		mmdvfs_dbg(mmdvfs->dev, "[VCP_IPI] send_ipi returned ret=%d\n", ret);
+	} else {
+		mmdvfs_err(mmdvfs->dev,
+			   "UP send_ipi operation not implemented for type %d\n",
+			   type);
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+/*
+ * mmdvfs_up_get_cb_ready - Get UP callback ready status
+ * @mmdvfs: MMDVFS device structure
+ * @type: UP type
+ *
+ * Returns: true if UP callbacks are ready, false otherwise
+ *
+ * This function queries the UP layer to check if the microprocessor
+ * callback system is ready (VCP_EVENT_READY has been received).
+ * Used by async init kthread to wait for UP initialization.
+ */
+bool mmdvfs_up_get_cb_ready(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type type)
+{
+	struct mmdvfs_up_instance *up;
+
+	if (!mmdvfs) {
+		pr_err("mmdvfs: Invalid device reference\n");
+		return false;
+	}
+
+	up = mmdvfs_up_get_instance(mmdvfs, type);
+	if (!up) {
+		mmdvfs_err(mmdvfs->dev, "UP type %d not found\n", type);
+		return false;
+	}
+
+	if (up->ops && up->ops->get_cb_ready)
+		return up->ops->get_cb_ready(mmdvfs);
+
+	/* If not implemented, assume ready */
+	return true;
+}
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h b/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h
new file mode 100644
index 000000000000..363fb5445859
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS VCP/MMUP Shared Memory Layout
+ */
+
+#ifndef __MMDVFS_VCP_MEMORY_H
+#define __MMDVFS_VCP_MEMORY_H
+
+/*
+ * Shared Memory Register Offsets
+ *
+ * Base address is obtained via mtk_vcp_ops.vcp_get_mem_virt()
+ * Usage: writel(val, mem_base + MEM_VOTE_OPP_PWR(idx));
+ *
+ * These offsets match the VCP firmware memory layout exactly.
+ */
+
+/* Control and sync registers */
+#define MEM_LOG_FLAG			0x0
+#define MEM_FREERUN			0x4
+#define MEM_VSRAM_VOL			0x8
+
+/* IPI sync registers - used for VCP/MMUP communication */
+#define MEM_IPI_SYNC_FUNC		0xC
+#define MEM_IPI_SYNC_DATA		0x10
+#define MEM_VMRC_LOG_FLAG		0x14
+
+/* AVS aging/fresh count registers - 2 users (CAM, VDE/IMG) */
+#define MEM_AGING_CNT(x)		(0x20 + 0x4 * (x))
+#define MEM_AGING_CNT_COUNT		2
+#define MEM_FRESH_CNT(x)		(0x28 + 0x4 * (x))
+
+/*
+ * Firmware-owned control slots. Linux initializes them to MAX_OPP so the
+ * firmware treats them as inactive; RFC v1 does not expose an AP control API
+ * for these slots.
+ */
+#define MEM_FW_RSVD_OPP_PWR(x)		(0x30 + 0x4 * (x))
+#define MEM_FW_RSVD_OPP_PWR_COUNT	4
+#define MEM_VOTE_OPP_PWR(x)		(0x40 + 0x4 * (x))
+
+/* User OPP registers - 14 users */
+#define MEM_VOTE_OPP_USR(x)		(0x50 + 0x4 * (x))
+#define MEM_VOTE_OPP_USR_COUNT		14
+
+/* Low power and VMM ceiling control */
+#define MEM_LP_MODE			0x88
+#define MEM_VMM_CEIL_ENABLE		0x8C
+
+/* Clock mux control */
+#define MEM_CLKMUX_ENABLE		0x90
+#define MEM_CLKMUX_ENABLE_DONE		0x94
+#define MEM_VMM_EFUSE_LOW		0x98
+#define MEM_VMM_EFUSE_HIGH		0x9C
+
+/* VMM OPP voltage and VDISP AVS step - 8 levels */
+#define MEM_VMM_OPP_VOLT(x)		(0xA0 + 0x4 * (x))
+#define MEM_VDISP_AVS_STEP(x)		(0xC0 + 0x4 * (x))
+
+/* Profile and exception registers */
+#define MEM_PROFILE_TIMES		0xE0
+#define MEM_VCP_EXC_SEC			0xE4
+#define MEM_VCP_EXC_USEC		0xE8
+#define MEM_VCP_EXC_VAL			0xEC
+
+/* User OPP timestamp and value - 32 users */
+#define MEM_USR_OPP_SEC(x)		(0xF0 + 0x4 * (x))
+#define MEM_USR_OPP_USEC(x)		(0x170 + 0x4 * (x))
+#define MEM_USR_OPP(x)			(0x1F0 + 0x4 * (x))
+#define MEM_USR_FREQ(x)			(0x270 + 0x4 * (x))
+
+/* Mux OPP registers - 16 muxes */
+#define MEM_MUX_OPP_SEC(x)		(0x2F0 + 0x4 * (x))
+#define MEM_MUX_OPP_USEC(x)		(0x330 + 0x4 * (x))
+#define MEM_MUX_OPP(x)			(0x370 + 0x4 * (x))
+#define MEM_MUX_MIN(x)			(0x3B0 + 0x4 * (x))
+#define MEM_FW_RSVD_CLK(x)		(0x3F0 + 0x4 * (x))
+
+/* Power domain status - 4 domains */
+#define MEM_PWR_OPP_SEC(x)		(0x430 + 0x4 * (x))
+#define MEM_PWR_OPP_USEC(x)		(0x440 + 0x4 * (x))
+#define MEM_PWR_OPP(x)			(0x450 + 0x4 * (x))
+#define MEM_PWR_CUR_GEAR(x)		(0x460 + 0x4 * (x))
+#define MEM_FW_RSVD_VOL(x)		(0x470 + 0x4 * (x))
+
+/* VMM buck control */
+#define MEM_VMM_BUCK_ON			0x480
+
+/* Power domain total time - 4 domains * 8 OPP levels, u64 */
+#define MEM_PWR_TOTAL_TIME(x, y)	(0x484 + 0x40 * (x) + 0x8 * (y))
+
+/* Mux callback registers */
+#define MEM_MUX_CB_MUX_OPP		0x584
+#define MEM_MUX_CB_SEC			0x588
+#define MEM_MUX_CB_USEC			0x58C
+#define MEM_MUX_CB_END_SEC		0x590
+#define MEM_MUX_CB_END_USEC		0x594
+
+/* SRAM offset */
+#define MEM_SRAM_OFFSET			0xFFC
+
+#endif /* __MMDVFS_VCP_MEMORY_H */
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c
new file mode 100644
index 000000000000..fc6db1c89294
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c
@@ -0,0 +1,1075 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ * Author: Echo Zhang <echo.zhang@mediatek.com>
+ *
+ * MMDVFS VCP Abstraction Layer
+ * VCP (RV55) + MMUP (RV33) microprocessor management
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc/mtk_vcp_public.h>
+#include <linux/slab.h>
+
+#include "mmdvfs-internal.h"
+#include "mmdvfs-up-priv.h"
+#include "mmdvfs-vcp-memory.h"
+
+#define VCP_IPI_TIMEOUT_MS		100
+#define VCP_MMDVFS_CMD_SET_FREQ		0x1001
+#define VCP_MMDVFS_CMD_GET_FREQ		0x1002
+#define PIN_OUT_SIZE_MMDVFS		2
+#ifndef VCP_SYNC_TIMEOUT_MS
+#define VCP_SYNC_TIMEOUT_MS		1000
+#endif
+#define VCP_IPIDEV_RETRY_MAX		100
+
+enum boot_mode_t {
+	NORMAL_BOOT		= 0,
+	META_BOOT		= 1,
+	RECOVERY_BOOT		= 2,
+	SW_REBOOT		= 3,
+	FACTORY_BOOT		= 4,
+	ADVMETA_BOOT		= 5,
+	ATE_FACTORY_BOOT	= 6,
+	ALARM_BOOT		= 7,
+	UNKNOWN_BOOT		= 8,
+};
+
+static int bootmode = UNKNOWN_BOOT;
+
+/**
+ * struct mmdvfs_vcp_priv - VCP private data
+ * @mmup_enable: MMUP enable flag
+ * @vcp_feature_id: VCP feature ID
+ * @mmup_feature_id: MMUP feature ID
+ * @current_feature_id: Current registered feature ID
+ * @vcp_pdev: VCP platform device
+ * @vcp_ipi_id: VCP IPI channel ID
+ * @vcp_va: VCP shared memory virtual address
+ * @vcp_pa: VCP shared memory physical address
+ * @vcp_iova: VCP shared memory IOVA address
+ * @mmup_pdev: MMUP platform device
+ * @mmup_ipi_id: MMUP IPI channel ID
+ * @mmup_va: MMUP shared memory virtual address
+ * @mmup_pa: MMUP shared memory physical address
+ * @mmup_iova: MMUP shared memory IOVA address
+ * @mmup_sram_va: MMUP SRAM virtual address
+ * @mmup_sram_enable: MMUP SRAM enable flag
+ * @power: VCP power reference count
+ * @pwr_usage: Per-user power reference count
+ * @pwr_mutex: Power management mutex
+ * @ipi_mutex: Serializes shared-memory IPI transactions
+ * @init_ready_mask: Successful initialization IPI path
+ * @cb_ready: Initialization IPI completed
+ * @cb_mutex: Protects init_ready_mask and cb_ready
+ * @mmdvfs: MMDVFS device reference
+ * @initialized: Initialization flag
+ */
+struct mmdvfs_vcp_priv {
+	bool mmup_enable;
+	enum vcp_feature_id vcp_feature_id;
+	enum vcp_feature_id mmup_feature_id;
+	enum vcp_feature_id current_feature_id;
+
+	struct mtk_vcp_device *vcp_device;
+	struct platform_device *vcp_pdev;
+	u32 vcp_ipi_id;
+	void __iomem *vcp_va;
+	phys_addr_t vcp_pa;
+	phys_addr_t vcp_iova;
+
+	struct platform_device *mmup_pdev;
+	u32 mmup_ipi_id;
+	void __iomem *mmup_va;
+	phys_addr_t mmup_pa;
+	phys_addr_t mmup_iova;
+	void __iomem *mmup_sram_va;
+	bool mmup_sram_enable;
+
+	int power;
+	int pwr_usage[VCP_PWR_USR_NUM];
+	/* Protects power and pwr_usage. */
+	struct mutex pwr_mutex;
+	/* Serializes shared-memory writes and the following IPI sync. */
+	struct mutex ipi_mutex;
+
+	u8 init_ready_mask;
+	bool cb_ready;
+	/* Protects init_ready_mask and cb_ready. */
+	struct mutex cb_mutex;
+
+	/* VCP state flags */
+	bool vcp_stop;
+	bool rst_clk_done;
+	bool release_step_done;
+
+	struct notifier_block mmup_notifier;
+
+	struct mmdvfs_device *mmdvfs;
+	bool initialized;
+};
+
+static inline struct mmdvfs_vcp_priv *mmdvfs_vcp_priv(struct mmdvfs_device *mmdvfs)
+{
+	return mmdvfs_up_get_priv(mmdvfs, MMDVFS_UP_VCP);
+}
+
+static bool mmdvfs_vcp_is_ready(struct mmdvfs_vcp_priv *priv, enum vcp_feature_id id)
+{
+	if (!priv || !priv->vcp_device || !priv->vcp_device->ops ||
+	    !priv->vcp_device->ops->vcp_is_ready)
+		return false;
+
+	return priv->vcp_device->ops->vcp_is_ready(priv->vcp_device, id);
+}
+
+static int mmdvfs_vcp_register_feature(struct mmdvfs_vcp_priv *priv, enum vcp_feature_id id)
+{
+	if (!priv || !priv->vcp_device || !priv->vcp_device->ops ||
+	    !priv->vcp_device->ops->register_feature)
+		return -ENODEV;
+
+	return priv->vcp_device->ops->register_feature(priv->vcp_device, id);
+}
+
+static int mmdvfs_vcp_deregister_feature(struct mmdvfs_vcp_priv *priv, enum vcp_feature_id id)
+{
+	if (!priv || !priv->vcp_device || !priv->vcp_device->ops ||
+	    !priv->vcp_device->ops->deregister_feature)
+		return -ENODEV;
+
+	return priv->vcp_device->ops->deregister_feature(priv->vcp_device, id);
+}
+
+static void mmdvfs_vcp_register_notify(struct mmdvfs_vcp_priv *priv, enum vcp_feature_id id,
+				       struct notifier_block *nb)
+{
+	if (priv && priv->vcp_device && priv->vcp_device->ops &&
+	    priv->vcp_device->ops->register_notify)
+		priv->vcp_device->ops->register_notify(priv->vcp_device, id, nb);
+}
+
+static void mmdvfs_vcp_unregister_notify(struct mmdvfs_vcp_priv *priv, enum vcp_feature_id id,
+					 struct notifier_block *nb)
+{
+	if (priv && priv->vcp_device && priv->vcp_device->ops &&
+	    priv->vcp_device->ops->unregister_notify)
+		priv->vcp_device->ops->unregister_notify(priv->vcp_device, id, nb);
+}
+
+static struct mtk_ipi_device *mmdvfs_vcp_get_ipidev(struct mmdvfs_vcp_priv *priv)
+{
+	if (!priv || !priv->vcp_device)
+		return NULL;
+
+	return vcp_get_ipidev(priv->vcp_device);
+}
+
+/*
+ * mmdvfs_get_bootmode - Get system boot mode
+ *
+ * Query boot mode from device tree /chosen node
+ */
+static void mmdvfs_get_bootmode(void)
+{
+	struct device_node *np_chosen;
+	struct tag_bootmode {
+		u32 size;
+		u32 tag;
+		u32 bootmode;
+		u32 boottype;
+	} *tag;
+
+	if (bootmode < UNKNOWN_BOOT)
+		return;
+
+	np_chosen = of_find_node_by_path("/chosen");
+	if (!np_chosen) {
+		bootmode = NORMAL_BOOT;
+		return;
+	}
+
+	tag = (struct tag_bootmode *)of_get_property(np_chosen, "atag,boot", NULL);
+	of_node_put(np_chosen);
+
+	if (tag)
+		bootmode = tag->bootmode;
+	else
+		bootmode = NORMAL_BOOT;
+}
+
+/*
+ * mmdvfs_vcp_wait_target_ready - Wait for VCP/MMUP ready
+ */
+static int
+mmdvfs_vcp_wait_target_ready(struct mmdvfs_device *mmdvfs,
+			     struct mmdvfs_vcp_priv *priv,
+			     enum vcp_feature_id target_feature,
+			     const char *target_name,
+			     struct mmdvfs_vcp_ipi_data *ipi_data)
+{
+	int retry = 0;
+	bool hw_ready = mmdvfs_vcp_is_ready(priv, target_feature);
+
+	while (!hw_ready || !READ_ONCE(priv->cb_ready) || priv->rst_clk_done) {
+		if (!READ_ONCE(priv->cb_ready) &&
+		    (ipi_data->func == FUNC_MMDVFS_INIT ||
+		     ipi_data->func == FUNC_MMDVFSRC_INIT))
+			break;
+
+		if (++retry > VCP_SYNC_TIMEOUT_MS) {
+			mmdvfs_err(mmdvfs->dev,
+				   "%s not ready after %d ms (func=%u)\n",
+				   target_name, VCP_SYNC_TIMEOUT_MS, ipi_data->func);
+			return -ETIMEDOUT;
+		}
+		mdelay(1);
+		hw_ready = mmdvfs_vcp_is_ready(priv, target_feature);
+	}
+
+	return 0;
+}
+
+/*
+ * mmdvfs_vcp_send_and_sync - Send IPI and sync
+ */
+static int
+mmdvfs_vcp_send_and_sync(struct mmdvfs_device *mmdvfs,
+			 struct mmdvfs_vcp_priv *priv,
+			 struct mtk_ipi_device *ipidev,
+			 enum vcp_feature_id target_feature,
+			 u32 target_ipi_id,
+			 const char *target_name,
+			 void *data,
+			 struct mmdvfs_vcp_ipi_data *ipi_data,
+			 void __iomem *mem_base,
+			 u32 sync_func_val)
+{
+	int ret, retry;
+
+	if (!priv) {
+		mmdvfs_err(mmdvfs->dev, "%s IPI path invalid: priv is NULL\n",
+			   target_name);
+		return -ENODEV;
+	}
+
+	if (!mem_base || !ipidev || !priv->vcp_device ||
+	    !priv->vcp_device->ipi_ops || !priv->vcp_device->ipi_ops->ipi_send) {
+		mmdvfs_err(mmdvfs->dev,
+			   "%s IPI path invalid: mem=%p ipidev=%p ipi_ops=%p ipi_send=%p\n",
+			   target_name, mem_base, ipidev,
+			   priv->vcp_device ? priv->vcp_device->ipi_ops : NULL,
+			   priv->vcp_device && priv->vcp_device->ipi_ops ?
+			   priv->vcp_device->ipi_ops->ipi_send : NULL);
+		return -ENODEV;
+	}
+
+	mutex_lock(&priv->pwr_mutex);
+
+	writel(0, mem_base + MEM_IPI_SYNC_DATA);
+	writel(sync_func_val | (1 << ipi_data->func),
+	       mem_base + MEM_IPI_SYNC_FUNC);
+
+	mutex_lock(&priv->cb_mutex);
+	if (!priv->cb_ready &&
+	    ipi_data->func != FUNC_MMDVFS_INIT &&
+	    ipi_data->func != FUNC_MMDVFSRC_INIT) {
+		mutex_unlock(&priv->cb_mutex);
+		mmdvfs_err(mmdvfs->dev, "%s cb_ready false before IPI\n", target_name);
+		mutex_unlock(&priv->pwr_mutex);
+		return -ETIMEDOUT;
+	}
+	mutex_unlock(&priv->cb_mutex);
+	mutex_unlock(&priv->pwr_mutex);
+
+	ret = priv->vcp_device->ipi_ops->ipi_send(ipidev, target_ipi_id,
+						  data, PIN_OUT_SIZE_MMDVFS);
+	if (ret != IPI_ACTION_DONE) {
+		mmdvfs_err(mmdvfs->dev, "IPI send to %s failed: %d\n",
+			   target_name, ret);
+		ret = -EIO;
+		goto cleanup_sync;
+	}
+
+	retry = 0;
+	while (1) {
+		u32 sync_data = readl(mem_base + MEM_IPI_SYNC_DATA);
+
+		if (sync_data & (1 << ipi_data->func))
+			break;
+
+		if (++retry > 1000000) {
+			mmdvfs_err(mmdvfs->dev, "IPI timeout (func=%u)\n", ipi_data->func);
+			ret = -ETIMEDOUT;
+			goto cleanup_sync;
+		}
+
+		if (!mmdvfs_vcp_is_ready(priv, target_feature)) {
+			mmdvfs_err(mmdvfs->dev, "%s not ready during wait (func=%u)\n",
+				   target_name, ipi_data->func);
+			ret = -ETIMEDOUT;
+			goto cleanup_sync;
+		}
+		udelay(1);
+	}
+
+	ret = 0;
+
+cleanup_sync:
+	mutex_lock(&priv->pwr_mutex);
+	if (ret == 0) {
+		u32 sync_func = readl(mem_base + MEM_IPI_SYNC_FUNC);
+		u32 sync_data = readl(mem_base + MEM_IPI_SYNC_DATA);
+
+		writel(sync_func & ~sync_data, mem_base + MEM_IPI_SYNC_FUNC);
+	}
+	mutex_unlock(&priv->pwr_mutex);
+
+	return ret;
+}
+
+/*
+ * mmdvfs_vcp_send_ipi_impl - Send IPI to VCP/MMUP
+ */
+static int
+mmdvfs_vcp_send_ipi_impl(struct mmdvfs_device *mmdvfs, void *data, u32 len,
+			 const bool vcp)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+	struct mmdvfs_vcp_ipi_data *ipi_data;
+	struct mtk_ipi_device *ipidev;
+	enum vcp_feature_id target_feature;
+	u32 target_ipi_id;
+	const char *target_name;
+	void __iomem *mem_base;
+	u32 sync_func_val;
+	int ret;
+
+	mmdvfs_get_bootmode();
+	if (bootmode == RECOVERY_BOOT) {
+		mmdvfs_err(mmdvfs->dev, "IPI skipped: bootmode=%d\n", bootmode);
+		return -EACCES;
+	}
+
+	if (!priv || !priv->initialized)
+		return -ENODEV;
+
+	if (!data || len < sizeof(*ipi_data)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid IPI data (len=%u, minimum=%zu)\n",
+			   len, sizeof(*ipi_data));
+		return -EINVAL;
+	}
+
+	ipi_data = (struct mmdvfs_vcp_ipi_data *)data;
+
+	if (len != sizeof(*ipi_data)) {
+		mmdvfs_err(mmdvfs->dev, "Invalid IPI data (len=%u, expected=%zu)\n",
+			   len, sizeof(*ipi_data));
+		return -EINVAL;
+	}
+
+	if (vcp || !priv->mmup_enable) {
+		target_feature = priv->vcp_feature_id;
+		target_ipi_id = priv->vcp_ipi_id;
+		target_name = "VCP";
+		mem_base = priv->vcp_va;
+	} else {
+		target_feature = priv->mmup_feature_id;
+		target_ipi_id = priv->mmup_ipi_id;
+		target_name = "MMUP";
+		mem_base = priv->mmup_va;
+	}
+
+	mutex_lock(&priv->ipi_mutex);
+	if (!mem_base) {
+		mmdvfs_err(mmdvfs->dev, "Shared memory base is NULL\n");
+		ret = -ENOMEM;
+		goto unlock_ipi;
+	}
+
+	sync_func_val = readl(mem_base + MEM_IPI_SYNC_FUNC);
+
+	ret = mmdvfs_vcp_wait_target_ready(mmdvfs, priv, target_feature,
+					   target_name, ipi_data);
+	if (ret)
+		goto unlock_ipi;
+
+	ipidev = mmdvfs_vcp_get_ipidev(priv);
+	if (!ipidev) {
+		mmdvfs_err(mmdvfs->dev, "vcp_get_ipidev failed for %s\n", target_name);
+		ret = -ENODEV;
+		goto unlock_ipi;
+	}
+
+	ret = mmdvfs_vcp_send_and_sync(mmdvfs, priv, ipidev, target_feature,
+				       target_ipi_id, target_name, data,
+				       ipi_data, mem_base, sync_func_val);
+
+unlock_ipi:
+	mutex_unlock(&priv->ipi_mutex);
+	return ret;
+}
+
+/*
+ * mmdvfs_reset_vcp - Check VCP power usage on suspend
+ * @priv: VCP private data
+ */
+static void mmdvfs_reset_vcp(struct mmdvfs_vcp_priv *priv)
+{
+	int i;
+
+	for (i = 0; i < VCP_PWR_USR_NUM; i++) {
+		if (priv->pwr_usage[i])
+			mmdvfs_err(priv->mmdvfs->dev,
+				   "VCP reset: user %d still has usage=%d\n",
+				   i, priv->pwr_usage[i]);
+	}
+}
+
+#define MMDVFS_UP_INIT_READY	BIT(0)
+
+static void mmdvfs_vcp_set_init_ready(struct mmdvfs_vcp_priv *priv, u8 path, bool done)
+{
+	u8 mask;
+	bool ready;
+
+	mutex_lock(&priv->cb_mutex);
+	mask = READ_ONCE(priv->init_ready_mask);
+	if (done)
+		mask |= path;
+	else
+		mask &= ~path;
+	WRITE_ONCE(priv->init_ready_mask, mask);
+
+	ready = !!(mask & MMDVFS_UP_INIT_READY);
+	WRITE_ONCE(priv->cb_ready, ready);
+	WRITE_ONCE(priv->mmdvfs->data->init_done, ready);
+	mutex_unlock(&priv->cb_mutex);
+}
+
+/*
+ * mmdvfs_mmup_notifier_callback - MMUP/VCP system event handler
+ * @nb: notifier block
+ * @event: Event type (VCP_EVENT_READY/STOP/SUSPEND/RESUME)
+ * @data: Event data
+ */
+static int mmdvfs_mmup_notifier_callback(struct notifier_block *nb,
+					 unsigned long event, void *data)
+{
+	struct mmdvfs_vcp_priv *priv =
+		container_of(nb, struct mmdvfs_vcp_priv, mmup_notifier);
+	struct mmdvfs_device *mmdvfs = priv->mmdvfs;
+	int ret;
+
+	switch (event) {
+	case VCP_EVENT_READY:
+		mmdvfs_vcp_set_init_ready(priv, MMDVFS_UP_INIT_READY, false);
+		priv->rst_clk_done = false;
+		priv->release_step_done = false;
+
+		/* Send FUNC_MMDVFS_INIT */
+		{
+			u64 target_iova = priv->mmup_enable ? priv->mmup_iova : priv->vcp_iova;
+			struct mmdvfs_vcp_ipi_data ipi_data = {
+				.func = FUNC_MMDVFS_INIT,
+				.idx = MAX_OPP,
+				.opp = MAX_OPP,
+				.ack = target_iova >> 32,
+				.base = (u32)target_iova
+			};
+
+			ret = mmdvfs_vcp_send_ipi_impl(mmdvfs, &ipi_data,
+						       sizeof(ipi_data), false);
+			if (ret) {
+				mmdvfs_err(mmdvfs->dev, "MMDVFS init IPI failed: %d\n", ret);
+				break;
+			}
+		}
+
+		priv->vcp_stop = false;
+
+		/* Send FUNC_MMDVFSRC_INIT */
+		{
+			u64 target_iova = priv->mmup_enable ? priv->mmup_iova : priv->vcp_iova;
+			struct mmdvfs_vcp_ipi_data ipi_data = {
+				.func = FUNC_MMDVFSRC_INIT,
+				.idx = MAX_OPP,
+				.opp = MAX_OPP,
+				.ack = target_iova >> 32,
+				.base = (u32)target_iova
+			};
+
+			ret = mmdvfs_vcp_send_ipi_impl(mmdvfs, &ipi_data,
+						       sizeof(ipi_data), false);
+			if (ret) {
+				mmdvfs_err(mmdvfs->dev, "MMDVFSRC init IPI failed: %d\n", ret);
+				break;
+			}
+		}
+
+		/* Initialize MMUP SRAM */
+		if (priv->mmup_enable && priv->mmup_sram_enable && !priv->mmup_sram_va) {
+			void __iomem *sram_base;
+			void __iomem *mem_base;
+			u32 sram_offset;
+
+			sram_base = priv->vcp_device->ops->get_vcp_sram_virt(priv->vcp_device);
+			if (sram_base) {
+				mem_base = priv->mmup_enable ? priv->mmup_va : priv->vcp_va;
+				sram_offset = readl(mem_base + MEM_SRAM_OFFSET);
+				priv->mmup_sram_va = sram_base + sram_offset;
+			}
+		}
+
+		mmdvfs_vcp_set_init_ready(priv, MMDVFS_UP_INIT_READY, true);
+
+		break;
+
+	case VCP_EVENT_STOP:
+		priv->vcp_stop = true;
+		mmdvfs_vcp_set_init_ready(priv, MMDVFS_UP_INIT_READY, false);
+		break;
+
+	case VCP_EVENT_SUSPEND:
+		priv->release_step_done = true;
+		mmdvfs_reset_vcp(priv);
+		WRITE_ONCE(priv->init_ready_mask, 0);
+		WRITE_ONCE(priv->cb_ready, false);
+		WRITE_ONCE(mmdvfs->data->init_done, false);
+		break;
+
+	case VCP_EVENT_RESUME:
+		break;
+
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+/*
+ * mmdvfs_vcp_enable_impl - VCP enable/disable implementation
+ * @mmdvfs: MMDVFS device
+ * @enable: Enable/disable
+ * @idx: User index
+ */
+static int mmdvfs_vcp_enable_impl(struct mmdvfs_device *mmdvfs,
+				  bool enable, u8 idx)
+{
+	struct mmdvfs_vcp_priv *priv;
+	enum vcp_feature_id feature_id;
+	int ret = 0;
+
+	/* Get priv - may be NULL during init before set_priv() */
+	priv = mmdvfs_vcp_priv(mmdvfs);
+	if (!priv || idx >= VCP_PWR_USR_NUM)
+		return -EINVAL;
+
+	feature_id = priv->mmup_enable ?
+		     priv->mmup_feature_id : priv->vcp_feature_id;
+
+	mutex_lock(&priv->pwr_mutex);
+	if (enable) {
+		if (!priv->power) {
+			ret = mmdvfs_vcp_register_feature(priv, feature_id);
+			if (ret < 0) {
+				mmdvfs_err(mmdvfs->dev,
+					   "Failed to register VCP feature %d: %d\n",
+					   feature_id, ret);
+				goto unlock;
+			}
+			priv->current_feature_id = feature_id;
+		}
+		priv->power++;
+		priv->pwr_usage[idx]++;
+
+		mmdvfs_dbg(mmdvfs->dev,
+			   "VCP enable: power=%d, usage[%u]=%d\n",
+			   priv->power, idx, priv->pwr_usage[idx]);
+	} else {
+		if (!priv->power || !priv->pwr_usage[idx]) {
+			mmdvfs_err(mmdvfs->dev,
+				   "VCP disable failed: power=%d, usage[%u]=%d\n",
+				   priv->power, idx, priv->pwr_usage[idx]);
+			ret = -EINVAL;
+			goto unlock;
+		}
+
+		priv->power--;
+		priv->pwr_usage[idx]--;
+
+		if (!priv->power) {
+			ret = mmdvfs_vcp_deregister_feature(priv, priv->current_feature_id);
+			if (ret < 0) {
+				mmdvfs_err(mmdvfs->dev,
+					   "Failed to deregister VCP feature %d: %d\n",
+					   priv->current_feature_id, ret);
+				priv->power++;
+				priv->pwr_usage[idx]++;
+				goto unlock;
+			}
+		}
+
+		mmdvfs_dbg(mmdvfs->dev,
+			   "VCP disable: power=%d, usage[%u]=%d\n",
+			   priv->power, idx, priv->pwr_usage[idx]);
+	}
+
+unlock:
+	mutex_unlock(&priv->pwr_mutex);
+	return ret < 0 ? ret : 0;
+}
+
+int mmdvfs_vcp_release_init(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (!priv || !priv->initialized)
+		return -ENODEV;
+
+	return mmdvfs_vcp_enable_impl(mmdvfs, false, VCP_PWR_USR_MMDVFS_INIT);
+}
+
+/*
+ * mmdvfs_vcp_get_base_impl - Get VCP base address
+ * @mmdvfs: MMDVFS device structure
+ * @mem_id: Memory ID (MMDVFS_VCP_MEM_ID or MMDVFS_MMUP_MEM_ID)
+ * @pa: Physical address output
+ */
+static void *mmdvfs_vcp_get_base_impl(struct mmdvfs_device *mmdvfs, u32 mem_id, phys_addr_t *pa)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (!priv)
+		return NULL;
+
+	if (mem_id == MMDVFS_MMUP_MEM_ID) {
+		if (pa)
+			*pa = priv->mmup_pa;
+		return priv->mmup_va;
+	} else if (mem_id == MMDVFS_VCP_MEM_ID) {
+		if (pa)
+			*pa = priv->vcp_pa;
+		return priv->vcp_va;
+	}
+
+	mmdvfs_warn(mmdvfs->dev, "Unknown mem_id %u, defaulting to VCP\n", mem_id);
+	if (pa)
+		*pa = priv->vcp_pa;
+	return priv->vcp_va;
+}
+
+/*
+ * mmdvfs_vcp_get_sram_impl - Get VCP SRAM virtual address
+ * @mmdvfs: MMDVFS device structure
+ */
+static void __iomem *mmdvfs_vcp_get_sram_impl(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (!priv)
+		return NULL;
+
+	return priv->mmup_sram_va;
+}
+
+/*
+ * mmdvfs_vcp_init_impl - Initialize VCP abstraction
+ * @mmdvfs: MMDVFS device structure
+ */
+static int mmdvfs_vcp_init_impl(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv;
+	struct device_node *vcp_node;
+	struct device_node *mmup_node;
+	struct mtk_ipi_device *vcp_ipi_dev = NULL;
+	u32 ipi_id;
+	int ret, retry;
+
+	priv = devm_kzalloc(mmdvfs->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->mmdvfs = mmdvfs;
+	mutex_init(&priv->pwr_mutex);
+	mutex_init(&priv->ipi_mutex);
+	mutex_init(&priv->cb_mutex);
+	priv->cb_ready = false;
+
+	/* Set feature IDs */
+	priv->vcp_feature_id = MMDVFS_VCP_FEATURE_ID;
+	priv->mmup_feature_id = MMDVFS_MMUP_FEATURE_ID;
+
+	vcp_node = of_parse_phandle(mmdvfs->dev->of_node, "mediatek,vcp", 0);
+	if (!vcp_node) {
+		mmdvfs_err(mmdvfs->dev, "missing mediatek,vcp phandle in %pOF\n",
+			   mmdvfs->dev->of_node);
+		return -ENODEV;
+	}
+	of_node_put(vcp_node);
+
+	priv->vcp_device = vcp_get(to_platform_device(mmdvfs->dev));
+	if (!priv->vcp_device) {
+		return dev_err_probe(mmdvfs->dev, -EPROBE_DEFER,
+				     "VCP device is not ready\n");
+	}
+	if (!priv->vcp_device->dev || !priv->vcp_device->ops || !priv->vcp_device->ipi_ops) {
+		mmdvfs_err(mmdvfs->dev, "VCP object incomplete: dev=%p ops=%p ipi_ops=%p\n",
+			   priv->vcp_device->dev, priv->vcp_device->ops,
+			   priv->vcp_device->ipi_ops);
+		ret = -ENODEV;
+		goto put_vcp;
+	}
+	if (!priv->vcp_device->ops->get_mem_phys ||
+	    !priv->vcp_device->ops->get_mem_iova ||
+	    !priv->vcp_device->ops->get_mem_virt ||
+	    !priv->vcp_device->ipi_ops->ipi_send) {
+		mmdvfs_err(mmdvfs->dev,
+			   "VCP callbacks missing: get_phys=%p get_iova=%p get_virt=%p ipi_send=%p\n",
+			   priv->vcp_device->ops->get_mem_phys,
+			   priv->vcp_device->ops->get_mem_iova,
+			   priv->vcp_device->ops->get_mem_virt,
+			   priv->vcp_device->ipi_ops->ipi_send);
+		ret = -ENODEV;
+		goto put_vcp;
+	}
+
+	ret = of_property_read_u32(mmdvfs->dev->of_node, "mediatek,vcp-ipi-id", &ipi_id);
+	if (ret)
+		priv->vcp_ipi_id = IPI_OUT_MMDVFS_VCP;
+	else
+		priv->vcp_ipi_id = ipi_id;
+
+	priv->mmup_enable = of_property_read_bool(mmdvfs->dev->of_node,
+						  "mediatek,mmup-enable");
+
+	/* Set priv early so enable_impl can access it */
+	ret = mmdvfs_up_set_priv(mmdvfs, MMDVFS_UP_VCP, priv);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to set VCP priv: %d\n", ret);
+		goto put_vcp;
+	}
+
+	ret = mmdvfs_vcp_enable_impl(mmdvfs, true, VCP_PWR_USR_MMDVFS_INIT);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev, "Failed to enable VCP power: %d\n", ret);
+		goto put_vcp;
+	}
+	retry = 0;
+	while (!mmdvfs_vcp_is_ready(priv, priv->vcp_feature_id)) {
+		if (++retry > VCP_SYNC_TIMEOUT_MS) {
+			mmdvfs_err(mmdvfs->dev, "VCP not ready after %d ms\n",
+				   VCP_SYNC_TIMEOUT_MS);
+			ret = -ETIMEDOUT;
+			goto disable_vcp_power;
+		}
+		mdelay(1);
+	}
+	mmdvfs_info(mmdvfs->dev, "VCP ready after %d ms\n", retry);
+
+	retry = 0;
+	while (!(vcp_ipi_dev = mmdvfs_vcp_get_ipidev(priv))) {
+		if (++retry > VCP_IPIDEV_RETRY_MAX) {
+			mmdvfs_err(mmdvfs->dev,
+				   "Cannot get VCP IPI device after %d retries\n",
+				   VCP_IPIDEV_RETRY_MAX);
+			ret = -ETIMEDOUT;
+			goto disable_vcp_power;
+		}
+		ssleep(1);
+	}
+
+	priv->vcp_iova = priv->vcp_device->ops->get_mem_iova(priv->vcp_device,
+							      MMDVFS_VCP_MEM_ID);
+	priv->vcp_pa = priv->vcp_device->ops->get_mem_phys(priv->vcp_device,
+							 MMDVFS_VCP_MEM_ID);
+	priv->vcp_va = priv->vcp_device->ops->get_mem_virt(priv->vcp_device,
+							    MMDVFS_VCP_MEM_ID);
+	if (!priv->vcp_va) {
+		mmdvfs_err(mmdvfs->dev, "VCP shared memory VA is NULL\n");
+		ret = -ENOMEM;
+		goto disable_vcp_power;
+	}
+
+	if (priv->mmup_enable) {
+		retry = 0;
+		while (!mmdvfs_vcp_is_ready(priv, priv->mmup_feature_id)) {
+			if (++retry > VCP_SYNC_TIMEOUT_MS) {
+				mmdvfs_err(mmdvfs->dev,
+					   "MMUP not ready after %d ms\n",
+					   VCP_SYNC_TIMEOUT_MS);
+				ret = -ETIMEDOUT;
+				goto disable_vcp_power;
+			}
+			mdelay(1);
+		}
+
+		/* Get MMUP IPI device through feature ID */
+		retry = 0;
+		while (!(vcp_ipi_dev = mmdvfs_vcp_get_ipidev(priv))) {
+			if (++retry > VCP_IPIDEV_RETRY_MAX) {
+				mmdvfs_err(mmdvfs->dev,
+					   "Cannot get MMUP IPI device after %d retries\n",
+					   VCP_IPIDEV_RETRY_MAX);
+				ret = -ETIMEDOUT;
+				goto disable_vcp_power;
+			}
+			ssleep(1);
+		}
+
+		priv->mmup_iova = priv->vcp_device->ops->get_mem_iova(priv->vcp_device,
+								      MMDVFS_MMUP_MEM_ID);
+		priv->mmup_pa = priv->vcp_device->ops->get_mem_phys(priv->vcp_device,
+							  MMDVFS_MMUP_MEM_ID);
+		priv->mmup_va = priv->vcp_device->ops->get_mem_virt(priv->vcp_device,
+								    MMDVFS_MMUP_MEM_ID);
+		if (!priv->mmup_va) {
+			mmdvfs_err(mmdvfs->dev, "MMUP shared memory VA is NULL\n");
+			ret = -ENOMEM;
+			goto disable_vcp_power;
+		}
+
+		ret = of_property_read_u32(mmdvfs->dev->of_node,
+					   "mediatek,mmup-ipi-id", &ipi_id);
+		if (ret)
+			priv->mmup_ipi_id = IPI_OUT_MMDVFS_MMUP;
+		else
+			priv->mmup_ipi_id = ipi_id;
+
+		mmup_node = of_find_compatible_node(NULL, NULL, "mediatek,mmup-core");
+		if (mmup_node) {
+			priv->mmup_pdev = of_find_device_by_node(mmup_node);
+			of_node_put(mmup_node);
+		}
+	}
+	/* Parse MMUP SRAM if enabled */
+	priv->mmup_sram_enable = of_property_read_bool(mmdvfs->dev->of_node,
+						       "mediatek,mmup-sram");
+
+	/* Initialize shared memory registers */
+	{
+		void __iomem *mem_base = priv->mmup_enable ? priv->mmup_va : priv->vcp_va;
+		int i;
+
+		if (!mem_base) {
+			mmdvfs_err(mmdvfs->dev,
+				   "shared memory base is NULL before default init (mmup_enable=%d)\n",
+				   priv->mmup_enable);
+			ret = -ENOMEM;
+			goto disable_vcp_power;
+		}
+
+		/* Keep firmware-owned control slots inactive unless firmware changes them. */
+		for (i = 0; i < MEM_FW_RSVD_OPP_PWR_COUNT; i++) {
+			writel(MAX_OPP, mem_base + MEM_FW_RSVD_OPP_PWR(i));
+			writel(MAX_OPP, mem_base + MEM_VOTE_OPP_PWR(i));
+			writel(MAX_OPP, mem_base + MEM_PWR_OPP(i));
+			writel(MAX_OPP, mem_base + MEM_PWR_CUR_GEAR(i));
+			writel(MAX_OPP, mem_base + MEM_FW_RSVD_VOL(i));
+		}
+		for (i = 0; i < MEM_VOTE_OPP_USR_COUNT; i++) {
+			writel(MAX_OPP, mem_base + MEM_VOTE_OPP_USR(i));
+			writel(MAX_OPP, mem_base + MEM_MUX_OPP(i));
+			writel(MAX_OPP, mem_base + MEM_MUX_MIN(i));
+			writel(MAX_OPP, mem_base + MEM_FW_RSVD_CLK(i));
+		}
+		for (i = 0; i < 32; i++)
+			writel(MAX_OPP, mem_base + MEM_USR_OPP(i));
+	}
+
+	/*
+	 * CRITICAL: Set initialized flag BEFORE registering notifiers!
+	 *
+	 * The notifier callbacks (especially MMUP_EVENT_READY) may fire immediately
+	 * upon registration, and they need to send IPI (FUNC_MMDVFS_INIT).
+	 * If initialized is false, send_ipi_impl() will return -ENODEV and the
+	 * IPI won't be sent, causing VCP to never receive the shared memory address.
+	 */
+	priv->initialized = true;
+
+	/* Register notifiers */
+	priv->mmup_notifier.notifier_call = mmdvfs_mmup_notifier_callback;
+	mmdvfs_vcp_register_notify(priv,
+				   priv->mmup_enable ? priv->mmup_feature_id :
+				   priv->vcp_feature_id,
+				   &priv->mmup_notifier);
+
+	return 0;
+
+disable_vcp_power:
+	mmdvfs_vcp_enable_impl(mmdvfs, false, VCP_PWR_USR_MMDVFS_INIT);
+put_vcp:
+	if (priv->vcp_pdev)
+		platform_device_put(priv->vcp_pdev);
+	if (priv->mmup_pdev)
+		platform_device_put(priv->mmup_pdev);
+	if (priv->vcp_device && priv->vcp_device->dev)
+		vcp_put(priv->vcp_device);
+	/* Clear priv on error */
+	mmdvfs_up_set_priv(mmdvfs, MMDVFS_UP_VCP, NULL);
+	return ret;
+}
+
+/*
+ * mmdvfs_vcp_deinit_impl - Deinitialize VCP abstraction
+ * @mmdvfs: MMDVFS device structure
+ */
+static void mmdvfs_vcp_deinit_impl(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (!priv)
+		return;
+
+	if (!priv->initialized) {
+		mmdvfs_up_set_priv(mmdvfs, MMDVFS_UP_VCP, NULL);
+		return;
+	}
+
+	mmdvfs_vcp_unregister_notify(priv,
+				     priv->mmup_enable ? priv->mmup_feature_id :
+				     priv->vcp_feature_id,
+				     &priv->mmup_notifier);
+
+	if (priv->pwr_usage[VCP_PWR_USR_MMDVFS_INIT])
+		mmdvfs_vcp_enable_impl(mmdvfs, false, VCP_PWR_USR_MMDVFS_INIT);
+
+	if (priv->vcp_pdev)
+		platform_device_put(priv->vcp_pdev);
+	if (priv->mmup_pdev)
+		platform_device_put(priv->mmup_pdev);
+	if (priv->vcp_device && priv->vcp_device->dev)
+		vcp_put(priv->vcp_device);
+
+	priv->initialized = false;
+	mmdvfs_up_set_priv(mmdvfs, MMDVFS_UP_VCP, NULL);
+}
+
+/*
+ * mmdvfs_vcp_lock_cb_mutex - Lock VCP callback mutex
+ * @mmdvfs: MMDVFS device
+ */
+void mmdvfs_vcp_lock_cb_mutex(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (priv)
+		mutex_lock(&priv->cb_mutex);
+}
+
+/*
+ * mmdvfs_vcp_unlock_cb_mutex - Unlock VCP callback mutex
+ * @mmdvfs: MMDVFS device
+ */
+void mmdvfs_vcp_unlock_cb_mutex(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (priv)
+		mutex_unlock(&priv->cb_mutex);
+}
+
+/*
+ * mmdvfs_vcp_get_cb_ready_impl - Get VCP callback ready state
+ * @mmdvfs: MMDVFS device
+ *
+ * Note: This function does not acquire cb_mutex. The caller should hold
+ * the mutex if synchronization is required.
+ */
+static bool mmdvfs_vcp_get_cb_ready_impl(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv = mmdvfs_vcp_priv(mmdvfs);
+
+	if (!priv)
+		return false;
+
+	return READ_ONCE(priv->cb_ready);
+}
+
+/*
+ * mmdvfs_vcp_get_power_info - Get VCP power management info for debug
+ * @mmdvfs: MMDVFS device
+ * @power: Output power refcount
+ * @pwr_usage: Output power usage array (must be VCP_PWR_USR_NUM size)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int mmdvfs_vcp_get_power_info(struct mmdvfs_device *mmdvfs, int *power, int *pwr_usage)
+{
+	struct mmdvfs_vcp_priv *priv;
+	int i;
+
+	priv = mmdvfs_vcp_priv(mmdvfs);
+	if (!priv || !power || !pwr_usage)
+		return -EINVAL;
+
+	mutex_lock(&priv->pwr_mutex);
+	*power = priv->power;
+	for (i = 0; i < VCP_PWR_USR_NUM; i++)
+		pwr_usage[i] = priv->pwr_usage[i];
+	mutex_unlock(&priv->pwr_mutex);
+
+	return 0;
+}
+
+/*
+ * mmdvfs_vcp_get_mmup_enable - Get MMUP enable status
+ * @mmdvfs: MMDVFS device
+ *
+ * Return: true if MMUP is enabled, false otherwise
+ */
+bool mmdvfs_vcp_get_mmup_enable(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv;
+
+	priv = mmdvfs_vcp_priv(mmdvfs);
+	if (!priv)
+		return false;
+
+	return priv->mmup_enable;
+}
+
+/*
+ * mmdvfs_vcp_get_mmup_sram_enable - Get MMUP SRAM enable status
+ * @mmdvfs: MMDVFS device
+ *
+ * Return: true if MMUP SRAM is enabled, false otherwise
+ */
+bool mmdvfs_vcp_get_mmup_sram_enable(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_vcp_priv *priv;
+
+	priv = mmdvfs_vcp_priv(mmdvfs);
+	if (!priv)
+		return false;
+
+	return priv->mmup_sram_enable;
+}
+
+/*
+ * mmdvfs_vcp_ops - VCP UP operations
+ */
+const struct mmdvfs_up_ops mmdvfs_vcp_ops = {
+	.init = mmdvfs_vcp_init_impl,
+	.deinit = mmdvfs_vcp_deinit_impl,
+	.send_ipi = mmdvfs_vcp_send_ipi_impl,
+	.enable = mmdvfs_vcp_enable_impl,
+	.get_base = mmdvfs_vcp_get_base_impl,
+	.get_sram = mmdvfs_vcp_get_sram_impl,
+	.get_cb_ready = mmdvfs_vcp_get_cb_ready_impl,
+};
+
+MODULE_DESCRIPTION("MediaTek MMDVFS VCP Abstraction Layer");
+MODULE_AUTHOR("MediaTek Inc.");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/mediatek/mmdvfs.h b/include/soc/mediatek/mmdvfs.h
index 459f1adcab34..79ecdc3dbf21 100644
--- a/include/soc/mediatek/mmdvfs.h
+++ b/include/soc/mediatek/mmdvfs.h
@@ -18,54 +18,72 @@ enum mmdvfs_version_type {
 };
 
 enum {
-	CCU_PWR_USR_MMDVFS,
-	CCU_PWR_USR_IMG,
-	CCU_PWR_USR_NUM
+	VCP_PWR_USR_MMDVFS_INIT,
+	VCP_PWR_USR_MMDVFS_RESERVED1,
+	VCP_PWR_USR_MMDVFS_RESERVED2,
+	VCP_PWR_USR_MMDVFS_VOTE,
+	VCP_PWR_USR_MMDVFS_CCU,
+	VCP_PWR_USR_MMDVFS_RST,
+	VCP_PWR_USR_MMQOS,
+	VCP_PWR_USR_CAM,
+	VCP_PWR_USR_IMG,
+	VCP_PWR_USR_PDA,
+	VCP_PWR_USR_SENIF,
+	VCP_PWR_USR_VDEC,
+	VCP_PWR_USR_VFMT,
+	VCP_PWR_USR_SMI,
+	VCP_PWR_USR_DISP,
+	VCP_PWR_USR_MDP,
+	VCP_PWR_USR_MML,
+	VCP_PWR_USR_VENC,
+	VCP_PWR_USR_JPEGDEC,
+	VCP_PWR_USR_JPEGENC,
+	VCP_PWR_USR_NUM
 };
 
-#if IS_ENABLED(CONFIG_MTK_MMDVFS) && IS_ENABLED(CONFIG_MTK_VCP_RPROC)
-int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx);
-int mtk_mmdvfs_camera_notify(const bool enable);
-int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable);
-int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable);
-int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh);
-int mmdvfs_set_lp_mode(bool lp_mode);
+#if IS_REACHABLE(CONFIG_MTK_MMDVFS)
+int mtk_mmdvfs_enable_vcp(const bool enable, const u8 idx);
 u32 mmdvfs_get_version(void);
+void *mmdvfs_get_mmup_base(phys_addr_t *pa);
+void *mmdvfs_get_vcp_base(phys_addr_t *pa);
+bool mmdvfs_get_mmup_sram_enable(void);
+void __iomem *mmdvfs_get_mmup_sram(void);
+bool mmdvfs_get_mmup_enable(void);
 #else
 
-static inline int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx)
+static inline int mtk_mmdvfs_enable_vcp(const bool enable, const u8 idx)
 {
-	return -EOPNOTSUPP;
+	return -ENODEV;
 }
 
-static inline int mtk_mmdvfs_camera_notify(const bool enable)
+static inline u32 mmdvfs_get_version(void)
 {
-	return 0;
+	return MMDVFS_VERSION_NONE;
 }
 
-static inline int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable)
+static inline void *mmdvfs_get_mmup_base(phys_addr_t *pa)
 {
-	return 0;
+	return NULL;
 }
 
-static inline int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable)
+static inline void *mmdvfs_get_vcp_base(phys_addr_t *pa)
 {
-	return 0;
+	return NULL;
 }
 
-static inline int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh)
+static inline bool mmdvfs_get_mmup_sram_enable(void)
 {
-	return 0;
+	return false;
 }
 
-static inline int mmdvfs_set_lp_mode(bool lp_mode)
+static inline void __iomem *mmdvfs_get_mmup_sram(void)
 {
-	return -EOPNOTSUPP;
+	return NULL;
 }
 
-static inline u32 mmdvfs_get_version(void)
+static inline bool mmdvfs_get_mmup_enable(void)
 {
-	return MMDVFS_VERSION_NONE;
+	return false;
 }
 #endif
 
-- 
2.45.2

