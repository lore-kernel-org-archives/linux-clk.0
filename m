Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447703;
	b=PINzKAdV93x+zncFphwMmTUK2mELOjc2moN2gqfWGXb7GGNbueHasFcU1SAFeuKLhHsI
	 S7MUR8NACXfWnsjn4PtKFNaB0LJfKSKEaVtjx5qKMK7ZvszF3S8Xds6ed3j1ZCe7BPbPr
	 xGPY+gFuOHeNhOtQBv/Nh9X7r4g6MEdFJABlVW0nEoWssXrG/zmjp0B8X/oSvvq/3djPx
	 Zw9DyB6+UvztYEDLPz0AkryhAU0cxKUEFEKStCN73EUOe+uZRUyW4MZLr5e2bRfngcp4W
	 L5DV99Ecuaqwb36ZJzDqFcHOYwf4OHD7+ZfUc44IzQDIDNRNIC+jPNSzWo4GafvS7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=twbLVTTHolQaonGr5J0+v8N4dxHkk1jZUYRsd7SVbKM=;
	b=dKUtKHkeZXcMihBEo+6Bw5lkFurxDRJv4gNfzUuJi8NiIpELgCpGuXVUCdZYUzGjC8G7
	 FHP7/0OGx9SsBSNZQ18ItPTfpFdy8GMs0x2VklyWPrHJYx0eL5t7gHwDBKUhhnd0jmP0H
	 8beEzBgU2j+SUvuxXfsQBqNUr3ioIZ8LG3UCmlx2KERGbGHcV9m+b5gSK5LdRyzRZ+TF4
	 QRGh0tXL6IMSmMbSw2E21ILvPh9Y1dAtxvvlj0YmFkOQ5lk77hA1hA1bs7vIeGAKYuTef
	 897r8xJlYVqnmBam8OFi9WMlNYVfvEQsQ40MoxnVXFVoqAbBt/ynHmrwf1xmM9n8dmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEXcHtfQ;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F0606A332
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890F0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEXcHtfQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so4367936eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447702; x=1796052502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twbLVTTHolQaonGr5J0+v8N4dxHkk1jZUYRsd7SVbKM=;
        b=mEXcHtfQX1+mk10HSTDsxPceMNUVOgKN2oqAmreCP/XdFxmeKqE59s0BQsa+MVjKXu
         pZeyE1Ga8BcyI6eQ3H1bYm/Fj8GBWlMVXYVEiov68mrSHVgBkEIaF0LlEzCZMzWCUS0U
         gIBzcsZVbMCgAz5gCf5iP9j6mlMoFy3w0R0p/5jDMT4av6OibgixioVJ4D+Rp6U/YMX6
         tzhwsqHwn2j0gEzvJft8lNBmhzwyGiu0Ba/PGZORk1B8ftRR3Ye3iVYI+wLrjPdZXWDk
         mklywoPvYN1lLTypfmQwkb7pUOkI8Q4kfkMhd86gSLZXqs5LVBy2cKo2hEHiquYxLxCp
         v9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447702; x=1796052502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=twbLVTTHolQaonGr5J0+v8N4dxHkk1jZUYRsd7SVbKM=;
        b=GlOT+C3W/ibNlmMVEu791545kCxYCk3uDtLhAl9xXFe/UhHLGg6LTXi9RI4sCkX1pc
         odiEU9f71CiJVl32RNzt554tX7fRNeu4x5HiFfIneVa1vHQ1fo9/Us4L0pYOt5U/DAfx
         34R4CmCCycDwv2PNE5nJX2EGo8x1vR0ANWapWG3anON8OAqSowKshSfzXqijaKsNjiCv
         zZpMqe3TG5Q7w0ucZ93lLG/pQj86HAwIPBX5eCbFquldUqt1avPAeFOYCjRAZdjvB/pu
         RjRWapry/vF07/9aSaVwVWHDcKUTR0DV1KqpmfYiFRWzYt6pSglLZLUV2MVAdB+t6CfY
         iYuw==
X-Forwarded-Encrypted: i=1; AL+hErHcjxPPe4olIxkSZG6T3T1QHHyzbgPltMB0h+QLqeYMWebgGbFUhh+mp5MwTfZPXVotQ2KMRVHZCDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GEccHi2LMvjYV1pIPyj33FE0KcyV0ErV4AWuNA+5FkJ5k9tX1
	694iYBe5fdTqk9OYEHzXwl0rvgWgwW23QTC/e9akEw0wd5IzcLC7GM6a
