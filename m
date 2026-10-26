Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051127;
	b=IpdVMUkFqnmik/fkEem8swyvKN/soJbuMm9SAkERaZpBDbn2LXyOQMeEunI5FSt/xIBF
	 a+zFVsSZi1qoiSNf8v+6KO2WFh/lFyssciTeDalXHj9pehAERzNZF7xZQEDb3arEQjNsc
	 7vWzBqJ2VhUCOEtj5lxqw3jLC+eRWE2+V96+oLq28/iqxnaAgFId5hw0YOYmKcuf84uD/
	 o4sC6oXORz9newmSrhX86FJZXC4I6hAL4O/2BP3bFVBA/XTptJAnSE2KXHWEUHvOtlPg7
	 oAa+nX/kbEOEG7KYoXdeU7++aQ40CzfBtzWI3gmSKgDuQmzmnlM9zSXRyf6mXQsloSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=96DAPDw/OZHMhUvzLYZwg2aWSPIONvY3JYIRbVZTsFI=;
	b=q7WP8XjHRsk4+mUvguclM/pN1WSipqn9lb1VL7KU5lmjVRPlnEID558kq02vOIo6yfix
	 it9895C3fLCAQSp5y/ok9amJQhcBL85yoq1XL//QMTCnVP+oPYASDebYjrfEUv9bExD6r
	 fqPwZmpwPQ+PwwLv3ZQe4MwRIebP3i6fE19RuZdUpsitcbobo6Ev6Je/kSMaOX8GIvqvt
	 BopTznbFPqY9K9Ai0c4+1HWiTML8ZTIOG2LFLNkjnMwGsL65PY/Z/kDyNLxuITtay8lve
	 HlpzRFGObFZtZEjvkdiHWL/VOreDyrRQSS20pTqL2KDcF/ZhZKaK8XoIyKz2VpbFTrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XUq11erg;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91860A2604
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 21:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C91860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XUq11erg
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5666879eec.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 14:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051121; x=1793655921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96DAPDw/OZHMhUvzLYZwg2aWSPIONvY3JYIRbVZTsFI=;
        b=XUq11erg4cI5mlq6/mAUwNjOhDqP33ZstYfg4yBJ4hZ4r+opaMVVN9ieG1ynGHoYNw
         KXHr8ICFY9Dcmgk7czN5YNqWpMW9xev7eBl6f/Q43w090oA0S8eSq5U9Mi2S3Kxyely8
         D6zgXl8AswSQ1doGLaKSlzeJ4VinRnkttdyb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051121; x=1793655921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96DAPDw/OZHMhUvzLYZwg2aWSPIONvY3JYIRbVZTsFI=;
        b=Ho85bBgoq1PSgQXFUuBOLXd7I7GNHWwbJ7DZ//zCDj6/kUMt8vXXdksAKUhF23q1pR
         VflR0GnVRYd0ydr8nK+tCcvps8aASI6WUufvl9p+aVfQDFyuz0T7q9vqg6e1rGqTzq+X
         YBpPDZPivcsKn7o5k8ZiSbbQ4RXniKhsCw45tOf1dH+97ySz3KHM6h3nkdKiweoSr9Vi
         P9LRwMaMN3z5b1KK9t6JfNsjiBBRakUDuJgyPy9QgjtedYu+wkuWZ/dTB+jggNaPkyvM
         QsFKg7E3GShBSzJbRp4fehy2uF+ip+/nnYBKPRolIiRln3Wi4cVPAY6vLAbWdUOf79oa
         3rTw==
X-Forwarded-Encrypted: i=1; AKwUvBx7/dyjCuu6IPOSaMQ9kOVcufDwXS5c6Y6+ac+MXqqLlvobfm1KLn0JV6oStibBNPozlLm06yXje8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQE5Ze09TrdJozrw1RQeWJyOuP3sOcPW8JaMvjmrhDrtxxcMXT
	jvfEFOLkzLQMFeTJoXZg9cf6bmTC6Lwk5BHyJTtqBrez70FfbHNf777s2siVnrEpBQ==
