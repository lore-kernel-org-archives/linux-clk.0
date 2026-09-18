Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DB5038E1
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739816; cv=none; b=qVcWMgOqw4nuI1KKOUwIajphmg+daDHBUUo1Tkl2Yxl1MihmdDwL/50qBNV4cIJ2tfSugcJJLgllEbO/e6X7EhBRvHVLCL38LIGlMzb+YlsmHvsi0jo6t3YWJvEi7pWrZNvGliompBCBNTQVMbRLn6+EW2jE6CQpSJqJGf+n/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739816; c=relaxed/simple;
	bh=X+b9HWNkFpTSELC+pQKN2+ErKNjGyicH/BBE9Xjuc5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFj+LKupHMZtbiJOcGJpUD+dU9ucc1+2YUXOmYroaT8QZip7lZMLYpSpnAU3RmgOpLaKQMxMPkW2DNGxcKoEBPCYxXIkm/mW3Al1P6gzTIDBoQrqfBbkxyZX73qTAw59S3h+zqoNiKkeiTk12BMRDwR+/X+RlGw5ufQZPqGJQuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGKPY8NP; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGKPY8NP"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so975517a12.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739811; x=1790344611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0tAWo8cXsvcEAHoDAoVuGWldwoawSSoU2jMNY+PQMI=;
        b=jGKPY8NPy9SRi+erqXXno+cLDvAp1cGjgGpMlE/e+WwZOPJdm0NDvGnjlt+IfyJ5O3
         EP+PtZaIfVzxKFSF0rGtsq0TeJhDAMBPFCIyJ3Cj9FBj8FObcZQXffign5d8pSd5bLFs
         HEe2lRzmBgsYP7nXFeugl+UCayF/OrvnVD0d3ONCCQt8VnlvID+84Uj9JfLiUPcNKi5/
         uuZsp8hFPkWxTZTIUjxCGh5UV9/PgTolUtFuzuNDoSQNj3I1Ed6Sg4BDvnDoooTl8lcI
         g8WcGyny5z/l6nLwjGGxDc4fWTMncVA9g2YP9yFWjAY8/0ta+KT9mD+du83s4PiO//ib
         ysGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739811; x=1790344611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0tAWo8cXsvcEAHoDAoVuGWldwoawSSoU2jMNY+PQMI=;
        b=aoTKQY5SBD3+4+hKaSvGkjMmlt+5FAaNdfEt1XNr9o3cRcXjw0kDAr6P1/9XCuBRj8
         gRwfYZguIAqKAT0Ep3u/YesXxUDQd19IF7rkcwnCTDwyfsT+0zrm60NqY44w4L3cqLqp
         BI9FPiPtZvSMRKXCcbwhLRq9+cE89cWJAHn5V6woa8TSOBhW0Xd0RCNNgiKG2okdGAaT
         OYWuvb6Vbh5UqkHeVgcChXqXFQZVm5iuzs/1lNK0mpsoMZkrhSw0ri7CoNaMFncRnfAj
         oM/cVzuJrJtc3ejl4jAzEWFGsnFsjrrGBRLStYI1W0SoufHYlJULu/MabpEoQP7R6s0T
         vEpw==
X-Forwarded-Encrypted: i=1; AKwUvBwhAfjCltRgM9NzgRcrhS3etIfsxiDl7FW5l/xikQbBFRQVSCu5WNSEU48UdcJjDGC60yUkyIEScUc=@vger.kernel.org
X-Gm-Message-State: AFuF++mkedq7EKwnIa4XI675QURIFJq6uItkXeNX8NZ6mAh4FIKv7k4y
	cA50VIPZ/dLowjOzNwvX8GhKvjQEtknGCo6gVutRPKE1LO6/ywgyahb2n9btKnor5uQ=
X-Gm-Gg: AYBFou0/RHe9N0lsQ0K8huFfPLdw8hiSKM8KtBNJA/FXfVqee9NRT7Jn7T7teXRxAJx
	H12UYT+USLEIR+115xw+0ALSrt60kh8PxEerh4xZUfLTcqFlrizG7J61t7/aafh6nlYQJY+1RgG
	QfIeB7yQOGQalXa2NZi9JiTNCtJMwYg+y83gujgX4ITckmoMyVTNjNYaMzKdlE2q24PVb72jjZz
	/SE5Jm1m9AzFvFNDbq00obWseM2ti53IADORz285zkG1pPBE6s9HRyfOWwyUDxE7NLM5bIXvij5
	w3YFandk0lUomR8WAfdu98FqX1XPoFjiFRh/stwbMldiZVs/WuRJnKBrMafxzP1JToWnBFh3nEw
	Q6y6jzD3a0AzykT+uIgPQvSlSpctXq8e/GW6pRG2sq2Bp9tTnk5CuY16BAWUChYfv7voEZy/3VQ
	5eRZTlyeSpw+a5WpXTlQ+aoVkYMiKXbHEj6/2Arxt1MS2DahD/VvE/o2OBNJl1Oan4e9A993jyP
	h+T/z9YsuzTZ3XFBy8=
