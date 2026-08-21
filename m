Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046904BC017
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328591; cv=none; b=MY1vJ4EelSeJShX9c2SY6vrf58UoUYvDMkWyXmMr7JLs+rX/M++yqkDAZYpPqPRVuQuvmVETnMK0Sp7i9+xEI20fy7YSRnAj0z72Z04pYsi/YvJah47c2UCmrzI6WL9C58xFvzchZh0FFBqAkBRhuNPiXr4xUVZaa2DaKYPjpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328591; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZw9llH2qLumHuq1xVYKrnRUOImP+0LwMwm0Kfpq17RLLXIui23aPlneQmHuMCasZP2ZZl57in878LDERKbwBpudAaiVNQFVzIIdaGkDlf6bZNeXO5c3aGWqyrwjGuvPaOmrOVKiohFz6IqNw9PUZxfd7ZzKtSv4w1fbQRtY8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvNWmG3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg/T6h0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvNWmG3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg/T6h0N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFlwdx3391851
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=HvNWmG3cGQB5SN1o
	4S3jxthaESGU+fyHigSOwfsTnZbKqpVnpCTbUecz1r5nSNMMinJgUXYolTR6o3ie
	8wT2ApfQ5/PSaP1GxDXac/14trJvUBgn9tAO7dg+OphPz6xc3jQIVWU9RdRzFIeJ
	ScK2Pz+RmxS2j1IK1IQfxdtwJTHNET+gP8z/o+9WwvZ/uyBRlg5yyMDl5RZGeNTn
	hiQjUdmKJb+cX8SYYCx3s1v+TjYuRbNCi5Fj736JNVVo6oqkrkthuws5OxUXtszV
	inVG5sRuw6mgdK9RC9i8TLgwY4HKQtOJXGnh/1YWyslE4VuCjkxDatf9JN/Dd55W
	10STMA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fuhjf8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2086381b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328589; x=1787933389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=fg/T6h0N6gDyPrnZExDJ367aZ0Eg/Ku6g1Adl7tP5quVU9SJO9StKe6E+Dur94Zipu
         SPu8W3rIRpu6uuKTrIsUIdm2BUk9CF4ikPJrm3FYw6CRZl/+QWfvx69Y81p4kOR9sANm
         9cJNAve0F1idYot7jYPQXNJnxR/WDGZf46t3ZYbYHPoVRNWMnrf+xDzC3Y1UhshudEhf
         QN/ki9A4z6hqOg964g+QnU5Qo9RPSSzFlLPFOlTfhj34O46zmkRfoNXUFOKPpEl/RxuO
         alEIJQ/gG5csaycMQmpxLKwlidNzVSCmEZr9lZ05JEGkV97XbImuVTe16cQUHG1Ncmzp
         KjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328589; x=1787933389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=l5bG/DwbGW8D+C/JCEqjj+SFIuPuT5sxTlhjmPgrYPpwxQ77zFCZtlqbnzVAf6dleC
         613HUTUPUfyQY+hFHN87GyHmg8lDUOXS610flYUipZec7Lwhv9CqEF9oQ57pszXomIjh
         U8jlTuRqAitl2vZODZKphE7OoYUR6ZcB92PDLewPFv/1I2wTPHlST8pXX1/vPAIeVI48
         XIHJbrWkbusiJ3zDHDE6t9TeXOEx2+x6HR4ui2bUnLcrfIEFGelrQlWiqhqdDRk3cmtG
         W3CtqSTBMXtTrtWoytOfmCSym2zaBpsCI3XVFGQ44PNjk8zMRPEkcP3tr4+8S0ns33/a
         2rMg==
