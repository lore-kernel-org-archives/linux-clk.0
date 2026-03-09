Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0063A9DAD
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075893; cv=none; b=epLYzJeuw6tI1NufkHxIw6/xtsnAinKZNg1R5Pi3lNJyxT4uAb8FN32FfDSI13gQyQeXRxpHj2zmfH/sYp3iGhP7fH6VMB1cvl24YlB1RQvU4Fo3ndAJQIQa1AtQqKtaCiGdqJqLodaA8lN/+emE+nJlJzolydoK+7EKOh2pHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075893; c=relaxed/simple;
	bh=/dIZrM5IUttYsSyyQTMorm0yElUCp9TuGSDmE5kDcdU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nu73oqvtDIwCOpdR0IOjfNHSrChlZ4f7i0ygCwXX/4MeXU4DeF4Gs5VEkv4KOgM7NpqXraPz8F1cFGXS7zyW6h/PbjLve4W717fxLkny+Oyi8pXPcY7MgkhWz3pnnU7mRaji3JTCmYhJ0dPlUroYeTGAK3wx0dSqLfWozhbceAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVuu04LI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVuu04LI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso4884095e9.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075888; x=1773680688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EjqtMmTP6qLcmK14ISsOFqL48TISXYv0ejZVuQlmDiE=;
        b=KVuu04LIzBcrXS8Qv2YGmaAZKHlNy/Pw/EBzYhuFrf43rd0oesqY0zbpHtY6OERqqG
         HWr8R15kFzUjuaYfq+mhKk4ULaisDyx/xn/GyC7f+Fc8vhWJOK/brMzRJ9z+0bVYaKsb
         LchZaUJHepnJZVTKnD9lxawN3EKEQHQ36tizAvHkx5sfYX3b8sKnjW8MqH92Wk4TuEiq
         Fk7UoHw0TW9NChdRNnVEs5/X2Q/P2dnD4gso3iiFJt6QWghaPWU/SYvjxU7ywKCwyWr0
         ge6CutE7K1zS4kyiIYOaNnBs4Fbqi+5/S+zMNSiYjEkE5DSDcfTgBDHMyzwryt49mcME
         KMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075888; x=1773680688;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjqtMmTP6qLcmK14ISsOFqL48TISXYv0ejZVuQlmDiE=;
        b=oo4sLeHv0LE4F1cTjHw5T4QOy2Z2zCZhO8hnLsRCO54dJ3Fg8QnYj0GwITodUl3DEJ
         diW1/1Ldfunl8vLRtAgW3DbXBTyOyzwEn6ErI9syz/IDODfVymZN838xSgdrawcOdecC
         SHshOS960OupGfkM6g3YDBN8WVldb3UThnfrYSB2XDuZ25SoBec38ZujUlgsOKOCPjMs
         YNwbJVmUsF/CgOmwj7nNrV7XnhiBMDYcRAT62hzbONqpWvJGi5uI9UOHDzrhpHX712EC
         E3hNtl3aCcCDD1/lGYD2d7TIFFVBQ85gBTdieABXfawH8T5Pdm5EqVCDnHxdKnmhdQy6
         N7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8nxPE9obrGnR87Q7wyYLNy48ceWJCBjaMqlVX7/ivNmZPMW8c6jZ2i3CDpYLHwUfqerbcymo5F8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1VM8QzVZvPzQWO2jtFlLWPLQqEEEPYoSW9WSJpCWZKIYf3Ql
	eCt6lxHkUKl/UmiLvHCdDc+X7RIDs6vatMWQyE3Ha0Thg7tqZqUeH8ZJ
