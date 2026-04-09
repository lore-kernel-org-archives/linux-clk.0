Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8633B6E1
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767902; cv=none; b=braNYo5uzxetegMixaKjTHycWumZaS03RU1onAIfuc+DIHfMoKCBif11BeyeG03vPgNesu1cAvYaNH41JaQBhgYvd01QPL1mtO1GKv6C3CS2wfW21j8bb/V+RtII1vN9k1ItOLcpOosL+cuDYm1AjpH3eJ69i3SKrE+IoVUBVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767902; c=relaxed/simple;
	bh=tBPHTDIBlLW7JTM0R4qCnebwpFSDqhthFiS1dZu/Rf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcO2pikXRFMhfxI5G0q2BOYHjp+u+ZWtmd6Uo5/QB+89V/8cM8hsUVKTBaFXuZ/0RuHyao1eToOeIsHIA+0lfRU8i6Mr5nU1DnqDoizv5rN5hRobS8tdoepu3/Gz6/6l/hPE1LpcAeMiArRWematsKyH9ESN8z34oPiy4Ax8fsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxfMGP1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGId8DTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxfMGP1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGId8DTQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KYFQA1972721
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 20:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=; b=HxfMGP1Cc61ZSdNj
	mWUNpK2WnzKM7VhpojosAi+i+gpyfS1JJqxjyuLNHl5hVEYeUoHR766IJHjeaZYp
	PlwG7oOouXwjAC9BGdtWt8O2BTlLXFuT4uuf/avHXU57BPZTZb1QPiE4LmspEPOH
	/zQ+fSPT287CQPB55gPOFvWg9V/rw9H/FeBjJ37fzV2PXHyWTrym7l06tKqQv1qg
	cnZy/OO5Pz0odxvwMNS4Pgc3EzTatWIAqL5DjZeOG00gzg8pNIRDM4N1KfI3rUkY
	lIxoJbDGl2zaxkao3BqhXMXer9f1OEJeEMIgm3yvLLwzVIalzZlszSdZdT5cHEIK
	C9SlAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1n8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 20:51:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ce1fe49225so1248475eec.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767900; x=1776372700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=;
        b=MGId8DTQt9h7cFj8WJMf31qBOuWFZWq77JDqX0GpaPTCQixAkqFhDg+/LS4Uknq3KN
         8uLeRKEvHiqFUgyjNVJ6XnK6cphh6R3l5ulJnZ/nGAcrVEBwo2GjyVfCfQ6xkoPzYl6h
         QMrZSxgrbCVdaDzyUKKMaJHOSa4Zbk5YfKhqoN4caY4+j4YjPe7toIIb/DL0E9TrryAl
         xaGGThvUaGhd3fTnwFFyqg43fFEOOs7CWX+Nm82ZGpkAPh1UjSiO0a6K0Wvrqlw7et8W
         YhJ7cgUkfVpJ0ef+oUOvYv+KWEynuGTEgtSZreu5c57mb2DU76YjLIClGGuE0W4kS7aM
         o/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767900; x=1776372700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=;
        b=n+bY87bOLOVF0Tlcf3X0LX/Y/I/4RPhsRHTuM96A+ZuafRxVO2q3P2w/y/O0/KxY0A
         5V3/8jUFdu/OmQM61mGpChbLTE2aRqaS2kcVhWqYlAjvsb+WSlBUVRJHnbBl7v2BdSPx
         YkMVcxAGWnPyz/ut6ZMmaSbea5iNHDtRpgeYf1OyvFTZ0DciQO7oeuH73B3Hw80nBGiz
         VoULOun56FpmXWruVhVqoW+0x4jlMJRgQ1fQh4sD/iNx2sDdQYSfJCqLF1L5k56Xwvzf
         2cOEb1aAcwKjaLABJOJc2xJELHh9L1VxKvZS12NCwEzIQRTGmapX5dZRYiD07cPnejz6
         O5/w==
