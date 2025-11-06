Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D434D913
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471610; cv=none; b=Q5ue362xSYaXzAuk2De4gg9GDWz1K7Gf5GEW7pzA6+8bVG5oyA9YaTMQXU0WlBW6jMPSsaEacC/4yDh7diFeueO0XqjHm0xPXbPo2nrpjmMxl7fCHaPChRhMCeqFXYKlZNnmMtDiFJ8gJ7ij5beyt7i+jyPCoR4DhwMEMa98utg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471610; c=relaxed/simple;
	bh=N8o/S8JYpE+P94OMt6ofvyUqz51LnCLNCgONjtOPtQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+RMQldlLb56/YMjeG/oN7jDkK9IgTTPIE8Cis+lMdrCeqIitFdBymw7lzRH3vjNJa2ccRu8+d8T6o/pnMNQuJfIAHsZqXEWO9g7rabbRmgIc1rl3plWA4a/5RLvQzgteeEPG+CRAjkoxSokuPA99i4Q5VNAy9gsMy1j8mSOpck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y0himUTf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lYyowWFt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y0himUTf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lYyowWFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
	b=Y0himUTfRaaPeqsrCBo4xstGGQnnSOmYm4RucvJWsBRsvp0yBzRUxq/6ZfQkAfJrFNxqBf
	oMqo/MKSengpv8FbqtOyR5oybwXMsh3BQou/n7SrD8LaiTg517F0c7DrRZcDrEun48bs7p
	FDiWowDZII373mVK0mVM86Fg6ziyPWw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-th_7HZ2SPCizDTnK0lO3Bg-1; Thu, 06 Nov 2025 18:26:47 -0500
X-MC-Unique: th_7HZ2SPCizDTnK0lO3Bg-1
X-Mimecast-MFC-AGG-ID: th_7HZ2SPCizDTnK0lO3Bg_1762471606
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8803b5dc9b8so8611056d6.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471606; x=1763076406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
        b=lYyowWFttviM/tUT33CbDnBTQM+7UxwEMMEEBYTA1lze6zOkLi9q5VbmeaWDTA6479
         tCTAItm878LZVmHAd9h6GIlcjyIVmw6F/1sHHyQr/UIJ36xZJr8atMTkpKljGQeZA9ND
         APismu2rp+CbvX+J1olVVV/T7lN1Pmu9tS3FPBe/WQtH38RqJQReUDiXMfHDTzBHsT/h
         /WKUPaEaicIEYcwdWVMmHnhpK+qiCZY54VLld0L0ISHH9UegYWwzj5/+coZmYqoazjpe
         0UIAxzu2MZY0nO/DnCdVMYNE8KYKtnB7q9eB8Rs7NhxMURWVoxKsIcqz1wqyxawuEQ8P
         x4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471606; x=1763076406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=akq4xHfr7o1c6LF1BQGU3I527bH0Z+3rmigIHrwqrio=;
        b=UVnmkTHvQGfi1huOYW8Bp/ICvPA8Y6JdjII+2hPmRa2GZxYe1vfZJujnu8B3HPiZpA
         mgkOyC0ojoTm61ikXd3awK6drKNwVGsSFms5lJx/1BUq8n4F+Ur+JKptSiMhiog8ABlr
         503GB4ilBDmnhsEfCeiDnqg563APgKg9qKEKg9uw6boN7LhE8GWAJmS6ChIM4XoknXFw
         OCsbHULoVmor366vSNj5P3osi1lkC+8gfFQnjbe7aqNkYJpK+CnB2J0uoqq3SQFBE18S
         m63Fifhczx5KwI6AzQy1BM8fogp6VNrPMR3JqpThNmWsYe0sE+u6fK1HQGvh04VjChpn
         JYCw==
X-Gm-Message-State: AOJu0YxeNWSN8QpDwxeI23xecyANcJLiQPxojKRXw9JEEMaXRjE8Zv8z
	R5tzwmBK8nGMOpDxj5t6s5J3OblKtLYwWSjccs2aOMNJOKylMT+YxdRoThLernYRa7b7dRIZ4Up
	VP5AxhE4W4u3W3DoPjabV9lX9zfjW5M4WKJ78W8EMzSbm/XKjOUte4Do8rMxuFVUh0MXeAQ==
X-Gm-Gg: ASbGnctibiGoI6ah4Dfl2XAMuw+bb4W8zoh3TqdWZDt115tfsc3xtJwHab3eG+DH4z+
	YWiB1oRMhV0xA6tfXg+DWRc2s8If3XdztcuVzYxG48ifk/BMwf8FvvLILdkCnTWcGtLQ3NMyPHV
	QtoGnK1SWbxLpuKfloYGuCdGqhO3zKld1zj6v4bTicl7O4fP8sj+fwcBQ4IVK+kVbEo7ANb2fGN
	i+R2RdHXJ+KMVuKK+TxDSQTKqs0VkiGrlahI3r5X7qnZpPrcC5SyC0LUiuN8r0628whgdQmV9FH
	AwqUN90WdG+fFVXEeNdVFrKKW+jSiBmBO00zznwgDwmKPB5J5UJS5/V1FbogZlI/yNqMG8KT9tJ
	fzwBkfgowc7SpUwETJ0I3Z0AT2E+NvbgT9O0o83KVFQ==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19316086d6.43.1762471606046;
        Thu, 06 Nov 2025 15:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHwlRC8CZ2UFXaZBcGupUhAP3gsyq39my6h5pJeWpOeH+fDN/RFDAKGIUl3UBkcMQENq+LCg==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19315736d6.43.1762471605711;
        Thu, 06 Nov 2025 15:26:45 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:49 -0500
Subject: [PATCH v2 RESEND 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-3-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=N8o/S8JYpE+P94OMt6ofvyUqz51LnCLNCgONjtOPtQk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RY8/PBwxpQIzmk34ntPmseIsDDNz1O4qinfnm5ye
 e/uLa+0OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgI/3lGhl3u+fZzhdU+/Dze
 fFh16+5wt2rZRwu4T3yXfO8lq/V7uinD//wHB3T5l/r0mnFP1Vf89iOU+XbonQtZOUZNP5rz76e
 cZgAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.51.0

