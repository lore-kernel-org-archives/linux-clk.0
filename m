Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACCB2E92B3
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881183; cv=none; b=nTz10TYsHRfH1bTHVoyFoXBQHo0TACjk6d3oFL7p/OXrpkiLK/LuQWgPguot7d46XylTHdmrBaBGvKkVtuvw3V3dRlp/5yy25FcfJEQhTcSrp7mUDzvDFRNYp2+61C6Y5JWaX7pcrFQfoviNWmcyuvyLIdwJpbFCn8k4O700ziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881183; c=relaxed/simple;
	bh=aExlSSaLla1nCjUvgyoARQzBD88LhnGckG7GUkW3GbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BlEVXTa0Hx1LjSdZZKLRi4tfvDuGMvlW5JpsmHf7KamMHaVJfPt+wh3Elllk/+ExByLFPtzR2p//kBZKHcFoNqKjCbZQHJ4IY6ev03L4v4WoOK3L6x6F3MQOoTdukUjfpCpWmfnhZR6lGY9Rr3CUezuSc0rFP3/Adr3Qk3oMDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=axh2dPJv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pAtN/qUO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="axh2dPJv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pAtN/qUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774881180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ewVCMiY2A8SH+vVFiby43Oli8Pss41RewLglHBz7dlw=;
	b=axh2dPJvy2Tv2tBWr8tkyOUpn2VL6msVZoDI2hr1Xzbi/W+RAIzdDJzWA2M6WpVRNt5NfK
	3jr2SGpV/eii7XT4SiFDEVQ/NB+pXfYhIZNKYpOSadYOeBn33KdvfeFECof+DPgqc8S2SS
	Pl7FTIpzj+h3ZbjgRomi6cMCHzFrqFw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-yn07VGslO8i8rM4YTALXrA-1; Mon, 30 Mar 2026 10:32:59 -0400
X-MC-Unique: yn07VGslO8i8rM4YTALXrA-1
X-Mimecast-MFC-AGG-ID: yn07VGslO8i8rM4YTALXrA_1774881179
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so234435091cf.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774881179; x=1775485979; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewVCMiY2A8SH+vVFiby43Oli8Pss41RewLglHBz7dlw=;
        b=pAtN/qUO35xtM2DyxJR3bfESxxTV4588FZo57r6Bg7scehwNiRePAUjyEUsfUX13Gw
         K/Z8aIvg8QTSQ/Za+QRJAb/wMheRR/zdi2pYrFEKHwWUfkaTDJmE76tnH/190uX6JpRa
         mduO6Vyvnm16pRe/ZuyCvV+gtFAcZgJsmCDe4dAAsYe2fXppsnm8SilMNel+4eoMQ/ss
         VXqxdLxfQakUpSh37KCcZAj88KlcuM9iQELEeFQ+SXt7q4DkDmre638yHva2dhcfibVs
         s952RUyyIwGl+192EaAupE3vrQA0Gd/RXBJ0yuKjcOd6q3jG5S3ekHA83xzrd3cineMR
         pAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881179; x=1775485979;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewVCMiY2A8SH+vVFiby43Oli8Pss41RewLglHBz7dlw=;
        b=sPnikGWNsEUxHle7E6z8uxx3RMlSofbl3Wvl8bfnbqRTjddguGJx64T54JtVvlHiCl
         qKrTjsf2gK3t7oYb86fGKYeXRd5ob9/zTaCYdxPQIM+Wt4iReuaqLa0WVNjYAaf74T1z
         6dYEGBSoy0tuI/5478rfGsa80V5YVNd1BffLHRgZNobe7s3qJkD3px5GBJXp9u4oNlyB
         0UZp28WU11x2vdOzz2Ngd84TSlz11x8/EfWogY81NH50P22Um1Yhh3Xwbs9oNOVMIVGA
         k9gmpgPZ3IgkOUQCS26SaA93W/2fi5WnFHiMIqUiyicZOtqrxrARL3cfHf9CrCV3xbTo
         +Cpg==
