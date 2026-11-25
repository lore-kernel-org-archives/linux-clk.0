Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565198;
	b=C7swl4To9TAexIUXnNpfZCdFvCjfgs8j8N1vZcjWhGlt/aseaSWhcPr/5lre45ycJ9ax
	 cRpo4E6iLhWz1y542SMhvjV3LyMnACPzZgkuz9d9NtWEmZWgMcM+d7LZx2vhutzsslK1g
	 K5yBNyUkHdkUZRokWx3YNDH2sB3Vo1ySTci/yG1ZVLPzp2KwOA0chNC/PYzAn+ZTo7UlR
	 F3WL92LEzT7dAAVLpiZk1hCFirxSa2WDEi2ddfcllAPUGoPxUvGbe723GUdhqAH1Cswvb
	 98Iw8fmJe1rrskeTHG9orDDFwgdzpGxNutuWosPAyrLifAVyZ6cIpkqOo8/BDVDbHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
	b=qkHwsEsdQujukf5UcaDv4qlj2Qv3CRaUdUMtwj9GRtMorBm/hl5WFg0zaeZUc4iZHazL
	 KG4nZzSfTXf6LwWPKbrFfnch21m8NfrJ96rqALtIj8glvP7Oznw4PwI5YXQP1w4goY3bo
	 mpnpNaRvtNUWM1x2OJCpglqO0Kd+ER6zsHTMg8ACKx+wMryv3EUYtUW2ikwHLJiH6jmcX
	 3GeonE0vq3C5lHF6uMHTFtvK4RRPmE2TOkyNlGe62RfuwVpLy4WWsCog7tWziz9fozehB
	 6WI9dhDS2QbGlwU1E8rAvYT+prVp4jlIS4gMlNHRra0mNF8qRiIQLZsfSbIcvIJm8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n2jKNA0L;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E5606A33F
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 00:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658E5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n2jKNA0L
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386b8f2f671so2345106eec.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 16:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565197; x=1796169997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
        b=n2jKNA0LMK+zT+dalkZ1doQPshk0eWpap+l7BptAkzTZlOFW+l1tZWBysaKUHmyeA/
         X/Q3CY9UCkem+5ypiwUfhtIOACueHNsC7kPorjiWoOGu7zHd0rx1tadsfENhvfWvxOoS
         bxPV9RsPbeTYsA7lbHBxZj3mU1VdqN7+anKeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565197; x=1796169997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
        b=UKBL2FU4uHz8rl1CDIahTQ17f14JTMOCRNObRbMZgstC+PCDehjgtY0bQ8rnYaQCg/
         4CucOIBMG3Y5IcjltJPj9jfEtMMxIIs5DYSdhv0+iM9sKRlioyDhT/VA8VXgUAa/m8q0
         Qzb/NhALyqf3uSV1XolLY88TSPVWRi0UjhpjH4gRdkYRqxcthKqFWNP2prtyL1b1SuHx
         AWxpwqW2+RQOM795LThFcBSIqYZaM3aqRH/AgzqPAxJ9xgLlSZ83kkg9PQrHZULBjvYI
         UJevbFd+VWFTIQZ6t0sVAyo6qFzC01iYnGMMhDAP2r1YKXMR3ZTZsKUJbq2z7cVI2Zcf
         ncbw==
X-Forwarded-Encrypted: i=1; AL+hErEpvvNnc8/Q+1yZ6vM/wubhnYRXlNJh/dwOApI3QJXLhSGnQAwCcGzSkJE/5M5tqJa75hCusiE3grQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VoZA0b2YhXSYFJvzwyyjCOLUNMG8xSkTeEkNCBhHwd9rPC1a+
	iUVHVbb3r+7KXymGDJVzDA9f5uenCBMv0IqVnyHHtiA8vwIzMQeTVzPUA8igRI5F8A==
X-Gm-Gg: AZFdTZfd16dtK18DQnrX839i70DoVneaLWzeGstJ9DmFJ9EqUPm5Cr0lmNO11aZbpdW
	VrAMWDZzTb2MnAEiGgtcI2yT9ueyznibAtGxxG0wqxdSh6zNqDM49Kt6fEGsnaedD9jG6xe/Lfp
	ZS1BnvJWShXf0xFTiUaKwwYc4quMxBmqlBk80ELuGorryEC3/Yn3tgdrSsDxGidK9I92qhKygOa
	0peLZ6bxhfOsENHEcijm4AQ9vQUPG1PB3WXloeAp16xCz0xFWKZ59X1palLhZVYVHP3Xwc2yPBi
	uVa7k5w8XL/s1eyFMth+Ec6cTQZfZP0eObQjJyOTT0uCA6mQmWobID+q5WGlX6UAn5DZ4PQfgFX
	zTiiiaeivYnTIDgL2xBM7EyZ9daEe64RZryM+aIlYlJmybS6VQhy0nscmooyvx/8Mmv2f8QBggE
	lilnosJmrlZ5Xp/u4J2WI6eyOMoeAJNqH4fb11gN4F9COYgheB7UL9H+GolmFbIx42JN3eR2feP
	B8nt8IsQVGGQw6RiT2aB9MqrMG7w+L3RerJnBxB1W6gWQca8xUiOXhv8JJrR48uvmw8EHwbrLy2
	zLnMKds/mzqcozXT4od6uPyTzdobSp6Sdc1WgdyaZmYMJG+ERqEPclEkIpW5MpUGNalO
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr6043229eec.34.1795565197480;
        Tue, 24 Nov 2026 16:06:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385666e99fdsm60034542eec.5.2026.11.24.16.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:36 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 6/9] irqchip/google-cpm: Add CPM IRQ driver
