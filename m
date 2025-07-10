Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DE27B4EB
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162717; cv=none; b=qgzQi4v4bcVe5EyntcgTQCgkqBH8LGeJ/4baxvxcZ1JVrZhNIrseYEtOfnKjQ6YsXSpdr6YpzsLNRs9zJVwx7VV5C1RGVWR73qF51JaJ8n5a5UA1g4xyKxkKcKkGuCDSeh1nGvqniGaQMYfjgMCK1GcUpDGn+fg3irSTEoeJTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162717; c=relaxed/simple;
	bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I66hrogTDrnBZ6KEi+Ub66+cCY5JkybmGQvbrMYqC2rzMV80Bywcu8r1e0PMF6Ca0rJNNGFJ25x2cJbO7do3p8fW1iAhM2FvFAafvYWEzRSafNjg4SHjBsk6etO7qivRArkE9z/yXmAw6iwFXBtHflkAQFn4U32RmDVAXEyCZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=celLluoZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="celLluoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
	b=celLluoZkFwbxr2D/qEZ+uo4KedZFjqRjf2EAXMW3u51lT4mUpHP5jZrksh30oM1G0XVPw
	CpVUeFGvH8XJSTFf+3oCyaj6lAAzQCwMa2vKE75/AnPx6l6Obxsf4uHepqmPRzBxDQxeNQ
	AbxJIcK7gazUPBFa2b8C7g64+UBFST4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-OGxMpfKUMXyGyAkP0plKQQ-1; Thu, 10 Jul 2025 11:51:53 -0400
X-MC-Unique: OGxMpfKUMXyGyAkP0plKQQ-1
X-Mimecast-MFC-AGG-ID: OGxMpfKUMXyGyAkP0plKQQ_1752162713
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-702b5e87d98so23402216d6.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162713; x=1752767513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
        b=JZIm8QJ5Bh5K8ZwFeZaWZYydWEAsM9HMBFNmIlLQtibUFqNjjTaBb+TnmGZNpNdqwz
         NJRh+0ZIttUbFpCDNJho91H0OVOd3Zi7BJsrZJsAm+811aKlc8ak1TwO5FkAn/n1wlav
         oqMu/2OmEmXml/bUir9Y2NLzkDrrkP26FwEVnov1TtvfmD2WiNPuYVufzJwtJ2/d2tmF
         hC7E5mIanRz43aGp28uAuJrdtdR+7YWvV/CkqkqeCw2I4AmVYVi4GkpQMsnBQFSGLtYT
         YpVRqiVAqKhWUVt9q2ETj7Jy3fLGHkpekDAClUtEpl0tHzUgZNcghHLKcfTu+GpgW1p5
         oi2A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9aPf5TFPzMjm5KLMLHBKagyOJ1fmKDq9aU87gBQIceozucU7z8/lGI1ZwetNnMGkWv+t7Cp1o8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIbwJ33TI1u2S+6lHoQZ8BcSgQLi+YnePvNWfg1e9lKtwomgv
	dhv+BHGgAU6nZ61/9S9QEY6xJSliI2j2/jtt1Bs7o4RL1Z1CcU7zw25Mt3J96vbEtyyKyrpndfL
	ZNe2KPdC1gi85bSRdVPd8mG7JCgLlvoxKOwtbrWnFbga+hqC+E8ylDWHG3H596w==
X-Gm-Gg: ASbGnct6BlfrOYx2da9MjKf8E6XUAD0i2jb3UyxzZTlNyQDByOXMV+equUNY8n0RF6v
	95dVWMydWQwz80KmEct54LpqpaYsoKVzleCgVLGpw/j39ihcvHmb0TXdXIU/FoUdBAo5a7qVAcX
	Wu8DImO1jZtvJhbXele7pMwuwjp79FUiZUpCsvO+3ZPWzg1Lucce4dX3wIg/pP6fVxMZJOD5ppz
	kz9S7SnUMUGmUKrliRYFirIN8nNj+WgiRBpScJwx1UzmFSnYyApvaKff7D41mTaP794pxGAhCZF
	84TTTcFqwRLWXLI3ZrsPjsXnjMvMA09a8IyqCPhDedJvA6V9W0+/olpWKzY5
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101856d6.33.1752162713182;
        Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETv8kKkAF9gRKcsuP04l5OSaop0yTF67wtB5mlM/oS84I84ISgz+5x5RQyUV0R0LiOWXu3+Q==
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101146d6.33.1752162712560;
        Thu, 10 Jul 2025 08:51:52 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:10 -0400
Subject: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1297;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
 b=C1NOkFYk4ZvkSlhR/nJT1ZMxm1WrhT5fr4V1f6MUwtgu1IwsGHRhGihPJyKm/qfChcPciMqRX
 jMkYCRRA7J1Bi4cmmruZSnKv3HXP26MoB05WHwsHZzBAvqaIhMzvhGA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index e758411603be5157e468e8c076620d7c18661bf3..03838582aeade389d9a2d90cf9f03fad835f0733 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -69,17 +69,17 @@ static unsigned long clk_q6dsp_recalc_rate(struct clk_hw *hw,
 	return clk->rate;
 }
 
-static long clk_q6dsp_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_q6dsp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_q6dsp_ops = {
 	.prepare	= clk_q6dsp_prepare,
 	.unprepare	= clk_q6dsp_unprepare,
 	.set_rate	= clk_q6dsp_set_rate,
-	.round_rate	= clk_q6dsp_round_rate,
+	.determine_rate = clk_q6dsp_determine_rate,
 	.recalc_rate	= clk_q6dsp_recalc_rate,
 };
 

-- 
2.50.0

