Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D9133556E
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907046; cv=none; b=JyrDuHm8Q6fhBcGXursEMLy+q8vrpLwbr/PUZPKa+sWiE2LBFu4Py8KzSZ3J/+A2oubShg2qb0aDYYgyWdPZQXUlPaZce4eDk4b0c+OoQu/8M5lhs2sYPthrGleGZZRjXDJqGgdcd1Eb/IoBe8mHw6ufcK2QmC04J6nN8QDmn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907046; c=relaxed/simple;
	bh=vDAetoqqs6cXCl7bwwNO4+syHzby9vdv3IeOGAXMg98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIEvZZaAcQWfu7GEyNePiEZtI9OYpcq7CaEzHS5Qkge1ue1IkSKXTr1N6TqxU4Eu3JpqC5kE5WNceUZFnhBN9DtRFKbtYx8R8Hz+Xe4/oGT0hfJ4QoeXER7nHSV3ds/CGUYGbKZClOyiiYJ2jVxuV0UI7CdVk12AKQx4CoKC0jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=el9EpaOY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YXLte/oq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="el9EpaOY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YXLte/oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XN7FseKUHh/NOjCMySF93+tmLbyPj2jDN7x2b6v0jTM=;
	b=el9EpaOY3HEhNnPy2zLi7wNXqq/AiRmQMjwR7pazNsfO3NBigq/4obKWJJuWeZcTnMGc4t
	rGNan3/JTZNZdoQ3CVwt0jHDTxZ7KjXBldKsyl8A3ylAUw0+1vLzTHM0/hvXHVof4sgnW0
	KNEbE8garTziAkjcbnDe6aSjqKPbZvs=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-1UYoHHPfMuG5mo5QT1pwiw-1; Thu, 08 Jan 2026 16:17:12 -0500
X-MC-Unique: 1UYoHHPfMuG5mo5QT1pwiw-1
X-Mimecast-MFC-AGG-ID: 1UYoHHPfMuG5mo5QT1pwiw_1767907032
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5eea3cd5a1bso422261137.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907032; x=1768511832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN7FseKUHh/NOjCMySF93+tmLbyPj2jDN7x2b6v0jTM=;
        b=YXLte/oqVuYivonhloEm2tdbMQjDmdptDmFesoFp2Hs9FcHgG/FnV6vQtmSYpPycs4
         tTUrZzN0nzUZ2MNFp5g02hypg+mFgbAdl3J+NAuvQjyae0zoVVmHPkmMnNUYHGG25Urw
         uuyC9WR3SJ9Q7LCvOzDdkUe4TGtCtvktGexnvBCcQtuqtGvmV4LFEgxg2ULEPpAvMC1c
         nFc0/g7QWiRq777RlkFqzN/B3EJHDdj8oLSr3tFKlivetB/DcUZd3WrR+l8UvjPdds94
         gRcmhrTkOG3nKSzksYAUmjq5guWVSULC0PsXnNWqs88mbutPaMmzb7oblW2sKoezge5t
         6/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907032; x=1768511832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XN7FseKUHh/NOjCMySF93+tmLbyPj2jDN7x2b6v0jTM=;
        b=ec/uOptXjx8xE0gP9YigGnOktxQSw6SIl+Kx/bkoEZMmLbqoSZ+z0uGPKczyLlFJir
         ePXrZ1Gs6sezflU794mBm+QFtUd5QblZY7KU4c7H93C1XgQg/9XYaSCaW+t1pHzKZ1dN
         ja7yAabdiL1cfvaWjQgu08Huvfw+DVJMmfHp6YWhwuuEQl2YnvR+hZbIow50eRc5CU6w
         MBioUKUhaji/yjHp80RmqecMsAJPr7YYVtiYCcYEok3/iSlygEK7PY0F22Rv78oEUOPa
         I/N+umEQ5diD2EnZ4LQ3kTTd02+NhU5GmGJGklPba6IHPjgJexzULKLo4FrI8KPISAKr
         BxDw==
X-Gm-Message-State: AOJu0Yw9jhBbAvT+lATPS0+iuMJjF9XB59ppnEanFGaxall47c1P4dwt
	pXhGXBmp7QIwPNB4wmnLqzIP++s8+aSp1w5Q6cRfAmd8JlLbTKHFsxlCf7KmQuAT95b7/nkVQE3
	MupzuZsjSE1WPOYuZ8/N7z7aRfy4L1orwmH+8qdOiIef/j6tzVoCmpDnsDzIhFw==
