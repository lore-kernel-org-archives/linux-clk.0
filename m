Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D43429CF5
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581697; cv=none; b=C1PiBvKPoM09mWeE2OA/5pdBIPlzBJFqERQGK166kaPDFAthkvFUIkIcEbyn/j4PzTODVBlGuh9R9tlFeHD7XJLOTBiC/AswE6n3Ocejw/LuV/UIL95wxRKet3it1fxUWh5SOLkj2HymdJdX/YSrKcjvaFtWb9tRrZrmq97sZ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581697; c=relaxed/simple;
	bh=CyvFyzFd1gbYPxjEkZ4TAXB+esuJNZ3LdYISRv/gmHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESx8aH1d4eEzlAPz1d5L1XUs7o1kOBjTDAS4j6xgdiZnGE2DdYdFezGCVeiTyuB50q/aBo78Kq79mf92WCSErpMffPb2KTWxY7A37qvAmspldFONY5j9Vh2vWEbeT3iIIHbb1Yxs8a7f1CYafjw16wNgcFZ4O4UR/sB7ZrC2e5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdFvtps3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdFvtps3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2724720a91.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787581696; x=1788186496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZRV0fsadUb2RGyF330MZobT+Dwgs5Uikgpa9gJZ9qc=;
        b=FdFvtps3vBp2OgEHODb2betFLZ8dXjAuqcCsDFp5DaHX5argoBXrLtlCk85VJ8HZaI
         RNyUxhlN/UMPIo1W1Gk6wS0AABoukTA1dvIJSZQI17BfEPEveZGinTyBov0i0ahnF/XK
         OpUNCdFVcB5rUKrFzhVQc2dBa+B/PwDFCsggOR06SyqUtwSx1St1AgnoXXRefxJ3nqzP
         GKYhryA7iDO4jaQaMJTerIobdcsyLFiLcJHM1kjS1bLHenWB153YXCvRZsznkrDAU3jc
         +NOXyKk4fuE2b5EXKdGhsV+318yUrIMS2CnnOxbXzsR5FQTjgtmDNvL9XE4gW5Fr0tEc
         zfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581696; x=1788186496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZRV0fsadUb2RGyF330MZobT+Dwgs5Uikgpa9gJZ9qc=;
        b=X0cWBqQoOZrTIGdzFjRHtmAS1qrm1aYDm+BLReobOI2yaZz4bEYgJpQlZHU6PttEVv
         VI2Lb2OmGepIQqzN8ZImmSfn7TDAKpPa5I8ZVuQ/NsM0SkI/FijuxiegaR2aal1Ht1Sy
         w8JI0ofzWZGaqda/ERYEhiqnlfllqpLJYdpJAQdyPmlFi5hW2ZAmSwuGmgoo7X/OXUaI
         31VD1GIBjWTqiA92+n4ErgZgsqmb80GUpt1yv42BoKUM7CIpMML5HvmT/mi4eEzmoi/d
         AtVD2HR5gAga6V6SshCHFmdbccDBn26uQk1SxAOgzDh/FkRTlv5qdabrVnQcRbjZAKpj
         +rQA==
X-Forwarded-Encrypted: i=1; AHgh+RoT7q2WND3hmTGsItwrzr8o2Wz9Oh109zpvH+XaaqcYQB1kU9s3/5+M1RGXHNeRJasTg6etu2lFIyc=@vger.kernel.org
X-Gm-Message-State: AFuF++kD9o/FsjWeYwmX5ep94OUhv/82ssME8Ne3MtNJriDFv8SlCTSe
	NZSqhL5X5ssrWU/GbHnr/a9xS9+Hj9PJRnciwq4bg116Zy2xZTtivC9y
X-Gm-Gg: AR+sD10J8hiGD/uK/E6vYDoXwHDbsvH87rMljsISHBbx5rYIBC90K+74BKfJQqXW5Uh
	NPoeiw37Fbel2Afwvc0Ps4r0X+ukkJ8B5qoPSP9AMqPPVyJ45Dj+nZdhY6Fx4I9DeySYQglZk8z
	siDXk9vnI3ijFx8kHDM63PMPUr+ZbMln/vcjdt8NwqpGpN6jmwxoWuEJJPXfVaxmtd57+dVo/Nx
	vTuVjKQtiatgGasI+wIHysf/9eNAaRcwwAh3NX6zOgrrk7lHBlr5veY/QJtKmr6WhB3GXL9+69M
	p93Wvc6AUhAM6GTRsG0ijxyObKVndND1OUdXLYGhh6GnV30SJUdJfDgpT5DcQ4QRgGKABIZGekD
	wxmOkjBnNwauKFg0HaW//cvDDm1TJ9ZvXCKWB6M1E23G8KHcpjFxYPGHqo5qoMUKCGWfP09kFen
	FwBGZ5Tlt0RWv0qHikZt5U69eve+OhcPH+77rh1E/u7caDgxSGsz+Q3vUxA1N7+/yBbXOx1SD6Y
	8ttY2H53bGRaKx+Ggyg6s5L9LPQgwDyPl0I/fXGJYnWsi1zvqYQ
X-Received: by 2002:a17:90b:224f:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-395c354d445mr44970306a91.2.1787581695499;
        Mon, 24 Aug 2026 07:28:15 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a1597csm10201997a91.13.2026.08.24.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:28:15 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
Date: Mon, 24 Aug 2026 22:28:00 +0800
Message-ID: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
References: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
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

Fixes: bef7a78da716 ("clk: mstar: MStar/SigmaStar MPLL driver")
Cc: stable@vger.kernel.org
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
v2: add Fixes: and Cc: stable tags

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

