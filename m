Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC42D660B
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916530; cv=none; b=uClYcPWrtWPQEYgyuS+riMVs7SRfjU8LfUWDxrtmWXuZ1MKt5INANlbYeL7AtYnxHTl5ISSJT8KzaQ3W1PbKJIHW6cxRnQHN6n4HJ7eMAxVoNtNT8W4ikhtLUIJdxkC3+G76kX0ltD2/7+NA6FcbiBRkJJJ+pVUdyJNbEhblhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916530; c=relaxed/simple;
	bh=l6XgJ6W7yha/WW016u8LdUqKQRLgIir6odjd16bnNlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKBTn753kGnsLZ3V+4GtP8DtX8+dmmLGcewvGn4x5E304qnd/yXpQJNkY/Q/OZewGHkNy1VIxB2znWOlmJsuJ4E+Ygx+l3YvUFvLXSxEKnYb/PwBP+t/Lw+dIHaBfhWZxY5ZUmWW7e9XtiSWo5TtfAbqW0ZBhkzuYnK6L/mlJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJUcX30b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJUcX30b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEtISiukDB4UA/wwqndztsPEY9t1/gC9650XSLJtvzw=;
	b=HJUcX30bVQfniyj5FudrmS4krsXp+aXn0yVe0X2XI+R9KufVeW8lkvj8oWEf452mi2l2VR
	AAhGyIJgQqxoOCk8nkQ348kizEFNWkye5L4UlzZiSCweg0vJ1ullwMbPBIpVL+GWcrXtAw
	ZDLxvyxk+qns/+PfJsI1Jk1QP0Wl6t4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-tNjhuZ45MVOPpkhscN4kKg-1; Mon, 11 Aug 2025 08:48:46 -0400
X-MC-Unique: tNjhuZ45MVOPpkhscN4kKg-1
X-Mimecast-MFC-AGG-ID: tNjhuZ45MVOPpkhscN4kKg_1754916526
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b081b2a94cso146659471cf.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916526; x=1755521326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEtISiukDB4UA/wwqndztsPEY9t1/gC9650XSLJtvzw=;
        b=wyciQQKTIkm8e5SOd6kNv5oqkSqMXlaWsL5XKkaY8I4Yf2VA+0L9yW3NEtHpWzml4M
         cH+9D+cRJFRjV1k58oBRZlL+Lv0cPuloLm492wDM6cFtvbV65ctA9k2hy0sV9tbeKFHG
         Etgu+ZTMTnwOgB8pYI7W05EnjOJPgmM4bdAhfCBoFvEXjxr/JUgmbevAwh36eeiMnzls
         1XxvO6nbLN7Jo9JDU2bnpBrahLVKw4dHJwKSFRtmiYKz8mhuT0Mkg/Y4AfcpYHkDtPBo
         5uosNCSps0qxgNYKXW/z1Z0ovUOoreeLMr3PmD6v8t31w/ZWoTQP70dv8kUvohNy1R0G
         3s2A==
X-Forwarded-Encrypted: i=1; AJvYcCWlffgZjSxXKNbHDyXO909HffefSFnx75xaoFY7scLTKjKk08xtLZ+QtSmOVwef1ll/+ZLkn7A2ptw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqg9GTOBb9idHMysaMQL8L1ruGXJOvMRgS2EPpMNdv+9tRLLy
	3ZMhAFZczIKQrBoRb+pA2p9pSRfqxeUT8faqDFvzuBQggsgoFBQ8kuA0xIHXc3zzgL+lOTj8elL
	TTvDONoLykBK48KTp+8SaechREbD4dgj/w1zmsl/H1vQh0ICuaYFneUdEjzUBUQ==
X-Gm-Gg: ASbGncvkW2xy3S9J5Nlf49X/xxcXj7pQ2slyF0+LiJkAgxrypABsTfKukhl5B46GsJF
	NcOSO0iBmTui8BwnfQrvf+B0dRErtTkGVlLL5pQj1QiEfInHQB63dQF6YjKTsFL9SISwbP8kx9r
	P9TAWZbbh1tgXe/J+qisCCnnPPt6egsbkPvGbBk9PCd9gdFD8NrEWU5d8mn8CTX8Dd+0m7GySeE
	lf2pVpWHKxCymWQjSxaN/weh44UT0UYooCsDEjg+dEJJr2wJs6JIAnFGjW9U0D1tp+qMqLimQRB
	h9np2gwbKRLNCZySrqcjV1+/sS5NwUUaHTu0pH+dCvl0NVGUmt5CAPP+/Lc8Lmwj7pdPcJTYhGg
	LTLg=
X-Received: by 2002:ac8:7d46:0:b0:4b0:a07f:c1d0 with SMTP id d75a77b69052e-4b0aec61311mr154359081cf.5.1754916526286;
        Mon, 11 Aug 2025 05:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuajLdWHinQz1T8shERDjeevHqOrAQDwpblwaApX8japUOJDgE5x28sAgJW4p3Ei7BLjtm8Q==
X-Received: by 2002:ac8:7d46:0:b0:4b0:a07f:c1d0 with SMTP id d75a77b69052e-4b0aec61311mr154358821cf.5.1754916525875;
        Mon, 11 Aug 2025 05:48:45 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:11 -0400
Subject: [PATCH 6/7] clk: ti: dra7-atl: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-6-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1630;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=l6XgJ6W7yha/WW016u8LdUqKQRLgIir6odjd16bnNlg=;
 b=n2iLjG9nS7jOmK+UVJevc5Xa5r8KpCC7ggEeWCcVvPhhhsGoThO6dmi5mnXDQ7f0SjWodiNh7
 OICvVHC6qGwCevKiZrShkiskzIyE+56+lWC/ZlUJVesZbHlGF3hDgyy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/clk-dra7-atl.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index 0eab7f3e2eab9edb18a5f881ce329db1abdb5be0..b02f84d49b966ec0e14a4bf89e39306048b964b6 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -120,16 +120,18 @@ static unsigned long atl_clk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / cdesc->divider;
 }
 
-static long atl_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int atl_clk_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned divider;
 
-	divider = (*parent_rate + rate / 2) / rate;
+	divider = (req->best_parent_rate + req->rate / 2) / req->rate;
 	if (divider > DRA7_ATL_DIVIDER_MASK + 1)
 		divider = DRA7_ATL_DIVIDER_MASK + 1;
 
-	return *parent_rate / divider;
+	req->rate = req->best_parent_rate / divider;
+
+	return 0;
 }
 
 static int atl_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -156,7 +158,7 @@ static const struct clk_ops atl_clk_ops = {
 	.disable	= atl_clk_disable,
 	.is_enabled	= atl_clk_is_enabled,
 	.recalc_rate	= atl_clk_recalc_rate,
-	.round_rate	= atl_clk_round_rate,
+	.determine_rate = atl_clk_determine_rate,
 	.set_rate	= atl_clk_set_rate,
 };
 

-- 
2.50.1

