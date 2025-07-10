Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826F28D8CC
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183949; cv=none; b=FAWUfDi0bLMwrTOkZFFI33jidvVRKjnXEtGqcuYnbpxt0AFJLQrTlZXVtp3/m84O1ri5Pvfxl/kjWQ792F2ZOW3cCCBZYGiafeVkIxTXiBXPlYeWulz+jOmAurgFelb5gyEnzrbpdXX0QW26oBOFnBVuAdKoeT7G8wAupeJo7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183949; c=relaxed/simple;
	bh=U/9ZXoZ5QghqF6gzuQvtojlHXus2tpFvDXjRDjYCM8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMfosXKIEqNKX+T0oithG5hZZhXAl1eUs2pb94eWzgKzpJyMV6Mb8J4955NRM1Mz0PI37yHwNBspyfEp1rtyVLKaNczKRP6lawy02EJ6xZT6g3rCbHNX8ce82JT3JAiMNc19vlHAqYxLg+SCCiaG1SOk2u2F854v8Ml1YnLANVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XNS0SWt9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XNS0SWt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/N9KdTRimopScX3z3DCCr/6evGNQY2mClyDYSaLspM=;
	b=XNS0SWt97EiAD+15Xj6mwW6/bsKkerva3aYaVMDnnp7YJL9f8ajx1Z043hS7ajaJW/wbqN
	b5kzgg8N9720d1Meg8PGbOKW/xvUyMkp9agZn7X1ZV9ocZjjPTjAPoG4P1jauhBbgQNudF
	4WzkQxCEN++ys6l/ZJQueqkc7au8k2k=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628--ejdiUAwMB6KqVV4RCtgHg-1; Thu, 10 Jul 2025 17:45:44 -0400
X-MC-Unique: -ejdiUAwMB6KqVV4RCtgHg-1
X-Mimecast-MFC-AGG-ID: -ejdiUAwMB6KqVV4RCtgHg_1752183944
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b94543b86so1166817b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183944; x=1752788744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/N9KdTRimopScX3z3DCCr/6evGNQY2mClyDYSaLspM=;
        b=LeLEd1f9jnVS0UTtxNSqEE1IG2BowVNFTXnWbtZxQngamEMYfwaxkwMfP2hO3mcI7W
         VLrOj/7Q6fatEy1T/XmCOfW11cIWWXFqF5zHkkIvLVxkJzQ/5PhCfGgHTgDZf9oLrzC0
         +KX9RpwsxN4t8aOHB+ZejnP+JvshL4L7JyCuzlb9Q0U7JsyNrh1y1V5YzWOZoulRLaSG
         IumQu53Aloh6xMkJexq4BkjXx/AmfiRerfaGO0bwSVq4ikT6sMlqqZzgia/PpDxo8O/M
         XcBU+tTT+IP5qoPMmHBWy6Afz1gXYlj1RUCQvPmmBv6z6/MmJOugizElAO9BlkewYe8F
         Glkw==
X-Gm-Message-State: AOJu0YwcdD2NvdarNv9nRltfTMLSq0eAWm+0I5ca+/HCGH51qyG9aqlG
	8x44tGvz3r7vsUwTjJ/R0MWkbabwo37q83bd+je5b58/Ryzj/qE1OFZTxI/+VN5hwwlP3TiWODv
	0dZHhcuXULF57okz6ruvAjgP7GYX1afejdQjIzyA6fryhL4bxOu4j+rqWgdn9uA==
X-Gm-Gg: ASbGncsjVvMYyghN5BxoqUcG5bcoDm0EIBa9fbZge2EE+j0riWWanpvHeUALlT5nzZl
	iKN3Kn2BU16y4zjiS+/8WZWhPH2/093VFe0U2vgM1UtEwp7PHIyHMgjR84q3wT+ji/ETmqiYvGi
	9D/P3wzK2e+F7CGK9L5E6Cr7Xrwn+rjySvTuiMcqgfw20u7EK+d0rsWW6fRbw337Un03h16N9AF
	MCdp2P6W1sgvKaBmMW5py+arXFAjQ82tFhKfFb/ZP022FuUnNJs/i2TBEvbJE/paXSaWhEpbfPY
	e5nnV4nTzfk/RvPCSGEzj3RwRaG+6YlbWXhkAeuBbPT5
X-Received: by 2002:a05:6808:23d1:b0:40b:4208:8038 with SMTP id 5614622812f47-41537183318mr413461b6e.4.1752183944233;
        Thu, 10 Jul 2025 14:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHehwimPSJesNgLHxM+siGqNnR+E/LIcmlGE7wN03bVYDMmX9HbSYx7vDjYGJE2IsVe+HtWEw==
X-Received: by 2002:a05:6808:23d1:b0:40b:4208:8038 with SMTP id 5614622812f47-41537183318mr413444b6e.4.1752183943975;
        Thu, 10 Jul 2025 14:45:43 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:42 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:13 -0400
Subject: [PATCH 1/6] clk: tegra: audio-sync: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-1-e48ac3df4279@redhat.com>
References: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
In-Reply-To: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=1579;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=U/9ZXoZ5QghqF6gzuQvtojlHXus2tpFvDXjRDjYCM8Q=;
 b=rBm7wVa6iZ9fX/flsyK+3l+AwTVnI0spNGyrAFjfS7Q4BhOujMfuFO0y4LvuBCZyzgqmkdtEj
 bUdOK8DFj7xBqL6qsFu26AfPoxtD0R9jMWwDN+7JtXcu2dw13LIpoQg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-audio-sync.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
index 2c4bb96eae16e2d4da8740d4596cdb562fd65e73..468a4403f147a2bfbff65b34df8b80a0095eed15 100644
--- a/drivers/clk/tegra/clk-audio-sync.c
+++ b/drivers/clk/tegra/clk-audio-sync.c
@@ -17,15 +17,15 @@ static unsigned long clk_sync_source_recalc_rate(struct clk_hw *hw,
 	return sync->rate;
 }
 
-static long clk_sync_source_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int clk_sync_source_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct tegra_clk_sync_source *sync = to_clk_sync_source(hw);
 
-	if (rate > sync->max_rate)
+	if (req->rate > sync->max_rate)
 		return -EINVAL;
 	else
-		return rate;
+		return 0;
 }
 
 static int clk_sync_source_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -38,7 +38,7 @@ static int clk_sync_source_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops tegra_clk_sync_source_ops = {
-	.round_rate = clk_sync_source_round_rate,
+	.determine_rate = clk_sync_source_determine_rate,
 	.set_rate = clk_sync_source_set_rate,
 	.recalc_rate = clk_sync_source_recalc_rate,
 };

-- 
2.50.0

