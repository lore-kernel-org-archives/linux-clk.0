Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEEE3C199F
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067172; cv=none; b=sGGaUT9DD1Kl6rvg2iHgvBG6zzNncKyHD/Vlnf1fZzd1ex3hgMiKRlX6wniuCbyMpyWDrJ8R2yrfik7yuZcoDpgIrjCkpwwS5iCWrbljOabMOPePrJKjzguU9WtBgkdbkCvIFaPxwjibpqYFWAzdpCvJ5ljMVPXB1CV7tWrQAQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067172; c=relaxed/simple;
	bh=MrALAY29IP9geWS9M7m3qqHbvTO0JXFZl1GvPVRnk+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFApgrqyBr3dahAM/DvRtoiFK62tzx8SQ1zui/n1IcpBu5umxu2PcWLTlWHfHS+bc1PXMPGeQzf7rKMB/6+q04TVTcRxnOioKMLJPjFHI40XxTqUC1rQYGr7HvjJpaglvX9ZCpgz7150Uj9v+VizhXkFJEnX7ewxCj/gf876G5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zb+nXba7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsILiCeB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zb+nXba7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsILiCeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6GYzcxOrdAxSbZEPsgL1Jk9SoUNsvRjPSWu65I42GA=;
	b=Zb+nXba7LYQhqvAMjQ9pkFh/dquqJQWwjeDoIWEk0zxRFIaEuTi+/Ta3WXfAOlpDc5yaJJ
	obNju1z8iNMgwKfO+akIVHT6LFJFh3v1Nr+aPU633Q1+vwRgWIEJVToTwyZc5A3hNAfclc
	HTtOzAr2hiAyKZSBFryWrKaAWPebRCw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-MnP9OQWfNY6tSPVdwrxbpw-1; Mon, 09 Mar 2026 10:39:27 -0400
X-MC-Unique: MnP9OQWfNY6tSPVdwrxbpw-1
X-Mimecast-MFC-AGG-ID: MnP9OQWfNY6tSPVdwrxbpw_1773067167
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80bea54dso830606885a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067167; x=1773671967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6GYzcxOrdAxSbZEPsgL1Jk9SoUNsvRjPSWu65I42GA=;
        b=BsILiCeBS/4kugtmaiEmT4Y6OwQxgaTZuh1XXrwrmmifnpsPu9gzyl0h2ma42GS3yH
         EbEnDp8yeJ/3HTx0kTrJfJotbaxmp4+XjyUEy3w2clVxVRX2hDt51athy5GCGYrPXEj1
         trFex9h7kyWxY4Foz+sd4tvbQev4zABtxYy9i5WsUFyNCPJndRSj5q0Jzm3VRkYx45Gt
         6E7MtfE86P2mx9u+gJdpLEGr1IdOSBut4EpZdLh036S00wkTVbkeBIyEyfsUCxexxEe0
         0k9Nz5XQT4jPfDnxgVsTSGZLRL7R89EzPOV+/mizZYgOQxCatfFQ9+ctlB0ydWd5KsuY
         gJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067167; x=1773671967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6GYzcxOrdAxSbZEPsgL1Jk9SoUNsvRjPSWu65I42GA=;
        b=hEN4bu8fah3AOlS4bIQzfwpt0NSS1MjAYvJviYORK4Mkgbhyg7iqhkx99l5lQRAnHw
         XCYksMSeKtvk1GLojJsDdBeEqst3OsHOCNUx73DVHL09ALFg3Upaud9gy2N+GmhFQJ/j
         3yZ0PGZJM5ZhFKWI6jqBMrPrU5Ozn9+qKS5ZrPKYQJfwyWGzZ4WgskNn/LlRhpcjUkB6
         9I6zPkgF3/WlqgJlVFEP2GDgo17BcBt350oXveChTxvS8tu8M9QO3VM67e5qjNlZYxT9
         Wa8nHxQCt1DjOb4nVI3DP7H0z5UxsoLf3weQgnzOAq+Cu3k9GlNmpOYGngnZkzrgxrUQ
         nabg==
