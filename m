Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596F28DEEC
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162730; cv=none; b=DwXf8Ni99lcwSXmuMMUbRh/Sg/93A8oqa8wr4d5SnMNdXERKTX9SsS8V+2MQMWGXgOC1ev68Zzv2qoWVFiBrPBGmuU2qigpaPV19IHlPprbeBZ+HzY86LnBpr5CKYgTzUU9kIXQxaZ8fIo9g821qc1b96L7E+gbomQKVH55WqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162730; c=relaxed/simple;
	bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgtFoWvk4xwF/nF7FoBnlx8IkoJdTDk162/FAgFVutHXYh5j8IM/djoLrvVAvimSLvBp2+I0sCINnj8dsGvaWhUyBflXFbNpCTG+27aIzaqs9Wok+q3XCq1mGO3QNceH+l/eXfweT5oaMjN76pptalSud2sdwOvx6HGDDMpR1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VOMdANtb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VOMdANtb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
	b=VOMdANtbddoSE6CJISkhYD+aIaArrp7sZqwCka19XDsYbfL47WsA5dewJX1yQdeyKoaQeR
	hujJVZdnieeg8kHXk4NLbrxULar6g290ETBG65lt4Un29nbseg2pUKdn6qZAtNknmf577Y
	sybUy4OMmZ+Jbg8CoZ+LWf/jAcIMNCo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-1jeTcszYOCSKwi3joWYGBA-1; Thu, 10 Jul 2025 11:51:56 -0400
X-MC-Unique: 1jeTcszYOCSKwi3joWYGBA-1
X-Mimecast-MFC-AGG-ID: 1jeTcszYOCSKwi3joWYGBA_1752162716
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb520a74c8so21041796d6.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162716; x=1752767516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
        b=MoaEFjngqM+H2k1TjLimVsQPPQ9PtweOE2uja9oJV/5zCjSBHeI0tH3ruPRhPQzu5b
         wpV1z9ST6es5UoR92ZhyYXATN7Vn9xNVJ2v3OugMTXgZt7GoTyrAJOxQPOYILRSpMV3v
         NZcrMItIoQSCWkNkcOQVs1lVxbWEKrKUPFp/D8r+jIgmxIBaozGsI5NLlqmX/Xq/n75U
         zuzluKkWi3kEVinPDqKi99fOFfllMXroQa7JvhzjOOJ90rvGM3OChf/is1SvjDPU0gKZ
         MjGHqUB81GUPhuHUBOaYJoTK63S9RRalxwSMrEvYUTylcwrI0xiKzsEDcbeCKNXnG2Qi
         sTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTmf6Fj+h3OMPldkXVlUjy+02nRx8rNpoozRznKovIFFFFGDzTvAHDLgbJloryDunr1d6C6YWtDfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZlQdzp194O7LWB/Io5krDCdLwyAk+zTkZfPW3QiguOHAH1/Y
	AuWlgQTyyaeuJ7QaiqsqLeIlR8YmmhMKyMVFtzSFZpR4QMbVcfMf1wT3/japqLKX+MO7T0UV39m
	xx0V6VQ4lhGRku+i00jHjhsMsVVbrFuzWxmO4z6TCTSoHVC4wTXv5oz4K62TV8A==
X-Gm-Gg: ASbGnctg/GZs1RXWHj6s1UyQ7iGEyg8kaq3CyQ+FdHnfNLG53D4B+l9nZFcOD7oJPUn
	j7u6FxinvtGaaf7ZEHk4aLOWJvbDZ/N5DiB2jSqtFKpYsIFRPDUiqIYMdMOB2VciwaLt7djsLEZ
	eE/ASBrdsp3yki8OXC5gOOACUDEQkrEnKBoU/i4324cY1F8YggCXHFHdShF8FLP4ZTf5mqsoxwX
	ELljN7ErNCpiRlU4YFGZU2XWaAd7yynvx6DX3570Z/iUrMfdnzHIeDYYSFsi2rCThdgtqxUJKS+
	xzLsBNuR5OyAztH+zl5WHaXS2T22YDjBW1pzzRECCFHoDGaoYuMpiUtbYixc
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864736d6.16.1752162715949;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhATSlh+JJuRzkMWsk8YJM8HUQ4igJGizu8oIXouI4tsZbHB3hz8OxedljaxwZ18b6yh4tAA==
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864246d6.16.1752162715355;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:11 -0400
Subject: [PATCH 5/6] sound: soc: stm: stm32_i2s: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-5-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1800;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
 b=w46CeQJbLms7jsanP0xDGuQgHsJotX9gQmmNfNXgBWY+HckWjmp9QYjCSEVuxHqbdfSej7iYE
 m2Ah4xmtB30AIx+iZaZOBsQNN8TYWOwYh9Bcz8BF3HVHSMRZ3eurvHX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/stm/stm32_i2s.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6037b7a9c97bf25621fccb1feb59c4caee3250ca..0e489097d9c1086efcd9e3d1013acffeb0a46d4a 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -461,20 +461,25 @@ static int stm32_i2s_set_parent_rate(struct stm32_i2s_data *i2s,
 	return -EINVAL;
 }
 
-static long stm32_i2smclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
 	struct stm32_i2s_data *i2s = mclk->i2s_data;
 	int ret;
 
-	ret = stm32_i2s_calc_clk_div(i2s, *prate, rate);
-	if (ret)
-		return ret;
+	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
+	if (ret) {
+		req->rate = ret;
 
-	mclk->freq = *prate / i2s->divider;
+		return 0;
+	}
 
-	return mclk->freq;
+	mclk->freq = req->best_parent_rate / i2s->divider;
+
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_i2smclk_recalc_rate(struct clk_hw *hw,
@@ -530,7 +535,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_i2smclk_enable,
 	.disable = stm32_i2smclk_disable,
 	.recalc_rate = stm32_i2smclk_recalc_rate,
-	.round_rate = stm32_i2smclk_round_rate,
+	.determine_rate = stm32_i2smclk_determine_rate,
 	.set_rate = stm32_i2smclk_set_rate,
 };
 

-- 
2.50.0

