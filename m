Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFCE34EEE4
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880842; cv=none; b=bakSB+EUrpVaFg76c51g9KEsrEOc0icOw2yKb5Jn2xFWdr+TTzyeLNMje4xU5Cs76BIq6QM+/Ltl9HFfQQun/bDu0Tx1Q5ftHyeYtUQdjPnjog0PUnINQTBKf+BNf0wryKUvycyuOt3Af3rDAdQ+qJqbSEZgfiN3S1uqcoNzCEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880842; c=relaxed/simple;
	bh=6NuffNWnnJdps+Qa/VbgdTchPyycTYPYQqXXf6EKyA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEu7aWfVhF9H3TyHMkuScjYYFPd/TscOOxEsO/W4cA4Tmks3YNibxDGEyjVeOBwu7Bu0nCWfRS/BS1KQDnV/8QeuDlUPkME1Q0g7BnhRkKLsqOaeRwI0SNjN6iHkrGyWGki9mQPbLSfZhtDsjTHzOTtJNWHUMwePme0f9a5p5Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+doxs1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkN6sP/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+doxs1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkN6sP/O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VGsTGZ1861581
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1XGvQ7yGrJV4bV5rx0wYu9nGDUQZH8c18eThksaF4dU=; b=F+doxs1FJcGTnZg/
	bV/lX7tGB3hf+z09vrsD9q81oB+OqDCbttrCs94GzDho/0pttseOehozx46zldwS
	RTA6Hra7LAL4iqCZucu5z6e6XUnKqX0s53PKM91qkeZdS960eSFtmQ/LRrf/N0DQ
	VVj/PaROaBAE2GPFdS3IRZgx8q035AvQ8aaHt6HLkl7flh7oPK4SRoV8C/bjQDiV
	tXXuBFWw4vRAIDKOKfdTElkqPSRTBenhMXwe5c5BMCEha39IoXPAC+44PeNO2lzi
	J7X+QO0O2TdmQru8+m0U2NKiwYqJuEp1kCOh0UMSg54D+BFlkXF8JZmZrBJyHxEq
	GPcO5Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awns68g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so4602342241.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 09:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880838; x=1770485638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XGvQ7yGrJV4bV5rx0wYu9nGDUQZH8c18eThksaF4dU=;
        b=kkN6sP/OtzT9N3eN+WSEKiQVAJzG95h6yRXbhs0K1u/XDAohz6rcofUz7kwF2ytE25
         uzsK9nLNpb4lRqE8GZoAlRRqCOw1/Eu9+OSR9649tLoKoBOmfqlPR3/KdVGbqoH9RfZs
         EKNM5gG0NkvD+3+MmA1UwnOgmJkyB2N9YO4STLDJWfHp3R7rBYW13lNGJMBWkukDdD0C
         RO3rcMBgugSsapN9RGD28BbazvCF6ii9YauhujF9kcwttKgMj1ZFsafPwBBSwkPDc89H
         pL8Lk/gnqDcybfBzZIT+bfSqqpMc609T66AGYLz0rBnqgZdu9PAvJKxhoB91k+ZZQ/t5
         Mlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880838; x=1770485638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1XGvQ7yGrJV4bV5rx0wYu9nGDUQZH8c18eThksaF4dU=;
        b=PyVw2o5BDz/ZC5fNwjah3WoJ2CADbNKMGtxDcMg3yvbEZC2d8V0BJad43Al3DkRx46
         +pbBrPO6GTj9JguY/LjlTisqLSiztT9KMMM5VqsHjYz1d+hBwCRJkVl1xnnFuzozwFUj
         U1HNwf2BWWrhRdylLEGu5Eafibucs6RD0e8dZcHl5wwrrOMad/usvjox91+wkKsujSr+
         rW6ZDVldua+R5n5XhkR/zNyZXXX5GO7cQOkM8SLCWBMLxyN7lt0Eml3cUnmvbD72JjZY
         UsPj11ACACLFIaV03o8SgNiTWKwT/q4mdKtqtGAq1eLn49PWGjZvaignnCrWgxoFgtWR
         fPNA==
X-Forwarded-Encrypted: i=1; AJvYcCUnSYZJC7NkvkdLS56MYBYKURB3HUb6kxDtKcRqdhzHrm3x+1rcKPNtaJRyxcxQCxPqDpOzBVTunmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YznIx/ZekKGI3BF9Jsu+IluFUpDuKCZ09svkFaYsZkmx9D1kd/a
	LlMT3Ffjx1Z0ZN2M0vzslog9l0zJAveuUkShAntvR6fIRXqAhxdN/AHhk/Kcp7NgVy6oIuWf+zA
	1batdh/GT9HHJfLQMH8sWK3aCup3IYM+YtC0VcrJD1olAzZaBFstUoBvu/vZVpr1ah4JHwKQ=
