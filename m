Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013B3A961B
	for <linux-clk@vger.kernel.org>; Sun, 18 Oct 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305015; cv=none; b=ed9rdkj+3e2MkHQQ79TflfMSEz16SjcRvuAAp0AO9nelc6vMz9ACJMpChtllal4ffC6fLYQV3tfqAckb9jpCx93X0EqfPxXhdyLeFFVjxUM1dOJoIfKcg4AhjlV671xMrR8lQllyl1CmArwe0r4Ku9c+PguW6AaLvF91RWVP7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305015; c=relaxed/simple;
	bh=wSNWde90JrtaRSWcvSp+umDo+bnx1SJz+8iHz+uMxv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kF2v7SdTegg+QW/cYYuo7c7/GPrGKR4gCQNCh9Onhyfh22EIgM0UOrHnGZgQ33H5nsXz6ms6EhqYdipPLz/dR1sgkAocntHzyNTaq+IHy5gEYf/Wc6IR2o4tom+550XuT+K2Ayd8gAP/b2ceNQZ099QQL30hepc8v4MQ+QOe/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IODkR8Dh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IODkR8Dh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89ff475a152so284395b3a.3
        for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792305014; x=1792909814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqtcQxwiQFEVUn/7ZWc/MbSwssB++a/RUZGjFOKEzqY=;
        b=IODkR8DhvhG0AUfgL2V20u3qEuNcR5fuFIanfRx1SvlzNAza4smacQBGe6ChHDYHrr
         ueBD1auGXMTLiN+NZFJ38oveBmIhdbnO1y3bH88PHM9RWv41mFrPlo6a2IGZvNifU79A
         ml9mhcW18d43lhtErEaGCMXqpTfMlgwsB8lGlZjWVbP3WDXv1EeXlJuUyL6qsSeMSHLZ
         Va1uBtknilzeND78efmJYp+fMDQUvxqmXpYUBMZCqqzqFHIescaH/O9r1cydZNvKsewk
         WNWulJZ7/9Bg99eqYbkVOWNB1ULMZ9aVHj7ALw7ntIg5ddFPLXqeQrFx4F2nz0xOcSls
         HWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792305014; x=1792909814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqtcQxwiQFEVUn/7ZWc/MbSwssB++a/RUZGjFOKEzqY=;
        b=25mfaVr4ZsxY0OaHKXHU/IZvn/7UxOEKOHOsBuWY3b0xqKY+a6X3jDkiQx+JjTmSv9
         MJ6ui4NzWmPPpw8ferpa++V6kvj7QS6xHo9mPvXx8LJrlGZouK4k639WAvWEodw3bpZ8
         BKj7vqFd7ygjo4Nt2KC7Ik11bYjE2f6whknw+d7YkAl4SFDqfnGqtf6fLxBncbk7hw2m
         FcQLanYGz1VHKGxG4dMkZvtPyot4ZoPxQ+fRcH/ofva1IxQ7dcD9ghKiZOKv8hgs5qun
         3wSXiuQ5yaKVdiFCiLrTA/0n5Sh5a9ZVgMHNn4xafsdfROqUwV/BepzI3pd0f1SayHXk
         hRZg==
X-Gm-Message-State: AFq9FYKGAzKqNwCmff1vpkgd3Iz+6ySKYWlfcHP2vo0Skho61qCRawFF
	IwNikB/reBM20F6sWWm3Sn+zsDkJ8pdTiAOY3mKYKVh07D38EttlnvzNnwQ3O57yHNw=
X-Gm-Gg: AYBFou3oH+Yp9gLdWzGqgit1wYkM/uZ4Mf5mQiwWGwj2gErwol/wPSfzdOg9bLGRDoW
	10NZLFINW+S147alzi4MWxA6uK5puuXZjxSuw2HR4xkjkzqczo0f75A/C8tjsXombWBYuSnkQPn
	fbs8nNDSFwxvKp+LIHyPS1I3Dyz5URAI8gfwBv+ZSv3stvzkm/Rgt3CkWp3XAFhmgIdtgnmCz0B
	Hn5coI8rbirX8WQhMJUqQQK5eq/DTbYeefUjLoa8E9+WGZHR2XYIwxfckPFpvHAWzFvjjmBI8wS
	lLL9Dg+TxBtO2XJzprEFN3FZD5CKEQV5nVhrHOqzY5yx6iDJSfopD2d1DwMcZEUw7sdLYAOBO/S
	L4UNWEnUtpjYVLGkhYQdxA+n4SVJM/fg5kSHtH60EvtLGt6EtUBiubfSyGbL3d0Ag5Tgk4tTAlW
	43TdljMnYw3YrY4MsVlDWD4aW+Jf1SfMyPCGS53/9EXIiCiGa1TAQoDlhFjimJu6S1ambwWHDdx
	JOpzWYFMpRptos=
X-Received: by 2002:a05:6a00:2386:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8a04be695fbmr2612651b3a.45.1792305013719;
        Sat, 17 Oct 2026 23:30:13 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57268ff1sm2714978b3a.22.2026.10.17.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:30:13 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] clk: devres: Skip cleanup action for absent optional clocks
Date: Sun, 18 Oct 2026 15:30:09 +0900
Message-ID: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get_optional_enabled_with_rate() registers a disable/unprepare
action even when the optional lookup returns NULL. If allocating the
action fails, the error path calls devm_clk_put(dev, NULL), triggering
warnings in devm_clk_match() and devm_clk_put().

Return NULL after the lookup to skip the unnecessary action registration.
The state allocated by devm_clk_get_optional() is released when the
device is detached.

Fixes: 0d4d262c1664 ("clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with KUnit under ARM64 QEMU using a test clock provider and
failslab. Failing the action allocation for an absent clock triggers two
warnings before the fix; the fix skips that allocation. All nine tests
pass with the fix, including cleanup and error paths for a registered
clock. The fix was not tested on physical hardware.

 drivers/clk/clk-devres.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 4cc3863bd7da..35fa34a961e4 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -112,8 +112,8 @@ struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 	int ret;
 
 	clk = devm_clk_get_optional(dev, id);
-	if (IS_ERR(clk))
-		return ERR_CAST(clk);
+	if (IS_ERR_OR_NULL(clk))
+		return clk;
 
 	ret = clk_set_rate(clk, rate);
 	if (ret)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

