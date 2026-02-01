Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD032AAAB
	for <linux-clk@vger.kernel.org>; Sun,  1 Feb 2026 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942964; cv=none; b=Wsj3tm3TeDxCntIb0pBTnDzjnVofXENJCgBQgM8Jq8jIuUFV+Mmc9gd3KDbd6EGuPT9aokGUpgEbmWpkjbcat6f69sO1kyf4AW07OCjCQDR6Ol/hcqNiRv5ygEwnQELP4DdVBF+fxNcSQCCCxaFsoNuYg+KqRsYkgYQmRJ9ZWCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942964; c=relaxed/simple;
	bh=6nfUUNCUKm6Zb4Py6SMv77VBlTkgwaJH9oS28jOc1Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlF0tql9nwdEk37WRn7jxdzc4GBD2fxe8tmooq6LPFnU9Ohc8Tib7Ornmsgohgv6L504f1OW+SRMI2m4wbfbyp84zfnMJJXG0JuVgzdbWSp+aZV9CpJgG3rRyze6NRZnpTgrIILGuy+9iUW+gFql2DsER1fjHujFrBxEUlyhk64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBSDsufE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHZtIaum; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBSDsufE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHZtIaum"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117Rmsg897275
	for <linux-clk@vger.kernel.org>; Sun, 1 Feb 2026 10:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=; b=FBSDsufEDaxulmXp
	z9F8++a+UB6xP1D4zzvl/GeiPEDcdTlKB3uKkLioOCGNBxaIGul5HEioNrAVqkjk
	DxTjHK+BJ5sH7hCF+pKRoC3k4olSkzWXrgW9RKkRnMLeveblO2LPoaAqWpKvxaBG
	QZvrgyjsGwBwhzYugw1S+mzRQ+9PU4q/c5vPwrpYJC5agrgAaOhjdyJpJtGthB1b
	vJWOpCm7zQQtJ4/fyVWlx1nAf3foI3Ar3S7TpRuehu9ump2xcZgJqNgmWQJ0t/f4
	68CgKV6rx4f+VTHqy2kK6zPIAoPrJHacDf/XJ7dYaRtt3jBopXR1zcNIGJKRfYeo
	XP1AzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdaf9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 10:49:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so1111144285a.2
        for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 02:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942960; x=1770547760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=;
        b=KHZtIaumNp8t4EWnhIeQ2XRQZO9km4Cx3nxQPvlq3mXUnC1zFIG6wtwcOhDKN3FfXj
         q5AUUzbQprpFFUHPYONJ5QDFMxy9E62lA7cD1+EnCfbA0UAL7YdgSNFij22npFmOK2db
         AHJP0GMQKHktpCgs+UbjQIkRO94+FcCKpOPpo0n/FpKb3/Tu8y4OTj18xhd/nXS+jdpl
         1yCqUWZgMWHFmSEr+PdR/hCTVxFequ4Ab1PhG36wL8ENLBLXcSh+QTVvmO7QKxd1b6BX
         mbRYAloK5v8XYQ7zJfZpNzvwtz9rqBIdEeDjwI8QgzNV6yQ7j9nWxnm2XzstIG3Kl3v+
         mjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942960; x=1770547760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=;
        b=eomrzYdk+6/R/yrOYCKHL6icMKw+b9BnzaZ9DbHYp6xTG//tUcmp3u8Wkmw97fzupm
         ekFMrdUi86pnm8hwtTncawn32Jr+NeO3lI6+oyA/GRYfv00OQvUZYY6zagX3JwB0zik1
         54NW4dAfoixF6y+RWFvbT0os13GfqLmJKTeo7qhaqfIvcsQkTlo9qc4pdnhdCjhgIbgu
         jQefwHZChhPlfWONdU+UW/ItrTPLNUnwH0bYoF0NjLt33C/5jsuB3XV1fVJtvqcZkUBV
         biLCvCQl+rnA3Hieu0vaGCEF42nL8WUL7Owpemm1EzjWNGlrt6BsFXi/RPNnPNTJSVdd
         5Jbw==
X-Forwarded-Encrypted: i=1; AJvYcCW79kfr58WPxmN3fiivDMm4RklBLS+UXB5Gpij9WoX4uULzYVEtGVPB7vFvyiKXKwjFxk6jvSBGcgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBgaCe1hkdwvzkTIyjbg1AdqmEWy096SnlmDScW29Wv52U6SQ
	Vq4OuWbf7xaRrPk6p47ICew2GHphRwzcgRn+WiVN+Ld288YThtyIlP+ge4iul+7/bLZ8Z4EpuQG
	eM6jQE9aaIbqz/Gh7c4klPAtzyvIM4WMkG5S5bawkiIVeZbPbrGJ9Cf7+MUsMiPE=
