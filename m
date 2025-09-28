Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8D1FB3
	for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 00:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759019059; cv=none; b=WlaMwJi0tmZK473uLzCDj0iaO8iaFlzHW6894ZwmSPEMdLi6hw0CBRZzduG84D/qaoUbW15i59yK+wHnPFql866CC2rSijEP0IvXqpbjd8LRT4N5Vn3o+ORZErujT5GhRwLqXGzFCy+1OAG6K3aE0AJktx9jgcgsONQt7cwpmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759019059; c=relaxed/simple;
	bh=ba6wzr+UFiyiYoFNVhxsMUJoo6ADljhE38nRvbuUDTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HGrOfXXjA1qVXaXgyrYRb1NS8vdsSou52th/Xsrmr/rCdjjnzLgK915O2ryuJa9/UhVCPdD7ObQfzKFVA37JZwvg41kavFaYpZwH17U2L3ayQImKU+O4TIL5nk/067odh8Z6NK4D8cLkpT8sVFrISaHWVmOlRkYVrI0fU40LBMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J6jdo4ZC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J6jdo4ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759019056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=psSCqpeBnzhLzJkdjUsfUs2VDXVmpZ0fDDgl3ZWHtDc=;
	b=J6jdo4ZCCt3ythfZYrSJxloKem4q/5a1lgCV+IH7GlSt/ehq5aAJylo0vuBCQZkDmLm0SP
	HiUP/SLi/1gxgvroqDvjsR+koPMXP1XWHnlZU5LMy5iXA5X5jyGLWuRKTW0VIFLzgAsuiF
	lwWG5z7qyEAinWYHshhHrSS5h222sgc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-atds4FI_NVS5AlUB_qn3nw-1; Sat, 27 Sep 2025 20:24:15 -0400
X-MC-Unique: atds4FI_NVS5AlUB_qn3nw-1
X-Mimecast-MFC-AGG-ID: atds4FI_NVS5AlUB_qn3nw_1759019054
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df60ea7a1bso12536971cf.2
        for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 17:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759019053; x=1759623853;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psSCqpeBnzhLzJkdjUsfUs2VDXVmpZ0fDDgl3ZWHtDc=;
        b=GyW8z5EuCUk3yzl8zDtljFM1ia+dPKXCgSrJS+vLOfO6t0vxfc67ZKs6EtErB/rxnL
         EzN2URFaP0upEqRlXC8K8lKVuI99RDv04/qY68rtfXVpJmHRLAO8R+66jPmAZ0MAu+5+
         nynYjQ5yidfM11+38Hme695p7bnxa/BX2rtHKcQL22wPB+CDf2B5LpLYGvwcwDOijosI
         WRCUNeLhlY6TbPmXmmAZ+ENRoU+/vEdHwEi5x2Abwg339c3pZ0JmS2Q+IxRZjDu4wICA
         yhdg0MeE6nqqrrUtMD2mYTtvVLteb/e9HFmRkJvp39hPw3ciO+S1cpC6c3QJJOtoSRf+
         rrgQ==
X-Gm-Message-State: AOJu0YzwzGJvs1hP6tOa4ixKCUenyO4pqa7HtaENkwKwUqNVAK8q7HV5
	ziY/Du72ks8eoN0F2MG/zBjEOYzes6hjh4QU3cu//Qj/8fdqs2s0pag06FkWPyhpxJddCX8zaod
	WBl1v6eUh8FJCWpXdZDhe4bHjEVcAD4dMENwogCjk3NRzGIpYtySqvbX8kOJPaPWJR1eN4QQrnT
	IjuQVHK7Kxi9zlOask6db/lQzWnsrQsU2cUd/7nIA//XEJ
X-Gm-Gg: ASbGncsGWNzsaPKD0WvVPZdK+5O7QMUc762sBx1/eZ/JNe82RCX3oOIYIoGn4j3DuUu
	mOidHLxkYp7k1sTDlWU0yPhHcxvpodpxcaUD9UPNPpuJbd5kcKPUEktaqyQPHdkKTzOGzhFDD31
	whd6QKNtOtLyeXrUJx7fzwu8nMnI9EkLNPV5VTCt6N8X35sF54yPaBXjGdFRNeM10thu7OE5DGc
	318nBfbey/qUlwULFePuyQLV4HvUq1rCPRVP/V/q7IgTLm60ivNhlMDlEmEE6aZIpgqqA4AMc0s
	XemeVUqelRQrFpI7VKAK715WhFuc+yRx/iNAZYV//hmKz9whdK++pjrRHBEIfaeuBXZGQvah8EH
	3N0S4Z7axMihxtT3k8gf1+VZ9PEAVIRFe/RlZ
X-Received: by 2002:a05:622a:581a:b0:4b5:e49d:806d with SMTP id d75a77b69052e-4da4bfbda28mr165455001cf.55.1759019053535;
        Sat, 27 Sep 2025 17:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyQvKy9OezR3GY2xuXQhprsGnXj00ibUT8p4YTmVwsRyJDVxfzmm+JhnWEed6nQBwgNhgfBg==
X-Received: by 2002:a05:622a:581a:b0:4b5:e49d:806d with SMTP id d75a77b69052e-4da4bfbda28mr165454781cf.55.1759019053103;
        Sat, 27 Sep 2025 17:24:13 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0b94353fsm48463401cf.21.2025.09.27.17.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 17:24:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sat, 27 Sep 2025 20:24:00 -0400
Subject: [PATCH next] clk: microchip: core: remove duplicate
 roclk_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-clk-microchip-core-compile-error-v1-1-c5c3bd633c5b@redhat.com>
X-B4-Tracking: v=1; b=H4sIAB+A2GgC/x2NwQqDMBAFf0X23IU0IFZ/pXgo64su1SRsRATx3
 xt6GZjLzEUFpig0NBcZDi2aYpXnoyFZPnEG61SdvPOt633Hsn55U7Eki2aWZKjYsq5gmCXjgPA
 S7zC1AVQz2RD0/C/eFHHuNN73D/ZpznN4AAAA
X-Change-ID: 20250927-clk-microchip-core-compile-error-fef8c20ed5fe
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2756; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ba6wzr+UFiyiYoFNVhxsMUJoo6ADljhE38nRvbuUDTg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJuNGjldiv//RN+t0fu8kS7hQF5G2MWrfjXJmcTFKxpX
 lhk/Cipo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkU2TIyPL1/o6765IaO00qp
 JvsZ7y4/kOnzwnPf1ybHS6zbX5/cZMXwV3btnFcfo4O38vGWXKpfxJpsOH3GtcoJp65b9T+TlXV
 9zQsA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Fix compiler error caused by the round_rate() to determine_rate()
migration.

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

