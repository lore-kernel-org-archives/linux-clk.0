Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5E2EBDF0
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257227; cv=none; b=TRDtycVcQzODoxB1m631057FRwazFMqUfFgorUWe86jvjSmtEA4lidOqlPiR5GtgmJkVwy9kaUO9yff9K7NxseLPvLOqg6Esx1ZPa+vSK/m5SBrSPJv/dv9dK2TxcEZU35GL7W6LwgeLoi5LiNEe3krNQ7l4z/aKbW7zMs91veM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257227; c=relaxed/simple;
	bh=nJt4ADbxIA14pqN4XsVTOJSsLTO3c7LveRnmHeFCRAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1rTanbrthZkNGHm6ij9ma9zdloZNeWhi7xtmud/MzTg8sjKgiZPGur2tr679Tvwm05I0a4miGUlLP3BJdizvBGxIkA+3chR9xg7zrPBzwqpxZ44h+oihobUD6J8HvzIC4AqPZkjQ3TN/kd1nBhzNN9p5w3xJxResspwKWMQ1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haHeYsWA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haHeYsWA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89c10dfabso200233966b.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257223; x=1750862023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlA118QQRrQcU4/5ozkHrMeNhT8icrM9d6BUqE0LJLY=;
        b=haHeYsWATlB4LvbhO3VbHYW7v2W54VpQn+JeETOGxK+HCCsdIe9CbPjVRf+m/ZZl4W
         p5UZRs72NknPKWj9qXgeiwaIwT1GoQp0TWNX7PGWUGhmsgqWTGkJyja7YMKaMlQbEeVF
         keScT4wYY/qrhnJ9hUcR/Ag4BxNdS44f0QRTeaLIxdTxalVaPz1NP3357yBBPUOjWjKR
         zwTUQwtjGXaUa6AIdPcaN2C5sZkwrdTENqMSHhqqAvrEbaeo81qMcZyHRv78nDBN3NPs
         KX+OVPgdE4UcZS4QHqow/FaOwcs4DN66J2Jyy87PZ6zsMDHkaSjOVB+4yZNEdN5MS8CB
         PP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257223; x=1750862023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlA118QQRrQcU4/5ozkHrMeNhT8icrM9d6BUqE0LJLY=;
        b=dUa6S2ttph1xvbpCh//O/EwwMimzrCPBT53s4nIo0ehB4THddDzJJYOWv0Lcqfdk8P
         6A3XO3/6zJP+2bOtqS39Bmb0GH1xxRVnOavSKycQH9e51Xf1tW+q8h7kVU1Hze79X2MB
         gQY40NDRi4AUfnJFKiBMcs4y5J3k2CcI3Wf8kMFiq55Yw/sp+7dvYZCSBSS1LuRC8pJP
         c9Rm05tqQw1dpnO3HeEaWeJMxKvTUzrO41rVYW+pwQMDE6hE/zUOY3MI1S2tgENXI+Nf
         YTAOvNj0FhWgpAD3YcojpK9+jMvaJMldkAw29eGd7Ak5S5hpUlkURUA4rnGYJr5oorlv
         iIww==
X-Forwarded-Encrypted: i=1; AJvYcCWGy6UzGjmzZJ5DpVeOI5EgXt1ABC9C+mbJAmRlJrEn343Utf0mZYJS+2fOsMIr/KImq9uX+6qDVgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cfp7Cy3ZM1rMqLLlbVtgTE/5qwNGS5mSnnDr63/WKtgAB9Vd
	mScH4y4ulkN+G171fybBlRKTtVEycPdezwAgQNvFWw7dHIEsbYeB1GzGw6QDkGiC15Q=
X-Gm-Gg: ASbGncuCSJoYJ7p2tNl9Gwc39qEir+x9CdspLT/hAAjM04TB2RNonD1WNSc9JG+//oT
	cNzHykTVvz4zkO52GG67f5WyPkvlGA7xtCaay97R4CykkN7DUM3Uyw8/dNqWVVyRBWFI3lvLbhR
	xwS4eGOdnPe2ZE1T1A/F+SD3TUrmgCjGJG3Ko83YKLhFAijML1Ckyh2QVzjCxc0sZWrZ4xneLfl
	FQFnhkZY8CEIDPDZTcm5KSsfB+6PAnt34kLLX2klcWT6b1YrALfzt9MOveWT2X2fGj7NHx4F94p
	vJPOFGLNhdredgJqtYicLOdMcx54D5q0M72z3eVvoJubJs6dSI+HPpCLWwS63UfAhxDaTSNOV/5
	VIFe3t/c=
X-Google-Smtp-Source: AGHT+IEqWhfZvPBu5eHGUGg8Iwx5XpXuwaeur8bLnZ0cMet2VQIyHL3CTFNYuJDKV/kCjrV7fPGopg==
X-Received: by 2002:a17:907:e2dc:b0:ae0:1fdf:ea43 with SMTP id a640c23a62f3a-ae01fdfeca3mr99043266b.2.1750257222936;
        Wed, 18 Jun 2025 07:33:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:42 +0200
Subject: [PATCH v7 13/13] drm/msm/mdss: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-13-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nJt4ADbxIA14pqN4XsVTOJSsLTO3c7LveRnmHeFCRAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4lO0igoNoiH6lYl9w0oC7YRM14FNNM6kLoi
 l6a8zSzTTSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOJQAKCRDBN2bmhouD
 14hcD/4qDWghYkiFT0CiyrIzz3YMUrhIppIA4jAgI4Rtzuks02Liq1Ri1cWOFhXvDzJyLNjK3K1
 3l89O7kPLQ0cn7X02DEWwWra6i2MTHy0qZjt7UCwRkU37jRNomF3xCbx6rkZTgUEXuvu+MumLNi
 32FRBCTSi35Q52GUqnsgfHZxnb8+7jtX04T5/HPOYZXw57GY0xJ31O0Yy/vlv17qkERjh67z5WC
 WXcrk/tV1kDx3tKAgpqNsO6L+MZcQg72bvi3lhBn/1kc15Aha5GjCEKUEVheu83M3wHkqHgoxBK
 LPudwd4yjqTqID0RenCdjBLJC/i52qaYvIVENqtMaby2dsDw2qPScEX0QE2ONetT2lVUIvVH0Zv
 12bKSbtW9Anvug7Va6+/+sI9Spl+rq1EA6ywxwXy7de96e8g8NHD3LkvEEeYKAdrCMJaxYXcddr
 16ClEV2Op04mCLo2WtmgrG045lTq5Tnp3yarphaN98+t1sGae7tkIX7pJxwIWYHjHC6C1KTYC0P
 Iuo6q7j4L1PHKVgUSstV9T3514uzJf37ejRpWcfg0f+c0UFOC9ZrmTDqS4Qaa9YT8GNsulHYcdq
 v7A01L78rBKRTD301acm2fVGyqAPlcSgnQqDsu83BpTKfjhaqybwLy8WZ7JeHmuk2YTKJtiXtln
 8UxcfxWh+DnTRTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 709979fcfab6062c0f316f7655823e888638bfea..422da5ebf802676afbfc5f242a5a84e6d488dda1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -732,6 +753,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -767,6 +799,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.45.2