X-Gm-Gg: AY/fxX5AXk3IDM9YNCju1KYLjy7aCQnHqqHvufppxuPabpBHv53m67xsyK40I4H9OCz
	hZeoDuut/WYfbO5u4T9s20q8+5aLEQVE1tirTm/zZfW3QoAblUfx/cvOql5wjgw8M9lHPTOkWe+
	3J8cp7CvoeWZni1DSPFVR46Ma4joonq4hjsZqvKEUj7upo3NOLaVAlNYfnCFBMAkjba8t6GycQc
	Sx/8OwtZG72qAqC3toFqcQnPlcqvZlUkslzAOEEK1xlYQFO0Z4K6z9OXXkbZYL9l0CWkjjPYuTY
	jHDAQmKHx5L0Tu0LsOIqFf2RSo0ojxzinIag61dK+tEtxa0X4S+3aLLU6mPj47f9bV2mHCDdTlv
	NRMS1zoTqR7dCHeQ=
X-Received: by 2002:a05:6102:3a0e:b0:5db:e0e6:1b47 with SMTP id ada2fe7eead31-5ecb687e38dmr2866206137.19.1767907030331;
        Thu, 08 Jan 2026 13:17:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAuo8P1DVVYLEUFmVagZkpaMAOpF5fYSBa0FJUBbxBObMth/Sozaer46fZbr04KdGAsepD+g==
X-Received: by 2002:a05:6102:3a0e:b0:5db:e0e6:1b47 with SMTP id ada2fe7eead31-5ecb687e38dmr2866203137.19.1767907029839;
        Thu, 08 Jan 2026 13:17:09 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:09 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:19 -0500
Subject: [PATCH 01/27] clk: sophgo: cv18xx-ip: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-1-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10331; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vDAetoqqs6cXCl7bwwNO4+syHzby9vdv3IeOGAXMg98=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LaaVEnvkj5atqHg3IzVzbXxV6+EspR37K3jPvw0a
 nXaK/WzHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkERsjw5H7TTetW69lqOfd
 ed94M5n9zoRlsU0eJ0P3rvogdSLDS4HhJ+PZ5Cmlm68ynBJ5v9jEfV6eHd+5hUc31HuuiwmY83a
 WOCMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed. Also go ahead and convert all of the driver from round rate
type to determine rate that accepts a 'struct clk_rate_request' to
simplify the overall driver code.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Chen Wang <unicorn_wang@outlook.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: sophgo@lists.linux.dev
---
 drivers/clk/sophgo/clk-cv18xx-ip.c | 154 ++++++++++++++++++++-----------------
 1 file changed, 85 insertions(+), 69 deletions(-)

diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-cv18xx-ip.c
index c2b58faf0938b7d537dc3a81aef59c549b9c9c79..e936e315400393662a24e0d0189f7f74e01fa586 100644
--- a/drivers/clk/sophgo/clk-cv18xx-ip.c
+++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
@@ -152,28 +152,27 @@ static u32 div_helper_get_clockdiv(struct cv1800_clk_common *common,
 	return clockdiv;
 }
 
-static u32 div_helper_round_rate(struct cv1800_clk_regfield *div,
-				 struct clk_hw *hw, struct clk_hw *parent,
-				 unsigned long rate, unsigned long *prate)
+static int div_helper_determine_rate(struct cv1800_clk_regfield *div,
+				     struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	if (div->width == 0) {
 		if (div->initval <= 0)
-			return DIV_ROUND_UP_ULL(*prate, 1);
+			req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, 1);
 		else
-			return DIV_ROUND_UP_ULL(*prate, div->initval);
+			req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div->initval);
+
+		return 0;
 	}
 
-	return divider_round_rate_parent(hw, parent, rate, prate, NULL,
-					 div->width, div->flags);
+	return divider_determine_rate(hw, req, NULL, div->width, div->flags);
 }
 
