Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F121B4235
	for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165527; cv=none; b=hMAw7ZnrnPMgtePx+3nBXUrZYRjfnjUa5x1DEqXWXo0ZIKuhutGHm54xtVoD1F32OAo7AEvh4u3H53ElUMUx3FPv4heuseTWLyzVK02Y/D5RD4QgjVuKAtLeV4LZhI3Sg5vsYdY95BeQ4vLIN2tuNCxURMPk1OgLyAia6CRbYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165527; c=relaxed/simple;
	bh=BA64t5SYSYkOLxkZWrGOQjE+0SMxTI7sjqP+S2gmT/g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HcLfMdaw1zGt1o9Mc5XxRM3n3jrtlkWLcom8JYv5ssOrGywHEvyRG1ZynLth3dpbt5GyG/UFZujf0Anwq/7IcxYTgjhnrGLyHfbZUL4X6H1XT+SQ+FiYe1QE/b7NDliYN6Bz3uQdyRMThqeUcSofVC3vMJlehX6R7c45q4M9UF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJNTIU9t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJNTIU9t"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385d851e7c3so440138f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 07:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738165524; x=1738770324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xwoQGzhrBwYofIiNp2Mcwgnk/Tu/TxGj4txKCeU0uI=;
        b=fJNTIU9tqxmyBQJH+mPdw7G6dm62vB3MFhPEHprnARB1NZiMVPuHU0SMcyOkp5+sfw
         K+hwqlHXD9y+J6G89Jd9FU457KVx2PPHOxpLrkLt0fgJ1IdGwqKgg26Wua6cvrMJYD6x
         NqLckVTIr+FojmhezjrorrL0J795IZ+TPYO8JypnZWycBdhCOziZo+y9Vzwfjv78WmQN
         xqtg0HugT29BWA5GKqZAHVMaXnTWkkBOeaS6eohDvr2Kmb+wv8F9Z13QQp72MlBh663w
         jPCuwweHSNfIj+7T9osw7SIoX70pbbLPgp+UMSc7u7pmjoQ3Hzml0Bq6GGlt/rchzkFZ
         j3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165524; x=1738770324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xwoQGzhrBwYofIiNp2Mcwgnk/Tu/TxGj4txKCeU0uI=;
        b=Q8Up/xCiWAyxOpu84zwSNSn0jLmaLN8o2rJNfN53NCrGWGidBo/Z0M5gcCU06ZrZQ8
         tdglNu7jHE769yI3l+lm1qkwTSAKdg3nxlWn7i7u9gKnDCgFqxu7ajTXu8+6Ey/VLGmw
         ELv+oECGNFLjURDqtpIJRs/amoLvvN/txbyfg5mbKFF+qzKTiiKsHz2yHHiyyD1EHT74
         oqQng8kvG3A4VhEkflBhi2J1GwVfiNySeQBHb5jTn0fJ3ZcknEashxnSoz6BZdFfiqXA
         MLPnrepRa+v7bmx6g0j6p1P3ZVCAolSd4NFEi4P4axfOE+ZKtDiuHQp7iuV27y1SXUIB
         zjgg==
X-Forwarded-Encrypted: i=1; AJvYcCUns4GpR5mu37T1L7BkzstedkBNvCs/+z0lRNSJ4kuNWV08KSEHY50slFO6hIWq3CRguw957q8gnic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwLU85STIQZvnk03jP8DJHOoHQnJwEy3549rwvsLb/v89dCQu
	3OOoxtCHRCDyf3BOJFunnququOP4PWTzcQpZ4QWAPtYiMVFtkv9HYbBYkQow5P8=
X-Gm-Gg: ASbGncsdVKgXrMx1/pUNm91GZY486781cpjto7F0XlzCa1TYrpRaaHaMeCoBfVFn0yJ
	UuEzjdIZpSrMm56eYkXcZZX8CGK+vEWSS8dl4JL45GeX3eAMlgKTW9umUoPE6qQD7Hvr13jiI95
	Z3uLKInAz7djD9aXUQPydOpPwuq1OvfY5cByUn5a/MFFSw+VLxCxzY/RlsHmm/B6QaV1fWnQh7v
	+8p/q0p1jb9YsJZ2gvDl040s2WLtDkMQDIdScM1wwF/5eDR1fQhlJ7ltLzuHRjxNx4zJ2LYEaHq
	EABMCfXkU8KwEiQGucLr4uLzuWiraSqFnXA/IGk=
X-Google-Smtp-Source: AGHT+IEk6tZpuUhcKuvgEnJpRzTURe8077PPeQePy3IFm2+dKtAmJ5+B9AOZVnD3MmFn3EOLwAt/aA==
X-Received: by 2002:a05:6000:2a7:b0:38a:69a9:af95 with SMTP id ffacd0b85a97d-38c51b5eef7mr1334149f8f.7.1738165523755;
        Wed, 29 Jan 2025 07:45:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb040sm17528115f8f.67.2025.01.29.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:45:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent
Date: Wed, 29 Jan 2025 16:45:19 +0100
Message-ID: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
the rates, because this messes up entire clock hierarchy when setting
clock rates in MSM DSI driver.

The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
via dev_pm_opp_set_rate() on byte clock and then sets individual clock
rates, like pixel and byte_intf clocks, to proper frequencies.  Having
CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
and align with SM8550 and SM8650.

Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for v6.14-rcX.
---
 drivers/clk/qcom/dispcc-sm8750.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 0358dff91da5..e9bca179998b 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -827,7 +827,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -842,7 +841,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
-- 
2.43.0

