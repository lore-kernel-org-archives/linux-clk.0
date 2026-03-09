Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8792C15AB
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075854; cv=none; b=eicM30J6QotD++4gVRhloJNUQICq3u1d8ObmVijXbUawOps6G1sGQA7YtGBNQ2TtHrf1P60I2AFTbVM3JUcEkU0sdunZegA6TmM5BxdxLCxWy0AFp8cYr9EW4qJifX55scWmTe8lcXV9Bz7KaLSWjxcVNVz1qMGmagKJfcGA2so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075854; c=relaxed/simple;
	bh=IalBsRFpE5x5/xFaVHrbb4x+6gUF1qCnEMvJ6Qfnoas=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XlyUbOrogP4V0BHPxvX0Phjg3iYU2pgIaiPPu3MeO/K4mHptTuFL00XqTCftmIc9Ya8FOWp/2bbcQv3RV/JNRJ0p8QYbOkWoZ8PG5OarOMxJ3eRam6oyynhMJCdeKvTxLRdtFRH1sEmx89yst8BPZ7wEHm61O8UfhIXZdyp1pfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inLTl2t0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inLTl2t0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c6fc2910so4092932f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075850; x=1773680650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pR5q5r3Mes7TJAyUzECgg8kfuz01nC9/URwKM/qNQHw=;
        b=inLTl2t0adVHlFsNLFOyYc6KwwSqajwuQr5apUbnnM9ZpgpjSXeSpDUF2+7CC2KBsO
         Q0mKWCcFWlNPyALGIfoCm15bMgrliDvbqH3ZlJRbquSinVlPiRn6O9wEuwm/fF2wz/3i
         5rXZTJkBy6fFXQensOsSDqx/yhrlG7kaFI5kFcw57dPcBudTD/guE/4vw7weMjKLD2SS
         cn1uregf8biES+SB2Y2/GZZVPU4oKrtHDOvc9Z+BJbIeSqv1E7lr2nW1sXShkM6IhWVK
         ux5KOu3gBPIoPtJ72bwXr2sMNYOiKaDEvjD0Wts27QEfCq6XnkbUJKqxx7V5wOiUK9Mb
         PtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075850; x=1773680650;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pR5q5r3Mes7TJAyUzECgg8kfuz01nC9/URwKM/qNQHw=;
        b=GhELjwU0f2Jjf6fDQI3xekbb25dH3fMSwVhICGpUxhAFFHnezB1x9605aaG3L5ijm8
         Zkub1WZLWX49gIeS4Ex6x8LfBiD2vsR1DPlWeqzRvvQ83TFiodBzOD7Pjj7ZPnEk/5G0
         nSPniWQd2MfUsgOdy0zEhq825RCEkvaKGgpZ8ymm5pvqHQAz3MSt70y+U0PNNmZch4y9
         OTFY/0bU5KZhqRM0TCk+TG1OAGgP6DL1x43/vNLwGekKIRQzPRQacnb2pmAMwO4wJG99
         xDV1LKZHgVZrCJXXWav4nayMylu5cqt5cPn6+WY6V0vc/f4jp3wbnNes1cK6BcH7ZJfr
         tNNA==
X-Forwarded-Encrypted: i=1; AJvYcCVOJEL0jrTKKMOMnFkgZHaLVR4OiRfy+GOcDSR13tteGFPZQ8iBtGN6CxUobcwVveXsobJeRH5pKeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR4BsS6XQYSqIIOV2tLDosQ7CrC5D8DfgB7lHLWknWbQErL+jk
	MpBGdzf9/+ccbhozcPGLzu5suifK9K4NxZaiyqW3rQDTaoRBKSxI4Gtg
X-Gm-Gg: ATEYQzzzU1TsW4dWUUOeoVgil9Fr/tuGHYSKO1v8AE5qeWpmHZB16F1KLPRRxgLjUyI
	bCjXR+daJuONe53t6yHsZOMnBM1WZ/GIKxPpde+jgHSPiw3XbeTJUQa1ZId4N97uKA3xqmm9pP3
	PcDwOifTSgN79TX8h9SlwHDqD5WSi23/6nFKOdxyT3VEvjJffeQjJmHRBeFtaeKZ1jrsbO4KsWx
	SoTErt/3mNCfUUd680WcO+hBSVKqXk1dib+rYtZdaMuM9d0TBmFjZ37lrOBJFwD9Aj2CtBDbHCL
	Vg0VlWYdxmPtVbAn/lDrn62UBR3AhLVUC6cKg52UZnBZGYZzWLSi1jUjMCCkVB2Zq18wLoyrY7t
	P5g6jWw1+hR0DMRqbuNVztiZQYcSRr+h7tE15+FdTVGGDWc6+KSLkBbG0hqmkc/p5LwL7jgV8L5
	+4Rrq+ZYDivzXWXWChPZOxVNbkdrKN/t0bEsaX8IF689lEZWabZgoUoPlwf84HO07SZwr/k3Cya
	6eyh5V3SiE5fuI3Lp0TDglkhnnxIiAIU5lrarltsNwb6TUAJ9uo6pf+uqUzSQQ=
