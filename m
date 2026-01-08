Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D587E337B86
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907125; cv=none; b=m1si2OQhgdMaJhD1yAG7x8q7VZO4/8+iQmZOzCqokeLA+NwjqLgljzbKT13cgd53piqBdONd4RgeXVDCkzA/DKH42RRRpujm3r8yuAKbT4/JytyHCBJP6KZhT1ocJ+lk/hnzRfoIcNOBBAChBaGKIgSmH27gWraEWoEvr+0om5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907125; c=relaxed/simple;
	bh=Ge9eXc7hiD/dbOFdwq4ZbwJA1t1aWqrp8YuWJZaaqt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNmJztnX2mtyJTewrAwG7Q01wyfNO3fGdUBCN3WDz9fKHZvT9VDkgBFsCkIa5w3bNNMaf7Y+jP//XnqxUJ1iI3jiBetvzfR79elAPF9QwCd1GF4M9OBYW16CPFthZAT/QXYXLoFgjDWNs1ly6z7kgyLnSDl3cTQEcJUIl1CQ9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=evQSZQ/i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dk7JtmFF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="evQSZQ/i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dk7JtmFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fdI4HNVMXpScbiOdWnmJAMr7E0Pkfpku5YlZKipJgA=;
	b=evQSZQ/iESK9ecNgYaOQz9zcD16Yms+nToPRahPorISktxNc6YhHeAm3H49xi8POvtW6wG
	lGewxBnjDT125hw+SSRTgl7ETaUV2t6EAHNmULQ5ZxrEh6sTr8x4gu4zbzsMhSoIUdubYd
	ejY/CvqyZRRJSLj3iu+NQWZKpVh0mU8=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-tpCOi8AHOM-M8nJhIGWHhg-1; Thu, 08 Jan 2026 16:18:37 -0500
X-MC-Unique: tpCOi8AHOM-M8nJhIGWHhg-1
X-Mimecast-MFC-AGG-ID: tpCOi8AHOM-M8nJhIGWHhg_1767907117
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5eb8e7b7b40so7756309137.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907117; x=1768511917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fdI4HNVMXpScbiOdWnmJAMr7E0Pkfpku5YlZKipJgA=;
        b=dk7JtmFFP5awEj8IFFBjujaWbIiRuSFy3fmnM6Wshq62Nc27/dSO0DwnrfappX5Wbr
         nkW3oB5p4UXxhuAEMtyk8rtX2VDmhsCd18daZFwaViS0bUOvrUzDVV8PlXp9VjNOekk2
         MkrLrzp+ruhfhswFMOjh21t1iEdME8nVruw4NSefQN8X/5qukTJIbAD1cFhrLcY4LxjF
         qAEZcf5CvtU/uJ4+u11lzgtJC1+D1JuiN1hqIpW24H+Xtx7O+lBqdNpKAGxrTyJXYASU
         Y+J3SPEFfTxEq/YCHP869OtOyQtu/AtEMdlKj9ceeKJ3f0GMcYlTDws/Qm3XwIb+UzPI
         oaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907117; x=1768511917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fdI4HNVMXpScbiOdWnmJAMr7E0Pkfpku5YlZKipJgA=;
        b=UCKuUU/E+6ar2qD1LI/7lBzPuyxKC7fWZUJauzsuxjNo0VPNREV86roqDGeTpAtjgv
         VCtA17bKY4SMgzOjW+bI4jVynrYE5fwuhfxU3EPZDdNddI/Vxd0zUHuJFLDONAo8uGrC
         I0j4r3buunLmVje7x/dSu53rKFXHlCyvafRti90JAucDvBNZH8IPCuXgPUV1G4yN7N+X
         DyUgJWYC/h7iGg4y9qC42ct5KT2IwneePJ1m6dlTf3QSVPPOd8heE4uPZXZiBffNhwSe
         oQWoB/LRxx89ryAdAbiSO9dVyfG7opVctHkRUB1eiGFQ9DPMeG/twY9uaLdD7FGHG7tr
         4bVg==
