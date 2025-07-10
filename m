Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF027A13D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162714; cv=none; b=tydaeXb+t4y43cTlsTKvkwxYOAB8Foo7UZ2+E9Ngr57zNZn8uOKysNEKSZrk5EMC0u80ZX5pq4jwsMjf6FQ+qQwsvBbRT/i96tZjggx1Iwm5OSL91V8P/63erGSjdh0dY2q4UoUiIW1M4Muwy3rB33+85JN+5NSZrjyrGGCRejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162714; c=relaxed/simple;
	bh=gJQYtpXBJm648AFk1gtJnD4yQFFqo6H++D/z3O5GbyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Doz3SkXXpkj0AxEiFzypaP1lmbQv9JGbQo6NNoaq28blVKFP3jqAmdSJ11Mv0C+YS4zpIshd3VWEDMhR88Zr/Q6mrBKJo1l2cwGAtMGZiU0CYadnNRnqScswIzyZz8nzx5q2p9ASAEMY3Y4mZ228AEQDvjirx7NEecSjivX8XW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UH0FGp+L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UH0FGp+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
	b=UH0FGp+LbCeEiwQDqhbHJkLEjxrR5FPsa1R/o3PtiPDf18pYT/HYQ/R7XyggMnzfrNajyX
	cPSnf60aLSQePenKrY3Ex6crtVPGoTrc2Z0AZZJD0OTJ0TAZVsk2njiCbkynqwtnmi8Wir
	b7qD5aZsotZDtBSE/FxnY56vj9R6Rgs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Qfdx6DUCOEC6I1HmfIHSLQ-1; Thu, 10 Jul 2025 11:51:50 -0400
X-MC-Unique: Qfdx6DUCOEC6I1HmfIHSLQ-1
X-Mimecast-MFC-AGG-ID: Qfdx6DUCOEC6I1HmfIHSLQ_1752162710
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb0e344e3eso11588716d6.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162710; x=1752767510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
        b=bvpan3Zftl9BDyjZVGrPJsL1bLsGa9+lYlqOcYz3fZcxCJjZdC8/gboYsETMSEufX8
         YHmBBsuQLXRKNLw+y7m/X8CsWbdX+YOi8zpzcSfpTqOs5LLTWpoTlLxbnfOGbzYl4xo9
         knogoARmPutEZMCQMXReLIPtfQq8GJ3NfC933E2sbC4LhR5Oj9K9AkT8zSbouT2JsKkp
         CiM+iMGqOq+IiumU6LFrJ10ydwGbKY5GnzDCS2EzG1XgDOZbomvT+t+uSt1+nUm0hyQD
         4K3+l768kx84dpw2/lFOaUD9XMRbXAPmFYY/5t92V67UuUvLl5CBjvhEQY1p8bjsyFTa
         7BAg==
X-Forwarded-Encrypted: i=1; AJvYcCXdHs9uMzIxIMKWKr5QuwFVzlCYzbOJM2zAFx0bDdJD3DDnu3v7BV/lq0qc+STGXu87WOtUzIyn9AM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SPTibedvOcpVRKHH6FYjqXiFwlQWbmIDQl01c6llFNy+vzUI
	s+7EeEmUlLMZebqx0F8ge3+lvIJExXqr57VRFZCVef+lF1/4ZRRahCrvGQI88WA6YIOGBOBs6sy
	sZ15ksSgTQBdV1haUEzXys1NYncmtWIGPJzYMhx+tRbQYhEILzpaOZx326EYRWw==
X-Gm-Gg: ASbGnctMS2xHtez8nRmmAmcA831toS+SNlG9QofvQmIBU93v9yaN828M8qDtIpD6+r1
	ZT90FRcFAgaynh3zIWyXjiHbVJonF70RGU5fZqJ5IFMGgx7QlIN3MyXPO532zp+CMoTR2L30LSH
	fpYwJprIvr8e1EWLGSfdJ9Jfb2DMytgZC3DDzWrvMa9heB4GRE0ctUKlkOwrJ1E4OqjXan6dHkH
	KsvaJi8ipJTwQB9cpMX7xLaWWZJmY9ZuoXAwm3L5ujWDOAp6tf/OFnpaoeNiFSpy68x7mLgzbYi
	EDnhm+JiraiqVl8IbKVEY302YtDD/5GabrTaknZmcQ3ZyolWoReZOlRxS+Kl
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id 6a1803df08f44-7049801cd10mr39722516d6.12.1752162710211;
        Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Z7rRnZbhf+h4qqa+7uxIY+dr40XTC3XMOAdTeO370BxlyEUPUGIFiPj6+jcE4rOLalJzHw==
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id 6a1803df08f44-7049801cd10mr39722176d6.12.1752162709775;
        Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:09 -0400
Subject: [PATCH 3/6] sound: soc: codecs: rt5682s: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-3-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3348;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gJQYtpXBJm648AFk1gtJnD4yQFFqo6H++D/z3O5GbyQ=;
 b=vD7l+nzKA8agktbW8Jzsxd4HfmX/ug18UCk1oQGlijIkHUQB6mZ1qnPnNhOQanXgK2uw/TZG1
 MAryM+LpwAXCVClNThsU6ftx2kQA9I5QEh/lGCP0TGcm3ECu8RsmgOH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/rt5682s.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 73c4b3c31f8c45703d965e6fd1b70aa1817e2926..80b921695e7d1c0506766bd47421c07e5fa7a6d3 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2610,8 +2610,8 @@ static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682s->lrck[RT5682S_AIF1];
 }
 
-static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_wclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_WCLK_IDX]);
@@ -2624,13 +2624,13 @@ static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682s_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2719,14 +2719,14 @@ static unsigned long rt5682s_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_bclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682s_clk_check(rt5682s))
+	if (!req->best_parent_rate || !rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
 	/*
@@ -2736,9 +2736,11 @@ static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682s_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682s_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682s_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2769,12 +2771,12 @@ static const struct clk_ops rt5682s_dai_clk_ops[RT5682S_DAI_NUM_CLKS] = {
 		.prepare = rt5682s_wclk_prepare,
 		.unprepare = rt5682s_wclk_unprepare,
 		.recalc_rate = rt5682s_wclk_recalc_rate,
-		.round_rate = rt5682s_wclk_round_rate,
+		.determine_rate = rt5682s_wclk_determine_rate,
 		.set_rate = rt5682s_wclk_set_rate,
 	},
 	[RT5682S_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682s_bclk_recalc_rate,
-		.round_rate = rt5682s_bclk_round_rate,
+		.determine_rate = rt5682s_bclk_determine_rate,
 		.set_rate = rt5682s_bclk_set_rate,
 	},
 };

-- 
2.50.0

