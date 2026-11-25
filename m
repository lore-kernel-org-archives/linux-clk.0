Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612705;
	b=2qI2SPWyvXPrjsBZnUi7Q+d/9IGTRcPWZVamZyvzNKLkR3cV33XN/cer3HscLHJgaM0u
	 C7nfr5QERmqX2WCGs+J9mbcUo+7r9eR94fLcgJG/FsFL8Peqxw7XMgaWurEI88GFLacAT
	 TkUQpNVBeELxgUePtA8evZnijL7pu8+oCrrcJ543pDrtRlGVDBwAYyfuGePS9xVX43DzM
	 tUpVJ0PMv70AmDzFsvG9m9mhonJlCm9oVzflOeGPA0ASC6tw30Yopwcpxnyuifzx3K8Nb
	 eXPHUm2LHKOi0Bcpwo4JFKGFM6PgDlDgbhsqYjRhuRz1PxznLM5GPokuf0qsuuHHP6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
	b=ktpg6U9lX4YZCdtnp+4b0kHKpQAh9KgxxYHVTOSCHCFDYOFea0y3fdtWoP3+RJGuzXmd
	 2UsaIb5ikdaPwHWdlWM2rnVGx7MfEVI/IwxsCTWCRnZrO7jPntdojPbp/OTLuvY7d6w9D
	 IKHEqQPpjZpHOwzp11RPoIioqkUKSFg+uVZyOEK82Iyh1jo8GOCd7Xc32evF3CY5A1KC9
	 RUjMV17k24uyMGi/CCBG4/KTNxm6MuPWHmKv3IalGnrUywRWLJtY12AP6E5BsopFRqMmx
	 PM/4pEA6HROUr6SmyL1lbqoY1dwC1aX1tgUHgBja5eAA9Vl9LF5Aa0QM5V9h+n9nUJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZu+4ZTF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131A606A682
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5131A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZu+4ZTF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTLj3764064
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HI7aISuqjbP
	WHF0PdzqR/2jami8T0DRVhsGnTdgpivk=; b=ErYnkSnDc7f97tbGOc8/ua+RavC
	BuGi55Il0FnifFEqK6TzDd16wy3HycBJMX5EXrtDh9LWeL/2Q1IF3gPiDmZUxHOU
	1wBdmrTlqrXQUcp3aZlfwswpM7PsPGcZWHlXHDW3Ge0N6QAQPtcA9eHVEqp1Njdq
	qPopGSFaA3/mBAfDr19rZbYamkOYFTqQwRVa0u0hlFvgYKcV+7+/taK6ibhqw1Nc
	JHEsAzAjJvXOu11BH4oicWRoGDwP8TIAuLB/s0t34SD/X3rNr3xe/Q9F1PewefCS
	wSygIo/wGMmVWDSckSrgVaKylOJMUCdw3vtsnoK8UY4isx8hBEDg52L+fUg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rxpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eab0467c89so6357964e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612702; x=1796217502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=JZu+4ZTF9h6IfWM0P+qjkQjHacqNGf8iaLZXFByi/Tyb1zJlzOpTg8n15IVkq93hVb
         StxCF5oqnJNwxLemcBAB4hCSG33DzTEpIQVR3cFBJWDkhM0E7aeyvQY8/7OhL6fri+jp
         oGWz+t/irUdy0BqBy9KuGie8M/S0bB8/DLU4M4CbljVYJNFCKETS9CDFIH7JDvAOXpxC
         4gtZ52AyR9jIWNwLviRgEAK/XIWbFPa/FQ8HRczZ/l1ABSDoBzva7slGrR3PnLceGuVD
         mKLiYOwFXyJpOV3tFtFS0dJw7t9aEtFrYL42kaAkF+39Swq1rEfxAQg2B2y6oZtIx/kt
         pBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612702; x=1796217502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=q/xIb3PGQx6ABU9owXbX64YcRGJe7TdwBOSL0vTfuIpsjjGDwKt4lS91UTy4zDCU15
         pKL0w74tVUhCd0leFLRBfD/ia8XJV+1gwcPX4XPQjOOmN6sxFWe+yWgsObQsi8vHk3J2
         n4aw5D3xDhy4PK990bVLLtCofuxDOQmmK2KtyGQo7MVhqVoJ8ZxObej6VpAz7lkXxpzx
         12dJUwkCUo/wX7I3b37mO/q4FgWFhT+Yhh4nKeJ7RlGFDEyufxJl3vWnV8xp0A5TxVUc
         3fFV+47GtWvAiGdoQomXkWBnCLHIGO4T96Y7e6vN/9+OMAJx25z7ToEc0JSmOJPvvTHd
         CIYw==
