Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42643502D6E
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739822; cv=none; b=GQPg+gNVVgYXTc5ldZO6dpHxuFJrVQCzTBMB5qe5mIc1fnXfi2xMJmUby3FcS5d44QAGJiqfxyqmFIcVXIYRfdrr1sgCbOHZrPDIDdmelZgE2msj6LXTcSKBNn8oWihmuU1qQnoU+wmbE5Hucvycyv94NCpkvHg78GUVFA7sMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739822; c=relaxed/simple;
	bh=pqNWQgF8ClsJh5Yi5qQY7AdMdYAk6BCqiLyzGAJKIe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYSWvA1XX7+3lBGviLYpt332TRHPT3xSGIQU+P06H7AXNdKIDys+WTsXEkQ8VmOhn73Xm+RS+Ph2bbNo0xuMHuw5Z5l+67vb7GjTCZIK2XU2bwPPfeaybcW0ZAHdyu8grcWBg/9L3Giftyhtpp5zQBD7Uam0wPLeWf/XaKdej2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCfFSrah; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCfFSrah"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so962944a12.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739817; x=1790344617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVVY0F/3SoAAMbyWD2/7RYl6WppDgQD/EUsXpw6hsho=;
        b=oCfFSrahoPSR5pAJrOG+TtKbt/rvTJeF3BKJPfKv31E9zg2VIblpD6ZS4Oi/roIY30
         bmqVdY5rTVj/DmfGYO0H/H4MPCZS4DBjo0f1hfsVpm7GJWE+QunpdbMX0O1WCAcxhXkV
         i10k05J39ajHtoDBXaGCyetZCZEft2nwv3uUBMCFUjE9LEJSYRq24oOFSPVWORZd92VY
         8UORgflT5tNstFGjxsDsOGQBalidbl+dzDysX7gKvDIpVy2ggyzPQWoprQpdro/gSice
         x0kwyG0ND7DuHLcj3nQ0QAxrL3JuaRphXEpP7qx+UC8b82QScg8adBEUEJjc+9GEyFVn
         qMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739817; x=1790344617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVVY0F/3SoAAMbyWD2/7RYl6WppDgQD/EUsXpw6hsho=;
        b=Fp9J6LXNAPpIyRgwCfgZP3NMbpEvCazSlipRaVFZ2MpeS7XvlpbFv/nG68FH/FchMT
         /LV56Yrn12F0qwCjG/yD+fTib2Ox26Hh8RZ17roJOSO2H046WvX30+O06JiAyO/EbfFe
         e6r1HNp5M1RwNYCcaqSRTFMHgZarpAB1PX8UrFuCUdzvhmAqzfaJar3XDhDCIY6gijH/
         QU7gNfRnBRzUHDKqmzp0lCRZ5o7MBnaAGDUq1CsdXNwZtxDLLp5vGcTp8WtTCGBfAR0a
         BhADFdlrqy0788c/HAWGd4wXtXq4eCKBd/4NdzlUqNp/87vRtvL8bRXIcu9GBskgqClU
         vx7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOcLLBho79LB7Mk8kDSspuI0qEnVqH2m8uf/Ubwv0zJE3hfbRh2oYdzMlphyaopga/P0d5SZ93uUA=@vger.kernel.org
X-Gm-Message-State: AFuF++k5Qj5+Ki6WkwmHVIJlnSlvYEcZQDu5K0wAxO7chErznyAXQic5
	TZyuUyRgBQTE6uFsQ8I8LOX3+VM//Cz9S0u8IvwVCMS4kgWbRIYmKtyqsS6CTygJdeA=
X-Gm-Gg: AYBFou014OlfR+gaRC9ugtVZzyua9iyMaY/hdTbtCKLo18VqF+HXu/tGux9dhU7Gmmj
	2HXDSxQ0urN9lsMiEmQaf9Hns/ubFI92X0Hh11Do2wjHrbetvZ7VKse7wm5/VIBWA81j2p60WYa
	IDavNBsAhSjeK/T2QL4JyiVm12icigiCfjf2zt6WeKzO8O4Ag132ao01QNXsmZgH3sVio48SlPb
	e6M3hq1/V9a7ZUJylzsNmacowpVwp6f0ROQ2+tC6Yk2RVd+Ss9Eej89usB+6jlBaILcMKYYB4cs
	Tk3GXmlu3iHculw9FChlfUkFEei41DFgSeykntKHp5LKCikyaDPEZIJ9Ttf8QdFOjwKU1w7w0Dq
	TpucLib4c7Hk5Sq7diCBDm68YY0lBlEAkj0LnRszxnZj7SU/yqdBItTYJ47VQ2KaHzhiuWCLzc6
	f7UT9zbnh8wwABizFuNwSY5vGeBShShmj79ek9l9UcmlxbLa/+9JQ1hINxZgheqpLkXjNZwFzOR
	y7ThvtV
