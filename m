Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6DA3290A6
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129872; cv=none; b=R8TR1NuI3Jg5gI/xOTit6UngH9RZVUfmiG8vI1QWvlS6lQG5wqXBiuW8VehuRG7Qi2iWUPCi76pW4vhWwBpDATrvmrKlHjX5nzdS9vPBcHZV6HXHK/3JKr5pAYCbL5qdqkQB2yqsbhAty0oMR+qoQJZTEjSMDYbp9HMuwu3cQD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129872; c=relaxed/simple;
	bh=CpmJIm1mi9VsZ5KOMr74w38LszgghieeQIGldzTUnSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvUHHTk0BeQ72q8Yd55MUrB1EYK3NMUkE1JuD9LvczLf/JnYIBnGSaxxVQGqkiI40YV227M01hYXN/tH1wDI2RAujIr0Vhw4vtw/SFJ6l/dDtYkBZlIjM5Is/+hFWMY5Ec9mZcrMidc1PVcECAbALUcY8FmrboDSuwBAUZ3LvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOydv2Br; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cGbsd2id; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOydv2Br";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cGbsd2id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
	b=XOydv2Br5U8X45X9Lc8aFaMv9/Zv3gNr8KyYub8p8PandJobXP1sidmbuAW66J8uWcaKNR
	F1uhVY3ggYmCgLrw2SWMX4avYzqbvu8tnnlyoT3GFqDJw1hW5aV7cehglSr93ghbrnpuMj
	49nGxEUbyCGyOevO8FCdqjU6mCUg2R8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-Esday6SXPH2aZcwjYMF-RA-1; Thu, 26 Feb 2026 13:17:49 -0500
X-MC-Unique: Esday6SXPH2aZcwjYMF-RA-1
X-Mimecast-MFC-AGG-ID: Esday6SXPH2aZcwjYMF-RA_1772129869
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b6a5821so722132185a.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129869; x=1772734669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
        b=cGbsd2idbXvAW8v937tGFYUoCzO4U9ecP2y6TbkBLPzV2IQIP+ukAnQg+zYZZEcudm
         XSDi477itkifulDpp4GY4usRsNEbDJTgHAKvHqiMRqu1T1OWnmYy5pd++sFMXGL8575o
         FNbK/N2u1IeaF0w+Zh46vUrgCqDhS4d82UbEyM8uNSdsc3f5JwND+WqGowkeob4A0opH
         NtYYPL5FFPOuPd70AxFiUpTopKl++PKq1jNyGevv88S/dusIqyPmLrJBsf1sUo9edHYi
         ha6zoPC3tJlFNhBD9igRpbKEgjX6dTkGjfhcSbPoTyjC3L35qzMEaxmAyc75M/AeOWyD
         mZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129869; x=1772734669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
        b=Z+tV1O4oxXwfpn4A9hCuW8SShhI2NmFwrKns00i3NKs5v/7LcK6HJB4v9Pj2lYo2hE
         sV7hGjyuCtHv5CuHINxDeJDGLH454YjC+OEafFAiJ3V0uR4tGTmcoWgAy/LIxi9vEy+5
         A6TTtuuSvEpc8LAzbzuo6XHbYdGZ4CK4LVWfaTdqy0bo60e8mr7g726xU/m4pnjczVMf
         P/9FS0vfx0IMm1XuAQtCaTZC1A9ERnA5RU8+LGFV/+bNIQOpx1PGXhEDSWSmNIB2nuB/
         gzP4auPRTHXlax3qKjJFMnEbG+Y+WluJ8LfzHTvRx3t4lWRHP24UuutBKk4yzo5p96U7
         XVAw==
X-Gm-Message-State: AOJu0YyWlUJxz7pe/ETjzsi5iC4VcmckdRB+vWy3IQ5WuGukGYuii48Y
	M6lKGbHmkATjIS06jQAqwbGA4FYmi9YsrjNP7+B1f3gBo1Obn1w4pgg3DlIPAZiO3o7LYzGG4Zn
	oAr9MHoHVzqXHHU3jFpG70ZRWAr7tXJf759Iq9moT7t/1DQ5BOJM61UXZk3l++Q==
X-Gm-Gg: ATEYQzyWTHN1qcsVWWkKSYLduJ9kMs4/+/JUEPv1cDmZpe5IUatBxJtWHzDHpvl8FZ6
	kg9L7TrHeG+n83DR93Jj79fzB/YLz+NffCvMa1VSKWeqGMjuC3nry2NG8AhfauffQ/wAcHi5lfO
	ZabsGeT6krUhlVKugNRi3nzpkMo/PVZwhAiaOmOcrrGYJ+Hu1Sv6/tkIuUjFp4s2c9UE+mU+qU0
	cAQ1q1phBIkzIEla8SgFFRVBK5hPVAgziDgiA9GsHuvKHerCKUOzlvqH69L5fP6CAPSt7DRyfqb
	zcmJIbtqx/81edGceCyPzQ2O9doho8+/1bqInwau94ISTSgg7nSjmn5t5w3OaAufnaKz0banYZy
	VMm19Gthd+nTF3YKqs2YwTbX4VGTyuhtQphdzJOPmB6X1OKgqHYQq9qEBaoXl
X-Received: by 2002:a05:620a:164e:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cbb062c85fmr990471785a.29.1772129868738;
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:164e:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cbb062c85fmr990466885a.29.1772129868100;
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:47 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:48 -0500
Subject: [PATCH 04/13] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CpmJIm1mi9VsZ5KOMr74w38LszgghieeQIGldzTUnSM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9OmaTY/j2/LluciBDxLHnnZV2+cV6rya8nT+wUhNm
 8mck7f+7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiCkGMDHsyV548kKK/+d/G
 rPzbZkYRu8+qJHdNvc+Uo71x+qS2pUsY/tmXrv/TMn2SjkDwfJ+i5FrlCqZ0yYb2RuOVMzL3q19
 6wQQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5c4e32700edb10e4edf2185610a81..e13f09cfadc70551c3c7955538e5a212fb0601a3 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -32,18 +32,6 @@ static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 	return clk->scpi_ops->clk_get_val(clk->id);
 }
 
-static int scpi_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scpi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -54,7 +42,6 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
 	.set_rate = scpi_clk_set_rate,
 };
 
@@ -156,6 +143,7 @@ scpi_clk_ops_init(struct device *dev, const struct of_device_id *match,
 		if (IS_ERR(sclk->info))
 			return PTR_ERR(sclk->info);
 	} else if (init.ops == &scpi_clk_ops) {
+		init.flags |= CLK_ROUNDING_FW_MANAGED;
 		if (sclk->scpi_ops->clk_get_range(sclk->id, &min, &max) || !max)
 			return -EINVAL;
 	} else {

-- 
2.53.0

