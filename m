Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14A3C2796
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476376; cv=none; b=P/vydiGfBFmv4+Ey28wpV1dKTg2fEJjUUrpitgyiFN/p5otMr9FzEmk9syi60yZ27cBYysS9+SOUikMOBknbBGntMx2/A/d6hxfEfuSguREDRG4H6jqDWTm2OAYqB8p7HhdjS3nZt4R59CKbKcLCnvus+ofbuxqzoOcdSqqtLRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476376; c=relaxed/simple;
	bh=6sxkZmzibkfa/k3gfbDk8F7aHqug51ouhrOGclRe9u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gcuFCxsyzz1EAUIE0Y2ogrGscMIlIluqxoDaE61R9C2hrY49UdGJmVz9D9sMJRIf4l8UUiF5fF4C9lywei9C7/DdbZEK4ML3i4g2801TQS8gY8OuuAtpdL9C5RwsoY/s6cgE8QjqNqPTYULE4RPKKghuuYDi8jLxn1EYlwq0T4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQXfA7pR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQXfA7pR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482e4998d28so260331f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788476371; x=1789081171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IgEM+4mtnzLjLWVDS0EbA6cZIy3sKEYkQr8OPm+mdA=;
        b=dQXfA7pReXiFO0mQ+uC4583VfoM6EdzraZUg8TkCZyS+924CgiwJT0HZN46S4qkFXl
         Jn15XHfefADJfvuYvmj3aDGausIOHKlx2GbyWG/CraWyFwslBHf3XLDYqHoMPZsyXujL
         1ail4EmtZc1JUr9ejoPatdBAtJ0IRbYrAJBRUOINFxsJXoIuC+nNZ+uRmKzLA2Cfn5OS
         U3l4XFFRAq/MmuQ8D4c5YwgNQIJshmHHyD46j1QDYUNWi8SGnxMd04alHrIwSqaKLXCb
         bbY+mijJ9NC/oFzL+a9DjWvZ3QqFFuqsm2EUA63RCupgy8pewlx2OL6x6nT/UsSoReTS
         ZoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476371; x=1789081171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IgEM+4mtnzLjLWVDS0EbA6cZIy3sKEYkQr8OPm+mdA=;
        b=Kp15x+3O7Bru4LqppozlEX8wGl4YqjAJ0nP4dhXWBUWyHxddKZLwadC+2lLVZk0Nlx
         iqCi+1oXu2hSGFg7Bj6Gu040jKC+4JcZwDDnfzvX9kXnhwmmYx2hmhO1d38tXXQDOZne
         /3NOwK5o0Akc1W1OYi3Ncu5I+mgKNUh5WIVaoFsVr2IyLTgvOwK34sziwUJUoN73qnOu
         TOiy3rmvAz7R1ctYa3Cxvvc1pGnAvYYko510Uu9CVKKcwFMAR38FZjYW8+1d5m6yWLyp
         +rk3XfKeudhKKbfHxuXAKC9LVyyXblWeJee6jz9HEZHcbMHiCPu9wWEkHoc9YdGX1+wK
         Chsg==
X-Forwarded-Encrypted: i=1; AKwUvBzrw4xuEVBlgog1lhcKdRkbDtfJ12ckcoSgDMEk6u6sIig1UDdzI6Qo+Cucp0gs03oWTBKrGxI/a3U=@vger.kernel.org
X-Gm-Message-State: AFuF++mIaB6oWnH/ux/mNHbnlfBO1hnC8eG5P9S/KRj5su/NbxISgRky
	MylWBXA2Qjf0psQVG8DhTASObLxFggOg4b7MftTu1UHI+O3lqo978lQ5IYblIEgooIg=
X-Gm-Gg: AYBFou29fb2gVy/J6myrrA+Pls1WGhD54wiBQcaEvOSiE8fcSb3eczqxPaZkxXCYRdF
	izNqPYVwnqIvS0M7Y1/IMU0ZHJfD54jmldCXr670gquQ2tJRj6pq0pGExMuVYF+ZYmkR/0gGdxP
	ouAHgTrT43f250z1zjcVBhbzugcweLz/WZ9ARqMMX9MgxfcT7C2LzheAPuftDFVxIYLE6gcIHNQ
	l4PD8YH4ECO194MbF7JbsqbiqqgzoPr6VKzz4+/frJHQNPYEObvwVRBFLwrH/JvsRS7UKmlc5if
	ND0CQpVmeJpgmwpHYT1YUK0eQVUjenm6EVSda3TsdSk8FsUcvYWv/+3ijWxQkcJVlTL+pfWa6fR
	qSRCUzfiY9nH5mSKGGJKY0mLGI2Hb6eOHLWOB8+AY5XRdwvqraiu5RiOefwzRzZC8oZdMgc83Zg
	3xO8QyMzyYYkPSxj5jAdtDjhQJltmakzGddfccTZBdcAHbeVRoKp4gLdhZzKMlOUYwjR8N