X-Received: by 2002:a05:6402:2112:b0:6a9:ab47:e08 with SMTP id 4fb4d7f45d1cf-6aa545f1e10mr1610240a12.0.1789739817032;
        Fri, 18 Sep 2026 06:56:57 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:41 +0100
Subject: [PATCH v20 6/6] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-6-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Oleg Keri <okerixx@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3176;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=pqNWQgF8ClsJh5Yi5qQY7AdMdYAk6BCqiLyzGAJKIe0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMcaIz3wyLlou3OxIUAqDc7LpQ0TclV6L5O6
 W6PwUeeN9GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DHAAKCRAicTuzoY3I
 OlrwEACgFIoqFiEREgBHed5k/+FwouGdl1N94FNwHz3Ju/kS9+7Go7eYTmPxlyEo2g66mlFzO6G
 mQ+CvwA5v0D00bg4MX4PSdFW1b907+AINo/KZB+DwNwrCmRwkK7MirL6oJ8b/MD1zUhrzkDX0D1
 ICvThBsPaBjuYvsj3UmxIZbJoymwnHopj2s/KizRoxfraSr/RCn//zD4TJmFcdWWTox8JmJjOZP
 wWKHWl/x8YYb0x88Z2GALZkmPP/R92WPwO3lNJUjiOSv00lpumNW8NEjZRGd0XEbs66GMpAaimQ
 wBRj9mo5i4Q3c6OyuAJ93x4ay0UBLFK2P+SDn/7zn1X/SrRi5scbGLpKpppowv89oejqzKQtyuk
 7yeglCJ/TqrwPk9nkMoJzHj15vut8RrGsvmZDOSgZnVg0IaPkrxJSWK6eUY8xfM2tqHRt2gmd37
 r9Rq0U2c8kkp5Mk26c7g6/eNf8TUnAqBhiKjAzdx95HEx3psZWs3fENrTKKXKHFWAIeG5rCMh3q
 va4QLj2+Lhn5fxLr7DyUIX/AZfZxK90rzG2n8naIlvRfkesaF1vwJSljqM4RRmZeHKptaOs+UL6
 7ADh2UwBCYYqKk0uhgVsPnN+X+6Tud40SQDRB2K0oPzTQWAmelVEcigHCgrQ4e3bNoIIoD0OWSi
 H572stIBMMlWv5Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Introducing a dedicated CSIPHY driver community feedback was both to move
to data-lanes starting at index 1 on the PHY side and also to match that
indexing scheme in the CSI decoder - CSID.

CSID consumes the data-lanes property to determine which CSID lanes to
switch on. For indexes starting at 1 we need to amend the logic somewhere.
The PHY side code normalises the input data to register level meanings so,
replicate that logic on the CSID side.

Introduce a simple flag to differentiate between legacy indexing @ 0 and
new indexing @ 1.

Existing bindings are not affected.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 7a357044b9fdb..8c3319f2ca1cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,7 @@
 #define MSM_CSIPHY_PAD_SINK 0
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
+#define MSM_CSIPHY_MAX_DATA_LANE 4
 
 #define CSIPHY_GRP_ID 1
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c9..6f58e729eaceb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+				     struct camss_async_subdev *csd,
+				     u8 lane_base)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {
-		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
+		u8 lane = mipi_csi2->data_lanes[i];
+
+		if (lane < lane_base || lane - lane_base >= MSM_CSIPHY_MAX_DATA_LANE) {
+			dev_err(dev, "invalid data-lane %u\n", lane);
+			return -EINVAL;
+		}
+
+		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
 		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
 	}
 
@@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	u8 lane_base = camss->legacy_phy ? 0 : 1;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
@@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
 		if (ret < 0)
 			goto err_cleanup;
 	}

-- 
2.55.0

