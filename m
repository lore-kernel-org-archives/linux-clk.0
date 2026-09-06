Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240CA3D9DC8
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704242; cv=none; b=LS6qvNQ+t0lKY05ybx5rkK8rKR9W+rTPcYykKaMYsNgrlf9MDpE8CWdjT7Gz08oQWwmIQw0H1ZWJ7wLB2u3aiPYVil3fHjAvlU9cnQD3Czlpt79NfcWE6iGcPUhHtZyPmTF9+ANvdji3C46kM55HI4CocVGNbZytozoYplPCZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704242; c=relaxed/simple;
	bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRfILe8weAqHia+i2ltyQaSnTfdiHnj/nx3kIOwpNSXZE3nXKBJCxUfsDxIeWDnsZJhADMEhBHchSzE2UnrG1WLxrUfOyEtwhQ+eqZWc+e2h3F+kAxY0OilCDOCqharRMFeKNibQN6OyuR49pXpID8WibPze95K2alc1cReQI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ejA8hSTa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejA8hSTa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4858303de5dso3168383f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704238; x=1789309038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=ejA8hSTa496+Gf3ZmfZYiLbruB9/3+Zfjhl/1guGm185otDrSDZCAfjWawM9VZ+zcR
         oq3Kk0fvViUbzMDNQC9f8gdvmk7nmUPfmbkvhKb7/Ka7F82g2mhx6nXzuGnOQIZLHgGB
         BmoJ7Xbh34RrQyTPs5dH6X6TtHzNJ7Rswjii6yLHb+C5o6XMlF5i3FWIYCytMsvzFfLB
         kH1pofXZYECXUTdNvpyRwf4OhawWlVGQcl0iw65vGoOe30M80DH62wx/OGJTzFWg3qZz
         5qCdxZoBtYOSGIR9dx8JSswgXIc8ES96N8f57axgYc6EgV2MdLczRIlhSi4CrFY6tMl2
         dp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704238; x=1789309038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=WjIo0p6Jog/pRsHJxYkVOgABGChXXq1no1S6Y3NAzmGpojvPZ5ub89oWIR4n5qkr8G
         sTg+26deHFROoazbV2zX2pmzcKoWOcwfkOPqq9d0XEuzh29Mz2kg2WQN74ofn63EL3Pl
         pq98Quuxwz/M1tVZkL1t95SKENoVU2v7DU/uXC9tWu9qFe09NwhTYOe2nKxrvRlRObvM
         K/VDwLw2Vl0CruSyKttXgsAhEgMLHjZrvYNiVMP2t7xyEBvdMIRtz/UVKQ6SvDCIG9GS
         5VXA4qLWahDJzRn83TyNLOt5BIEukLFjgAaSXXBos0c2gzCXBviRPBmjAkoAklYCxAF7
         ubEw==
X-Forwarded-Encrypted: i=1; AKwUvBxIk/vxEWWXHeAameX/UhekyfXZwchaC57ToplVnrXPJXZgncNiucbFTHMk8P6ZrllhJFOCkkRFFu4=@vger.kernel.org
X-Gm-Message-State: AFuF++netjniWRxtpCkSbWrVYOG630wIok/0BDkHGGVc5yN9/HCeYT/I
	297kAWXzS9otCdJN8E85BLYdj6EYaWgtwwgchI82TtgMhyeGRL8/ZX0oqW5ZQ0yqxOU=
