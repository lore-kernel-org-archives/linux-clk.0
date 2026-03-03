Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CDA33D6ED
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538992; cv=none; b=GhdSWoARdwqskA9rZkgYpfoFe3bZc0A+Vkwwa7lv+fcJRTfgHrpSyeUwNje6m08wfRh01/57rtY1/dIOdz5WHNLLcjU589PUzXuIzDVFiVJeH/AjuKZcVf6JnvOeo5UMaYytDdywnXeeKmrBYpAuu7sAUeR0Q2Ot/KqRlaV/yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538992; c=relaxed/simple;
	bh=Nv2zMUlIInFRssnbcBMjdZHlwTtFzLVVfa2D6rbgcMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tJm/rN9p+T+kZzUiyPPUm4DGNpURH/mosVnoFc7cwTC1iyh4xBzYlX55bbHUJdjoTyIk/8/Xj68xstm5Bw4Kam7XoeAqP/GSRvdZ31vn+XMmEgyCxqRbLU6wkrU9h6Co9LN+10FpNjQwBKfdCY3vjmNbS+VHDMwn+fG47DNBV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry4fdJzo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry4fdJzo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c648bc907ebso3558040a12.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772538990; x=1773143790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/1rtiSmfl+A3f+MiA/i6+hGD+GQdcF9vqBRx2vgd6A=;
        b=Ry4fdJzoxGEYvoRAUbQn9Gwprd+zNwft8jNSQcdI9PJWPoiWPsRcgrgArR9F2WEVPu
         YbwYsthA6WtWjIgAdIUdyhTPRYxqC1CiZ1x8mThyjazCW5gBjH6yz2XMtOEOVZkq/fgi
         iQmGjVWB04AIdLEef15Jvc6L7+x/Hyn25+KOpNCwLhIe9u3K/CIzvBQ7tFuMc8Q6q30k
         F+d+1Hp36FVtfRVD9SmW5gp+b4YducwJ13HZP4ihINosTEXgRgGsn69uTP4ozcfMS9Ei
         cZe8hni9z1K6Du0H7Ah2Mok5w0gWiWgVGRGZhRhi2dbNVLBQT7AoEHbrbJ3o56sTpOyo
         ogyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772538990; x=1773143790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/1rtiSmfl+A3f+MiA/i6+hGD+GQdcF9vqBRx2vgd6A=;
        b=UVyXIjaVLPDQM4B5VSAq4uQPl2jaMOMmL3qTLU4nKX8gaoqAOueKOA1kZ34gx1oCEH
         WKtR7Pw+Navj3s7qdHL3JmFDSia1oSpFcs927VZMTFofZpM31LAwwDuWZcr1eXSw+vFf
         rnNABW0JQRqGk2Rr8Y+xTH9u+JfVcUcH149bXtzi3TPNCLddTROXxpmKXUtj+lagMKWh
         DBV8hRU56OvA3Nhw1PCi0ICThtrRzvk4+G3Ms50cKt78KPrPLx6EBYtP5moYgSDgAZiD
         MJilQ+najnJRN2V4BI2AO046n6Xl1mNnk8genQCsQyv7SPdmd0/4Cv94tFra9Tm8cyx3
         LVTg==
X-Forwarded-Encrypted: i=1; AJvYcCWuhrv6eaNOWcQvpkmWFL/R8wV3gKEBsdUVm0ILRM1Zq2pqlOQ1iEvZ4p24MRIh7+65EOKngdy4Tew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TYK37yh8TBIWF8TJ5upmm7v/4Ha+NYuvYozv8LSMtmsgqnRj
	+4sXZHt71B+XLEmfjV/idkUx2tmKAwWTQMZD+/OH2yIx7wJlYY2y8xW+
X-Gm-Gg: ATEYQzz+1xZCoVnkDZmvakaXfNlYcZQBiOlzWispVxCTQC/1nBCED0MdfOfXFRbd9VD
	QZafQ1LEfb9mmcffuhjLvXd2ihIJRtV4moCj0s0gs9RTX7T7XUUImHWRbEmqy7DfI6YnVwTho4X
	8nRs/iScyNPfp0EvU+seW84DWNwoLO7RbUVm880JB1Y01Kd3XqKsbcPqKgT59LGyJaLaSm1LAfC
	kygTZslKBOVPhAkEhtN2rEhiQP8/u0L37z8vdk6BVsvDn2KrgUbeSTA+jpDGpJWmPlOmAHroQO2
	fNlz5LVZurnfHj+i8oJMxZtVSO6AQvcUXIx92AVme9ykLUUlJRCSWPmTU9HT4M5oNbTPzjwnxV/
	qJCrBLLGHvjJpCW8hy+Lx7tW0gZsLAlxfJ7+7EHzcWSxnOw4keD8J7NYomgnunxR2tdf65Z48vq
	Ujyx22VLxHucgOe9fsYA==
X-Received: by 2002:a17:903:32ca:b0:2ae:6364:e6dd with SMTP id d9443c01a7336-2ae63650d05mr9679065ad.7.1772538990113;
        Tue, 03 Mar 2026 03:56:30 -0800 (PST)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5dbac7sm227765195ad.37.2026.03.03.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 03:56:29 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
Date: Tue,  3 Mar 2026 19:55:50 +0800
Message-ID: <20260303115550.9279-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: White Lewis <liu224806@gmail.com>

The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
byte_intf_clk, the rate-change propagates through the divider up to the
parent PLL (byte_clk_src), halving the byte clock rate.

A simiar issue had been also encountered on SM8750.
b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").

Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
so that clk_set_rate() on the divider adjusts only the divider ratio,
leaving the parent PLL untouched.

Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
Signed-off-by: White Lewis <liu224806@gmail.com>
[pengyu: reword]
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 5903a759d..e91dfed0f 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -1160,7 +1160,6 @@ static struct clk_regmap_div disp0_cc_mdss_byte0_div_clk_src = {
 			&disp0_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -1175,7 +1174,6 @@ static struct clk_regmap_div disp1_cc_mdss_byte0_div_clk_src = {
 			&disp1_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -1190,7 +1188,6 @@ static struct clk_regmap_div disp0_cc_mdss_byte1_div_clk_src = {
 			&disp0_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -1205,7 +1202,6 @@ static struct clk_regmap_div disp1_cc_mdss_byte1_div_clk_src = {
 			&disp1_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
-- 
2.53.0

