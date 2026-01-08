Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860B23358BA
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907085; cv=none; b=lt+yu8NXEo+oybTeZ0lwdsp0KX8t2gQNzFYE2mXoeas32S6tJGrHij1QZLkzbmOsxLksqv/kuysx+aEdJIiI0ZWiNoBzNBix27l4wHgncn3r2UNmYuIBct2OoJgQlZS9x5s/mhwCisQA8aCeBEIb1dglWjGUcBOqBoMxi8bkEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907085; c=relaxed/simple;
	bh=K0FQ99DF6G2l9smIVVgE4dnwkD9e+LTmW0IKTcacQ4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHXe2YaUhigCjg7GD0sGYVTKC8rcc97/OnXNKYC+jT0Hxd6TybKnHxqKRQ5D18iHYf9GMH2lcu0Fbt8JVIaQcW6NNRlzvcQW36ZzgP4ex3LGgK9o70BMt3K0ZXcqMvrJgEPuXiya8/SPlYWWmXhO2asd1Air80xtSpNUQbhn7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdClGVAO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cumOQd2Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdClGVAO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cumOQd2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TemeuWi2wCTioypOE3JNNIJOW8KjtfzrrE2QX3Yv0/c=;
	b=MdClGVAO8L/SdGOKt0kpM4Tft4Z+nETAjOxs7lvauG1+yqeS8Is5TQZyMv4BnNviVtDfN6
	cwN2Ipe+uD8VY1Je9QGGmaDsNAXoCbLebnX0mmXGnovq1TLk2zgGwGBvZPRWr5J/HwSUEw
	PRDXsTTy03es3BrMTDDdcVpZOX6rE4A=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-vuazECpEODSo_rFTiT_bkQ-1; Thu, 08 Jan 2026 16:17:58 -0500
X-MC-Unique: vuazECpEODSo_rFTiT_bkQ-1
X-Mimecast-MFC-AGG-ID: vuazECpEODSo_rFTiT_bkQ_1767907078
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94128f1b13fso4472034241.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907078; x=1768511878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TemeuWi2wCTioypOE3JNNIJOW8KjtfzrrE2QX3Yv0/c=;
        b=cumOQd2Ye830JmzYPhVRuyd2hejz3QZ6z0XmO4ei79mWY6SLQDjwN4WLDhYoaF5pcq
         ctCsDpF5RZLd4HpfzUpV++23RnuP8vOWXaVXSMgYhPQ07M/juQtQdgY95GqmXmD7FUgz
         /+R+4nLvtlbW/goJj+7zFIWo3qaRL0rahoUth1cwHo0guuK2CFXkcL8TkwkWAQVC8MV5
         /scd8ZhwVllV/w89JUO5iIXwhhSd7HgeSOY9L0AMcLOxs8Y7fYttsRS07dH2zjXwE2ba
         tfggtNQ0bDVh9Urfkkg53uPTmQlB0liOn5flafwDNVDYyC4Pi0Csj4CwuB4Wpv35fCk1
         xOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907078; x=1768511878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TemeuWi2wCTioypOE3JNNIJOW8KjtfzrrE2QX3Yv0/c=;
        b=gErhXMC8OunZYst6U1mxBXs2Q0H/OB5Mj41Y27NZFAAYvwfr3kULyOFxo4ehn1hHyO
         CzC3FtPSwFrqFmd8UQ31nwHUUjd8Bz9h7De0oCJRe4ULdqjEp2npiO0O8AuzxRg2Fb/n
         WtlFR/eJahBIADjbOrSlLodWWYMLDgFelMLl31UXSm1L5s9a1t9LzH+J4BSIdPvN9Z5F
         BFf48nNIj0UisYjC6jm5VVrYCLqkh4Vv84xbvqNYskJ+LIcFAWyZdfUO2GWJTCn3GoqI
         /AJstmgbQ58DFIdMa1m6xBUCntk4gjE+kN1E7ahg4slSjnzgsDuy1wjDWh0rRF/km1yQ
         BFCw==
X-Gm-Message-State: AOJu0Yy8tVN+/pC/Ro2zYIVAUA5eSyEkV/EYaw0LbiaILMDMjPjcQ1J5
	My0kvT3pRr6UbYS7yUmO/xwTRbAeSQiLrohomghOlaMKDREikbyKheN06xDnRit0F3mjftx6heG
	WpCNmslocRsyDxy9WzvMFezfgvGszbrytiMCU4edK3QeE3nIktAf3JgbeoRJCwg==
X-Gm-Gg: AY/fxX63grLdSe4MBq4y83nh/h5JCWiSa3Da769m3pcZcvjBIjDZHMKnMCg8U7Xi28i
	Y3fvkDx4J7UYKRfDnn/sNl7AoaclnRpoRBb8QA2Qkf1nQTzazxXYXNbqXrVNnp8Ned6rauIf4k6
	VFshqkMmy00OOEFAGYGKmyfgczzbm5g3JVEYkLhgSUwLbYnbN5+8MjSV3NVsYjEchQB1TXLqqaZ
	P7cw4eRT9BQ8NnMTS8ziHDk+32sjTznY7P8lLZq+Xb9ZZ8Xvy1EKuy4rAe2qNDcOiH27e3bvFRv
	yko2h6PpRZWMQRxOWgAtae3fA3x7X5/W4NaaX2bPZWJRQ+9rGV9Gs7PhodDvBJxQW6/RwJgimi3
	IqZF5GgjsZUov7V0=
X-Received: by 2002:a05:6102:5048:b0:5db:e77e:7828 with SMTP id ada2fe7eead31-5ecb687b373mr3139780137.16.1767907078168;
        Thu, 08 Jan 2026 13:17:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHedDwn3URCaGkSiOZuFLs9y04mybp6etKanr4h3QJEAdm0N8i2NP17eLN1PW6ZVp8OknusUg==
X-Received: by 2002:a05:6102:5048:b0:5db:e77e:7828 with SMTP id ada2fe7eead31-5ecb687b373mr3139768137.16.1767907077681;
        Thu, 08 Jan 2026 13:17:57 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:57 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:28 -0500
Subject: [PATCH 10/27] clk: milbeaut: convert from divider_ro_round_rate()
 to divider_ro_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-10-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=K0FQ99DF6G2l9smIVVgE4dnwkD9e+LTmW0IKTcacQ4A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LYLpZoFf969VuziTr0HNSu8/TiOuTtmmn8+/lmri
 WGzhrZRRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5/JOR4f36uesTb501K1ES
 f/j/mABriXHF4nk+k2wehFR5rc7a6M7w38/60aErvD8luKQWMS3P3zDr/xet5RUJLAVeha45nCq
 V7AA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: fe67c682f91c ("clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Taichi Sugaya <sugaya.taichi@socionext.com>
To: Takao Orito <orito.takao@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-milbeaut.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index b4f9b7143eaa658a7f2a14ff3cc9d91d8aa071c6..4e3790b7fc9064484c20a068d0315b8fc8241290 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -398,13 +398,9 @@ static int m10v_clk_divider_determine_rate(struct clk_hw *hw,
 		val = readl(divider->reg) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  divider->table,
-						  divider->width,
-						  divider->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width, divider->flags,
+						 val);
 	}
 
 	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,

-- 
2.52.0

