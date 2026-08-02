Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0EB25B0A4
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785634375; cv=none; b=Z1h6IzT19PiaT2poa9ION25GzHUuKDnxZ9xPZg+2NE3LLhEDIXvwx2kQLVhJS1uhzzXdknFFEpRspUX3AafSLR9xu0S9SQKE/x12pL6IZcEKec1FjoSKKVTSCUSVxLB+TFbsE0ZA7SGDU2vPM+0G96nvSNP1mqMtY96Dz3iZ1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785634375; c=relaxed/simple;
	bh=737V7sPqba4RJugePF5KzW8sOzSxv/KfrgDh6e0kj1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OESItuR6cv3BWqsLQsAaw+U+ri6nLPa5/CWQf5GaZlTvE3NMPZ89DkDZg3wh3PW+hgFtXr1ROp9kdJIWpSm1bnr/p5EslV9PDQMWAWEIaS+VjP+hn9JT+iuZmzLiLqvyRd0/5/BoXLYu5lJgG3MS2X72N1g9dmvLYS4bKt+Y/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM4OlYLp; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM4OlYLp"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2095420a91.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 18:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785634373; x=1786239173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MgCfIvqyg6mlNj5eX8RGEdTT5G8l3x5wlXd1wjha+lI=;
        b=PM4OlYLpVt93Fv9Pja/69S8S5NYcNwOK9oA2p2YG112Nkmr2EAp3S5MiDeuHjwygEh
         olOzN5MQVv2RDXzd/oo4EMbapopQEplYhUZ6XFVFgT73/KifLFeMarxaj1a0ChElMEc1
         zfxhgsuY3xtz5RxmWGZk6Vh9bm8ylJtfAFSI9bp6aiIFiSeXIksP8ilMNVj3xetCwx8t
         JXnt4TeQ8lYWfLXAAFqYQDtR9EmViu53T69fgCSmdJk76YjxdPzkQY6luG+MEXap9+X5
         E3tM1YMBtfMuMtvMN2DrSS5Gvr+HN1veTtXOjk3JxW2GYBSqKcOHjPwb1puEOVGBHSJ5
         fvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785634373; x=1786239173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgCfIvqyg6mlNj5eX8RGEdTT5G8l3x5wlXd1wjha+lI=;
        b=JP2t3XrLi5fkCI6W6X5eeZLFEAGloG3Ib5XvLqYVvXRMOKGAwUXJjeVZF7NUwmUhWj
         b+Ew79vl6WeEj3REUNVnAlVEP5vkqjyCuUZ/LezJey1KuTIN4KwftMWCbVZCAeyrPzpA
         UYwlAiadFPDKM7DwjX4zYVJXAPMyH9Vbi6WmkKJFrVj3GeGBurKi/O/Yo1d7g6eSDkxR
         J/pYMeL7AIgBkcJBp0IEnJbz+/8yxQ6w8Vk6Y4DUigb09TyJqX0+4ppyDCUjNMB0KWKs
         LC512uQ3us4iSchNzomV2s4cNqPHjphhrVMNHMdwDyg0RMPg3j08KVgt7hyuCLymIRn7
         r+iw==
X-Forwarded-Encrypted: i=1; AHgh+RqkK555AlBwFWB8TRC1RGoJCoAFILgaQhnqQ8kjIG6LD1VOfFPsA49nzhtW9VPLCqDpOlkzuwoBt14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8AJo7gINcKX3uoWxBDgG2xLVrnIH/kBa1I2Zjd5Ud451bPtwA
	NAKSpw4gVobt14YKiTy6qu970qG5XSrzIw8kIGnCO/VmDjSy+sRd26Oo
X-Gm-Gg: AR+sD10MomYUqEaK+TonzKneCXLxOvymP1XBH6fkNQ8F/bLUUGUrAiyvPDElRbF5puz
	vbUeSGhPqEDxB1KRgY8pnO9T8EZ9T1+n/pnViiiHrDAc+bkVwJlmZPMWdRiBiwaH3dNsFNtYaO3
	u1q1FsxXIRmrgHyGE+5nfrdkWnGfWGPRMcD0q6jJBbaw0DvDjgKHubjb1SH1kuvN4yQSPe7RE+d
	62uqqd4+cpHY40U2g6OzoNdO8uiuA4n1pQEW9v8R0jHPqI5HQ23ScJWh9KwgXjGRv+ybAIsEpGL
	WkIc7D3RH6eMvRB/AfHSsDl2WxSz4pX9G+59HPcN2IOMJ6Jh4W1mATidJOEUuUsNj90zJrIdy92
	+pUY6TsWHIRGIoZaLsc+qWAot8ij1k03/xg5ITNdNdBRaxoDZ8Q33RwNnhbi1IQVyJNSuo3rCuG
	0sET+EccBps7CO9c693fR7gtgE3a0Xya4DadTvnjGfKcRwcIWuP+5kCBSkFubf
X-Received: by 2002:a17:90b:5824:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38fbc43a847mr4897647a91.14.1785634373423;
        Sat, 01 Aug 2026 18:32:53 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2afa8f3sm1662312a91.2.2026.08.01.18.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:32:53 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] clk: zynq: pll: Fix kernel-doc after determine_rate() conversion
Date: Sun,  2 Aug 2026 01:32:52 +0000
Message-ID: <20260802013252.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
determine_rate()") replaced zynq_pll_round_rate() with
zynq_pll_determine_rate() but left its kernel-doc block behind, so the
block still names the old function and documents the removed @rate and
@prate parameters instead of @req.

Retitle the block and describe @req. The Return: line is updated as
well: it described a frequency and referenced the removed @rate, while
the function now returns 0 and reports the rounded rate in @req.

No functional changes.

Assisted-by: Claude:claude-opus-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/clk/zynq/pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 44c6093783641..500586f50d7c1 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -42,11 +42,11 @@ struct zynq_pll {
 #define PLL_FBDIV_MAX	66
 
 /**
- * zynq_pll_round_rate() - Round a clock frequency
+ * zynq_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
- * @rate:	Desired clock frequency
- * @prate:	Clock frequency of parent clock
- * Return:	frequency closest to @rate the hardware can generate.
+ * @req:	Clock rate request, updated with the frequency closest to the
+ *		requested one that the hardware can generate
+ * Return:	0 on success.
  */
 static int zynq_pll_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
-- 
2.43.0