X-Received: by 2002:a05:6000:2482:b0:439:ad2d:99f1 with SMTP id ffacd0b85a97d-439da86ed01mr19072989f8f.54.1773075849398;
        Mon, 09 Mar 2026 10:04:09 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d? (p200300ea8f46ce0005f97f3c5f9a2a3d.dip0.t-ipconnect.de. [2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm26937481f8f.6.2026.03.09.10.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:04:09 -0700 (PDT)
Message-ID: <b6161c64-68ac-4524-82ec-5b7d81b86dbc@gmail.com>
Date: Mon, 9 Mar 2026 18:04:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 3/5] net: phy: move (of_)mdio_find_bus to
 mdio_bus_provider.c
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
Content-Language: en-US
In-Reply-To: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Functionality outside libphy shouldn't access mdio_bus_class directly.
So move both functions to the provider side. This is a step towards
making mdio_bus_class private to libphy.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_bus.c          | 44 -----------------------------
 drivers/net/phy/mdio_bus_provider.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index a30c679feec..c9a495390d2 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -276,50 +276,6 @@ const struct class mdio_bus_class = {
 };
 EXPORT_SYMBOL_GPL(mdio_bus_class);
 
-/**
- * mdio_find_bus - Given the name of a mdiobus, find the mii_bus.
- * @mdio_name: The name of a mdiobus.
- *
- * Return: a reference to the mii_bus, or NULL if none found. The
- * embedded struct device will have its reference count incremented,
- * and this must be put_deviced'ed once the bus is finished with.
- */
-struct mii_bus *mdio_find_bus(const char *mdio_name)
-{
-	struct device *d;
-
-	d = class_find_device_by_name(&mdio_bus_class, mdio_name);
-	return d ? to_mii_bus(d) : NULL;
-}
-EXPORT_SYMBOL(mdio_find_bus);
-
-#if IS_ENABLED(CONFIG_OF_MDIO)
-/**
- * of_mdio_find_bus - Given an mii_bus node, find the mii_bus.
- * @mdio_bus_np: Pointer to the mii_bus.
- *
- * Return: a reference to the mii_bus, or NULL if none found. The
- * embedded struct device will have its reference count incremented,
- * and this must be put once the bus is finished with.
- *
- * Because the association of a device_node and mii_bus is made via
- * of_mdiobus_register(), the mii_bus cannot be found before it is
- * registered with of_mdiobus_register().
- *
- */
-struct mii_bus *of_mdio_find_bus(struct device_node *mdio_bus_np)
-{
-	struct device *d;
-
-	if (!mdio_bus_np)
-		return NULL;
-
-	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
-	return d ? to_mii_bus(d) : NULL;
-}
-EXPORT_SYMBOL(of_mdio_find_bus);
-#endif
-
 static void mdiobus_stats_acct(struct mdio_bus_stats *stats, bool op, int ret)
 {
 	preempt_disable();
diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus_provider.c
index 4b063740574..d50fe6eb4b0 100644
--- a/drivers/net/phy/mdio_bus_provider.c
+++ b/drivers/net/phy/mdio_bus_provider.c
@@ -440,3 +440,47 @@ void mdiobus_free(struct mii_bus *bus)
 	put_device(&bus->dev);
 }
 EXPORT_SYMBOL(mdiobus_free);
+
+/**
+ * mdio_find_bus - Given the name of a mdiobus, find the mii_bus.
+ * @mdio_name: The name of a mdiobus.
+ *
+ * Return: a reference to the mii_bus, or NULL if none found. The
+ * embedded struct device will have its reference count incremented,
+ * and this must be put_deviced'ed once the bus is finished with.
+ */
+struct mii_bus *mdio_find_bus(const char *mdio_name)
+{
+	struct device *d;
+
+	d = class_find_device_by_name(&mdio_bus_class, mdio_name);
+	return d ? to_mii_bus(d) : NULL;
+}
+EXPORT_SYMBOL(mdio_find_bus);
+
+#if IS_ENABLED(CONFIG_OF_MDIO)
+/**
+ * of_mdio_find_bus - Given an mii_bus node, find the mii_bus.
+ * @mdio_bus_np: Pointer to the mii_bus.
+ *
+ * Return: a reference to the mii_bus, or NULL if none found. The
+ * embedded struct device will have its reference count incremented,
+ * and this must be put once the bus is finished with.
+ *
+ * Because the association of a device_node and mii_bus is made via
+ * of_mdiobus_register(), the mii_bus cannot be found before it is
+ * registered with of_mdiobus_register().
+ *
+ */
+struct mii_bus *of_mdio_find_bus(struct device_node *mdio_bus_np)
+{
+	struct device *d;
+
+	if (!mdio_bus_np)
+		return NULL;
+
+	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
+	return d ? to_mii_bus(d) : NULL;
+}
+EXPORT_SYMBOL(of_mdio_find_bus);
+#endif
-- 
2.53.0