X-Gm-Message-State: AOJu0YyME43k+PHpOW++KOcxKC2JnX4crqcgYlB+j+a6IU0pmQl7//wT
	n1DO/YxkGywVMBCiw/ySHoVkKOUm/RgeMVxBXvWvjn6BO3NkMflOgw1megpYPDMFD30n980JabD
	dELHVJYP3CzP6Fs0Ga0TBMELNOwHRa56DKsPkjpNH7I+OHH9Iac+XIXAX2UlOsA==
X-Gm-Gg: AY/fxX4gK19Ihdt6NfoO4LVi335JVYx+YUOHDdNF/ROr4Ds2xUedICgb5FxwvxH/4Yu
	4ivSUHxcvdU4UR/c+vy9HMyttWJsyEc8wifaKUUOtCR9NidZqwYMGsWlRoYG/ITJyOcoTFEJJAW
	tBBbULHjCgOZNpSGA6N1BRVnc0xg1VJfK+70D+/PtktDolUK7V0PJSLU4nOdoo/gahfEQV7ya3b
	8SknvJGbO+aHMBa1Fkfei2honMEcfUwTW9YAc51kuEa9TnQ24k7dKIjIsRYEqWIwTu9hRnDwJI0
	aKnKCGmkWePnCaPqbJwfdC0mTkqSsEJEc8b1/3oGAxlHmaEmSGexnaMDFneQcNXzXeO6S7kKlVE
	mUER9zYHHged4X1M=
X-Received: by 2002:a05:6102:161f:b0:5db:ce49:5c71 with SMTP id ada2fe7eead31-5ecb687fccdmr3306766137.18.1767907117142;
        Thu, 08 Jan 2026 13:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqkSY3g2BRFtVH/hTwOCP8SDHCsAmoUI/QIHDt4YAq9tFbNnfPKjO/MN6CStqRG69amOeAKQ==
X-Received: by 2002:a05:6102:161f:b0:5db:ce49:5c71 with SMTP id ada2fe7eead31-5ecb687fccdmr3306747137.18.1767907116769;
        Thu, 08 Jan 2026 13:18:36 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:35 -0500
Subject: [PATCH 17/27] clk: sophgo: sg2042-clkgen: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-17-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Ge9eXc7hiD/dbOFdwq4ZbwJA1t1aWqrp8YuWJZaaqt8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HaYum9WmXVj6rbsy2f4dzpsW9yyZHPyW24TnwdtH
 9OOCC5m7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiFecY/te7KlaaCBU3MLco
 CP6oUzgTsVrRaPqa01/lfQzZLs5LV2P4p/smNuhbq3RQ/K9CF/ncXdfal2aUnT3y8Ijd1or3m5/
 PZgQA
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

Note that this commit also removes a debugging message that's not really
needed.

Fixes: 9a3b6993613d ("clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Chen Wang <unicorn_wang@outlook.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: sophgo@lists.linux.dev
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 683661b71787c9e5428b168502f6fbb30ea9f7da..9725ac4e050a4e6afd3fd50241fbd2fc105a31ca 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -180,7 +180,6 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
 					     struct clk_rate_request *req)
 {
 	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
-	unsigned long ret_rate;
 	u32 bestdiv;
 
 	/* if read only, just return current value */
@@ -191,17 +190,13 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
 			bestdiv = readl(divider->reg) >> divider->shift;
 			bestdiv &= clk_div_mask(divider->width);
 		}
-		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
-	} else {
-		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
-					      divider->width, divider->div_flags);
-	}
+		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
 
-	pr_debug("--> %s: divider_round_rate: val = %ld\n",
-		 clk_hw_get_name(hw), ret_rate);
-	req->rate = ret_rate;
+		return 0;
+	}
 
-	return 0;
+	return divider_determine_rate(hw, req, NULL, divider->width,
+				      divider->div_flags);
 }
 
 static int sg2042_clk_divider_set_rate(struct clk_hw *hw,

-- 
2.52.0

