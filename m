Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973918C92C
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921076; cv=none; b=qSkl2vciG5aW5nsKhO7/bPAA/GxE8BwCRM+D1dfhK9k8nYs/jKQsyhcmZEtfMSVadx7RrIh+DHfF5NzH03BnM+hu/O0RbYNGl72OKkUNcB20p+x7mWj3R+BLk2EG5XP1XNlVXedCXh9xcAkSVkVYdFcooeHOwm8GTu15GBekp1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921076; c=relaxed/simple;
	bh=YXPu+02a3iAoSDGi0S+a+LddESyhQMLo5+sL2vOPM+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DHTguMykGuFXNc5Guwy1WK2+/O3RVXo8xYRgt604odIF7LCEavvBc5VBT5/6U10eDWPv9jBGBdSynOHA0906vIit0RqeNRmCAzcyrMKb/Rv38pjkAqa8Yw0nLHqKCDOVL3IWnJ2JIMO9dTDiAU+EN3ZUQqybofVeKlKXnc11vxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wCAGlsQ5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wCAGlsQ5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428e1915e18so3258295e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724921072; x=1725525872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQjRV8KDG/Lpcqg2hQHcveqFn+Rg4OZ0FjrZ9YRvTig=;
        b=wCAGlsQ5TbI6XcBICYe8oBPUC7vNKMp5htldl8aPN3rsQ3Eh/2qgKlYFBLEV9//0bX
         RvThXrJNS8vMeUd6ebouxIZvGQcL0lJNNUsnA8gQK5ksEHOx9eohFmgZiqlVefgiM3FE
         6X9lod+8xnqlu6lU5+GuIMNIiLlGagrMxpQXyZIhk3dEVgUkjHT5Bmv66MtM7QBdoxbs
         4KO7xC+gKvrLhVLFrdCjv3Mrhk75i2ws7Hh2XJ/0mjWoRHKVDVNUeJT5E8yPyi4YE8CA
         0wJOkzDzS1FkCnItPw/jUpAQzGNHEmclcEGRULhH76TjSUR1WfZnenWjT4mMA1jJj6r2
         tKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921072; x=1725525872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQjRV8KDG/Lpcqg2hQHcveqFn+Rg4OZ0FjrZ9YRvTig=;
        b=uvdxb3USEjO47KT0g6lCK542HcUE6T7QpJlou8B6Mw9zSGjKuS0MiNp0AW8hAEqVy1
         E1i3qQnA2tnuRUoLVCFd2rN65bpi3FNdztz9uAhC3hrMu1m+mQaeOlcfu9Ll4VT6Srvc
         lvDAjKJSzGHngKUWyAFRJ+1p3d9makcNFQfGc881YFAqpBidXOF5JyFcSCVBJA4hZ4z9
         8z71czkNvpfnniv/eEXD3iqFt/Q62jKRUiFiG7oviXyO9ducBostZH54lZJBisbgrHz7
         R3za1A3+dB5ZLGgid9o2GjQPgdrBKHbp+9wUxsZO12Em12meS0uYvbW2J0ERwRLaaJcV
         22Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVebkslZkLoOijhCq3YQWzhPEvQkeefqRerL5rmZIFF+QSisEK49Z3cBdygI8bb+rlA9NndJH+7CGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4zlJWQUbVaSq4p6vrqS6u74FS7k4i8sicZArb1LvWV4M2VDQE
	4/QHO4jSsqubA/jrJ3LjMaPLeeTTuzM9PcqS6EKT/GwG59/lyYsxSHZ92sn0+6c=
X-Google-Smtp-Source: AGHT+IG1+aHrBKmftPD5hD1/Gw1QzmryaaDfQm+O0lrXVsW+w70Wpwoq7GzWBif5V6emk9i+uEwT9g==
X-Received: by 2002:a05:600c:3b89:b0:426:6688:2421 with SMTP id 5b1f17b1804b1-42bb02ee44amr15226835e9.11.1724921071907;
        Thu, 29 Aug 2024 01:44:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee413a8sm835489f8f.6.2024.08.29.01.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:44:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Aug 2024 10:44:30 +0200
