Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7130205B
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181934; cv=none; b=fYXN1Gb7vE1r5AQPbYi3gTmgVjMeHWpMJoFyLuE/aUXCRqoBYIPGDl8g8P0vS6nm/RaXmS9cQS2KVv12OGQumTtuI5KfSI9K62gnkmTriHZ1r4BKuHf6ldRp9hcRuXgtm5Ww36ru/rJNUoI6hf8Ox7gi4zQEWlkLWh22aGEbImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181934; c=relaxed/simple;
	bh=v3hdhBOHK0qUhvNSpx+BtyoEKUPgUNG99ieRMqbb8UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGxfAY1DsdUBZ5G5qjedSN/bV28IDJmzsu5I/eIWbOGBZxBvgW27vOcJnTGgRQ2y+zSXISG6VJGP5FmtI/06P6AckukN1t7U1UIzhVHoEBLnwvVObcqBgtj0h09JshkxMh5yZvj1LrLhAU3sexM/YVQTmbLmAeQSn33r5wxSg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNuigGG9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNuigGG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=;
	b=fNuigGG9K5KmdjmZ/v8aifB//EJ1LnAw68+DB4usd5wNHesVRT85XTLaCxA8BTCgRXgyyw
	H90wZvPrsdXgEA83CvZRZKdpR8Xnz5t2GakhZ3uWdFXyN6zDm07mFYxoAf8YfsBAVsWbxW
	PGWkJjCav04vKOWjRt0ot5VxL2dCFxE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-RmFd5rr8PQmao44j4tXafw-1; Thu, 10 Jul 2025 17:12:09 -0400
X-MC-Unique: RmFd5rr8PQmao44j4tXafw-1
X-Mimecast-MFC-AGG-ID: RmFd5rr8PQmao44j4tXafw_1752181929
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234a102faa3so10457835ad.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181928; x=1752786728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=;
        b=vIsL6SDAPuuXUf0fAcLaHwxjEAxsecEL41ntt2oG0vVaEVqDejCfM+8rmgtFF4iw1B
         iXTCzBWZ3Hi8nfHG0VdyG8mSb+JYrEyXqwVKluenJTBNnphZJWRa766XtNF/GOwgtu++
         T0ITygVE+VRM2DAB4wRoozBOLUnRL9g0oAe0/SXeAA2MYjadX5GB1SxPCjySbgZ9Hruv
         qFoFkdSs4n4OlXEEv2v2zL6UtMfjzytyrKSsUfmdTkWv/Lm5P8FDfBNxlDprEE9HDYGW
         h9e36gJ/lqc72KC3bgZE+xK5SEqNrqmLeWKaz2I9okiHnpa+j5ZXE5tg1jNGPqYGa8Rc
         +jjg==
X-Gm-Message-State: AOJu0YwWhLIsHWs6DExalsSK01bv82bKCDq9QBbQk0cDnhWu6Bvfwb6h
	dgZZy21XFEjhk+YBdBtSO6VBt5C+BCuiuZh5RXU8QYagPi9Vc/uEzDOxtMWDgyjiOlekbDt+4r3
	3GvBW2YWIPDUEMaQ9YIecaCr+R4s1qg5vC4I5GQ7q2EdTI8qPvbbG4IKklljHaA==
X-Gm-Gg: ASbGnctoPgaNaQiThlcL+tu3VtsdkwnLGaUcxfC/C2MO2Oz9mDYJXelcXYCjB0DDuou
	8RpzpaM2OtrIV5m15V3RJLlZSJRPJ3QFIXU4fKYdbgkpHQ7WUq0BYy0X3/kWHcnFSI4fPLXxU5G
	1SkigJgjmNdLCwenyWsUG/Bh+wq5Bk0XhHSR52UZWtVHlm+9HxmO0lsJaCDdtyYCBa3KyIPFBZM
	UN69xEdSyR0ZrHenDZMoQY2XS/QnJKM7jNxl0nDV9iZ7lmwaKq0D7tST7IMnRcXCp9WObhNFsbR
	PtFOgw0VxCqQfvOAAx//86eafxm4B9pTciyY2qzCULxLVw==
X-Received: by 2002:a17:903:4b24:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dede2d292mr8885975ad.8.1752181928462;
        Thu, 10 Jul 2025 14:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfqFdZB30s9Ns2OTuViOndMsHrV92VUKAaa3t7UGJI0pLP81WIaExo2hP4WyXbE/2+Ovdog==
X-Received: by 2002:a17:903:4b24:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dede2d292mr8885575ad.8.1752181928069;
        Thu, 10 Jul 2025 14:12:08 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:12:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:45 -0400
Subject: [PATCH 13/13] clk: imx: scu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-13-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=3280;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=v3hdhBOHK0qUhvNSpx+BtyoEKUPgUNG99ieRMqbb8UE=;
 b=8ZgfFYF2KZsuweqpz1xsyECauFflmi/TsZyTLp4K/6NlZj8L/AQUvX4HpvZ6yVLmtnZpaXBYR
 CufxM/OrxNxAF1m7eYGGkqwIl0G3siaDy/4VyAsIls9Ss5jZ6J2R9M9
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

This driver also implements both the determine_rate() and round_rate()
clk ops, and the round_rate() clk ops is deprecated. When both are
defined, clk_core_determine_round_nolock() from the clk core will only
use the determine_rate() clk ops, so let's remove the round_rate() clk
ops since it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-scu.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b27186aaf2a15628910ea6a3d4aaa5320ec4295a..77c4cde8a72bd71653bbd2e95148bc1357ec1aae 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -269,24 +269,6 @@ static int clk_scu_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-/*
- * clk_scu_round_rate - Round clock rate for a SCU clock
- * @hw: clock to round rate for
- * @rate: rate to round
- * @parent_rate: parent rate provided by common clock framework, not used
- *
- * Returns the current clock rate, or zero in failure.
- */
-static long clk_scu_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return rate;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -454,7 +436,7 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -462,7 +444,7 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate  = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -766,15 +748,15 @@ static unsigned long clk_gpr_div_scu_recalc_rate(struct clk_hw *hw,
 	return err ? 0 : rate;
 }
 
-static long clk_gpr_div_scu_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_gpr_div_scu_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	if (rate < *prate)
-		rate = *prate / 2;
+	if (req->rate < req->best_parent_rate)
+		req->rate = req->best_parent_rate / 2;
 	else
-		rate = *prate;
+		req->rate = req->best_parent_rate;
 
-	return rate;
+	return 0;
 }
 
 static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -793,7 +775,7 @@ static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_gpr_div_scu_ops = {
 	.recalc_rate = clk_gpr_div_scu_recalc_rate,
-	.round_rate = clk_gpr_div_scu_round_rate,
+	.determine_rate = clk_gpr_div_scu_determine_rate,
 	.set_rate = clk_gpr_div_scu_set_rate,
 };
 

-- 
2.50.0