X-Gm-Gg: AZFdTZcsSrD0fw6ZfH3ELuYId+BqSNG40DgU/4q9pTeg1jvpPMIKqJO7nIPc0DV3ym/
	eRLd/DZONVS2YfHdU1PU0rGhh7zGitn9QQHrs67c3+D1f/ngW4gC8WEeg5ETA7dAIaZ55oakwrr
	JkBRfAnkZoXLT/NcUz7vunboSV+Js9NX2baeT/FTl1n9w4BQicN20XMa9q7INDL3+hNT2wKZ36V
	v91jDkSGJq3sHe3e3ccHBBKFrULFZ3M5h5H1tCUidcuMv2zeEFhqaAn34tQA8TAfg7YRAIw1YhI
	TWACpptMFeFJwopoJdwiYjC8Sh40L1NtSNwJEDbLYJsOMh3R6TlUG1Hw+M28fl4VseCavVpcScQ
	ZSyyUK9MVZN40E9NjWyFlF2BAJ0tboA5I0sgf8CySoS7vmZkK2MlcoJYT+HRdbJ+G8FHMoPaIHf
	855gg9bgiMmvSFpPhFLAYJYuqHG791Bq9d2bNyG4GuC9hDrgXnWkgbAjoVB+wnHt0aDYNoFNFOt
	znHM8/5JDO5qDfsSrxg2Tk+xBQiO4kYw/ZXLed9A29whBaCwgan27ea2TaFcgDUZ5hRxZH1l0vV
	4yFkm/LeWFxG/pjQ2oVuRaj0nIcPLgAWj/6bvMuUgB/QYw==
X-Received: by 2002:a05:7301:6490:b0:386:9618:309c with SMTP id 5a478bee46e88-386961832eamr10447406eec.22.1795447701326;
        Mon, 23 Nov 2026 07:28:21 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:20 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 3/7] media: i2c: add s5k5e8 image sensor driver
Date: Mon, 23 Nov 2026 22:27:18 +0700
Message-ID: <20261123152722.168879-4-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add V4L2 subdev driver for the Samsung S5K5E8 1/5-inch 5-megapixel MIPI CSI-2 CMOS image sensor supporting 2592x1944 10-bit Bayer output.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/media/i2c/Kconfig  |  13 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/s5k5e8.c | 555 +++++++++++++++++++++++++++++++++++++
 3 files changed, 569 insertions(+)
 create mode 100644 drivers/media/i2c/s5k5e8.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 162b8ea02601..3ef98f32dae6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -879,6 +879,19 @@ config VIDEO_S5K3M5
 	  To compile this driver as a module, choose M here: the
 	  module will be called s5k3m5.
 
+config VIDEO_S5K5E8
+	tristate "Samsung S5K5E8 sensor support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor-level driver for the Samsung
+	  S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called s5k5e8.
+
 config VIDEO_S5K5BAF
 	tristate "Samsung S5K5BAF sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index a750942e9c62..bdcb8f34aca3 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
 obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
 obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
 obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
+obj-$(CONFIG_VIDEO_S5K5E8) += s5k5e8.o
 obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
 obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
 obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