X-Gm-Gg: ATEYQzz2M3O2RlO9u09jQJY6MtPTHdm9VHddKuNs3EEScp84dJXSEQ2Rzfdk6qATOgW
	7iJeV3EiRfPON6yBkzN6m0k8cgdHUJubJvYh+i1EKFLBVZltk6wXa7sAo46/7AnjvvHQzB1q0hJ
	+A6PFT/SNHtx6fc/VBrOOWhini3+68b3XmQF82IodEY7cjuzfz2FGgWHfrlryGCD3ZwNPuP/Quv
	WEeuhxZT+phEG0ddO+O80co1dDjEzaos8NQhZxWInywrvJTiTdlm1n6sgd8CLk8ksbjxKPTkUWW
	RP1KLDn8nHMSuj308aTznNU6Ge9fVaIx3RSjF9wAzdBFSuL3JHw5Re3H6yrn8b7B2JUOJDPz/hS
	JmHHlUqirrAKHtwvW03OkR0cwTA7nmcIrLsw2HASCumWLh3q9GY9VfIKzhdHWoQaFy+UiAmLpgL
	2lsD613YOOrs0SyCEzVwxBQbuYCQ7tqZBVMSlF3WU807WxHdpjhiDMBcacoPnPOu5RxvYEy641o
	P//3phT/Y6ar7hVRcyq24qM2iMsZzvc1PqCamxHWWiCidS624mY+xkR7VtTUO8=
X-Received: by 2002:a05:600c:34d0:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-48526923c5cmr193755105e9.11.1773075887324;
        Mon, 09 Mar 2026 10:04:47 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d? (p200300ea8f46ce0005f97f3c5f9a2a3d.dip0.t-ipconnect.de. [2003:ea:8f46:ce00:5f9:7f3c:5f9a:2a3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a9e549sm4543125e9.12.2026.03.09.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:04:46 -0700 (PDT)
Message-ID: <b15b378a-fda2-44b9-9d63-bf82919b71b2@gmail.com>
Date: Mon, 9 Mar 2026 18:04:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 4/5] net: phy: move registering mdio_bus_class and
 mdio_bus_type to libphy
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

The MDIO consumer side shouldn't register class and bus_type.
Therefore move this to libphy.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_bus.c   | 23 -----------------------
 drivers/net/phy/phy_device.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index c9a495390d2..9fb47332602 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -905,28 +905,5 @@ const struct bus_type mdio_bus_type = {
 };
 EXPORT_SYMBOL(mdio_bus_type);
 
-static int __init mdio_bus_init(void)
-{
-	int ret;
-
-	ret = class_register(&mdio_bus_class);
-	if (!ret) {
-		ret = bus_register(&mdio_bus_type);
-		if (ret)
-			class_unregister(&mdio_bus_class);
-	}
-
-	return ret;
-}
-
-static void __exit mdio_bus_exit(void)
-{
-	class_unregister(&mdio_bus_class);
-	bus_unregister(&mdio_bus_type);
-}
-
-subsys_initcall(mdio_bus_init);
-module_exit(mdio_bus_exit);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MDIO bus/device layer");
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index d1cbcfc3d2a..0edff47478c 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3913,6 +3913,14 @@ static int __init phy_init(void)
 {
 	int rc;
 
+	rc = class_register(&mdio_bus_class);
+	if (rc)
+		return rc;
+
+	rc = bus_register(&mdio_bus_type);
+	if (rc)
+		goto err_class;
+
 	rtnl_lock();
 	ethtool_set_ethtool_phy_ops(&phy_ethtool_phy_ops);
 	phylib_register_stubs();
@@ -3941,6 +3949,9 @@ static int __init phy_init(void)
 	phylib_unregister_stubs();
 	ethtool_set_ethtool_phy_ops(NULL);
 	rtnl_unlock();
+	bus_unregister(&mdio_bus_type);
+err_class:
+	class_unregister(&mdio_bus_class);
 
 	return rc;
 }
@@ -3953,6 +3964,8 @@ static void __exit phy_exit(void)
 	phylib_unregister_stubs();
 	ethtool_set_ethtool_phy_ops(NULL);
 	rtnl_unlock();
+	bus_unregister(&mdio_bus_type);
+	class_unregister(&mdio_bus_class);
 }
 
 subsys_initcall(phy_init);
-- 
2.53.0


