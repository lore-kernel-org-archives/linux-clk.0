Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9318C26
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090326; cv=none; b=OTC7S7FeO6/Ic+wOfvEHiN1nIpTrUoR6oDOLlAX98jL+qCUoFB7RCd+e4NlolH1SdpZVhoUliz7Jaz/mp8hV06L2dVuNlp9SLjX0g4ulSQ+oQc0nLH5m/XXkMIdSVAQ6YNpMtytllZvfRWk3yR4K4aNwx7aBDLigcDXhmxrz69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090326; c=relaxed/simple;
	bh=ofHh9iwxqIBMn0+3P529ifVIm8zZTaBNfZEA/bNRAGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGRGMu6R01m9KYIDMTrG5LSoq/sEH4UrdhOnNk+NUrj5PILlPB/gK+iUeFsA2zhVXJfb+k/DFujj37X1Mtd/NoEzAoAA2PXyPpEcHqVdEHSbqSDuMdxkJSKoi1Jc0d3OCsOb3MCnepI0CPA6CnJowrmIRy5flb+HzzR0qfHQ/Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIpyDVU4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIpyDVU4"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57bd7f0e2daso1036102e87.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090322; x=1761695122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KSsMwlTgO9653tXVS3ZA9JO3NhLM1mffwzVD4cK31c=;
        b=iIpyDVU4fIOX2YnNix8wO2NtS5kuzTZqkd21u14yV2osR/tjUiRIUxt/h61rzM7wCr
         dtdqJpkwKx1IaIF4/D5kkzN31L+ihMeRIiZyO8y+r9YkiBzCXuYxRlOHBwAUyZtbLaym
         0dHVwsbRxpo8UVz9JF6/FdjmfL0aEllZvm0+Ho8ND/PRSFOjNiuLbWffkHydgW8qm1FB
         6UpH88Tnfd8Ywm46RjfJXARMSk/JZI8Qb3D63qlH85DAWSab46i+mFuS2lvOaM7i6Hwb
         quwavEGzBq+bZMRNX2fVxABaA5GwhABLaToX7L/kvmMUWXaPwmEG3UnI2yMyA/ML68Fz
         K0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090322; x=1761695122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KSsMwlTgO9653tXVS3ZA9JO3NhLM1mffwzVD4cK31c=;
        b=tL2N9Dg/OhJfxe2yuQBp1Oe9SWiCNVVsZkh7m63hObe/zjjNxPN3qZTOHmnVA/qrOs
         Gg3RSZ6h+Azc4Sir2NmAlfKlwMB2PzTM36NAItTL7A8HHRT62sp+h/EdE1ZjeYIDzuQ2
         fbHfsZCdah/V4r0mV+9pVFf7qm083ysbt/QN0SYQCYfWG+bmqS9embVazyn/Wo14e8/M
         C8PQnitBH5lwPDb6Ne0Uujw+5Cc5c8BgSB672d46lOXY6cmxSd27QYjRcTvCyBt5xB1t
         W2ihDv//Xq2rOQRSpLz1gktHlDbNc0sapoIpOCqCyCLij3u0ctMQKPYc2nxoQ7RWWBWe
         S5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVDP9e1hV8fJzmg/0VT0fJJouHbtLgwPnKA3/R4UrO6jPd4pre2G8GhLcn4w4nY5iaYdr8ZzdYZUTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyny9ayr97rDZN/3NTLsreYCKGLOTJpKFbr+ers6Y5D4O5YA4/Q
	sYxtrm7bJmjdfzvcNuJ+yqYnfqzLCtHPiM9aLsaf3xZ/FwRzaH2B0XvS1y92DJh4yJOXqmbT0Ln
	wDR7R
X-Gm-Gg: ASbGncs8ghK589P6Ep3BSntWCb5lqA3LY5epyS/SPtWU6QdzutnGDaXgr0FcSp2YT+z
	ymRrXxxbj3B3GkCjzV9JrnPmWLJ6r4MjAjU3xXRinIbkTeayjkYyLwmk5S1snlf2MhVk36LDGTQ
	ehGidCXzm8tvtWtoWP4pu9VWVjy1+pJctyoUi/fOnheTPI4Q4iWWUQHGYPh6kfV3D114V8O1SBU
	QPPHfTZKVxVD09KvbIcr2Y3DKNUkxMyEFdaZCIAl3+8E0d5bQZudhgmFeOIX+FLnRT9pIECzbmy
	2GrPV1SnvmM/KioV2l1b/7IyWongLczyBrm8EJhAe5BH7AXHvI+6lWni+XDepCbI5+7bSa598K5
	9jTORn214Y9o5MCgyeAARwchfmjBqmEpOcAAKxdLpo1EWqXxbHADfFLq5LAaMfJvHGOlsffHcSC
	Frxn0we2JqJ6aRt1eYhH6ptzozQ8Q/k92/xvs4E/YvxYhPIBNGkz/s6w==
X-Google-Smtp-Source: AGHT+IHQurABiPHqfLsNQslv5eFv1WcEZPh+yGiZu6CsvdikfJ3kugbCAqN2QVa6Jb/PzL4rneJI4Q==
X-Received: by 2002:a05:6512:3d0d:b0:55f:433b:e766 with SMTP id 2adb3069b0e04-591ea41924cmr1054564e87.7.1761090322004;
        Tue, 21 Oct 2025 16:45:22 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:20 -0700 (PDT)
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
Subject: [PATCH v2 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
Date: Wed, 22 Oct 2025 02:44:48 +0300
Message-ID: <20251021234450.2271279-5-vladimir.zapolskiy@linaro.org>
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
other GDSC power domains provided by the SM7150 camera clock controller,
including IPE0/1 and BPS ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

