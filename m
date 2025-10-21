Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0916518C26
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090323; cv=none; b=BUt1P9Y+eJAQz5MUhG5jE2CiXwzFlWH0dvRx117S522rI1SpU4NY7NIdpj71aPHv7cXaQYAxgfy9enCgFk6brXo/074P/WYqBuzpbGH3Ksit+KRqWN+3R2JV1q4n8ZHh4OBDAo7P6aMHMxHqoBpd5AfvqNfldF3HEDGe6Uv33uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090323; c=relaxed/simple;
	bh=zsNiK+YXZK6bgzsLA2X36+lXT6QqOv60pIxouRkvuag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Inu43/xM8cLL0oKRu/Afy0oJt4Zql+VaEWxlvAkgYTtVKVEXswLfANEEU9ERfBFVxvZ+cVDD8BaYN2Rd8CtPxRQ4YJ7cl3av7GFvXlQALNzZARv3iLcv2ZjDeUd05BlEOr0C0kC5tEJLl8Nz3ySXRjLA1Kmz57ktDnwS+tGAxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKvckq98; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKvckq98"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591e6dea3e1so272640e87.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090319; x=1761695119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvLSFIpu8j0k49O1nyWcmlYBWnO05KhDwpdtEYBI5GE=;
        b=MKvckq98u6rHr51UeKgrA9i83JRmLXrOBopC+W469PxOflcj9bJnpTibfdiSmpkZVG
         GgKQfCIoAr5wtGaG2y6ZSYDJ23nAPa8LXBF8l2EnA+/ltOARGgkh8AWDHM61JjAV8zsw
         IGoM0FVirsfSrK2H2N+UDoaMvkhfNiZ+JvhfVuPbHjlKt/6lKllSxcQ7d3IAx3MlLYsn
         Rd2Si0xFwXwAQCI/mTyZ5ns10hwhcz3T7jzFVUHTIU1XLL7U3AHc4q6PK/8txKI6V2lm
         445vFdW60OjFwxbKc6NnDhLKhEArlRm6HBVEA+MQvPuXmURJ0WZHIoUFlhOc/0cZljlH
         eWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090319; x=1761695119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvLSFIpu8j0k49O1nyWcmlYBWnO05KhDwpdtEYBI5GE=;
        b=mFsVSf1b5ZjzbxpwNHpkVzK612YHRq8Hd33GqAu+Pku2wKpcaGhCum2M0k4YMEyVtQ
         YnESdN5HXTGWGKJ6cTsyJx2u+Dhwt8YKo67uoPspeRp0Bjl4+O+hD0bnv5HOo+JJfTY4
         17c9ZirnU9Y9xb6iArGiOmWg+ubAmbYJVLuhPq2inBq1Fn6ckQSrpbFdCxdlKvZTZKsx
         jX+AWAg89WpTJ/tLqPcTq0TFgL6q0tWfVPH2PfsP/GsvjA6QxuRV5riRprfrgSLpdyDL
         5egaRUD3/fYYXDw8E0kgnpQzNOH6OVdRI6o7WNF0asbzkvasIy2AG4UHvVFNcIMp7pSQ
         LEuA==
X-Forwarded-Encrypted: i=1; AJvYcCWsoxlvBhJyt2s8DSb7NrL2Fd9Ix0M5hhCPDcvKrC34yuUvPIW1AiZpGryN/xUHKkryboSLpc04caY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJP87HTX7ys6/8fwTx+ZIQoF7sURcmgnrmf3bEfcrg76ONR4x
	68eGaUjOJIvpUWcvi5fgAzRFQgmNMAbwValEXwYsT/ZhE9N96ND3zByPPeFghl0ALQY=
X-Gm-Gg: ASbGnctbdf9vTpq2k4+WRAUCBAbs6VlGkAv/MdEyi4RYfaPbnFeFP3Yrio9+M8+PrWD
	laYjgSd3FWdLx6a0ZkxzWAOJAO7zxxMZpmHtd3M8rVSpGTbQ0Y7oSzZ9zuMGOJZl98T3bFksujV
	va8crTvihmWvKgZV4ICP3UXMVJNn6HkrlEune3JE5bJoKB7kXJbRS0mQ8SJNDA26NdE+Y3P6gSf
	VS7jS8JweM/2tycdBaOeEvYQFUbrFEkuRaI083lG3sVS9NFpHvQWNqKUrzP8wlDoYmffJNVpD8H
	wOIv2MWwdi812MUsTIeCQDmRFMiZCH2jQW2c56YT6qtIJzFE4mRi981R+qlEQ25bgVDRiqlAYx5
	nMkcoUhiVzB7xOkttJ3UALnGorDi1AgFPwQ4i+E+tmm2EeLQ8C23ogpWhdUlFCZX/m9LGs9AxeW
	qkwLHeGzE9MCFz+ZDftBi3m5guOWe1REqvZD66H8tCwTRrR1rJDPfbMw==
X-Google-Smtp-Source: AGHT+IHZ6UEE7vqJIzNffO69BijgNnh6huZ6XpFUynVwOevLlfwN5ShT5ZL286eIOV8doCmHp815nA==
X-Received: by 2002:a05:651c:541:b0:36b:d9d2:7357 with SMTP id 38308e7fff4ca-377cacc5029mr9682641fa.1.1761090318969;
        Tue, 21 Oct 2025 16:45:18 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:17 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
Date: Wed, 22 Oct 2025 02:44:47 +0300
Message-ID: <20251021234450.2271279-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be properly described in the power domain provider driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SDM845 camera clock controller,
including IPE0/1 and BPS ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index cf60e8dd292a..fb313da7165b 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
 		.name = "ipe_1_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0

