Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B1296BAF
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593662; cv=none; b=OJgUHk/xBDuQa/W2LMS+IXVXX6trQ40Qp+0pCsIwx/Ko4iV/eeDcNG4/K+ZSNjRhlZ0X9afojqtcrJxOoU18KQAi25zuHuQzFI/ICEasj454JaEIf8s/xz1AEHDm9poWwATkn4OaiYW0WVpuC4kDrI7xQ0kaO3L0/6U3NSOZmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593662; c=relaxed/simple;
	bh=H1XGUYtUyd3naQF5ZZuFdjgNtcnlLUBHlekLIAnHQ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAS9wwcX7xcpOZSS+ed/QNaMw529DBCbFpSKDjLYuT9SOQddRpoPD9B12vrU+GamGU/TUzl8ntgIERJRSnmsApSDiHPqNPAziYd8RRJo+O4ReBJFpzAldBWwZR416ItZl/p79jr5aKbvHmU2ZE6tF4kRr/Ezv+KGEtfOBKV8OQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cghffBhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kR9WUl8q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cghffBhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kR9WUl8q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cakui2945295
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=; b=cghffBhUet5CHVq/
	Hp2BFj4MnMj+S7QhQwkL835aBl2OI6/PFUXpelCRUeDktQ4MLC8wYLom9nMmS1sC
	Q+mcVIdqhX/O/JkB3tZ0NOvk73Pe6f+7JXyKyDlXgHKCZGyK1RnPYbpweLOHKOmO
	dqXLCEn2tS1zFDQiQ7ZatRfXS+bHYLZyZTFXAe7ogYXB/SaM0csLzMyEKKGQ47jx
	RCaCQdDWhQmN31wnurafxMaA0HlYP/+15ypqppYr/ztaPn0noaMv7gqSwbFVsRhK
	5oCBar241h4pKT1og88e4CSeWImWq59IChGoTy+SzcV4humcPhUiX6q6SAKo9Kx8
	vg6uMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u991ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 14:14:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1789771a91.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593659; x=1786198459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=;
        b=kR9WUl8q7WRtdTXmuScat20Cz35ZV+E7Fo4mHM6Szka0ZWcPsXxy3V/WVwmjeZLMNX
         5BGLCJs4TW3R0RmgkATJgreKSVuuOsonmoIedYOFzqgVCsglzVbMvb47DqnGFn5/izPL
         7aCJ9pEYfUHk7RdNr7Luk2sHpDQIY7fHW6fG695gro0HCllM7sD9EDiZl5cH9G0Q0YB2
         z7SA2uUraehvuvB6k8oCnmk+h1VuVJAokT0fpgm9xjgUcDfdwc9NJ6YosqGxS0L7vKNB
         UoCWg9O/3ZMD7w++018BTsy0NeBEok+/mFlLIeD3NvgQSDCcGypByoq9FUbF5BS2FWi8
         LvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593659; x=1786198459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=;
        b=rbw70jdkwTEXFGkKGympSpWKnSFPT5sjPEaDZ+i1TGlZzGCsiI678HiYI2mmrDaFYz
         U+/KKCsHZwK8DXzPtZV51eR7fYxA51tM8x+AJg7tB+n5UYP0hvr1RGtyCCBn5v1f+4jv
         h/0tO91Urj9aBnK2voj1EQpSQ808HDXiPUQEpdq+BROZoeJgeDTY1ual7BPLKN/dvtQF
         QSxgOmShxX/+ZExPXZh/zAXG/TWms1luZU0AdT4HiOf5kYpRhs1Bj9JuC3KqZvXMPM8Y
         inVhBppp4ygO0bYddKEGfayIPSQYhrhpmR3f8283xgMqurKXTXvLhg/wQJ2iK5WWJ7na
         ZVhw==