X-Gm-Message-State: AOJu0Yyo6K46y4SzDHKeZrVXWMbcC8gWeVMcQy/KzDL+J4XiijvO+Xxl
	frHs+dN9wQchgD9RTx5CPQDwRLs2AOJvp9dno6+aehP23A0wpzmGTozVMBv2PNchdn4MJTmvCJq
	g6CHGkxK7zZeqZm96CYg128813qLgCN56M2T6d65cwKlidXF62uCGkaRtBcNyHg==
X-Gm-Gg: ATEYQzznfJDOt7NDTpvdpfh2PS73vFbMA7LC6kOZdqloFGFhfoz06vyj/v5Gn8mFEae
	C55n06Cze+SZN3OZ45ZRpO7fsWnbF8EnUvpSau9iR0nddd9VPYdh1j7IwiQYYUdi3YG3AnODWBw
	FGmd7OTRShW/Vukv5dwF9qBMh32YmeKSKGjWfYZ2CrWNzoqEXy+8DgKUNZV0QcV3Ot+fb6kCY3F
	d89iEv3jOfSF2KGkjLRh+YnUXiakNNOYOAjP7/clupayFRDS8m/jU4Bx8neBJJCvo4tO/BnfnrT
	x3ATWQPYwEsw7+bV/RLh2kqo7A/Hu+Xu80srIU5j74gnqwX6eMmsjeLa5gZNH881IitHxHdJmbv
	WKyEnjOG0v6hJhRRWv6lP010+/9A8y5hHzBhW09DVKFuXua8ukWOpEg5tEBWzHw==
X-Received: by 2002:a05:620a:4450:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd6d4d5f88mr1364284485a.67.1773067167068;
        Mon, 09 Mar 2026 07:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd6d4d5f88mr1364280685a.67.1773067166707;
        Mon, 09 Mar 2026 07:39:26 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:42 -0400
Subject: [PATCH v2 03/12] clk: rp1: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-3-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Andrea della Porta <andrea.porta@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=MrALAY29IP9geWS9M7m3qqHbvTO0JXFZl1GvPVRnk+4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e5bFpGTYb8x6b/g2RWbl9+KW1/2LD25KnBxfMdbn
 3chX7p5O0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIw1uGv9Krvov4mWxceaP6
 YIIAB8f93fEHXz1uXl9y6+LbSlYbSVNGhiPRiTtn7bF58srHy1fxpdWc3tToCzfPz7Y7cm/xDZf
 zoswA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-rp1.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index fd144755b879862612ea5e22e913dbb44a140033..a4b2a10adbc47cd5a789d1c3c642a4437c7efef9 100644
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
@@ -1227,7 +1221,6 @@ static const struct clk_ops rp1_clk_ops = {
 static const struct clk_ops rp1_varsrc_ops = {
 	.set_rate = rp1_varsrc_set_rate,
 	.recalc_rate = rp1_varsrc_recalc_rate,
-	.determine_rate = rp1_varsrc_determine_rate,
 };
 
 static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,
@@ -2000,7 +1993,7 @@ static struct rp1_clk_desc clksrc_mipi0_dsi_byteclk_desc = REGISTER_CLK(
 		"clksrc_mipi0_dsi_byteclk",
 		(const struct clk_parent_data[]) { { .index = 0 } },
 		&rp1_varsrc_ops,
-		0
+		CLK_ROUNDING_NOOP
 	),
 	CLK_DATA(rp1_clock_data,
 		 .num_std_parents = 1,
@@ -2013,7 +2006,7 @@ static struct rp1_clk_desc clksrc_mipi1_dsi_byteclk_desc = REGISTER_CLK(
 		"clksrc_mipi1_dsi_byteclk",
 		(const struct clk_parent_data[]) { { .index = 0 } },
 		&rp1_varsrc_ops,
-		0
+		CLK_ROUNDING_NOOP
 	),
 	CLK_DATA(rp1_clock_data,
 		 .num_std_parents = 1,

-- 
2.53.0

