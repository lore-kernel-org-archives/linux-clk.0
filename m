Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D540680F
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643299; cv=none; b=F1IGFK9E+PPrIEjkE/tKgZa/vQn01TO+huHjPrWRFtBzfWwsZr+L4NU82HHjwXCPMxTegUE/U/4FAW2LOUVKVb9eEwkXM2SmOLu8Lh6PqdHpw+VFW74+MRw5EM80T20jS3N1o8nTRQM3HX1EvheiOcr7j1CkerfZMVrNmr9fU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643299; c=relaxed/simple;
	bh=jZig0GPFi4JGT2mSmtHGaqcYKCoZ1vTJV6/UKomI3Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuoKhQNtcsP+X7xo+EXcKmYQArqvr635UkTGarqGxw47kKHgyrsAlw9zH2oGDFFu0g/O4KPibUY/v+4jSW69pUmP/fc3UyHxGS50y8MJvSgYkjQIvDvbRX691sxNCRA7RV3FO8qXbk1ISw8X3V+3DqqR02crJ5kjFMVFvNAmpeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ij9YHA3G; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ij9YHA3G"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so1095676a12.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789643288; x=1790248088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk5CbotewI/hTG+Sbs6BsiiN0sqU8afmxYBSAW5T38Y=;
        b=ij9YHA3Gc97MLC+ujNE72ZIZ1LAG9jcW3AD8nhOyUEh7qAjvMO3+lIC9svsB3R4tto
         5mJSgvpPtViE5svCF3b8yykWNLpcL0Hgy09QqIwHpVcYFahstTR3I3yRxpaJ1SeR2stU
         2q6nbfNqCMH2gXxNrj6x9R0B4O0QZhwoddoe0yHazk5IU5bnZudMJYkVVmyZaS1HzXYh
         2AjWJs35zsaG2iJSk2oauKXK3mfXagJn1IhKgkkV5j7z4G1dore9egbkUdvlyLJWnKon
         jD4GFX65jKG51nj2IjOTwATb6t4iFLsKQ9W8cNzMg1JxanZ57rIHTeEEnmrBBiCMZK7Z
         WRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643288; x=1790248088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gk5CbotewI/hTG+Sbs6BsiiN0sqU8afmxYBSAW5T38Y=;
        b=atbNXvUHFhcYAMRgctw44JRMdEAWzbaNvuos40kw3o/W0PaanQnHPj4vBR1XWWZtL0
         RtbMsQimKJD3IF9D8mdQGj1ve5wnY/gkbOy3gIs/aF8FBp3nNQxci1zXz8juLGz04d/L
         6jXDTMD/LJZXAWQStmZ/XLjk+HwngfRWm0AEvJVL0xIwPIfc4p5f082iVuZ2R8ib9cpj
         ypk22do3xRENw7ciKmfQ6EeCQwBuVBfJtLaDPOdCVAj8FBsUIjMz2sQgnXVrt9mg6C4I
         Jrx2Se153PcF9plLyai1z+LT8hB/I4ZunSzZGHge2CN3mLbzTgwlcwuPThlCqZILBqMD
         Xgvg==
X-Forwarded-Encrypted: i=1; AKwUvByRibE5zF/OpiTqpNOc8eRJ0xoesexuEXRZRWcebzBBMgb5PsbNcIYK/gC5weY418CgxEdSYhJwOqg=@vger.kernel.org
X-Gm-Message-State: AFuF++mcRrz8YlUs1ljLGQWJDPa+ggtWs+Y1cxBIWziKwFWlVlNzC+sV
	pF4+pN8mf1FLwPP3qUho+Z9fkotQ/03CfUhw2e6r+Sji9hRqh+vqS5nf338L/6bQAGI=
