Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084C295DBD
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086058; cv=none; b=bRzKTWTlfLAuiGRTh7WV83ZkPNNvaGD7vBQDhqkPcUuzfWBJ3Uo2G8BplNLLkT1CB7DbYOq4RZ0eC3cWjgxLOcYGWOANYMblSXXfUdd38B5C9dIFrtQaz2s41g6NDds6PDdiHOdCLH9VW1AC1m+z2mbwjAo7r//oQzXw3wgY06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086058; c=relaxed/simple;
	bh=f02GzYx48kesQ7jeGELEbs6RFs9qvuIFf9axfxA+iKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k4HCffYQfbrn/PgZ/4eKBjWNjujpwHV1fdk7noRFLHOLB9YNCfgEoS4H9tYL/YaqlQBu0goMyC4O7h11zbXtaRy+MmbW/tPJZXEPRlDI2cL+X4dV/8HPGNKGpv+oDPBVWkvBVkWZV87l/Ve1Kvv4z/LywdtKGFUbYMeayTHcxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FwqSVmsJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ol+NvhPk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FwqSVmsJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ol+NvhPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769086055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/p/2bC3+sbtEKV34RBkBnld1uYguVdDfDr4y5ubycHk=;
	b=FwqSVmsJz5qEt0wLRXVVy33ytCMHbYjOk3hUIza0Dy2Us0Opp4CYEwtUNqwpNxRTIPkHA7
	3cfeKhoCHFIm+x1P++iN/RdiX137xfzQ18piKz92R4smznlWnLeb97BE8SR7s2PUys8Qn/
	5ps4xfelQnmdBD4acx4WeMk0G+WmQK4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-AZLDk1meMLaPPiII_cdxpA-1; Thu, 22 Jan 2026 07:47:34 -0500
X-MC-Unique: AZLDk1meMLaPPiII_cdxpA-1
X-Mimecast-MFC-AGG-ID: AZLDk1meMLaPPiII_cdxpA_1769086054
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88fcbe2e351so54279986d6.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769086054; x=1769690854; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/p/2bC3+sbtEKV34RBkBnld1uYguVdDfDr4y5ubycHk=;
        b=Ol+NvhPkfAd5VxOl64kAJQopVvS6EBt++SPh73gQ7JlfoWSE30WCtAbETwJHFGdDOR
         7iL/znHaSeInLtjt27IOtgGWLehDg3w8NTOi1xR+aLJz6UVlZPLZVtVc+VuYUw1/yucY
         KkG1uLhNk753Gkct/1j4N4PLF0z+5Wl5Z0DuXMQGVyfXTyTz2wD0BeGoc1kT71WL0GRm
         trM78VtcvInxDrC3dAH45bC9wDwngYLeaxAMtzFI5oy2MR6reUWk8RaqAXBjk9JyoSVr
         2T7I1ktF8CDk1xdB+ke+D0xVUxQxiWg/LLfF2LMUz2TpRxYCTodXN4dS/LHS9NRtBnTy
         /VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769086054; x=1769690854;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p/2bC3+sbtEKV34RBkBnld1uYguVdDfDr4y5ubycHk=;
        b=vMfc97sHenq+kodJZQUEciEKMXf2KJnd8MrVJgW55DwF8GZlqGjnqZlhtV3JCwof8j
         0g5ye+PK4Zg8qEvdhK/+2obetzmwWeIbbSzqbSc7oKvxOpZiutJkjGQHEJCSyTRwGzYu
         GJ+LlWpKV+tXE0hOU5XSWDktbsKmfyt193CrpnQqIAQC94GQyjFxQoWVIfXtA4C7OgtT
         FwUKgcyLrDt1xq8yXu6gGsqmayjxcLko74YixyGYIdNF+IV3N4B/TwKdlH/iNBdRFHeL
         HVYEBbPDJ4+0Rf366PFybe3lFxMp1/wEYJXdisukpBmT2N62lajWjAGHyuYeOF5/cAv3
         QGZA==
X-Forwarded-Encrypted: i=1; AJvYcCVpCWGvQnvpGkmHcT4Sy19BYK9XuJMpqprpOdmh0sUAcj4k0q2XI3xycUY8Nvn7xCoX5H79HUmDSAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41u9cGWvZktUeTGI4cftz/bvYuKO4nUUNwq2yvIR1p93lonVc
	Fxy4HyAFbWmduqfelDXqDCo1nB5ouZt0OKZ97ukfNBQqCoDtcK8BKbUg0N6mdXpFhJ1nppu9X0a
	DNmW4HbFCbDa/+9a8FG+759H7oOx7X03oZhMwt+3ToX3N8V1OAHZMHbO7U2fiYQ==
X-Gm-Gg: AZuq6aItWldKAHxegwV4ShU/ECIqqbHnmdOjwJ+cIFVIgcupS603CwsSFCVyPestPdo
	mBJdcDJ3miehifrqtM9BELt3E6Xhp0dxhonJsq8+o9cPvM8phfsn0LWEgS9YSzVflKg2U3jbs6u
	qREQ5HNHd1GL8ZDvmDJC4jVo+WbadfWYCG6cdf9sCallt7ZLWTEpCkCszuni3XJtS49oXnDl6Uy
	KfckWS6i1m0n7RfMXH1gCJpAWnlTTeJnngzmUk1pYjgBXE5qdPiyfDy5gQvcxMVAtGPjRgcA8Cu
	tPYU/ckD+E8vxyESF1a8ZaWRQ4wVHSQWE5sru0ISXNysSuG7x/qTHAN8vQgoaKRe1NiV+DIiAG8
	uJbadrGf4EAjeN7CAVSdDe7cUaB7919dUHZt1yreRlQ/0zYUKJw==
