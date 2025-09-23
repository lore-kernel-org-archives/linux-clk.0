Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6726F2BB
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638404; cv=none; b=Y9Td3fhOD1ZBorNoUXi35eDlqP1qALEchuxICCjWvH6MayMeRZ0ki5snaVWnOutT5WeYa+nWBftRvpjFL4Xb+H5x4r7PWpvXyTPqSB38PyMmXUjzap8uXGcjgjjNhr3EN2O9MTIRRzzmpn+Die4CaPcHBa5AoFXbNhsgGhpKl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638404; c=relaxed/simple;
	bh=cKxFZ1V9JkbMvlvajDHPLZ47CwL2tRpgNY6Q+YW/aF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBD6yTGx1qAVXHGfpLzwm4LlFOfAgo542uOqfxd+6YxfyAAj/uDpAqPt91Mzuhj9q9zGz3wIzc4Ip8yDJxS0LdiynawXCg0s2RoQ5x7MrPuWpiSvRU/VbbzeUYho3ec0OLGzrjFK18R38nSxK69EfhBGyeenmqYoR1Ehj5tYdYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E6kihLUQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E6kihLUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbj/S0aRmzh4H+OIrc3SDD0aZUBHX/EMobfhnl53kHo=;
	b=E6kihLUQRUHf+xhS9iUwjuWUMka3b6ChCjJMjeFQDSh7Ttmd1Ra9Mewf0RPJui3HtHvhvf
	dFVp8+uw9vU2Ka5Sr/lan2fXTNS/uk27CG2NUqFHmKNRmxbIifcA0Q7fzVwtmx78Tzfefr
	hjxHasae1dzDwmf2DnfNVpQcfl0rFSo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-CD2_b-j0PuKYgRELcWpfCQ-1; Tue, 23 Sep 2025 10:39:59 -0400
X-MC-Unique: CD2_b-j0PuKYgRELcWpfCQ-1
X-Mimecast-MFC-AGG-ID: CD2_b-j0PuKYgRELcWpfCQ_1758638399
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-817ecd47971so1270154885a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638399; x=1759243199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbj/S0aRmzh4H+OIrc3SDD0aZUBHX/EMobfhnl53kHo=;
        b=F1bN2yfatPhpx17jVsOV4vWve48dmMzhTY0KS5itgbjBmMxU43PaHuf2rI6AvrdHQ1
         KI4SdLb+8L5i2AsuSiyF0xX9LpWuV8b0OiY7WJPneZ4dQoNTAmMiUGNS5Ikv/Npsz+Cz
         SD54wokz8tM9HK6k1qDx9LBzHYQNONoe5IACUduAWD/tYK/z24Ime4Ti7RVQRSP9ExOM
         aOPx5l57giWs2rtoh3hcE7yl5SH6m3ofTsvRJh/MEdCWPm15ft+JqTYPnFOOKCErHtRP
         LGinHYXxgNNl5hStsJ/Jp0rKZ3m4AgznNzrwMm/H+oLV5NV8Ge2G8xMIlToFD5G/kIPx
         ZKGA==
X-Gm-Message-State: AOJu0YwqMJYg8blNl1/6TjyNrfyQrasOzgD+VL31kEZiaP+1+mnZHFgu
	KdB7zo5bUsVvzxDNKcu5gNATCDfB5Q5z7gfhcuhWddyewB5pqGWJo2XVjGSJBOoruHKkYqpzBsQ
	BJunp8iaBbc3HZuRxKiX9Yk6c8A7vpb6B/0lIqsNaIlkvM9xH5KH6yhHFfuCqMw==
X-Gm-Gg: ASbGncsb5a0plsTfrzzbYbhaYsXwhFcx3dkPk8t+XpR7FEU5OTgiTXrXgzey5VzrNNe
	yw7tkMr3lw1SSxg6/AZ5yAdfj0MslVOxzChOOuxVeidENF0+O39hU5RWrjm765ZuAfSvNjoKqnW
	bFDU24vtp9KHzu9qIj77H9+nDCgPO6b17/epAx3s287K1N+q/XPVFturaqi7f1MLMpT3DZsPvRH
	RfreCyTIvQ2A1dx6sMowGieq2BaZ/+tCjhMsHuch6m9gwnuWYpGxmVOe5+6QaFwhfVWM8QO/2pQ
	erIAYt/bHpJ4pJywNQJPBwlkrCeqC2u52UE6zP7xDVsTO7xTBvTU5Tc5E5N81tZFOlKjdmo2j1p
	/m813y7kTZC4gUjazHHiADYxqkkbdiw6GguxQnt0=
X-Received: by 2002:a05:620a:29c4:b0:82b:7a80:e48a with SMTP id af79cd13be357-851b634daedmr251398885a.24.1758638398606;
        Tue, 23 Sep 2025 07:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkgaHgsa3dAnSghMgykCefgHSWKnQmgpmqmcnFrZsNTEAFjdJhOXkXgMBQKiKbRdGNJDtlSQ==
X-Received: by 2002:a05:620a:29c4:b0:82b:7a80:e48a with SMTP id af79cd13be357-851b634daedmr251395985a.24.1758638398130;
        Tue, 23 Sep 2025 07:39:58 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:22 -0400
Subject: [PATCH RFC v4 03/12] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-3-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cKxFZ1V9JkbMvlvajDHPLZ47CwL2tRpgNY6Q+YW/aF8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdSfu+BVmmykusC/m7o5639rzjv8RT2I0TLZPu7aB
 4tcE7PlHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykg4Xhv09Y6ua9e74b7dv9
 spTVMuTANluXe6ZNC2ZOmupvWntPUp2R4U3vYoHW2Suv6lqpGSfOFSr/qKqyqftUWfvSEiY/qZT
 lXAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 372dd289a7ba148a0725ea0643342ccda7196216..e1f72fcede1df1d486744b171728231ec8fa8836 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -137,6 +137,50 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+// 4 ought to be enough for anybody
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static int clk_dummy_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DUMMY_DIV_FLAGS);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.51.0

