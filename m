Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADAC191F91
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090332; cv=none; b=KY0bHpNEmxXVA9+KPoPNqB5BITqChQmtyW1CwHXgKqbadDLmg9qRA3crt+YbUk2uwWSGeolKUdlxkz5D2al7gWoZV9ErumwznNz08QZHBAlLe0t4xx53ZHYnt7s9tN9/cVJOwN7FIay2Onir0Uhju05ya1f8tr4WSStryLv7/Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090332; c=relaxed/simple;
	bh=+D54v2JDMNpOzup8Q59t4AiDpewDb4vKYcAKUx5e69A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/kgn40xJoNtcXAp1uW4Fa+2tNVreV+yiyFCfx7FU1O4F1Kv94eIVTEum+2qRiDred4x0hi48mwueWYiVRFTmXZ7Gm93W4b9cZkxwQH0lVnMK7hJmBvwAHb6T2cY860TcNjmtGL4V0TOXtb46pAbsV64stAson3qExQZY/fwysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjFvV3XB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjFvV3XB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so1070565e87.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090328; x=1761695128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM96pygorBRucimoNBQaRrFTvcrfZKw95DHRz/7W2Ho=;
        b=gjFvV3XB6QuqKujdYvhFJ+Afkt8VUh8Wt+cznjCGPDAAusBMzAcaFPRhQ3BM7AJv9p
         DuCf5V7ZsdtgsGSodb97bXknTNwZmj2NMiHc8E/Ur7Qgia3f+KoeGpw4wRKdCS5Bi+H4
         FaLfNvFc7vN9h1WeNlaUaZfSzImPt1MgU6JofV2FK7ydBXgWmaIjMRAOJg6n2j3JA38y
         vKcV2y9yYYZ5AENopnbHTETG+0MQsZyReCI14SmMmb+FJLEknIfjzZES1iI9ZCEz+nWx
         dqAnCTgLXTM0zOE3hCzxJpwBrsxlu2g9Gwuo8FjK2MT5u3U78Sa1ch09OuCi068DsQ+1
         9HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090328; x=1761695128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vM96pygorBRucimoNBQaRrFTvcrfZKw95DHRz/7W2Ho=;
        b=XuDOAwULl70UwDmaHyyiBjC1myONHW5Jdg0hMvaKEhY4fHcNAQiw4Qg7zGrfHFoe/4
         65lwliOmvYUX4K6p+KIwQZidtIfnl8QZ38ZNvtctsRm7bt0smjOH0zE8098OLXKxLMk8
         sKkaGaXdJulEBNItGcYDt6OQVkyMjkmo+YtP6yO0TwsLrFuhxF4vvK9qtk0UmLbVR2Qv
         OgWakEeLE8ffEutSbPe+c8GwQ4ZssiX7to/kADcWQyQJ4QQ2yPDxd8YIFru74ryqam9n
         n7lWT2SU/R+ZiJEv84/n3GtjqQ8CZcNCkmHsNmnbIHwM5ypJvMgq3JpTofPapvYXk/mO
         qmjw==
X-Forwarded-Encrypted: i=1; AJvYcCXIMYQfGv7hhF+nYFcv097clEmMPuX9+NJdHgzcvr1CWSrG8SrDXbS6j5t+bYa0fYGfhw0B2f2YlWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSc6wCzcu7j8TNnxFlmYoJ5Q8Pt0AfU778zxB1xUyW52wdOa+
	OwQKBELGUMeZBAywiIMMpUhzpqXHiHM2dZTguxxbQI3QQ6ry374cNlHpvL1io8yGH3g=
X-Gm-Gg: ASbGncsydgBeyYiEeioHUPF1VZ4W6xoEoLIAojIQsaNgOZ0rF6nHLNxAjmoxt9XJEFY
	qm67YkRB5kX8nyVnJ+myIJhO3ebpNKpA+OzEOCQ/1/r4JCi3p9Yur1c9hMz19biOo8GbyyvCbIQ
	GYArzHgVuBxgi5g4wFWWOa7t2IrnGk8/zrUq1Z4FGSrJf8KJ+yPKi3xacx4OTjNs6qo0QzBpVd5
	X+SSSJ27rrv3Rc3QKX9knFUWIJrcY/tDB1KiubELPsO5nHN7YMTKAkDyBxfgnUjbmNj9mTIqeJU
	/J7gf7OEG2gYegQs1M/lsWpBuo0EE7qcnbmIXVpejj9l1kDKwtfWXEkF9CDLCai1gG4CPH+mXBm
	IRbGDYivFaJLEmz4yv9ZSVvjVafZbYbK0tGX1Xuqk9ttBlGu3syxfvP1e9OXO1wYWParIGbdY8P
	TtKsRdPlq02J9jSGJ0vYiRxS7OjEwXBdzk6O1SEX7s0mI=
X-Google-Smtp-Source: AGHT+IELwd37Expap2tOy87KD2EnLyB9NP8Iub9YJAkkybMWoTVtsrS+mlavS5+uTLrM9jM06efhFA==
X-Received: by 2002:a05:6512:3d0d:b0:55f:433b:e766 with SMTP id 2adb3069b0e04-591ea41924cmr1054619e87.7.1761090328388;
        Tue, 21 Oct 2025 16:45:28 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:26 -0700 (PDT)
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
Subject: [PATCH v2 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
Date: Wed, 22 Oct 2025 02:44:50 +0300
Message-ID: <20251021234450.2271279-7-vladimir.zapolskiy@linaro.org>
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
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SM8450 camera clock controller,
including IPE, BPS and SBI ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8450.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4dd8be8cc988..ef8cf54d0eed 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2935,6 +2935,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2944,6 +2945,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2953,6 +2955,7 @@ static struct gdsc sbi_gdsc = {
 		.name = "sbi_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0

