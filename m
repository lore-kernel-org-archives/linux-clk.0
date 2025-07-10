Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D84F301143
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181918; cv=none; b=Ny81g0rRmEZ/y/BU0idWaNRGupWEpVSgUenVdvR+fuLNB9x6SJ97834KMnXhtEEn0AntHFDr3r1k4Ee5b83sC1lT7s9dyvHkug8OcyPbCpGMZotAW/V8CcItp05yU48EWt6QXKz4Tzbg1jLhmExKOxxbOmjEqNJGcDd1T/8CyXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181918; c=relaxed/simple;
	bh=iCQSW+rl8jgN4muSCz6LT4Tmu/x4mnNV6P0yGM90s2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1pIV/zRjjg/HumZS9jmH9yznaN/4j2gbMWTXdyophw/2bDexgE3MQmzSagUnCim0/Un1aOOiLJuRGFfKFnQGyDXJQMS/mH5Iipf5i7A1GOxREaAqR9awPtxUc6fiQG7b6HyqlbsubRk5ksFCQpyuPMn8QGyqoLPVDWi1Qkuq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bfVIBah2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bfVIBah2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=;
	b=bfVIBah2aw+fU4RVMV8zf2Umgbj4kqhet6SnIyOiILBd2sizPawOAtHe679yROd1hkZqTq
	W0gQnwbCZlpmGOZm+Gl2rNVuOn217sZbmLx+kJEmUWhl8RoWHZV/rVWGuL/KnrDL37eHRf
	OOByjSaJmZerHWaooi5FBAMCKtKq3Ws=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-ZhFyY7aiPESvNTGRWPSGZA-1; Thu, 10 Jul 2025 17:11:54 -0400
X-MC-Unique: ZhFyY7aiPESvNTGRWPSGZA-1
X-Mimecast-MFC-AGG-ID: ZhFyY7aiPESvNTGRWPSGZA_1752181914
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2355651d204so13975345ad.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181914; x=1752786714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=;
        b=SFLL3qSFIg3YLrDVxl1+2KKvWxapDXp6jLVXwZpo/gVBN3VLqSvgrOxEumGJaTxElb
         546BcBoWXavfJCMRT9F3uVHS1BhMETwnIplJTUC9diwWDxSRcdbVonp1KPDvQjbIUQxq
         ZFMWyuJ6xOsHD/1/NBfIfHFCfd9+KFDM69R/wZBc9e22kVBdJDAbupy4PQArFLpQcVkt
         wVjQgi16Qil1663S6Y2ndd3MCxY2z1JslzvoGl01eV4q5a+zuwelcnlVHv5f5sQBrN/p
         dj+qxaIHwTc25hgrSY+qP9qxHMlE5473QbGL0z5Su7FGIIiJQdBJ+tgcgBEivXo6X3S3
         GSfA==
X-Gm-Message-State: AOJu0YwRfPm8lPow4+tAN9UMQRWblCuzD8ava6Z6pELUqzEofZltxufV
	LF3Zijafm3P42ytSLVkqR0QRHCUku1cluj6GN8Uq2NvktyTPQMlMY7lMuipBwEYKzk4NKJZ0SrE
	1sY6+UA02NxzlqJrdKByVqPIyYLkD/A5Ay8NSHFTr38S8j6iGNLd80TDLn7F2dg==
X-Gm-Gg: ASbGncuqqyFzmVBzTrlfva0KEIJ0vF9VKnrc6G0ttp4rOK73XeKCUpj3ycMMCOd1kze
	HotSLSL6iLPqVHz/JWuH5EM+X9Bm1hWiKqL6BJ5qrH1O3OHC/gznj7S9NzCUc9ws2GdludWPWo1
	HEVCmQSPolKcTAMP3xnFO4kutHdgCldXrinsMegGM6k585Bdx2g+LcsvXagWn3FwwcCOjaQV5T9
	Z7ry+D2d8EKbVcTjHYF+SA7Zu98MMQoqYkkHM0KR3udzvhnNyRxP0B3G3VaT9IWQ8uelLFT2ncP
	OexnKxm7npXDOKE6rmh/IQY2Q/Sbw412Al0DOWb7cfcdww==
X-Received: by 2002:a17:902:d58c:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23dede2d32emr8791195ad.5.1752181913795;
        Thu, 10 Jul 2025 14:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAWwN/SjCjjk2C16hRtldR9Jrxr/5SqinWuYstCSC8yLg+VOTRMI3EYy8AERYnpIRY/BjZpw==
X-Received: by 2002:a17:902:d58c:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23dede2d32emr8790995ad.5.1752181913451;
        Thu, 10 Jul 2025 14:11:53 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:42 -0400
Subject: [PATCH 10/13] clk: imx: pllv2: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1831;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iCQSW+rl8jgN4muSCz6LT4Tmu/x4mnNV6P0yGM90s2k=;
 b=M715uGlNOTk/hsTjTOR0aXywM6syQIVmVaWNxKJVhBAQ3BGt2e3g40om9S0M0IRyr3SGLc/QR
 4mUGYd01DGABxTTGx9atuBwfFNnSmN4pS6Y2gxrB90u0wvVApCNrTSZ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pllv2.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv2.c b/drivers/clk/imx/clk-pllv2.c
index ff17f0664faad23d826d384fa8f972e21ebd7da7..bb497ad5e0ae3df923e8f01eb2b8af710f8f8f29 100644
--- a/drivers/clk/imx/clk-pllv2.c
+++ b/drivers/clk/imx/clk-pllv2.c
@@ -178,18 +178,25 @@ static int clk_pllv2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_pllv2_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int clk_pllv2_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	u32 dp_op, dp_mfd, dp_mfn;
 	int ret;
 
-	ret = __clk_pllv2_set_rate(rate, *prate, &dp_op, &dp_mfd, &dp_mfn);
-	if (ret)
-		return ret;
+	ret = __clk_pllv2_set_rate(req->rate, req->best_parent_rate, &dp_op,
+				   &dp_mfd, &dp_mfn);
+	if (ret) {
+		req->rate = ret;
 
-	return __clk_pllv2_recalc_rate(*prate, MXC_PLL_DP_CTL_DPDCK0_2_EN,
-			dp_op, dp_mfd, dp_mfn);
+		return 0;
+	}
+
+	req->rate = __clk_pllv2_recalc_rate(req->best_parent_rate,
+					    MXC_PLL_DP_CTL_DPDCK0_2_EN, dp_op,
+					    dp_mfd, dp_mfn);
+
+	return 0;
 }
 
 static int clk_pllv2_prepare(struct clk_hw *hw)
@@ -235,7 +242,7 @@ static const struct clk_ops clk_pllv2_ops = {
 	.prepare = clk_pllv2_prepare,
 	.unprepare = clk_pllv2_unprepare,
 	.recalc_rate = clk_pllv2_recalc_rate,
-	.round_rate = clk_pllv2_round_rate,
+	.determine_rate = clk_pllv2_determine_rate,
 	.set_rate = clk_pllv2_set_rate,
 };
 

-- 
2.50.0

