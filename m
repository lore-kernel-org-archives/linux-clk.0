Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942721578D
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553151; cv=none; b=QdE2aHpwLSz/cUt4ngPJ30NcgGWi1rCZUulQ47GSy81wnQPCHBXny0PuYvtqXfSMFYFiy+8Af8kMFxos02vS9i9SqdA/fpQsfDzcnxat/NZiBL39sFt0tI8xQGTmPq2wzWfT6f9wPYN8YZIL2WIHvmWw6MnC6zWCsRlFxTQx3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553151; c=relaxed/simple;
	bh=WaM7Qe96KoELIWvCqmebu2CCs763wS4uqian8XW9vH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMoppNasmF1XX+K9yIePbEdNLrUx+SXI98cBMUTgUarlLB5zP6hepTZe/MSMBnrLvx6/2cxvLdFaYq+705EnSJaiH8kphTJnx1bcKoA5lQcBaVI6eriS/g0FNes7feEZPkQYRLWm9shLlkHchChpbVExA7/kZl2eZqDiMEqnB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6/CrHSs; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6/CrHSs"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f7c8b38a0so20017e87.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 18:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553147; x=1758157947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNnMo1aU3dafzNGulegf7Am/JFjmJmvZb/6EjXhaCFU=;
        b=n6/CrHSsWuL/LxV/KMtfifxxWfy6kaDU0GaE5KbB88ekQMkOO8j+Dwb4V0bDlbLgip
         tmOcaNxh0bOJZUE6jWvXZ9LVnRJ8uQAiOc9hyQ1PhWNXAGCX/Kvl8Kzc1byF2PJOiuL3
         nvj8GY6jP9sPjqvhYx+p7KG9Tsb6xCbmmkeoTZmQZWHW1cN9WhVwkhyULFqr92e9uorv
         O2uWdvwx2JEAQaPBhDgtSBUvq1hbMHibOpNcHilWpq7RLxCSKxtZC/xrlNf1uLibjjxH
         XPFXWQmjIPhyNaQcEA2ni92Lz1DksKskbipt8RN2ZZE4S4kR6Oy+xX2bEZKjMGu+6E/z
         6fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553147; x=1758157947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNnMo1aU3dafzNGulegf7Am/JFjmJmvZb/6EjXhaCFU=;
        b=vN8yhlzoD6GJXvItmIr7NIpjUyF/MyT0SOph/jmC6wnE/WbWELPwbBRIwAwakFDoHr
         vJ+Abl5zTs0WpxYoLMJGfXiJ49AaVe4206MNSfSh+8lePQTIgRy7wIbaLPBc35+IX2wl
         0dxrxH3aX2KGztLTE40Bk1qNPZngeuL8lpDFjzP0PfbLS9ToRtW8nXuhD/yBicovfAs5
         ulWKVQadRCUR/JPZVwLAEX5hENiEv0reSEY6yoHVBb3nGBna8x/5Abr/4EEEC9OhFs7/
         wpXfyWpT1hmgXUuk00h7h0uWrPSnM8XvVcpdFupcJXVq7xFXwSZh+XHTu7EzAOfOn0hz
         0hVg==
X-Forwarded-Encrypted: i=1; AJvYcCU3deIMB1OX9KxFqrbovRaPMzyPkn9DErSRGV3Kp2lO2PgMqYnMMnwd/TScZZKeYg4GApJYYVu308o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyz0zrvhAlxsj84XoL/IesMWx3Y1XmObapd8pCDv6YKi9I9cen
	IURlOj5sx5o0zbVr3iKelDqpdjX+qgNDveelwWlPsAiHuzm7XqjNJsJbRtpScbIvovo=
X-Gm-Gg: ASbGncvQV5sc6zjJiWTFNApKVgHLhfr+md2r/DJO2uRetpTvQbfzBOwvDPvswWhA1RE
	ig2gtph4gFDLT8P1G0BS7vQ9ynWdCjk02Sucdu+iJVybsRJvpGyO8IwhsgZh3ux4r/MLisdcW8W
	7+0RubLn5Tv1JxA5f11BpgjrC8XY+JcS0GLuDfQEzlekCJp3UVeIRXaMdumAfTIgw9DzrGa4UAD
	0CrX11AEhqjzsA6uolctoS/a2FyVhds2rYE05t4Fj2dSKc3M506Ew33xkCPKGYaPI4mrBD2VfOx
	RuBK9nUpWKxYL9t+Uy+YwGGcjIcrT/3fMqYZr88AZQrK45wlAyilr6E/KvQ05JP30+7fP9XfqxC
	Ryqh/9WkxteJ97SbNRwtUXWPI5GEMLRzJdLmA776A7HIRNc4ryIbewJ9fSYPdq4Ta1hPt7bQ=
X-Google-Smtp-Source: AGHT+IGxlvcCfx3mo8PG6Q+sA5UnKT9jfjZQgiPSL1Zhl7rlVZlNXV2Eodf/CJ69IE5YYs0q8OT/mQ==
X-Received: by 2002:a05:6512:3d03:b0:55f:4bf6:efe8 with SMTP id 2adb3069b0e04-5626102eab9mr2548418e87.4.1757553147302;
        Wed, 10 Sep 2025 18:12:27 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:26 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
Date: Thu, 11 Sep 2025 04:12:16 +0300
Message-ID: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SM7150 camera clock controller, and it should include
IPE0/1 and BPS ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm7150.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 4a3baf5d8e85..0e072ae39ec0 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -1846,6 +1846,7 @@ static struct gdsc camcc_bps_gdsc = {
 		.name = "camcc_bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &camcc_titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1875,6 +1876,7 @@ static struct gdsc camcc_ipe_0_gdsc = {
 		.name = "camcc_ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &camcc_titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1884,6 +1886,7 @@ static struct gdsc camcc_ipe_1_gdsc = {
 		.name = "camcc_ipe_1_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &camcc_titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0

