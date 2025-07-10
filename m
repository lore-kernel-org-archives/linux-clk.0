Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE7295501
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752190964; cv=none; b=brFlHC0A3GhjAcwqVPF6e9pDXoYiFAxDb5bcUmLa0L9hI/xv0/OZ8Bdv4eKUTLxhn8QRDbUJjZcGIbbpKRuUjqnXSz4U/hC09WFGwZCrGpCh2Rm8lpVRbdmuOeF28nBAPhbtW/v8cUluOIP8nd82s0h/Qf+ObhIa/Zqv+REwHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752190964; c=relaxed/simple;
	bh=jwHUuIfJpkKtUxi73mEQY+91PJvNh9g5xkFpUZRiga4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecB9BwcZXQJjpxEbXXKeKBv+K2HBdmpwdptHX4WKS7ZbsIHwtAaWtvXxjxLJ8sEa9bBrZaEvLbIbOX8lpcYDlSJ3yzB9vGFgliczY1BSJOxD+oHv7+slXcIQFttZdvaBDSTnqEZgBHHhgr+lRSLK0JsYZOSQnNNBe8A4Nr31WrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZlGlZz8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZlGlZz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=;
	b=SZlGlZz8vRD5dg6oHkP2LdXGUo4OeMBz28p7JsRA7pjIEMJ1rJ8irlr2/cxKYbiMpjXeTn
	8Se+7u+gCVr3VWitF/YZrybNV0/trVPxJe553euzJmWr3F5bj6scU/Zs1pulrKobnSKjWH
	PNBHhPqgdwJVOi/aMaUfSwHhkETAsrU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-vtS0WYK3NDWDPaGFWX1Xgg-1; Thu, 10 Jul 2025 19:42:40 -0400
X-MC-Unique: vtS0WYK3NDWDPaGFWX1Xgg-1
X-Mimecast-MFC-AGG-ID: vtS0WYK3NDWDPaGFWX1Xgg_1752190960
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a585ad6726so49430001cf.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190960; x=1752795760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=;
        b=AMaPRyonFtWM+T3HFJyQ8XTrkrktNSsvmAT9BIIq4NpdMetjF93uRGrRi5KkwiITro
         e1QZkjdeDwC/q2QxstmCvrUTUhIw81iGxJn4inllvG3BHimYpUqWRRCCiJ84dbbrc0oI
         Og5HAy8/ZCmaWg3iCeYFicL1TIXkhp+ps8gJ4tnGtj3Ul48aSruVIuKA5qAw14rGPZef
         vavlCLb/fDuaUgSUzVR0InXZbaoz1O0/Sfkb0f+LjbRYr9cPfPT02tBpSz9v9hWfsYKW
         W/5NZku1gg2h2uaU6LLSpZOMLCYSuy3NBBzJKKbt+N99HP42QMkl5mtdHGZXXVlk83yL
         4faA==
X-Gm-Message-State: AOJu0YxmliKdrrAtBuJeznmgcq034hCOse2vCC1ZugUpo30sYMdX3Kg7
	AS7Xi1ggf7/pvdBwwGbNPFnQNBOz4BLXg6QwZtTr8bPJxpwu5YAbdeKcZYF2yXfd6hbMHotuHJk
	8kGeFyYx6IvK8CfcJvNMXcleWyhwnLW/JnIipBLbhbzwPYjnElxRsj4L0l5iCRA==
X-Gm-Gg: ASbGncvcrvxxi/yIoSq6IZyQW3krOwtPI1PiVcSuJi3g9maWwjr1UWwZ7ZWM3/d7IG+
	cuNvl12I2RWCpfbHKBL3doYqCwCjyPsfQjmWpYepkhTLY1QVFX7FEMjMEBalkt9nORI0yW7v2fh
	0Tls2OFRYN+b6Mfm+A1aaP7txzaNO+FkwEoMzzwOCVejNzA74UzL3LBJG1HAL25D+BHYL7b2Mvc
	xvB/bGcv37C5THASUFU/QkD3l1Fb+oPS2np5BNCDKONwSrXS/1ISLYUxbqJlDYM0wPfqnCcbyrX
	a+FmsRDajztK3Si/MepAoH3UQOd+Ek+W4kebq2Q0WxObQc1Y2ajiFLWl8XRXAg==
X-Received: by 2002:a05:620a:284b:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7dded1ef04dmr206090585a.57.1752190960384;
        Thu, 10 Jul 2025 16:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Qf90w3WAIU2WDAVl84idxN1ukujHZknm9tJ2hmS373+cRWGc+ayHL6trz95Fv5oRIp+Mrg==
X-Received: by 2002:a05:620a:284b:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7dded1ef04dmr206086485a.57.1752190959849;
        Thu, 10 Jul 2025 16:42:39 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:18 -0400
Subject: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=1416;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jwHUuIfJpkKtUxi73mEQY+91PJvNh9g5xkFpUZRiga4=;
 b=BvPcx1n0mHxD2gopIAIHjnh1g8w2Bjp39wDL14lGnKxt1a2WhjWjIRkC4v+Ur+bh9HIHtBv/h
 TZtY3GXOwDxDw5NimZx9GggwdDZr1X0VaLAtH8tcwEpCQzCkO8UueKy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/mach-versatile/spc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 790092734cf6155daa63c44a1e5af00ecef30737..812db32448fcd415fa1a60f8bb971661369151e1 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
 	return freq * 1000;
 }
 
-static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *parent_rate)
+static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_spc *spc = to_clk_spc(hw);
 
-	return ve_spc_round_performance(spc->cluster, drate);
+	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
+
+	return 0;
 }
 
 static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static struct clk_ops clk_spc_ops = {
 	.recalc_rate = spc_recalc_rate,
-	.round_rate = spc_round_rate,
+	.determine_rate = spc_determine_rate,
 	.set_rate = spc_set_rate,
 };
 

-- 
2.50.0

