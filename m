Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699971;
	b=ZE/RCWoTLN8O+rYpnIiozaHTgjuqL7rtyarQrv96HiSAom2Hpi/4wMxY7qJVUkGFdDqF
	 AyEldlO2d0AYBlyUm4me9Vi1GDOf9+4M8gNzHeStMlGhfeN31QTw+L5xfgTurN0mxaKRs
	 MkKlTHA8+t7ikv9IxaM3fKJbvHVmPq/YPC2IfVR0mHf7JkNkn0LDr5heNnQnFZZ/5gRQg
	 E3oUzEB5b1GDh+4bnsNhIwkRzzOzi8QpTB9zTFOmnpK58nWT4TewuECVdVYwwX40uOien
	 6PXp6bvxHMMwWLaKknCoy/dQPhkKS42L3AXiNxbkfpHPwT6ABMWihWmsXtBwQ/SJKMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
	b=T0vCthQVKMBP892IsLICOlaAsxqwx9k9LGFQ6QN+YQdn/8XUdPaTwNKljlsJNI/is7aE
	 nlpXxRwiwDtWcPU75SaYiSMFmmPSgzB49gtgqGqb3nyHvQVUSJzsaCKaEE83As7P0NNtE
	 mq9hFYRmH9ZeNntAolH6rywqSCVdFbl44uMQuW2hzhuwHqt0KbdBSOOBMh3rZJrNvIelN
	 cGU98UMVKIHd0KCmB233jPN68IUxnM1MGq2x9iccBcd0ntAIc/za3nEeahExPzNaFpQDj
	 3b4ZAAHY5MUeViuOGEyPPOXr2AmJ/dnJ7QzEe06BlRPDuIIcSV1bu1VDLALPlnnOcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oY1rofo8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E63606A33C
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E63606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oY1rofo8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso982285e9.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699969; x=1793304769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=oY1rofo8bPhZgD1egCQmzaRGjpNus05pVJK0Mz4J1ev9AuX5fAfX6pdO9ZeULkrkSn
         BYVRqswmd52nQ0YSK6dOQfnO6mPYSZQyMFdc+zTYAivlztPB50+xj30yqgXKsW3pxuwb
         1bdkobyeQz/rOY7WkV2ZLOxYyWkeIASZ6aMneO1sAn1N5Ubh+Oc2ntZMGB5wA5WHaCsh
         rAe2Vzxht/Omq7qOruePCur59VlMCiAJvqlKOvbT+98ezFzrYuUj0kVUkJ9EF2CRTbAt
         78+2gQ0n7S4OrSWczGQsUXqh+I4aJsHnYqgR++63wuB+gNfJc8bw24rZ67DohS30gXjy
         yXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699969; x=1793304769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=yIHIZl5ZvV4T5nYE0uD3396emdzutcctvgaAaYaS+psZyq0DjJQzKtC146CvuMSFWr
         YJAY9XhFxchLc/fK1ZUEQpKRJqGDMLDLyvqlsPQ2obDcfxAjuX+2F5iSkJ67vhHbaaD0
         ah6L/I3xxCyteGqVxxWj49QdaUU9K9jIwZXQ22CNd+8bBM3NN9jkFcSHYWq0YOuUKpMo
         /QxIfTeVOpiUqb9UHt+GwFcFPXROhOtiLRZOEiWWjkB7D5hOS4LSKb+ymPNFed8Lln1U
         qX9MyTkzt5G9w0hoaW7FGiyW9852ao0Qe7o9TYzrpV9Bra1bpOzsJ19r6BhMs4cvre3x
         ggew==
X-Forwarded-Encrypted: i=1; AKwUvByDIm0b+PxZ9G9kCkWVQtuLJjnLhn433Bk/lfR7IKIJXncSZeCWZ73OF340ad4fYrJcJDajLaLByok=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKPk4+XHdSS/tdjTybwQheMksvavv2DFXyO+ZK4yMqiPWb8C7i
	yy07mD0HsfI1N0485BGxPZdkUiUZDaRnQCJORd6ArXS2kZGc6c7k5cd6tfON5NiRtJfwSvVy+0A
	hFsPs
X-Gm-Gg: AYBFou27lpcIAR5TPudsO2LnNmtQH4v4HPKWne9qaxsDriixIAe7YPOPXeguzPdCUh/
	f5OKr9OAxHPF7POb696XxdR4ZD2nr2jDl07hBhjc6I+o42G4APYa37LbJju5QGVgfH8d2mT5KKe
	TbhM0onOlaI1DOFi0dbnqdebVjBlA3MOcOGwg30+/4ZjC2eDnC5aKs86Z1ro7Zy1f6BCSQZ/VqU
	A6bTZC+YBuR/Qt3PNimsZ2uoYIdhPTijNW6pQYOJxnsg7qD7Xjk9zUGDleNS8xmqiQdd1HGmKSL
	81s9g86MH7VXPfHVUzDEg831PGmZfq0LcrEnynL4wGecih6fVBng7d9ruVpvhrtK32mzHh6K7lG
	fIVZV0KEXdmjAO5lRBRjxYA793gh+51D/fz7BdIE5TuntoGE6CMmmHxhE0XycXPcFktfx4AEZmM
	6B0nYuseXohdV59Xrk1OvUwKpg+Q5QstYt7npoDKp/i/aECTbHAM61OeQ2cpsFViwnQxz51qkKw
	4l0hZCbmjbtkwkj6b/6utT180F6aLLVwFeOJcIorDStDqiOjTtxyYvk/J5HA6ZYBnb1xYSBRILp
	KfDW8acYd7TkKNPpvNalSm1Un74HtTo8+2a/IJ+Yvchwx1n+j+za3iiz9BF47xk=
X-Received: by 2002:a05:600c:1c1b:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a211c7870cmr2773875e9.2.1792699969349;
        Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:34 +0200
Subject: [PATCH 3/3] clk: meson: s4: fix ENCP clock selection
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-3-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