X-Gm-Gg: AZuq6aJdUCVvSfc4T3ouWKGfIRiGCZ9bJO/ycMrZ+cRV4raiMj2ZOtgAhnGKCtyYyCn
	OQu/ELw2iJ/RHKciIlSjINkUvfWKsnH82EsTAM1SG/9Y87JFQaUSv3rSFJLm/rOxcE0UtMWLA85
	IXRZs1Gv3POquWSIMnW9Bes4N1yRfYrJA5hE4V4WXNsn+ue1owdo5Znp37yuW7n5rK7dzM6O+im
	8k2evn1WJQPe4K0rhTKWTslb46+Rid8BnRhsaX7EKRVrpR4cSh5PZ+YZZ1io6TirmUP5WW1VKL8
	Iq+j/5ytms18Kv0oHDHi8NLU6XD5SB1vRpgVYVQfrKgte3AoU0vGIXWLlHED7jj7trGTUrIRe9c
	b3KpN9uSc5Bm+1UWnUNEmIQdgfgfnGQXiojw2yNdAepNQcTzmjMEvpGLP/po3Ar9aHX6b3ENmHT
	8yZDt8PZhgupsF/l6ydhxKqw8=
X-Received: by 2002:ae9:f804:0:b0:8c9:f996:81f9 with SMTP id af79cd13be357-8c9f9968319mr553193785a.82.1769942960590;
        Sun, 01 Feb 2026 02:49:20 -0800 (PST)
X-Received: by 2002:ae9:f804:0:b0:8c9:f996:81f9 with SMTP id af79cd13be357-8c9f9968319mr553190385a.82.1769942960094;
        Sun, 01 Feb 2026 02:49:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:03 +0200
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8250: add MX power domain to
 the video CC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-6-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nfUUNCUKm6Zb4Py6SMv77VBlTkgwaJH9oS28jOc1Dk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+lDnMA1ntTeX/YmLKiGvhe57Gs+TZNh0572
 dJZkgdDN8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpQAKCRCLPIo+Aiko
 1YG1B/930l46bMIcNy+eK3fxqhM6n6pSRk9aQkERL0/4YaUJnFTXdSC6dq3jMgBStVvv7dFO8AR
 2So+clQ87arEQ5onLYr2npyiMQqI+A07C06TQe1u4U77yh6Lo8++gISqwuOgmLebDyQhqkG+3fl
 J5X1NzGdeTzA+IWlS9SA0h+i5F00Xon8ZG3iwT5r0iSeM4CliujY4GuwEFaWPSD/Q3iYFXdjj7H
 ZBpnOiGp2yONQ4TvQ8Be6IsMmjX5gmzeQviebIbHpzfp7yLoUoPAc9S/2wssV6TZtE5lkVPv9Xd
 s38Qw2MW8Z/n703NHlHuH0Ky3YKRv+Q2QDoBZSAOdSiot+JH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LOKnchKCC9-6xWBQYNurjgUbDkGpQgY8
X-Proofpoint-ORIG-GUID: LOKnchKCC9-6xWBQYNurjgUbDkGpQgY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX2cYj7OjoJ0nF
 Ah/iP1928j7nMS/X4FuoAFtACRTkCKMuzx//xIbf/b4YVG1cCOvrpseX5MQocomH9eGzjv/cmbA
 eeJ4NUY3MAIy/MBxcJxq9YQiwrHw9ZYzCm8trqmEgREKTfLBwzcSfseETMZrV/4K5SyjhRM6dkO
 107+Pu2zVWR4AB36yC7lxL+4k1xpIoYb8fn1b6GtIjYt2W4rF+9q5qpJ0xL6mRE2mQ9ZgMO6TPr
 Ehv1o8Pk9OAGqjv6A+7OYh2HvGFQyXoJRe8fDCfTMvmiY3zMdL271uhXItbR2ozGjvmzZjN0uJV
 zdrUbNDl0oN9M97IlSR0N7CxKDqyhI8ko1CEFZJPzdmD53O+m0YnzqfMJ105B1OL80pJmFtpuPj
 GFQKLzAR8LAUJEPQIoSp5L22sRLIG5+Uc7whJNjQLYCxfrfDXP7q3b5eDsRM098Zx+xlgNgku3c
 b/fEkHY1JV6OpD/D3Zw==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=697f2fb1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8Bs0yZVtKZY9psgxZcQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010094

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Update the videocc
device node to include the MX power domain.

Fixes: 5b9ec225d4ed ("arm64: dts: qcom: sm8250: Add videocc DT node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..980d6e894b9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4374,8 +4374,10 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.47.3

