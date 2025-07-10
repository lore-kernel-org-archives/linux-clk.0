Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51C2F0C4E
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752168575; cv=none; b=pauK041HxDJqcdS4SyaHFOqe6Lh+xlKye93zXHhVXAnVGvDcQzGMznjWM5DFFOfV3th35CJDvQuEZCag6IDxzrVNbHZWiUMrhFhd+VcRBjebXShULmwNPzVvewlL+YYxZuUFFPmsNNGdNiebN8l1eW+YZuIn8+8Kt7giYaDfXGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752168575; c=relaxed/simple;
	bh=WMrCazWchDLAQl5gpNER6db4hCnZ+Unq2+JqAICztBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyVrh9mXHvrtccDpaHZie0cZUS//scd5lav/Sw6rKSzwgTt9TJdWmfkUW//SC/8ocNd8QuyMxHYL4PLkzjR7A5vH25026jHMBI2DQFz5V9EmDZO9dV/if7l+OJg75vRhZOYFLxLR1yTnO1gi3RS9J9j6dwIeA531jX+4WGLAFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RebL/muY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RebL/muY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752168572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsnr9i/G5KOz/D0uLE6KP6XoTOJ1u4OANp7MilYPv0g=;
	b=RebL/muYjg5mb3ZLh4Usq8J5sE5Jetlx7cL9sOCe2d8sZCDS+8odbeEeUJbf7NCUSMUw3+
	LziHSbsc7fXIGgEzX0+bN3/4yHDmrK6609Ta2t1zaR/L6ZyK0mo/9VZ/ftQc/KvAckYLg1
	TZ4nF7TGHwSSg7QoNko+4wcu1ImjgNc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Zbnn1juOMMO6DCJI6_deVQ-1; Thu, 10 Jul 2025 13:29:31 -0400
X-MC-Unique: Zbnn1juOMMO6DCJI6_deVQ-1
X-Mimecast-MFC-AGG-ID: Zbnn1juOMMO6DCJI6_deVQ_1752168571
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097fd7b32so266661785a.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168570; x=1752773370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsnr9i/G5KOz/D0uLE6KP6XoTOJ1u4OANp7MilYPv0g=;
        b=GMJ7MkT7WQFxrT0c41pjf2xTH7NeEBkAqnT2wy8JRR/63sckhd5oAgWSKCRqm7I9WP
         +X8VJns59lvR7HrFne43+AqW/NH9rWRU3uDikse7UtUO5FS6M14gSeMwLgkEhKHB/Ztt
         LpC/gHKZ/8J0rMyb2UCdHb+jWq9Tk4R0FTcefxKRtcHY1clF8FJimnhmBSCy/nX8U0KZ
         pvQcmAL6N/KpS1trQbYKagYj6WZIJpRHeXGf9IaUB6AzmTW2tMIb85tNw3uxU14Ebx2m
         ht8dDy79wsETj4Ry9HUp9a1pI7vbIcfyOUe8f5nX1z+8DgU/dSdsz4O+xffh3Cjv05Mo
         uFAA==
X-Gm-Message-State: AOJu0YwFEBihn0mirjDxw1tXiYc1yDncP/kbScTXWMRPjzJHUqLOeKr3
	1WbqAgnpW0bm/+WdBKMNa/G1sPQa8eOJicoFtNRJbxDerF+iRwiturb8svJNpQRMF6N23fZoTVV
	euY1w2/Qmbygr0oEc4Q38xjShd39xhcbjHRufT6Rq1nY+r6w68O79Z+HCC/UsYbkv5E+OcA==
X-Gm-Gg: ASbGncsMBsVdUQHqTW7+zpFkEVkLfwdKjiDoRIGGSpDhrL95FekyDuMLxbR67WdiWVH
	qrj7Yydz9jVm23JQDHsE3mXkKvXzTINv5oUMysWahaw50weZWiphqNlcmPUtl/SZE8llV3yogK2
	CoGBDjBAZ/RmtEYCXbXlnsB7yBIajkPYju5vUDMrvCx/P2Px0e8R5834+4F/B6dOwzF2PFfonC1
	EZfh34lqSmNde+dG3gWPuJm3PC4HrWLbiddu9k+fHDM3R5mFpD3PAYBkcpyow9o5uQG9A4UefjM
	eKZCM9EeR9kz+dECHu4CAOkRukID5TVFs0tpDhiLiVs2/2kcBBNwOzCcVGYD
X-Received: by 2002:a05:620a:4549:b0:7d4:114:f81d with SMTP id af79cd13be357-7dde6f4340bmr52050285a.0.1752168570294;
        Thu, 10 Jul 2025 10:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWiAcWeA8eOcbhpjOcMfgYGQR5D4tEEyp87OcofWurB2Y1jQqxPwOPkFMLhYwntjM7d4D0ag==
X-Received: by 2002:a05:620a:4549:b0:7d4:114:f81d with SMTP id af79cd13be357-7dde6f4340bmr52045285a.0.1752168569774;
        Thu, 10 Jul 2025 10:29:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806297sm117728785a.82.2025.07.10.10.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:29:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:29:08 -0400
Subject: [PATCH 3/4] media: i2c: tc358746: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-media-clk-round-rate-v1-3-a9617b061741@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752168561; l=1651;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WMrCazWchDLAQl5gpNER6db4hCnZ+Unq2+JqAICztBw=;
 b=fYpewLIZ/V2pkgHqVX+lhdLXTPhtuLwGx/sgfiX0IaFbSuK6Kc43DNtKiLRcvVGj8/2B7/KMy
 Dk8bkPxiRHJDs+PiaoRWIq/LCqTUeS9OYYzMAemsjhzn9k4XGWbnRJI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/tc358746.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 143aa1359aba51c2a36e8800e7c1149698268ca1..952470767b1e4b4c6e919fc5fec1ab5338c52409 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1226,14 +1226,16 @@ tc358746_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	return tc358746->pll_rate / (prediv * postdiv);
 }
 
-static long tc358746_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int tc358746_mclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct tc358746 *tc358746 = clk_hw_to_tc358746(hw);
 
-	*parent_rate = tc358746->pll_rate;
+	req->best_parent_rate = tc358746->pll_rate;
 
-	return tc358746_find_mclk_settings(tc358746, rate);
+	req->rate = tc358746_find_mclk_settings(tc358746, req->rate);
+
+	return 0;
 }
 
 static int tc358746_mclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1250,7 +1252,7 @@ static const struct clk_ops tc358746_mclk_ops = {
 	.enable = tc358746_mclk_enable,
 	.disable = tc358746_mclk_disable,
 	.recalc_rate = tc358746_recalc_rate,
-	.round_rate = tc358746_mclk_round_rate,
+	.determine_rate = tc358746_mclk_determine_rate,
 	.set_rate = tc358746_mclk_set_rate,
 };
 

-- 
2.50.0

