Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE3829ACD1
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075764; cv=none; b=rzzTcVNkJhwZDN+KOfwih/wOVQ6N6lwyHBvyNGGbjL8bw1ZKfaInx5tX65+fo7eILSdZW0hY/zHsaFD/YJXAgO+jR4oQJ44NqVcBJLyMPPjICGNr81FOH4WPEnXlC5mo56h+h7yizPNiGZJGz9Do7YtqBxLaMw00rL1gnLQuekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075764; c=relaxed/simple;
	bh=THA3bSVQzv73wv2LgwqQEn2CkXKfTFif1AVKB23g0Uc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=X5RLdooXNSCMT35TDj6EzWMkR1m4KcK60Vts9DP5/oapgX2/cJBpI6wrYjtQJ198/Rd8o2cpR3nciNwMsIINRmiZSbFZLWNtlv5bxnv5GATu0kB2vuho+z1m1NKoEAPWM50pqzY3nvWCO186n76XaKFiugzGozgY+kAPuoSTsHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6+tR9FP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6+tR9FP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so23823685e9.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075761; x=1773680561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D3yVBrm0NO/kyrzRjsGOfgFPVCo6bv+SX/DHuerXF6U=;
        b=G6+tR9FPfBiGoF9CdAI4+Zh6kAkcG/QMRUoKI3s7cSTDZuU/Cl8bTZBERPGh4G8Oq+
         eqRrBwICvug+mbLsVxx2pDjupDyLhQpx+bDaYnNDRYWT+TEzNYyJdPdlz7n5E/n8B2nZ
         1mR7igbX1Pu1p6T7RZdgqt57IlrGswjpXZB4erz9tbfgjwNUvDtKJAxNkbbUtuMXB29T
         8YPbjw0NHZbYoMe+Us2BPvpDxik204vxm3Zeq6xCI8Ftg9PDq2Kvj6/U6D7ZBCqg942l
         VAV+X00UvXv6/9eH/yDWsgFZ3Ra3m/Jj6VWsMwcavrc3dV9/hnJqwe7F0vfxDfhIHhGm
         bqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075761; x=1773680561;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3yVBrm0NO/kyrzRjsGOfgFPVCo6bv+SX/DHuerXF6U=;
        b=fnnPdgpx+p0VZzH2hsIeK7xWD2+bXB2yiLdPMU4iQdgdmReDntcfkFOKAS+tqu2REa
         X5aKPJClZrDwBUZvwOAdsdT9/v0IcM3JwnJ002eAk0ZrIsTaevFre1p11v7MLMb8ZuqG
         9v6A5v69zEBWeg98TAbt6zlOdGwVG9FTbAUlaqHZv1M63l9VxXx1zmYTP0uUOZxWpAIj
         3l1/EEUc68wzle64bdHyXxkZmpc6n0kKxVK1/V8sLg6gvD/FSW94BQ+of1CHOzmcyGzT
         Qjdji/KHuet4YS6ix1az/hmmED+tOwKvwIYbOOk293GgyMuXYC9fQT8LRjDxKAGpdnuG
         4DpA==
X-Forwarded-Encrypted: i=1; AJvYcCV/NYYOlPITLd0wnHXW6w+e/uyPUYUn7jn5FrRLD5CBBhaW5Yr21F5NYL6RDj4TEkkvsdN+taGJh8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFUMSjI26KggKkF5I7zvLDr/tipZ0jxAlzVpBsMRuA6NmqhmK0
	1RV4Q7+3Ssh5E+sYwj5N8+HBv1/KGZ+G5tMwa3Lje83swjmw3aKAgmLg