X-Received: by 2002:a5d:6ac9:0:b0:482:e10e:58df with SMTP id ffacd0b85a97d-485872dbba4mr3652028f8f.21.1788476370833;
        Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
Received: from [192.168.0.35] ([93.107.91.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9a56sm1448006f8f.15.2026.09.03.15.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:29 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 03 Sep 2026 23:59:10 +0100
Subject: [PATCH v14 4/4] media: qcom: camss: Add support for PHY API
 devices
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-4-01ef1eced075@linaro.org>
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17055;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=6sxkZmzibkfa/k3gfbDk8F7aHqug51ouhrOGclRe9u4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmfvH+u3g7RXSiCU7DB4SFC4LefT96U8XHqp2t
 b8ZLiTQlqyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapn7xwAKCRAicTuzoY3I
 Om0VD/9e/NO7XVH4hN+i/QT24zdX/r4u1mvpE1oHjp197QZKglIwJORFox6k1K0AsDFTJ0+xEfs
 ZGt6bONpQarNsDS1qEDSHzjXEKL8WsXjuZuEegoVT5+3mktHde6NDtbfsVhAyLKN1ydLqjspgj4
 tGxzy063uyXjRhnQ28X6NPql7NmhMmm/BE2VvWjre3M8dujQP/idBEqo4hufN5zvylRV4xUz0kB
 NR3k9OmQALpDo7KdLsKe1V0AFKlZAczhzT3q61KXm4byCW22TfsTr0mmFL2pkT2jApz5C+rVR49
 W0wW0w/1WSXLmXBdyyFuYVUDjt6HVdTX363OfNx4L3R1J9JYgtFKzg4dfQwlJg4KlT+cdygB0pu
 pRoDg3PNV9cfF7hYZiUHHCTHtbAwHvZBkD4aMFTSsHffCvlJ+7+L+K9hUByDhXd15JvjlrkD0sc
 bAqnXyTlt0vdA9fzCSXtO7vfBrYvKzvcrK2pEWoMN8PXuv0iq2N2v6GsxDQWPTsFZ98zq/cTDA0
 CqliTlaSKzubvuJlEdKOr4FCI+84Or4aVnYNwL7k1LTxzl4BXvMe21porGJ7NDDth2kCLrmFji7
 A/Lmq2FLv2AcLf3zzgv5yleGFO4vhYbVbTwtlZXxMAc6Wvz3lnWkNlpo0RCHUPHwoiRAecLCZYl
 LPDFZruAphxIahQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig        |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
 drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
 drivers/media/platform/qcom/camss/camss.h        |   1 +
 5 files changed, 263 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf0..1edc5e5a1829e 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+	select PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 539ac4888b608..e00748dd83b02 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -13,6 +13,8 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <media/media-entity.h>
@@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
 }
 
 /*
- * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY module
+ * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIPHY module
  * @csiphy: CSIPHY device
  */
-static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
+static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
 {
 	struct device *dev = csiphy->camss->dev;
 	s64 link_freq;
@@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_set_power(struct v4l2_subdev *sd, int on)
+static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct device *dev = csiphy->camss->dev;
@@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		ret = csiphy_set_clock_rates(csiphy);
+		ret = csiphy_set_clock_rates_legacy(csiphy);
 		if (ret < 0) {
 			regulator_bulk_disable(csiphy->num_supplies,
 					       csiphy->supplies);
@@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 }
 
 /*
- * csiphy_stream_on - Enable streaming on CSIPHY module
+ * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
  * @csiphy: CSIPHY device
  *
  * Helper function to enable streaming on CSIPHY module.
@@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_stream_on(struct csiphy_device *csiphy)
+static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
@@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
  *
  * Helper function to disable streaming on CSIPHY module
  */
-static void csiphy_stream_off(struct csiphy_device *csiphy)
+static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
 {
 	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
 }
 
+/*
+ * csiphy_stream_on - Enable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to enable streaming on CSIPHY module.
+ * Main configuration of CSIPHY module is also done here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_stream_on(struct csiphy_device *csiphy)
+{
+	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
+				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
+	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
+	struct phy_configure_opts_mipi_dphy *dphy_cfg;
+	union phy_configure_opts dphy_opts = { 0 };
+	struct device *dev = csiphy->camss->dev;
+	u8 num_lanes = lncfg->num_data;
+	s64 link_freq;
+	int ret;
+
+	dphy_cfg = &dphy_opts.mipi_dphy;
+
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+
+	if (link_freq < 0) {
+		dev_err(dev,
+			"Cannot get CSI2 transmitter's link frequency\n");
+		return -EINVAL;
+	}
+
+	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
+
+	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+
+	ret = phy_configure(csiphy->phy, &dphy_opts);
+	if (ret) {
+		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		goto error;
+	}
+
+	return phy_power_on(csiphy->phy);
+
+error:
+	return ret;
+}
+
+/*
+ * csiphy_stream_off - Disable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to disable streaming on CSIPHY module
+ */
+static void csiphy_stream_off(struct csiphy_device *csiphy)
+{
+	phy_power_off(csiphy->phy);
+}
+
+/*
+ * csiphy_set_stream - Enable/disable streaming on CSIPHY module
+ * @sd: CSIPHY V4L2 subdevice
+ * @enable: Requested streaming state
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	if (enable)
+		ret = csiphy_stream_on_legacy(csiphy);
+	else
+		csiphy_stream_off_legacy(csiphy);
+
+	return ret;
+}
 
 /*
  * csiphy_set_stream - Enable/disable streaming on CSIPHY module
@@ -572,16 +651,16 @@ csiphy_match_clock_name(const char *clock_name, const char *format, ...)
 }
 
 /*
- * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure and resources
  * @csiphy: CSIPHY device
  * @res: CSIPHY module resources table
  * @id: CSIPHY module id
  *
  * Return 0 on success or a negative error code otherwise
  */
-int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id)
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id)
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -709,6 +788,56 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	return ret;
 }
 