X-Gm-Gg: AYBFou30vHjIdH33NLfO5d0wunXl2aylEMFNWpRhxr/x/ppTt9LGScGOZc9nF8bfP9Y
	qiecHHoLVW8sW/5T8IMkmWEaeFw9YgxnMRLuMgaXRBuiPax+NuGJsFGev6WX7vqMUkfXrj77g+X
	zCw/JaDvF8usRARxBYKljYJ0pyyhoj4aHoOTxV//6AJTL8klk+6ay9RlKZdu3y4o2pjYF8Q1X4i
	XRMkZ6wAxSEE2dUwYemlK1FqXh7TrLWcT9vjgxqsLn5OrqJrTTHPPDEiDkC+CBGYaM59nBUU0v8
	gpwzXxMr0HoX2g4rRTcSlMPJ70ixGkiJNMTj7BwFNVKzobc0lMjykhUSsOJvqnYFr8JdJDJWu9/
	lxRUeQzTOHRg9XtrqFLnfOpXzN8wHlHykL5HCZcJz42Kt8emYjcBMZrE6xcT99xkRlvJYnQqZOV
	yIrLWL/fz+7UTZp1CLdM21M8irw6+mpQ0oR/p3f3XBYgE29oWC5E3Bun5p4EVsx7fvSNk0GIwoU
	fct5HijrUDRZ51JVqDSIs0IK26UfxwWUEYefoHweo/uMKzvzK4iQ6lXqWAtEsAhiSSINpDHkxeh
	xkgbMX3N8gO+fc5IAyHdFwjMPHPlWgPm6a3crg6BJyllp4tTUikq4Ki03KRaWDuCSw5g6g==
X-Received: by 2002:a05:693c:60cd:b0:366:9fc2:ab70 with SMTP id 5a478bee46e88-369e8480e67mr13726269eec.14.1793051120583;
        Mon, 26 Oct 2026 14:45:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-369ef6a71a4sm27029715eec.8.2026.10.26.14.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:19 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 6/9] reset: google: Add CPM reset driver
Date: Mon, 26 Oct 2026 14:43:44 -0700
Message-ID: <20261026144346.6.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
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

Google Tensor SoCs (used on Pixel phones) manage many resources
(including resets) using a Central Power Manager (CPM) co-processor. We
communicate with CPM using mailboxes, abstracted in the
cpm_request_client(), etc., API.

For posterity, I list a summary of changes made relative to the
downstream Pixel driver:

* Switch to auxiliary bus, as a child of a CPM device

* Use devm more heavily

* Avoid representing each reset as its own Device Tree node. Use a
  limited per-SoC table to describe any additional per-SoC details
  instead.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/reset/Kconfig            |   1 +
 drivers/reset/Makefile           |   1 +
 drivers/reset/google/Kconfig     |  11 +
 drivers/reset/google/Makefile    |   2 +
 drivers/reset/google/reset-cpm.c | 367 +++++++++++++++++++++++++++++++
 5 files changed, 382 insertions(+)
 create mode 100644 drivers/reset/google/Kconfig
 create mode 100644 drivers/reset/google/Makefile
 create mode 100644 drivers/reset/google/reset-cpm.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..37dbddcd620f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -451,6 +451,7 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/google/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..9754c274766c 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
 obj-y += amlogic/
+obj-y += google/
 obj-y += hisilicon/
 obj-y += spacemit/
 obj-y += starfive/
