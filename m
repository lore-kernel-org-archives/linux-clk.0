Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC72D2390
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968313; cv=none; b=g8BKY5WO31kD4IEg3sUoXcdWCt3pekwzOGJ2FuMqh6jackEjN/zi+5kGvGRMlS4/yt+NTSNu0vMStM1Y3xPD21DZdLtADhvBwbBNqU0c2BCohex+7aDk2/DT9WriVpECd70vJaDh0O+ioVnqLcQ8HUnJDe6LiKXXGX2l0oqUQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968313; c=relaxed/simple;
	bh=yAYPEUK08VYj2ujcch9sT+wEp8YxtQPuLJnVvGWBCps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIHU7E6oEiSDLazAuEJOfUzxldXt+aXFC+evmri9O+oC+8Praipq4TGARxm6q3KTUet3f3MVlTg8KHsJLdeqB16DpkM9p9IZdS9kzAwpA7hUtRbyq+sgWZnM1nv6N9kutFiGC7foOrYZGfJTzuOTxHFV5knwjYZUuF2O/lbrIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4RUZNOB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4RUZNOB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFi7H1019268
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koGcEsmeJ1+5mqLjlYSSxGm4OKtlykXOE+APf7A3PYE=; b=b4RUZNOBsCP4dlYm
	8qxEV1BmZk72gT4/JbsQHHhlbNePEtFQ4gqUCCqKROUKygdh7+2l8uVQmnB3tKDj
	LggyrajmWngFSg26/4QEc+4fLBDYXLHYSL60RMXHDGhyqk6lbM0Su4a32Dj+WOvN
	yUF1ALkNs4U1q04Pz9Q+2FVhLy6zdq4yvaZsa/xmAM8KqG3U8fO42iYb3wlOGTIC
	dB3bTwJouIKSX2ugGK15xwhYRHmEsddvqyNyaUy/j5oN/ceRP/0QAJn/pf3DY4Fa
	91SvvttWT4nORM+9UlcXEeCF5/HxD7Ws4hYkYWe1RDriVFoQnKxzX5oa5ePqH7GU
	B6OtLA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduxjsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:50 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-30b9b0b816bso4693237fac.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 20:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968310; x=1755573110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koGcEsmeJ1+5mqLjlYSSxGm4OKtlykXOE+APf7A3PYE=;
        b=MiQnN/K9gTXE5Q9OiBhhJxHdHcaAZ/fnYBUVsza3aDZ8wGmpGwsTs7o/MleAn2Yh2X
         8Ld9fFMdb98iKxPT2llALoUir9Zem8RZiIGDcxvPtwipThOIjmGOdL1wXwbVDrN/KECT
         YsNYoMTTDQOPVtpTKCuMvIcgO4AeboDUd42vqtXmGkufTZWM4BDcsKpogOXbtjikUxY5
         J0avUYpk8rKLCpc3mELJtJdRCQArf3CfjQ1l+DTZw0WevkvDsl8BNZ+MlttK61l6EUJ0
         /wxnlAgDE9Yj2v0mdQkQxkR4exFcXKq1JH8vpGavlGUQfTF2gk7zaefPqW2j/Ld8DrtC
         EyLA==
X-Forwarded-Encrypted: i=1; AJvYcCV8/6lwHH+W3lCM1UFgxGTKq4nba3gg1JmpqtjWagQjkPlVv8JAJkaPWXJqKVAMQZxYzW2o0eAogL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBttAMZiyx56oz2ls2yt3ng1QEyNFKBHDFOu/mCrd6Z57VUJoA
	h1dbnyGXremWIT5wMAyUiqznQTTEbsitcdXKlL/4fycc0dlHqGYd/aHTSVJIAXjtYe5lbIx24Kj
	Je/6JmuYbjez9R9ZWjLrn3sLrs6rFGmmrBC0kfjDMqEJFqPrfXjY258/024dQZzc=
X-Gm-Gg: ASbGncu0asPIdVlXHDJf5EOJM5TuLkofw2BMPxoio1yshX5QjaIhWNJfD8y3Zf6pzzE
	5HGIUctsXQgodQERbY95fTGLSjUF6BVx5rVWlr5iPzbM79Hz0EiX1uFemkG9K+PK7kT9OzAJjkv
	omsiAI3ufGeXt96Lh0f8mvj7tu8azkAq9R08EnvCY0I03lgyRlawyuJDNvNXR5llnh283byzXW9
	1uqne6X2S1gzNmSTyb2FnSzGZFLbgOIFyC3oUygUjpXveLG/WFKwPDyeKCOtSlWUf2KlB1ljRXC
	Ucjg5nYWDcykXQjjsoQgGXTHi/FAs6GUv2fAhJdySCV/A5fZXaWZNBWo1QPU54lo8WOFvgWrBzV
	cGqATQJGylcxeUNw79ghbVi9I2MNn5rGsQk6xxBw=
