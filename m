Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812E23EAB6
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631409; cv=none; b=o9eiLiHljUMhuJ1v91BO9C7eRAHupck/wVtFrGNzE/FWQyNDi8kd3Roo/GatnUq7b6h9WI+eTrWJeCoH6fP3G0r3vIE55F1bUFILmxsUJbEd1pisf4BbcXS3vfposGyZ1O+WsZf+ZdlT1nOcPV/XfwvmKI+CdkriDX6WOA8/EbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631409; c=relaxed/simple;
	bh=NaYMalA7cUh+j+ezOgQM39ElTueU/EbEBbHQwWpzShs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bwft8c7y8wtIIziEBYTTzMX479lQzDxQ/tqvZZgtrxhXHgXDLpHCQR8Hq3QvTwl/fZaAypxwKX+6EF55XOrPBWuBp1C5qVFOTUlyjdIpEQCMQzamFA3mXwvNj/k17hozoAOGM6hD3idsJQOOnkFbjSQaBcQbnDpocYhXZWRGUGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IePJphvH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IePJphvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRqMAj85dTpiKl7/YxPGvelJtzJh6HEeQe0XuylDUXA=;
	b=IePJphvHKFmWgOARhpicL6y04WSMpb69OdVse5hG8lPwLpfk7NWCgYDKPMZqfHc/MtdaZR
	oCOsjBXd/NvxFfKayd+sJSJ0t1oOlBTCF/ogdw0xQjMx0W48si8JhAB7tK5E95s3EC3dKF
	hU3QfUv0jsO5VWuQsA3mITsAII29gYE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-KCLC4sKkMCuNbS7GXXYVrQ-1; Thu, 16 Oct 2025 12:16:45 -0400
X-MC-Unique: KCLC4sKkMCuNbS7GXXYVrQ-1
X-Mimecast-MFC-AGG-ID: KCLC4sKkMCuNbS7GXXYVrQ_1760631405
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-930e3696d49so640241241.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631404; x=1761236204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRqMAj85dTpiKl7/YxPGvelJtzJh6HEeQe0XuylDUXA=;
        b=HfSTIFLwSa4HUMK2zLc03Wj5aRMd5BoQ11cxvRmSNHtY4ICbH9IyE2yyUDAVO9tN1C
         tzLTPkEsi3RMRLvU5ByAD6ArhBSnZIqwIT39V9lLgnJZw9aHl7SWwVe+sZjuakIGOBEU
         AS3WLbsvJnVNN0jruMS9YFwz8fpc5Cj7ux6Zs9azEVzfwspyP1AE6iZAGRudkpsWoOqW
         j6UJGAQ9zCmlN8gUcc9RJshAbeduDuyCavVxjsGG3ub8YYNkF0+Yb5DL2sEUiAlGkwNv
         FrTImYxxpAiB0m7ytwi529J/aCC3b5tsT2RYEX714MyyUlV5inOA1iftnrJTc2pIUtau
         eyIA==
X-Gm-Message-State: AOJu0YwTDVEmxSVI3S0NVoWb/sIz9cBQRsRJkcARHWuwTSn6VfKhW7jP
	ZkO67Pi7goIqNW7i5DeGqUmKL9g3VbbKn/ahAEOsCphA62rIG7QXx7X6V5M58WT7qP5lBcGoOPm
	v7e8eu8EmVcXDlvGqHjCN96lDtGuLNkOIclU9XgWWVDo/EvJ77ySxqjTR4ghR82EFjZzll4avCA
	pz+5EfjyiwHi6GSE7ssSGVr0BOTkfINffLatDg4b4c8I7M
X-Gm-Gg: ASbGncu/zfCY3xnuVo2VrNMT5qjchjjENAUontpISUVvHktc/ANktGtN+orr6mZArFI
	UhLLN8Hz7w4UaGN7XqB8MtC+7WEnM1MIC48SL0nph1GCEmOH+qLk56lAxNmohEU/KRlmaeoUU0g
	ZgpvJvX5Q6F3p8diNcSZwXdeZZOpZjRWo4xOuVI1CzhstF6ptkJ/JKIzl3VErBMeboGEBYxnpRJ
	VAwP18SBYst2twL6bavV3NIUFmmwP5llLpiVVUp6x3IPnIfvForEHnYp+fZMWke0xSnwCiupkQ4
	3GM+srfJI5yz1yWmSFIJktuKP7gfWf4u2VVqsbNPtPRacc20GBypp6L7d+zsFisfnE6oUSj96oS
	nM55q0L4QRhT+4s5IMKBqcCbKcUzwBNi7jBEBLHtf0ctHmwFhk0zbS3ChlTdxTLy+wCK/hQ==
X-Received: by 2002:a05:6122:179f:b0:556:4136:40fb with SMTP id 71dfb90a1353d-5564ef3affcmr429110e0c.10.1760631403912;
        Thu, 16 Oct 2025 09:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsIRdZLdMNOCl1TcdWq4s7o7k8sorUtwIuHg8SAUHkAauIbmUwlYlU31GsE+KTdy4DOESJ5g==
X-Received: by 2002:a05:6122:179f:b0:556:4136:40fb with SMTP id 71dfb90a1353d-5564ef3affcmr429070e0c.10.1760631403462;
        Thu, 16 Oct 2025 09:16:43 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:16:26 -0400
Subject: [PATCH RESEND 1/4] media: i2c: ds90ub953: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-media-clk-round-rate-resend-v1-1-446c522fdaaf@redhat.com>
References: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
In-Reply-To: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=NaYMalA7cUh+j+ezOgQM39ElTueU/EbEBbHQwWpzShs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqU9vqTG0B+3556SLZfMHK/oiGlLViybIOIzyfPIN
 M9XvDZ3OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI968MfyU2rZtkaq4Xc7Si
 M8Lq8r0XK67zcVcybuCz+njg8rR09yyGf9bSF0x7ph4y3rJdqWlm3bNLDgv/d8xSMb/Aw3p6wTO
 XAF4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/ds90ub953.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..c18e88c1770b4efc17cb16f540177d0f56748e36 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1023,15 +1023,17 @@ static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int ub953_clkout_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
 	struct ub953_clkout_data clkout_data;
 
-	ub953_calc_clkout_params(priv, rate, &clkout_data);
+	ub953_calc_clkout_params(priv, req->rate, &clkout_data);
+
+	req->rate = clkout_data.rate;
 
-	return clkout_data.rate;
+	return 0;
 }
 
 static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1050,7 +1052,7 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops ub953_clkout_ops = {
 	.recalc_rate	= ub953_clkout_recalc_rate,
-	.round_rate	= ub953_clkout_round_rate,
+	.determine_rate = ub953_clkout_determine_rate,
 	.set_rate	= ub953_clkout_set_rate,
 };
 

-- 
2.51.0