Subject: [PATCH] clk: qcom: gcc-sm8650: Don't use shared clk_ops for QUPs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-topic-sm8650-upstream-fix-qup-clk-rcg-shared-v1-1-7ecdbc672187@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO000GYC/x2N0QqDMAwAf0XyvEAtc7T7lbGHLkYNm9olKoL47
 yt7PDjuDjBWYYN7dYDyJibzVKC+VEBDmnpGaQuDd/7qgo+4zFkIbQy3xuGabVFOI3ay43fNSJ8
 3KvVoQ1JusXMx1BSb8GKCkszKxfzvHs/z/AGZy3oQfgAAAA==
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9677;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YXPu+02a3iAoSDGi0S+a+LddESyhQMLo5+sL2vOPM+k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm0DTuzl+wC/7w2kEgdeX7NvE2rL//wlu+ELjR0C7s
 Xmx+fC2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZtA07gAKCRB33NvayMhJ0YUGEA
 C4hh1F76HXdf57QROJWnIZ734Rygpzt/+p6q61oQ63ZG63+HaEFoJi3f8CXtQAYNJZm3W+eNgzYs5b
 oSFi2dO0a+2WY5tKabygJC9Heq4WRis4UqqDS+lueK8FihoI2fTKmLNjYWI3Hgic7CbaWIrUKvg+h8
 TxolPTsE4sVbzPJBUK5phMyozdmapmkPmKthQ1c6qjwHSDDS0diOx1+M4jSHRixi8wgl3SuYzkGa48
 IrzBE9WtJXiVtu04t45Fd91ZzUFklTg7iwj3j2nBs+e7bK/1nLtl9mtmdCk+DxobJG1bmTm4vk0IkL
 b2utCVDhfuanRNp272CqlbXrHKmSTa51/L/7pcOuNU868nlsgydTZdcztk/VqlLBeXjS1Ydcxz2t/0
 N2PvBH3ckcXzw5ZaUUT2ojpl1oZH5if2r7oN01XzpozDqNjzpI2NI6+z3wbSHoem33aVctZgcWU8VX
 mgznb3tRxGuwLL9Eig2IVfwFOKWNFcNPa1CIstnvrPaBL4fFFn4WUJ+IOAySDylh96otfGT6UkQUre
 bKietVAfkvFeyHUxlErkJzHvY/USnEixIpIcY2D9Gd0QQALyf6ue9OqJPpVSyyc9JYAfR8oz3o7qPk
 J+hgSy7o5x+354SLPMI8yGk79oXXs+m8uzIWrUZACDnVkUkw+Bk/8wCtuJ6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QUPs aren't shared in a way that requires parking the RCG at an
always on parent in case some other entity turns on the clk. The
hardware is capable of setting a new frequency itself with the DFS mode,
so parking is unnecessary. Furthermore, there aren't any GDSCs for these
devices, so there isn't a possibility of the GDSC turning on the clks
for housekeeping purposes.

Like for the SM8550 GCC QUP clocks at [1], do not use shared clk_ops for QUPs.

[1] https://lore.kernel.org/all/20240827231237.1014813-3-swboyd@chromium.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 56 +++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9bc19bea0c97..fd9d6544bdd5 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -713,7 +713,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s0_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -728,7 +728,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s1_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -743,7 +743,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s2_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -758,7 +758,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s3_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -773,7 +773,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s4_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -788,7 +788,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s5_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -803,7 +803,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s6_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -818,7 +818,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s7_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -833,7 +833,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s8_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -848,7 +848,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s9_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -863,7 +863,7 @@ static struct clk_init_data gcc_qupv3_wrap1_qspi_ref_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_qspi_ref_clk_src = {
@@ -899,7 +899,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -916,7 +916,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -948,7 +948,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -980,7 +980,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -997,7 +997,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -1014,7 +1014,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -1031,7 +1031,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
@@ -1059,7 +1059,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_ibi_ctrl_0_clk_src = {
 		.parent_data = gcc_parent_data_2,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -1068,7 +1068,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
@@ -1085,7 +1085,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
@@ -1102,7 +1102,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
@@ -1119,7 +1119,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
@@ -1136,7 +1136,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
@@ -1153,7 +1153,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
@@ -1186,7 +1186,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_10,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_10),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
@@ -1203,7 +1203,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
@@ -1226,7 +1226,7 @@ static struct clk_init_data gcc_qupv3_wrap3_qspi_ref_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap3_qspi_ref_clk_src = {

---
base-commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
change-id: 20240829-topic-sm8650-upstream-fix-qup-clk-rcg-shared-f0981c958bec

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

