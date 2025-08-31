Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F73D190685;
	Sun, 31 Aug 2025 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637792; cv=none; b=Y6+GhIy6lpU8AP1cHF+99669dG+fewMp4j4Oebtjz0LH5SPYYXi2cemI3pPoVUmAtxYdi574fXXJZidooWHqmXIW5TqhHb2I+buZBuUtcKm1yajo3J20PumPI90+MKj8cxj3Pm9oMFMEi5AXtKPcRo4ryLkiSUdQoFH3hUaLJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637792; c=relaxed/simple;
	bh=IuXzZZ71LerZz18H3FXXnUMaMEPhllADXIEOlKv8fb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrieWpGC3Qr3qDx8hm/p43BMeIvHI7YvRi5w19x1lKBtRSr3gUJGx+M7U2/Iwpp1D6ETSrn92JV5uEOSlbXacfnIPpoiZJDTJ7LLnEY9YocEF6/a5SGbIN/Y5zKXKe8k8PR7poHZZdmQSUGTCcGbzKgre99pzGReLNT4KWRTojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLAIFqFq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLAIFqFq"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so2360492b3a.1;
        Sun, 31 Aug 2025 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637791; x=1757242591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyCuQfx6deCrzI3S90GQXXhYycWHkOUav5G7qScYADI=;
        b=kLAIFqFqFwY9ysypFEksatLe0fBAQLfJHXiKo7OEhaPbe/CfuU6dA41MMJXklJWLEA
         9M/gQEg8BGGdLnw5UTtZaT4DU4Ygx6Qz/ql2mYgeVByICMpTexeOmIk5qBtkqV/tJC3a
         mrULP/Nq3orjeyQE4gQ5jl7/6pw12RppEMSvJXO72O7Ii3c7eVphCpMTJj+Kplm+cT3/
         iNprAteI9BfbjORt2QtX6CeVDbiWySlYxXE2NvhmGcrjNw5/rFH8Zh59Px1VEsjLZuE5
         h0J6TGLs6uElhbzH5UV8YeFmiQrDhCo/yQ+GgqYZcCUE1ROZ7h5/qpOpyRiIV149J4vg
         0luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637791; x=1757242591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyCuQfx6deCrzI3S90GQXXhYycWHkOUav5G7qScYADI=;
        b=ojGrgKn3rdD7WsvEp74R08mU26aSc6GrxbhoRe9Ht6bgn23b6Sya5bwQ6bRvSyG5YQ
         JsYUBhAs69WdNpOqH+GFKEVDZ7V1SsrJqoGnK6yIap7Vog8ArkVsp7bl4XxBiiMFvvpa
         26p0y23KxcUJOX3jIXjAaXhsSQ2WPkHq1L4A12MRVjr0f6am7DeyCa5fYKynZ2zV+TUF
         KENRA8Vx3Hc1e/CrOHN1QwN2bmgc8RY61/1uO9qZnD4RRSYaXdFlRqHAiUy5xT/F2atZ
         Lkntl+drCqEWImZwYb71hOaQ9R/QZ1O4hNBmTXpakpvVMtQesKhRDR+f/vJRbuj+r+Kf
         bnzg==
X-Forwarded-Encrypted: i=1; AJvYcCVTBogjCnTdWMJWk36HWEcmevwX8fPwve3EYU3hEIW1J68O/fwYZ8IxkiCYfMaHss1rZAvcBOmVx6iy@vger.kernel.org, AJvYcCVit3DD5nhyCkw2To4vFGfl0JA2iZVnIMoRSFdhC6L6UsRASIGZPg/RtWhuw6o8hCFylpRHk/8Z3Osv@vger.kernel.org
X-Gm-Message-State: AOJu0YweAE1i4twVEMZjagSlYYgnibd+tF4egOjbiz95IkE0pNujmgNN
	rgUU5pqpesYaswJIeBmpp88fTN7tPprPzUGbXVbFnzi43oiL6nugGE20
X-Gm-Gg: ASbGncumuR7rzfmTpFw22v0JScqkupQE2OxslY0tMYe8s6H2jVvIwS+vINJRln4NR8a
	xRFo9lyELQG3jYc/lhsdpt1qaEFUstoOajTb1Pq18stIzpzi+M7Y61rcRRaZsxBiJ5vcG4rKpmh
	kSQlrN/bW3GliMElUOmIXgqqCLrYTY713SXVwsDRkCq+fMy5lW4pNjT0iG+1wcgidP/SC7SyKXV
	o/8b9dKl5Gb4Uxe6Iy3dpxG4CUTuX6JqUBsjg3KoSkRHdM5xdvr/vvNsobpRDXha/0C2vNQvpBD
	Gf8uSKTpynIp+uTxtCgvP0dAn8/j6IwCmIKgKTx4EePun+t7Vp0vfkhvYgk7avn34pZa08U42+I
	HN6E4Nhv+yxN+SuzL5O+sJ7LRllUYfhqARoG351u37xXQGX13KA==
X-Google-Smtp-Source: AGHT+IE6r9QjMdEHo8v+4WkgO4Gaj1FQsN6g+kaTvt9XXtQpNPUIIt05Wv/m+Q/CEazER1X8WXX29A==
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id adf61e73a8af0-243d6f02e27mr5147570637.28.1756637790601;
        Sun, 31 Aug 2025 03:56:30 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:30 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 1/7] drm/rockchip: dsi: Add support for RK3368
Date: Sun, 31 Aug 2025 18:48:49 +0800
Message-ID: <20250831104855.45883-2-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3368 has DesignWare MIPI DSI controller and an external inno D-PHY.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3398160ad..5d76e3e04 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -162,6 +162,11 @@
 #define RK3288_DSI0_LCDC_SEL		BIT(6)
 #define RK3288_DSI1_LCDC_SEL		BIT(9)
 
+#define RK3368_GRF_SOC_CON7		0x41c
+#define RK3368_DSI_FORCETXSTOPMODE	(0xf << 7)
+#define RK3368_DSI_FORCERXMODE		BIT(6)
+#define RK3368_DSI_TURNDISABLE		BIT(5)
+
 #define RK3399_GRF_SOC_CON20		0x6250
 #define RK3399_DSI0_LCDC_SEL		BIT(0)
 #define RK3399_DSI1_LCDC_SEL		BIT(4)
@@ -1530,6 +1535,18 @@ static const struct rockchip_dw_dsi_chip_data rk3288_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3368_chip_data[] = {
+	{
+		.reg = 0xff960000,
+		.lanecfg1_grf_reg = RK3368_GRF_SOC_CON7,
+		.lanecfg1 = HIWORD_UPDATE(0, RK3368_DSI_TURNDISABLE |
+						RK3368_DSI_FORCETXSTOPMODE |
+						RK3368_DSI_FORCERXMODE),
+		.max_data_lanes = 4,
+	},
+	{ /* sentinel */ }
+};
+
 static int rk3399_dphy_tx1rx1_init(struct phy *phy)
 {
 	struct dw_mipi_dsi_rockchip *dsi = phy_get_drvdata(phy);
@@ -1693,6 +1710,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	}, {
 	 .compatible = "rockchip,rk3288-mipi-dsi",
 	 .data = &rk3288_chip_data,
+	}, {
+	 .compatible = "rockchip,rk3368-mipi-dsi",
+	 .data = &rk3368_chip_data,
 	}, {
 	 .compatible = "rockchip,rk3399-mipi-dsi",
 	 .data = &rk3399_chip_data,
-- 
2.47.2

