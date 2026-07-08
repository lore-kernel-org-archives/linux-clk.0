Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028B31B803
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504132; cv=none; b=JsyFflswhAbnx1J+HNdSQACgnv8leF/LZWCvF42aeksaKLqgnubtmmqRXM8iauMj9zDiufrLJKrbb1sm/ebYgR/xBu6bUdWqy/AtSy2Qadn1KC0DlCzPPuqwSqbjR207H3dyZ7GykK6WhLp3qahQGma/EWVWM33fBvEZmTdDfOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504132; c=relaxed/simple;
	bh=iquhnVX83va+93/Mcr4oasDJq2ojoyyvQIfd/GlAlpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pyZlT+iPSlqEdS+3cBzz7YfbHBLiORrbmk+8JdippBHelVT/HYNYvLSytI8couwRuKmE5Spl/IrQh5yopQGPjS56UQVnNXnz+ORhY7Fcqe9f7FUTyLkzsEddY++eNzTQ4jvnOJ43V1ppcUcoivkqqBoWEUTnYi3bIlz4scwIQQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPCkH5qF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWFSx6J2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPCkH5qF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWFSx6J2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888onE2204069
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 09:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bg+Lut/Yb+GhISLgjp4dKi
	W1om4zG/Mga19fYgYPmo4=; b=RPCkH5qFs+pR8L5rXJtY8U934sI542D6zTEOEJ
	w5tpbZMvqZrtOXW1DRbPxOPyK+o46Brgc6yr51As0GlXycFq6ydPM7WFx1GjcuDs
	DqNjf1HE7bI7YUiTYfghgBC1NEc6cy7tCy+zp6yPJt++mKemS+yWpK22zmdnGQeq
	cnvxgUBTYGpONQz8rXHoQ5DsoKfIAjYZCNBaRn9T8JkSs5Pf345Wiu225VF6ht4C
	sV8307Slu0c9KtERsi0loIfFOg1vf1yhva5cIA7xoJDBesl93Fi6dEdOBrV2Kaz5
	fuGg4M0d1rkBZEyb9Clqeg17ze4+5bQ1rGi3h3EtVin5isnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0pxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 09:48:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1852a86fso5469501cf.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504130; x=1784108930; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bg+Lut/Yb+GhISLgjp4dKiW1om4zG/Mga19fYgYPmo4=;
        b=AWFSx6J2NeVABqnZIu+LTDoWmgpimx3RyU+uaQVWyzNPYS8Yf/uyM/5I3e+IXcYBjI
         mjLup4ZQfoGAYqeEWYg9juu9rNQnOfE2bgkpv1/aMqGKW2ASH0Gd210YJoFuIbdVvlfi
         4B1a171dpgGn7wdrndYnQgzjXk88bqIWWCbNbD9IoihbHZnhDLqZFIs82Dkdk/2ifknM
         x7QBZ9mFEfM5uMPpeglu6Z12cBQOfD90Xsd3BsPRohxCCcW3EfxfANZj811eLnHIq2rR
         pn2bPSP1J36ZVTMVKkmm3AqY9ERdHiHk8FLUGM9XuqUiHhOSZafs59Fb0kYX5jq1ZIem
         Uv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504130; x=1784108930;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bg+Lut/Yb+GhISLgjp4dKiW1om4zG/Mga19fYgYPmo4=;
        b=QdX8ADDlzHMbBFB2iw599EMrYV9+tp9paTPERdPEBhP5zjHFeSHCBByWYaIfmnyKeR
         9cC/F3EIdb/5s1zHlVdS601oq37Md+7DcaGfWGD3zV/fK5aMypJxBmxem2CrRjZwafjR
         ewJh3qbvLfe8TDgfRM6ESuDRnveU8rw8jJDY4UAnq7jg3xYedLOByHW2fb46T9Qv2fXn
         679kCLIhCFbM7nHZ+FeAcTz7EgSFw9lj41xQqBaAw21AF/3kP/0K531XM+03fDAdPPOk
         LjxiiwjKU3jgms3+/OlhKDrCPLFxfIYMHf0I+DwhOKqXIe/w55kcOqtD8zupu9H8720q
         XnEA==
X-Forwarded-Encrypted: i=1; AHgh+Rotw7VRKeqq9l7sruU1RMO5n14T4epdOWT3zWVjoivxRgPZA9FpT7CTV3+1MqmxzfvLuwTjFMWibHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKeKSE5Zn1oKOyI81MG9v9EMz+2OVb0tBxiwEZ8aJ8k3QO6H/
	TUv7DxaYqiPJzMNsor4Gm3Ku66svln3XetiHvYOsWgAfTuzvLYTLqqcljYqYaxtE3JN7LQA5nUd
	Fs2/V1Vngsz6G5ma8O3KcwGTvZC0CwwnR0XuUL8t+lx498gp7uRCrKZmBLcE6uYo=
X-Gm-Gg: AfdE7ckoqX00kpFR5qBDam8nO6eAFQuu8PABLuoaaUACtu8Iqlwj/y0UrOSDxuy84Ku
	ixKQF8Yxjnr4M64z8TQy1qEwVIObF8817T2057Z3nH/xmMhEgcL3OrmpcQKv9MR9FzeSLbbpOO2
	JbOe5tsB8wQJQPwAfKkGtY+nh8u5UMedO5txQsrDCr3gM2VV33b6Ki4YluEkAzJlJROeJrNeO+o
	b3+C0z1gkhczG5LWdQaGwlacDPFr27C/LnwbEo3dnySmNBeeJao3PTMVNc7panpHeCqNbr3isGo
	BqX9VOQDY3o7yVzC4u+sxX6kasTUBrdwAwqGmvjHT+IuGeqiU4YR7oqmsATbr/jfWtQzBKuGSyU
	5EqG/iB+u77CqiNTMvcbjtqHW2KFrhxADAgM=
