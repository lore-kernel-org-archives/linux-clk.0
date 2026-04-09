Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC93AEF57
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726509; cv=none; b=gwiYySAno4pkRKqWKG4zfeoJBrE6UOv4rOmoiLwKdz5isNUah8TOE6tTYY5yn5bpYm64xvV1gKQNcYUU5uBkKa5hAH7It5YlIw70GrNS6EN7wkXS8ZNQdJ4WvowHnmsObBW/gFYnLwHZApTWQ+pCQqmaaGqI+uOBkbhmUJk+wog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726509; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayoL5P+0u0pv82GZ+49GBjFF9LGUcWe9N2uu+WVGmBrKoYpdMrhuebyihW4GNvpNgrqG/AukAMSXbszdzfJDhJYl9ogD47qJn7U4PoVHtMMiZb3q/IquMaFZTFdLHf0Qz8a2Wj6FKsauXyW1VE1OYJ5JLgSD94rtmAC2DvTjOCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4fHSuAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFVQSTfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4fHSuAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFVQSTfr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CUuP1727558
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 09:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=Q4fHSuAOQkbgn8vD
	NmMWvK5Ip7enQi2hLm+i5QclQFGKyKJ0Pg6PN8KI8l6f0mtO+iqdQDqsE9AICSz9
	+ubjfqDxXN+l6HSHdb+66yOkf4Yp6B0HYPgbWS04rpRdtUljjrwFXrZbBJXniGMc
	coEpmLEPMAQrkIyUpd1ADGEMsYzWHV3y3XdN/GLpW00YkGwkqx56RuPltkexpNoD
	bK2B+l5/hRqAPk4bx2FEpsf7/AsYsZuEa1I00nkhz1yY+BIngzf82MSwIIXFamlM
	eDXvS6n5Xzud2nD5RTu/o5tYYkYxQG8i4jpt+RMLCphNNfsXXpHFYza6kI8oZlH1
	E1xFbQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrthx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 09:21:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24308165dso15979065ad.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726501; x=1776331301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=MFVQSTfr2KEUP06ppCsXZLyZrBD7wNkP37WQUUEmNJUNcIGjQZCDVVdRDUK3SWBa5b
         Oczp+HXA96Q2VzayDTqpN00T5GVdi986qzoqyxUSNVxm5hg4Yogw/D5MP3XBtvDQmPWG
         i7b+llGG1+K7saqbgOLfgf7pYBj2jYC6pYZb14eSvaw7jHqN3AHN2OZxIN3fQUg9lTuM
         7HW7jOPN3O3SxPp/vidGd6bs29QaD7zAG2r+0e9LNEaMedpUxOTb+249tn9tu+ZmQFXE
         zyUHDFdEWAPaTxH59SlJ36zi19d5MFXPUf/IS6FSNichzzDmbVnCCVc7hKfc7Kb/JWcd
         vhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726501; x=1776331301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=OGb2JkCgSM62c9/C5d/FPmgb8io7bLziAQyw2xZgL5VpBH0qxl9N0jibKo5ZysEMNm
         rrQCEFCbIqUD22GElm00kRq++kg8KLog+6ji81q9iILnTqXlQIvZBCqIqRjvrgS4EJpL
         Lzxy74D6B1N0h4cAMEWp4tVhLfX63w/xRjK/hlJN79cuoY5ELUKoK1k+dkR7TolTP8Pg
         HcqGTNhlICTrBAhyXulkjk4J+NBU1yAbOoOKvp72AIf/uXbRUzGQyGLQXhJ8Na6iI42U
         WINMFEbMRtpOitBFRSNDeFwIRUb0YzDU9WorzbLSWJ2dWajTXtucjaXbwtIYPVbCesd0
         1owg==
X-Forwarded-Encrypted: i=1; AJvYcCUgotSG6cJ/Rfgugw/pbE8pZhEsNTod7tml0MAYl8CuJW5bi59kEpFG275nc5JtxArfd5Xkm4EA/CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGoPKbuHkxxULx22/sDs9DwgJzvWjKl+i3qqrOwj+gQREFzY1
	m+6oi2MkOQXq6ZHufFGBOThM+3bP3jJuDmqc1fLtotqaEfYLKH6gK/PHdh7VAkUK8s7JeetqmdW
	1VJxquDPQCDT8zRrpSWd6YZsVpROqwuPteHgHct2PN4Hq3Zev8gGeTxS3S92IK7U=
X-Gm-Gg: AeBDiessrQI+oO6KlR//xskDA0swPezzpWiwS4XFFMHuKGHgRtGhS2ZOxc2XzIL5Tvw
	txV/KPbfWK/aQVl8wgzj4oj4qBSY7SYniwKlQayQC5tclEEUj46iTKQRoKAG6ldtthczzjMpqz9
	sITyaBO8gWxBwWjdCqs0kDaiKrRQ9lUMl7FCCu9DedphQpUVlYukxO3+ZBoSj/IBAX1U3aXczki
	IeDc9hGkNAbHyTNqW0nQqb1M/owk+XJWwF8bULekyVXx5GBkeLIVnyslzo6VWSGfS10jQmPvZpT
	z5C2lak9cZlcnB44qZrCB0SmSdh4O9MyrOqqaFSy5FjveuPi72r/T83PBUSLrGbsgTe4tBpaatt
	z+3+SWJoDGvUT4kzPZdmc7zXGoi07hEllqjudemfDESRtj8ZmteBl
X-Received: by 2002:a17:902:f9d0:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b2c723f6b6mr20625295ad.4.1775726501088;
        Thu, 09 Apr 2026 02:21:41 -0700 (PDT)
X-Received: by 2002:a17:902:f9d0:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b2c723f6b6mr20624665ad.4.1775726499939;
        Thu, 09 Apr 2026 02:21:39 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:39 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:04 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-2-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX+BJD+4fbpPFk
 dYLR6LRQKiemvxElVJdFealNRSHaOpwtV71tG/zPXs3syroDOsgCLrlkrhyMPof/JWLj426Fhou
 aEKMJC+U/oWdu/raomtMZZLMexoLYKCpW1NTnYCeOuseZZNJ0Fp0Al02scXgHuEhFYm+qgzgyoF
 ozGv1hiJL5iLgWaktDB+Xnr2c/9zXVXTzuG8iCI/+rZpPh04Yv45Epp8+o45HuL4B2QFUCc08/6
 ezWc7+Y43TbTKxe+yiPn4RYPF/fSvB7/Ev6YbyZN9wF8lfVg5gza7iF8d7hdWzarpvAu/oMwQX9
 /Ky5uXN6od7CYrHTq/RnkCxYbi2fZfq8ph/llCPoFrw8RjQkVoiHLMQwnvHXgp9gV3mpb9BVtJd
 TCfrT2C+NB+/9kc36cOXTd9oKGFi+t6wom6+Mr3u0DsFwMONTuYltZQzIICW1mOPsvkO/aV63Lw
 FhNEUzRed3Pk/IYpAtw==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d76fa6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TVV7L3p3KUlYnPscbWxZschKtkf-fPr8
X-Proofpoint-ORIG-GUID: TVV7L3p3KUlYnPscbWxZschKtkf-fPr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090083

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1

