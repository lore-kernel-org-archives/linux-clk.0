Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87301EA7CC
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090320; cv=none; b=ddmOnsygYbNkyF/4yRRwEPBcPzUV9C4XvIWygDpmC2psNDIfLux1ngBncsuGz0/p4U8xjb3Hjo0jSeNV+8MWuJZNQgw/5o7ZxZge/veNSuNh7Xc11rQuC8tqPETwc1PWNxfK8rnHzHPcGibFyG1kQaeekpBd1aLXBkl+4ecz9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090320; c=relaxed/simple;
	bh=3wFwd/IOKK/nT0u1+epSpc009hwiP3Bw8sQXcHJSm6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crCou24ecMnkAU+3vRcJoznU0FxZ+hvcXkP5ifvCFzI3FHfEJaaiSYuX6/jeJv8tT61qodKYG2L5LpRh68ta87r7aeN4c6LYWXc51ZATobc9ZvbR4/AkbCKNnVa9rjlSWltwwT2X88YPJuYtFXhFF6memsjFVi7XigtvYnhezJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1mKFefM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1mKFefM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5848a2b3c8aso483854e87.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090317; x=1761695117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hwUWlf6hwZMFmIwJ/dVYsY0EEoapFsLNMfxUgFYeLc=;
        b=D1mKFefMwODr28LrpU8ak0CCM/QM5Fq+yC7MU4gfw6Z2uNEpLaGmQQIvx5ZN/jHLhY
         ViY3+31R3G6eAyOOMSjXQGZRgMfqIyYHueZ5ynBCPIf7baJQFrHZUVI1WijGVvXKFQvS
         AhWWZWyRYF8tBBxU2ck23BPh5IX0Tf2RDasmA8M5o3oq9Gn08y1Cns7xTDiex7cWa3xA
         4pJKF5bMFAsuBHjhDvUBOPhEPA1oip3BY2C3oExzHiAwRxkW1wGpItM+6jF3nDgLChXV
         dJy4Vjvx9ZRn6qYcVaSTGn+P9uF14Oo2qe1Nv7lHWB93BHFvG3Mge6u+QC++RlWc522j
         hodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090317; x=1761695117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hwUWlf6hwZMFmIwJ/dVYsY0EEoapFsLNMfxUgFYeLc=;
        b=jy9tPmixZAVqxtuBCZ4AbCyW1shx62N1Q06TQnS0DwUbKYJbb4J/lZI0WLTQbSzkKe
         hODE7K4zJhRJ8sj/uRtcChG7KkvAhE0emMsLVem9senK3y7lbGyx0kNiO9dssKqmban3
         f2q+uZkrfovv+zn7iws+URhh0/EC+Kblt72AAHTr4CiHcwgnjAcybOakplCCU59Zq+ZU
         9oTAHQ/CzCZ2FRNeKi0u63ctrucQ9/F2gjhCBc+kfDjOB2D+r7+lzVUxzOrnRWg8MnjA
         py4MyjU800u9stlALKy3WmIFxZnyuP/yQZmGnyauGogE5acvOIdLDDRpI2bZbHA+yZ+N
         JgMw==
X-Forwarded-Encrypted: i=1; AJvYcCWaD0+ouSsDSVMDNRXYGgu7OJv0Nvb6fz/EUuRm1yFZQxks40pgM4hiYZQb2+gyxNpqPnlAxnGxv6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKaxKflsBAgUrBZ83Q/XSNB4lhbzJj6rm0KwTM72DL7u432Xyq
	39A9IW5vbfdauh+arka9fPhvIVX7qOyEBlDt55c2j3SP5zkPb/64bcS8OnIKX29BQdI=
X-Gm-Gg: ASbGncu0cCjvvfEW2tDvdhH5exkdy5yVaR28nNdwZvVFKlJ12E6zksVpgrhu4SSffZE
	fV6mBevH6/paOhF2IazoRHGFpH587xcNvADhoOMo2bY/1gZ0d8KMiOAcKUS7A5DKxVgUzX6kn5X
	VmY8mQOQE+w/pS1ZaFYUR2475PdfuaZwCnyhSR/zU0Q/cttv8174uJX7tZyFuiIVvR99SKVr1/0
	qd0qX/mE9/mSRlc9PPo6Gl1Dm/kF2biC4SaanQffRGJYX5GNadFhpxZVtTpxror5Fo+FVGOl9Eh
	1mxe6pcXD5PxrQWOU0roGaszxqR2b8VeuDIqQtJi1z5ZoDVjKQmMq6Ghw4UZevRyRhC3ipqTxU2
	k/ZSQcxOfyIXDe9SkXId/GGnhmjn9UrcxkM/FEtOVE9qxICnpQi9AWol0db6OLZti5SqUUdoBvF
	d/kuUVqWXcnI6Wc6Kj+oD2ogcaqNFrT4mFjiHY0r9wqxc3bHhu26ZDrA==
X-Google-Smtp-Source: AGHT+IF70NzTSV/m/vOE0VXr5Z0HxBjw5fMsz8qZC5vlDITGKte/9FFvTIZQ9irU3Pd4JmgKuKr9pQ==
X-Received: by 2002:a05:6512:a90:b0:57a:d649:9702 with SMTP id 2adb3069b0e04-591ea2eef89mr953503e87.1.1761090316911;
        Tue, 21 Oct 2025 16:45:16 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:16 -0700 (PDT)
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
Subject: [PATCH v2 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
Date: Wed, 22 Oct 2025 02:44:46 +0300
Message-ID: <20251021234450.2271279-3-vladimir.zapolskiy@linaro.org>
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
all other GDSC power domains provided by the SM6350 camera clock controller
to enforce a correct sequence of enabling and disabling power domains by
the consumers, this fixes the CAMCC as a supplier of power domains to CAMSS
IP and its driver.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 8aac97d29ce3..6c272f7b0721 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
 	.en_rest_wait_val = 0x2,
@@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_1_gdsc = {
@@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_2_gdsc = {
@@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc = {
 		.name = "ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc titan_top_gdsc = {
-- 
2.49.0