X-Received: by 2002:ac8:5c94:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c8b2dcc55mr19609061cf.33.1783504129663;
        Wed, 08 Jul 2026 02:48:49 -0700 (PDT)
X-Received: by 2002:ac8:5c94:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c8b2dcc55mr19608831cf.33.1783504129280;
        Wed, 08 Jul 2026 02:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: clock: qcom: camcc and videocc
 improvements
Date: Wed, 08 Jul 2026 11:48:38 +0200
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORuoHczpq4iHpokzgl1tNhHG3
 n2dHr/L/y9gUlQMLs0CRT5qOqaK46GB+AhpEFSuBu98506uR56QNLGmwTCGV4xY5D1rEcYxZ0O
 icOZAvu3aHmolF7nr93e43v62mZ4Spz0L67oBrxh0B4MAAAA=
X-Change-ID: 20260708-dt-bindings-camcc-required-opps-bba9dab23638
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iquhnVX83va+93/Mcr4oasDJq2ojoyyvQIfd/GlAlpY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz4Wh0klLWrSZ04yZNrXrg9VdmMik51Ayh/+
 iHOlV+5zZ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c+AAKCRDBN2bmhouD
 1x3WD/0d7wgVy5SI1+gUM+2P6bGDR7DlABiIIMl0dEbWlyXg0ppYOMiePNVz/KrOYEXMd3tOj4h
 CbeK0zY0knnAxyaWFNSTKj4bdWqzJcm+AAXCp6zht2GPc8ba8Y2qqBiaNrCa+OBbuBWWCg4Vhye
 gAqMHvJeqgWdDzO0VYHXGRrFR1RM1DRJPF/RBIaai6Vw4dsJS/hzFNQuWqFAN+QPmZTofKe1j2K
 byZHt4bz8kIYIZf7tH6tMyCBYYmbkO8CyWY1zJsGurD9jrppj/MC8VaUOq4w6SeHy7iVukmj4kV
 axIgPayiKI15MIvr7D5xjZPP33IR92rNFbwU4T+drSYdSPNygCtX7RF42dV9Z3oUhhIbbyb3mn9
 EHNdPzDieJDAepjiOJY4dbSAgGe18ECZ+RX0pSwbgnES/Jgip5sEq16HeNdHyUJdXTnnXcecfFW
 ATWhUjgMTduDmVQlF6tW6TEm0cEFoMdK3NvdaUiZh8nA7zJiJN0gJzjxIoCyBy5xBsENoEBcphe
 4EBUyoiyHbjnxWf1sQuCED/R9JToBU5n5gbm4xTg/gtT56V2Kb9FimK1eYpcPSUxmd0I8ZeWbar
 34SA5cHTJrYVTSGjMwizgObouixr/Mpol7JCYjiOPDdrzjcuR7qaADTthcVwClsHTiVPToCR64z
 tSjt5HhS37iJkGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e1d02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FyscYusVtPSbMHA5wp0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfXz6HITikSfrjh
 91TG2D4pC38Msbn+iFbZhgfDwcb2+HvdvgVtJrWut/f28qB5Ajzr0dhSgpiJo+NwqoKoqzxkl4V
 XyN9z1mcPJ7G6Q6tcgrb8ANJg84gHsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX/D74GPRZjnGi
 n+s5BOiVw931/AOW47P0fcS6aXlPc3LiLPLoU3ZxRxynM+6bSs9jQ6/nhQGGnFwFIMGPDmPnnPN
 rybK7JCSbSDL3RjziE5cSP3TGv3pMCnatHaxh5zSdyMvbF+aWy2zov9skyV4jN8iDIecPtvpjSt
 2bav5DUAgRhC35B7uoCJAJ3Bi0OSxO33dI4LGnhl1kAkyO8vn6T4LuVX37h36r503hLOvep291W
 7Uyh3ArkU7k/e2ToKxOcjXIC5JfGUYZSeS3gSZHNLHKEhRYH7KYXxnDgmI3BWvg1VdmLqUVn50v
 KKrJIpCKaWUOL8FMbvC4gK/ankjMREwO8apAcmLwgah79oK1tNASYAnTSqWAd1jGJDFOjQ8OXkY
 jPNqhn/H10yuFPx/iyd7Ow5Jhzuw96OaMQhCHCCMFn39wUODOG6PnuOTqr7SLU9xO7yoEfC0z2M
 fAjykxHi1lX5xFtLI2g==
X-Proofpoint-ORIG-GUID: TAXyqlBM_wEfotnZ5V4dl1Amx_VZQ3Mz
X-Proofpoint-GUID: TAXyqlBM_wEfotnZ5V4dl1Amx_VZQ3Mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

Hardware needs certain levels on rails, thus document it.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,sm8450-camcc: Drop qcom,sc8280xp-camcc from "if" block
      dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8750
      dt-bindings: clock: qcom,sm8450-video: Require required-opps on X1E80100

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml        | 12 +++++-------
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml      | 13 +++++--------
 2 files changed, 10 insertions(+), 15 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260708-dt-bindings-camcc-required-opps-bba9dab23638

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

