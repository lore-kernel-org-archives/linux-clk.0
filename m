Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9883BFAE1
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550811; cv=none; b=oltzlDvubAF1lcdIa54CBUWDdFr23/tHrWAB3nEsM7t/iHDQ2cqKmf4NNUOzjOQj9CCXIrNgBIE5syVDijEiaEVqRYAPtP0J+mb8omoTBzHXOJ2s+5t3MzYhyh1XGd4Q7PT22Teh9JUxW5ExV+9wm8IWTRM7xh7VkJI1Fc1jPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550811; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRj6lXqPao01U7k2Lopov6tkUkIlOCpGTlEbuu0kqkrTMr9apvj74KIIDkHgMqES5lOXfs0Swzx69FiK//kxDGGp6UbwE6ig4WQjoME4YOwQSNtlz3CcgNStOqf3/z7j3yR2fUkY/2+OAGowYGoX0TFOvMet2ugYcc9NOofyBws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmVAjKsd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+qBT41Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmVAjKsd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+qBT41Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6544g2Sa1039492
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=hmVAjKsdVxEFlHjc
	ysMv6bgDRHL+YM6itkKc6vq0rAiN8h7XYMlXEl7W4io9H/UjogLMINwY+sYkZy23
	V3twBR02KqKfjKZJQ+2RFiHkY2tQX+tM4OZAkH2L5JSiM/9mRObPvSBpfMMNyi2L
	t6KgAijahIgtOu/n2MvdBpwXUC4Lt69s7W4iJGfJhU42fb1VD6S4zYsAExM6Oy4V
	Ck7FNMg8MdllYLcTL7RrIlwccHQ1zTAstwbkPdpjWRJqhqE5+K+bN7uek3+HTLfc
	CWa89UKHMCONa+Q1sLG8LZtlCJcfQq7S1Z/00PB6nc5C16xVOQdhMeAfEcv+YATy
	UOf/JA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8hs7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:26:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso218208a12.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550809; x=1781155609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=F+qBT41QU4BuF4HUCmbGa8jdhS5u2t5B/oBIwCS3S9H+CA9MXbxSWg/3q6X8u8Fa0K
         qxP+zxEgfuXxFHaj1xEiooY9V6bxby7LZSWut0x0iXvH2yBKtLIxXeGzW24uklsdV1CE
         92f+CKeBXgJpwbMuGn6DauDj4M7D5bdKovLip7E8kLKNjzrFAZJzvPKOTa7bk0DnOaDr
         3C9AQebPJnDu12Uqck7mTM/ipNaLCs9cynUiQvuzlM+Zv/FzRhA0nds7A3cIohbodeNA
         ZSUMBm8sACXX1aN1uvQPTZ8GauM9I34CafeItbJC1DfGMFQnlsxGyaehcDPHvePqm35s
         tiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550809; x=1781155609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=JDN/0Ls73aPvSHwu3SxmJp1i3qGl/gCiUfyBfksNtwIEYg8isj+HI7f+vjrG3hRVgm
         Fb1KDd9yIxi6dYFFY5aopZE7yt6RU9S6+ozPtVtPkUn2GzUCjIGG0QPeprXRE3XM1NZW
         dsP3MsZgd6/CRhkrVkssOSIE/MNdQTFl2fAjY0I+YdsthWG31aWQsObc8LZYXWExADxU
         LuVNrb2wQUZScyqo9mBFFU6dG7TBFHobVOFJRlVdZtvkQCKtUawrhaNCEFzom4vPntgO
         4V5UN2jQJfKNcb1uvU3MD+ISzj+vL0KwvsCFw4pOH2b1mhnv27UEn9h27+HdW0V33nzM
         S6cA==
X-Forwarded-Encrypted: i=1; AFNElJ/7NH0M+4P1aSCPT1oASIh3/oXsAEfuNLEpdG54R7dnIAtvdm/lGeAxKcYGEEVICAw39YKiDPcNi/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9rIyKY/dIl+IywhBdX48fqCOQs4USkqpo1tJK9//a3v42nap
	dk0NDzNEQ2OQz/HfypFkVx7NwzbzZvz0EBeWNZBZz1jt99VqymSlBpG7dii0i1kJ2zCoUfj90xn
	m9nvItlnMIFpEgd502Va1GSIk3zYeIxMGsXSl3UbLmkLVZcmhBE1B5Ecna9iNT6g=
X-Gm-Gg: Acq92OFq+cMoHC0+wuRz0x6kiUBgPiwCp1Dn1EfsiuFDcntAhZdjNEZTtQta1E8ZhD+
	nWeOOwFyH90iekagxRhGx5s9iUM9JQiQVUM2jera/J7rehOyENm0ldzfBZQoqamGQ7ojD9ksP8o
	cFZMftVfdnE3nZZBNea8Sse9fqHWbKuVNW0W8I0gGlVg4/WLdS73rCb0k97tPnfmRIAHNQMCPT9
	9xrW4r2tgjPrqenEjjFZ5oWAO+WTfj/O8RuOj688dLkhbM/LBQxOmGDWTswI3aZQJdwY7uG0Wyn
	jI7JFiZZ97L3Trrw4VWarMbqiXGIz7eoHxT+t59TBBR+fiSUVI3QDO0PhF5f15u8B4hVyzh5SQf
	UCXpIsRY9G1yhZ1cnwX55hesZTyc2gjNvMSQ92Tf8TFlRVthK962I8xe7+XPngpw=
X-Received: by 2002:a05:6a20:4e9a:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b4b1ff2723mr1938613637.22.1780550808965;
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:4e9a:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b4b1ff2723mr1938578637.22.1780550808487;
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:10 +0530
Subject: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: o5vB3X-gJsOr5Hr_PlgufzDpXrBTj3aI
X-Proofpoint-GUID: o5vB3X-gJsOr5Hr_PlgufzDpXrBTj3aI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX1MTIEHxUkKXU
 TMZRdbYu9qF7DbrK+m0Ugye4mjyAqbjL0ha+r6p2P+kNpwQJiynCbRjYsBVZzWczp0uyjCYSBV8
 QeAvBb9Sz4DKAxzAIJnOIxVma1tchPcb6rCoYAw9O15p9Sjxhx/26A3GWZNESSQOMZp5GvAkz8b
 GHrIQqsqUoOViX+Cm7KoTBIFXj7z+e0NOlJmk69ndXL5Jxf26/c510JCVPcpyaK4tXjj33iKYZ0
 jC7hzbwQVay2LapUUEwD4Xu92wdR2vHxQbG6uQR5xBvvuFOqmUzdDEgjKJYVpI1QPggMdidMDK0
 +zIUGZ/7ImNZFa1iLQ72RQQ/9ty7qtLJ9sdS39eujwoRs1iSmidPHUqiWIDCV/Iel0B4PztstNS
 VQFFD+LQq0fjokLnia+5gRom2VXRoBH+9fI/OuRUmzHzb3Ast6dM8ecVNqmcW3eO1AHLHiFw5/b
 rIuIhupag/IwKLIjTYg==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a210c99 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050

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

