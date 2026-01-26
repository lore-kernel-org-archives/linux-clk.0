Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89122425B
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448470; cv=none; b=mdeR68V63Hbw2Hxn+cuRyeLeKJ2UNt6/uV1xiXlH+JNodP9KeYlH7HWJG9re1eP5ILJUXjisCYckKbSHxe2vlTDE28HDdb2Lumh8VVJzfE/tk7CpeblMOBAYLq9LXYNH8pRkTM1vNqPep+UKWBdQ6v4JpBbwDfHxfjzGwk3SgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448470; c=relaxed/simple;
	bh=dOEYj7t+ROZE70/t5JBRLwcCxZxx7EFqOb+F6NO3PTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/hnAv26EH6/9yGewmSSyhgI+K6MaExHHB48gk+Vnzagn2KrPhy0NvhlJwWqcryh5Pq1vvgIPXkpp2BQYQj6nUCP/vuVFPUkPt0cbqnYaWM0C/+tLvM9C12xiqSaDmZ+Vnl8N5yevC9gICKuF8EmKm2+XXQZjA7U5DVGg68j/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hwiRZddl; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hwiRZddl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QW15wej0KN5IymeFTOlPb9RaM1GUJzvNo08gLCSxudc=; b=hwiRZddlKwex25XWwlqPkacPLI
	pYjO2oPzjPM9coNL3fcwLwBoDyVnW+g8r80Yr0FSUzIQFG39yGqbptSzt9KjD0ZoosSRKAevstPB6
	pVk2v6vlydPKl4+I0nPXF8nJFilX/5lyQ+Hd/J3AYZFS5sZ2ufyZlH/hbxQ1j1xcyH71BlLDPVHOQ
	QzW56XZiMOosKKwm06KZMJOfjFna/d99UUqQ3PYbuvid+NOD4jwOYyL9AZY5+cbMYizlA6fwlYSEB
	9ddvJ1iOLSpBIoe6bzl0//5WZGBVNrQ+2LImVsSYWIHS2ofdTauLYUo+KqlaLGVkI1bNJanIpwYnv
	Ped6IADA==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQNE-00A8mi-8B; Mon, 26 Jan 2026 18:27:36 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:42 -0300
Subject: [PATCH v4 6/6] drm/v3d: Introduce Runtime Power Management
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-6-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15594; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=dOEYj7t+ROZE70/t5JBRLwcCxZxx7EFqOb+F6NO3PTg=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6Pf5k912zSax0eZsJWAQaSUv5cVx/rCtz1PU
 ib3l8RAh02JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3wAKCRA/8w6Kdoj6
 qqVVB/9IGN6x93azEM5CA/XqkPPr2iW5CJKXXsK0CTRCzdvoGV4aF9n39b9qDuiqDrreR/9Mhok
 uj1dwZ70mEgCO3QRqchAo/4ccWSXXE5wdOapE9Gx1cpsDzwCBMAXCKWTF/2/1kynwSPIOm7coR3
 FU3mCkZJYAq5yWxuYUy7cpW82on2oikDUQuHVqDyjZ8e6y0gdVVU5IE+THq632nAcpjRU9TBaro
 w2XjmPYOKGX4QLatdPgcNaKX6XxpQpoPGyaP8aROccvb7LHJJmExQUP8Kmw88ee23660PEt4gja
 C4foZTnGr7WoCzK8MJzfDt0IC73b/LJfvSbJ9cFNP1pR7nv9
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Commit 90a64adb0876 ("drm/v3d: Get rid of pm code") removed the last
bits of power management code that V3D had, which were actually never
hooked. Therefore, currently, the GPU clock is enabled during probe
and only disabled when removing the driver.

Implement proper power management using the kernel's Runtime PM
framework.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/Makefile      |  3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c | 23 +++++++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 87 +++++++++++++++++------------------
 drivers/gpu/drm/v3d/v3d_drv.h     | 20 ++++++++
 drivers/gpu/drm/v3d/v3d_gem.c     |  7 +++
 drivers/gpu/drm/v3d/v3d_mmu.c     | 12 ++++-
 drivers/gpu/drm/v3d/v3d_power.c   | 96 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  | 19 ++++++--
 8 files changed, 212 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
index b7d673f1153bef16db3800e50b2bfaf36bf8871b..9cb1fd4e4091dbb56e6a73e2b8a51fa0d242698b 100644
--- a/drivers/gpu/drm/v3d/Makefile
+++ b/drivers/gpu/drm/v3d/Makefile
@@ -13,7 +13,8 @@ v3d-y := \
 	v3d_trace_points.o \
 	v3d_sched.o \
 	v3d_sysfs.o \
