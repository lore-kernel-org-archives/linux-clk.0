Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA0D23EA87
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631413; cv=none; b=m1RmwMnH2sxxmyPXw+CI5GD1Ewers1Wb5seRWjoNIza2qcAIOmHXLAnjw2MUyoSCmWIFOuv4S4SzF5P/+1ZhnnWqPX7MXfuTmocY0xKNbYWh6jDBppuUbTXLp6lU60RZmjWuE+VUC9oIV6sOB2riQVvKiKABlPrBMbYSx7Shey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631413; c=relaxed/simple;
	bh=d7JCO3O9dRkRACL9U8RXwExrEcRYnrOli37/5PdH+sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpPpiHUV1mLkkKDsxWuVqvJU5sgO9yMt9iTRY1nRQyPwgdeBRIifLc9fQfMgJXowTnNTa/auzqx9IX8XJWT4XX/nbp9+kzgsZQpUaVpn0stqQ4FvYBHII4Wfvhzw8rneWeX6FyiELybfFU0LIqBTatSGFdnZS+KsfVwDcL+0egg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=giQAOHfI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="giQAOHfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5qh5aSpK05wY0EhFU2WQK7ri954tL+7GouUI5B/RwY=;
	b=giQAOHfIaFDUnMKL2KWmyL3sEtAwMlnoE+vchrp8vrUXXwnynsPAnHPBpVzn2XvfNHhiQZ
	ELa4TSLPTAPa+aua7nh+oD09haCF+LrmTYT2iOEAdIFkvoZ7RcaxUei5YsWJNd+OgGc5zp
	KmWn3gsAB1tGCxvJqoSZ+ZXWLNRnOMY=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-s2uxju4nO9OVLgkX4Tw1SA-1; Thu, 16 Oct 2025 12:16:50 -0400
X-MC-Unique: s2uxju4nO9OVLgkX4Tw1SA-1
X-Mimecast-MFC-AGG-ID: s2uxju4nO9OVLgkX4Tw1SA_1760631409
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5d5eb99cf08so1592713137.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631408; x=1761236208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5qh5aSpK05wY0EhFU2WQK7ri954tL+7GouUI5B/RwY=;
        b=TQpuSZe95lKbLthK06+RUJCL8bUVoBbQZV8oJg4AWPRZN931JfmF+3Iwq0Pl7x+uiJ
         ZV2xaHEdgu8xIuPVGyPHKeRvngjnwR5RSjC4JGHmlXQ2JssS3z9pW/E6tEuJkYBq7Vri
         +bB9QMXOEQa48sTSg+HSARRcOZSuSImMydBsA80dNv78zmzKFZkAIWwi4I+jwHBgERcX
         iWQVNqGwSbsNlgwrDPzFS41WuUhixaKDo2tGo2q9jJg0CrQvsTJmkSqmrfNH+Tn7mUQB
         hz6K6qQLe1LUbclnzYprwBNTfG5r2sjQNCHCsnLt1L+uPlsk/1IKdLP4e1kI+RyE+2pp
         SHag==
X-Gm-Message-State: AOJu0YxN1yjgto1e5vlK4GgSDg1aLoRMZQ5f0s+qry/7V3xWjJFl4gjl
	jS+oB3ZSCuAW9kS583l1LE1kNvtELJvV4Z3xA9jHX/9AW1sj8EKEvqyG+0gkjArC/6OavDukalC
	5dDriMlQggrGOU7JfadhLf0r5JYGMvcmGFN7sa5ckM5IFoDh0c5x9XMZ0lR7NTiCsPjxQ6TMcfR
	sCH9/gCKcPMmgChbgUL5BjnrTllKBpCHIWBGGZrifiPRiU
X-Gm-Gg: ASbGncs2gQeL43gbYIKf0nRABpaVQqJ2kjpvcIOpadeWQrlsEiYpmiYNgv6yiiUQhtW
	TUUtB7GbPJ+I3mekfvWMJlNYhrRFmKNF3A1ODqbdWJlEHtQiVhfu9ZKqvhzdcUwwicVrJwVrfuu
	GK0laS2uk+LHGGGd8f/e0KR5wh/8bIUgWtvINwIDmJuIoUqA7TYg74RtUSLApQcj8NizYbC9jxj
	TaYVyN46aq7zDh8/ARHe7IwBi7dyPd1zFSuTiV1eBcaKSUNKHCJgi4A+U72QdeP08REXfjS5gU+
	Ufvznr5NroXXtMBazslrqSAqhVKiQLnj38xuWMA6kMmFU28bAnaMMakFlsRBpSsFlPrla7ahIrY
	HYlINCorBcRHmHlNv3vFzHI4C2z3Q4rwoYZly3HbDrPSkRa4JbV4Qxy17hp2COgjrKNIe7g==
X-Received: by 2002:a05:6102:4404:b0:5d6:157e:86ac with SMTP id ada2fe7eead31-5d7dd5ef58emr534892137.36.1760631408469;
        Thu, 16 Oct 2025 09:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtvaWSDhP2hY83W5EyJXqX1gwkX8cx/STynn95ag9RtU4IA7EmelwPHWl+32kv6zYbIGjfrA==
X-Received: by 2002:a05:6102:4404:b0:5d6:157e:86ac with SMTP id ada2fe7eead31-5d7dd5ef58emr534800137.36.1760631407921;
        Thu, 16 Oct 2025 09:16:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:16:28 -0400
Subject: [PATCH RESEND 3/4] media: i2c: tc358746: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-media-clk-round-rate-resend-v1-3-446c522fdaaf@redhat.com>
References: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
In-Reply-To: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=d7JCO3O9dRkRACL9U8RXwExrEcRYnrOli37/5PdH+sg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqUV6eUuleoqERM79OPjzd9RcgK/fF5w3qw4HKgyQ
 XHmMvnLHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkrZLhr3xpqgXT9CNOTnZa
 d2Y9a1mt1uwTvYk3ZfXiNBVhsQqtBwz/7I7wXLEOMHEoLN//58oVxleB9asUvOaVPfA64OE1RXY
 LAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/tc358746.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index bcfc274cf891774b45797a8e51939232de2db2bf..86d9ba3ea4e5458412cc49d75bb9a1b4984984e9 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1222,14 +1222,16 @@ tc358746_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
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
@@ -1246,7 +1248,7 @@ static const struct clk_ops tc358746_mclk_ops = {
 	.enable = tc358746_mclk_enable,
 	.disable = tc358746_mclk_disable,
 	.recalc_rate = tc358746_recalc_rate,
-	.round_rate = tc358746_mclk_round_rate,
+	.determine_rate = tc358746_mclk_determine_rate,
 	.set_rate = tc358746_mclk_set_rate,
 };
 

-- 
2.51.0