+/*
+ * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * @camss: CAMSS structure
+ * @port: DT port index
+ *
+ * Return 0 on success or absence of link, negative error code otherwise
+ */
+int msm_csiphy_subdev_init(struct camss *camss, u8 port)
+{
+	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	struct csiphy_device *csiphy = &camss->csiphy[port];
+	struct device *dev = camss->dev;
+	struct device_node *ep, *remote;
+	int ret;
+
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, port, -1);
+	if (!ep)
+		return 0;
+
+	remote = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!remote)
+		return 0;
+
+	if (!of_device_is_available(remote)) {
+		of_node_put(remote);
+		return 0;
+	}
+
+	csiphy->phy = devm_phy_get_by_of_node(dev, remote);
+	of_node_put(remote);
+	if (IS_ERR(csiphy->phy)) {
+		ret = PTR_ERR(csiphy->phy);
+		goto done;
+	}
+
+	csiphy->camss = camss;
+	csiphy->id = res->csiphy.id;
+	csiphy->res = &res->csiphy;
+
+	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
+
+	ret = phy_init(csiphy->phy);
+	if (ret)
+		dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
+
+done:
+	return ret;
+}
+
 /*
  * csiphy_link_setup - Setup CSIPHY connections
  * @entity: Pointer to media entity structure
@@ -743,8 +872,12 @@ static int csiphy_link_setup(struct media_entity *entity,
 	return 0;
 }
 
-static const struct v4l2_subdev_core_ops csiphy_core_ops = {
-	.s_power = csiphy_set_power,
+static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy = {
+	.s_power = csiphy_set_power_legacy,
+};
+
+static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy = {
+	.s_stream = csiphy_set_stream_legacy,
 };
 
 static const struct v4l2_subdev_video_ops csiphy_video_ops = {
@@ -758,8 +891,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
 	.set_fmt = csiphy_set_format,
 };
 
+static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy = {
+	.core = &csiphy_core_ops_legacy,
+	.video = &csiphy_video_ops_legacy,
+	.pad = &csiphy_pad_ops,
+};
+
 static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
-	.core = &csiphy_core_ops,
 	.video = &csiphy_video_ops,
 	.pad = &csiphy_pad_ops,
 };
@@ -785,10 +923,15 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 {
 	struct v4l2_subdev *sd = &csiphy->subdev;
 	struct media_pad *pads = csiphy->pads;
-	struct device *dev = csiphy->camss->dev;
+	struct camss *camss = csiphy->camss;
+	struct device *dev = camss->dev;
 	int ret;
 
-	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+	if (camss->legacy_phy)
+		v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
+	else
+		v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+
 	sd->internal_ops = &csiphy_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
@@ -828,6 +971,8 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
  */
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 {
+	if (!IS_ERR(csiphy->phy))
+		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82f748..7a357044b9fdb 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/phy/phy.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mediabus.h>
@@ -97,6 +98,7 @@ struct csiphy_device_regs {
 
 struct csiphy_device {
 	struct camss *camss;
+	struct phy *phy;
 	u8 id;
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_CSIPHY_PADS_NUM];
@@ -104,6 +106,7 @@ struct csiphy_device {
 	void __iomem *base_clk_mux;
 	u32 irq;
 	char irq_name[30];
+	char name[16];
 	struct camss_clock *clock;
 	bool *rate_set;
 	int nclocks;
@@ -118,9 +121,11 @@ struct csiphy_device {
 
 struct camss_subdev_resources;
 
-int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id);
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id);
+
+int msm_csiphy_subdev_init(struct camss *camss, u8 port);
 
 int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 			       struct v4l2_device *v4l2_dev);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..84097d82d99c9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4799,8 +4799,43 @@ static int camss_parse_ports(struct camss *camss)
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
 
-		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
-						      typeof(*csd));
+		if (!fwnode_device_is_available(ep))
+			continue;
+
+		if (camss->legacy_phy) {
+			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
+							      typeof(*csd));
+		} else {
+			struct fwnode_handle *phy_out, *phy_node, *phy_in, *sensor_ep;
+
+			phy_out = fwnode_graph_get_remote_endpoint(ep);
+			if (!phy_out)
+				continue;
+
+			phy_node = fwnode_graph_get_port_parent(phy_out);
+			fwnode_handle_put(phy_out);
+			if (!phy_node)
+				continue;
+
+			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
+			fwnode_handle_put(phy_node);
+			if (!phy_in)
+				continue;
+
+			sensor_ep = fwnode_graph_get_remote_endpoint(phy_in);
+			fwnode_handle_put(phy_in);
+			if (!sensor_ep)
+				continue;
+
+			csd = v4l2_async_nf_add_fwnode(&camss->notifier, sensor_ep,
+						struct camss_async_subdev);
+			fwnode_handle_put(sensor_ep);
+			if (IS_ERR(csd)) {
+				ret = PTR_ERR(csd);
+				goto err_cleanup;
+			}
+		}
+
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
@@ -4819,6 +4854,29 @@ static int camss_parse_ports(struct camss *camss)
 	return ret;
 }
 