X-Gm-Gg: AYBFou1HFobEaKNQ9U+ElASdTzSyYb9UfF8iZC2B3ONKDJ+V004rv8DEROV8lT30RMb
	e+eSatyiByzHnEIZwsynooNqE0fkoBhvSNakqI3J9TkGyKYZFXnw9z59Zz/lZVOov8YCKHnjuRp
	6cBdMRO8PuogJg8KUcWJ84nFNETutiwS6VLh2S8XDkYxGt7BZuGwZnHnMrF81xn/YWTv54swnsb
	umZKZQZoJxYegLoBs8xg0h38E7i9xQGkek6eKoCcgG0tOucVT7iPOZP18fp32Vyc/l4qxjhc4gr
	k5kV0sFzhOzgOuwYDMAxKx1Ld9m5JcNy3zBblh/JDmdogcf0PmJa6OpufXxULLvVblM95NB5kF8
	5Zy//sHkzLH9ZUr2d+n8Wk1/PVSHrNBWu/0X436YBQcq/K4Ab85xrAYHrmeAintE4yN9sQxEK0W
	MM53iRQM0cpBvwEvVt2CrAmTt5mq3edQ7X/phXueaD8MocWsuzp42L89beAzWU/7gvzpPyvw6W
X-Received: by 2002:a05:6000:288e:b0:485:8c16:a33f with SMTP id ffacd0b85a97d-4858c16a5d0mr15303316f8f.52.1788704237969;
        Sun, 06 Sep 2026 07:17:17 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm21669763f8f.7.2026.09.06.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:17:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:17:06 +0100
Subject: [PATCH v17 2/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5277;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXXnDSGHKwKTESqqDCOzytTAZZJRnV69xpAvH
 JPy2g1Mp3CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap115wAKCRAicTuzoY3I
 OphMD/0QQhIpf3hL1zoUSontuG9Asjf87QOcmpl33UcLPb/2dC+pgdjGNqTuw4/BVYHdyyVmmhs
 tI7fOu1gmTrHTFsKb4Soyx1SNf8MRPBLIYDnUMOJqwOtPkWna6chShd/S5JXAwUCWp+XN+QbbNO
 ToDneWwCAEw5J013xX9sdunn6QeI3RZcDzOYYDLUAhk/Mr+q4rNlV1uVnLVkMPJoVmrsEEoq+Zu
 UQcN4V4RwyKb8tN6HkcYtnie6YEvuuAfTT7P7O5zg0uAUGyFLj7ToF2wgTYu6t3VsjaCjdHpkOX
 AULqXQ7aUSxqfmWUMdytonNfm4gSSjKtMhnW9YPM5DDe3O1DxuOhoB1wHILuAUURy59tIOfrgdA
 RGr2yg1yB2Igz4PPrZGgJrfHFRKzEqixnU6L1d2RUbpBQpgZie9VKn4Hjk4grMq1oFUL9ZgavwQ
 gaeM3OipCV+Ziw8U+LuPWY23LzqI5b7uLwHr3Z4toV40P0kn0+5rljJsCihkeAlgZWXiAhV/v+q
 5HTVZ1A4EKKZLJUo0RfRlOu791SODL+bwM4neUCs+SPNW6fBLHYoyz9wkBnKfHT2vzZ2MSfiD3k
 g6JLkChI7RqSAgNDasCJ3ZmBd9nWV/pXKYmjMv6wZl0r+aKPzChhX09eZOJ9pi7k12bNfiE89Ks
 35FPHPmWjhZLygA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 95 +++++++++++++++++++++++++++++++++++++------------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 78 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..490a7cde6d40a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,22 +606,51 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
+ * @args: of_phandle_args to the phy
+ *
+ * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
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
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
- * after getting a refcount to it or -ENODEV if there is no such phy or
- * -EPROBE_DEFER if there is a phandle to the phy, but the device is
- * not yet loaded. This function uses of_xlate call back function provided
- * while registering the phy_provider to find the phy instance.
+ * Returns the phy associated with the given phandle value after getting
+ * a refcount to it; -ENODEV if there is no such phy or the phy is
+ * disabled; -EPROBE_DEFER if the phy provider is not yet available.
  */
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +666,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
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
@@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
+ * @np: node containing the phy
+ *
+ * Returns the phy associated with the device node or ERR_PTR.
+ */
+struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	struct of_phandle_args args = { .np = np, .args_count = 0 };
+	struct phy *phy;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&phy_provider_mutex);
+
+	phy = _of_phy_get_with_args(&args);
+
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