X-Forwarded-Encrypted: i=1; AL+hErFXQPxZMVrBnfRQls0mwZYsQhCUxiks1kgMmUcdkREOVKrhVWHyS/uMQmI5yk2iWEyjVGUpjSwAXso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qGqsQptnWVJ+tBLoTbTGdUzHQRgRQpQeoBZd5Gx+EJhUvDnOF
	0XHA11obkbHuOlnSulzpRNcvtUKiu2IlSVlpqLaBbe4uMKiaG/ZdKYbs6VFs+LRj7yVEjM9hsDK
	hkOJ0HvrSydq9CsDPjf1hpDyh0Wy9vXi44YgLXDNZq3zZNqcGPj5qj3n8lXWEcaI=
X-Gm-Gg: AZFdTZfmMS0fILAnPVZnjBoTTdAGpRGAJSHTJhztzwcm+0YIDzGHiLixzzq0PNwBGtO
	iT8MweME1Nr024lKvNRs8cQJIko24a2z071gNdEDg34JplGq9I4VbbsLfKOweW1V4kdP2Cm5R/W
	wbC9Q4AVi97f0WVK7jM2hPWf1G7/Y+5wUyVueubUhT6zScKw0G/JNlIuZZIvfLChH2sDSPZ7IP4
	Vcu4BMzpImn/axbWyFnRocQq3o7fFWwOyKF1U5/crN93d3lHqANl8kUc2Y0qN39+hi8o91+qhJI
	lgxBtKI68JIcywhLkwdmsqk30EbcfGQMivVAaKuqPlG+Frx6569mZrFvz9jXtygooXdLjVVl0du
	aPMBekkHVdQaceTVuyRXqoEyByL8OkhEEVVmEmIvX7/MT04SeW/6WuBV2lMjoa6IU
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257264e0c.1.1795612702589;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257217e0c.1.1795612702105;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:55 +0000
Message-ID: <20261125131757.1163466-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfXwMNHL16SbK+U
 fTzOLt0wLLCEDrqHHwp09EjGUaxplyg+Z2AQ08DfZr8K2Ve+AOrFCHZCn4i8IG/pF6eDt0ZrOK4
 2S3ktHGW/58fKq3Pnsa9w7yIVNVYEK0=
X-Proofpoint-GUID: Uy-qMUNF-0-9EBGNefx5eEy891hOKdmn
X-Proofpoint-ORIG-GUID: Uy-qMUNF-0-9EBGNefx5eEy891hOKdmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX+iHlQQq7D3J2
 LT1w8/eU/83Xr1AaYoj9l/pNBlswDkPHPrnGP8MmRR9yc/U4usM2tzts3uPgOtIx9bM8H61epDI
 j0OFYC1jIuw5e0G+917vCf5agPB3pAgnYUZtJ48fxnGslH4IQeqwg+WJDx+HElI9oR/hO9mKeg/
 Ahv4R/LrrJE7MBiazNKuYZV5TSri6ol5hM+WsdImBtVXqgpU0YAcT81qeMnD/bY/lstnBjJVZlq
 gs4pDS4TS+3l/6Ven7QZrvvM3bffX3agpXUe117aYTCSqclLUSEMR4r1sNppzfeWCnLJJKOUN+G
 1bix9oHo/5ebFGDz4cT26EEkR7tuF4r4wiPNUC6OBuftRomU/830Z9rUjlXYPnn7n7PrRATehYU
 9CWZ0Nkjtd4/2TI77AQuMA1nm5l7E/HHQfjL7sLIvp5CTQG2cKxGu/CwSkDHy72mWCDkpmK/39J
 tsYI0DWk3n5p9F9XXBw==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06e01f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uR8O5Y6ZOet9NXHzM84A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