-static long div_round_rate(struct clk_hw *parent, unsigned long *parent_rate,
-			   unsigned long rate, int id, void *data)
+static int do_div_determine_rate(struct clk_rate_request *req, int id, void *data)
 {
 	struct cv1800_clk_div *div = data;
 
-	return div_helper_round_rate(&div->div, &div->common.hw, parent,
-				     rate, parent_rate);
+	return div_helper_determine_rate(&div->div, &div->common.hw, req);
 }
 
 static bool div_is_better_rate(struct cv1800_clk_common *common,
@@ -188,53 +187,60 @@ static bool div_is_better_rate(struct cv1800_clk_common *common,
 
 static int mux_helper_determine_rate(struct cv1800_clk_common *common,
 				     struct clk_rate_request *req,
-				     long (*round)(struct clk_hw *,
-						   unsigned long *,
-						   unsigned long,
-						   int,
-						   void *),
+				     int (*round)(struct clk_rate_request *,
+						  int,
+						  void *),
 				     void *data)
 {
 	unsigned long best_parent_rate = 0, best_rate = 0;
 	struct clk_hw *best_parent, *hw = &common->hw;
 	unsigned int i;
+	int ret;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
-		unsigned long adj_parent_rate;
+		struct clk_rate_request tmp_req = *req;
 
 		best_parent = clk_hw_get_parent(hw);
-		best_parent_rate = clk_hw_get_rate(best_parent);
+		tmp_req.best_parent_hw = best_parent;
+		tmp_req.best_parent_rate = clk_hw_get_rate(best_parent);
 
-		best_rate = round(best_parent, &adj_parent_rate,
-				  req->rate, -1, data);
+		ret = round(&tmp_req, -1, data);
+		if (ret)
+			return ret;
+
+		best_parent_rate = tmp_req.best_parent_rate;
+		best_rate = tmp_req.rate;
 
 		goto find;
 	}
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-		unsigned long tmp_rate, parent_rate;
+		struct clk_rate_request tmp_req = *req;
 		struct clk_hw *parent;
 
 		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 
-		parent_rate = clk_hw_get_rate(parent);
+		tmp_req.best_parent_hw = parent;
+		tmp_req.best_parent_rate = clk_hw_get_rate(parent);
 
-		tmp_rate = round(parent, &parent_rate, req->rate, i, data);
+		ret = round(&tmp_req, i, data);
+		if (ret)
+			continue;
 
-		if (tmp_rate == req->rate) {
+		if (tmp_req.rate == req->rate) {
 			best_parent = parent;
-			best_parent_rate = parent_rate;
-			best_rate = tmp_rate;
+			best_parent_rate = tmp_req.best_parent_rate;
+			best_rate = tmp_req.rate;
 			goto find;
 		}
 
 		if (div_is_better_rate(common, req->rate,
-				       tmp_rate, best_rate)) {
+				       tmp_req.rate, best_rate)) {
 			best_parent = parent;
-			best_parent_rate = parent_rate;
-			best_rate = tmp_rate;
+			best_parent_rate = tmp_req.best_parent_rate;
+			best_rate = tmp_req.rate;
 		}
 	}
 
@@ -254,7 +260,7 @@ static int div_determine_rate(struct clk_hw *hw,
 	struct cv1800_clk_div *div = hw_to_cv1800_clk_div(hw);
 
 	return mux_helper_determine_rate(&div->common, req,
-					 div_round_rate, div);
+					 do_div_determine_rate, div);
 }
 
 static unsigned long div_recalc_rate(struct clk_hw *hw,
@@ -301,24 +307,28 @@ hw_to_cv1800_clk_bypass_div(struct clk_hw *hw)
 	return container_of(div, struct cv1800_clk_bypass_div, div);
 }
 
