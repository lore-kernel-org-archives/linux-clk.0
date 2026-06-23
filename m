Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BBC3C73C9
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207632; cv=none; b=kVqqd88ra/Zd1iSsX65MoPc5A+a1awXEClMr/gFN+SRa7wfXXcOzLcEBwYOVILuZdF6lO7N3pbFl3RuXZs0fA9vT0UcyLco6N4uIJhKLIfKnSH9YCUlUbE6nAdl6nDJMjabCEGQYjHgnoS/ZkQVxWzx22BK5j7Goyq7StG3s2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207632; c=relaxed/simple;
	bh=SnIDHBtDfjRngMeLKz6BX1PBRaDqF1HB0vtqyNU5yb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Upzo/VEE4Y4xmFSpbbkyM1YuGDrDjKRA1mwvqNa3uEcJHnEmPdVPVTQe2AQKEZlMwDdgDlBaLCzO+Z2TFuF9Yfp0puSTL7ZuJrqrQ/jEKBTAB00sJGZCxueFiIY3kq36XpgEmd/o+iyeOYFVgS8TDjURQLHQX88AjtP9EKZqrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3SqdXaG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3SqdXaG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84538597e1fso3116095b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782207630; x=1782812430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnsa5FQ5jZSvFZuYEysM3sNVcO0NPhCred8y/3Y4jCM=;
        b=b3SqdXaGgFN2Mg/foq/iaUHjmZj4/NGBLRqQ3cKlGyKLlYoTwQC7rurWRHn7iSXi6n
         w+761bWwneSifDarKwYmPgUhHItb6wcYSd6KKAlXpeX8+eJU931bkxGxtCKfwkjtMG+8
         hunAz1UxkyU/jd27ggYXmQ/2hdRU0T2zPmZ6oCQMVg3tN8uwFhmI0BFlRw9cnt0gFaTE
         bt+8SBybTJbvNEIubeKRPGgENXrEmX6Zq4q+7XHGh3089fNx7RmRY89KLWQWrg6tsEC/
         jQZbwd+Ww4Skz8Br+xINz0o52NJ1DFLmutejim1BilHjKEcgkLTHPerDTsY2AKHRoXv3
         Enww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207630; x=1782812430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnsa5FQ5jZSvFZuYEysM3sNVcO0NPhCred8y/3Y4jCM=;
        b=d+UbzSjQKdtmxIGSPLtaav072DJsuUHrjJFo/bgyikCsKQD4NZNGXjD0uan0b9slES
         Tr22rajt6n1yXR9CnIQHoQtpRprdpIMaRy11FWN9zdAy91DMPkfR0zL1BU6yjVNAgq4j
         43GM/xdc/6E7wZRE58G5jYv8nN37KvylNfdwmMi5KzMM7B4fLuI+RLRaZHdsr8mDGM+J
         yZy0RbO7wrjEZ0dW1qchdtasmvsyEU/HUFHMPmKajWCflC2dSh3VNoRV2SJKWIIkQsUh
         tCTjqsAYEz1y5Loq6Yl9ambWAtrAq3E9q7w6a6xupBtGc2UW/D74B/g3W/sdXCh0U82o
         cXQA==
X-Gm-Message-State: AOJu0Yw7rma8iEkeTamqKwhxO+el/mboVhQYED+207oqtTSK5Cg6o157
	rN0UaqOxHY4DLpRb1vPOuBI+n12NSym43mhBSYXbkusVya/zjsZWgJQ=
X-Gm-Gg: AfdE7cnYTShxeVftm8eaJ5JCwVfaiE1/KJg54QACLu8YCNBo44BfKLZm1jnzOYMzUNC
	TC0aaK9pgxNhXr+eSwTUCAw2tVvSMN9Vrh6IqFQfLN5eYI8JNbcEE4lgADHAu12ShIO31U0LjQ6
	VrjuztskBP9vHp6tf4AESMzGB8oS1ZGdLgigLgqqwscVxW7HIvmW/v/B7+R67APta+rHukRub0d
	+CPgQCeHFkSWI7+ByoJbtXpmPjAtIzWoHIrBJcUJFZcX14FcJX0Cc+k3arkUmGdnVop/5C19LoC
	Zu4lY/VpOkQMuzDEMH+7ffelpXRQrR19/arR14MFd4NFm0WrH3RWhoovI++Ya9X3k3VoY02syON
	hl2Bm5FZQNxflCQoNDUIPWCK+q815QMa2s6qQ5FcFOw8GorAHoVM5olAmj3sQgrDecEuiPA2IPU
	8kGdGEoVPywQxpG/Ka5nRPcYw9Uzt1R5WVZ1rOYZJI1h95UXGCZ/7WZjfiiZGRWT41
X-Received: by 2002:a05:6a00:909d:b0:845:344f:ef1a with SMTP id d2e1a72fcca58-845952728a2mr2554331b3a.15.1782207629998;
        Tue, 23 Jun 2026 02:40:29 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebcf45sm9507635b3a.48.2026.06.23.02.40.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 02:40:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] clk: versaclock7: Fix APLL clock leak on probe failure
Date: Tue, 23 Jun 2026 18:40:18 +0900
Message-ID: <20260623094023.94231-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vc7_probe() registers the APLL with clk_register_fixed_rate(), which is
not devm-managed and must be explicitly unregistered on probe failure.

Most later errors already unwind through err_clk, but a failure from
vc7_get_bank_clk() in the output registration loop returned directly.
That skipped clk_unregister_fixed_rate() and leaked the APLL clock.

Route that error through the existing err_clk label so the fixed-rate
clock is released consistently with the other probe failure paths.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Correct the Fixes tag to reference the commit that introduced the
  VersaClock7 driver.

 drivers/clk/clk-versaclock7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index adcc603e32..e3a36dcd98 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1197,7 +1197,7 @@ static int vc7_probe(struct i2c_client *client)
 		if (ret) {
 			dev_err_probe(&client->dev, ret,
 				      "unable to register output %d\n", i);
-			return ret;
+			goto err_clk;
 		}
 
 		switch (bank_src_map.type) {
-- 
2.47.1