Date: Tue, 24 Nov 2026 16:03:40 -0800
Message-ID: <20261124160343.v2.6.I41e14e9460b3add41e69dac97abf57a741e9c4c5@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jim Wylder <jwylder@google.com>

The Central Power Manager (CPM) on Google Tensor SoCs can signal
events/interrupts over its mailbox communication protocol. Today, the
downstream driver for these chips only supports interrupt notification,
although the CPM firmware may also have mask/unmask support (not
currently used) that could be added later if needed.

In practice, this driver is used for RTC alarms and for events driven by
the Always-on Compute (AoC) subsystem.

Signed-off-by: Jim Wylder <jwylder@google.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Formatting requests from v1 review
 * Adapt to devm_cpm_register_rx_callback()
 * Update author/SoB to retain downstream heritage

 drivers/irqchip/Kconfig          |  10 +++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-google-cpm.c | 131 +++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 drivers/irqchip/irq-google-cpm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8aee8f731848..ceaad2ab04f6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -556,6 +556,16 @@ config CSKY_APB_INTC
 	  by C-SKY single core SOC system. It uses mmio map apb-bus to visit
 	  the controller's register.
 
+config GOOGLE_CPM_IRQ
+	tristate "Google Tensor CPM interrupt controller"
+	depends on GOOGLE_CPM_MBA
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	select IRQ_DOMAIN
+	help
+	  Support for the Central Power Manager (CPM) interrupt controller
+	  found on Google Tensor SoCs. This controller routes interrupts from
+	  the CPM to the Application Processor.
+
 config IMX_IRQSTEER
 	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e..ac6352d3b797 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
 obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
+obj-$(CONFIG_GOOGLE_CPM_IRQ)		+= irq-google-cpm.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
diff --git a/drivers/irqchip/irq-google-cpm.c b/drivers/irqchip/irq-google-cpm.c
new file mode 100644
index 000000000000..ce960b48f271
--- /dev/null
+++ b/drivers/irqchip/irq-google-cpm.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google CPM IRQ chip driver
+ *
+ * Copyright 2023-2026 Google LLC
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include <soc/google/cpm-service-ids.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define CPM_IRQ_COUNT				512
+
+struct cpm_irq_info {
+	struct device		*dev;
+	struct irq_domain	*domain;
+};
+
+static void cpm_irq_process_irq_status(struct cpm_irq_info *info, u32 irq_number)
+{
+	int ret = generic_handle_domain_irq_safe(info->domain, irq_number);
+
+	if (ret)
+		dev_err(info->dev, "Error handling IRQ %u, error code %d\n", irq_number, ret);
+}
+
+static void cpm_irq_rx_callback(const struct cpm_payload *msg, void *priv)
+{
+	struct cpm_irq_info *info = priv;
+	u32 irq_number = msg->payload[0];
+
+	cpm_irq_process_irq_status(info, irq_number);
+}
+
+static void cpm_irq_domain_remove_action(void *data)
+{
+	struct irq_domain *domain = data;
+	unsigned int hwirq;
+
+	for (hwirq = 0; hwirq < CPM_IRQ_COUNT; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(domain, hwirq));
+
+	irq_domain_remove(domain);
+}
+
+static int cpm_irq_domain_map(struct irq_domain *d, unsigned int virq,
+			      irq_hw_number_t hwirq)
+{
+	struct cpm_irq_info *info = d->host_data;
+
+	if (hwirq >= CPM_IRQ_COUNT)
+		return -EINVAL;
+
+	irq_set_chip_data(virq, info);
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+
+	dev_dbg(info->dev, "Mapped hwirq %lu to virq %u\n", hwirq, virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops cpm_irq_domain_ops = {
+	.map	= cpm_irq_domain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static int cpm_irq_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct cpm_irq_info *info;
+	struct cpm_handle *cpm;
+	int ret;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+	auxiliary_set_drvdata(adev, info);
+
+	info->domain = irq_domain_create_tree(dev_fwnode(dev), &cpm_irq_domain_ops, info);
+	if (!info->domain) {
+		dev_err(dev, "Unable to add irq domain\n");
+		return -ENODEV;
+	}
+
+	ret = devm_add_action_or_reset(dev, cpm_irq_domain_remove_action, info->domain);
+	if (ret) {
+		dev_err(dev, "Failed to add irq domain removal action\n");
+		return ret;
+	}
+
+	cpm = devm_cpm_get_handle(dev);
+	if (IS_ERR(cpm))
+		return dev_err_probe(dev, PTR_ERR(cpm), "Failed to get CPM handle\n");
+
+	ret = devm_cpm_register_rx_callback(dev, cpm, CPM_AP_NS_IRQ_SERVICE,
+					    cpm_irq_rx_callback, info);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register CPM RX callback\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_irq_id_table[] = {
+	{ .name = "google_cpm_mba.irq" },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_irq_id_table);
+
+static struct auxiliary_driver cpm_irq_driver = {
+	.name		= "cpm-irq-chip",
+	.probe		= cpm_irq_probe,
+	.id_table	= cpm_irq_id_table,
+};
+module_auxiliary_driver(cpm_irq_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jim Wylder <jwylder@google.com>");
+MODULE_DESCRIPTION("Google CPM IRQ chip driver");
-- 
2.56.1.831.g720f3f5937-goog