+static void camss_detect_legacy_phy(struct camss *camss)
+{
+	struct device_node *remote;
+	struct device_node *ep;
+
+	camss->legacy_phy = true;
+
+	/* Find first remote-endpoint and determine if its a PHY */
+	for_each_endpoint_of_node(camss->dev->of_node, ep) {
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote)
+			continue;
+
+		camss->legacy_phy = !of_node_name_eq(remote, "phy");
+		of_node_put(remote);
+		of_node_put(ep);
+		break;
+	}
+
+	dev_dbg(camss->dev, "legacy phy mode %s\n",
+		camss->legacy_phy ? "true" : "false");
+}
+
 /*
  * camss_init_subdevices - Initialize subdev structures and resources
  * @camss: CAMSS device
@@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *camss)
 	unsigned int i;
 	int ret;
 
+	camss_detect_legacy_phy(camss);
+
 	for (i = 0; i < camss->res->csiphy_num; i++) {
-		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i],
-					     res->csiphy_res[i].csiphy.id);
+		if (!camss->legacy_phy) {
+			ret = msm_csiphy_subdev_init(camss, i);
+		} else {
+			ret = msm_csiphy_subdev_init_legacy(camss,
+							    &camss->csiphy[i],
+							    &res->csiphy_res[i],
+							    res->csiphy_res[i].csiphy.id);
+		}
+
 		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to init csiphy%d sub-device: %d\n",
-				i, ret);
+			dev_err(camss->dev, "csiphy %d init fail\n",
+				res->csiphy_res[i].csiphy.id);
 			return ret;
 		}
 	}
@@ -4917,6 +4982,11 @@ inline void camss_link_err(struct camss *camss,
 		ret);
 }
 
+static inline bool csiphy_enabled(struct camss *camss, struct csiphy_device *c)
+{
+	return camss->legacy_phy || c->phy;
+}
+
 /*
  * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
@@ -4930,6 +5000,9 @@ static int camss_link_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
+			if (!csiphy_enabled(camss, &camss->csiphy[i]))
+				continue;
+
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
 						    &camss->csid[j].subdev.entity,
@@ -5056,6 +5129,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (!csiphy_enabled(camss, &camss->csiphy[i]))
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -5131,8 +5207,10 @@ static int camss_register_entities(struct camss *camss)
 
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
-	for (i--; i >= 0; i--)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i--; i >= 0; i--) {
+		if (csiphy_enabled(camss, &camss->csiphy[i]))
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	return ret;
 }
@@ -5147,8 +5225,10 @@ static void camss_unregister_entities(struct camss *camss)
 {
 	unsigned int i;
 
-	for (i = 0; i < camss->res->csiphy_num; i++)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (csiphy_enabled(camss, &camss->csiphy[i]))
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	if (camss->tpg) {
 		for (i = 0; i < camss->res->tpg_num; i++)
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b..ba3d51d9c0bf8 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -138,6 +138,7 @@ struct camss {
 	struct device_link *genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
+	bool legacy_phy;
 };
 
 struct camss_camera_interface {

-- 
2.55.0

