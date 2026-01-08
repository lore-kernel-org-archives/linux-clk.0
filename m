Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE333AD90
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907113; cv=none; b=IzuUDA4ldBmmatdLqJWAHm8XtEuJdeurF4RZ5E5WxAv4J9hfveZm+8hNI1Eua1XlO0OnSgqE0OfrfoOW6+uXV4vJwk/ImY6YG+x6+ge9G6/81Xq8qRiqmvi21zP25j7t6stGmVWpBSyVubKBon2JkMiIBlzNd7b2T+jpGugFtxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907113; c=relaxed/simple;
	bh=du1Xe6+sJ/9FCDiGI+GnbfUkgLY8U1mL73/oBpGj0IA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IT/f65IBTBp90yAvtqTQbs8P8CvpvHFwPWuXJ9NcGZ4YRiSdStJXcDqjHb/wHBMigzIe8HehiTdWRJEdbqj/BmTdsM5SNgHWB2/ytN9kN8uNJjabHaYCBNzlimdRkH7K5E1Ge+lta2L6TTBrkdb7+MZT1eoPWQ9ENt8kiGrtCg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gtlTBoya; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vm9k8qj1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gtlTBoya";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vm9k8qj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyENCUC06yLwn97ZLVCAPwAscKa4jHnikLex8sZo8gQ=;
	b=gtlTBoya1hM2kfVZdddTVsQFzbLBpia3IDLiAv5h3HkLeZ8CTkRfpABerTJH7/pPk3APBp
	GeEkCfUYWQW2v9Fj9RpaURICBiKCHYNBHtU+un6d1stC8ao/eIkDXUkH+HBkrI8O0gFNH/
	TjwBYASmCApqFBq7w0NrIQZgQyJfgBA=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-5KCZzZrWO8iApRBSTwSnsg-1; Thu, 08 Jan 2026 16:18:27 -0500
X-MC-Unique: 5KCZzZrWO8iApRBSTwSnsg-1
X-Mimecast-MFC-AGG-ID: 5KCZzZrWO8iApRBSTwSnsg_1767907106
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ec338650e0so3893998137.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907106; x=1768511906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyENCUC06yLwn97ZLVCAPwAscKa4jHnikLex8sZo8gQ=;
        b=Vm9k8qj1yzFFn2p1L0tyGsoJpXFxngpWSYs8ftaM7wfVbynpSlCsNIueseszDWq47j
         PzMCj/KsHd7ULcslRRDcI9hz9UEGVJ8e/wdiPYtGZu3AMIXv6edTGZr6p2DeYXlH2PvJ
         Q91UVGT7e9nLixm+zcN+M6yAL0ynYlC+TQYZMFdYJAVc7r62xLvj8qOB9QhYxfuHIQH5
         a7WURTXZHH536IKrli6RKX/qBm45x9d48VAN0sn0PjySfOP564aQQ3rsyX/Uy5o0Cf0H
         E4Rnc+khbXz9b2SxyzNQXQ0bshnPk/4QXoAeIKe7OVjQoCy3BFDojx5EwUQogxb+hAIq
         m3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907106; x=1768511906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kyENCUC06yLwn97ZLVCAPwAscKa4jHnikLex8sZo8gQ=;
        b=qCXHMWtI54wZ4Y1krnGxZOjJ+WsUKKp17a3CXh5kDhMzroEPeoABvqONGLKGzS6ZnX
         c3q4GgDS+rcTo5mizL83Dt4MWCY632dNzH2VJ4XoDBVW38fK5UmQsZGJsmzWg1cQoN2r
         FnRW3yfmmNdTem9MGUpJboA1jTrSG9f+e6wwjzMTN2tKG6lK9Iyg3IhUI99RRY8ZX8BN
         I1QcjntJZDc1+lMDvVc1nvhGn7IA9eS+AXNJne5s+nd9rbhd2UD9HG2XZIatuFvLW4hP
         fuqPTpKsvztHa9QLsn+I7jRFOn56M+cYGx3q1m/+a9GEf79QCLg3fiJDgzwyX8r1uGHC
         xAhA==
X-Gm-Message-State: AOJu0YyESkU4ycIKGVZ572ykH0YechkW34X/+nSCUJ2fqq8Y4eFBOMIn
	mAt+3MpwdzV7pWBrwNAJQ8pQgloOxgvVTRaKs0sqAV72y5Q4RqXIt3+Vu9Tnz5ZHokXrEQ6JCqo
	RarogI4nA1UKWtoX7dvevYRVxZn4EwTLySOYRSlpCMiz2g0z3JvCiKOGkmLs9DQ==
X-Gm-Gg: AY/fxX4xLCtdIUvjyTf+acWpSXtJ/ysiC2AeDlR1NkZOz/3tCH5uXIpYUPZx9toSKUH
	LfsGVJBBXh4ZvZLw6wL/ST9yefiYKQY5ptNYnzIYCB9vncPaBqv1GClgipKhbMcwiWFz9TF67vw
	otXMSYGFmVSVpD2m31yZdckAPsmY/qkQ24lh4A9sJyJqonMt1mme9lU1QOrr7FoqJ1F+dn9ovjc
	RD/6nIe2PxnrcfM269qUnahFv7R/TjhFtxzufcjGUVXpX5Iixanu9nBE+ThOznGGr74Uwhc7oUt
	W127nR0mObsFT3EMsMp5WhHkVAegl78t9ZGIXDYVyZqtDBIExz+4eH6lh58Kc4fpGeq2+Q0EO/F
	EvuqI1oCYXtlUVik=
X-Received: by 2002:a67:e716:0:b0:5de:8ce:3cb0 with SMTP id ada2fe7eead31-5ecb5cbb301mr3229158137.1.1767907106529;
        Thu, 08 Jan 2026 13:18:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA0Kg6G5fUNtSpWfcuvqTzw14WB2ReMmWmnvR2nyyJ8lxMnn7KB1EFTL1i/rv/Ooq/958J5g==
X-Received: by 2002:a67:e716:0:b0:5de:8ce:3cb0 with SMTP id ada2fe7eead31-5ecb5cbb301mr3229140137.1.1767907104694;
        Thu, 08 Jan 2026 13:18:24 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:24 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:33 -0500
Subject: [PATCH 15/27] clk: qcom: regmap-divider: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=du1Xe6+sJ/9FCDiGI+GnbfUkgLY8U1mL73/oBpGj0IA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HY4BJo1e2jdZnjzY7pI7sN2ny8hr0SUK3mFTk49U
 2zL6XS2o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgInsncDwP3pZCM8Chy0Kuvee
 dUycGPbjzeq3OxRO1tqf/jrFbadbQhMjQ0fV5YNHT58ze6uuwNpQb/LoQGmFvURo9M2CBn+hNxG
 uzAA=
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

Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/clk/qcom/clk-regmap-divider.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 4f5395f0ab6d0ed8cebbb32cc231063932ba85a1..af9c01dd785372166122224e717c119a2365f4e1 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -26,12 +26,8 @@ static int div_ro_determine_rate(struct clk_hw *hw,
 	val >>= divider->shift;
 	val &= BIT(divider->width) - 1;
 
-	req->rate = divider_ro_round_rate(hw, req->rate,
-					  &req->best_parent_rate, NULL,
-					  divider->width,
-					  CLK_DIVIDER_ROUND_CLOSEST, val);
-
-	return 0;
+	return divider_ro_determine_rate(hw, req, NULL, divider->width,
+					 CLK_DIVIDER_ROUND_CLOSEST, val);
 }
 
 static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)

-- 
2.52.0