X-Forwarded-Encrypted: i=1; AHgh+RrqloKkqYSlGb+i4woyuTwQqfi7+IryKBccobveU2qV9Sxk5LAKbVX0qjZ3TMxndObGQbezlKSUaXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/W4+KQRKr8ju0rAJpkCOCvBbWRvUSao5ILLoo5+t80yrbjIl8
	/wZFIFeI0q/ZFHEdCIxmx9pufv+hryyU30xRDLgmkMGszVgDjvSpyMxUX/+Tyrq5tD1fN3CQkPk
	5hcmJmi41d13irZoRG7Q1DD6DT1CZvAObosOQXmtpZtfcDbIL99nexkyWrcMeON0=
X-Gm-Gg: AR+sD10W2osK2qhvxK1Holkf8GVP2D4wV0cNWd8wlV8Tp/3V1loksuMyB4+0nsVtBn8
	RXWZZNUj/1lz3pyaa7JVzGI7yLRo5t5dX0TGDDWTrYTAr9w6oRipJpuYCuFq7UT71koi/N7x8DM
	zWywZNWuwsIdPS6wSSzL0S6methSWj+3oeTn5IPBR2wfoNK9eb9LG2u6qMwR07mFIPUinwHWCXj
	DtilWS4mbLBtO1/5nYsz1PPZyCYhnGSm/5K/YmLm7NWwVqrdwFQsgHeRCzhUWGXAvwUFuJcSnKN
	KAAIU1geEzwnXUYdqjN1y/I3ojpt3TM8y+g5V48L31YbPGHEKOpUGv2uwQKKtVaC8LeGrec4sdW
	bvsWV1zSncGqPoPAqlXmnUZZChLXhe0JZ3ZT5dvBg4V8HcuAdhF43INvEtAdqZwRZbXjj3A86Ea
	1W/A9YKYungXz2/RpXo61B+oM=
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078455b6e.3.1787328588593;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078344b6e.3.1787328588130;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:47 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:57 +0530
Subject: [PATCH v3 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-4-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=9IPV7eFcmcQy3YV7XduUDzVOHCb0O8TQeRqyjO8MMMACqn9sPoWMnZYcaAMUrzKUCuPu/vqFO
 PVRyy4d1nvKCgSpIwfSYSyxpTfHjH7jkE0NF+jGaoQYV7MN4Ry/ukC4
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: EjN_bjNlN804hYGSt09ZCQdbQb6_yozb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX59qo/kZT9IM8
 1t61mbq3uIJPxiDlSUQi8etQKGue1e52jF89uRGY5kwXx3cuaqZRXmTMKb0S/cGlmZnzRowhZ20
 ZLhMj65rm65pW+YALdx3K93kJBxhloQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXz+lkfq4qOnw5
 cwR3NPPxwl2cjlqMu/22iMWd3MoQuC20yZUK8WjJZ9iVnunINRWdcFE+wHbtdKJohlJFicEwtYu
 BoYH4zguvFvwA6wkY/D+Dca4bYvEikINJCFLEAH17EppNU5ZmBd+5DU79j5+DSjgVKmrm2+QaoU
 E4j8ah8Spn+mwSVhS3gEGkIj+gMIjWpmCPRAlfgt7UgYAKf0TGbne0Bmlk5btfwsOR+Pel5jD2M
 wVPJYXlc19EOmLj3BAfVivRl/FE/ypMFNNBztrYqTwMugTvf8eemxiY6bA7JFCo/H21MtoLTm+k
 aStEyL4Ttj7iDbl4DJi3ObNBvcgfqL9DcxM675Ct8XZruj6+gPNVihh5GYNu9wSh+n77EHfUjik
 gdzYWyS1EQjf2N85cTRe1VwvrCnhTE8eEMd1WvQKoUL7hj7LWxEb6VKD6M5pe9Yz0Pfc9PfnqKm
 qzFGl8HuyRfRg0T/YhA==
X-Proofpoint-GUID: EjN_bjNlN804hYGSt09ZCQdbQb6_yozb
X-Authority-Analysis: v=2.4 cv=UtFT8ewB c=1 sm=1 tr=0 ts=6a88784d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210126

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