X-Forwarded-Encrypted: i=1; AHgh+RptVgp8pQE51w3ug9qYlLcgKquf+YOIMifDJd0KyL19z+20dH+xDf6t4oUCZ1mzUToeIUrdmCVFrmE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85Xsn+hfrTCFzF1chF8Wr5j98ca0t/baW5WRqVg5eNq8vK78y
	Ux1xkxZfuumQbXzKX2C+QLmFlD+EGzB4P6T5urYJRawFHMGw6YMJ77aFxPHurGw0uVbw9Y9nUrg
	WS66oqYgaR22anop4WN34E/6tpDeQMnbxm+mwlM7426aGgrNq3R2/spJrZ2LUjXw=
X-Gm-Gg: AR+sD10E+OhOw8eG3aUV9bWcuvb7i+m9ZDbx8isbiOLjBCf4nWJY79iWVxH041mjHxQ
	wm96WkpXSOnws9eFmQyyGRMpvhLdSgCVce5jr84LoDSVWnckAT4Holj7G5amvZ8O7ojEnSjqfqW
	miqEXdPFiFAPOSiRWIhOQIXKj2Ziaar5bULvd0zSEdAR1yqCsvDB+5P9id+pWDoNFycYJ7JRyn+
	eO3RrbiWV2n5PYXk+W6xx8vJcZBuqUjG1W0Su6uPSOsjKjbTz+8UlQ3NsL00e/AZrKOCzk3RtUe
	8f9vEHMfOZxpCEalMBim4tbRdASIgSSGKEKhbiuNjk5S87BMt/YCBuMkodNamzWY52aGl+nnZg/
	f8AnXkXNtSAwQybFKgPZG9M4F
X-Received: by 2002:a17:90b:580f:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-38fb247446bmr5868649a91.8.1785593659541;
        Sat, 01 Aug 2026 07:14:19 -0700 (PDT)
X-Received: by 2002:a17:90b:580f:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-38fb247446bmr5868618a91.8.1785593659075;
        Sat, 01 Aug 2026 07:14:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:54 +0530
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: Add video clock
 controller on Nord SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: At93m-KoMtvxUcPlxC2BOkd0mOSx7z0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXyK4ZqrVkD0BB
 sU3r3aN+TOD73LzCZMAGUQ96R1HMnWlwilZCMjuZb3k3Gsk64J8/+bTUmsHIqyw0/mCiTkB4PJ0
 9CmvJQqGXtpc1jMiQOpcZnkRdApNee1nbEcAyEclf5jegAhAONET1WKMcJZprwp4cpl5BdWRz9b
 BCg2gh0+fTsYHnOh6prLjL7uhzCt1M6S8XDHfHs7nhwgev45l3Jb227B6wU/UcQkf/tvte3JLMy
 3m+rKgkQu83IifxwfaPdZVYiJj6cptSLNqItmTkOUF2ASvBq4A7qFZCPNtsJshs25j0qFdWYF+v
 fdp7fO9y+g3tmK0NRpQMW101aabXClR4StlQ46Z8XKLzfrJCjBAWKfYY9uPiEkGDjqdfo+SGOnG
 2M6Tzd7SJ9IEHq/BW7Hc0cO86B9alHguR8kArzArQEoG6YjXp6rOFeh6Rp15jF9oFy1TehLEsdT
 KzIs64JoZglBexTL5ww==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6dff3c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b-Tosh5mKKyvZrgmVFQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX5tatdy+re5ar
 BuJhepBoJLjHooJO2Q3ANvFdjHI68VRBZqCSjj4Ga0vM8YVIaHPnovtg9r+C/3sfLIzPmxLAuT0
 Dgfwhpk301+WSlWjyq2EzVKiLjENnUQ=
X-Proofpoint-ORIG-GUID: At93m-KoMtvxUcPlxC2BOkd0mOSx7z0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

Add compatible string for Nord video clock controller and the bindings
for Nord Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 1e1fec1cd7ce96f103348baf85341e775fac690a..65620a656600ff61afdfc22b6675f5a46651bd26 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,nord-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,nord-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc

-- 
2.34.1