diff --git a/drivers/reset/google/Kconfig b/drivers/reset/google/Kconfig
new file mode 100644
index 000000000000..38431b4f9001
--- /dev/null
+++ b/drivers/reset/google/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_CPM
+	tristate "Google CPM Reset Controller"
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	depends on GOOGLE_CPM_MBA
+	help
+	  Driver support for reset controllers found on Google Tensor SoCs,
+	  operating over the CPM mailbox interface. This allows peripheral
+	  drivers to assert and deassert resets on LPCM hardware blocks.
+
+	  If unsure, say N.
diff --git a/drivers/reset/google/Makefile b/drivers/reset/google/Makefile
new file mode 100644
index 000000000000..437c19459464
--- /dev/null
+++ b/drivers/reset/google/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_CPM) += reset-cpm.o
diff --git a/drivers/reset/google/reset-cpm.c b/drivers/reset/google/reset-cpm.c
new file mode 100644
index 000000000000..5f144f1ad5f2
--- /dev/null
+++ b/drivers/reset/google/reset-cpm.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device driver to control Google SoC LPCM resets via CPM.
+ * Copyright 2023-2026 Google LLC
+ */
+
+#include <dt-bindings/soc/google,lga-lpcm.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset-controller.h>
+#include <soc/google/goog_cpm_service_ids.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define MAILBOX_SEND_TIMEOUT_MS		3000
+#define LPCM_CMD_SET_RST		0x4
+
+#define OP_ID_BITFIELD			GENMASK(31, 24)
+#define RST_ID_BITFIELD			GENMASK(23, 16)
+#define LPCM_ID_BITFIELD		GENMASK(15, 8)
+#define REQ_ID_BITFIELD			GENMASK(7, 0)
+
+#define ASSERT_OP_ID			0
+#define DEASSERT_OP_ID			1
+
+#define NO_ERROR			0
+#define ERR_LPCM_NOT_SUPPORTED		(-24)
+#define ERR_LPCM_INVALID_ARGS		(-8)
+#define ERR_LPCM_TIMED_OUT		(-13)
+#define ERR_LPCM_GENERIC		(-1)
+
+#define CPM_RST_LPCM_ID_MASK		GENMASK(31, 16)
+#define CPM_RST_ID_MASK			GENMASK(15, 0)
+
+static inline unsigned long to_rstc_idx(u32 lpcm_id, u32 rst_id)
+{
+	return FIELD_PREP(CPM_RST_LPCM_ID_MASK, lpcm_id) |
+	       FIELD_PREP(CPM_RST_ID_MASK, rst_id);
+}
+
+static inline u32 lpcm_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_LPCM_ID_MASK, idx);
+}
+
+static inline u32 rst_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_ID_MASK, idx);
+}
+
+struct cpm_reset_data {
+	u32 lpcm_id;
+	u32 nr_resets;
+	const char *name;
+};
+
+struct cpm_reset_soc_data {
+	const struct cpm_reset_data *resets;
+	size_t num_resets;
+};
+
+struct goog_cpm_rst_provider {
+	struct device *dev;
+	struct reset_controller_dev rcdev;
+	struct cpm_client *cpm_client;
+	struct dentry *debugfs_root;
+	struct goog_cpm_rst_debugfs_entry *dbg_entries;
+	const struct cpm_reset_soc_data *soc_data;
+};
+
+#define to_provider(rc) container_of(rc, struct goog_cpm_rst_provider, rcdev)
+
+struct goog_cpm_rst_debugfs_entry {
+	struct goog_cpm_rst_provider *provider;
+	u32 lpcm_id;
+};
+
+static int goog_cpm_rst_mba_check_ret(struct device *dev, int ret)
+{
+	switch (ret) {
+	case NO_ERROR:
+		return 0;
+	case ERR_LPCM_NOT_SUPPORTED:
+		dev_err(dev, "the received request_id is invalid\n");
+		return -EPROTO;
+	case ERR_LPCM_INVALID_ARGS:
+		dev_err(dev, "invalid lpcm_id or rst_id\n");
+		return -EINVAL;
+	case ERR_LPCM_TIMED_OUT:
+		dev_err(dev, "operation timed out\n");
+		return -ETIMEDOUT;
+	case ERR_LPCM_GENERIC:
+		dev_err(dev, "internal error occurred\n");
+		return -EREMOTEIO;
+	default:
+		dev_err(dev, "unknown error response from CPM\n");
+		return -EPROTO;
+	}
+}
+
+static int goog_cpm_rst_mba_resp_hdl(struct device *dev, const struct cpm_request *cpm_req)
+{
+	int dst = cpm_req->dst_id;
+	int ret = cpm_req->resp_msg->payload[0];
+
+	dev_dbg(dev, "got resp from %u, data %d.\n", dst, ret);
+
+	return goog_cpm_rst_mba_check_ret(dev, ret);
+}
+
+static int goog_cpm_rst_send_mba_mail(struct goog_cpm_rst_provider *provider,
+				      u32 lpcm_id, unsigned long rst_id, int op_id)
+{
+	struct device *dev = provider->dev;
+	struct cpm_payload resp_msg;
+	struct cpm_payload req_msg = {};
+	struct cpm_request cpm_req = {
+		.msg_type = REQUEST_MSG,
+		.req_msg = &req_msg,
+		.resp_msg = &resp_msg,
+		.dst_id = CPM_COMMON_LPCM_SERVICE,
+		.tout_ms = MAILBOX_SEND_TIMEOUT_MS,
+	};
+	int ret;
+
+	req_msg.payload[0] = FIELD_PREP(REQ_ID_BITFIELD, LPCM_CMD_SET_RST) |
+			     FIELD_PREP(LPCM_ID_BITFIELD, lpcm_id) |
+			     FIELD_PREP(RST_ID_BITFIELD, rst_id) |
+			     FIELD_PREP(OP_ID_BITFIELD, op_id);
+
+	dev_dbg(dev, "lpcm_id %d, rst_id %lu: send mba mail: [%u, %u, %u]\n",
+		lpcm_id, rst_id, req_msg.payload[0], req_msg.payload[1],
+		req_msg.payload[2]);
+
+	ret = cpm_send_message(provider->cpm_client, &cpm_req);
+	if (ret < 0) {
+		dev_err(dev,
+			"lpcm_id %d, rst_id %lu: failed to send request to CPM, ret=%d\n",
+			lpcm_id, rst_id, ret);
+		return ret;
+	}
+
+	return goog_cpm_rst_mba_resp_hdl(dev, &cpm_req);
+}
+
+static int goog_cpm_rst_assert(struct reset_controller_dev *rcdev,
+			       unsigned long idx)
+{
+	struct goog_cpm_rst_provider *provider = to_provider(rcdev);
+	u32 lpcm_id = lpcm_from_idx(idx);
+	u32 rst_id = rst_from_idx(idx);
+
+	dev_dbg(rcdev->dev, "assert reset id=%u of lpcm %u\n", rst_id, lpcm_id);
+	return goog_cpm_rst_send_mba_mail(provider, lpcm_id, rst_id, ASSERT_OP_ID);
+}
+
+static int goog_cpm_rst_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long idx)
+{
+	struct goog_cpm_rst_provider *provider = to_provider(rcdev);
+	u32 lpcm_id = lpcm_from_idx(idx);
+	u32 rst_id = rst_from_idx(idx);
+
+	dev_dbg(rcdev->dev, "deassert reset id=%u of lpcm %u\n", rst_id, lpcm_id);
+	return goog_cpm_rst_send_mba_mail(provider, lpcm_id, rst_id, DEASSERT_OP_ID);
+}
+
+static const struct reset_control_ops goog_cpm_rst_ops = {
+	.assert = goog_cpm_rst_assert,
+	.deassert = goog_cpm_rst_deassert,
+};
+
+static int goog_cpm_rst_debugfs_assert_set(void *data, u64 rst_id)
+{
+	struct goog_cpm_rst_debugfs_entry *entry = data;
+	unsigned long idx = to_rstc_idx(entry->lpcm_id, rst_id);
+
+	return goog_cpm_rst_assert(&entry->provider->rcdev, idx);
+}
+
+static int goog_cpm_rst_debugfs_deassert_set(void *data, u64 rst_id)
+{
+	struct goog_cpm_rst_debugfs_entry *entry = data;
+	unsigned long idx = to_rstc_idx(entry->lpcm_id, rst_id);
+
+	return goog_cpm_rst_deassert(&entry->provider->rcdev, idx);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_assert_debugfs_fops, NULL,
+			 goog_cpm_rst_debugfs_assert_set, "%llu\n");
+
+DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_deassert_debugfs_fops, NULL,
+			 goog_cpm_rst_debugfs_deassert_set, "%llu\n");
+
+static void goog_cpm_rst_add_debugfs(struct goog_cpm_rst_debugfs_entry *entry,
+				     struct dentry *debugfs_root,
+				     const char *name)
+{
+	struct dentry *d = debugfs_create_dir(name, debugfs_root);
+
+	debugfs_create_file("assert", 0220, d, entry,
+			    &goog_cpm_rst_assert_debugfs_fops);
+	debugfs_create_file("deassert", 0220, d, entry,
+			    &goog_cpm_rst_deassert_debugfs_fops);
+}
+
+static int goog_cpm_rst_get_nr_resets(const struct cpm_reset_soc_data *soc_data, u32 lpcm_id)
+{
+	int i;
+
+	for (i = 0; i < soc_data->num_resets; i++)
+		if (soc_data->resets[i].lpcm_id == lpcm_id)
+			return soc_data->resets[i].nr_resets;
+
+	return -EINVAL;
+}
+
+static int goog_cpm_rst_of_xlate(struct reset_controller_dev *rcdev,
+				 const struct of_phandle_args *reset_spec)
+{
+	struct goog_cpm_rst_provider *provider = to_provider(rcdev);
+	u32 lpcm_id, rst_id;
+	int max_resets;
+
+	if (reset_spec->args_count != 2)
+		return -EINVAL;
+
+	lpcm_id = reset_spec->args[0];
+	rst_id = reset_spec->args[1];
+
+	max_resets = goog_cpm_rst_get_nr_resets(provider->soc_data, lpcm_id);
+	if (max_resets < 0)
+		return max_resets;
+
+	if (rst_id >= max_resets)
+		return -EINVAL;
+
+	return to_rstc_idx(lpcm_id, rst_id);
+}
+
+static const struct cpm_reset_data cpm_resets_lga_entries[] = {
+	{
+		.lpcm_id = LGA_LPCM_HSIO_N,
+		.nr_resets = 16,
+		.name = "hsio-n",
+	},
+	{
+		.lpcm_id = LGA_LPCM_HSIO_S,
+		.nr_resets = 5,
+		.name = "hsio-s",
+	},
+	{
+		.lpcm_id = LGA_LPCM_LSIO_S,
+		.nr_resets = 45,
+		.name = "lsio-s",
+	},
+	{
+		.lpcm_id = LGA_LPCM_LSIO_N,
+		.nr_resets = 43,
+		.name = "lsio-n",
+	},
+	{
+		.lpcm_id = LGA_LPCM_LSIO_E,
+		.nr_resets = 50,
+		.name = "lsio-e",
+	},
+};
+
+static const struct cpm_reset_soc_data cpm_resets_lga = {
+	.resets = cpm_resets_lga_entries,
+	.num_resets = ARRAY_SIZE(cpm_resets_lga_entries),
+};
+
+static const struct of_device_id cpm_rst_of_match[] = {
+	{ .compatible = "google,lga-cpm", .data = &cpm_resets_lga },
+	{ /* sentinel */ }
+};
+
+static int goog_cpm_rst_probe(struct auxiliary_device *auxdev,
+			      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &auxdev->dev;
+	struct goog_cpm_rst_provider *provider;
+	const struct of_device_id *match;
+	int i, ret;
+
+	match = of_match_node(cpm_rst_of_match, dev->of_node);
+	if (!match) {
+		dev_err(dev, "no matching SoC data found\n");
+		return -ENODEV;
+	}
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->dev = dev;
+	provider->soc_data = match->data;
+
+	provider->cpm_client = devm_cpm_request_client(dev, 0, NULL, NULL);
+	if (IS_ERR(provider->cpm_client))
+		return dev_err_probe(dev, PTR_ERR(provider->cpm_client),
+				     "Failed to request cpm client\n");
+	auxiliary_set_drvdata(auxdev, provider);
+
+	provider->rcdev.dev = dev;
+	provider->rcdev.owner = THIS_MODULE;
+	provider->rcdev.of_node = dev->of_node;
+	provider->rcdev.ops = &goog_cpm_rst_ops;
+	provider->rcdev.of_reset_n_cells = 2;
+	provider->rcdev.of_xlate = goog_cpm_rst_of_xlate;
+
+	ret = devm_reset_controller_register(dev, &provider->rcdev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register reset controller: %d\n", ret);
+		return ret;
+	}
+
+	provider->debugfs_root = debugfs_create_dir(dev_name(dev), NULL);
+	if (!IS_ERR(provider->debugfs_root)) {
+		provider->dbg_entries = devm_kcalloc(dev, provider->soc_data->num_resets,
+						     sizeof(*provider->dbg_entries), GFP_KERNEL);
+		if (!provider->dbg_entries) {
+			debugfs_remove_recursive(provider->debugfs_root);
+			return -ENOMEM;
+		}
+
+		for (i = 0; i < provider->soc_data->num_resets; i++) {
+			provider->dbg_entries[i].provider = provider;
+			provider->dbg_entries[i].lpcm_id = provider->soc_data->resets[i].lpcm_id;
+			goog_cpm_rst_add_debugfs(&provider->dbg_entries[i],
+						 provider->debugfs_root,
+						 provider->soc_data->resets[i].name);
+		}
+	}
+
+	return 0;
+}
+
+static void goog_cpm_rst_remove(struct auxiliary_device *auxdev)
+{
+	struct goog_cpm_rst_provider *provider = auxiliary_get_drvdata(auxdev);
+
+	debugfs_remove_recursive(provider->debugfs_root);
+}
+
+static const struct auxiliary_device_id goog_cpm_rst_id_table[] = {
+	{ .name = "google_cpm_mba.reset" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, goog_cpm_rst_id_table);
+
+static struct auxiliary_driver goog_cpm_rst_driver = {
+	.probe = goog_cpm_rst_probe,
+	.remove = goog_cpm_rst_remove,
+	.name = "google-reset-cpm",
+	.id_table = goog_cpm_rst_id_table,
+};
+
+module_auxiliary_driver(goog_cpm_rst_driver);
+
+MODULE_DESCRIPTION("Google CPM Reset Driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0.307.g5fe7bd680c-goog

