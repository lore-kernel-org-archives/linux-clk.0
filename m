Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497C233723
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028657; cv=none; b=OLr/yf1lYEc4UlPiQHFCj8Mg3SR5blpdGfbGnkX/qvrugJmvECprmVUJ/srDgNwlAovrGcrRYac8swzQH/JQSxulosFd+nKF2I4Ro73KPMc1bK3ycNPyBgeoiIbI9mniLXa5p3UjQlqz5lcdQYhtVVOTcf2CsIbcI66gHVvmvMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028657; c=relaxed/simple;
	bh=p2MpxXnzLI/ZMeCq8d35+6JBb5NSPSUB0mvLioIPWxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5yH4Lv7CjMexMyk4qz5V0UfGiI73L47E9/JzBV5NWyk1IjVjLKEnBRTZwaKoiKf5PQU5U8pYXgb1edbt/KiUavFe5YYtJ+gtAcMjcaU3Q78FrS4ciZMI1/yGw7kkXspVBrzdcs8sqZnZIipCGoV90IgorrbYnY6Wxe9ZCekJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KlQ1jCDl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G6M3fiYH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KlQ1jCDl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G6M3fiYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XejcufsdVf/PSzRjXhVCXk19UmqRwwGIgyVDxw88dFI=;
	b=KlQ1jCDlT+83qc2jIlecGUq/2MuHSCCLJSTlaDKbcpz4ZAbRCMjGlRzw8/6riAbnCc5uDP
	E/vmUcIa4E0XbkSOyg0Uvh7Sx3N8U1wchJtP5uAYzujqCvD42zQA36wFvi4q4oxyBKSlDg
	N8Q+rvUsbgYXAS4qodylZF0mHM+Qj+A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-EcknB6VwN8ecZGW_fZT0qA-1; Tue, 05 May 2026 20:50:50 -0400
X-MC-Unique: EcknB6VwN8ecZGW_fZT0qA-1
X-Mimecast-MFC-AGG-ID: EcknB6VwN8ecZGW_fZT0qA_1778028650
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b0312bb1dcso51537776d6.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028650; x=1778633450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XejcufsdVf/PSzRjXhVCXk19UmqRwwGIgyVDxw88dFI=;
        b=G6M3fiYHGwPRkvil//R/PE1fkrz+EsKRuIBS39z8jlV5a1CVJZxeSYqcVUu1sptDMY
         bz51fMQ0TFxYyHilc2d50nAtYs2ZPb4b4jFL9e6VoKnr59Do/xRQjRQfTz60Icq+G5Mi
         b8dj9KawyhOXnfoA7Lvj+nkppSNyNR5ANsmuNVIevPmySfNl/RY5BZFzi3IzPbT6iLLB
         v/a9p7rERLtnPslJce2GJxVk1mlTixHOYShALwtuRA13IUBeeoCVOMuA6FllSi5C7cFZ
         hur4SA/+x9+aox/s7S4q8Bm4Hu1heN97JADIrqFXllBO10hg8gXuU0Zz4x0l7a3Cpi9Z
         WuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028650; x=1778633450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XejcufsdVf/PSzRjXhVCXk19UmqRwwGIgyVDxw88dFI=;
        b=nNZoV/X2Y57sAaH3f4IN3Boy5wsHsAdH+9N3cMpTz3YRRTCb4A+FXSArpmAv/hZCuJ
         Bp9oEH7U7E1XCTgvlSoUCwW2yI9RaC21MLBLROwj+b6pQU5P5sUM5AqUYiQxCluz5Fsy
         nfOM4xZ0lvLwV4yzPU7AdF9jx9JQ87e1lEDyr/njv1NcDn7siZyRwtF4/WzMJFkNzEGp
         HXlGeg7DlcqG2DIiphBeyggCmPTszpGBFxDs3fKES9pOLK5iDZgT5obVyJHEeXpO27ph
         pqYweI4SUQt4RXBJeEUNRC+2j+d+xpNnmksB0A+se52xyUGEoovwSl9y7+d9oQr30rEQ
         Tmkg==
X-Gm-Message-State: AOJu0Ywu+bS31B5Ldc4LqidwmbJwLVj6vnNFIsjfaT19EUtf7i21PESl
	p/mbnP1UvoDkhCaLmpNxEjnT9Felprihu9hclUMeaD2CcW8C/+yjlyG/nBR+K58btI010lT5xPV
	6k00QhEBu+cyzEDZ+L8kYWEtCnlE/QzdRPes3jADtidxf6fL9TqsLmzPK4WziIx9X8sqEag==
X-Gm-Gg: AeBDietwPmHrAuI3E6KYaCrafIWs/Do2jzJZQBWcqq4OsUBqRurtd3mb1PmGaiHwuFM
	GuDm+Ty4ANVEXMaRq5/QE7b2pl2aEemNNGjxmm5uEZ/Wy4h2emIsmd1UrBEUiVOkTn2bOFoVuzx
	TACpamgiAGjrqJC+SuJIhiASD0oVPlS8O72UZxySIcQTVlBPA9WgcEDJna/l1uDvnCabz0HcST3
	IJqBNf98ai6p8IxHbS3Sf7pVPzOkfGDdBhSmUQ2E/q4QIp7hTCCgOeqXH524T4/S5wsyYbxKy9E
	C1ZrCn/MoFfTfg3/bK4SS6rCJZSP1G/KYXkTkO9RfFNQ3KtsWhamTvVIigUVrZ0TlcoyEaNrElV
	PpgcMVklW+yYrdyKmeaIoSr1S94kYcw3tb79Eve8kZLwxJDZWfVaelml4/6HqrTyKl74f4kNb
X-Received: by 2002:a05:620a:bd3:b0:8cb:62c3:3690 with SMTP id af79cd13be357-904d40a38ddmr231565885a.13.1778028650025;
        Tue, 05 May 2026 17:50:50 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:8cb:62c3:3690 with SMTP id af79cd13be357-904d40a38ddmr231563385a.13.1778028649583;
        Tue, 05 May 2026 17:50:49 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:05 -0400
Subject: [PATCH v3 09/15] clk: rp1: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-9-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrea della Porta <andrea.porta@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=p2MpxXnzLI/ZMeCq8d35+6JBb5NSPSUB0mvLioIPWxo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDeME14zZqLZjKzb/RfDDoj/TlhzrpqBqvnU5nPz
 bFxTnvk31HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEOrYw/OHX3uCWmVWzKOf3
 Ab33nz3Pibqf9DB8x60W+ksi+cT3GA9Gho8SDjwvVy6sN0lYtdA7w/9bTnSk96c4n233Nm+PWMT
 oww4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-rp1.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index fd144755b879..0f7d9fd77481 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -1174,12 +1174,6 @@ static unsigned long rp1_varsrc_recalc_rate(struct clk_hw *hw,
 	return clock->cached_rate;
 }
 
-static int rp1_varsrc_determine_rate(struct clk_hw *hw,
-				     struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static const struct clk_ops rp1_pll_core_ops = {
 	.is_prepared = rp1_pll_core_is_on,
 	.prepare = rp1_pll_core_on,
@@ -1227,7 +1221,7 @@ static const struct clk_ops rp1_clk_ops = {
 static const struct clk_ops rp1_varsrc_ops = {
 	.set_rate = rp1_varsrc_set_rate,
 	.recalc_rate = rp1_varsrc_recalc_rate,
-	.determine_rate = rp1_varsrc_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 };
 
 static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,

-- 
2.54.0

