Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD504241667
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090319; cv=none; b=ej7U7wTj2rTxbyMHE+Bj/QD71iWPs/S28hGO74emm5QzxD7Uk38He9k5z3aPuXgn3eqgLIwgHJ2h6vfAChP/o7blzjc2bCCDc8NUf+gcjqHUz4KaFQ/01k20uK8qb7Z6MPIOYmNd/rz3YqQAJSvVqHyRgoHPOTJILXwvbdFEXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090319; c=relaxed/simple;
	bh=hqaI36cffQ+N6H5vkclCuKJLO/NutKEKE4TGLUv1C68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6cl7Hu06Db8Vs7CCx1ALzxFO1zaihTJZEqC66+AfNHWKnWC6A4BsCvzsbqu5s8cMuhyPUIYjoWvqGnopqQVyCAXeAGRz2pKVWJYDDdcSojBaAw2J4o5lU4oaNTb0m+vsshKGMpvcukSHSpTslc6jfw14hglHixmPhWxzPX7/Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XC8+zj5P; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XC8+zj5P"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so1070527e87.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090315; x=1761695115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+9JcimR1oPxJJ5dxJgmHpCzzLYj8g4StfP1y+xgNJ8=;
        b=XC8+zj5Px7xwROt2cqocLa6a3N+z98eJBXIP2m9Tka4wCA7dqGZZXIGXJaYiW2PXma
         TmNoJ/t/nOFHgragySFnewi7PaH+80NIxl5A0GP9fOXhFyKbaXVnLJ8jsl/5zRNacnfX
         zJ0AkQxLGAYhVDs2BCc6Ck3tN5KMslnOL0l0vM0+nn13hTYet5vQABTFZs6aNsaDGp7y
         rKYP2xAF9+B4gLjNlHQkmLxgSpB6yO7GDXKP5hVjkIy03670rJ+OaZcTK/0esG7nimXi
         XhmLUOPEr9YWsFaMkXWJE4V7X5wgP95dcMkf5BJAnfS61zTuVQEjdz489RL/eQFFJoto
         2OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090315; x=1761695115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+9JcimR1oPxJJ5dxJgmHpCzzLYj8g4StfP1y+xgNJ8=;
        b=H8eLUjzeuLL39dfVwtTyeQijLUjN5XifflY3l7wt+r5NFObKk9r4l0XONVnJni9l3r
         T7SVRzXUofKhVOb9E5IGlXXavq8ZVtvs0PExgXt1T9pbUA3XMGKfakduGLjHtxoDgSzE
         WvvhGWu7XF8pOAo0DB+cqNwjs0JP4RfF+YqbG2GmRRgbu76MQ72Y9wYZNCJxMCFcJiUB
         WtlgqbWCS74eYfSZAYQVbydgYPS+lEElOceS9QqwpKcTVwqkK3rNtMmUDqq3kT/XsFSR
         +8bY7f1hgAx+hV8pelC124kZloWONiOMIYwk9YvDTslOTt3GaozhOIW2G/UOhf8lo4Iy
         Ejhg==
X-Forwarded-Encrypted: i=1; AJvYcCVM2rminRK84mMaB1OJr+9fX0jveEmITCeEmU9TFZl1yyoh3UymqbaRAIPClVwY0RUSSjhFYRHWmWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8UnM0h6+LtvDeUzyhLjwBbcu0eBI6aQeF4zUyNc5CMCOco0O
	hp4PUHOQbKzy4urgDWJ75Qe87F+k4pnW65F7tSGBSncqAu6ALGjPkd3/nWtM479csig=
X-Gm-Gg: ASbGncsP82fclaHbqyMaredAbBzAlCK9Aegkt1V2ArlISUifAsnQ8YRiB4caAtmbHDM
	hexeM8h+BpizbPQcEL1YObnQHVPbXzj1MSlqDJEmzxv6ZNuBV2G6SLX1goH9i4rB7h3lskJ5V24
	+5G9zKRSLlLFjL5f4FEFsOm/13GMMMjRNvA9Wds/sDwGwJ94mF5tH9dQcgEwe5JQ2eCz1P3gzrP
	5uiFazFe4/z8KKbSBcbUSO0oDmOP+lfeNPndn3J0cGBzaJgtk6qylIh9fmABDNMRnwZ8EZeI0TI
	X/HcO/4dbzHPFrQj4KfKX3392Z+JWaPnS9OsonnuIcpWq3vrn7Cd3gqYKDUbXZ8niZtnFckQ9R7
	NKLsznvFpa1LpJDeLh/+o2rUBmJqmxTUx6HJ3lZgOWhNmEJHEChU0NQvvy40pydm6264jsIpeiN
	MM0IdLkrUzuJ7UGORxJHXjh7AJmvbRGl7l1ie+PDW5FuY=
X-Google-Smtp-Source: AGHT+IFkvlrZLjp7BFte2VhiXhkgsw0VA7kp2VSuDg5zj+7/4vxFKrYdm1LLOph8TLlb4fL/pkHuTg==
X-Received: by 2002:a05:6512:3b8b:b0:57d:9bd4:58d5 with SMTP id 2adb3069b0e04-591ea31581dmr1149233e87.5.1761090314813;
        Tue, 21 Oct 2025 16:45:14 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:14 -0700 (PDT)
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
Subject: [PATCH v2 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
Date: Wed, 22 Oct 2025 02:44:45 +0300
Message-ID: <20251021234450.2271279-2-vladimir.zapolskiy@linaro.org>
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
all other GDSC power domains provided by the SM8550 camera clock controller
to enforce a correct sequence of enabling and disabling power domains by
the consumers, this fixes the CAMCC as a supplier of power domains to CAMSS
IP and its driver.

Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 63aed9e4c362..b8ece8a57a8a 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
 	},
 };
 
+static struct gdsc cam_cc_titan_top_gdsc;
+
 static struct gdsc cam_cc_bps_gdsc = {
 	.gdscr = 0x10004,
 	.en_rest_wait_val = 0x2,
@@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
 		.name = "cam_cc_bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
 		.name = "cam_cc_ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
 		.name = "cam_cc_sbi_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
 		.name = "cam_cc_sfe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
 		.name = "cam_cc_sfe_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.49.0

