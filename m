Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D23B6C14
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695537; cv=none; b=WPHAN0vJHCVVq36hb7O+UC1lspRqBtoizrfimh5l/UBxEazCnQjf3APU/n8yO83ZUjBDsUBm/C0uZnOcgsxUZGEgCs3jv0SKWNUQf41GROnLA4z8Q3uoi7UAm0EN4VOZh1Ly/2Uf6yEaybNGUWgpQnE1wjGaxMhdI5KQR/080H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695537; c=relaxed/simple;
	bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seUV4JFXAC75Q3gABh9miqmJf2DRjrQX/mnp2mqVxVroipM2cWQGiWb+VZGJ+ivFlQTVNAX02dzacS5pw2kuI6W9nMeLthSMyHesV2wBPLrZmqUxRZja35TLwk4LVpgCXnP2x86fNfuNHzMw2mjx5yDvqiONH+DfDUV5yNYYOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SemddJEn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SemddJEn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso22216885e9.3
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788695531; x=1789300331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=SemddJEnqylYjNeUkzPkpYmIvbMYWjGdDWNGvIcrvtPWlIgPVIWJq1vez5kmK/TaSo
         NEIgACU/bSXVlZpLlXxRHfxZCQSIt6llnj5N7YTw6deSoLtktSw1BLJR6tEDXlkbmKTY
         jiXiuisGfNXrQ9DetQUm15Q1l6SPHtEHSXB1MKMrg5Zmax3qK8qK36EhkGGPvetQmi+E
         sYUFPVFBnS0Cotq+qXTqAHIDaWl9LTIwFvwTs9BY6pGCS2MVnDjF2GLlc4nEpOCkOH2L
         xCBp8vF4nrxCLMdHol+4mQ0oBUIRkuSQCOpR8QDZsJgSAEu8WqgSIgof1JovL3pt+OBY
         zN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788695531; x=1789300331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=EpmkuNidbagkbZKEGwv4UVzSP9Dc+KoEpp1ngRAcKq4iyYvy6D35QNGl6Bd54QKoRg
         GYxx+er0Y4I8F66KvSCNy5TZyvSyE0QRpqyeq0g9KXJZXzeCD6X/k9BH2GIhm2s0Nu4o
         UqxXmea6zVkQrNhNIbb82JeaGD0ioRmls9SMQZUhwd4feoGDhme//U5ZsvQi49QECE9a
         tnzeIYxwcbaztSkg7kvZIfj50DrTcC3747BFLdEHqK2MiKHRSMEdxGLYr5M6reZK/fr0
         /UcZ1r0fsZfPY1Bwpk5IEQUYyufZVDj5ArXDb7zpwEyeThF8nJj+oZFhHWcfGeFK5BMr
         gebA==
X-Forwarded-Encrypted: i=1; AKwUvBzGdYCpxu68m/VDybgtvIW3RsLVR0Pg+6wc9KoI2Hs7yrk3DwppASY+8MHqNVutYVhhyJzLemmJrV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nnSVkEgNeAKbgYEVnpxthz7UeKdmjZvXALDWVW/V9tWR04nZNc
	Zwpqvz3OhjGQ606na86BYcWMk2KWxrwNyp4tkGgt2yKJdWxVh94ILkUuAeZ/VQ/i7vo=
X-Gm-Gg: AYBFou02j3ym4gf12L320k6DiMu18TA2NCFLbOP6mXct9ph3NuaZrPH8SErq50XpDgk
	3R0zrgW0nElchLkkzlkFMplIkbkmMXdtuIjE/Cy4vtKMLE2ZPAWCJD+8Rcz6lrBgdtUGcKdW8BN
	DbJugKFpt5/pNHVbQIyHzBSS4xwPWmMTt1gTLWNdb9MZGhnSI1cXq3mGRK8VyiSdaztAgHqWGt8
	WTixiPEGGAuwjhMmgLaoXlWah1Sked+xYis7UUtlQWPytjq17GzBKsI1lj9iOow002n3/id6Wyg
	FxgFVoQ4ry67pEySPpAlayncBa0dscnBdBVK8+iKzw3ut9dx5cxXgkSUu5HLS5mQ3vYVief6DcM
	GjdIngxoVXgKdrJBWhIxZNN/oJwsYp1HPO68c6MryvK1gw7ZW0kaC5B7g5YKMtXwCBUMDZG2NSz
	5R+nSHHyyugfuc9JZ1dYhFUjRu943pURo894wIS6RLeGB+pLChXaFNCDs9Vyd51cQ/iJy9OTXAY
	g==
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49cf8244260mr167551925e9.10.1788695530692;
        Sun, 06 Sep 2026 04:52:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm19337821f8f.3.2026.09.06.04.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:52:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 12:52:03 +0100
Subject: [PATCH v16 2/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-2-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnVPk6Z4QLozQ0/xd0w0EjWqBUNZ8L2r/JFgTh
 /1GqiOxcO6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap1T5AAKCRAicTuzoY3I
 OnKFD/0V42uUIs8WXy0vyaESKTs53Yy+MFBwAjiwXBm8hulnaRoK657x/bgARJNZ7RQDpMrgO7X
 JmipAQVSr8XVfcwCTLzZfPvoE6SBWxZkdgNP2TME6qUhK9YsuhQysEjUCavha4SaCdseYM1dpKE
 P2mbKNbq9r+I6uLajGNnVk9h07c6JJ5A0/CJJ3rtJTsm4/hSxGsGqUY7gwXGHDKqyQm8LGtjn64
 g9xud4ulCGHhpytkNUjKaHJQ9WsU6pf7XPkP7OiHrvx6iMv53A3jJwNCdukeZFhV3uBEq6kWFmR
 jhxXe0Z4CJ8GXdewjX3e+eCQUK8ActlBeBUf+FeKFUYoBwk9sW/TEswV+9KxjHhBJ5hV7Vbx96D
 p0BOF/MUqUTZUz1s5ESC7/+QaqV0eVNHUhwwQOvj3Ddc29laWdgzD+kliHsFpz2vMzHxaseR5Wx
 Bx5Cj90iMjuLYmsoS/SCQtsd6UepCeodVn68UCEUApITKPAbv1A9QQnaE2SCd+A1gUlH1U2VwDY
 Zg9LUiUTYUTRalJiZNyaD6dvMQuF2G+Iyc8qz6Nkf/OmyCQz6rvZ3pW9qaSD0DGN9xB2745hnwJ
 Y5xLYlWTlRzJjmJSGFSEzg2hnzCASsZ/UZ+QISTxgfg8WjXeMPcc129BPyCbnPDk/lU6ri1Nc3q
 LzWDbMy+je+BPXA==
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

