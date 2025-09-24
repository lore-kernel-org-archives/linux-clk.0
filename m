Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68241552FD
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754747; cv=none; b=MPoX1mc6EXWjMZfnvNtHGXpVyj/IOIXfzjtXtg19//OXqIl5kHMjBaZ92HHrAUukNS40oh2OzzjyeQrOwg99c3CysayX6XUHsvtUlSlODLfhx/JZVTNA/pCy2eid3Hqj8AT8ezgCyJP3JcMWFD6Zc/SbF689jQekLMibiuSpQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754747; c=relaxed/simple;
	bh=nccuP8cYHwqRLgitAVKUToM+oD9cA22ZoDKwCaULBko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBFIb4sHhX4A2iGa0yoUGlF1+d0fop9BUyPU34CBmxeMQSt0PkpgoMn38RxI/Fpr/tFATQL7NFMQ+SqFJxa27VrmGtceOfkxrGYxmKQq6yX6e5AdFpzWIzpN/Bm0N/MSnolpMzmu8htEaDXu/jLRVC4fEtwbDnqeq80cXi9Ycc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm7k6HBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm7k6HBI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFGIu019923
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMgpIMFqrzsSm+B2qsU+OeemAY/LmfQHctAKtQNCtPI=; b=jm7k6HBIMgEFJDiZ
	YpF0lrJNdphuFuYAUSKWJNdvWUN8N2M8mRSRKdgVf6jUxuox0NWpgr54BtWegrmJ
	Ke/qFPoLGubR9H3I8YhH9xIng0JHH2T0lRNDRqbjFPBasQj1esxtwivShQh8H12o
	5MH3e6hopPigaf+EJJ8ZFvn1Y/SiMUu2Oxg+sRD9vbX/fGILbsw1zcGQeoUUIkOW
	sg6xjDxmqwy0Zc1VJVxKa1OuoD3Y7rNPcQOv0bdCU8pvdZHa+fK5/kY12VMnvG2T
	JLKhjNkzoCclLZrJtY/3W6SFqUEzl2A7jkJAgfvkFGxvNCXZKWwIfnSg6B8gDpqB
	chhaxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy6e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55443b4114so202931a12.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754744; x=1759359544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMgpIMFqrzsSm+B2qsU+OeemAY/LmfQHctAKtQNCtPI=;
        b=ukVKWqD/pzVzTvVHPuxSuaqqH34w67K/8T530DbTdxYU92iPCj3ZAhfH2wyBfU4u0R
         DWOsqBu8rnjOfGHrzaBI74yjF9cx6uKrSu2SiB8yYgiCna87Np8JVCrRsfCagJdPpojD
         AMdKdEBSFCm6IcvNZWJW+6DTD3LTm/TyKH9Oy26jknGYIyvFFAzi5gtHDjVT3AfblPn4
         /Zl/OOZue/kXNcxIiXdHemu4UTWKPSlq9d27456ilXLkH7j4dmRx4PE6HfdTqq8+Vjfm
         kkENBL5yD+nuibw7GaxbqQHS96MelkYc26xk1pw0Yf9C+RuzjrO4w4inzIXAI+ZiWTQM
         Gjzw==
X-Forwarded-Encrypted: i=1; AJvYcCUwUXf4e7cu2UpZuCqAcOF9COjJlaEplfx0rE4AuDG/dKkt1yGLPRcZM9wXeETcsOGXngddQhdwRRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysj01Ow3gBI4m5e4CAsdAJcv5tsAdEKomGqhywsGj/BSRwKcHb
	GqSkiEizJvOcq0/VcOk2UqSWlfmEFmfmkoNqw3k470UeRQ3XfSf7InztfnnSsWbKTcrKVHvKKQV
	0dj5R5nUj1G/hs79aHK6nx/FHOGNM+m3/0gcuzJ4oMQkD7YV0nhvjR/oUZ64y5bdPJsKXZ4L2GA
	==
X-Gm-Gg: ASbGncscXSqcw8kQ2hWAvpWXZKny6SFnDokX9ApmbRuxyqI2nVfG0T8WahxmTae88zo
	Ch+Dh/Jbj2kMZvnw+QFW8kiqsgH7kt7WW5KMGnzCeI5CZYQi3syricMR+Y92sUkcZeaWR2ZgWpa
	PyqxjVmjUSS/wvb+Ky8x6agmt6CSEWJHKW18BOPSu1gIZtIEP5Djp5DOK+J+h3Sg2+07j2JiHZc
	UinsUZDaZnMU+DsmeFNiN5aMWrBcl/lToQWkd8UJq7c7PZQ1I06FWgnqChyKZS+OI5c513V8h9Z
	muvnwjiWcXW1b5fW1hfSHcY2IdApXNvk6tJKyqpQa26SCJyafqBx0AizB7i/a1uW7hn6yBhSg3+
	S2lGnV7IOdGtfITw=
X-Received: by 2002:a05:6a21:3396:b0:2b1:c9dc:6dab with SMTP id adf61e73a8af0-2e7d2e45e02mr1491877637.48.1758754743795;
        Wed, 24 Sep 2025 15:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXb9iTgoVPLaR0CHqKB/TzfTzAqbsVbT7DO5mubz2WWzmbtksZ6qJqUAfhpQ7FIRENwBXqKg==
X-Received: by 2002:a05:6a21:3396:b0:2b1:c9dc:6dab with SMTP id adf61e73a8af0-2e7d2e45e02mr1491833637.48.1758754743202;
        Wed, 24 Sep 2025 15:59:03 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:58:53 -0700
Subject: [PATCH 1/9] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-1-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=821;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=phKtN7ebMiQmSiG9AvoMUJXIakeBUvWlreynI7Iyig8=;
 b=/3h8ths0TYSVixc4PJayGd+ZArZnNhGQdhWuSaG6FBjv6i2DsdzTmRt/5hBJ6Hml81JAvRwgR
 UQ4zAULmxV0DoyWOG5l/TEUw5iFD9IXHvhE/n+LddOV7VNcB3QHbzKQ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: B6WEBj7sggwCL4e6p9YrIoARTtXS4ydp
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d477b8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=b6mPgT8S7ijOLrz7_y4A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: B6WEBj7sggwCL4e6p9YrIoARTtXS4ydp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXzzTFuE/xYQZK
 m0M6FUcb9irZePh4zLNFB6HX+7mVnoJlWjkmfshXlvjlluXok5n3JdmA+HNg2LhS49Pvzd84Jed
 s7jeNryx5U82tFAsHGEKW4dIpb8h0FfCTcpcVNrqzyfPg5wL7id5H6p4f8j487F78W3IT1IzPux
 BFB9OGJyns8VFfykcgWUrB6bWzc3cxo8WqFGhGR+eE8M/UdZWWj6ZfUqXNcn7EhGOOZSRhO/lTc
 bUV/kgHx0FX1W4ahHz6c4kkaK3IRv0dMCHADwFj1plpXcPJBe3xZUbBy/g3Bm2zihgF5hJHOCw8
 eqi+QEc9p9rCfVEqUK6eNRPh9zp4gI6HLPX+ZXJapsJ+owVHQ2XCPYKuMv23w0Dq4xq4bL/jF+d
 5DBTh68l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for clock rpmh driver on Kaanapali SoCs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 78fa05726685..3f5f1336262e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-rpmh-clk
+      - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.25.1