X-Received: by 2002:a05:6871:8305:b0:2bc:918c:ee04 with SMTP id 586e51a60fabf-30c20f1f6abmr9606648fac.14.1754968309916;
        Mon, 11 Aug 2025 20:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcrtot4++AM2DTQZDZVUqKw/I6MmXZTfbfJDZPGmRoZtqtAJkZ4YF8l2jc6IaKXeGSuDOFrQ==
X-Received: by 2002:a05:6871:8305:b0:2bc:918c:ee04 with SMTP id 586e51a60fabf-30c20f1f6abmr9606629fac.14.1754968309569;
        Mon, 11 Aug 2025 20:11:49 -0700 (PDT)
Received: from [192.168.86.68] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a717f0c9sm8174531fac.13.2025.08.11.20.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:11:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 22:11:33 -0500
Subject: [PATCH 1/3] dt-bindings: clock: dispcc-sc7280: Add display resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAYPEUK08VYj2ujcch9sT+wEp8YxtQPuLJnVvGWBCps=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBomrDzIVrU2qOI4utrb3zu6aJ3bGes/Jv8BjFbV
 chxKEUzWSiJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaJqw8xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVYkw/8ClZbWphkBhh7Fh0H2wi223597q9cOeVWPcy7vDx
 svRcPIipdrdKVTfUyoCerM9qqXbsZ7d9fwkyEUme8p/TGI9bbFpbo9DfdpR8HpGstKn3mnJVkMq
 RTMvt1LsGaZbpxmPIv7kR+YuMkIsZtYSd0+9voSJB5kbDHHyjYGjyf1fVqgkoS1uKgMJvVDpuEf
 /Vmd/slrfDTqCWuAQGNw/GWJZhuvHHH6rC7WyUfBJscEY3A4PSpmJwWHM4WLorGBhmLaRhJRRg6
 S5CglPa+U8MAFduqQrZT1PuQZVNdvUhAl2qangbbakz9Ss4O2Huj3uEpPJ4gyy4CWyHDolNJM9U
 J+0f23PlalCxN/Z/wHGd3I02zu77klHhIV8QFZtQhXHUwynDvbLGEuKN8KW6EDcZgpkI3ykVh06
 T1LixADBfu7zUpn1ECmhZ2kFEOKAR3Bj4o4ZHK4CxXn5b21AR26/0/iy/MrgbaI4DHqrm8yG4Qv
 SJMlCi+DoZIx7WJh4RjwZiZx4TT/coY+BoEPOyoVJpR9xe4Y+Ndkx8GqNE+dpVL5uXL0E5eaZFU
 ZT0HTLRQk0/QZjRoSCv4gdWpuKdxsFTC+lqC5Ik8pQgCzNMWp3PzdiZ7HvCDdzLaLsBB1cob4UR
 MvAff+ZpagZsXF5ox7pDxRMn/WQ8t6DAEVak3dLIosWY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689ab0f6 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZzzWQa5D6bKC9TZe_doA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: AKxE-wASRvL8V2D1s0yFIYtNkv9BRK9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5d1E6EayYIAB
 AnAfuTSJyL5FadibQCWACr7Vre88kjqucIDCvAOPvsHJjT+Q3P3/rYVaw2FBRHTgqh6FOm9huLF
 lZxvpoW3OLTnDsY7/jB1QHZCXWIXnLcwmlsgf54gpeYVs8pgE84deBSSUUa75mTT+wyv4OcLoNV
 BARnNc1pzKm3nkVCTbkrk/MybCUaQUQXN5balWzW2wfg1jHZiE2T3IrcaasFw+jzt4VVDNq1dtX
 x9jljiRwrvRdDG9QZMIu4Hwp0K/MEqNMPdtc2sfRWSKgRdAJc64pmTDKWX+WS06lCPXsDGKI+2u
 SEXO7y/Jfb5JW0X+eVAhb5awymA9OYzxtGZf69ALZqR92C1PdUdnLPuhGQ4cFuLWW2uxiR9zeil
 AgBjNf2A
X-Proofpoint-GUID: AKxE-wASRvL8V2D1s0yFIYtNkv9BRK9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Like other platforms the sc7280 display clock controller provides a
couple of resets, add the defines to allow referring to them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acfc954251fd1a1a59239ac62b20015..9f113f346be80b8a7815ffb17a6a6ce5e008f663 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -52,4 +52,8 @@
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0
 
+/* DISPCC resets */
+#define DISP_CC_MDSS_CORE_BCR				0
+#define DISP_CC_MDSS_RSCC_BCR				1
+
 #endif

-- 
2.49.0