X-Gm-Gg: ATEYQzxj9qG3vKPyhw5qSXalqg+Ow8pqtbR/N5kNTjISBb+AuTrd1CVWd3tAlNtegfy
	7hdfxLJirJnsDYTdNE01xcxT6iLq70gDwu+T6eHZTBwd1b6Qlb9QsOxVrUDQlbVMlDE8JPIdX2R
	L1IItm6/C6SSGcC4cryEw9+pflID6XEYekKBWWTYktVrOA0St3yg2+ZB72RPseUyFdZy1rsZlgC
	qE+84hBsvqD84AK//PjnQ9RJJRlH0nZZ0N8fh/ObfJ/F3b3t/yEpXARFtSlIMQTdnuLFgo6mZrL
	YtneUJC58qDEidJuW3vFyNnD08xDNTuc9WyrflfH4kMhGDuRKZWvVVL5UP51VnNmzp6BfxdJ2jS
	3miJKW0791xMWluJn1KmHqwhOVFmNMeDCXvOhUtSa/V8tDneXDRPInKdTCcz8j8NAmdj7hDKHcR
	I6wPtXaFstcv2R4L2282dzErraOMbZKTauk1ifHfmBRb48x9DVnHo16h128CgwHnZwZxQ6pOXnB
	SPybPbHUTc70pnHrqRHUtF48ZrcQa1fbC8R7LKKHnjz6ixf+T4Kd1n/TynCy4W+8IuSsNdfqw==
