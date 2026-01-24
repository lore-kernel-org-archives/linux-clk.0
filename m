Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5626B760
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274619; cv=none; b=QLerd/QRAZcLRDY+qu/Sip7hxvzL1JwuoXs5c32dB3PxxGG4CPNr0LB9M36//6Ox7wjC6nqxJLQWc/5qZ48YWh/LrHJSW4lo43qZL0qKpvET9ene/qHUf5c1bc5pCeRTEACQd6XeS/wgHiJLTwxHj8mZ4SabqE8Hz47H46aOKC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274619; c=relaxed/simple;
	bh=MhD+5si1P/CXfrsB0NWiwFA6wHzB9oyernIPrIXpq00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPFjQvC2l1NnD/QOfoCPPADyLYHS6fzGS4vlszxiFxkFuLxtiRsBxkDDvTVnPkVSMMkYqtpULfLNsV5Js7yNLpedpZsa4Byuc/nFuEAsjZwwbbebQ6kzz89Yog8D9DWYJWeyldWaKItvw/f1Bv2FCW2RkOHaXzSeGw5A57mhiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPneBWEp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPneBWEp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso5168150a12.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274615; x=1769879415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuGGQ/SEcIOglN3C1ur29tPR9UsO+YtNa/y88pcV+Ug=;
        b=gPneBWEphHGUaswfTFq0V2SqhOyvFMulYYC0XSzOoDNsne3WWnj68R449PoQX2YQuT
         qEdVW+aTryVWryM5QFA7kV8R7SWUAMiqsf5hyKHwfY9Ojug40w+2tFxolM1xpCnKVgVi
         tPj5nHao48Uk3y8CL3rzaegKUAAymt1/n+R5GmajAH/SgPrdPqCAOMEuuoUKtWhMgzXG
         NKub9/ZF2Jy1Cicp3WGwGyvXvJzYYWNyn5zSIwMkroY6qz9RL5IFzdRN1GIsU1+QnRF/
         rZi3RPP2/JyXK2XQT8SVd1TWmYyFnT8qpASH4e7ozJM+9uh78zqMRqOqGFfnzLHFTMFr
         qbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274615; x=1769879415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FuGGQ/SEcIOglN3C1ur29tPR9UsO+YtNa/y88pcV+Ug=;
        b=ko5JtUVZxdxUE4BEGZ6CS6k529mOp6Ch1Etcmm9YuONwF8gAYKWs3OMzubKnUi3pAf
         rSljtUw02HNUteA45+xVNK3SDMLoKkn8ag62fOd5aY1Vb+9OgAonop69RJBuyubPYz3U
         m9QGPUxEMId6tsvj+a5j9Xh9GM7CfoNxuxWgaSQTz4vsq7594slarUdO/wh3tVIK6w7o
         ZgJ8sVrmpmIh6Pko9xjS+CRNReunRZ0intJ2Gi4vTa1//2zf3kZEeuG5ZYN1mldnEahg
         JMewnvU2XmsLAoEtARC7u//WrLAaljTa0MuyAAycu4GZ2dnxb6qu/jRgacy364mx09pa
         0mAA==
X-Forwarded-Encrypted: i=1; AJvYcCXzKEcLX5z+eHIkxOCjIUrNAJxgJYbi8GO7Cubo45d8CEOYBW/UmXHNeKLg/geNPmBe3KpxE9xPRRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7eH9IQ8n4B4hxMf3IZaAg9IbS6KnrjC/vPx2aibGB+RX6UHMD
	EVzfbTBD05U2MqHzm/QF7bII46wY+zHr2p14cerCYZ60hg85qj+A4J2P
X-Gm-Gg: AZuq6aJH2clRan0Yo2fDYIGGQUO7TbPn2ax+xq6Q8Jfz9/z4ilk5YEerust/rL3mYCi
	2ArGEFIgM7Vqhf+7YkHhfRT8+cA1VvGwVo1Xq29QXCZjNUl4HbgrERyw65nmXHJ3vG5X/VUg3go
	rz8MuT72rHYUHZsN2HoTi8CMOAPMLOy3rh1PVR8S7U5v1EhgEMIgHg1zfg5GlUhUdOgrXhSyZE/
	cUdoIBPCATHLjfk3J2Bzn1nyDPp5EBhp3t5ml5oh+EaevNAG9YyJujKxNanXnw0DpQTP4Pogxid
	2bCaTLLULEt5sLgl8P0/plOMhVzuv5JN64ZFxC0gdFlWWclWH/rSdVpyzfla5tDLEuv3UwfNDnI
	+PrSNv3dBP3SGU6HrE27BVeOcj/Ren/9P4Qc0B3pwNtPH6VqLtPUt1oCLf9YtTMKr5u7EkiA9ap
	zZxbv+XYKYV5cnkgL/h6rpP99O8Mr67FExXsbnu5d5GLffcymHkYHk6cydJwCSQq1T7ds3GxBaT
	C9PQ3p8C3voO4dUSrlZLO5IeXo8ym09ZiZvfl7fvrKxow==
