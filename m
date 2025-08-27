Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47562EF673
	for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756314752; cv=none; b=ohfWd+3dp9nUnwFfMwBCTL05+XiriC4zFtjI4fAKM4utID0nlTo7ze4yPYlcgHBfQtt0X9ckjvDSpC+MeEupYmW9xCIhZoSutli9QiQEcBLzf7I0zJyoaykxFaY9GOrEc7gPRFVtK7nhv/+1szj5+g3aOz87jrKSXujrg6SE2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756314752; c=relaxed/simple;
	bh=ocvtdTl2hOZOQ/4oos7E0kZJWuxHuy23o8Wb53TCSIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QEnrDwMn31X3x2KF9LnXaEBKhq6yRiY82TbR33u1hDFda6do09ncpJ7roD4HTYP0YtMC7uh+8kVeVfcjqi7RuL8xnDGKtXxY+JJji26WuVHYIZvIRsqLNuFRREyz0jZFa6ZlconCb73OzmDiAwSDzMKvFPmKgpE62vn+deOH2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NEyrQZIl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NEyrQZIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756314749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=;
	b=NEyrQZIlMLr22MD4RzxXFgLDnjocyh33cgmJCaM1diuOiojdbJCJYKCSqUs9B8hNxIhL9P
	c16F0Or/9uKg+rq7Q2dS7HCdH0RsAQhfE+T2SOiN/2WjJTFzPrU991w7fi+xf8piedtrbP
	rUT/e+tdcEopf3gVq/+AXse4cp5pHCI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-0hmOsIAIMt2yJF6tZY3kXQ-1; Wed, 27 Aug 2025 13:12:28 -0400
X-MC-Unique: 0hmOsIAIMt2yJF6tZY3kXQ-1
X-Mimecast-MFC-AGG-ID: 0hmOsIAIMt2yJF6tZY3kXQ_1756314747
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7f7b2d52958so39693185a.2
        for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 10:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314746; x=1756919546;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=;
        b=eW5tuiWMpq6XfrBYlYwyLUuVMi5XsIRbAMkJAxy9GrhW+CKXQrs6/NzWAgkNFsaewJ
         2Q8r7U3mgrFrIDbWikBGScYmjz+hK8QbAoAwQkY6Pf9p4eOn+zCWQKKAxb1Q+ESivzUQ
         NfmjhDO9VKCXoSj0svb0inDY0s+mr4XlzioAnxokLmva8ZrnCnBL4e1X4zxZZneo7cEG
         gDbDImwJenIp0aIxRrcT16glayzFbIWpsb2p5OLUmnRDq8NpzhXCLcim1Julk2Awvp75
         dAQvG88JSMBIUj9VYjGQeGBWLEs/GqFmcf95EjHN5ARub1FCTBfjnLtkMFiDSX/r0T0I
         I/cw==
X-Forwarded-Encrypted: i=1; AJvYcCUjvVOsup0SnbBjLGVcB30n9Npgot9DbAIds8I7RDCc/sxfM6MWwYCDN4bQAyLLgbLaKH5runbHaqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBFUtJZ24tB0Vz/9zm46DgX/YF2wScdWykux6hQirDxQshQeW
	kYxKw1wyJNG53orBBobDx9rmkohxF34gz7Gy+yoH6H6VVys/G9S8/GHRPTU8G4hJvE3p2CBuctI
	RO9vrAPcUgqwAE96Oiz/okjYjoYbmzz/1so/KmRbuP+/62w34FcZIC3z/zpx27g==
X-Gm-Gg: ASbGnct40vQzcTjfl2mKyzj2vDIW+qtUrLKaCySf9YyXW6URdTT9XISXuLFeiaRSQAj
	FCjP7xnkq9SY3pUj+18UICf7dndGEtLoQbmg0bmtZewR+/ofw4snJaeXi97lFiTBfEXKD1PzxG7
	DWLtexetIBIxZYQRvpcQ+lswseftSb6U3hLN/679LtMInzA/gAw6dTOgtk8ZEx9RVwW4FIW6NuX
	GLZc0sMJX+5f5toMUW8enHtHwZ/vUcNqcPeLWIG/pTGiMvDRVZ7TYT8fRjO+0hSs2E+hpgvumnt
	cQCWFUVBHFZkcMN2pgt5zsK60tO3s9D5ri8o5FE/1aONMEtIQyZmj4Rsj+M7BlT1aObfdGUGjxi
	dJLs7BeFZHBvZYJmJRL42DDVTt8CTXqkZ+g==