-	v3d_submit.o
+	v3d_submit.o \
+	v3d_power.o
 
 v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
 
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 89f24eec62a74ec49b28f0b22dbf626ba7a35206..634cc796ba2324dc497694c070f2cfffcc4424c9 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -97,7 +97,11 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	int i, core;
+	int i, core, ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(v3d_hub_reg_defs); i++) {
 		const struct v3d_reg_def *def = &v3d_hub_reg_defs[i];
@@ -139,6 +143,8 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 		}
 	}
 
+	v3d_pm_runtime_put(v3d);
+
 	return 0;
 }
 
@@ -148,7 +154,11 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 ident0, ident1, ident2, ident3, cores;
-	int core;
+	int core, ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return ret;
 
 	ident0 = V3D_READ(V3D_HUB_IDENT0);
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
@@ -207,6 +217,8 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 		}
 	}
 
+	v3d_pm_runtime_put(v3d);
+
 	return 0;
 }
 
@@ -234,6 +246,11 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	uint32_t cycles;
 	int core = 0;
 	int measure_ms = 1000;
+	int ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return ret;
 
 	if (v3d->ver >= V3D_GEN_41) {
 		int cycle_count_reg = V3D_PCTR_CYCLE_COUNT(v3d->ver);
@@ -253,6 +270,8 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	msleep(measure_ms);
 	cycles = V3D_CORE_READ(core, V3D_PCTR_0_PCTR0);
 
+	v3d_pm_runtime_put(v3d);
+
 	seq_printf(m, "cycles: %d (%d.%d Mhz)\n",
 		   cycles,
 		   cycles / (measure_ms * 1000),
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 592ef610d6a4bb7dfe64acf6f7283c947e9d2921..07a7de54de9432a970c9165bebed51f6984fe43d 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -59,6 +59,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		[DRM_V3D_PARAM_V3D_CORE0_IDENT1] = V3D_CTL_IDENT1,
 		[DRM_V3D_PARAM_V3D_CORE0_IDENT2] = V3D_CTL_IDENT2,
 	};
+	int ret;
 
 	if (args->pad != 0)
 		return -EINVAL;
@@ -75,12 +76,19 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		if (args->value != 0)
 			return -EINVAL;
 
+		ret = v3d_pm_runtime_get(v3d);
+		if (ret)
+			return ret;
+
 		if (args->param >= DRM_V3D_PARAM_V3D_CORE0_IDENT0 &&
 		    args->param <= DRM_V3D_PARAM_V3D_CORE0_IDENT2) {
 			args->value = V3D_CORE_READ(0, offset);
 		} else {
 			args->value = V3D_READ(offset);
 		}
+
+		v3d_pm_runtime_put(v3d);
+
 		return 0;
 	}
 
@@ -287,36 +295,6 @@ static const struct of_device_id v3d_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, v3d_of_match);
 
