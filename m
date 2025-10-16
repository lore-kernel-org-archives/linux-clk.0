Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A2329C61
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631411; cv=none; b=hOlE2QFnlOu4I+G3u+/vJtHNyu3r+UXZBDAZkH99lFbN/84dyK77NdOJdH3LdgTtzY27kZggnTi3pHycc6e/zcildzhIAZhEdcAfkKKK0oQNJ+ADAihPzV32NYSqBRvdDKFad3hXuYu5m3mi8namsdEjMwgw8ojeOtO5wzIbXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631411; c=relaxed/simple;
	bh=sajVuHlrm2j5p4dvKFCrX83KKZFmwX+0mnVl8nsEZ7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZT9pW89O7ZPc+REXdB+tloOpq9VDe9yS9ooMTfmGFZ9cnXcpA66Esc//GEVGm/GWXH14vPLFp8zETShdlgXXI9KVOqee1/1p0JYSG2hUBtJi0jPXpuRtrP6j79+dMqqKktPkXU4L5xiB5hGWGqw2GyS3sLHmRKzkoUkGQo/TIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QaB3TdRb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QaB3TdRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWhkEYna5/SHg/QfisP2H3SeHXg7yoX1e7QIT+fEZJg=;
	b=QaB3TdRbN9L7tfCea1OnUfiHLUVQp9LoZ17GYqw1QEWj5SIm70QBWww97/C5PtG8WLArht
	mM6JTgo/efO09fu0dMLLxMjZekoefjd++K7o0lLM/yMswzNTUdwb0eYVYxYuj1wf4X5wpk
	may04xwIfcPsj9mdsnzeauNdMoF4Z6I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-lMDReAvfPI2g3pu6eWMM4g-1; Thu, 16 Oct 2025 12:16:47 -0400
X-MC-Unique: lMDReAvfPI2g3pu6eWMM4g-1
X-Mimecast-MFC-AGG-ID: lMDReAvfPI2g3pu6eWMM4g_1760631407
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-818bf399f8aso44177786d6.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631406; x=1761236206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWhkEYna5/SHg/QfisP2H3SeHXg7yoX1e7QIT+fEZJg=;
        b=asG7DDgPHM7J20mxVez9h1f1giLpkhuO6RtoQW4fBqynhHGksxFv/oedMh6oBrbirI
         n+SJqUQaer7ryNpqTPOGRLxxXSHq+c0KY76kGhiRCqsK8FAkcgjKdfczgFXLW9LraQIQ
         eYHvC/bepPQbb5d4yhMLNOl/oP2kLmR6D5Py1yAYzFJppYV1RASdvo71Th5JfwKFgqBc
         t8xFd2of7PYqcQwwZ9mSJwZGnCFgQ8iFBIuw+FthUiDxhju+h5QNLfLWV3JUIkgok/2L
         1E2cHIYXSq55CLsY+XALb572fGNQPRbRnWhSjKAv1n0uy2PoZl8k15A4tagKHoyW6Lme
         /QLg==
X-Gm-Message-State: AOJu0YxUorUM3/7c6lJn/ClrNLZ0UEM2namtuy7QzxEawYLeI4wQGQ4P
	yeXj97chZ4bC6l8QCFuZugUVaCS4jpfaCLwaaOL3IaW17fVTO/pspPyYPAY46u5k62bCNWtS8Q4
	KJLssBhQclPQlCPb5+Ma93/LkXltVAy7xwd45uUZRIW6En8uQmep1gTRKWqQED2Y/KoW+xOn+lN
	xzngtfXMw59MAVp75fP/WeOLBBlSTGm5s26RAedSdCW4yb
X-Gm-Gg: ASbGncs7OugA/pvo1H4LaBm5o+/1LIYLcmvls46cUZ7mpolgbEwNIYSa0/e+t28H2mp
	QaQApoIJYCaMOc6KZyeC1TE34OfzOJ5CBC2GmBukt6ViFLSwj3WwoL+lncIGIOKOggNHU7VeueM
	bUzemUumaW/ODJrZ/PDavvw2y5c3GrlXrIfc4QZzH3WxOq3l+7kQmF9nN5ljHHvonAwxURWPEFo
	nr7c24QPTObc1AOcNOvpdIhd+OUOZga25HRf7ivgxdkODJrZv5rENRisAqxtzwbwTJUF5bOgdaD
	pi6Iy/b4tbYzJNmCDYEVAWij5Z95aWdbeDeP7+jiT2tPgKD53pSwU/K6nWjp7cjaC8zZ4j/Mqtj
	oX7t/ZK2/99hMaDlH4Ya+3Y+EoqxI+vFyMr9rE6/kSZ3ICoheGULjcGkiobEs0NgVOpU/9w==
X-Received: by 2002:a05:6214:4e83:b0:87c:2213:ee81 with SMTP id 6a1803df08f44-87c2213f473mr201386d6.33.1760631406241;
        Thu, 16 Oct 2025 09:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Y8GntutE5d9se6vWJ0Hb1FaI/TEI+nUaXnsRAhUqpoBFc3P1BuHNiWkdmpvZHsos/MbW6g==
X-Received: by 2002:a05:6214:4e83:b0:87c:2213:ee81 with SMTP id 6a1803df08f44-87c2213f473mr200786d6.33.1760631405649;
        Thu, 16 Oct 2025 09:16:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:16:27 -0400
Subject: [PATCH RESEND 2/4] media: i2c: max96717: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-media-clk-round-rate-resend-v1-2-446c522fdaaf@redhat.com>
References: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
In-Reply-To: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sajVuHlrm2j5p4dvKFCrX83KKZFmwX+0mnVl8nsEZ7s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqXtsLyb7KQitn3xHSmDJIOo39lG/yo8u87ae/l//
 DMv6MOljlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZSuJmR4frf+DYJj1SrRd8T
 3S7Jqz4RupYulWRjGOF2is+YXztbieGf1lRLB8elhc48E7PrrJTmVXEskA5/ZdE+M3/xLfmlckV
 MAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/max96717.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index c8ae7890d9fa87a78084df1f3be631004acbf57b..111ed49fb97ad585832953fb9ff11de01a83b12a 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -782,21 +782,23 @@ static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
 	return idx;
 }
 
-static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int max96717_clk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct max96717_priv *priv = clk_hw_to_max96717(hw);
 	struct device *dev = &priv->client->dev;
 	unsigned int idx;
 
-	idx = max96717_clk_find_best_index(priv, rate);
+	idx = max96717_clk_find_best_index(priv, req->rate);
 
-	if (rate != max96717_predef_freqs[idx].freq) {
+	if (req->rate != max96717_predef_freqs[idx].freq) {
 		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
-			 rate, max96717_predef_freqs[idx].freq);
+			 req->rate, max96717_predef_freqs[idx].freq);
 	}
 
-	return max96717_predef_freqs[idx].freq;
+	req->rate = max96717_predef_freqs[idx].freq;
+
+	return 0;
 }
 
 static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -847,7 +849,7 @@ static const struct clk_ops max96717_clk_ops = {
 	.unprepare   = max96717_clk_unprepare,
 	.set_rate    = max96717_clk_set_rate,
 	.recalc_rate = max96717_clk_recalc_rate,
-	.round_rate  = max96717_clk_round_rate,
+	.determine_rate = max96717_clk_determine_rate,
 };
 
 static int max96717_register_clkout(struct max96717_priv *priv)

-- 
2.51.0

