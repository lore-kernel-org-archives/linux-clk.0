Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A72749D2
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160897; cv=none; b=Vybl/P0yXcHMPk0Mhb2YhP0XYh+KJUMDJqfp/lx8fRy69ikMRokm+zYjiLSqVCMvMkYfgSsonCx3JJ8xsGJ+wyfpi7WZ+2+wqvhMZ+5T6UKnH+/uuJq4xl+UV043zgoQpcoTU7j/K/qNQASePSVAc1c4Qwk5a3rI1Ws8higbzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160897; c=relaxed/simple;
	bh=5ZVOk+ZOrENo582GUq8LCq+7YYXjCzCCpjXuZ1lV7ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3MdPD4ad7B1UeisrlPBxBiX9WI6PQ8UcNc3SzR273RisB7u30F9NSSOHOr7OdhD5OfNt1zN5cP4Ya1yuf5998kv6LdmVT8+woSgEVrgsJcH+7l4IjMqoi6pgaMzvPXRrJaoSRq8uGPsVkq5Wokl4eMgokAp6WFbIjmoOTwBSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOIpIwe9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOIpIwe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
	b=eOIpIwe9JjJlLZlX5JSk19rt3BL70IZNSFJGXLig9Deqa2pT7Zq7ipEzykuZPhqxSFgvhN
	aYfjPA8IXLSYpCYAY8lCt/eYEAGDAVqeqAXBpG/QUJ4lTSVZ5LaOm9/RHSKy0WJrPcTxAI
	qlLg3mPp4fROhFvZEpCMYdhD/q4FMg4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Pc-p1mx9PY-KlWMesxgO5g-1; Thu, 10 Jul 2025 11:21:33 -0400
X-MC-Unique: Pc-p1mx9PY-KlWMesxgO5g-1
X-Mimecast-MFC-AGG-ID: Pc-p1mx9PY-KlWMesxgO5g_1752160893
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43988c314so20372611cf.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160893; x=1752765693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
        b=I881QcSAohcje0bvYMWeLQodxo37jt+s1tMm3ubcqUVpZYA1oZAGKYAinj5zmpwIMK
         wQ58rIGcz0IJRvuqzt0po9InwxMPv4ntF0uchpKOLRo2E4xv4fPXjHXTEXMHbX4bxmdw
         VaLz26DsWs9bO9MI1tcZ/UWzXQg6gZyO0vRwwKxPerizUpNpQsOdGxpEkYb/+JKjf1DG
         IElx5EAd/aubfNY/So3NgCKiGF5JQCT2LZ9PifYMMOn1FDm9wI9VTxf5POpSf0U7Mkly
         12x6yPk08E+lxQTqwDLX1iylMZaRPPnFDAl56GvdN2pQ3R4FNTEDhuxKsYvVH1+GWGNA
         Rq8g==
X-Gm-Message-State: AOJu0YwqDs8WnAXDakK6t1WdoVE/d0wSWzYXkr+Wm274d1k5D1OzZ2V9
	8+6sneKm0eZWWpGQTQGj+cnA2aZLLOlryF5Ji75wSetX+j7zPu4Pj+S6MIJwM1j4yjYUobooxLN
	eIVte7zpKXGczOGt3VQDqSNQYNAvDcwSXWq5USk7yJz3CudwlBOOoTmcKykdQAw==
X-Gm-Gg: ASbGnctgKm4dKDiyjAZjjL7moVV/klVflqkr1j4s4og4FRRyYgDnOQLPYczrBPeaClF
	130QhjyB46Qict5KE9eWfFMlg3OV4FXt0/tZG4gwhwT3cZ/TNnIzGAgWl2FpZW7dB/7LM+CEyjX
	lN60Z1BFO4rz3sY8KH/SGE4QioRKFPAoS7zpVKdka3RzhHqdAuHsIN3F0jIjh0TVs+Iz2TVGZzh
	8VApdZsoHVnFrk0FrDeFw3zqFo4hXka0vE5IFscwk5GnxbW2nA0WlN3WCeTt4ztiFIDAClDyjcB
	vWt1rKy0PmDdF5qLJLppzLotvCsQuii0d+/AVKWfehE/Sl6uk6OAQGN1kXk+
X-Received: by 2002:ac8:59c3:0:b0:4a5:9b9c:2d9f with SMTP id d75a77b69052e-4a9e92fb39bmr60788281cf.2.1752160892706;
        Thu, 10 Jul 2025 08:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEssxFzmy5DZaFLWrhwRKaLprHY91yPLmVxKn2VUF7H3TGYR0HmxKyVMLk0dM4mEtgHsRmiqw==
X-Received: by 2002:ac8:59c3:0:b0:4a5:9b9c:2d9f with SMTP id d75a77b69052e-4a9e92fb39bmr60787681cf.2.1752160892253;
        Thu, 10 Jul 2025 08:21:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:35 -0400
Subject: [PATCH 15/15] rtc: rv3032: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-15-33140bb2278e@redhat.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1946;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5ZVOk+ZOrENo582GUq8LCq+7YYXjCzCCpjXuZ1lV7ck=;
 b=DT4kedVd9JHLVr7GcGFwVFd+HuL+eV6cYmrDz6pnKaO4779AT/8pJh1xVZGoHYgcUbXEwBISq
 HkwA/DTaq7wAhW2EXESEGcFAJ+P+8vXhpwlHpiLGX//6sA6oikBaxHi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-rv3032.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 2c6a8918acba50e57ed923db0834c7c4620ef2cd..b8376bd1d905be63afbcbc688825c0caff74a3b5 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -646,19 +646,24 @@ static unsigned long rv3032_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_xtal_rates[FIELD_GET(RV3032_CLKOUT2_FD_MSK, clkout)];
 }
 
-static long rv3032_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int rv3032_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	int i, hfd;
 
-	if (rate < RV3032_HFD_STEP)
+	if (req->rate < RV3032_HFD_STEP)
 		for (i = 0; i < ARRAY_SIZE(clkout_xtal_rates); i++)
-			if (clkout_xtal_rates[i] <= rate)
-				return clkout_xtal_rates[i];
+			if (clkout_xtal_rates[i] <= req->rate) {
+				req->rate = clkout_xtal_rates[i];
 
-	hfd = DIV_ROUND_CLOSEST(rate, RV3032_HFD_STEP);
+				return 0;
+			}
+
+	hfd = DIV_ROUND_CLOSEST(req->rate, RV3032_HFD_STEP);
 
-	return RV3032_HFD_STEP * clamp(hfd, 0, 8192);
+	req->rate = RV3032_HFD_STEP * clamp(hfd, 0, 8192);
+
+	return 0;
 }
 
 static int rv3032_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -738,7 +743,7 @@ static const struct clk_ops rv3032_clkout_ops = {
 	.unprepare = rv3032_clkout_unprepare,
 	.is_prepared = rv3032_clkout_is_prepared,
 	.recalc_rate = rv3032_clkout_recalc_rate,
-	.round_rate = rv3032_clkout_round_rate,
+	.determine_rate = rv3032_clkout_determine_rate,
 	.set_rate = rv3032_clkout_set_rate,
 };
 

-- 
2.50.0