X-Gm-Gg: AYBFou18CMILfeIaVQMNj9YIRK0u3BhVO9iJ7WbONyW6gLDREFM8LCT72tdUwVZkag2
	FlXtpej8T+3lTBlcIr+wCOO1RqySl8P7kY7RcuvMrPQ9B0tRNH6bPi9+1ALafg9R72MJCkoIasS
	OUFphEL2SfOnpG2utJYwXwnvEJXO0VdncXzsGef2MdxCBsAYufbwXV68BHf7xhkSXCwqTscdRX+
	nrqoJHpKl9cp7PRx0OQCo+kOsXbursFv7fd/HJJHalwE5w672uXr399mSJ8vtGyQGTAVu9uMl4k
	00bVs7P0gwS55hh0ZAIVJR4dki+pcGbMQQr+M49ZO7pYMZGDG5jAZqv2381xJiOQDQiM7EYb82M
	h/nIgQe7Pd5MGRM80MBgoTN3+pBC7dEIKti/3OPyOOxeJMeCHF6A2Ye9zEFkHxCJ59/vv+XxeMH
	5n57w7+lxUsypyjaJhOLja7gjDlLZ9qc5zfbxFHTtNIHF+cUhYeYbt/EWkuqeTjUq6hmF86qzIb
	S+/8r6xVQ==
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id 4fb4d7f45d1cf-6aa2245fd0fmr4559524a12.45.1789643288181;
        Thu, 17 Sep 2026 04:08:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm3175656a12.21.2026.09.17.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:08:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 12:07:56 +0100
Subject: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3025;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=jZig0GPFi4JGT2mSmtHGaqcYKCoZ1vTJV6/UKomI3Ak=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq8oN0qkfPJbt5KiSUYWeyLkllH1amOK1AmkdG
 ghzm8ZiDniJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvKDQAKCRAicTuzoY3I
 OidvD/9Wbx1buQl9vPxQFx4ksC1URoaDw4zXpIA7asxsSY0Tw0FB7Sl/anU/VvUJubBDJQW8Ane
 OM9lxPTn9QeZygPlF0UFlruopLa4p2QorC7tz1yiZYnZFPZRNAQ/1pFRy4VXWdmH8073weEDaKz
 2REFS3hMUM+aqEtjC6Q2Rg1ss/D758r/32aQPKfhngY+9Fyj9isDEqQthLNyQP3p9u6e30xaXSm
 IQPpt2NqqktI+wV7kP4rmg033OMWYy2vhSGCXRm2mGGiuJWIWK1DNpoRxknFgBsb3TgkSJPQ6ZZ
 69yh6dvNHE03VdnSFs7vp5AnTncEUMwUnhbhbWCZAWomEBw4BDIreLcvYXV1jgOAl3x7ugNcE5J
 bMRREHchI8l3ToxtZVX+VBSm765mTQYF5uGP5ZJPGbuFN/asLnv4DgTk0extlc3UPTGvyhDaMyN
 u53BR6vWHWfnAiJARCfRMXnzbI+tySPwPxdpbdjvqP6TmqDoXfNlYeJN+qE0oUtRQytpVoBRSN+
 6K0qWeLXvs/SZeJ9zzO20hwipw73J9zsG9cPwEzqt7JtDugLvKM5LRXpBibQA2qfQNczk5YlZCJ
 aetO79SKbftdOqdNfKQxnwlehGjJ81bzT+Tu9SeVc7l0COOWG+n5ZNwFxGumXtZXGeK0rMwhIvk
 X37/gReJiudbw7w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 36 +++++++++++++++++++++++++++++++++++-
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 490a7cde6d40a..10e9323566803 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -833,7 +833,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
 	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
+		dev_err(dev, "failed to create device link to %s\n",
 			dev_name(phy->dev.parent));
 
 out_unlock:
@@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns phy associated with the device_node or ERR_PTR. devres manages
+ * releasing resources.
+ */
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
+{
+	struct phy **ptr, *phy;
+	struct device_link *link;
+
+	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	phy = phy_get_by_of_node(np);
+	if (IS_ERR(phy)) {
+		devres_free(ptr);
+		return phy;
+	}
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 71c2e16397130..14b924a88411f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
 struct phy *phy_get_by_of_node(struct device_node *np);
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
+						  struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