new file mode 100644
index 000000000000..b4f0783593e9
--- /dev/null
+++ b/drivers/media/i2c/s5k5e8.c
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define S5K5E8_CHIP_ID_REG		0x0000
+#define S5K5E8_CHIP_ID			0x5e80
+#define S5K5E8_REG_MODE_SELECT		0x0100
+#define S5K5E8_MODE_STANDBY		0x00
+#define S5K5E8_MODE_STREAMING		0x01
+#define S5K5E8_REG_VTS			0x0340
+#define S5K5E8_REG_EXPOSURE		0x0202
+#define S5K5E8_REG_ANALOG_GAIN		0x0204
+#define S5K5E8_REG_TEST_PATTERN		0x0600
+#define S5K5E8_XVCLK_FREQ		24000000
+#define S5K5E8_LINK_FREQ_418MHZ		418000000ULL
+#define S5K5E8_PIXEL_RATE		167200000ULL
+
+struct s5k5e8_reg { u16 address;
+u8 val;
+};
+struct s5k5e8_mode {
+	u32 width, height, hts_def, vts_def, vts_min, num_regs;
+	const struct s5k5e8_reg *regs;
+};
+
+static const char * const s5k5e8_supply_names[] = { "avdd", "dvdd", "dovdd" };
+#define S5K5E8_NUM_SUPPLIES ARRAY_SIZE(s5k5e8_supply_names)
+
+static const struct s5k5e8_reg s5k5e8_common_regs[] = {
+	{ 0x0100, 0x00 }, { 0x3906, 0x7e }, { 0x3c01, 0x0f }, { 0x3c14, 0x00 },
+	{ 0x3235, 0x08 }, { 0x3063, 0x2e }, { 0x307a, 0x10 }, { 0x307b, 0x0e },
+	{ 0x3079, 0x20 }, { 0x3070, 0x05 }, { 0x3067, 0x06 }, { 0x3071, 0x62 },
+	{ 0x3072, 0x16 }, { 0x3203, 0x43 }, { 0x3205, 0x43 }, { 0x320b, 0x42 },
+	{ 0x3007, 0x00 }, { 0x3008, 0x14 }, { 0x3020, 0x58 }, { 0x300d, 0x34 },
+	{ 0x300e, 0x17 }, { 0x3021, 0x02 }, { 0x3010, 0x59 }, { 0x3002, 0x01 },
+	{ 0x3005, 0x01 }, { 0x3008, 0x04 }, { 0x300f, 0x70 }, { 0x3010, 0x69 },
+	{ 0x3017, 0x10 }, { 0x3019, 0x19 }, { 0x300c, 0x62 }, { 0x3064, 0x10 },
+	{ 0x3c08, 0x0e }, { 0x3c09, 0x10 }, { 0x3c31, 0x0d }, { 0x3c32, 0xac },
+};
+
+static const struct s5k5e8_reg s5k5e8_2592x1944_regs[] = {
+	{ 0x0100, 0x00 }, { 0x0136, 0x18 }, { 0x0137, 0x00 }, { 0x0305, 0x06 },
+	{ 0x0306, 0x18 }, { 0x0307, 0xa8 }, { 0x0308, 0x34 }, { 0x0309, 0x42 },
+	{ 0x3c1f, 0x00 }, { 0x3c17, 0x00 }, { 0x3c0b, 0x04 }, { 0x3c1c, 0x47 },
+	{ 0x3c1d, 0x15 }, { 0x3c14, 0x04 }, { 0x3c16, 0x00 }, { 0x0820, 0x03 },
+	{ 0x0821, 0x44 }, { 0x0114, 0x01 }, { 0x0344, 0x00 }, { 0x0345, 0x08 },
+	{ 0x0346, 0x00 }, { 0x0347, 0x08 }, { 0x0348, 0x0a }, { 0x0349, 0x27 },
+	{ 0x034a, 0x07 }, { 0x034b, 0x9f }, { 0x034c, 0x0a }, { 0x034d, 0x20 },
+	{ 0x034e, 0x07 }, { 0x034f, 0x98 }, { 0x0900, 0x00 }, { 0x0901, 0x00 },
+	{ 0x0381, 0x01 }, { 0x0383, 0x01 }, { 0x0385, 0x01 }, { 0x0387, 0x01 },
+	{ 0x0340, 0x07 }, { 0x0341, 0xb0 }, { 0x0342, 0x0b }, { 0x0343, 0x28 },
+	{ 0x0200, 0x00 }, { 0x0201, 0x00 }, { 0x0202, 0x03 }, { 0x0203, 0xde },
+	{ 0x3303, 0x02 }, { 0x3400, 0x00 }, { 0x323b, 0x02 }, { 0x3301, 0x00 },
+	{ 0x3321, 0x04 }, { 0x3306, 0x00 }, { 0x3307, 0x08 }, { 0x3308, 0x0a },
+	{ 0x3309, 0x27 }, { 0x330a, 0x01 }, { 0x330b, 0x01 }, { 0x330e, 0x00 },
+	{ 0x330f, 0x08 }, { 0x3310, 0x07 }, { 0x3311, 0x9f }, { 0x3312, 0x01 },
+	{ 0x3313, 0x01 },
+};
+
+static const struct s5k5e8_mode supported_modes[] = {
+	{
+		.width = 2592, .height = 1944, .hts_def = 2856,
+		.vts_def = 1968, .vts_min = 1968,
+		.num_regs = ARRAY_SIZE(s5k5e8_2592x1944_regs),
+		.regs = s5k5e8_2592x1944_regs,
+	},
+};
+
+static const s64 link_freq_menu_items[] = { S5K5E8_LINK_FREQ_418MHZ };
+
+struct s5k5e8 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xvclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[S5K5E8_NUM_SUPPLIES];
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq, *pixel_rate, *vblank, *hblank, *exposure;
+	const struct s5k5e8_mode *cur_mode;
+	/* Serialize access to sensor registers and streaming state */
+	struct mutex mutex;
+	bool streaming;
+};
+
+static inline struct s5k5e8 *to_s5k5e8(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct s5k5e8, sd);
+}
+
+static int s5k5e8_read_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
+	struct i2c_msg msgs[2];
+	u8 addr_buf[2], data_buf[4] = { 0 };
+	int ret;
+
+	put_unaligned_be16(reg, addr_buf);
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 2;
+	msgs[0].buf = addr_buf;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = &data_buf[4 - len];
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret != 2)
+		return ret < 0 ? ret : -EIO;
+	*val = get_unaligned_be32(data_buf);
+	return 0;
+}
+
+static int s5k5e8_write_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
+	u8 buf[6];
+	int ret;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
+	ret = i2c_master_send(client, buf, len + 2);
+	return ret == len + 2 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int s5k5e8_write_regs(struct s5k5e8 *s5k5e8, const struct s5k5e8_reg *regs, u32 len)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = s5k5e8_write_reg(s5k5e8, regs[i].address, 1, regs[i].val);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int s5k5e8_power_on(struct device *dev)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(dev_get_drvdata(dev));
+	int ret = regulator_bulk_enable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+
+	if (ret)
+		return ret;
+	ret = clk_prepare_enable(s5k5e8->xvclk);
+	if (ret) {
+		regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+		return ret;
+	}
+	if (s5k5e8->reset_gpio) {
+		gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
+		usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(s5k5e8->reset_gpio, 0);
+		usleep_range(3000, 5000);
+	}
+	return 0;
+}
+
+static int s5k5e8_power_off(struct device *dev)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(dev_get_drvdata(dev));
+
+	if (s5k5e8->reset_gpio)
+		gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
+	clk_disable_unprepare(s5k5e8->xvclk);
+	regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+	return 0;
+}
+
+static int s5k5e8_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct s5k5e8 *s5k5e8 = container_of(ctrl->handler, struct s5k5e8, ctrl_handler);
+	int ret = 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		s64 exp_max = s5k5e8->cur_mode->height + ctrl->val - 4;
+		s64 exp_def = min_t(s64, 1960, exp_max);
+
+		__v4l2_ctrl_modify_range(s5k5e8->exposure, 4, exp_max, 1, exp_def);
+	}
+
+	if (pm_runtime_get_if_in_use(s5k5e8->dev) <= 0)
+		return 0;
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_ANALOG_GAIN, 2, ctrl->val);
+	break;
+	case V4L2_CID_EXPOSURE:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_EXPOSURE, 2, ctrl->val);
+	break;
+	case V4L2_CID_VBLANK:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_VTS, 2,
+				s5k5e8->cur_mode->height + ctrl->val);
+	break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = s5k5e8_write_reg(s5k5e8, S5K5E8_REG_TEST_PATTERN, 2, ctrl->val);
+	break;
+	}
+	pm_runtime_put(s5k5e8->dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops s5k5e8_ctrl_ops = { .s_ctrl = s5k5e8_set_ctrl };
+static const char * const s5k5e8_test_pattern_menu[] = {
+	"Disabled",
+	"Solid Color",
+	"100% Color Bars",
+	"Fade to Grey",
+	"PN9",
+};
+
+static int s5k5e8_init_controls(struct s5k5e8 *s5k5e8)
+{
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *hdl = &s5k5e8->ctrl_handler;
+	s64 hblank = s5k5e8->cur_mode->hts_def - s5k5e8->cur_mode->width;
+	int ret = v4l2_ctrl_handler_init(hdl, 8);
+
+	if (ret)
+		return ret;
+	hdl->lock = &s5k5e8->mutex;
+	s5k5e8->link_freq = v4l2_ctrl_new_int_menu(hdl, &s5k5e8_ctrl_ops, V4L2_CID_LINK_FREQ,
+			0, 0, link_freq_menu_items);
+	if (s5k5e8->link_freq)
+		s5k5e8->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	s5k5e8->pixel_rate = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			S5K5E8_PIXEL_RATE, S5K5E8_PIXEL_RATE, 1, S5K5E8_PIXEL_RATE);
+	s5k5e8->vblank = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_VBLANK, 24,
+			0x7fff - s5k5e8->cur_mode->height, 1, 24);
+	s5k5e8->hblank = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_HBLANK, hblank,
+			hblank, 1, hblank);
+	if (s5k5e8->hblank)
+		s5k5e8->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0x20, 0x200, 1, 0x60);
+	s5k5e8->exposure = v4l2_ctrl_new_std(hdl, &s5k5e8_ctrl_ops, V4L2_CID_EXPOSURE, 4, 1964,
+			1, 1960);
+	v4l2_ctrl_new_std_menu_items(hdl, &s5k5e8_ctrl_ops, V4L2_CID_TEST_PATTERN, 4, 0, 0,
+			s5k5e8_test_pattern_menu);
+	if (hdl->error) {
+		ret = hdl->error;
+		goto err;
+	}
+	ret = v4l2_fwnode_device_parse(s5k5e8->dev, &props);
+	if (ret)
+		goto err;
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, &s5k5e8_ctrl_ops, &props);
+	if (ret)
+		goto err;
+	s5k5e8->sd.ctrl_handler = hdl;
+	return 0;
+err:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static void s5k5e8_update_pad_format(const struct s5k5e8_mode *mode,
+		struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+}
+
+static int s5k5e8_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
+
+	s5k5e8_update_pad_format(&supported_modes[0], &fmt->format);
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		s5k5e8->cur_mode = &supported_modes[0];
+
+	return 0;
+}
+
+static int s5k5e8_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+		struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	return 0;
+}
+
+static int s5k5e8_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+		struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes) ||
+	    fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+		return -EINVAL;
+	fse->min_width = fse->max_width = supported_modes[fse->index].width;
+	fse->min_height = fse->max_height = supported_modes[fse->index].height;
+	return 0;
+}
+
+static int s5k5e8_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
+	int ret = 0;
+
+	mutex_lock(&s5k5e8->mutex);
+	if (s5k5e8->streaming == enable) {
+		mutex_unlock(&s5k5e8->mutex);
+		return 0;
+	}
+	if (enable) {
+		ret = pm_runtime_resume_and_get(s5k5e8->dev);
+		if (ret < 0)
+			goto out;
+		ret = s5k5e8_write_regs(s5k5e8, s5k5e8_common_regs,
+				ARRAY_SIZE(s5k5e8_common_regs));
+		if (!ret)
+			ret = s5k5e8_write_regs(s5k5e8, s5k5e8->cur_mode->regs,
+					s5k5e8->cur_mode->num_regs);
+		if (!ret)
+			ret = __v4l2_ctrl_handler_setup(s5k5e8->sd.ctrl_handler);
+		if (!ret) {
+			static const struct s5k5e8_reg stream_on_regs[] = {
+				{ 0x3c16, 0x00 },
+				{ 0x3c0d, 0x04 },
+				{ 0x0100, 0x01 },
+				{ 0x3c22, 0x00 },
+				{ 0x3c22, 0x00 },
+				{ 0x3c0d, 0x00 },
+			};
+			msleep(80);
+			ret = s5k5e8_write_regs(s5k5e8, stream_on_regs,
+					ARRAY_SIZE(stream_on_regs));
+		}
+		if (ret) {
+			pm_runtime_put(s5k5e8->dev);
+			goto out;
+		}
+	} else {
+		s5k5e8_write_reg(s5k5e8, S5K5E8_REG_MODE_SELECT, 1, S5K5E8_MODE_STANDBY);
+		pm_runtime_put(s5k5e8->dev);
+	}
+	s5k5e8->streaming = enable;
+out:
+	mutex_unlock(&s5k5e8->mutex);
+	return ret;
+}
+
+static int s5k5e8_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	s5k5e8_update_pad_format(&supported_modes[0],
+				 v4l2_subdev_state_get_format(sd_state, 0));
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops s5k5e8_video_ops = { .s_stream = s5k5e8_set_stream };
+
+static int s5k5e8_get_selection(struct v4l2_subdev *sd, const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = 2592;
+		sel->r.height = 1944;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_pad_ops s5k5e8_pad_ops = {
+	.get_selection = s5k5e8_get_selection,
+	.set_fmt = s5k5e8_set_format, .get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = s5k5e8_enum_mbus_code, .enum_frame_size = s5k5e8_enum_frame_size,
+};
+static const struct v4l2_subdev_ops s5k5e8_subdev_ops = {
+	.video = &s5k5e8_video_ops,
+	.pad = &s5k5e8_pad_ops,
+};
+static const struct media_entity_operations s5k5e8_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+static const struct v4l2_subdev_internal_ops s5k5e8_internal_ops = { .init_state = s5k5e8_init_state };
+
+static int s5k5e8_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct s5k5e8 *s5k5e8;
+	u32 val = 0;
+	unsigned int i;
+	int ret;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint)
+		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 ||
+	    ep_cfg.nr_of_link_frequencies != 1 ||
+	    ep_cfg.link_frequencies[0] != S5K5E8_LINK_FREQ_418MHZ) {
+		v4l2_fwnode_endpoint_free(&ep_cfg);
+		return dev_err_probe(dev, -EINVAL, "unsupported CSI-2 configuration\n");
+	}
+	v4l2_fwnode_endpoint_free(&ep_cfg);
+
+	s5k5e8 = devm_kzalloc(dev, sizeof(*s5k5e8), GFP_KERNEL);
+	if (!s5k5e8)
+		return -ENOMEM;
+
+	s5k5e8->dev = dev;
+	v4l2_i2c_subdev_init(&s5k5e8->sd, client, &s5k5e8_subdev_ops);
+
+	s5k5e8->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(s5k5e8->xvclk))
+		return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "failed to get xvclk\n");
+
+	ret = clk_set_rate(s5k5e8->xvclk, S5K5E8_XVCLK_FREQ);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set xvclk rate\n");
+
+	if (clk_get_rate(s5k5e8->xvclk) != S5K5E8_XVCLK_FREQ)
+		return dev_err_probe(dev, -EINVAL, "unexpected xvclk rate\n");
+
+	s5k5e8->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(s5k5e8->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(s5k5e8->reset_gpio), "failed to get reset gpio\n");
+
+	for (i = 0; i < S5K5E8_NUM_SUPPLIES; i++)
+		s5k5e8->supplies[i].supply = s5k5e8_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ret = s5k5e8_power_on(dev);
+	if (ret)
+		return ret;
+
+	ret = s5k5e8_read_reg(s5k5e8, S5K5E8_CHIP_ID_REG, 2, &val);
+	if (ret || val != S5K5E8_CHIP_ID) {
+		dev_err(dev, "failed to identify s5k5e8 (ret=%d, id=0x%x)\n", ret, val);
+		ret = ret ? ret : -ENODEV;
+		goto err_power;
+	}
+
+	s5k5e8->cur_mode = &supported_modes[0];
+	mutex_init(&s5k5e8->mutex);
+
+	ret = s5k5e8_init_controls(s5k5e8);
+	if (ret)
+		goto err_mutex;
+
+	s5k5e8->sd.internal_ops = &s5k5e8_internal_ops;
+	s5k5e8->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	s5k5e8->sd.entity.ops = &s5k5e8_entity_ops;
+	s5k5e8->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	s5k5e8->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&s5k5e8->sd.entity, 1, &s5k5e8->pad);
+	if (ret)
+		goto err_ctrl;
+
+	s5k5e8->sd.state_lock = &s5k5e8->mutex;
+	ret = v4l2_subdev_init_finalize(&s5k5e8->sd);
+	if (ret)
+		goto err_media;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev_sensor(&s5k5e8->sd);
+	if (ret)
+		goto err_subdev;
+
+	pm_runtime_idle(dev);
+	return 0;
+
+err_subdev:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	v4l2_subdev_cleanup(&s5k5e8->sd);
+err_media:
+	media_entity_cleanup(&s5k5e8->sd.entity);
+err_ctrl:
+	v4l2_ctrl_handler_free(s5k5e8->sd.ctrl_handler);
+err_mutex:
+	mutex_destroy(&s5k5e8->mutex);
+err_power:
+	s5k5e8_power_off(dev);
+	return ret;
+}
+
+static void s5k5e8_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	mutex_destroy(&s5k5e8->mutex);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		s5k5e8_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(s5k5e8_pm_ops, s5k5e8_power_off, s5k5e8_power_on, NULL);
+
+static const struct of_device_id s5k5e8_of_match[] = {
+	{ .compatible = "samsung,s5k5e8" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s5k5e8_of_match);
+
+static struct i2c_driver s5k5e8_i2c_driver = {
+	.driver = {
+		.name = "s5k5e8",
+		.pm = pm_ptr(&s5k5e8_pm_ops),
+		.of_match_table = s5k5e8_of_match,
+	},
+	.probe = s5k5e8_probe,
+	.remove = s5k5e8_remove,
+};
+
+module_i2c_driver(s5k5e8_i2c_driver);
+
+MODULE_DESCRIPTION("Samsung S5K5E8 5MP sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3

