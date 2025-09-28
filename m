Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BFD1DDC1D
	for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759019694; cv=none; b=fxzQgCzWs72CG6eXFDPw501Ru9Tvlmos1Ojy6Yf7SanteiGzeTxxtjN7aUuRemnsTmdDffMoBBOXpOiFiP7IR1d8HoAdEcRH7b97Ab+Kvl1ndFaNM2V1nTzP+5R1RQmstcynjobldTmVMOOMAVE3iUDFloxirJCJLUQDfOMfKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759019694; c=relaxed/simple;
	bh=jKCoSlxik5OsSiTMu1gczcSV+m6raIbTcbI0mrv1YBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pnwQjVppmYjyV8lM51ml4kQbDeM2epcvuP13kIr9tgQtMfb4aTix5wkIUryq2ATxocbC6WpkL3WQTN873wQ6TnCzM5CNgeTGbeAySEsWHXd89rHagbEVkZ3RwdikzaIaYBDaDkF4Ez2B3uXh+bA9arBoNtxjMR5+08jXzOQENSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WaVgs6xR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WaVgs6xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759019689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDSI/1zqLdM0Wxroix37DD09bywHURo3GxO78hmDEtU=;
	b=WaVgs6xRzmmUUXIpLvX9NRpiwgV7OMx02/QDVPHKP8KCW6P3nznQygp2rSwjDCADwBjidg
	qi8iUG82aVz7n7ODfi7rKKNdpCa3GdfTg1ez1hlFOBnu8JHXIfiSu12cJtGvdSpq3efGoB
	Zd1O/TLBQ/YF7Rmn6SwSwE+zjWhLfp8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-4Du45MS9PemZGgjxK-XXgg-1; Sat, 27 Sep 2025 20:34:46 -0400
X-MC-Unique: 4Du45MS9PemZGgjxK-XXgg-1
X-Mimecast-MFC-AGG-ID: 4Du45MS9PemZGgjxK-XXgg_1759019683
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b302991816so65827771cf.0
        for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 17:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759019683; x=1759624483;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDSI/1zqLdM0Wxroix37DD09bywHURo3GxO78hmDEtU=;
        b=tZGeSTXmcyvfDccfZk8saET/15E65++rjRfjBtHhs/XyUWcs0s93xm9UZO5dh6Cnbf
         lcvJ+UlcC0r1C8buB2sicB4a+c0bLIhZjerK+8Y1S7wMMvI9W06Z6aJZCTeNdN3dvkMi
         qbuH76muB5pxMKma7/JblDo8tGawltUpdSXtZqjWrTbxtFJC7XKXN4YwNxHfJI++3P65
         MAmvSv8KslV8ygO+tyTlMp55/Ajx2uiYgYmxCqz1ggwC0bgw6q7Ge60GeqpbUskD/gJK
         k5z/Pk8/TVdiA035o7BvZhzUocYTwn2jYY8BYcA80aRPGYEAg+NG78uM5uI0AstUaWJr
         /pWQ==
X-Gm-Message-State: AOJu0Yw2EDQsI5kQkDs0YLoaPstweSIVB4gTIR+0MUrVMgd3Vca7jR37
	RWVJhBRdftZxVqcSIbqgsngw6jzgngpXm0pD+WUVyphOZK0R5qqAh1+MeSU694UpYjcPMw/CwNG
	Tc1AEwlgDmBaR/MEEyr52lTYTkm86+Qq+lePRumMjrVCVa8HtSc5XxDFUT4uL4XJ4487VkQ==
X-Gm-Gg: ASbGncuGSRW1FsjI4yzFbt5iihYe4c9zgbvK8x4WvhtAqYbNTglVCNTJJm0mAr69ee8
	ytKaUpOGyZZ19hjxHay76jb4WyOfvA8JC8I9mXrsYSR6tOVCzeJCMHl9aaX/M6kV1WhABR2XgFg
	3VJHpl1HaTOBqOr8ukKdqxjD2x6bcs17/B9wwjuD5QusWQNoJRRPdHxSfdr1ZZNmAiabytLIi3s
	ydWKUGZFaSiRIQiCg+lXRIn+SdfG0bZ058yVgY+uCr2WnOLDRsv4SrTx44S4eEAzE4j/0wIP0mU
	q9fXgmdPnG2ft1xtQrvvWST2lzuWnowTb4D7kFRP3ifLihARUqTm/LuHteRVJPzB/3ndDvkC6X3
	6ICRMFUCBtc24pBYylHGYpSDJy2l5L8ms548p
X-Received: by 2002:a05:622a:1b2a:b0:4dc:ba40:6959 with SMTP id d75a77b69052e-4de2da0a2eemr75873921cf.20.1759019682941;
        Sat, 27 Sep 2025 17:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfCqXyF7ngzZiwiTE/uCSPZRmfVD1+tJaS+wARjoa8gIIdb93/n2ykPM3lDbrGZqqQo8eZfw==
