Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586496;
	b=GrmX+2/DuEW7azxndFSp1Jcz+ubdR+oZtmBJpS6J97aLRjXOvtUrjwntvNpLGLn0I+B2
	 yOmNOXnb1ZGtNvj3L1AOwIIycBKWx8eD8kFBoULGheV85G3Vu5f87nnVz1OhxzkANSZWT
	 4eXxlly3VkRijKYiiulXw5dhuNG++qQTr6CmoJ3Pvdvk1aCZSyneDNpXr5luhx1Zsnq/W
	 Cy1rxvfVAJlk+O/Lrggdk+kGUMMCUoWaNZs6zZ2UcnMyTNvj23CCMTr6+Y3QBDJPerhGF
	 dLkTr/TvvmFLLeSvxVs0JY0RNXPQX+nCfVqp7+v2wcokljT3MCdl1VdKxoU/S80lDzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586496;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=R9DdeCgVvQf1BTzKenSADVfDzktFGeM7OnwQ0+w2O48=;
	b=EN8SCer9zjJf0S0WXlPm/z5ZJwGWFME8QCSRL1fVzoJBoTAtTZ3C1jZ9mzOyCwRApnYC
	 QxJcNZi3TTIDbwDhAf2cKhb/gv5p8LsUeIfEg/5dXooY50Aq8zkbp+3mqXF2TGaGmpx3J
	 s7vP9qHa6g6hBq+0TjD125liwAENpqjvRvH6hg4Z/qdXs0vFv72r/EZHkgthjgopl2a2x
	 oGe+YPcN/Y4q7qBaDPpGaMFDwfyBkNoMO7oah47Q3Rx0uGKDnCv+AP4aMHimwjtsRPQFL
	 onCRYzRcpX4dYNQFrVfcUkPaR6NpIHyqi7tWpXOSygWuS/s6kHRv1ug/yfdLWiS0VPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FrrFA2jP;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64898606A321;
	Wed, 25 Nov 2026 06:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64898606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FrrFA2jP
X-UUID: a8b780eee89511f18dc8c9802ae25ab1-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=R9DdeCgVvQf1BTzKenSADVfDzktFGeM7OnwQ0+w2O48=;
	b=FrrFA2jPeu6ModyljulgCcg2bjiukAxo5rY8hSxK24EjCIA8hHifOYJNeO+9xpWlwHpXmzt0sMlLCVeDuQpA+xuZ9qktlilN9gKctZPNILeeTxQR/HXg+4/Tvrr+maGhkzr+c3FgcJxzXMvEsDGno9mO1LmCGPGfeZilB5R6aSU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ffb0a875-d218-42f8-baa8-ea4008ac14da,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:bf99081a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a8b780eee89511f18dc8c9802ae25ab1-20261125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1655431100; Wed, 25 Nov 2026 14:01:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:01:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:01:05 +0800
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
Subject: [PATCH 6/7] soc: mediatek: mmdvfs: add read-only status debug
Date: Wed, 25 Nov 2026 14:00:11 +0800
Message-ID: <20261125060037.649659-7-echo.zhang@mediatek.com>
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

Expose MMDVFS topology and software power references through a read-only
debugfs status file. Use seq_file so large topologies are not limited by
a PAGE_SIZE module parameter buffer. Firmware shared memory and SRAM
contents remain outside this diagnostic path.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 drivers/soc/mediatek/mmdvfs/Makefile       |   1 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c | 200 +++++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c

diff --git a/drivers/soc/mediatek/mmdvfs/Makefile b/drivers/soc/mediatek/mmdvfs/Makefile
index d02ebd63e6ae..3d780b29efe7 100644
--- a/drivers/soc/mediatek/mmdvfs/Makefile
+++ b/drivers/soc/mediatek/mmdvfs/Makefile
@@ -7,3 +7,4 @@ mtk-mmdvfs-y += mmdvfs-clk.o
 mtk-mmdvfs-y += mmdvfs-up.o
 mtk-mmdvfs-y += mmdvfs-vcp.o
 mtk-mmdvfs-$(CONFIG_MTK_MMDVFS_MT8196) += mmdvfs-mt8196.o
