Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0C3D6475
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067185; cv=none; b=UwLYB92WZIN9Ck0M8/0mQXu/KaeEZo0z0sHrlOHR0OYAmxwHFLzuWoLM6vbHCBKKbLpbjsI5yuAQvOk+3zYIbtxuDPmdX1OoKW6z4jAeg2XKC7pNbUnPNkRgP8+7krwIGuNR9tycX+uFd3fnWyKIu0D8yVlT1YgQTmRO748d9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067185; c=relaxed/simple;
	bh=YVMyzc0tTOkSGaDGON3cC3M+SX28i9oee7MZh9VvHmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8KmBfDCSW4etgqf+5yepVvt8vHLssLlnnwHusSeZ+3BUAEAquL6R7o4uWz4l6j/efhM29GTHBXBVYQRgWEFgzjVcRJzTXwjgdDp7NoM3YELUlhHE3EzRmDNskoXuI9m1tBm1nEbcWh170MxbjMezwOajNwB/84HONO5Dy+QthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M9lrhji0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoMWFzx/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M9lrhji0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoMWFzx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pk77Zp5eBE1xjZSOOGEOtHT9QaqlbkHo7+yWZujn4VA=;
	b=M9lrhji0/BDJjJoJqjLUjJ050ffcgO91kIUYzCrF6nqjpQ90IMJN4nS55cMIfXVTia+CEx
	X/Cr8yzbwRUj+ISK3xP9rjrlBrW0RglabFTBc9hxSkz5PVK6Pc1OLjyWzvFyKG0Yu+iiSJ
	/ZDo2z6GjsnM9cdMhhxq8B3yMB3+jVw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-ipJcurCkP7WVY2L3CcOVJg-1; Mon, 09 Mar 2026 10:39:39 -0400
X-MC-Unique: ipJcurCkP7WVY2L3CcOVJg-1
X-Mimecast-MFC-AGG-ID: ipJcurCkP7WVY2L3CcOVJg_1773067179
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so1394162885a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067179; x=1773671979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk77Zp5eBE1xjZSOOGEOtHT9QaqlbkHo7+yWZujn4VA=;
        b=XoMWFzx/dJQDjiFxF7PkgQu6Qz//shpt4DEN0fLEgT1Th7P2bnfI2S0uQL8Y7CM2EC
         uugEzcBrNdjzS1p4DvOEMzYXzmVApUDwlZ15yAnnlhjz7csOp89CJPqxvFM3n+D9QCez
         uEnJqX1tK3knDLyzAzp2HvqzCy1xcfGhi2zX2ED3bi/a0VfV7rEUEwZ6io0yBbdEaSvG
         TG2fGI4aIAEKuqBirViTOyfqLaI9pRKtgMs6X59BeNsbDxwS/YkAIaM6BbVTevsrQBZ8
         fENi7ESrJtBHRIH3328130lcNd7xJZZ72RI7SAkMTsxBRQ9fUS40iLQt6Wv2KrIk5PvG
         plVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067179; x=1773671979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pk77Zp5eBE1xjZSOOGEOtHT9QaqlbkHo7+yWZujn4VA=;
        b=XXGBjv6TejAQOVclnZl5uP4YrDP+/uYnFZmUWevobWVcMhqO4HJFAhktn3BTEtcT43
         DPWzjTt1+jxxYKbDrRX8iIJtFw+Wtq9l8n+JjGSrzzlVK1VSDR/FnJKcr1OjmDQVRmuu
         Zf9PiD34HnOLYnYse9ZLDR/ryFaOc8Oet82GLnbsuPBrh5heZZV0FDKDibd2Qxps9A3x
         mxgK+OmsZH1+k2Efay1PXfa9EVpIOIIfIKDJ4keTCfYNeT/bhO5bkprFWGMl0my0Uch3
         tA+bVEKzan2bq4Zg7H0hArGuXh4IpIt8wQ2EXLnUCf7RjusFrbFJ4clGRF1xlDXsnPht
         9pSA==
X-Gm-Message-State: AOJu0YyJ80G6RKp1WXP74ddkVUNfrCvYDIT7TQFSa5U+uu93hj5claQt
	ZyUFbrEyURG6Ba/HePZy5M47fwmAPUcYmOpJoDWnvPYPOxDseQyXCt3R4KPc94Md/ZAmiZIKb/1
	vit1V5Vx+KNIVy9qQDW56o5Dej8pgrXoiZ+AE3Eerrq8QfCYZ0gaYsBc4SSe1mA==
X-Gm-Gg: ATEYQzy/mIe1RiL0WyFTTCaS7w5pdjcXVkl47iziMTE77hUbvQffokmXVOhw63kLFFX
	50SJQo2Gub8sVcKFlaOFgj0Ep1au+NIxTMBy5qCNXElDk6lckIMqV08WFeaKJ3tdFaXB7DceRHN
	BpBWrZradZ0T0CmCtqJSmncHwgLg0V4h5lOrJeDYSd6zIsZaJfWYiokuvOkVRludcgFnKJhJate
	Oinq4pfWHRNsBOWPN5yaKY6Qs+MwALhAPhIhgawb8DLAXsot2HBqrvVp6RpOHbnUmL9xWJ6+2lC
	/42x+GRIPRfVZEd+Jh/RqIGwts87tph4TVcl4/G1E0LAhncfrgm3hCxXZHx1g2zy1I1Eft1fwDt
	FgzedpnYuysAaDT7NAzDbQpTkYooUgJstZ5HUbAFvaGZxIVV3sL6503VdN6qbHA==
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr1364161085a.5.1773067179066;
        Mon, 09 Mar 2026 07:39:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr1364157385a.5.1773067178618;
        Mon, 09 Mar 2026 07:39:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:49 -0400
Subject: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YVMyzc0tTOkSGaDGON3cC3M+SX28i9oee7MZh9VvHmE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z688binTaDCt90NB+MbJrsLpnnmdWWcmhgqbXWop
 FpD841SRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP58J/hn16L5qK20wK5gp2e
 vtuN1/z4kx/wKXZvAU/dsiDpqfnBJxkZNlWeYY8w3yS39f5hmSOnjgTpqQf8qn6b+qnqRK2kSEw
 qPwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43872bf2f9065e5d6d4 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -35,6 +35,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
+			.flags = CLK_ROUNDING_NOOP,		      \
 		},							      \
 	};								      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
@@ -52,7 +53,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
-			.flags = (ao_flags),				      \
+			.flags = (CLK_ROUNDING_NOOP | (ao_flags)),	      \
 		},							      \
 	}
 
@@ -370,17 +371,6 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -427,7 +417,6 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.53.0