X-Received: by 2002:a05:622a:1b2a:b0:4dc:ba40:6959 with SMTP id d75a77b69052e-4de2da0a2eemr75873751cf.20.1759019682539;
        Sat, 27 Sep 2025 17:34:42 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c34da236asm516558685a.68.2025.09.27.17.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 17:34:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sat, 27 Sep 2025 20:34:34 -0400
Subject: [PATCH next v2] clk: microchip: core: remove duplicate
 roclk_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-clk-microchip-core-compile-error-v2-1-3473dbae3625@redhat.com>
X-B4-Tracking: v=1; b=H4sIAJmC2GgC/42NTQqDMBCFryKz7hSNpH+r3qO40MmkGapGJiIW8
 e4NnqCbB++H922QWIUTPIoNlBdJEsdszKkACu34ZhSXPZjS2PJurkj9BwchjRRkQorKWYZJekZ
 WjYqe/Y1Myc56hnwzKXtZD8QLRl5naHIaJM1Rvwd3qY7uf8RSYYVkqe7cpa7Jdk9lF9r5nGfQ7
 Pv+A0CzDd3XAAAA
X-Change-ID: 20250927-clk-microchip-core-compile-error-fef8c20ed5fe
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jKCoSlxik5OsSiTMu1gczcSV+m6raIbTcbI0mrv1YBo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJuNC2oMnpuJiUtd8s1XTL0bd/2CSqG7G6nm7u27WXYo
 L3sU8nejlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyqZThf+raebpfj2Tt2M3/
 /LbhHtY4yXNrT2+7vqpv24VLlaKHuRcy/M/sVzThjvxyccK/zvCgV6GFfTPn3hDMmi98WrnsF8M
 kfQ4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Fix compiler error caused by the round_rate() to determine_rate()
migration.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509280327.jsapR0Ww-lkp@intel.com/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
I didn't cross compile the original series on MIPS, and this driver
isn't compiled with COMPILE_TEST. I couldn't enable COMPILE_TEST for
this driver because of the asm/mach-pic32/pic32.h include.

I didn't include a Fixes tag since the original commit didn't make it's
way into Linus's tree yet. I'm not sure if you want to squash this, or
include it as a separate commit.

Fixes: e9f039c08cdc ("clk: microchip: core: convert from round_rate() to determine_rate()")

The SHA is from next-20250926.

Changes since v1:
https://lore.kernel.org/linux-clk/20250927-clk-microchip-core-compile-error-v1-1-c5c3bd633c5b@redhat.com/T/#u
- Add Reported-by and Closes tags
---
 drivers/clk/microchip/clk-core.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 3e03e10539c72cc28e53401093e37409c2ea3d08..b34348d491f3e1b576b2b9a8a66bfddd8c2296ea 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -374,20 +374,6 @@ static unsigned long roclk_recalc_rate(struct clk_hw *hw,
 	return roclk_calc_rate(parent_rate, rodiv, rotrim);
 }
 
-static int roclk_determine_rate(struct clk_hw *hw,
-				struct clk_rate_request *req)
-{
-	u32 rotrim, rodiv;
-
-	/* calculate dividers for new rate */
-	roclk_calc_div_trim(req->rate, req->best_parent_rate, &rodiv, &rotrim);
-
-	/* caclulate new rate (rounding) based on new rodiv & rotrim */
-	req->rate = roclk_calc_rate(req->best_parent_rate, rodiv, rotrim);
-
-	return 0;
-}
-
 static int roclk_determine_rate(struct clk_hw *hw,
 				struct clk_rate_request *req)
 {
@@ -398,6 +384,8 @@ static int roclk_determine_rate(struct clk_hw *hw,
 
 	/* find a parent which can generate nearest clkrate >= rate */
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		u32 rotrim, rodiv;
+
 		/* get parent */
 		parent_clk = clk_hw_get_parent_by_index(hw, i);
 		if (!parent_clk)
@@ -408,7 +396,12 @@ static int roclk_determine_rate(struct clk_hw *hw,
 		if (req->rate > parent_rate)
 			continue;
 
-		nearest_rate = roclk_round_rate(hw, req->rate, &parent_rate);
+		/* calculate dividers for new rate */
+		roclk_calc_div_trim(req->rate, req->best_parent_rate, &rodiv, &rotrim);
+
+		/* caclulate new rate (rounding) based on new rodiv & rotrim */
+		nearest_rate = roclk_calc_rate(req->best_parent_rate, rodiv, rotrim);
+
 		delta = abs(nearest_rate - req->rate);
 		if ((nearest_rate >= req->rate) && (delta < best_delta)) {
 			best_parent_clk = parent_clk;

---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250927-clk-microchip-core-compile-error-fef8c20ed5fe

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

