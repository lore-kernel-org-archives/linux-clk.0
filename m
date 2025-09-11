Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1A202F93
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553151; cv=none; b=Q8Vfid41E75amcfula2cEyqyKW0Gnh2YVvw2/awWtZVZdL+QS7ujZAJGvTt/mFHEhTk+YZXK6awzNFhwkl9mqaQtYm5QF+k+Tfcet6GzIg/NJeCkWD96ccRr9kperolq0rjxQpq2QR4mNV+9eulyr/umke85vhoi3G3PdTiFAxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553151; c=relaxed/simple;
	bh=yikHLuTBZHzsxxFD44vU9yXO9sACUCrGHYpafZk7q7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UsIbiWvuOD6ici9dJTlBlhRkpPr3S07VHLbI0jXwi/PDyR/VGbcwyMGAnbt8pONM6W3dddp8FrZR+V0O3jPu1lxFotj1pgs/GVd2GqdU0YXt0BzoWaLTo2ALqpLALVBzREQPitk7sE5Wa1yGVkpWPRrfYYSN08aX93UGUOEzvSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFIup1l+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFIup1l+"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-56bde9c6543so20563e87.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 18:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553148; x=1758157948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkXb22++snaLsScjs5VjWE6H6Xz+K03us3zm7SPxwLs=;
        b=LFIup1l+iVIP5MU42WGT24zqX59N2M1V/7J2wDFlKGVtI1KnvZOaUxswMwLWNK1Cd9
         YUxoBrZiGQd/+0HSZr9m2b3FNlrHgErUjl29vBee825JJEKPblPVwBuOCoIthPK3iGTi
         B1J4P0H0j0lwpDbarNSjHF5Pb61earACVESmPj2Uf5lhyuUlLlz9yKB5B5EV72+bMrYm
         wQRx0hRZSJ1jMbKoaINykk6vcFy2UzAOPHqc/68PsFFk2W3rEm10/nzZpx+sFJWFClEE
         DBg2dvE95tXHvYG3h2UzBXwSAkTLjcowhuUChXtYhU65PoB8qjn5y5vADx2Z9QivOSzB
         O9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553148; x=1758157948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkXb22++snaLsScjs5VjWE6H6Xz+K03us3zm7SPxwLs=;
        b=P5TnewIx4kAZ1R7KcFHJ9MyKDCSPV+BEW9vX+xG5jBmM8nuG9szk1IG7vOssHZfAyy
         kud67Rkksqrw1v8LX2ayc4jQYGggPvSkHIOVfGkzFpgQOwlz534ebvXHajoLRKY1Tnjj
         0/mqrW2cAxNl5M5iD6en6BFI43DMEJB4lA6qks7mBIOcY1O01liOUkCnagnyYWKLLO6r
         O1EQXwRzgghUKAADkEuH9FdkutvbkiAATnXT8Ll+SxhMnlUfKZPQGKNxlMKWOir6ojE8
         Ij7J6qlJwUzma1w/X841AwP3UBwMXJo1hYUOXR0aERQYq8Gw7rR67YaDnh8N0fnrPZd0
         Segg==
X-Forwarded-Encrypted: i=1; AJvYcCVVZCJukXAXCQ7nyWAJiOlljXSgc9S/OFFT4pfNeZbsN0UPa/lonwBFO7uAU/SZ0KXNzgEhxEIiTaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5Dpvq6Z/UMOXU6WUAG1tXt7iI8jHMFMpR/LDEx0s0JAwaLJe
	y9hqXRQZhHSetBKSWVTRlESL4J3BpvJzpdzYPnZ6J+6cr302GpCF8z4+SWIh1tjovk0=
X-Gm-Gg: ASbGncuwk53cxE7l9I8lFUceC42s0VbshfmP0w/KrMCC0oE1+qsYwtdM0v1tlwQeof2
	YFSBrHaroK6YPzsQNLEelZrbzasoszpk4flvjlnLdLos2YJq9SCrGdHxFBCGa13M4/ogKASj94Z
	9sHOFfJelCYKucXK7xEiWflPflxJeA5LFy1iKl68Ah60RZOrH5SBxd/3kCUUDipl8HqxPDBxlkW
	VvxkouH1eQtiXEWqIABNWawVQ3B74tmufMSbELIeyQaX55iivkK1FE3BkqJfo7Mfq27wuHvF4OA
	XNc/hjqRZNY3YzleLwXwT20jl+tZnKm4mwJ/K/dt4qGKlSOXsnFY5oUU0IyO4eXCWIGIDumQavv
	MVKHZMFUqYVZbTtbzNDM3ISIRSGapCPJW4vhSFxpGCshcz722Pm+rLQRNRp0p2ZYpvQTV6+c=
X-Google-Smtp-Source: AGHT+IFD2S7dwFeq/Dqvy0o91A34wdRf1wybrUzhLKVCjtQaIJs7Lw9qhiHJ6HAHPOntjoMO4xKKmA==
X-Received: by 2002:a05:6512:3a86:b0:55f:6a5e:3699 with SMTP id 2adb3069b0e04-56260d4669amr2935780e87.3.1757553148111;
        Wed, 10 Sep 2025 18:12:28 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:27 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
Date: Thu, 11 Sep 2025 04:12:17 +0300
Message-ID: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
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
provided by the SM8250 camera clock controller, and it should include
IPE, BPS and SBI ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 6da89c49ba3d..c95a00628630 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2213,6 +2213,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2222,6 +2223,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2231,6 +2233,7 @@ static struct gdsc sbi_gdsc = {
 		.name = "sbi_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0