-static void
-v3d_idle_sms(struct v3d_dev *v3d)
-{
-	if (v3d->ver < V3D_GEN_71)
-		return;
-
-	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
-
-	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
-				    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
-		drm_err(&v3d->drm, "Failed to power up SMS\n");
-	}
-
-	v3d_reset_sms(v3d);
-}
-
-static void
-v3d_power_off_sms(struct v3d_dev *v3d)
-{
-	if (v3d->ver < V3D_GEN_71)
-		return;
-
-	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
-
-	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
-				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
-		drm_err(&v3d->drm, "Failed to power off SMS\n");
-	}
-}
-
 static int
 map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
 {
@@ -383,6 +361,9 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (IS_ERR(v3d->clk))
 		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
 
+	if (v3d->clk)
+		v3d->max_clk_rate = clk_round_rate(v3d->clk, ULONG_MAX);
+
 	ret = v3d_irq_init(v3d);
 	if (ret)
 		return ret;
@@ -400,19 +381,26 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto dma_free;
 
-	ret = clk_prepare_enable(v3d->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
 		goto gem_destroy;
-	}
 
-	v3d_idle_sms(v3d);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto gem_destroy;
+
+	/* If PM is disabled, we need to call v3d_power_resume() manually. */
+	if (!IS_ENABLED(CONFIG_PM)) {
+		ret = v3d_power_resume(dev);
+		if (ret)
+			goto gem_destroy;
+	}
 
 	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
 	mask = DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
 	ret = dma_set_mask_and_coherent(dev, mask);
 	if (ret)
-		goto clk_disable;
+		goto runtime_pm_put;
 
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
@@ -433,26 +421,27 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
 
 	v3d_init_hw_state(v3d);
-	v3d_mmu_set_page_table(v3d);
-	v3d_irq_enable(v3d);
+
+	pm_runtime_set_autosuspend_delay(dev, 50);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		goto irq_disable;
+		goto runtime_pm_put;
 
 	ret = v3d_sysfs_init(dev);
 	if (ret)
 		goto drm_unregister;
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 drm_unregister:
 	drm_dev_unregister(drm);
-irq_disable:
-	v3d_irq_disable(v3d);
-clk_disable:
-	v3d_power_off_sms(v3d);
-	clk_disable_unprepare(v3d->clk);
+runtime_pm_put:
+	pm_runtime_put_sync_suspend(dev);
 gem_destroy:
 	v3d_gem_destroy(drm);
 dma_free:
@@ -470,21 +459,27 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 
-	v3d_power_off_sms(v3d);
+	pm_runtime_suspend(dev);
 
-	clk_disable_unprepare(v3d->clk);
+	/* If PM is disabled, we need to call v3d_power_suspend() manually. */
+	if (!IS_ENABLED(CONFIG_PM))
+		v3d_power_suspend(dev);
 
 	v3d_gem_destroy(drm);
 
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(v3d_pm_ops, v3d_power_suspend,
+				 v3d_power_resume, NULL);
+
 static struct platform_driver v3d_platform_driver = {
 	.probe		= v3d_platform_drm_probe,
 	.remove		= v3d_platform_drm_remove,
 	.driver		= {
 		.name	= "v3d",
 		.of_match_table = v3d_of_match,
+		.pm = pm_ptr(&v3d_pm_ops),
 	},
 };
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 785d2e7e97fc579b0b85f4ff255b5e73c25aad4f..eb6056b5a320de3556edc90f8026bb61fa6a31d0 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -3,6 +3,7 @@
 
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/spinlock_types.h>
 #include <linux/workqueue.h>
 
@@ -134,6 +135,8 @@ struct v3d_dev {
 	void __iomem *gca_regs;
 	void __iomem *sms_regs;
 	struct clk *clk;
+	unsigned long max_clk_rate;
+
 	struct reset_control *reset;
 
 	/* Virtual and DMA addresses of the single shared page table. */
@@ -324,6 +327,8 @@ struct v3d_job {
 
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
+
+	bool has_pm_ref;
 };
 
 struct v3d_bin_job {
@@ -597,6 +602,21 @@ int v3d_mmu_set_page_table(struct v3d_dev *v3d);
 void v3d_mmu_insert_ptes(struct v3d_bo *bo);
 void v3d_mmu_remove_ptes(struct v3d_bo *bo);
 
+/* v3d_power.c */
+int v3d_power_suspend(struct device *dev);
+int v3d_power_resume(struct device *dev);
+
+static __always_inline int v3d_pm_runtime_get(struct v3d_dev *v3d)
+{
+	return pm_runtime_resume_and_get(v3d->drm.dev);
+}
+
+static __always_inline int v3d_pm_runtime_put(struct v3d_dev *v3d)
+{
+	pm_runtime_mark_last_busy(v3d->drm.dev);
+	return pm_runtime_put_autosuspend(v3d->drm.dev);
+}
+
 /* v3d_sched.c */
 void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *query_info,
 				   unsigned int count);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index dd4ac899a489fb7341815592114cc4f1652f35e8..17f50e145d4b7b206b729bfe34b93d00a7fa80e6 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -118,6 +118,11 @@ void
 v3d_reset(struct v3d_dev *v3d)
 {
 	struct drm_device *dev = &v3d->drm;
+	int ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return;
 
 	drm_err(dev, "Resetting GPU for hang.\n");
 	drm_err(dev, "V3D_ERR_STAT: 0x%08x\n", V3D_CORE_READ(0, V3D_ERR_STAT));
@@ -140,6 +145,8 @@ v3d_reset(struct v3d_dev *v3d)
 	v3d_perfmon_stop(v3d, v3d->active_perfmon, false);
 
 	trace_v3d_reset_end(dev);
+
+	v3d_pm_runtime_put(v3d);
 }
 
 static void
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index c513a393c0313772650fd6d7236127b2dc4101d9..d43cc9ab1da3fdccb991dbded33d2f069d346114 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -39,7 +39,13 @@ static bool v3d_mmu_is_aligned(u32 page, u32 page_address, size_t alignment)
 
 int v3d_mmu_flush_all(struct v3d_dev *v3d)
 {
-	int ret;
+	int ret = 0;
+
+	pm_runtime_get_noresume(v3d->drm.dev);
+
+	/* Flush the PTs only if we're already awake */
+	if (!pm_runtime_active(v3d->drm.dev))
+		goto pm_put;
 
 	V3D_WRITE(V3D_MMUC_CONTROL, V3D_MMUC_CONTROL_FLUSH |
 		  V3D_MMUC_CONTROL_ENABLE);
@@ -48,7 +54,7 @@ int v3d_mmu_flush_all(struct v3d_dev *v3d)
 			 V3D_MMUC_CONTROL_FLUSHING), 100);
 	if (ret) {
 		dev_err(v3d->drm.dev, "MMUC flush wait idle failed\n");
-		return ret;
+		goto pm_put;
 	}
 
 	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
@@ -59,6 +65,8 @@ int v3d_mmu_flush_all(struct v3d_dev *v3d)
 	if (ret)
 		dev_err(v3d->drm.dev, "MMU TLB clear wait idle failed\n");
 
+pm_put:
+	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_power.c b/drivers/gpu/drm/v3d/v3d_power.c
new file mode 100644
index 0000000000000000000000000000000000000000..285f56acf544bbfd3d9848253e788a138aacf2af
--- /dev/null
+++ b/drivers/gpu/drm/v3d/v3d_power.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (C) 2026 Raspberry Pi */
+
+#include <linux/clk.h>
+#include <linux/reset.h>
+
+#include <drm/drm_print.h>
+
+#include "v3d_drv.h"
+#include "v3d_regs.h"
+
+static void
+v3d_resume_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
+
+	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
+				    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
+		drm_err(&v3d->drm, "Failed to power up SMS\n");
+	}
+
+	v3d_reset_sms(v3d);
+}
+
+static void
+v3d_suspend_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
+
+	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
+				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
+		drm_err(&v3d->drm, "Failed to power off SMS\n");
+	}
+}
+
+int v3d_power_suspend(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+
+	v3d_irq_disable(v3d);
+	v3d_suspend_sms(v3d);
+
+	if (v3d->reset)
+		reset_control_assert(v3d->reset);
+
+	/* Some firmware versions might not actually power off the clock
+	 * when we set the clock state to off. Therefore, set the clock
+	 * rate to 0 to ensure it is running in the minimum rate.
+	 */
+	if (v3d->clk)
+		clk_set_rate(v3d->clk, 0);
+
+	clk_disable_unprepare(v3d->clk);
+
+	return 0;
+}
+
+int v3d_power_resume(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct v3d_dev *v3d = to_v3d_dev(drm);
+	int ret;
+
+	ret = clk_prepare_enable(v3d->clk);
+	if (ret)
+		return ret;
+
+	/* Set the clock to the maximum rate and let the firmware decide
+	 * if we can actually keep it.
+	 */
+	if (v3d->clk)
+		clk_set_rate(v3d->clk, v3d->max_clk_rate);
+
+	if (v3d->reset) {
+		ret = reset_control_deassert(v3d->reset);
+		if (ret)
+			goto clk_disable;
+	}
+
+	v3d_resume_sms(v3d);
+	v3d_mmu_set_page_table(v3d);
+	v3d_irq_enable(v3d);
+
+	return 0;
+
+clk_disable:
+	clk_disable_unprepare(v3d->clk);
+	return ret;
+}
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 794c3571662de7eb566bf4c0561571d7618dd234..fea7573505cd0d2b84d21efda88ed4da657d18d4 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -103,6 +103,9 @@ v3d_job_free(struct kref *ref)
 	if (job->perfmon)
 		v3d_perfmon_put(job->perfmon);
 