+mtk-mmdvfs-$(CONFIG_DEBUG_FS) += mmdvfs-debug.o
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c
new file mode 100644
index 000000000000..7d7324ff6577
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2026 MediaTek Inc. */
+
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <linux/seq_file.h>
+
+#include "mmdvfs-internal.h"
+
+static const char *mmdvfs_status_rc_name(u8 id)
+{
+	switch (id) {
+	case MMDVFS_PWR_VCORE:
+		return "VCORE";
+	case MMDVFS_PWR_VMM:
+		return "VMM";
+	case MMDVFS_PWR_VDISP:
+		return "VDISP";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const char *mmdvfs_status_power_user_name(int id)
+{
+	static const char *const names[VCP_PWR_USR_NUM] = {
+		[VCP_PWR_USR_MMDVFS_INIT] = "INIT",
+		[VCP_PWR_USR_MMDVFS_VOTE] = "VOTE",
+		[VCP_PWR_USR_MMDVFS_CCU] = "CCU",
+		[VCP_PWR_USR_MMDVFS_RST] = "RST",
+		[VCP_PWR_USR_MMQOS] = "MMQOS",
+		[VCP_PWR_USR_CAM] = "CAM",
+		[VCP_PWR_USR_IMG] = "IMG",
+		[VCP_PWR_USR_PDA] = "PDA",
+		[VCP_PWR_USR_SENIF] = "SENIF",
+		[VCP_PWR_USR_VDEC] = "VDEC",
+		[VCP_PWR_USR_VFMT] = "VFMT",
+		[VCP_PWR_USR_SMI] = "SMI",
+		[VCP_PWR_USR_DISP] = "DISP",
+		[VCP_PWR_USR_MDP] = "MDP",
+		[VCP_PWR_USR_MML] = "MML",
+		[VCP_PWR_USR_VENC] = "VENC",
+		[VCP_PWR_USR_JPEGDEC] = "JPEGDEC",
+		[VCP_PWR_USR_JPEGENC] = "JPEGENC",
+	};
+
+	return id >= 0 && (unsigned int)id < ARRAY_SIZE(names) && names[id] ?
+		       names[id] :
+		       "OTHER";
+}
+
+static int mmdvfs_status_show(struct seq_file *s, void *unused)
+{
+	struct mmdvfs_device *mmdvfs = s->private;
+	struct mmdvfs_data *data;
+	int pwr_usage[VCP_PWR_USR_NUM] = {};
+	int vcp_power = 0, active_power_users = 0, active_users = 0;
+	int ret, rc_idx, mux_idx, user_idx, i;
+
+	if (!mmdvfs || !mmdvfs->data) {
+		seq_puts(s, "ERROR: Device not ready\n");
+		return 0;
+	}
+
+	data = mmdvfs->data;
+	seq_puts(s, "=== MMDVFS Status ===\n\n");
+	seq_puts(s, "Version: ");
+	switch (data->version) {
+	case MMDVFS_VERSION_HWCCF_DVFS_VOTER:
+		seq_puts(s, "HWCCF DVFS Voter\n");
+		break;
+	case MMDVFS_VERSION_NONE:
+		seq_puts(s, "No hardware voter\n");
+		break;
+	default:
+		seq_printf(s, "Unknown (%u)\n", data->version);
+		break;
+	}
+	seq_printf(s, "Initialized: %s\n", data->init_done ? "yes" : "no");
+	seq_printf(s, "Total: %u RCs, %u MUXes, %u Users\n", data->rc_num,
+		   data->mux_num, data->user_num);
+
+	seq_puts(s, "\n--- Power Management ---\n");
+	ret = mmdvfs_vcp_get_power_info(mmdvfs, &vcp_power, pwr_usage);
+	if (ret)
+		seq_printf(s, "VCP Power Refcount: unavailable (%d)\n", ret);
+	else
+		seq_printf(s, "VCP Power Refcount: %d\n", vcp_power);
+	if (!ret) {
+		for (i = 0; i < VCP_PWR_USR_NUM; i++)
+			if (pwr_usage[i] > 0)
+				active_power_users++;
+		if (active_power_users) {
+			seq_printf(s, "VCP Power Users (%d active):\n",
+				   active_power_users);
+			for (i = 0; i < VCP_PWR_USR_NUM; i++) {
+				if (pwr_usage[i] > 0)
+					seq_printf(s, "  [%2d] %s: %d\n", i,
+						   mmdvfs_status_power_user_name(i),
+						   pwr_usage[i]);
+			}
+		}
+	}
+
+	seq_puts(s, "\n--- Active Users (level > 0) ---\n");
+	for (user_idx = 0; user_idx < data->user_num; user_idx++) {
+		struct mmdvfs_user *user = &data->user[user_idx];
+		struct mmdvfs_mux *mux;
+
+		if (user->level == 0 || user->level == 0xff ||
+		    user->mux >= data->mux_num)
+			continue;
+		mux = &data->mux[user->mux];
+		if (mux->rc >= data->rc_num)
+			continue;
+		seq_printf(s, "User[%2u] %-20s RC=%s MUX=%s lvl=%u\n", user->id,
+			   user->name ?: "(null)",
+			   mmdvfs_status_rc_name(data->rc[mux->rc].id),
+			   mux->name ?: "(null)", user->level);
+		active_users++;
+	}
+	if (!active_users)
+		seq_puts(s, "(No active users)\n");
+	else
+		seq_printf(s, "Total: %d active users\n", active_users);
+
+	seq_puts(s, "\n--- Resource Controllers ---\n");
+	for (rc_idx = 0; rc_idx < data->rc_num; rc_idx++) {
+		struct mmdvfs_rc *rc = &data->rc[rc_idx];
+		int mux_count = 0;
+		u8 freq_num = 0;
+
+		for (mux_idx = 0; mux_idx < data->mux_num; mux_idx++) {
+			struct mmdvfs_mux *mux = &data->mux[mux_idx];
+
+			if (mux->rc != rc_idx)
+				continue;
+			mux_count++;
+			if (!freq_num)
+				freq_num = mux->freq_num;
+		}
+		seq_printf(s, "RC[%u] %s (freq_num=%u, muxes=%u)\n", rc->id,
+			   mmdvfs_status_rc_name(rc->id), freq_num, mux_count);
+
+		for (mux_idx = 0; mux_idx < data->mux_num; mux_idx++) {
+			struct mmdvfs_mux *mux = &data->mux[mux_idx];
+			int user_count = 0;
+
+			if (mux->rc != rc_idx)
+				continue;
+			for (user_idx = 0; user_idx < data->user_num;
+			     user_idx++)
+				if (data->user[user_idx].mux == mux_idx)
+					user_count++;
+			seq_printf(s, "  +- MUX[%u] %s (users=%u)\n", mux->id,
+				   mux->name ?: "(null)", user_count);
+			for (user_idx = 0; user_idx < data->user_num;
+			     user_idx++) {
+				struct mmdvfs_user *user =
+					&data->user[user_idx];
+
+				if (user->mux != mux_idx)
+					continue;
+				seq_printf(s,
+					   "     |-- User[%2u] %s (level=%u)\n",
+					   user->id, user->name ?: "(null)",
+					   user->level);
+			}
+		}
+		seq_puts(s, "\n");
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(mmdvfs_status);
+
+void mmdvfs_debug_init(struct mmdvfs_device *mmdvfs)
+{
+	struct dentry *dir, *file;
+
+	dir = debugfs_create_dir("mtk_mmdvfs", NULL);
+	if (IS_ERR_OR_NULL(dir))
+		return;
+
+	file = debugfs_create_file("status", 0444, dir, mmdvfs,
+				   &mmdvfs_status_fops);
+	if (IS_ERR_OR_NULL(file)) {
+		debugfs_remove(dir);
+		return;
+	}
+
+	mmdvfs->debugfs_dir = dir;
+}
+
+void mmdvfs_debug_exit(struct mmdvfs_device *mmdvfs)
+{
+	debugfs_remove_recursive(mmdvfs->debugfs_dir);
+	mmdvfs->debugfs_dir = NULL;
+}
-- 
2.45.2