X-Received: by 2002:a05:600c:3b0c:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-485269188admr199557965e9.5.1773075760400;
        Mon, 09 Mar 2026 10:02:40 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d? (p200300ea8f46ce0005f97f3c5f9a2a3d.dip0.t-ipconnect.de. [2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aacd81sm4246225e9.14.2026.03.09.10.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:02:40 -0700 (PDT)
Message-ID: <8ea1a929-33b8-49ee-afe6-355f5a7d2bd1@gmail.com>
Date: Mon, 9 Mar 2026 18:02:38 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 1/5] net: phy: move mdio_device reset handling
 functions in the code
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

In preparation of a follow-up patch this moves reset-related functions
in the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_device.c | 162 +++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index b8a5a183819..da4fb7484c7 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -24,6 +24,87 @@
 #include <linux/property.h>
 #include "mdio-private.h"
 
+/**
+ * mdio_device_register_reset - Read and initialize the reset properties of
+ *				an mdio device
+ * @mdiodev: mdio_device structure
+ *
+ * Return: Zero if successful, negative error code on failure
+ */
+int mdio_device_register_reset(struct mdio_device *mdiodev)
+{
+	struct reset_control *reset;
+
+	/* Deassert the optional reset signal */
+	mdiodev->reset_gpio = gpiod_get_optional(&mdiodev->dev,
+						 "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(mdiodev->reset_gpio))
+		return PTR_ERR(mdiodev->reset_gpio);
+
+	if (mdiodev->reset_gpio)
+		gpiod_set_consumer_name(mdiodev->reset_gpio, "PHY reset");
+
+	reset = reset_control_get_optional_exclusive(&mdiodev->dev, "phy");
+	if (IS_ERR(reset)) {
+		gpiod_put(mdiodev->reset_gpio);
+		mdiodev->reset_gpio = NULL;
+		return PTR_ERR(reset);
+	}
+
+	mdiodev->reset_ctrl = reset;
+
+	/* Read optional firmware properties */
+	device_property_read_u32(&mdiodev->dev, "reset-assert-us",
+				 &mdiodev->reset_assert_delay);
+	device_property_read_u32(&mdiodev->dev, "reset-deassert-us",
+				 &mdiodev->reset_deassert_delay);
+
+	return 0;
+}
+
+/**
+ * mdio_device_unregister_reset - uninitialize the reset properties of
+ *				  an mdio device
+ * @mdiodev: mdio_device structure
+ */
+void mdio_device_unregister_reset(struct mdio_device *mdiodev)
+{
+	gpiod_put(mdiodev->reset_gpio);
+	mdiodev->reset_gpio = NULL;
+	reset_control_put(mdiodev->reset_ctrl);
+	mdiodev->reset_ctrl = NULL;
+	mdiodev->reset_assert_delay = 0;
+	mdiodev->reset_deassert_delay = 0;
+}
+
+void mdio_device_reset(struct mdio_device *mdiodev, int value)
+{
+	unsigned int d;
+
+	if (!mdiodev->reset_gpio && !mdiodev->reset_ctrl)
+		return;
+
+	if (mdiodev->reset_state == value)
+		return;
+
+	if (mdiodev->reset_gpio)
+		gpiod_set_value_cansleep(mdiodev->reset_gpio, value);
+
+	if (mdiodev->reset_ctrl) {
+		if (value)
+			reset_control_assert(mdiodev->reset_ctrl);
+		else
+			reset_control_deassert(mdiodev->reset_ctrl);
+	}
+
+	d = value ? mdiodev->reset_assert_delay : mdiodev->reset_deassert_delay;
+	if (d)
+		fsleep(d);
+
+	mdiodev->reset_state = value;
+}
+EXPORT_SYMBOL(mdio_device_reset);
+
 void mdio_device_free(struct mdio_device *mdiodev)
 {
 	put_device(&mdiodev->dev);
@@ -108,87 +189,6 @@ void mdio_device_remove(struct mdio_device *mdiodev)
 }
 EXPORT_SYMBOL(mdio_device_remove);
 
-/**
- * mdio_device_register_reset - Read and initialize the reset properties of
- *				an mdio device
- * @mdiodev: mdio_device structure
- *
- * Return: Zero if successful, negative error code on failure
- */
-int mdio_device_register_reset(struct mdio_device *mdiodev)
-{
-	struct reset_control *reset;
-
-	/* Deassert the optional reset signal */
-	mdiodev->reset_gpio = gpiod_get_optional(&mdiodev->dev,
-						 "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(mdiodev->reset_gpio))
-		return PTR_ERR(mdiodev->reset_gpio);
-
-	if (mdiodev->reset_gpio)
-		gpiod_set_consumer_name(mdiodev->reset_gpio, "PHY reset");
-
-	reset = reset_control_get_optional_exclusive(&mdiodev->dev, "phy");
-	if (IS_ERR(reset)) {
-		gpiod_put(mdiodev->reset_gpio);
-		mdiodev->reset_gpio = NULL;
-		return PTR_ERR(reset);
-	}
-
-	mdiodev->reset_ctrl = reset;
-
-	/* Read optional firmware properties */
-	device_property_read_u32(&mdiodev->dev, "reset-assert-us",
-				 &mdiodev->reset_assert_delay);
-	device_property_read_u32(&mdiodev->dev, "reset-deassert-us",
-				 &mdiodev->reset_deassert_delay);
-
-	return 0;
-}
-
-/**
- * mdio_device_unregister_reset - uninitialize the reset properties of
- *				  an mdio device
- * @mdiodev: mdio_device structure
- */
-void mdio_device_unregister_reset(struct mdio_device *mdiodev)
-{
-	gpiod_put(mdiodev->reset_gpio);
-	mdiodev->reset_gpio = NULL;
-	reset_control_put(mdiodev->reset_ctrl);
-	mdiodev->reset_ctrl = NULL;
-	mdiodev->reset_assert_delay = 0;
-	mdiodev->reset_deassert_delay = 0;
-}
-
-void mdio_device_reset(struct mdio_device *mdiodev, int value)
-{
-	unsigned int d;
-
-	if (!mdiodev->reset_gpio && !mdiodev->reset_ctrl)
-		return;
-
-	if (mdiodev->reset_state == value)
-		return;
-
-	if (mdiodev->reset_gpio)
-		gpiod_set_value_cansleep(mdiodev->reset_gpio, value);
-
-	if (mdiodev->reset_ctrl) {
-		if (value)
-			reset_control_assert(mdiodev->reset_ctrl);
-		else
-			reset_control_deassert(mdiodev->reset_ctrl);
-	}
-
-	d = value ? mdiodev->reset_assert_delay : mdiodev->reset_deassert_delay;
-	if (d)
-		fsleep(d);
-
-	mdiodev->reset_state = value;
-}
-EXPORT_SYMBOL(mdio_device_reset);
-
 /**
  * mdio_probe - probe an MDIO device
  * @dev: device to probe
-- 
2.53.0


