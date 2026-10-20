Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506180;
	b=1NDb/CJrpkRAsKfNhdQ40B0kg1y494KYMWqRdI4tYMcGOD0q6QmxwObqpgYj5gja73RL
	 0oiNR6fpyUJAS/gE6og0s7BzrWabtoBnTYjYSJ9jS3jdnFCZxZ3D6qQ1L2lT9hxc7lgP6
	 he/FyC1/qf6zAOHfxiHzetLl5/uGxxT+8y3A+lDV733Q4HCtw2igaQ2T3IsKVgtSAUBUz
	 1vlJxGnlcITWNojO5l2/YdL8gnN+BmmTsRCFQ6gwByCMH3dVaDmKAlHOavBE9onjE+UPD
	 hy4GMYAUJyQrlbzjRGoqDBSlmzl5wanS+SGG1Pfys6HCYJYQQPQN4mudtwerqOpJadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
	b=4plz7t8GZkI7p/u6uNiaTUZKs3B2igDYPKU1DRbO+EVjdj3T0Dr4bdVr+PEF7aZYk+AU
	 vW3MS6RcTKzo04lBJG86rQXtqEO3wEji0Vug4bFY1md46jiqsPnGy9+gujIBRf9AIcrXx
	 WSiDfG/gkdqZ/7GDognCMLoLt4v01WGBC4nojOGYljvxw6H06fvM7HbLEESQKybbAdAsW
	 t6LIs1IpOaGcs9Aom0WtNuBY++pLsuBJ6T6fvFw4RemSXSjtU3vLLuBsWU+XUVU6VeFVj
	 bEsWeZMuEa2wGGEoSUZpiws9OgiHIeXOvtsyDco4tII5tfVHQTsgaHYjOm50c+e6D/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQA9krVu;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96660A2638
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 14:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C96660A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQA9krVu
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2113636c88.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506179; x=1793110979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
        b=VQA9krVuTHut3IPDhuI0ClpvD/OmII31kBiOwwHNN/oNIeETn7hxgt7BlputxZUBcE
         PbUSk4hCl8QrSze3laotuKiNCnSkgu3J9h+wpoPv0G05m1dhyeHuSPay9Wqicmb2cDy0
         QJIdphlpcCG5laQS8NlO2KdJhtzUYCPGAKdhs7kKz6G1Sk5mPz2EfXBgAvkyXcHeHAkJ
         Cb6RQ2uL9a5cZcNEzA1A0uupAFhXTS/a5xgyLd8O14Q9LnIvm5jJqCCsEcKL3wGScGib
         WDSlNxfqdITRAcaYs5HwaXV1fGbm4AYc8vNptNvNxJNMmFzCdyuju+Ht7ohbOTMXc/Ba
         CmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506179; x=1793110979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
        b=RVE5R3vrUjrxKYGWEO0Gd3z4dmlhjxhpI00SS2aCE+BwC0m1tiQDixmxU5TqSvG12N
         43jDggHnM8nGrxANt3VFOb+u0WrQQUYOHNNYd75xbjy64DD3ZUbMHvoxsDr9MzznDxKn
         DEBve+OvU4OUeByL9pNoqWC+Tx6VPfN9t7AaDbqkJJObUNB5n/tqKISZETQGaVXw4vng
         tnRAfsdq0TLIVH9YkMSUFTwreuDMA1wCRjlDdpulCwnDtLWp9ORAuZmSenWcCcBYBod0
         B1hHf1F9g0qVUiHqmMGwxZYLwgWxiZhqv5hzn2UmZ+4krOtwVoNrjLjKV8OgfFfsrFCn
         ynpw==
X-Forwarded-Encrypted: i=1; AKwUvByRPjFHc0p/JsxE3wtJovGHg+A+wGzWQ3kC+pGBjcaYmj23kFugjEOlIXU7nbfOdriHq55nXwICOGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdbln9ZMMohq3MqHJpTA715K8yIEJMUgstJuEfUlZ9XLuwjux7
	rqgD1LJ6BcxamnxNSQ5/e5F47kOrVAZ+6t3X1zfyZKcvcrEHl2zjc0SE
X-Gm-Gg: AYBFou06oUFxjjchxHPij/PG+foWosjWjyVLwU8lwU9AbKokkoSeJ0UThBfrtIctd3s
	DBhWW4b3V5RiwRDpnW/XAiJuciWH5jNnqOc0NFEK/vuuiriIEXNitK+aUFT5nO/MLwcfNUcKMRj
	9/Sf9rqvTlHsFLS2Ai1ME0m9W78Wnrw8dYoyc7j8tK61m/tIGMSV7L80jXunQwyl9VN8fm0sI59
	Lny3MihPCdDpkXVVSJ+PaWHo9UYy72FMqJHJCfABGZhpzuMnAZAfWSVH3KBSZuo+t358ObAUEIO
	kjT0Bz+lTuuzNdq1PFlxtou3WG229ex4rcxLhSWwNMD2SE2GY48XJ8nYzp8H3XEdlBRCB05i/tS
	pqbess3xY7K4wQefjpkJ1EGurDVFN5Zh2NllExNN0F3RC2OH2y/b4+xTf1+UO3Li0ZBpLl66gA4
	NBYeqBxGpu+5wQnBpIOsEkzIVNgC3makFv8sU4oe3vrEClSoiJgiTqad6rJOcL+XgWaq0531Kcm
	X2GKpt3OkQ=
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id a92af1059eb24-18514256ee0mr16829571c88.40.1792506178808;
        Tue, 20 Oct 2026 07:22:58 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:57 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
Date: Tue, 20 Oct 2026 14:21:29 +0000
Message-ID: <20261020142157.1749-2-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020142157.1749-1-sushmit718@gmail.com>
References: <20261020142157.1749-1-sushmit718@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
takes this clock as its reference and rejects a 0 Hz rate as
unsupported, so USB doesn't probe.

Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.

Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
Assisted-by: LLM
Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
---
Changes in v2:
- Use full name in From and Signed-off-by.

 drivers/clk/qcom/gcc-sm8450.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index cdae5d9c8aec..56503a45b64e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1500,6 +1500,10 @@ static struct clk_branch gcc_eusb3_0_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eusb3_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.43.0