X-Gm-Message-State: AOJu0YwDVRJODt1Pf6s9FpQxY1EmufyPZ+idbicw1KemS79oDNvHBQkr
	f9uKfobZ9DH0PIbQYiEjONcRxb4Gm/OSOHpa3oPLA1QczcK6O4gsp3Q2adrvIHXNxw2if1HF9SM
	BcmKLj2IFi0yj6iwXz7BcHcER4eUFTau9qGq2HrhsTEqmS75EydGU2OocLJtGrw==
X-Gm-Gg: ATEYQzx92ZxSMNeWJJqRLoNSbNDguHQZ7LMnfJ+PDvRRF6VCRAElnZqXoiyfhpXSP9+
	mm7rE0S2RlEoN0vT3F4uRxu020uoJENaPvtW82k6pHQt624zLEWuRPNnaeZxmernwkM0+T+OUo9
	BKMwXOt4FPHvkac+rAz5hoW1hV1+A3xfW5v9z1ch2AoJPbLqI1vwOSUjsLeiHCFR75hiTlojGWx
	Lfyy1ce6sLyokXg2WowQA3JXMjiMw+KOzgr39gMbU0AdF0q5JlWoLvcROSpiVJBCfRz8WzAM1SW
	KoqVgpjJd19eTBMdtUnnPN2sSJKnGFLG7P5KVIcuT91FPG7ucJPY1cqwcYC8rK6gZAVL/UJPAJz
	HlcqTxuuixm4AXQnxKX0QPHANhhUllpjFfKL5QqdPJZO35hU3k4Qk5/ZEUicM
X-Received: by 2002:a05:622a:514c:b0:509:a9b:8a6f with SMTP id d75a77b69052e-50ba391e18amr186074501cf.56.1774881178540;
        Mon, 30 Mar 2026 07:32:58 -0700 (PDT)
X-Received: by 2002:a05:622a:514c:b0:509:a9b:8a6f with SMTP id d75a77b69052e-50ba391e18amr186073831cf.56.1774881177981;
        Mon, 30 Mar 2026 07:32:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bbcbb3babsm52494131cf.25.2026.03.30.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:32:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 30 Mar 2026 10:32:37 -0400
Subject: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL73YIW2eMq0YfYWkuhoRGBdPekz
 4GZyZAoMiUYRYZINycOvoCqBNjN+JWQl8JQy1rLppFojx2LZoO/GNnzhW3vDA2mI20UlO6M5Pj
 5n9P8vh/E/7fCYwAAAA==
X-Change-ID: 20260330-clk-visconti-init-58fae9a7e6a1
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=aExlSSaLla1nCjUvgyoARQzBD88LhnGckG7GUkW3GbE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJPdU7dYna2I6bszrPXbBPlgqZnHgneIfFJ/71uQoJu9
 ZayR9fYO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgIhwjD//SgFqGa+ybWqjvl
 U8+EOqpHJecZ/WJqf5LYfVXZyvjEfob/aUKVHZV8+y7cW/HZRPJi+5+C7T8/X5yoVZdj3LJXafI
 8dgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Sashiko reported the following:

> The struct clk_init_data init is declared on the stack without being
> fully zero-initialized. While fields like name, flags, parent_names,
> num_parents, and ops are explicitly assigned, the parent_data and
> parent_hws fields are left containing stack garbage.

clk_core_populate_parent_map() currently prefers the parent names over
the parent data and hws, so this isn't a problem at the moment. If that
ordering ever changed in the future, then this could lead to some
unexpected crashes. Let's just go ahead and make sure that the struct
clk_init_data is initialized to zero as a good practice.

Fixes: b4cbe606dc367 ("clk: visconti: Add support common clock driver and reset driver")
Link: https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gmail.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/visconti/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index 6fd02c4b641ed58f1943e55dd60ae80aba30b902..805b95481281761ad7ea4f59ddac07e4cdfb9d42 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -249,7 +249,7 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 					    const struct visconti_pll_rate_table *rate_table,
 					    spinlock_t *lock)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct visconti_pll *pll;
 	struct clk_hw *pll_hw_clk;
 	size_t len;

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-clk-visconti-init-58fae9a7e6a1

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

