Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBA2FD885
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181884; cv=none; b=PpKaDmDnYmXJ0GFx2UZGW81YHNRoCaVc21CLDq2geaXvyhg0elVDRdjj7qOE32gezlKsS1tZbNh7yRXw2cTfxidbs9LmhK5GX9ftV3FiHn2Q2OfM1QqhJeqiYP9ObxWw93Uem2DfW3DJUP8V9hVkm2t7pBIUoqtPiU7uXglhNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181884; c=relaxed/simple;
	bh=W9rMxhG+HCQaTapcDP0EemGdUyiHL/4QZlLhjcozpqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwphsEh7EkyiL3jKRctgizq9N+9RHTnk/lrABsK1AtG+80+G4iwRIcsW8Tc/rOC5g6Y4TnWkLETLz7uYZYc7RzcybTWzZL/i+qX8zqRyMcQIOLxkOsb6H7FQaMB+NXmJcwx44iT2AtcC24LgJwzCbPVaHjrucIY6S6Yu7SpzZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MrkyeE1m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MrkyeE1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=;
	b=MrkyeE1mK5l3arpR/iuDYR2KHMZa2lonV2q9/dsSP5XGq2wrjVAkJAzq6svazQLS02pFLE
	33mYQajQOg+6ABKVjv8/FP8jCNdcQVsgS+ktN14rXh7aFazI3r7Tdm7i8G+a3SA0cJ95BJ
	VumRkbWp/UczRhCtMruBq/DgcRZAjaY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-6PBnO_4pOgmqZ8Vp3ePtGw-1; Thu, 10 Jul 2025 17:11:20 -0400
X-MC-Unique: 6PBnO_4pOgmqZ8Vp3ePtGw-1
X-Mimecast-MFC-AGG-ID: 6PBnO_4pOgmqZ8Vp3ePtGw_1752181880
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2382607509fso8087935ad.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181880; x=1752786680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=;
        b=EDsgabkiOAW9ur+364litjI/TNbviFnJFt9nC0LX7tLEFhaM7R0uQFa27rZQWdo6HT
         ZL6XoQt/ztLVDB7QOL1Ddm98ORueyXAreVQPUTyILlfZY1/VvgX/HjZtOR6I2JTzT+c1
         Bq5adQYSgCtbzZoYm7nSHp+Wrpx6kGgU9Maw2aApSnqadS9pHB0TPioJPBs+YvNRdbBH
         cik0dZ1jFj1JX3fDq9pLZgwyEcLbskRB1/1FuZ+WHFXlyzIeVy1gPD+97j2+XRPq+QPQ
         CBfYu7/2sA3X1oqk8xCDztOZOL68YBJkOXzOxRLsAdH+AzdJ4azr2NGJft5fBtX4Z14y
         mbog==
X-Gm-Message-State: AOJu0YxdpNQLRtUHffuFZSg41R8GQ32OVSmo/d0Ti5HxNEtlUZYK2tib
	IkPQg+TZQTxOqNmdpCRYs75r7ikMVr6SruPZbyWDTjnXkHcmOEazQywnAA2uGL2rgvH3s4cggL1
	EHk4EqI1RN6B9WfS/tf/dVTUEIPii1ski6AIXa2V1ezsg69hKCtItiNWIRw0N+Q==
X-Gm-Gg: ASbGncu3kYnvdCaSa9OR7w9KZbrPbue6DOsw3gJIgxY4AX3tw4OiZhWjl5I3irPFzAD
	nXT15805t2SUak8+hJ5AnFqQ71t0u1CZtv4pw9qBao+ZfQzxX9A6gfh34IveECGtvkI9mThJOLi
	V4tgNHmGMHpWJgJ1OaKt5lzJM171/Kf/nelHf59Q7mEsDyqYhE/Jg8Q3xk3e+DkQCXQL1q+Lzj4
	32PYyOPe7k6VdYeFVtUp0C8tAg9QMwtG5V/K2mwkVDKedWgtD4OpkHXXAE5KiO+jiepDEBFC6m9
	CybMIYkRuvEY5eDj0AWSzHsr8DzMLRAhgP7B8JBSEKAaVQ==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr7262135ad.15.1752181879785;
        Thu, 10 Jul 2025 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHNiFYs8CFWRvSPbrkmIE4I8ntC8YkoPHeEDzjwj0c3EHunXltU+7bpHWVRTS4Tk67n9W2tA==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr7261905ad.15.1752181879329;
        Thu, 10 Jul 2025 14:11:19 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:34 -0400
Subject: [PATCH 02/13] clk: imx: composite-93: remove round_rate() in favor
 of determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-2-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1593;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=W9rMxhG+HCQaTapcDP0EemGdUyiHL/4QZlLhjcozpqg=;
 b=p2JvBhXGzB9Q3sTJCTzm0qM4XowHtLIbgUuGE85J8qpMRH1G/aHuClA7A/B83bKS/w2DVERZJ
 SrV4qAgn3aMDET2A7EtLIFuerX32CaXdZX7mJGyO9y00Vbcn4xmkqzv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-composite-93.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index 6c6c5a30f3282d4d128751147714bf24b64c52f3..513d74a39d3bd391c61db2e9a5b7752af611d3b0 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -98,12 +98,6 @@ imx93_clk_composite_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long
-imx93_clk_composite_divider_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
-{
-	return clk_divider_ops.round_rate(hw, rate, prate);
-}
-
 static int
 imx93_clk_composite_divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
@@ -141,7 +135,6 @@ static int imx93_clk_composite_divider_set_rate(struct clk_hw *hw, unsigned long
 
 static const struct clk_ops imx93_clk_composite_divider_ops = {
 	.recalc_rate = imx93_clk_composite_divider_recalc_rate,
-	.round_rate = imx93_clk_composite_divider_round_rate,
 	.determine_rate = imx93_clk_composite_divider_determine_rate,
 	.set_rate = imx93_clk_composite_divider_set_rate,
 };

-- 
2.50.0