-static long bypass_div_round_rate(struct clk_hw *parent,
-				  unsigned long *parent_rate,
-				  unsigned long rate, int id, void *data)
+static int do_bypass_div_determine_rate(struct clk_rate_request *req, int id,
+					void *data)
 {
 	struct cv1800_clk_bypass_div *div = data;
 
 	if (id == -1) {
-		if (cv1800_clk_checkbit(&div->div.common, &div->bypass))
-			return *parent_rate;
-		else
-			return div_round_rate(parent, parent_rate, rate,
-					      -1, &div->div);
+		if (cv1800_clk_checkbit(&div->div.common, &div->bypass)) {
+			req->rate = req->best_parent_rate;
+
+			return 0;
+		}
+
+		return do_div_determine_rate(req, -1, &div->div);
 	}
 
-	if (id == 0)
-		return *parent_rate;
+	if (id == 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
-	return div_round_rate(parent, parent_rate, rate, id - 1, &div->div);
+	return do_div_determine_rate(req, id - 1, &div->div);
 }
 
 static int bypass_div_determine_rate(struct clk_hw *hw,
@@ -327,7 +337,7 @@ static int bypass_div_determine_rate(struct clk_hw *hw,
 	struct cv1800_clk_bypass_div *div = hw_to_cv1800_clk_bypass_div(hw);
 
 	return mux_helper_determine_rate(&div->div.common, req,
-					 bypass_div_round_rate, div);
+					 do_bypass_div_determine_rate, div);
 }
 
 static unsigned long bypass_div_recalc_rate(struct clk_hw *hw,
@@ -414,13 +424,11 @@ static int mux_is_enabled(struct clk_hw *hw)
 	return cv1800_clk_checkbit(&mux->common, &mux->gate);
 }
 
-static long mux_round_rate(struct clk_hw *parent, unsigned long *parent_rate,
-			   unsigned long rate, int id, void *data)
+static int do_mux_determine_rate(struct clk_rate_request *req, int id, void *data)
 {
 	struct cv1800_clk_mux *mux = data;
 
-	return div_helper_round_rate(&mux->div, &mux->common.hw, parent,
-				     rate, parent_rate);
+	return div_helper_determine_rate(&mux->div, &mux->common.hw, req);
 }
 
 static int mux_determine_rate(struct clk_hw *hw,
@@ -429,7 +437,7 @@ static int mux_determine_rate(struct clk_hw *hw,
 	struct cv1800_clk_mux *mux = hw_to_cv1800_clk_mux(hw);
 
 	return mux_helper_determine_rate(&mux->common, req,
-					 mux_round_rate, mux);
+					 do_mux_determine_rate, mux);
 }
 
 static unsigned long mux_recalc_rate(struct clk_hw *hw,
@@ -512,24 +520,28 @@ hw_to_cv1800_clk_bypass_mux(struct clk_hw *hw)
 	return container_of(mux, struct cv1800_clk_bypass_mux, mux);
 }
 
-static long bypass_mux_round_rate(struct clk_hw *parent,
-				  unsigned long *parent_rate,
-				  unsigned long rate, int id, void *data)
+static int do_bypass_mux_determine_rate(struct clk_rate_request *req, int id,
+					void *data)
 {
 	struct cv1800_clk_bypass_mux *mux = data;
 
 	if (id == -1) {
-		if (cv1800_clk_checkbit(&mux->mux.common, &mux->bypass))
-			return *parent_rate;
-		else
-			return mux_round_rate(parent, parent_rate, rate,
-					      -1, &mux->mux);
+		if (cv1800_clk_checkbit(&mux->mux.common, &mux->bypass)) {
+			req->rate = req->best_parent_rate;
+
+			return 0;
+		}
+
+		return do_mux_determine_rate(req, -1, &mux->mux);
 	}
 
-	if (id == 0)
-		return *parent_rate;
+	if (id == 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
-	return mux_round_rate(parent, parent_rate, rate, id - 1, &mux->mux);
+	return do_mux_determine_rate(req, id - 1, &mux->mux);
 }
 
 static int bypass_mux_determine_rate(struct clk_hw *hw,
@@ -538,7 +550,7 @@ static int bypass_mux_determine_rate(struct clk_hw *hw,
 	struct cv1800_clk_bypass_mux *mux = hw_to_cv1800_clk_bypass_mux(hw);
 
 	return mux_helper_determine_rate(&mux->mux.common, req,
-					 bypass_mux_round_rate, mux);
+					 do_bypass_mux_determine_rate, mux);
 }
 
 static unsigned long bypass_mux_recalc_rate(struct clk_hw *hw,
@@ -639,27 +651,31 @@ static int mmux_is_enabled(struct clk_hw *hw)
 	return cv1800_clk_checkbit(&mmux->common, &mmux->gate);
 }
 
-static long mmux_round_rate(struct clk_hw *parent, unsigned long *parent_rate,
-			    unsigned long rate, int id, void *data)
+static int do_mmux_determine_rate(struct clk_rate_request *req, int id, void *data)
 {
 	struct cv1800_clk_mmux *mmux = data;
 	s8 div_id;
 
 	if (id == -1) {
-		if (cv1800_clk_checkbit(&mmux->common, &mmux->bypass))
-			return *parent_rate;
+		if (cv1800_clk_checkbit(&mmux->common, &mmux->bypass)) {
+			req->rate = req->best_parent_rate;
+
+			return 0;
+		}
 
 		id = mmux_get_parent_id(mmux);
 	}
 
 	div_id = mmux->parent2sel[id];
 
-	if (div_id < 0)
-		return *parent_rate;
+	if (div_id < 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
-	return div_helper_round_rate(&mmux->div[div_id],
-				     &mmux->common.hw, parent,
-				     rate, parent_rate);
+	return div_helper_determine_rate(&mmux->div[div_id], &mmux->common.hw,
+					 req);
 }
 
 static int mmux_determine_rate(struct clk_hw *hw,
@@ -668,7 +684,7 @@ static int mmux_determine_rate(struct clk_hw *hw,
 	struct cv1800_clk_mmux *mmux = hw_to_cv1800_clk_mmux(hw);
 
 	return mux_helper_determine_rate(&mmux->common, req,
-					 mmux_round_rate, mmux);
+					 do_mmux_determine_rate, mmux);
 }
 
 static unsigned long mmux_recalc_rate(struct clk_hw *hw,

-- 
2.52.0