X-Received: by 2002:a05:6402:320a:b0:6aa:1cf5:6076 with SMTP id 4fb4d7f45d1cf-6aa577f4d79mr3531952a12.1.1789739810897;
        Fri, 18 Sep 2026 06:56:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:37 +0100
Subject: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4675;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=X+b9HWNkFpTSELC+pQKN2+ErKNjGyicH/BBE9Xjuc5Q=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMbqFgCjhyQpekow1DUdmmicyQGC0P3oz5uu
 7moYJGlheOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DGwAKCRAicTuzoY3I
 OrJ/D/4wge7bDfnNEDFG4/o/jA8PUy3RPzymClxjXzIvlhLZqejrR5b7qxaEBTZmhlahQKYcgfT
 qz2XZQY0799xUctCfuGYodol59ufPT7BquJ/MqxOvO9p4//D2kcNWeUyC877Ipp9gjw6/eSquML
 VTU0VJOxESxVQmy/d58WzHTw529l+YxJD3+SobRA2wMNGmsyHP6pUC7mkLwyabwEED/HNl6G2Fx
 3uDRo83VfSa16FCoD+mpm7JH79rYrjXqjbpFl5VLzPpCeE50ZeLFWL7/pPAEVi606AXZ9ogfdJh
 6p2Ij6SP5JXZ/a3lLnH4NxciaBbuJHL28CJZUxYITZw4wAuNB16TSxvF4MglJ1C2F2BxVhdp30W
 kfb1YbtmBpFDhB8FuBPgxTxa43Og2ufZJ9IxGjdoJ+x2ci7+41EfMHDxhGzCEnHQHhvjBoOVEC4
 /Da858uqeB9p8g1iGPg32wb5/aBjMzDQ1HfujU3x6vZT2KkYgq8WUbCufjxO3Gp4NrdWLY5jpib
 3ZfDWRHa4wugCdMtnylvNiqYyoGY5I9Mk1QLu0/Dj8zAf6kXcE1IiTVTUS73jNkydkThIWl4Tul
 HwmvnLn/rph3jLWPQwTGWOYMJlBkclkgT25uxZS8+OnLSYmLVNVCALADqJ7vzJGtMREgvLotnoT
 Zi7ETVGmzOzA2Vg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 83 ++++++++++++++++++++++++++++++++++++++-----------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 71 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..42c27a2b45159 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
+ * @args: of_phandle_args to the phy
+ *
+ * Returns: the phy from the provider's of_xlate, -ENODEV if disabled,
+ * -EPROBE_DEFER if the provider is not yet registered.
+ */
+static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
+{
+	struct phy *phy;
+	struct phy_provider *phy_provider;
+
+	lockdep_assert_held(&phy_provider_mutex);
+
+	phy_provider = of_phy_provider_lookup(args->np);
+	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (!of_device_is_available(args->np)) {
+		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
+		phy = ERR_PTR(-ENODEV);
+		goto out_put_module;
+	}
+
+	phy = phy_provider->of_xlate(phy_provider->dev, args);
+
+out_put_module:
+	module_put(phy_provider->owner);
+
+	return phy;
+}
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
@@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 		goto out_put_node;
 	}
 
-	phy_provider = of_phy_provider_lookup(args.np);
-	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
-	}
-
-	if (!of_device_is_available(args.np)) {
-		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
-		phy = ERR_PTR(-ENODEV);
-		goto out_put_module;
-	}
-
-	phy = phy_provider->of_xlate(phy_provider->dev, &args);
-
-out_put_module:
-	module_put(phy_provider->owner);
+	phy = _of_phy_get_with_args(&args);
 
 out_put_node:
 	of_node_put(args.np);
@@ -1001,6 +1017,37 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
+ * @np: node containing the phy
+ *
+ * Returns: the phy associated with the device node or ERR_PTR.
+ */
+struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	struct of_phandle_args args = { .np = np, .args_count = 0 };
+	struct phy *phy;
+
+	mutex_lock(&phy_provider_mutex);
+
+	phy = _of_phy_get_with_args(&args);
+	if (IS_ERR(phy))
+		goto out_unlock;
+
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
+
+	get_device(&phy->dev);
+
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288ae..71c2e16397130 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 				     const char *con_id);
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
+struct phy *phy_get_by_of_node(struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