X-Received: by 2002:a05:6214:2a87:b0:894:6531:d61c with SMTP id 6a1803df08f44-8947dfdc869mr37706376d6.19.1769086054144;
        Thu, 22 Jan 2026 04:47:34 -0800 (PST)
X-Received: by 2002:a05:6214:2a87:b0:894:6531:d61c with SMTP id 6a1803df08f44-8947dfdc869mr37706116d6.19.1769086053745;
        Thu, 22 Jan 2026 04:47:33 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d6ea3sm152362716d6.54.2026.01.22.04.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:47:33 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 22 Jan 2026 07:47:16 -0500
Subject: [PATCH v2] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOwqAMAwA0KtIZgM1glSvIg79RM1SJVURxLtbH
 N/yHsiswhmG6gHlS7JsqYDqCsLq0sIosRjIUGcaItQjoAuNMRjlksiKup0porqD0Qfy1s+9bVs
 LpdiVZ7n/fpze9wO1QfEcbgAAAA==
X-Change-ID: 20260122-rtc-ac100-divider-round-rate-bc2b8bf98338
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4044; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=f02GzYx48kesQ7jeGELEbs6RFs9qvuIFf9axfxA+iKc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKLZFJiNTIOvcngcXj97XSFj8/WY98uuqkJWDQrrxJcN
 f/ouWNGHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzEi4nhf2CxP19gYw2LavO9
 wgX7plhbbZ24+CPTWr7NwTVc74zbljAy7J6w6O8T8zNq4tbB/M+D+iOEdwun9j6bls+3LrftU4o
 9CwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes since v1:
- Fix two cases of brace inbalances around if/else

Alexandre: Per v1 comments, I'll include this with my GIT PULL to Stephen.
---
 drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 33626311fa781b5ce90dcc472f948dc933bbc897..bba7115ff3ad0f9a9b428784b49ba3fde0d18484 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
 				   AC100_CLKOUT_DIV_WIDTH);
 }
 
-static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long prate)
-{
-	unsigned long best_rate = 0, tmp_rate, tmp_prate;
-	int i;
-
-	if (prate == AC100_RTC_32K_RATE)
-		return divider_round_rate(hw, rate, &prate, NULL,
-					  AC100_CLKOUT_DIV_WIDTH,
-					  CLK_DIVIDER_POWER_OF_TWO);
-
-	for (i = 0; ac100_clkout_prediv[i].div; i++) {
-		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
-		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
-					      AC100_CLKOUT_DIV_WIDTH,
-					      CLK_DIVIDER_POWER_OF_TWO);
-
-		if (tmp_rate > rate)
-			continue;
-		if (rate - tmp_rate < best_rate - tmp_rate)
-			best_rate = tmp_rate;
-	}
-
-	return best_rate;
-}
-
 static int ac100_clkout_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req)
 {
-	struct clk_hw *best_parent;
+	int i, ret, num_parents = clk_hw_get_num_parents(hw);
+	struct clk_hw *best_parent = NULL;
 	unsigned long best = 0;
-	int i, num_parents = clk_hw_get_num_parents(hw);
 
 	for (i = 0; i < num_parents; i++) {
 		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
-		unsigned long tmp, prate;
+		unsigned long prate;
 
 		/*
 		 * The clock has two parents, one is a fixed clock which is
@@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
 
 		prate = clk_hw_get_rate(parent);
 
-		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
-
-		if (tmp > req->rate)
-			continue;
-		if (req->rate - tmp < req->rate - best) {
-			best = tmp;
-			best_parent = parent;
+		if (prate == AC100_RTC_32K_RATE) {
+			struct clk_rate_request div_req = *req;
+
+			div_req.best_parent_rate = prate;
+
+			ret = divider_determine_rate(hw, &div_req, NULL,
+						     AC100_CLKOUT_DIV_WIDTH,
+						     CLK_DIVIDER_POWER_OF_TWO);
+			if (ret != 0 || div_req.rate > req->rate) {
+				continue;
+			} else if (req->rate - div_req.rate < req->rate - best) {
+				best = div_req.rate;
+				best_parent = parent;
+			}
+		} else {
+			int j;
+
+			for (j = 0; ac100_clkout_prediv[j].div; j++) {
+				struct clk_rate_request div_req = *req;
+				unsigned long tmp_prate;
+
+				tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[j].div);
+				div_req.best_parent_rate = tmp_prate;
+
+				ret = divider_determine_rate(hw, &div_req, NULL,
+							     AC100_CLKOUT_DIV_WIDTH,
+							     CLK_DIVIDER_POWER_OF_TWO);
+				if (ret != 0 || div_req.rate > req->rate) {
+					continue;
+				} else if (req->rate - div_req.rate < req->rate - best) {
+					best = div_req.rate;
+					best_parent = parent;
+				}
+			}
 		}
 	}
 
@@ -213,7 +214,7 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
 		return -EINVAL;
 
 	req->best_parent_hw = best_parent;
-	req->best_parent_rate = best;
+	req->best_parent_rate = clk_hw_get_rate(best_parent);
 	req->rate = best;
 
 	return 0;

---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260122-rtc-ac100-divider-round-rate-bc2b8bf98338

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

