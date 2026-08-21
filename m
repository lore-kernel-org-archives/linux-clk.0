Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81726331EC0
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 23:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787356733; cv=none; b=jjRcpdIPC9dca4t9/8Sdiz5vjuQC0LKfucQvRiiTLdgIwwKAN63+r0qPHqcx6dDMx1CVNEwnC0uGsAg2ry8f+uBzmnXhmz5+DGXpo8klxCOzt6+eed17L1NAN+SrZL/QYHFOorNZkPnifu5zfKbgXfhMTCx5VjP09A8mttnVjYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787356733; c=relaxed/simple;
	bh=TuE2c0iZfNH1S7lUSfDr5VyClYyuD1z0aAEc0nKSpIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ua0LCS99V1OlBuRfgfVb/xDCJcP7oY/WPXQ4gbYKQSuiLCoJTxA/yC4OJySGyosRXi2zGa1jqy/AaS4FRljLlm7aGGxPpCgTA/J4dYADUp38F88rXR/s8sJeDMuWEKvqY0Vq8K0SODaJoZ3DcfB/zs8UsWPo5Sj3Uj9kFOiWvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As7C00g6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As7C00g6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caed617615so17296775ad.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787356732; x=1787961532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfADMu2KMEVkqXjLqt2cOsbz+PXBarm0PZCvaHp/dFA=;
        b=As7C00g6TpzJja9PyFzEBDQ4XYuH/J2UU3OfZ2wlejhe2xaLMHUq/rRfyEdiNhHUI+
         U7Lm812jIMzMGuGxUeWQOjTVixIFAnONyRFix0Z5ysg798C8ljM/Sy03QEQmMldxv5Kk
         yMzUA9Of1gD6vN73GUJMrx5Owaz9dzRVYsfk1T4eB7dyJ8LgmJ5uBWsYZ0tmGampUHOJ
         liilIZH/qdiqhMYLHRJPxl7Ow+kP+AKXfTmQeGuQxC3YFNcn+nJf6ltNubNDN6d4jFnv
         Cr2z+Z2s9qIQEyeZqhNvFFruxvqJtOgcdb5kFAhBLtmD4gPEWSsYWIrv3dmVDicdWzFQ
         8Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787356732; x=1787961532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfADMu2KMEVkqXjLqt2cOsbz+PXBarm0PZCvaHp/dFA=;
        b=Jx9Lk8MMHX7g9n+DowQk7tRpfuMIQmGnZnt3rb1lOm/6RNezqvTmJxfuKH/Iaau5LI
         qDRYtcxkmbiz99ksqlX/E53Y5j9I8JuKCyHIN/24KarWNTgB2b83npTlZJ8BYxSE4GvK
         8HT3YdfgU9nAG+ugU8moigAOC4EZLB2b+j7D7aJwmHTZ6VPhhBVTAyOKpmRO1A17V7Hx
         DsuTxG5MOr0ShfzJIoUDo37JkqcZltmaKmXFS5yf+tZrrea8zc7e9TraSCQcE3SQ5/Rj
         8QYV3zCDuo/b/JO7bbrWALwikoq/XUa6beKYQGzjPDAstbIs9vAYHXqzw5IyNFopy8Nx
         b7Vw==
X-Forwarded-Encrypted: i=1; AHgh+RpQYvSUgj0zNTZ/ArJsjkBZn/erY7hKVUhA8i8x8DjAb2Hbvbrh8HQt8RFrHsLoT4WR09s4NyCry+8=@vger.kernel.org
X-Gm-Message-State: AFuF++lq3wHnHuZ23rMCWs+7U7BxKjFz0dB0pLfWojwSoGvshQKNbTmg
	R6KuxUrgptz/jENZnl/hFhWor3OQvAOhZEW6kpFcXuYuy2khOjtie556
X-Gm-Gg: AR+sD1209IJ5uH/0NHQjK0GdrWGpahNea990wX6L+0g0s1OsqwDm758307dQbeUwLtz
	XzEVgnXIHwhfkDKMllBRI8pHAVTS8jusMsiKu3q4ouhyvn/SgL1n7pJii5Ep1BU9O4hokNCsLNR
	ePr7YxsbMZdMit+hrvgzxcXdSDuAwU4iO8i4JTQQDyHGZ5AYtN3SKxDHok0KCsFYD6q1JdK1dTZ
	ljy6nK7AXmXhpAKg6LKkhyu8kxTJzDRxuEn8I/EVaPSqMh74jCAV/5sZ3lsZS8Qn2uiIvTtvo6l
	ph1NDsON8iT2LH3CR8wjAsY+XPbTX7GFLifx1xgCtnqES4/3FswaDVvRhvcButDfV1LbJmLqZ1C
	wtFV2SDxQJvRX8TihEK6/XUmU7tLu294UIA0ru7wdL909vG7Fse0RjNmPg/ftf48n92un4BTkT1
	FZ735AiTJywCApKpMjczjWwgKUQg9VwrXWv03ZXTARtkpeiKWzBP5aKGhzsQejJpXmoWjYms2wz
	IuzWdHn1MoXZF9C/zrBG2FjKzQIK2j9zvFf3wc2ds7eh4ihQVlq
X-Received: by 2002:a17:903:a90:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d670b60ceemr33715055ad.2.1787356731807;
        Fri, 21 Aug 2026 16:58:51 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b9c0fsm196965ad.59.2026.08.21.16.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 16:58:51 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
Date: Sat, 22 Aug 2026 07:58:37 +0800
Message-ID: <20260821235837.2341179-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hws array of mpll->clk_data is allocated with struct_size() using
ARRAY_SIZE(output_dividers) as the element count, giving it 7 elements.
But the probe function stores the MPLL clock at hws[0] and one
fixed-factor clock for each output divider at hws[i + 1] for i in
[0, ARRAY_SIZE(output_dividers)), writing 8 elements in total.  The
final write to hws[7] is past the end of the allocation.

clk_data->num is also set to NUMOUTPUTS (8), so the clock framework
reads hws[0..7], again accessing hws[7] out of bounds.

Use NUMOUTPUTS as the element count so the allocation matches the
number of clocks actually stored and exposed.

Found by smatch:
  drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
  error: buffer overflow 'mpll->clk_data->hws' 7 <= 7

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/clk/mstar/clk-msc313-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mstar/clk-msc313-mpll.c b/drivers/clk/mstar/clk-msc313-mpll.c
index 61beb4e87..bd45aa0ae 100644
--- a/drivers/clk/mstar/clk-msc313-mpll.c
+++ b/drivers/clk/mstar/clk-msc313-mpll.c
@@ -105,7 +105,7 @@ static int msc313_mpll_probe(struct platform_device *pdev)
 		return PTR_ERR(mpll->loop_div_second);
 
 	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
-			ARRAY_SIZE(output_dividers)), GFP_KERNEL);
+				NUMOUTPUTS), GFP_KERNEL);
 	if (!mpll->clk_data)
 		return -ENOMEM;
 
-- 
2.43.0