X-Received: by 2002:a17:907:7208:b0:b83:972c:77fe with SMTP id a640c23a62f3a-b885abf0014mr489898666b.2.1769274614504;
        Sat, 24 Jan 2026 09:10:14 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:14 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:07 +0100
Subject: [PATCH RESEND v7 7/7] clk: bcm281xx: Add corresponding bus clocks
 for peripheral clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-7-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6005;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=MhD+5si1P/CXfrsB0NWiwFA6wHzB9oyernIPrIXpq00=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzsb5s2kJBEIvd7K/fyhhGYwEf/4HXbWBQQH
 NP+aNdm9fKJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT87AAKCRCzu/ihE6BR
 aK15D/4qgPBR3x8sx196BYkt2yNN3QbXdsAXq1ijJeEyLVC6SciSw7JzfMEbPHL5IV26nSsZMZF
 LKpD1/Nohl/CbuP/KfeYDRqG3Oxa9ChFSUGeQw3XVmnzFx27GJIqIfr6AMBNQ7o8OVgrWjuv6mV
 x29YHf5E9iyct9xSh5dy07nc5TbXK89byQdC2J6lMyZuEaM7V48xW8PbhJc3LoFTpE/VvZbvkkR
 pVSfpXnFfT+HeXBOnEalT0xRMY9vkD5Sd5mF7Kxu8Y58voaQqD5PRbNuXfjT68OY6U0IvXhZ4xd
 e400sJUWZ5iM9DMvpqL73xpMTr0orAiO5+hiYKuacVn2UArK4ehOKIM7tupiy6xsj95qCYlohWD
 0w+xp83+pHD/xrba0LUkJkhmuHivlfwcKvDOQyUDDzAULm4WqYH4JRmE+gSb4FH8ZKk87PqE8KP
 GtDNnr9hwT0Fgz+DPFzeXpl1lDBfWZkac6SpNxP/jQDbOS2bwXL+BTN2ws3XVcMS3JDUSkx9ZG4
 Ai5gDTdF+yiiZ/6UIwFMa3pYg+FTcmnHBYqfKbhRs9i2YgEFPWBsVM0OC93GYtiw0T0sjD9A1BA
 1Jy2OSsoNOTwHWXbD+FiW5WDaE8NbtjyjY3/JbRGW9FMu8FyzHQse+9YZdmqTGiMH7IHSYguzpe
 kBFeHLKXmntsYtA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM281xx clock driver.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 drivers/clk/bcm/clk-bcm281xx.c | 127 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 62c3bf465625..13fd8a5ea8fa 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -59,7 +59,17 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
-#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+static struct bus_clk_data pmu_bsc_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 18, 3, 2),
+	.hyst		= HYST(0x0418, 10, 11),
+};
+
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
@@ -70,6 +80,10 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
+		[BCM281XX_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
+		[BCM281XX_AON_CCU_PMU_BSC_APB] =
+			KONA_CLK(aon, pmu_bsc_apb, bus),
 		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -178,7 +192,36 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
-#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_ic_ahb_data = {
+	.gate		= HW_SW_GATE(0x0354, 16, 1, 0),
+};
+
+/* also called usbh_ahb */
+static struct bus_clk_data hsic2_ahb_data = {
+	.gate		= HW_SW_GATE(0x0370, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 1, 0),
+};
+
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
@@ -197,6 +240,20 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
+		[BCM281XX_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_IC_AHB] =
+			KONA_CLK(master, usb_ic_ahb, bus),
+		[BCM281XX_MASTER_CCU_HSIC2_AHB] =
+			KONA_CLK(master, hsic2_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -309,7 +366,51 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
-#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE(0x0400, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE(0x0404, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE(0x0408, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb4_apb_data = {
+	.gate		= HW_SW_GATE(0x040c, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp0_apb_data = {
+	.gate		= HW_SW_GATE(0x0410, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp2_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 16, 1, 0),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE(0x0458, 16, 1, 0),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE(0x045c, 16, 1, 0),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE(0x0484, 16, 1, 0),
+	.hyst		= HYST(0x0484, 8, 9),
+};
+
+static struct bus_clk_data pwm_apb_data = {
+	.gate		= HW_SW_GATE(0x0468, 16, 1, 0),
+	.hyst		= HYST(0x0468, 8, 9),
+};
+
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
@@ -334,6 +435,26 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
+		[BCM281XX_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB4_APB] =
+			KONA_CLK(slave, uartb4_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP0_APB] =
+			KONA_CLK(slave, ssp0_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP2_APB] =
+			KONA_CLK(slave, ssp2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM281XX_SLAVE_CCU_PWM_APB] =
+			KONA_CLK(slave, pwm_apb, bus),
 		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.52.0

