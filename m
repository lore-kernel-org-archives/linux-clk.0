Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDB33A9D4
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907144; cv=none; b=Pnvxi8uMFgye5Gky88RJXsSXi/7WKNpZMiv7uoDnndDV3q8GbO6S/plZgxDZDRRw7xL91dejSLhqx+6/FHPkRgMMZOXu0klBtx0jsBFSyokuSmN8GtRX7YzcR2CHVfCxx1Kdc9uVTjaUVP/fl2RNASLTxtqL6vY7bHYxh3hJRUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907144; c=relaxed/simple;
	bh=1zGr1VEhUSEgUAAiV8B/qL6RDaMkiVVGUfjryyBP0yI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hz/9BtMZ/tT6WIlIBTHM2w2bR0+swd0003zwz/tExuQObx7dYDK3aNO2tCZKMDKev0iKyh6oJ1lG0XJg5vj/WzcxpVe1HjDu53of1lO/NA+LicS+AlrRwinytYgLr47HSPVbuzQMSSLxPxh4OrCeCqFWMsETyraBZbN6ehHv5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JvFbToQp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hq4PoVi6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JvFbToQp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hq4PoVi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
	b=JvFbToQpyiF5+4vXrj7VQ9eFrbrwC1rozLIjsszrKdUBzgRHFYXym6QupSvbGgGyH26RCb
	Fg1zUW8Tw7QnqVXHg+tp4n3aFweaOBfvphOy4mse2k1mFMzmtdNCua3tIyHguAxF74Hh0l
	odmvisSsLjggszG8yiTApW3kRpx9GRI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-5XbaepCdO5iW5-qucaa9UQ-1; Thu, 08 Jan 2026 16:18:55 -0500
X-MC-Unique: 5XbaepCdO5iW5-qucaa9UQ-1
X-Mimecast-MFC-AGG-ID: 5XbaepCdO5iW5-qucaa9UQ_1767907135
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ed0924e15fso1417152137.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907135; x=1768511935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
        b=Hq4PoVi6MJTKBidfilsyYBTgbiz78dZ0gjD9cuxcNlxk5ggc3oulaklAwHLPxydUMy
         87mypWKjZMLKs3eMTc78ZAzF93KeesPlQuJUwwc6ttm4YBrJXij5Rl5WL6m7srFzTvC8
         8UbCwhlnn6aut6OHu+wh9XzRTR2tx5EAXRXsUzYJwypsrBQafKej07ucReYtjrI2cG79
         ApCZxwz/6wC0+AA8tF+laS46E2f9oXTDsJFuJ0Dan2F33xsNpaZjmRvKB1XLOqNxXw5j
         8L3IHXdsEtF3tUUDuGY4KYl27QRrM0awBb/Ki4gob0rgL7XMywL46BoaPdat3XlueMil
         +vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907135; x=1768511935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5QDz5yJgmx0439uD0ntmtxod09pLPWy27GZMDx1s30w=;
        b=gsG2PQJjidWXagTChMXnJS4PWu12jyBFZWy77F1/f/2ddU+yCB8m2mxHT4JPBmXbxP
         /MZH5JJT7UUqfkrUMHVLZ36mVViMmvJi19Dl9YcovB+TWvazUPoxrua1gpv0y5STlarN
         Vd3KWeQyyqpGU5ySGqji05iGGq0v1N7jZeb3OJA0jIQPFLXhAVTk8czc7GvXQ1Mbwsl+
         g1D6E07URfK7czXu/e1u7Mo/FcLD84260gEHJgWYyhIlVuFiVFEwEQoXqVIKir7w4JAl
         47rgFGha2RjLRtitsFmBFk+qmySjjYXQoYBDzv993RcmVQRfqp3UdwdT0bR/lXP2Ska8
         RxkA==
X-Gm-Message-State: AOJu0Yybt6ktUFWLTnbSFh6GU9STPDrssQc9KEuOTkz5ET3BWhYxB6iG
	tzWVJLKONTqL7cjjB8OD18Zti9JWyDgZcpslwxw6IFVbsSWbrGul59uLCgi+gNKQu6Wnl6fFz02
	mcIzyqTMc7gHgYM5moW29LA2ODSw6ZlB2uryom723qqaEntVMmKG82F4hsN9gWw==
X-Gm-Gg: AY/fxX6GcjJGDXQUDXTZAcWjpb4O54p0iTM02CXWlzr0oWhffz/nJqTssJuwMtgAcek
	slqKxbHwlm670O+SgJEn1f0DlzQYeqzcWf6Vdq0LDtS89MHn08PcXdDBps7VzPptuhKyJUSh21U
	WqzuI2WAV54w0YaPkSaPXb+Hnz7pDZsstajeMlEV0VKJ0T+9MPUTfO+3NH2yEem6ycpHf+tuI8/
	ChY/61UEkE4gI6/m+DvCWhydJtAuEzLrox2ZfgYRTgo9zXXzW5xXZEq/+2O5KU9nMsHWGtI5Jml
	dqus9XXhMG5OClsOWCssmzAYFjbmV3qRhdSx76XcGOZopLlvqBV1V8+b+w+DPT8hldLrXuIDPnp
	ZgKs+Pf6alVz71lU=
X-Received: by 2002:a05:6102:2b8c:b0:5ec:848d:2eb3 with SMTP id ada2fe7eead31-5ecb560294amr3157836137.19.1767907135130;
        Thu, 08 Jan 2026 13:18:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+wVo31RtnFWHlhbf1gwVuy01FPzefAIXV8pM4OiwoVNvycs5UB0kClvVq2bdd3YZxuh0SVQ==
X-Received: by 2002:a05:6102:2b8c:b0:5ec:848d:2eb3 with SMTP id ada2fe7eead31-5ecb560294amr3157824137.19.1767907134612;
        Thu, 08 Jan 2026 13:18:54 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:38 -0500
Subject: [PATCH 20/27] clk: stm32: stm32-core: convert from
 divider_round_rate_parent() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-20-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1zGr1VEhUSEgUAAiV8B/qL6RDaMkiVVGUfjryyBP0yI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZ+rVz4cq5P358Ldj9m7J33rWhF42pTTu5vx/bOq
 vD+uDptd0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATCT/H8Fc20NW1ctEMhvb1
 eUtmWJ9753w9LOauSY9OqHpK5FGLq08Y/jvaJGQWz50Y9HLBob45cZedTKY73G51alpxMHDtvcU
 MsWwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate_parent() function is now deprecated, so let's
migrate to divider_determine_rate() instead so that this deprecated API
can be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cd1cb38836c0 ("clk: stm32: stm32-core: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/stm32/clk-stm32-core.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index b95b9c591fda7d900d523f50c8bd449398aba49f..e921c25a929c303a2e189bf876667178a123eae1 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -375,13 +375,8 @@ static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
 						 divider->flags, val);
 	}
 
-	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					      req->rate,
-					      &req->best_parent_rate,
-					      divider->table,
-					      divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
@@ -438,7 +433,6 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
 	const struct stm32_div_cfg *divider;
-	long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
 		return 0;
@@ -457,14 +451,8 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 						 val);
 	}
 
-	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 req->rate, &req->best_parent_rate,
-					 divider->table, divider->width, divider->flags);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static u8 clk_stm32_composite_get_parent(struct clk_hw *hw)

-- 
2.52.0

