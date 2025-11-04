Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0B3328FC
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268319; cv=none; b=l16FWUBRM/tC22vDGrDNAPkZpFSwMxYmaIzBvzxh91WafZ4AFKGgtC9xmblZicgwyc4yvxX0/w42qkTt8dqXO3O9MWQQf6FFp3cLbfqg2hnSsfsq7BSVxgxzMGyPks5zGTDSjmc3yVPS/CtsJ+9cTe76nLuxQd1c0htsK45q1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268319; c=relaxed/simple;
	bh=oaleqb9XqZrB+5VSSVHMl0U9JzcMe7IFlSred6/4jZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw02byrpTrXNJ3TA2NtmjySEajYyO3m4SLuS8SEcN1iGICUn5KN4OKpoBDXkqhMLAqduRt/HIAVo9OTpBvXyKWPUZ94k4+HA9N9zQ5+gh+fNpAuVfFtoV4SZCdsMVCveQ4ZjC/yiHaQNe3E8hyT2qugC7x38SELFXs7Ar7oF36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKwD66NS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKwD66NS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640b4a52950so2863814a12.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 06:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268316; x=1762873116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiETutXUQi91zPM9wQrjIsBcMeBokATJ9Dk+OnsfOPY=;
        b=IKwD66NSZQxcY2O0VwmX+GxMiyYD58CyexTGxan7ZtBiXrjO7PI26Y/Nu7aTxUsVsP
         8MkJHtVPZQxwAPDYUbQBNmpAPeJ+yL2ffSTDP8PTX1h87MuVhf5lh/9nwdWe+yiwS0aO
         eufYTujEm+bW0lgynGanwWlj+o+NMuT9vciV8H8WcDkPNwyk6TxIyrdUr+KpAePRx74C
         V/X6t5e6QBUGY1eH0VBHXAQTKDQ+0BY+nhhaFOyMUXAWzmuZi8TadjZOIGcWepYU8gZG
         3k21Yd2/mXbFPbuDxpoFq/UBb52L1gzP9f9WgbbfkchaLX7HuEe8pQlgGnT1eoHHnXQ4
         gz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268316; x=1762873116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiETutXUQi91zPM9wQrjIsBcMeBokATJ9Dk+OnsfOPY=;
        b=E1ZUjLsXndMm75wNL2lP9jTNCq9O0vI+PWLugt9W66xyUvz4BhBNmCXZxCPkoVQzvF
         r8c6MbVjTpuW8KmwHwiQpGMTi70cPiHtpZ9u3jzXFdZsJH8CBV+ovnarJED6JXSBhZN8
         ykhFJVkJOsUAyh/W9SekEopj/t2GXSqRS35Ov1Tb0NvPC9f4+/3N1d+nYA5HihCEyasY
         e2TxP0jjU0uasS5wG/+RXAHmd/eKvXTfT8tUvpRXaDU89Q2j4Fc5yDZcy+KbC369zP6q
         YjiOLvHmMry7JYZsqifru36NNsnbfe7mCfSa4Il0YLPRfC0xL3HOpkNPgZw0P0FUcLQC
         YQsg==
X-Forwarded-Encrypted: i=1; AJvYcCW/xg87KuX44zywi/5ifld4ncCwmA4zNMQlCFq7CZT+hppWjWFHt8ViDGO1VRDBMr3rqZVj6YlTDBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJ3ChExMuVYvbA1MhVwoZwJOtWQH7Bioy6eQxTGOM9iYKOWFu
	4bklLS5NlJnmv8kjqnkKTQgOXspI4Alh/U7fhyNhljjp4kS5YHH1fZO/
X-Gm-Gg: ASbGnctESiGPn0RGWjvu9sgf2Xgx2E5p0DoXmK8Nhf7JH58Tcd/3Mw6wwcHiC7cXjin
	61MnrnGkMtMVfiraC3lBf0x46QeYYZU+Ho5ean5IYstONnpBJ8ScVK2+qozrKIvIiUdqHSMokkj
	NippJN7QLHTvKgcgtaB1I4iE403/3D5GWt3LFG5k2RHWg8M9eRSo1Cgf027faCuX7mbGmjwTIF8
	MUpy0TpKI9HklxJJojCIcWcFBjy9VDGOuDzytw0aE1AKPPIKOUMAjONrOkzSjy6Bbqyoz99iivl
	Y9hgodm5ehDgfxlnYh7SRr2lpS1gMaMu9IAJHcmdzyMLUVkP4LBl7PZAPylNOkAFLcSAZYbvvsy
	EfrU5mXYoTqzrkiVnYge7O/kBK3cARJ1+h5c4dIMB9VJplhG1D5wGnJsoXxVOHReAWfUOt9Ov4u
	nq3sUViIZZ+oCGRlvjVqcpKBOkzwE47J1WE2ig3/FGhdm1Ar0=
X-Google-Smtp-Source: AGHT+IEm9m/w9mr1Ah54jXoKE1xbMScwRImAvwjuiTBh4hTI8OJ22nQbryQ4R/71ZzmoPFNV84Nqyg==
X-Received: by 2002:a05:6402:90e:b0:640:cc76:ae35 with SMTP id 4fb4d7f45d1cf-640cc76b080mr5264788a12.21.1762268315761;
        Tue, 04 Nov 2025 06:58:35 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:35 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:25 +0100
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
Message-Id: <20251104-kona-bus-clock-v7-7-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
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
 bh=oaleqb9XqZrB+5VSSVHMl0U9JzcMe7IFlSred6/4jZc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSPDzc0qX79x6O83xMuL+h1vrRyYab9QcJKX
 vTAZcWQZS6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjwAKCRCzu/ihE6BR
 aGUwD/9rHsz4h33pXwGXH/5ZmWcK9bAgXdjLQJzEJXA2ZvaTR0eYh1aY8S4QyX8yuWSPnsyfzNI
 26sg4lwqP3R/ikGpjup+Thz1EzWvOiapUWActOQisJfzz5E/bY2D9IDkMYb9c9qyspwt2hMRqOS
 dtgPzncqkKCzbn2q+Jx0I634cK9BOMWJwEWBS+B6OcxZYx49scZxMgs3VzCfpkLf9hXxVZGFg19
 33+SbwFvoQaN+wuYxUl1njAieZpbX9Q4cYDRGnQgdAerYKlFQfG8PkFwqLy1PFb/1zEuElNX4Ko
 +cfyw1J7jQxg12P/Itbq9oE3iPpkjsBnFfb7fNcYiSgzFb6IiRqtoDKBPZxI2Ox9J3cRK7ANY+M
 +pNk9YNnMUtOC5qV9bP49m7R4JOQ6aXnMMvtKH0ycKwTa/wY5/3eUDDyGCcnLyAjrEcnfazod6t
 1ZwNq5yLhoOvd5kaJqKCMzW81mogJ7xIrp12Y0GGLaCtNk3NsGbctBd7ARkRbTfCJ5MXJqi4Wj2
 WXySVxv0kIbwnamow75nF2WbWIy9bO/eMRW9G0RHYeZlgPpnOo/j1jGNClDArrqV1XpbERK1k5j
 FRv4w8NT1hXdLrK+vWNagTW8g70u72nAsLdcJLdY/eZ0t0Q5W5XmYRtqkYpCgIgNFrQcivvnRBU
 JidqQz4b+FUw7UQ==
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
2.51.1