+	if (job->has_pm_ref)
+		v3d_pm_runtime_put(job->v3d);
+
 	kfree(job);
 }
 
@@ -184,13 +187,13 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 				if (copy_from_user(&in, handle++, sizeof(in))) {
 					ret = -EFAULT;
 					drm_dbg(&v3d->drm, "Failed to copy wait dep handle.\n");
-					goto fail_deps;
+					goto fail_job_init;
 				}
 				ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in.handle, 0);
 
 				// TODO: Investigate why this was filtered out for the IOCTL.
 				if (ret && ret != -ENOENT)
-					goto fail_deps;
+					goto fail_job_init;
 			}
 		}
 	} else {
@@ -198,14 +201,22 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 		// TODO: Investigate why this was filtered out for the IOCTL.
 		if (ret && ret != -ENOENT)
-			goto fail_deps;
+			goto fail_job_init;
+	}
+
+	/* CPU jobs don't require hardware resources */
+	if (queue != V3D_CPU) {
+		ret = v3d_pm_runtime_get(v3d);
+		if (ret)
+			goto fail_job_init;
+		job->has_pm_ref = true;
 	}
 
 	kref_init(&job->refcount);
 
 	return 0;
 
-fail_deps:
+fail_job_init:
 	drm_sched_job_cleanup(&job->base);
 	return ret;
 }

-- 
2.52.0