X-Received: by 2002:a05:620a:1920:b0:7f1:8b22:35b1 with SMTP id af79cd13be357-7f18b2235ecmr1243375185a.83.1756314746338;
        Wed, 27 Aug 2025 10:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHgQzklZ25afIN2UyeYjisBxqH9PGDR2eAcGa4awGEaZEQH/Lm6l47YrGmmWNZAyud13+rQ==
X-Received: by 2002:a05:620a:1920:b0:7f1:8b22:35b1 with SMTP id af79cd13be357-7f18b2235ecmr1243369985a.83.1756314745803;
        Wed, 27 Aug 2025 10:12:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf4a1cfe3sm887374785a.75.2025.08.27.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:12:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 27 Aug 2025 13:12:07 -0400
Subject: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGY8r2gC/x3MTQ5AMBBA4avIrE1SRfxcRSyadjBByRSRiLtrL
 L/Few8EEqYAbfKA0MWBNx+h0wTsZPxIyC4atNKlqnWFdpkx2JVRttM7FHMQVpS7QjVNlhcGYrk
 LDXz/165/3w8ePB4OZQAAAA==
X-Change-ID: 20250827-clk-scmi-round-rate-7e3d4099134a
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756314744; l=3344;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ocvtdTl2hOZOQ/4oos7E0kZJWuxHuy23o8Wb53TCSIg=;
 b=EUWRUgkqHWynVd1A4xl577sXaTq1HwLS666cge+27XtKzJ1tgwSvxjvJBVFfBZCaPJJV+FVrZ
 6+ZZlQE6K7YAopYkUFzodxnL2XGOChCHk9zD5shzQ0A1tzFxrW4Fqte
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops.

The existing scmi_clk_determine_rate() is a noop implementation that
lets the firmware round the rate as appropriate. Drop the existing
determine_rate implementation and convert the existing round_rate()
implementation over to determine_rate().

scmi_clk_determine_rate() was added recently when the clock parent
support was added, so it's not expected that this change will regress
anything.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes since v1:
- Split out individual patch from larger v1 114 patch series
- Drop noop determine_rate implementation; convert round_rate
---
 drivers/clk/clk-scmi.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..78dd2d9c7cabd18f2a05cffd0408cfefaf34fce0 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -54,8 +54,8 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int scmi_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	u64 fmin, fmax, ftmp;
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -67,20 +67,27 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * running at then.
 	 */
 	if (clk->info->rate_discrete)
-		return rate;
+		return 0;
 
 	fmin = clk->info->range.min_rate;
 	fmax = clk->info->range.max_rate;
-	if (rate <= fmin)
-		return fmin;
-	else if (rate >= fmax)
-		return fmax;
+	if (req->rate <= fmin) {
+		req->rate = fmin;
+
+		return 0;
+	} else if (req->rate >= fmax) {
+		req->rate = fmax;
 
-	ftmp = rate - fmin;
+		return 0;
+	}
+
+	ftmp = req->rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
 	do_div(ftmp, clk->info->range.step_size);
 
-	return ftmp * clk->info->range.step_size + fmin;
+	req->rate = ftmp * clk->info->range.step_size + fmin;
+
+	return 0;
 }
 
 static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -119,15 +126,6 @@ static u8 scmi_clk_get_parent(struct clk_hw *hw)
 	return p_idx;
 }
 
-static int scmi_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
-{
-	/*
-	 * Suppose all the requested rates are supported, and let firmware
-	 * to handle the left work.
-	 */
-	return 0;
-}
-
 static int scmi_clk_enable(struct clk_hw *hw)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -300,7 +298,6 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 
 	/* Rate ops */
 	ops->recalc_rate = scmi_clk_recalc_rate;
-	ops->round_rate = scmi_clk_round_rate;
 	ops->determine_rate = scmi_clk_determine_rate;
 	if (feats_key & BIT(SCMI_CLK_RATE_CTRL_SUPPORTED))
 		ops->set_rate = scmi_clk_set_rate;

---
base-commit: 3c642997252eef4449cb6b6e02af3dc22515d817
change-id: 20250827-clk-scmi-round-rate-7e3d4099134a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

