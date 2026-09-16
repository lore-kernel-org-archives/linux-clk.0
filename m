Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7222157B
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537541; cv=none; b=f2lhFr1dCZwlJNX+HOUc8O87d6/qAKUSYM9d16iaF6QCS55NO5DPjvamzGtZh2ZY1h3qpepz+C9dSHpGMwunY8HUO7C4Vxcdb0BxdwJUEcX3RQhVOTregqsKEP3INU/gK4IGoa+zhstedusSp+Lt+U1Mp2SmNi94UZGb7vz1x2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537541; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kex+aQSPnCoS+jdsHTkHqjIOsyc3EF8qupXXhkrmvBgIShpq4XE4FO+781XTBghk6ifaNis3n+EsVY9OlPkKz+XWtmrla5+6q0NFc+RTM8+UcmiN8kbGg+xGmcAi4FoGJLcWLiSLoGjGV5r5Lss28IsSKbUSNWMjh3R4Bjbj7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0DXtBBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9GZVbmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0DXtBBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9GZVbmk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM3Dvk1932237
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=i0DXtBBwQGoiqnAp
	nmbE1yp/fGlML0upLbPC23+jatyfuwvUrr+moAnPYT2L577w0+Jgx33Bab/XQvdZ
	ovjipyTnHkcCY28Jhex21Nb4ZoRJmx9MWg4czE3W7V961AWev1HsK+GpaMDYP5Mq
	OHdN/mC08qP1SuavZUvCsdbnyAWZCKwadDGDLNUlXaIbNlseWVU+c/W+MrlCIgDy
	B9Xadla9QyEVJ/ES+6o4bXV+/LzGR2ojn7ro0PJzuJQHq2EgPC9+7mZbwVaNVeb5
	MzIg2TYNUBH308/R1xId4pMcXHVcBW64B0eyaZKpPsE4MTHuIPmZMjLkXRNQg5vz
	Su73yw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp9f9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so7136459a91.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537539; x=1790142339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=K9GZVbmkxkonX7i4iVzB5riEKbkPlwBQt6l0eUatOLcncS/SL/B69lQxmY7fYm2+UL
         Hx47e+ij9u8L6h6kJaMB66VBKcwLsZk8nf+QS4SpwQ0oWgbRxSZtgij96fztS6a7/vks
         yYxdC9dkweTcCtWWz5CwQLLt/jTPHlv1iQ5oopKWzqrNFtVAEtDX2mqAWyULgX746Dpd
         uhHrEB2mtDJ9FmzL/8Al6nCg5mTSb4CU4zsLER1DoEuA1MnowGnu/ONXmyn3Tt9cpWqS
         N/x+EC/rh/vqKmVNzOV9MIZbME8xvjIpKTNeZ6tta2PZtbxRGCho7E0JH9uo6hcsWBjF
         R7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537539; x=1790142339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=MRjpypHXcF0CERgu8oTLcBuXUzXX6w8adBZVJesSA0fFlHFdeEZnKseMwFf9Q7mjmr
         cUezRHejkMoYEGIPdLeWZsvn+huzK4f4L2tXTv+RlHDpQJHUbbCq1d5S3berBCx/rcxU
         T7ND4TqJ9AwY0vmpwb6X3JdKlGToZkArcM+WeHwqnw/mBhXZZjTglzWSekJcLLVbgusE
         ET2tHNFjpYMBj6LE5grVglUi9z8cAYO/0YKvDeexaV0/Ka48h0++vtuYA3mfyodmbK6h
         yHrovmB8M6Pqce8qiyfvznULWKbrZJMYJyKpnVDXh28/mhF0P+k9Sx+agD6399AzCi1O
         yWEw==
X-Forwarded-Encrypted: i=1; AKwUvBwHCfAsAb/eCmck/nDTLrgRAgRR1eeZvA+8XrVjPgr4r1SPdgk1nN+IS0PBdmo72xkB6TmO+yu2Q0A=@vger.kernel.org
X-Gm-Message-State: AFuF++nhdJ66UZhOrtIoCV6f0okuELnQBpn4qmVPHCX7cCsxQdyCCtFC
	ziQxGcEZLUr4QhgUMyyPJTg0ojF0v+GXKRDRPQkDiAFRVUct3epMcq/oW/AI7cVNmYDH5l/aOTy
	tPeamrSjXD7NgYVMxrvbC7s94o0aeDue6tl592PgOFRxMM5cxF9++65H2OjqBghg=
X-Gm-Gg: AYBFou0X0skQB6iqskoZYSF1QGbi7XsXYfha1yg/C3+wVnQED3Tnxgj2GCxTzPvICiO
	y2ixmXKk1uLaYR8voW3p3Xyf/nQcEnK09uGXQiISAbUlBphZEbqfMu+VsQqpBsrLj8E74p4/Jwr
	hLdCHAnNTZdkbOMK8OZolJ5jEb2UZcn4X6JtM/GSK9L7mkqYWJAz99QAYFqn4QrMscHl9Mpu4fI
	WjKpWlkR0VU2sclNkeTbAcHd5kIR8d+JdO63+XUzYlfHJFAdPzTfmSfmoLeWLrnAMjs03vfWovW
	mm+j/QdzHxEbITRAM7xC+5E3kfOr/DHYVtEGVe0BbeK9aVeBR+ALFJWBm/tTmSJu5gNSh5d3WJz
	/d4giKxLze0a8zdpvHzYncgHeVY9MfoY=
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr2946061a91.23.1789537538349;
        Tue, 15 Sep 2026 22:45:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr2945996a91.23.1789537537886;
        Tue, 15 Sep 2026 22:45:37 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm4357492eec.26.2026.09.15.22.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:45:37 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:15:23 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-maili_camcc-v2-1-f30b394bfd50@oss.qualcomm.com>
References: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
In-Reply-To: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX3a2HXADW6UlC
 fdu2QJpR17NN+A8P1KYqAind6DD8fiMVtHXi2Hj8cBgEFeSCw2oNJH/v5poxNG8umTl1NLUCcTD
 dLkBbg7iZf1rxsG4K5uYF6tObZa5VYc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa2d03 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: v80eXeniRCOLvFy0JyOuVm9FEDg3c3Hl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX9SJ33z/dj3g0
 2gxqfClaVtKFabiTnISIfgteVnLtACBPfpyvezzykrHqOAr5KtMpGPfYnwET0lp3dk6KDkQEWEZ
 H44YvhjgYkdBFSh3WUubtE+pDbJomtQ4Ch16A5h5gY0khqGgguBRd4CVz7Vl3RtfG12GvwcuPIA
 Uxie/41tgOWOMmvFBfoJTlOJmNkDDTmX8ysFTAQXkCmrfGvxFgSV0uQ4NU5xSndj+qJTdkghCDn
 SLy+lqbH+mxmiZuLRcCSkcVddyAtXRmHjq6sW4iUguqHWgozohi47jKUhYjl+mpqfxZkChHDryt
 qB4pZUtvuF/G0BwCFkivrsQyRzm229OszA0a6U5jz2xFFm02m0SQYdY/yhTFczSzHYXw/dvcI7m
 DfVVe8Kl0xRS97wONttAoy7bdMzZs3L6UGMAGYI9QhTEZq1/aUCntWTMQEZsxf9kPM0kJFVGzV0
 tKfBkIwbteOG7qj69gg==
X-Proofpoint-GUID: v80eXeniRCOLvFy0JyOuVm9FEDg3c3Hl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160072

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

