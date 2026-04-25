Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC3372B4F
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141885; cv=none; b=GOdVV2LYeIiJKNYUQHQQurGI9YqoKsajeTiaJ+qxQqIabKu5INicQlZxUoHM/wwZjJHsiBar3JeiwGzEGcYWiLZuMnDyUW2/b4K1wkRKnaEzp28RHvJuM+NPFlCnMaM9zhFnUCa4h/tnJd1VbDbHH64bIZaqrXvaV90dOLLSehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141885; c=relaxed/simple;
	bh=/n90KONaiUk7JIMeCRq4mUrGxJmn4zHTMpFbTUT82XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeMh6rLd60gFC9Jz2wYjYbVYDjzl7sV9CJZaG4uAN2AWIh3U5XkRAD+Dmp8oMnnSNfL9gpoa3/zM+AcNrlbnSrY1uSgQMDMPt9VN7qOM44EUcU3CHYpBfkgIovKx08NnNBBvzUpNU3qsceEqNM6WHc95t89BK17ZPOQA38YaNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHvdwkoU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHvdwkoU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso92454245e9.1
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141881; x=1777746681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=tHvdwkoUpI1bKAdNk8pi+mrFxRHXnBU9czApjsQTGQpv7asrc8O1ehCubziToXHtIh
         7/mBF8Ah0EdMCYY1SX9Lemzim4TP9JMtKWURV7KENO4fbfVFKyMEL34RfLbFpTVqBR+V
         RVCbcZSKgAxPxaFY8Z1CTDZK1yH/ivCBPgVR0+1qhzoYQqgQDop3vlEXpGsJ9YOitKIN
         0ZbJWHnhvCjZzQWiu14xCQF0Y+NK30ie8ILU0lTZjq+NuPqtB866XTYAyqxgdnueB8OA
         kxcN8vWICCEycwBWRbQiFo7wUUsVaNrHQJ0GjOnxecuFQrZi+93ZpI7guYkfCZwjo1OS
         ipFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141881; x=1777746681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=DxLrD0AT7aag95hZFNAvesG9mjtI87PeNIi4IfH+aBzuwB+0+MIvQD6Nr8kFFaNGFT
         CsVgS8vNs/abbb4xKwCcUbqxlRn+JHQo9J+c1pGZR0aw4AwzwogDKKOROtW8WwV4GzKM
         yB6ofb8cQK52NN8bs/zZJ1+wPIGz6+CLPaCGE9aFBzNpzdv6Ls6VeOfwQnoI0971AxgN
         S+UeriMLGoX4IAMUM14U4lqYWoo3MLcGbEpKUP8MLe3KPn1lOqeKd+OA6N/YwO5l/cqH
         VQK8QS8TXGiDkEqFHKBX1c2gEuThQo1PWv3rb35oDGShRbraPhPPAt7T61QFmzGnTQaO
         FGXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8J4BLWE7KjNyRA7SGHbesAXackVUc423NUEqHsTQMZzKlY2Z//mHAkstGxQI9NwqO81MiQpckVvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdJOcm9rFnIFLrCuk0DHSf4QVPESK8NOgqLbu7YyFt3DOxmjW
	vVQQTbejWvuyQ9a7qk91sgAOV2jteGNOEqOGXD/JNjMZlOqQpmDShazp
X-Gm-Gg: AeBDieusZAULM40yVDooYanu+P5U+n7dkV97Dr5n384Mt1lH/jn15Yiw4iOGYahFOCh
	Y0TEqK9Ts0VcGdVsdwdLPRATMUGUIJjrdUe6LDiKAim1vloidzYKRBQC0yC63M2b5M7pubFRMEh
	BhjUOJj23O5YRy/qIfYZNiwFLo+dDwiKBa3b8fm0UI62GwnIyZEaYidndl4gn+ZjgEaDL1wDEEh
	63nelbrZ1zrR82OD2Mx8vQmfSqSWS0mNkgFqhMlx/N+l6wLYkaInmGlA85rkxPUcQEo8bsA0WYm
	GWBEqVw2xOwPiwfKcfUYPI8DOU0zEcdfqhRSwc6qDw7Z8VHq1EwDmzJa2lOPmyDtIKu3Q6tR8/D
	kV5MtLoFdsRnUMcFb+9pgyxmAemSjm4mih6kwKgxIZV2muivuS/bGNJpDLRMxDUbj4IqNaZjG0x
	FGRHx8nI1eyBLKcyJZeTtdLxNJpnIjOKQZYSA=
X-Received: by 2002:a05:600c:5295:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-488fb77d12dmr525819325e9.16.1777141881001;
        Sat, 25 Apr 2026 11:31:21 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:20 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:03 +0300
Subject: [PATCH RFC v2 02/11] media: qcom: venus: add pmdomains to the
 struct based on the purpose of cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-2-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add vcodec0_pmdomains and vcodec1_pmdomains to indicate power domains
for Venus cores.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..1a919439abc1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,6 +80,8 @@ struct venus_resources {
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
+	const char **vcodec0_pmdomains;
+	const char **vcodec1_pmdomains;
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
@@ -144,6 +146,8 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @vcodec0_pmdomans: a pointer to a list of pmdomains for vcodec0 cores
+ * @vcodec1_pmdomans: a pointer to a list of pmdomains for vcodec1 cores
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -198,6 +202,8 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct dev_pm_domain_list *vcodec0_pmdomains;
+	struct dev_pm_domain_list *vcodec1_pmdomains;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];

-- 
2.54.0