X-Forwarded-Encrypted: i=1; AJvYcCX09L1W1QYpTT6ZHr4tkxQ3wGjI5LvEmiJH8spqmoaKGJlAy942qNzccHmisXteBsSOpw0kfCYgsVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqaG6j0wXHoGCetDUva5/9vmwaMvXqzs6IXiSQsbqgmRC5TTSU
	Ebot9rwLhJ+wXLR42O1k9kxAwaBnLngKphMGsPJydTXl9vNPhGGJDAq9EkZZmqYj3tvd/7WmOsD
	PBA9iY+Bzlt96WHNeJB3bTMuRJNZryTPOJDpPddmNFfYdsgEGMHXCLjHm/eCVZzs=
X-Gm-Gg: AeBDiev3Uz3xVf+tsP2bERhgSjh0cFbAQWIwuihBM9AIXUaJSGRz5j/sbe7ODkqjDQo
	2wKmCnqnE40DuRKKiddLEBlZJIOPc7ZqJvNd06O6piROXTYe0Jr5ecXcwdmAOFcjeHQnwy+olr+
	yP1r6l0GoaYfexNsNz0Bl/06pK0GTZuR9EPA3EznbFUAny2QCr2E3jwt3zBHlOuXPwUegBWvzzN
	Jh2wJvoubZMNs2dmDVJqNaHWg0vj65wPvMe3r8JlanaN2mObl9OeeP+ofkgCguVFA3nfEX2NNto
	H41IFIcIduz8vbi5PZ63rD2ckqxEQw88B6tcHVaGyuWe6CUzMkOKPgZ29ntjHqXfAZy95Te07SY
	2PnUJcsIAyrttPCbSpIe6EInOrCgK9iT4HOYCFQay30ilGLMEl/LFQe01ybF+BS10paIpYzt9tE
	fW
X-Received: by 2002:a05:7300:724f:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2d588d8a9a6mr348969eec.27.1775767899913;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2d588d8a9a6mr348950eec.27.1775767899390;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:35 -0700
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=1320;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=tBPHTDIBlLW7JTM0R4qCnebwpFSDqhthFiS1dZu/Rf8=;
 b=53WL+vff5V5Rm9NZrMEylYs4zD+SDxWuePGI0P1VBzoLqMW4viwyM+VY55bXeFikKpsRTpyjX
 IIggrSTF5bWATgK3qc9Z3o3HewZsSW4nKOAGwHEiQc3qHV/3CSK5rMw
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: AeUcnOnHSQHNrMew4SPXgWRq6kvNccjZ
X-Proofpoint-GUID: AeUcnOnHSQHNrMew4SPXgWRq6kvNccjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX5qOzOuGglorj
 x4WUNbnugwsBphRX/Q4GJ6iAXs+ash4g5Hp69t11qD7k0atJ8BAluOFneWipK3R5V6rO57AC1Ae
 QT5SDwm9RYOcLyNeYxjGVEAe0iD7U+z5T3hdSiQFAndsq2qD9B9YRI2K3wsF6Dkb30EZF5m8/pk
 oKiS8FWVFry99Q/4VSS6NWvb/WqfEXwNxX1ZaGdrUuGNEe4QUOW5nn9WAsEm1Ht3SuHTYYR1dWV
 rO1IRd5/13sqoXNgugPfaKgpbZFJZy6K9sVuWlNqrLzM9wg6SdyD+vWHBvcL8+CI+gf3tgI6gFm
 k6Se7aHaa69RTP1T9QDY+FJasA5w2IXZSD2KsbLEHU4O6mTSN/3SIGUFW5noDT8BucLW+YvwYoA
 +k7IYM9hocbsPLpNLQZlCvT8sXxklfvfZShBsxl7c2ZR0wm3pA8sZ0y265cshz1gtb4+a4UABoI
 2YGjRhoveP92MjbGb/A==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d8115c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

Update documentation for the RPMH clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa46..3d5a4d3cb00f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..2d62d5d0b08d 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_LN_BB_CLK4				27
+#define RPMH_LN_BB_CLK4_A			28
 
 #endif

-- 
2.34.1

