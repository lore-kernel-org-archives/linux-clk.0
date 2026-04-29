Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F29B375F9E
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476297; cv=none; b=cDZeeewEyJfnErNF+XQYxJX+tqKC6Xh+5F8oekxXSEUWqLvra/cCfTqWrwsLwhsXcD6w1BJBWnshwjg10AC7iNBaK1867EpIfZW/NMhpDc+t+5D+O+0rgMrqRvCv7jGS/413pyvCyhy+k3StoDv9IdKlpAqESYgX4orozYpq5KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476297; c=relaxed/simple;
	bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBFZru9krcsYOXAfJ4TQRhI/RHx/zhcnW3TimEnUpse9BTeclJ9rCLL7q6/U7Pe+NSiIcrg/b1OT3SHn7gWyq3muVJFOpNckiOinxG8Ua7GMU6LV41I9RZocbN2tmAN3bVHrKLBfEIX0+SJYpPlDp1xw3PDnK+mtvD0ltcAHBf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8oqG2jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPQ6/FwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8oqG2jD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPQ6/FwD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEQhUK1797251
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=; b=N8oqG2jDWombJYvq
	tZsB63F2YmRClEKLURoKXuOpMS/B6byGpue31iVLZROIriU/aLbommp1WCdYe6aG
	bz4gG5U0cVSLqPYKL9GdwnTknbSGu8E8ZAJVpDWLMCZSQvvEfmAdUGdf1XtBuTfJ
	oczLT90+JMv7uR8vCE1Ts9Mg8TKcS5LBIouSD3RVp9Gwt40VVyzH624Z/8ZNWZaN
	cBjzwH9ys8Gax5ULFSEz6Fr3gY62cm/3IiecRfhS0wpePgTeZxIh4/3na6obVRcD
	0PUGbyd0iKZ7Qcs/DnwQY/kjusRmZ3x77OTncVtmDB7SO98WIivai2H9Jm8R4704
	Nr3TDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp0759-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 15:24:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso14187369a91.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476295; x=1778081095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=jPQ6/FwDtJanM0DyDNhpAQO7U1HzRvaZW9XSIQwJha20Z1Y10lrrar1cILecs8q/jM
         iUNl8q7hMImBzfRK/CDq9y6U8VFi0Cyi+I8cHMaQ6rImToN+4U44w3VWvj+aX0EV/wRD
         DeA6T5zZUv9ajNk4UbRig+0ij+uvCo0fJ5ozfhn8IZ7fRWIWrWzlkKvFCUm61PKMjRpd
         vhDKo1TAe/Ho6MJqASmFRCRjljhCbZkANV/eYoiINn0IVkqTLRnZEYDanuPfG9qHiFqq
         NLW8dWqt/bkCjBD+y1a5CTCjU9zHaw7iT/s78v7A3rLFByxB4i3rgBpaoAY2ZqmyI+iH
         epVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476295; x=1778081095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=WzQA59XLIEdTznpuFaQ1zU5m4xZtBCYUHgUd+DnxYgWPkGLR6/iMDLAu4P4vUaPpHS
         MDKABmn/hDWINBd7jaigtZ6YM4+uRleGI7NkmOU4yBA+nEajEGOkGxbCmddME6beqKZN
         FMSrqetJhJfqbkqIfDSUOV+cbPtOlY17pAt6cV25ROYPg6sGhe+CW1s1p2K9td1mbu2R
         J2kHUypYyo5bBKnBRqRfdPacum9/XvREFThytKkRdQDi7GOk99O1nxUds2j7ZhgufNMH
         XNSrVEFhXCff9FZ5ZRfSKQpjxLHhHYDH+WnquqskrISMCJveePwOSxULHlc9rYO8jzVE
         6ZhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/p+lMllxQ896H2avNpdyB6G3BohFMXfcaEeHbcd0jqCf4gOwlLGzRRrQ70lkuZB7WW/fcrMj432k8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2iI+NwPk2G2DyeXqsNU3sdHtmZkGliopyljDmV848BVsv5Gnh
	hAWYDLK75pAZsoml2fusJGP/isyWTZvrsX7aLwC327Tnq2Uaxf1tQ/bW+SMPCophjr1Io4OR4V9
	Am+LZv5S5MuwpRgSWW8xDXs/MXuOIPqJ+MqI9BvVzc12OwWnMVSwhS4l1agH/cX8=
