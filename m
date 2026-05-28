Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CDB3B27EE
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962862; cv=none; b=DkbnHL5kC2Wk23DTCwQnINX03oomeK+035cI/zk2gEyVXEBRcsHWmlFOs38s0juHuHsFpEooCF0HxSwI+8F8C4VT9SXwRvkYj/jJNqnvcxurxyajabWYF3cnP6PmEELM08q/u8lG322xgJYxUBhxvLHR4QCpC8OGXVS3gDNpg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962862; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4IghNlzhL8WHagjrUZH5KmklIADMM/sVhbw+vWTHHBsjxhS4qqs/KqrU3kbmx+W80kC+3ec0YMM07cddHJ2Y6Rqq9haNgr11avGgugs4q1nXlk/NZtyKqW/18IGVmJDEDWi0qqsWtFvr9iAU0Q5EkMggFbRucX8LFonyWWyKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwzFy/dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4j2j3bP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwzFy/dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4j2j3bP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vL2s1562612
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=dwzFy/dxDSjeZe1i
	brzIoaqpVs1KQRON13rLJONOW8itu9kDmSm/IeE3bRYRuJmlgRMtVvizREiYIAUD
	x/rLreYicl6Nj6+JcFT1D8mAfCU+h407kKHNPNuqBf/h11APhXVVoYUkd1dcR7IA
	Zn+k90tVdM/K7COfNGyGXbU/5m0FocIbwcDvoOfBPn1QftMZccQyznpHfOzMQ5+8
	jLW5cNyimstN4w3b+xcbsZ/Z6V5BtidvOu7z/3Xj7N3nERU5Qd8d93e2yMGrhX8x
	PK9lA5IoxplNmHbRkxK4Tfk5+NX3ClAl6yulptV8SWJ3yTsOgs/2l4GDgjI5T0x7
	9w1zVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2tacr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so12687574a91.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962860; x=1780567660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=T4j2j3bPoMECNcAhHU6+sHUzfMTQGSrEwcB7hkTtl0hpFE0HhFdobppkgZfjGh1P6u
         5YONvfSEe/C7GbaOVYMt0CfDT18mHzX3jVq+Aq9bP+I1PW2ndKQ5bbdeYtgBPExydjEk
         78t0niIxpSPIMGaOzby3o4IK1HYExfcZWspwaJhUI9DeKCHynzWClauCM6IFep3sCSqk
         OdeIxuihfxKE5R79E2HpQjPNKpAxeVJKAqTIghTi/f0BBaLDHcjlsIL7WTF51KjoRr0A
         DHekwrN62WVS35jRuAnCSlclSR4FMuv4Dh6T3hYPLNBTbDNUDVhPMvxQWLCK4zi21vjX
         PSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962860; x=1780567660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=ZXhQ+aUN3QrBzq8gPios0swqQUW6M1hpKZlaHyHY948TB+oZnM+tGG+jUCkVP1Yjkk
         sZ85sao1Y8c36fcuxl6UJb4Zk3VomZg2fAo57tutXYDeju0zsuEB8VBflp9SNnAFyLrt
         AThvs28zIXfwSQ7UVFaBd2JBKX85CzAZ5aWXArm9b5VtnjcxI4OUcLLL9sYrH1j5lrfi
         2ysS+2tPEZqDQalaZ7tcP9M0H21Twtzp08wdvSzbInypef7uyaTV6SpAXTyRSZYBmdMd
         AtktTjR5NxXB0+ceQTc1gfzMfi7Sw7CyGc43s8CgOhhXgbxshMS7vlRwpH0UeeyLZUun
         VrMA==
X-Forwarded-Encrypted: i=1; AFNElJ/nnVFgRa93TAw5m9aHFmfflyW8Od81jkZyT3I6hSILH8IOjpUMe4bF4czWv4nch7Sif/nM0+DB5Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0nnNZpGKNdUlSbcKqU75Bhvej9HGwwvKImxywMMKpIOhCHXDj
	0nwMeWgsm+30khq1T4rRDoEMSxa4RXdzepg3/P1EJ3sOneoP6tWXnbV9BsC5dbMQKt0GXHaQEfp
	u2JU+BtMr6da3zaviftq6h6Xx1ie3b9NalERaSIyvlNCdQT2aU1/l8uYgYMbdqad3xKPp32Y=
X-Gm-Gg: Acq92OE5j5fYd+IfykaHnpBAakVWGsK1/jMFY1khvCVu++0mqCXFlskhYRMRDA4X1SY
	NpyFFgIHjNFQZwbm/xOyUIdkCIemM+DQyKsfFAv1zP6MfxfzcSpEl3Rm8jc5QogIaIGoUV9lews
	7KE2prYNMeEQCgvv5TemfuYWPCqrh74qJOs79qNpiMxkOyj3UNmD7PIv2D1p3scjNMFuKkZzL8m
	BpmrxnvYCLtNvKkgb+KQcr0qWAkfm6YNDmoKyev0CcEaksoPwzFHagqNygFzW97XX5SNLkkDOQL
	3ZWDJJsYTEUaHHK5cxqDnGCyUqKkw+rN9/rtjPRHarVQQNZUqa6HnxVglTq8wuUkJRCPVyDwLLe
	U3PsLwsefMymCCPyUPBdn9ZqM/O1SoRFBIV9p2zeda6xEcrH5aHxBz7McazInEvY=
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr17921115a91.9.1779962859818;
        Thu, 28 May 2026 03:07:39 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr17921064a91.9.1779962859303;
        Thu, 28 May 2026 03:07:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:04 +0530
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-3-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a1813ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfXyI8+nIQ+MKR6
 gwa6b/gTyqfIm028KEvmg+J8zOfZ4wLsY9Iv5A4Xu3p1y9i/XV8VHlG9QUoDKf4I4JkFqmBrr59
 wBaNMv4ZTbRFjtQZ4CZ+BlXnkik93V0h8B3SK780TXvvwDbgAMbgv5B4of/OzoTYVovE56zj8C2
 XFkYPtzFcdkL/jAtwheoTma74Vg0XzM66r1VHK3OqfUsa3NEwQG+nL70UczzASjQ9jjBCDarKKU
 icK5c5XBNtCdR2Cb29C/MI+b21P8ntD+QNXgYtmFVXbitQPR7qBLTuYWl4e7ma4OQWcygpbauhj
 xtkk7I4IEmm5jIih3TO4K3H2BPYG1UXfGCWOX6Hl9GURVRl5hIRvGzdWJsCW6cZVoKwXgI8HKZA
 mSMvQzXkJWO2Awh8gpqSxc+l34+embfuwQHR4eiGjC10mmwg0pgjfz65ilSxO7ErUcQ3XyMJRFu
 TjFYw5ZjkvoVYVqMI+Q==
X-Proofpoint-GUID: ehomqdw_yBh-QOXY3GZdqHWNd-aOkTRF
X-Proofpoint-ORIG-GUID: ehomqdw_yBh-QOXY3GZdqHWNd-aOkTRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

