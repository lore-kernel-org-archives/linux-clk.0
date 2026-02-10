Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5F2FD7BC
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752016; cv=none; b=NC1cOvvye6NvTl8RbzUInEZF54RKGri6J/3YBJ/ltTsMsPr1JJMIbHJTm/ifx6cEtAgJhGvSQUM+3Pxk6hAxBD5UzbQPNLEVfpIEiMph32uy0Jv1eFIujc8YaAQYXcxGjddYL1Ux0C6knmFJbCuMKYbIqlcKlCWMYgw7HRp9ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752016; c=relaxed/simple;
	bh=KI9zNXMWd2Tk8DQZeAdSk3D1yD3w2ogVdwD3LJhdYNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZ1i5AmaePAe4gEwu6BEuBeTztvxk2wIDDj9tsM4zkILKmYnCwLo/IPggrqHBVbeKcM5GnLIiH9l+abtgTnJ7pdYD5XPdEzticL7Ne0dI5v77aIzb2SiOKwYgNwm/K/12Uc75ZPR8R0JBcQxuFHhtJYQ7hpkhmZOaclRjd0/5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUFdOAlV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUFdOAlV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso52461285e9.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 11:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752012; x=1771356812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=;
        b=fUFdOAlVPELCTK4IHKp2WJzA4Ly5JAAa6uKcflcSZN5DYulyW3VOO33BwV+EhPI7mq
         IcLDRso2X+szDP6zBlgUI6S/kvQHd35MAFjKxC53k/fUIp7DTQI4cy/tpoH9O+i5rZIG
         Fjmpq7fkQsTv4VBfKtdTIGfgCA5Xj/QfKdMBPDAOz5VWsRzXL5cNa16AMF1R1UMh1TUv
         AGdSFTo9d6hw5sycD8YCHdA4MR0+jhVyQwZR1egHZi6ZmnZL3QnqwZLQM++JSp7QGY4s
         Q5eD3afWnuUcvIiSuRa91yP58/2bG3Zp43radhsjzYVHy7NDR66BQX5ZW+UIOR6dv+yE
         vcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752012; x=1771356812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=;
        b=XD0I3Dw0Sr8NkmCvxS0hXrvO8dU8LcnpWwc6TmANYwhJPLxPlQBXwXvG2WTmIlGRYB
         /ms2GrRhockRzN4iYBW65iACeBfc48Wy+bGrBf0kOgzcdkguJueBMKBEp5bWdbClIJMy
         8SLvXceemWBKfcnUePt6BXnAO1kguAAfFLZ3Pt6LhmdVOfag5Gd0AujTLLxmNahHls+6
         KOWwUBtjgnE9QkiL18leVrZsSk+eVJhVwNEuUjMyGXXdHJJoaRU3tRW+o4htd8sGNoMW
         aI31tafpMqsQwEfGTFsqijl7sBcTaXsp0d8T9vRl9Spqc41XxiGapLYzRzidpz2izqXz
         ObKw==
X-Gm-Message-State: AOJu0YyI4n/SnaTSMTTJ7Kn7MySYGPfpvTZ7rtLvAXBWvyjSO+7FVdrY
	LeJM+Lp2KmU8b63IrYiyd+FnA+5AVmECSTkncUuufBRAnffodxPXCQ94
X-Gm-Gg: AZuq6aIRnAyFeEd1NKiskgVodptyolRTznAjqjvCwbYgwsvMa7+3UDkheULNTA1kstD
	yJs+SOoHjXgxbmQGSTDLyp2G9Hs8ixdguDcSU7fT5TKpND4PvfDejpBoniKSEFsDxAj2BdH+23T
	Ki6CT+cnL63d0fs00ap2LSMD8j9znZPY/+yXt/YNPnQKl97nfvXTiuvaXNNDzzT2Y0MUwmiYY1y
	lLevSbQkzuibQvf12M9B6iAl0VayP0hEGK8oczm2NJe90bEbTKVaeIJdujOQ/GuSVegB9Ar2G8F
	MaX2X0BB1045B+mUfoVF5EZcGsub6Coi9eoaE/6rmI62y2H7L245V8KeYsh3n8tnIfMOJs81Vww
	kW+kckwQ7vWGUucKTDeA688uHakOZ8CDpcFnESCGXKo9THXkclL8SOQGmx9jpEKm3xcZ4VZy/c1
	sLcl5UyfxHZ+4iBEa7VwKsqxi6hD+wTasK3QfyeMzMsQ961oShMD4kBiPLu+k=
X-Received: by 2002:a05:600c:1548:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-48320933613mr219892995e9.10.1770752012271;
        Tue, 10 Feb 2026 11:33:32 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7d55c9sm75779815e9.8.2026.02.10.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:53 +0100
Subject: [PATCH v9 2/3] clk: stm32mp25: add firewall grant_access ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-rcc-upstream-v9-2-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-47773

From: Clément Le Goffic <clement.legoffic@foss.st.com>

On STM32MP25, the RCC peripheral manages the secure level of resources
that are used by other devices such as clocks.
Declare this peripheral as a firewall controller.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..af4bc06d703a 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,8 +4,10 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bus/stm32_firewall.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 
@@ -1602,6 +1604,11 @@ static int stm32_rcc_get_access(void __iomem *base, u32 index)
 	return 0;
 }
 
+static int stm32mp25_rcc_grant_access(struct stm32_firewall_controller *ctrl, u32 firewall_id)
+{
+	return stm32_rcc_get_access(ctrl->mmio, firewall_id);
+}
+
 static int stm32mp25_check_security(struct device_node *np, void __iomem *base,
 				    const struct clock_config *cfg)
 {
@@ -1970,6 +1977,7 @@ MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
 
 static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
 {
+	struct stm32_firewall_controller *rcc_controller;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	int ret;
@@ -1982,7 +1990,36 @@ static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return stm32_rcc_init(dev, stm32mp25_match_data, base);
+	ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
+	if (ret)
+		return ret;
+
+	rcc_controller = devm_kzalloc(&pdev->dev, sizeof(*rcc_controller), GFP_KERNEL);
+	if (!rcc_controller)
+		return -ENOMEM;
+
+	rcc_controller->dev = dev;
+	rcc_controller->mmio = base;
+	rcc_controller->name = dev_driver_string(dev);
+	rcc_controller->type = STM32_PERIPHERAL_FIREWALL;
+	rcc_controller->grant_access = stm32mp25_rcc_grant_access;
+
+	platform_set_drvdata(pdev, rcc_controller);
+
+	ret = stm32_firewall_controller_register(rcc_controller);
+	if (ret) {
+		dev_err(dev, "Couldn't register as a firewall controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void stm32mp25_rcc_clocks_remove(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *rcc_controller = platform_get_drvdata(pdev);
+
+	stm32_firewall_controller_unregister(rcc_controller);
 }
 
 static struct platform_driver stm32mp25_rcc_clocks_driver = {
@@ -1991,6 +2028,7 @@ static struct platform_driver stm32mp25_rcc_clocks_driver = {
 		.of_match_table = stm32mp25_match_data,
 	},
 	.probe = stm32mp25_rcc_clocks_probe,
+	.remove = stm32mp25_rcc_clocks_remove,
 };
 
 static int __init stm32mp25_clocks_init(void)

-- 
2.53.0