X-Gm-Gg: AeBDiet7mYR6AkkZUBRoVmJc/nTYmXar0AiPr/onIC9/JPe+GQnZ1qiMIGrjticYqkh
	H1KBsF63p7qXehxAih1cL4OlvMdd2696AEi90A/E/EsTx/ckWWLpw0civuuVhxrHMjSa5m1IKlZ
	5tXdsvsl5UAnY3A4G97Nd/P1jdUvH5bJN8x9yLDQ4NmHE+0mhOVeDVwsuy+wBwHpSZNRQzE8AfM
	bcqgUoE29xVcIa/s775W8NoHBfwZG8WM3hgp827PtdC13Ie2AULU8ugCYn5K46eMvxTbFoVQWZg
	pIN/rwTJovJpa2bw11yPsJkRpw5P2BHs9aAPXTHBTB8xELwgLImZXM1qHYxebnii6Z2C98bIXzL
	t1jwF5UAIM8PMmteqEBu3VLaiQW1XesyoLq385FFOOCfitIIhCwuymmDjCKmecoRSGiyuLLybnK
	r2LqTQMkTN9NUuNothJDMhPh3Tcyu2FgfNB48/sEdKr/Jh9/8j+jRei2Xr12VNP54u2X4=
X-Received: by 2002:a17:90b:5444:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-36492055f11mr8811644a91.26.1777476294815;
        Wed, 29 Apr 2026 08:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-36492055f11mr8811612a91.26.1777476294352;
        Wed, 29 Apr 2026 08:24:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:54:24 +0530
Subject: [PATCH v2 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-ipq9650_boot_to_shell-v2-3-9b0dc3d1f3a8@oss.qualcomm.com>
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
 b=ZiGr36yeLWDWz/rwMpos3EpHE6sMlPJGhdwRjn53GQe03ljyPYrbSrZitAR0iHT9+PWL07Hzs
 eLR2oWrl5mlDp3lpObDcbE0nYeU6EOzow5MCaRcZ17MxBcAHiHVDcBr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: Jtqzrlg7Lwulv1eXbi7zAgcF32D2YgMV
X-Proofpoint-GUID: Jtqzrlg7Lwulv1eXbi7zAgcF32D2YgMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX7hrbmiOpm89y
 i1vr5+RtANI5r4lrrZtXrAwTpDRY9RlxS6V14+zU4dBYH75bov4EZT83TsX6ejQbtgEbSxkKGDl
 mRdORopHL/ag9rIe9NL3RwcqPszaC4vr9M/maEY4E4FRcKznL+4MT667UCskpfCRNgKo4VYhRBG
 uyj6OLQD2vq8/ZupaS3YPXiynwyH8Z12Yez++n0thD4AvQ9PoS52POApJIC/cpuZKciizuI0pSK
 WA21f/rvxL7ij9c9C6ue0Qs/Qwg4/pFikhCAQVRE1ql1u3sKcAxNiF6C+lkZnbD08QMAuNdnaVn
 Ecbgl3q90UPay6hBl3Sc7ShYjwepSye2uQq1bJDKenACPWA3i4IkCuJyncbO44yCIVp8MY7waPx
 1qzmCVfgODhroDXzLMM0QKyLSmRS6zU07ri7iCTYs6IXs50CpK/KZGYuqmkfjFpLRhDh3E/Ox9m
 nclNNQeBX2txOM4PSgA==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f222c7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290155

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

