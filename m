Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABD431E5D
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509671; cv=none; b=b89lTq0ocQ+teCNWqI1nulmv4OHywabLT17iZqDO4sduZlx8AyN4LscoRTkqzNyWefGNW96VsA7jslPBqMxrbfP8s37HyI5ioY9Unzsfv47kWjPEgpl0IA9ZCVvJo3N9W6kMOfqjZQXT2clLbnqOWlNwBMtFxoxpnI6aYLjUaG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509671; c=relaxed/simple;
	bh=6BNAvio9NO1lTx+ZJEmSG7FDm29kL9AI/xPXKP/9zV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8hL7RstyzCspMNzwRVa9yiDMFsSHbI0WOeGWcTj1A67Rt/hoz2+BPI99lM8bMBQYoYoMyfkIW8lZJdNLDuhhU8NMhr37gZ2Wmr7p0dBb5LZPfa8/E84UksJY3bYVPzRm2ZF73Cw815AFf+Fd6RziOfbWQA5YbzT/5xU4CrmI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlGH/vp9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlGH/vp9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848479c9bd5so308151b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509670; x=1784114470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gzf0PBqigcUKoxaI79eLveQosbtD9S9YgM5YrVTtdE=;
        b=KlGH/vp9P867erIB77ZomPx8t3q4+xGllNdlMa4oF568zb3wh0Jvzmm68FcaM0OELj
         DpKKQ1JXnpsyQjMnmbsg1W8r02FCEAuS1Es/mHhMFzLPpP0VgvyIeF4bixabiCXzDwpO
         7Rzn1+snu7xCs+s+G597sxvt0gDQent+I1QRqXiSRCGUlwNoo4QnxLXCrebhz4eew4Fe
         tLSyECb2JzGEB+fzq+5PX33j64Yo6yGFVSbPe7D9b94qVtGwQckBLf63oZ/sPjuM+77F
         kZuCqoT0rb2oKc2hUJVvcdKhCabvIFP2a41Ue1RaPbjewwBsIHlxIlngVpy1RbdQtONf
         KQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509670; x=1784114470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gzf0PBqigcUKoxaI79eLveQosbtD9S9YgM5YrVTtdE=;
        b=dj3OI9gz+aV81t9kHHTSLCyOqA+rCSJEnbSXHtz96iHO1SUjoHL8dPjJVZ9HEmomBz
         DnQZXOIBpVidDASU2z7exlU1/3b1rYZ7z9Flrmj+SlxdW/J8rD/QWpto2dAiMkOmpoMV
         ic4qiUBrlDv4tWetYaBc3QP0dHgxUz0CKUw/GotFbedubjZeOHR1tUzGg9xlLNF7WfYN
         a7cwGXZ6wLbh8CX2mzrk3HQXECdjXQfKlk0zVCIuIgt4JINXNIN6wSV24fMnGdK4RIkB
         Rbw5dwhPD4iulZudLC9WsGbkwaLndDNYFziDXeddXDpDgqlySF/YuHVtXxEyUWLCZGXA
         tU3A==
X-Forwarded-Encrypted: i=1; AHgh+RoHniaJsGS/nLpiRGxe5S+DFZQWDHWUyOnxF5X3QBPgNWvt1zODG/aXNY3ufy7pw0FtKfqqLmFcicc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJeGZON0SmzNSV1UPTRZk7uSG7KfkAysHHZlz0YamdDrsyF/rI
	m6Q8kGjOa+BtFEi6aOSgwcI6tv42TIdYxRUeq8Tc3jzM5lOjmfdM144S
X-Gm-Gg: AfdE7cl+RE4W60pVFWef3a6O2xBIuHwWyTyZEAZcXLvyLZ5E7FmXsINUbe5qJohIPcn
	X2BZx5xx7diwbIFsxEh/Wp98XXUp6ozvvfhJMEKEOJ9o2KL38xI0Reh8wiOgagN+igYJVdoZIgp
	z5kUHdc3B1pB4fQe/dGbN10SCBAbapveAceDROPjqjWTLKzkLgglDBmOmMMiNwhQN9raDJ8bZwm
	R2A/AJXsmH0B16TnT2mqGwGtgySvhz/XWMejvAwF2z8FQDG6RrH8PIAkKLfcS1DcpFfOBEmoXio
	wpWZdYRJEim0XPIVX99FJseteRandhKYhVelg3/xJMMveZrql7DdTzlUrMbrgZQRPqv38v041nx
	2/zkdW09NQLyxGlusrqppJB3U5+EZPH6k8KCH628NWiGe61XwH1hbTsxkr6CtH17LvcaG6SE96N
	tqW80=
X-Received: by 2002:a05:6a00:a215:b0:847:98cc:a347 with SMTP id d2e1a72fcca58-84842fce50fmr2300972b3a.61.1783509669878;
        Wed, 08 Jul 2026 04:21:09 -0700 (PDT)
Received: from lgs.. ([152.32.214.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b5e566sm6920028b3a.3.2026.07.08.04.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:21:09 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] clk: tegra: tegra124-emc: put EMC node on register failure
Date: Wed,  8 Jul 2026 19:20:58 +0800
Message-ID: <20260708112058.750952-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra124_clk_register_emc() stores a device node reference returned by
of_parse_phandle() in tegra->emc_node.

If clk_register() fails, the function returns an error before that
reference can be consumed and released by the normal runtime path. The
tegra_clk_emc object is freed on this failure path, but freeing the
object does not drop the OF node reference stored in it.

Drop the EMC node reference before freeing the tegra_clk_emc object.
of_node_put() is safe for a NULL node, so this also covers the case where
the phandle is absent.

Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index f3b2c96fdcfc..94ac24ea1e6a 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -537,6 +537,7 @@ struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np
 
 	clk = clk_register(NULL, &tegra->hw);
 	if (IS_ERR(clk)) {
+		of_node_put(tegra->emc_node);
 		kfree(tegra);
 		return clk;
 	}
-- 
2.43.0

