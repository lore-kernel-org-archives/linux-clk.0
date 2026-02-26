Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19940F8D9
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129883; cv=none; b=bOyh5FbDn38bKV9TkvlPGn5zxl41L1WSw7kx4IaQay7pscF9YA43mywyzw2ZA2gEXbtrgQmXTT9fzw8Y6hOyy250Mnp109aP37bF+k+SJzPW+XNN4fxnlUftG3Z/WTlPiVwmUZChRN9Z7OVyOWCBS2rYU5FlbUXmUE7pZ/Y3YsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129883; c=relaxed/simple;
	bh=PkGYTmP+orpYOF0vGMHbROclUj3CwVjNeC7verALXO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlAMcOQjawQQD+Fhl1JQnLRn/jbVCCvkgaJiqrDHPRr7y70hgUVchVnrz3uFzJvz7UBvWAcbwTc7s86Cs04muygDhCpQ51/vlpN6IjyzVLg5hxy88N+VUuD7XHaaZzPPdaD38UFMNi2R1waRhDnHugAEEpOD6cMJ+O+fdxmu7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwpvuwRy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pr1f9TAg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwpvuwRy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pr1f9TAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9UvjMEWFqJfyANBSKlP8CFsUFFg2xZHrqLXxuY6d6A=;
	b=cwpvuwRykJOZeklQDlJgP/gM2PjuJjJwmt4bu36TVVMxD548w3cuuNBRTw0WNpV1+f+ZGA
	sjk4SYdqtRId+XA01G39JyqFeTnluJ5cUbSsSYpn6/znkF2WB/yu3ZllROJqbDldzp4b9H
	68rv4OlT2gjOhoov8YEl6EYr/Rh2MZM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-6RIDU2Q-N-yzWorDaZHIsg-1; Thu, 26 Feb 2026 13:17:59 -0500
X-MC-Unique: 6RIDU2Q-N-yzWorDaZHIsg-1
X-Mimecast-MFC-AGG-ID: 6RIDU2Q-N-yzWorDaZHIsg_1772129879
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so1020775485a.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129879; x=1772734679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9UvjMEWFqJfyANBSKlP8CFsUFFg2xZHrqLXxuY6d6A=;
        b=pr1f9TAgfWoBg7gwOwFKu9ke+ELudNJcb12qSvCasucP7BmmqGyre/4hx6xS5n4GRX
         GtEQdz8V+3AUBFrGBJTTdZeXlsE/GP5drf71wFELF0ga8UHtbtHNhRy9Eu4b03YFmycQ
         galjdsM0rmidVy9b8/sw0brmhZDMRdMObi/ScNwpbGi6m4yJoo96NIsQsXI7WJs2vZYO
         xyY4xxU9TEiZQHRedz7Ok7i6dL/3Af4aovTHsTPuJxJjy+BS4ca54kS1pbf8VRC1uWAr
         h0EYZKcyklOY3bwa0HLCbgUom3KoYjpyEkoZyp00RG0c5oMgWAuD/DisrCTFh8N2FxYh
         eIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129879; x=1772734679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9UvjMEWFqJfyANBSKlP8CFsUFFg2xZHrqLXxuY6d6A=;
        b=tvrSUIecJc7E5DwGCP7Ac84g9u1ca16/piX3vMGBM9XRLeSohdnZ3m3pBHkmxkzCPG
         1s+/gjK8PSFKfB6hIoVgX0maxPY/n0X/jE/nybTWMsCM3kQREXv7t5gHv+L/c+OdwEtj
         JgT1z+vt7NkUJQQv835fG91jJsrESoqPoJf5mmLeUHcRE7g53a8fAOxwmDz3SMAkP3Ul
         a9NGjZm/rV1mTfYj/xbQhRXVLg7PFSmEgCsqMiE/2xNjHDauME6wL84g4EbT27W4Hmww
         SSFf6pIXo6EkCo+9p9rtMSw8DoKibzFt5J0YSyPkoyOF8qVsgO+K+YzJ4v9jCvPIih1/
         85cA==
X-Gm-Message-State: AOJu0Yzzi75sS5MZ9g6jkYz5cyuq2Z0tDHoiV5myq2BjmxwIvrP1gWch
	QaN/1zVAVZCcEIfTRDFc2Vda8+G6K7ONragBr/6imd50jXZLnp8bQce36wbvNfArV6TTW5jb/nR
	pC3fC+odsQ49T2AbFGRfYxTHhxSS6Z5l6FLguZKecmcnIAerCvh8W/L4Aqn0F4w==
X-Gm-Gg: ATEYQzyFEBNCJ+6IV69tmLrtZogplgCDe+v1vwRqD7nzaV3fMz5ZON0eQPqOqY8KjXx
	3EvLmct2j5pUDQU+Aaj0S1tRVUn57h0g33E11q7VP72MmSY5huN25GqQxi4mOBRwU6qASkI3Xhl
	TCUQsa3lNBkzJUpgyH3j8IDnRyEbj/0Pg2XC5PY1UWiTg4WmsONLB+Y8pWCwF6ONkpiqURrlUDX
	MTL2FVcAPR+H4lNoerDLe43Nwaa/ArwNviAmU50QWplpnvLMoErjM1Q47exrx+JvD5tn0PijIjn
	UOUER43w5XJsKDg+ozWXc6ff7hAafAbYEr//d1jLeJqfP7DSwr68XNFtq5W2nYcFf3AG/8volFb
	TMg21dXoZvc+SJqWNHBfGQsvM3o8sHoNFycvnkIlMcmInmc1eV006pMO+nzGT
X-Received: by 2002:a05:620a:2942:b0:8b2:ea5a:4149 with SMTP id af79cd13be357-8cbc11cc8bbmr351573085a.65.1772129879209;
        Thu, 26 Feb 2026 10:17:59 -0800 (PST)
X-Received: by 2002:a05:620a:2942:b0:8b2:ea5a:4149 with SMTP id af79cd13be357-8cbc11cc8bbmr351569085a.65.1772129878741;
        Thu, 26 Feb 2026 10:17:58 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:57 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:52 -0500
Subject: [PATCH 08/13] clk: qcom: rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-8-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2680; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=PkGYTmP+orpYOF0vGMHbROclUj3CwVjNeC7verALXO8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Bk+vvo1+MhjneK5vm7xwlMjK3Vjl5x7p9j043Bhw
 GfRjS8OdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR+x0Mf4W0ZqxKe3+10PHr
 7Inaq+yOZBdmOMyvleaafqCLoXG9zH2G/5WTz/qt3XP/Uby8iWa3vU/c71jvSrn7vzluVnnyrYm
 ewwMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpm.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197bea65438f3bed10344f18d6de802..7875cd1815f524572f630242e3b71ff0810cdeda 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -42,6 +42,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	};								      \
 	static struct clk_rpm clk_rpm_##_name##_a_clk = {		      \
@@ -54,6 +55,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_a_clk",			      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	}
 
@@ -78,6 +80,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	}
 
@@ -351,17 +354,6 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int clk_rpm_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
@@ -383,7 +375,6 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +382,6 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.53.0

