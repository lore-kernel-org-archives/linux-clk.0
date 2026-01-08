Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6133B970
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907173; cv=none; b=huQDAjaIH48Vrt7u7WWqE96SaIRahOXD/RfvS7hHxtZmbTkRcjpQC4hwbtOmaDdZ8tHq1M/fpK7YcKuanOLX0GcIvi0gMtsKPLJY3MBKEHG9GoXxAT7oYlBKaVHHl4XNxOyW5JJPHkDKTL2BcTKOii5QJKBkTFtw5qeWo5ZOGQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907173; c=relaxed/simple;
	bh=t4zM8uFO3UkM6b2fxrdGu4KeHudrxCPL9CXUAD5cYTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxOUBnSG+ynm21rgYS9jp4EoCfEhR6dWTg7SvCGlTT9M6TPHSB/cT21CY9jw+BdP5S9BUzW+njgwjcKcOWwMFhYXhbvLwVv3SulnuybsERJDAvJH/sPRXs4rtpznIPyIJv0SAZEwzcbKOyHBKWZAyTVivrycHri3OghArukjqio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eTBWlP4E; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mjmXoAcH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTBWlP4E";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mjmXoAcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XFWRNQY7I7tUqJ0Pt1aWTLNa81jETDo2Sqeshx+vWY=;
	b=eTBWlP4EAQUPiMjj78CaGXqFMA+I3EpiD/NZOqULJ1B8pMyLYknbAxScPUp1qnyj9Ok9Xa
	2HmIvsgPZxu3z/CfMFRy9YhdVOCckupnfypD/qcOBhzxQOfssRBxotDMTV+7H7VdnXtkI1
	mK7aM381oJZYRusaqzDJs4qyeKNh5mM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-JvzhqoyuNIiFBd2p7fPkqQ-1; Thu, 08 Jan 2026 16:19:27 -0500
X-MC-Unique: JvzhqoyuNIiFBd2p7fPkqQ-1
X-Mimecast-MFC-AGG-ID: JvzhqoyuNIiFBd2p7fPkqQ_1767907167
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f39594413so3800865241.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907167; x=1768511967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XFWRNQY7I7tUqJ0Pt1aWTLNa81jETDo2Sqeshx+vWY=;
        b=mjmXoAcHXH4zEq/J3L94+yADPmqh4LF9gdxXbhq6951Fec3XCYrTH65LaFt4P9EqUA
         x6O3ZRoDdOW3S229eM6+DkPSQuRDte0QsZexVDHOSBjbOP7Xa0+eQ6Yqd9vww8Wsg68O
         bQy0T39zrJOfzvIYa8pnVUy0KTYAFRGKUU6x953CGbOQBo78TcxL4rUG/zyvAHq14aJf
         +Xf6YM0AMvRYNwaT8nLOdR//Aap1cJGv4xTXmRGZRcYySFmLtLJFJrxJmDffiMeHgfWM
         /H7csEJthTiDPB3lCsYaRTgr0wYUDVvCtOFqIUz1dYmsMlqgvOqog6jtdap7PEPqShB+
         n1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907167; x=1768511967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8XFWRNQY7I7tUqJ0Pt1aWTLNa81jETDo2Sqeshx+vWY=;
        b=Dug1SHuFrWXUVH1BQzR3vsRGcYV2ZMd3CO73Vo2CuZGrjCtT8kZOvzYkJnQQc2pgq4
         7KILOMFLIZUx/Efz+zgr3BJsj4EtiDOFI6KZqYg0CNMuvOFzMKmj4I0QYdeWJ7jhIgoy
         wiZy9GC3HGQAesOnnyJlj71A/DJuUlMlQA4hUK7lXYhcWE//1rsU7qLj5x8R98MumQjV
         7zRy1KGwNsglVYW227LToBNFvaxj4Urrt5JevZxkX+kvYAdN5WVvNOtEHfUYBatmEopw
         0JgO5ERmhHAAmfV9pWRFCQasCaFPl4mlJUZcY9+0YI5QmLLEIzWrTMoPSz96xQ5hyavt
         2Uig==
X-Gm-Message-State: AOJu0YzKL4lu8F3Lloe5qeFGEGRWU8csHVXmAyt7elrzZXgukITZ45Zv
	VnzaYib+aPqA/sMvjB4tyoCX29g/R0hYaL15ubL2laXqBYuYoUijn4JgHBbQkbMCVsI3Yk7mtUF
	xdkahR+y+Iexbwk1M78Z3YdF6s8WjUpa+HmMmJR5fNSbgK0hhOX9KCYT3wWQPaw==
