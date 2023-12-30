Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5D8BF3
	for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AufNKsOE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e67f70f34so6484909e87.0
        for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 05:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703941469; x=1704546269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfDCSXNar/0OypW7xIXC/SzvfN+SSQCc1nv247H/a24=;
        b=AufNKsOEVKvaoD+InkOjU/ZnghGYc3klUzxSV/7P70Kny29uZfPDZJiLgijy/+e2aY
         RHmkFclEL/+Xsag2NbmUrqp6B1KHhccXEU4+q+8MpEQIOB3YAA3JTZLQrsTSBUydT7Jh
         KQHoeWn1QTedYev5s67UQmNitqhkbpMuVKrPAqgzXUKGnxPg9S8/sW6qSO0JVpCD+8/A
         DHWbizqBUBfpotGJTdor/kHqI9+bGjfGlMCeKy+8Scav3neQwqKdT5Ge1hjIz1y5m7Iu
         pVIBni+sDEkDXWHpo21bpTLnv5zBJ+vivVRBnZWRi5FnNF0t3bc3YIGModQLPvw5oV92
         zYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703941469; x=1704546269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfDCSXNar/0OypW7xIXC/SzvfN+SSQCc1nv247H/a24=;
        b=j+RkyrLk+BzABoLJwxWv71ynvqeUriJMTAIcdq91tU4VfvipDz5xGgQDnvjBM8y9QG
         kqu9bIkV8RH1ooMblCqXQNd1YuhtK77NYgSA4ioCa9lhG2UwaR1yv3iDnus+JMVgEanp
         ke8/TR2TbHQ0nAujtNX97FXbnDnjCoPVlvH4PO1ohhO+JiHTA7Eaa+N1RGSL4TxI/q4q
         JwVyNVTDx8JiBzovWewqdjR31056/0hYgp6F9AnUei7t9UMGdeOO40rEgUGBGVGg0aAO
         Uv70gx/hv2OxI09C/+noQpldiuLGiNn2kITm6/T1viGH7D8JS7p3+f6cL1n6EYa5zQ5s
         8qPA==
X-Gm-Message-State: AOJu0YyZndpVgJyjschFh/pFGm9CKEa2fFl5rcE1EBAwqCh2q7fLP0XD
	qP+xrAuW3vXhGqZhlu9wKJ5xKkMcC6l5HQ==
X-Google-Smtp-Source: AGHT+IHKC/9S69IRjqJHn86C9840Aco4GM+dpwfUgkXukkxlwDFabvQKaebdNTcciv4HqL2Uw0hgGQ==
X-Received: by 2002:a05:6512:3da7:b0:50e:68de:4039 with SMTP id k39-20020a0565123da700b0050e68de4039mr6460876lfv.24.1703941469228;
        Sat, 30 Dec 2023 05:04:29 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id ij14-20020a056402158e00b00554368c9ce8sm11359578edb.1.2023.12.30.05.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 05:04:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 14:04:03 +0100
Subject: [PATCH v4 01/12] clk: qcom: branch: Add a helper for setting the
 enable bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v4-1-32c293ded915@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703941465; l=1413;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Bhpm8sfSCBACZPHOO1eUmAv4id2tp/m4vWhfhP3T9EI=;
 b=EJITQzZDptNTTGZEXkt1RP2hZcKhfJoMvZs/gaG0ZxiEUX3OhUxSnO9lO+oGSxZmtekGeBrY8
 va74NUe6cknDjS9mziPjaqw3WFpT1f9fQOnnDP6PSBU9YSGF+SQ2YBg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

We hardcode some clocks to be always-on, as they're essential to the
functioning of the SoC / some peripherals. Add a helper to do so
to make the writes less magic.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 8ffed603c050..0514bc43100b 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -64,6 +64,7 @@ struct clk_mem_branch {
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
 #define CBCR_WAKEUP			GENMASK(11, 8)
 #define CBCR_SLEEP			GENMASK(7, 4)
+#define CBCR_CLOCK_ENABLE		BIT(0)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
 						  struct clk_branch clk, bool on)
@@ -98,6 +99,12 @@ static inline void qcom_branch_set_sleep(struct regmap *regmap, struct clk_branc
 			   FIELD_PREP(CBCR_SLEEP, val));
 }
 
+static inline void qcom_branch_set_clk_en(struct regmap *regmap, u32 cbcr)
+{
+	regmap_update_bits(regmap, cbcr, CBCR_CLOCK_ENABLE,
+			   CBCR_CLOCK_ENABLE);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;

-- 
2.43.0