X-Gm-Gg: AZuq6aI4hatBxFnTl1ScWBVnfHwcHixlkp/eHiE1+38ptCtCNsemjvpZwETQrZh3s/9
	37Ip8+4hZwPO06O5SNq8v1hCQX3/gjORy0Clh2XftRIf2J7G1hQZV/cgnB+xx21kdfrtLkpUhtY
	xXSZf/bmzCegPnlKXfKgsF+HlM0+LfoEEtWaG08wQQ1WOVmV2XJG4jNOiGHuo1qWw3K5E5WGD7H
	+FuA5jrjqFedrXUrc9iL8Zp6pMBN/BIRDO4qNoPXaP6tPBA7is4TVAqocFQ6CBHyJs5Bz4gIM0X
	t3GBoJRK/tRwQg5dWAR4rpxHvnZtLYssgc09hyu2tqklNYUIbFsUrRYlp/5LXyiv021bt234tu4
	gWi1SfM2jc/zurKELEEzpXPctSxr2X9G7/cyFfROx48IWLjkGJLuSDo66ox1T9WYdZTp6s2QS7/
	bjLCT3aQrzVK7O1y0rMej9+eU=
X-Received: by 2002:a05:6102:1a0d:10b0:5f8:e4f3:3e25 with SMTP id ada2fe7eead31-5f8e4f34cf4mr1139402137.15.1769880837837;
        Sat, 31 Jan 2026 09:33:57 -0800 (PST)
X-Received: by 2002:a05:6102:1a0d:10b0:5f8:e4f3:3e25 with SMTP id ada2fe7eead31-5f8e4f34cf4mr1139374137.15.1769880837385;
        Sat, 31 Jan 2026 09:33:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:46 +0200
Subject: [PATCH 4/8] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-4-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6NuffNWnnJdps+Qa/VbgdTchPyycTYPYQqXXf6EKyA0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+HOacaBmW57OXNnQqMmJ83pOUWH3gs04Jx
 wpiz4uKWMGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1cFiB/oD1i+aLORDkXUUhBH2qmdqJPt25QMTI7gACuH6n5p+pWvc4NFXlDyxgVENFXqcE4D1gBU
 IlhRKb9OhPjPkUy1lv34I16kmkxYJWUXWqKQnD6z3SlouR6ncSArAg2H/q1WQhdOpG5+FR2mdoB
 rYN0hOyntieoAw8BWYVc64EjtB5pkvDd2VxW6cp3MyPMoZdyXwOI+d/Af7W1y8jURagZwqQ+Mj/
 f+7dnJ8NNTv7ZUuy8U9BLpiCQW6EICsQe5Be8/0G8Cyq56og5/4/PcAE53PPGwp6sYC39CUZjLH
 B7mHl+CmK/SoFU1RSRGR26Mw4PxGh2y32xXiZR5bv25+tVAj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697e3d06 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: CjNONtY2LhEr5URV6zpWxn7YAUD6J3z_
X-Proofpoint-ORIG-GUID: CjNONtY2LhEr5URV6zpWxn7YAUD6J3z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX/+Nb67oxY1rm
 cnEm2sHyHuyZWCPSZR4XKaw5Tewd/vv2HvFU/qXJvYyqtcX20o4OpghYWmAU8kBy5Sy7P4s77Ki
 fSqsRPxrlsopsFAU4mYzP5eT3jQbLyV2Pk+h+VJ23FJ/RUBHXZD7eIjL9xwC8rxadqE8fg2QR2S
 oyVIVwTnAafx90d5NtglWR1vPEkcJJLRQhhlxuf/4GEmEimebyDxbcXnrfm/+pyw7w8/NA61YaG
 nzPYBuz4ve2qE71zGkzItJf5Wi1OLnfT7RzLtFO9eC0sSZBs/jg3my0mM0ZlDelT8NWhzZenito
 BKpL2TfjW4lQBBQYOJ7zWkewQm9OkxcO63+QCgh5FjT6m8hNtpDh4+Vu84k1kMBvO20U143nT9M
 p5LjNwfGgAPr+J6xDxqDPreV0FrVmvjOmtQPzC4HakoXQqdOMKseviz1QEGXn7bz3TwRA1g9r/a
 Thkr5/oeh2BCqCDbtEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310147

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL it powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibitility with the
existing DTs, which define only the MX domain.

Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
 drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..aa71f7f53ee3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 
 static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 
-static const char * const sm8250_opp_pd_table[] = { "mx" };
+static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
 
 static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_AXI_CLK,  "iface"        },
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7b612ad37e4f..74ec81e3d622 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
 		return ret;
 
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
+		iris_opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
+						 &core->opp_pmdomain_tbl);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3