X-Gm-Gg: AY/fxX64KGzit85SZsJhvDclxdriAC/TzRhDVR9w4XenELThNv4z2ibckscuhPztOBl
	QJ48+xJeFVv0fk1AE58MnDGy3Prcu8QUxG6HcJxOro47QsrNEEVoF+enJhHKXYByUvnnBGiQzI0
	FEKF5jfgvLjPogkDJrLACKMMuj5LVroE61xggThaBI83+Tm+BWAjSinD3058QaEuA6J/qJc4u+m
	CIVXZOp9MQXzWgGa5mu8FbWwXZWdwTm7gAqygQtTAjKOYXZ4cSWbq9MNLFVjsSxLp3kqqBJfpjn
	uREtLp2JhdJH+AAFVSZRk+vGvDmwZsx7GxXOrWDfYErc0js2Mu8lIMp2zxryDTtQ7G2MFKl+C7B
	zh4WQ3+Yp48+VEy0=
X-Received: by 2002:a67:e113:0:b0:5ec:c528:4df0 with SMTP id ada2fe7eead31-5ecc5284f85mr2719220137.34.1767907166735;
        Thu, 08 Jan 2026 13:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOrsvvufL5nGv9YAlp9TLDtBx6ki9n9l+q0ZIfj+0L81Pet9Ugf8yY/kN38alUABtcfu66ow==
X-Received: by 2002:a67:e113:0:b0:5ec:c528:4df0 with SMTP id ada2fe7eead31-5ecc5284f85mr2719217137.34.1767907166381;
        Thu, 08 Jan 2026 13:19:26 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:44 -0500
Subject: [PATCH 26/27] clk: divider: remove divider_ro_round_rate_parent()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-26-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2855; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=t4zM8uFO3UkM6b2fxrdGu4KeHudrxCPL9CXUAD5cYTg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZN8om3M/l1PUFwY1RC2E87z+8RItV+nVqrN1X/m
 3jx2MrDHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykZTsjw/0vZjc/x1aKpOqy
 e1vPmMQSrGs31eFxxwqG3s8TFA+6PmNk+LXWs97TTPDgrI5ZbSaH2cMOzbhhXe35qKT1gvkUnRR
 fDgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are no remaining users of divider_ro_round_rate_parent(), so let's
go ahead and remove it.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider.c    | 22 ----------------------
 include/linux/clk-provider.h | 15 ---------------
 2 files changed, 37 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 2601b6155afb7391c6a0ffb91c58fa66cde98197..7e414017afa12c3838634ec030f960d8aa028b99 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -409,28 +409,6 @@ long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 }
 EXPORT_SYMBOL_GPL(divider_round_rate_parent);
 
-long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-				  unsigned long rate, unsigned long *prate,
-				  const struct clk_div_table *table, u8 width,
-				  unsigned long flags, unsigned int val)
-{
-	struct clk_rate_request req;
-	int ret;
-
-	clk_hw_init_rate_request(hw, &req, rate);
-	req.best_parent_rate = *prate;
-	req.best_parent_hw = parent;
-
-	ret = divider_ro_determine_rate(hw, &req, table, width, flags, val);
-	if (ret)
-		return ret;
-
-	*prate = req.best_parent_rate;
-
-	return req.rate;
-}
-EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
-
 static int clk_divider_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..000f4063e0d10e6772f6d2af7feb0de7741e7255 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -743,10 +743,6 @@ long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 			       unsigned long rate, unsigned long *prate,
 			       const struct clk_div_table *table,
 			       u8 width, unsigned long flags);
-long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-				  unsigned long rate, unsigned long *prate,
-				  const struct clk_div_table *table, u8 width,
-				  unsigned long flags, unsigned int val);
 int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 			   const struct clk_div_table *table, u8 width,
 			   unsigned long flags);
@@ -1446,17 +1442,6 @@ static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
 					 rate, prate, table, width, flags);
 }
 
-static inline long divider_ro_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *prate,
-					 const struct clk_div_table *table,
-					 u8 width, unsigned long flags,
-					 unsigned int val)
-{
-	return divider_ro_round_rate_parent(hw, clk_hw_get_parent(hw),
-					    rate, prate, table, width, flags,
-					    val);
-}
-
 /*
  * FIXME clock api without lock protection
  */

-- 
2.52.0

