Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388B3346B9
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907071; cv=none; b=j7OiWFHLvV6IAprkeuW2VYfq1UEODm+EeAZXNbLDHfU4a1hQALePmVWrHf/Cc8u9TbrqKqY/VNiVZ+f+x0vY0QZS8VSxchMiPOPrXDj+zXb1x558EEjnrnAVmNtZAg8o0DVkRqGkeLapIQVU/1SEUyfNvsDUVWBtxu83HS9fu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907071; c=relaxed/simple;
	bh=RuQmue0KXVswNj/US68xhO/UINGh1ZD+21QN33aw3ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZkl29YebRlHKjGX1PKwHt1ONNAQxPPbY5d4xofUcZp/zDkp0Qbrmwo1wx1J66j1tRS3pU4MGFqUATNu4GDxH7BM35nC7TFIQCzQw4CDzPZ7NnhIjX7GnRl8Uz7Xp9ee1cLZMf/yFQ8Un9JML5byOPJy8n2CxhJLZehSrDmJx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8Bme78d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DcsrXD26; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8Bme78d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DcsrXD26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKs6oAZCQbgcF6rh1H1z28GAjZqxIUJQTytIqgMl/jk=;
	b=F8Bme78d8wCpten+z4xL3hoJ8Qu1a1MQU8Lv4/d5HYUDotoUnAnypOwR2D2tlEIIsbfMHX
	AiSzXdD0UaTZtWn8FB+SNpwpUvSFJTpma0mFalK+LLNKs0GKF7rC0BbM8WVd61baX8pxrS
	CH4rhjZA3fv3JWuns6HGvZx+Uhf5I1Q=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-7KtghNwVPLuc1UfyKmt0qg-1; Thu, 08 Jan 2026 16:17:44 -0500
X-MC-Unique: 7KtghNwVPLuc1UfyKmt0qg-1
X-Mimecast-MFC-AGG-ID: 7KtghNwVPLuc1UfyKmt0qg_1767907064
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5eea2aa86a8so1305355137.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907063; x=1768511863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKs6oAZCQbgcF6rh1H1z28GAjZqxIUJQTytIqgMl/jk=;
        b=DcsrXD26dimtfVpkcvfi727dZ3EeauAeDlZUyR/hTu8/OJR2Bc8P5HDWZ+yqhtuNu+
         jQpY9uVTCCH/VDj1ZNKo436BahAlOWpwix+zok0MgrXJwvV8vKtAk/RXD2350injc1p2
         Z2NNrFSbhNt4fo04lbrB1k8axmA1WUQAX7QK80gZHNnz/mAmmA8x3KQETwtpDpJoz7nT
         Hp6uDBujcjyd7Pxqz6vNGrcCaPmZ6C9knfrnISgLu+e3s1DXQbyyKkNgg3yFEpCmklBt
         xDbM36hTYjZ5HtDBB/fRTp+/AQTLscK9WG02SMTkpwSjtw/npxOQRQHz7e+JGDdpsAhH
         mD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907063; x=1768511863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKs6oAZCQbgcF6rh1H1z28GAjZqxIUJQTytIqgMl/jk=;
        b=dGGH2TvPbiGnPYRJ/NYWymtqT9RKxRL74CB2BV46Mm5utTjA7n1+WhMXwwBBcI4PuV
         Zu1jnYuF2yPBMT1vNqUUIxpsDsb7Ui4WnUat1ei21j/ekTiFYiBeydItw0ptGbuZCtqG
         LAyBvDg+RwI+H9NtmxqWx8dx5m7AitcsXNdYXAdFbZD4jbgiKxZ4GnQDe2tcCqFGa+Dn
         Sn03f2OUWhespIkxgSsWB+sotk1B8EsQajY5QOaN8pQ3oeN5/AmWhLvZXJMjmG3NZkoN
         EGgNL5G7Grt/KMmqCMHDfPQZmA20Qe+9o9IvWBBFhQ5ETwZ321u1OdNe+9a0X98B/ITX
         eLuw==
X-Gm-Message-State: AOJu0YwVbOUTEgWpy24K+Ne0Lz4+TaW5JrkgcC7oCQKLb8NLRu6K8t6z
	iUGU6qcwaOyz+SiUCNS/OdourrlmijIS4KZHa6mhHBcW8lCmnVF5hZHM7SnNwnjM931YKqeuoWR
	6ErHSZd3zdsVS4iZg5R/mHftw1zk0NTq8gA1VqK0bkRqHyxwDExuA7Q/NtFHE77nDelAqKA==
X-Gm-Gg: AY/fxX5HRiBRjU29zepqEaUreINpsqyLwID2/8GPBNa+Clt8xmnFh00pIvPCl56ol4j
	coCfEL148Hjl/RsvMJ3LJruPMVuYJ61noa8T2ianrnRwVuoK4CJzTvbSYatjT9wApEBjiHj1p7M
	VXZ36Huljm42jBk3twpKQMTukxdy9yOf5VosBmP8pSvTm3mn92JZcFDMZ9JLKAqWAn6yWCbaxdU
	bUQcP1/6rWJ9Pn7YcAKIvr992RsCPfzB6DT9ASDS3R+5pzHMT9i5hVrd/EPxTgfB6fqaAof7bIJ
	hibe9sRG8GyZggViMg8IwBlX6kjiV0uCTvRfvdmeikRDTlUGhUbuB4GXuWG2aVra0DjpR5NR3xn
	zmBit+JVaNXFNEPU=
X-Received: by 2002:a05:6102:14aa:b0:5ef:23a3:205d with SMTP id ada2fe7eead31-5ef23a3214dmr142757137.31.1767907063637;
        Thu, 08 Jan 2026 13:17:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyfz4L8JiCndo8FBpm0+M+LRB6QOmq1jfaaNaZ6SC4zPZtZ4JarI/3vVLEaOtB78YN6DHpow==
X-Received: by 2002:a05:6102:14aa:b0:5ef:23a3:205d with SMTP id ada2fe7eead31-5ef23a3214dmr142751137.31.1767907063199;
        Thu, 08 Jan 2026 13:17:43 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:25 -0500
Subject: [PATCH 07/27] clk: bm1880: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-7-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RuQmue0KXVswNj/US68xhO/UINGh1ZD+21QN33aw3ys=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LbNl/tnocy/bzOTXuBUpW/VnydbLT+UemmHiefCO
 SYGx9ezdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRzFcM//RYak4qdxV+3Lfn
 akG04B6eoMV8k9I47ms6uJyM6zpVeZ3hf4jaCeeJX5MrqsLmPuF4MFmHYWbDx9U8Z1rintjkFcY
 VMQMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 64613d7fb42f ("clk: bm1880: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-bm1880.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 536df8e828eab83fbd3812135139c703aa7a1ce3..1bdceb36fa87e8250c10a7fc0791379e1533bb38 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -625,10 +625,7 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
 						 div->width, div->flags, val);
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       div->table, div->width, div->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, div->table, div->width, div->flags);
 }
 
 static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

