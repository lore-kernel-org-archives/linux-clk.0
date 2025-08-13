Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3E2E7BB6
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071762; cv=none; b=lktEaCWia0RUb+ERsaNxmjpaeQyarnyzzHgcA5GYTxCawff7yRZi47i0aSPxL/AII76K2/218mxMY+I4yDqEmI1oc8iGf3B3PD+cXjqUN5K+6B5qTBSGgGC0zBXx3DZ0YyoGGcFUNL+aMIfqqhkwe4pZB0wcLfrtiIZsa2t1mIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071762; c=relaxed/simple;
	bh=D07Jua3uhs96Js26Ok23Ar/4/MvIJ5BYb7yr7CLyRNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6tZmyykb4uzu7g7EfvGK7MgsjONLbpbl423DLs48j8xvIEDl/nOg+UUj5Q8PE0qKdIKNMQK52vdj00U/J7SsYDLHsx5Xj8ZtBX12oE5MAnS+x75z3CgujwJBjXoXHtpza+fxieTSnehzesLAx53tfMcSh/pKeS/Z3ed6gJyytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR3o+EJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR3o+EJb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mRb8019556
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7q8BR9F5OBMsEZzbyywFRTwDIso+RrsEIi+fPUY/e0=; b=NR3o+EJbKDDtp+mM
	WqvqKrsep2fZg6tXDy2VxboBE/Cwnm9RJ9KZF+IybjXsCRhZ0AtjEaQjp+fqCQmb
	R2nNI9tV3bCL5zttpTVJy1rONst15lSE5JW0B3P+a8m9FHEFTsaMNpQbsfZwUBcE
	BRC4LlizN3M6EoxwdXd3KIKa5vagfaGon69ggDXAIhoofKYJNUqceTWgwQcJNJmx
	tHGPTLVBKeulYfEd54EKRaXM5WxkPJn652+are4cAIDnjD+5ZeZMEx+CtD8tHcTT
	Doo/awXIkwiG7CByUUGlu7guQTb/QHSAtyvDWNaAgCeZuvEiZWgFvoWRTYkg9XVw
	s9hlMA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6pv4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso11909865a12.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 00:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071759; x=1755676559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7q8BR9F5OBMsEZzbyywFRTwDIso+RrsEIi+fPUY/e0=;
        b=EPcFa1KpBV8h+pBpBiThk8o/lZ7VR4pDARTebpZ7VK+SqQC4IthqlThEuzCmLkkH1C
         2LnZg4PPH0eYJEU9IhG4A9remP1ogSdnzqlDljcOQfUZ9s8RZlnug8B5X0sFYXkNuIWs
         Vg2JdeZgeQmKqw2SgDgNhwWh6IDzSjSwuQjWUAnFTfyHWj3bwOOfFgPboxN675a0gLRR
         7dFRYU9hEcx9NHL2I5mYBgfXaqVLVEH6w2syGtvV8S1OYzKk5zHgtz/ReImIFkA+Jk9U
         nDthuJnk9ONUaTwWOR0OJuzULwI2hUXAy0MT+pumcN6VmSWXwvpkXU36P8VnBgLHYnYe
         IAzw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUg+EYwMkbunOhzvZRE5TaSohOXXLf8IDAsvcopqapO9FhvB/4kiaWqNdVHiNabjhhnhKs7bdJmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydSUy7o07VRFTSOzx3g5BQK/bIM9RsBOecSyRU+tq7JSp/ZVRc
	oTaPsNAHYazSB7vn+jY2Z5QPvmZd+Y6rmBJ2e9g2l9NQMYHI1QG6RpGEuNR8Ll5iswahhO4bZ3u
	HIraXLAp26oUVujt7aG/oER7nqkGvR4iVmEMwsDQYw5m58OnrCQJKxyd/IR7I5hY=
X-Gm-Gg: ASbGncu3J8MlUOTmN8n1VEtoZlVZzBFgQYAtLOfPpT9Necx+7aCke7jP86ZAZiCdRJX
	FCILRUAZFA/zeJb2T9kdvffEjYhY7Q+NcYRdksNUyqNr7+hliJi54ZshSa2oS/WbnaTRDbsathG
	my9DKmrq9Bc8okGtdDXSA9+OJVN1bvPae/9BvNJHIkPcN7RDpW1DdWiZc0XpJsKk5JgalBCvpKP
	HRm6hbFH2tNlrq6Lt3Hz+nRo0KxHeZ0bVtTUhr6m+x3mDY/NueIi8xt5ghSopsfJAqLrt8E40w/
	jcIDtCXJsZm0mXQ0jy5XDJm/PMrd1O1Tj8ZYvOdzpg5go3BjfNL/KhzUlds6EsSF
X-Received: by 2002:a05:6a20:9185:b0:224:c067:66f8 with SMTP id adf61e73a8af0-240a8b57048mr3545288637.37.1755071759572;
        Wed, 13 Aug 2025 00:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdYTtuNK9Ef5PQP9T+pU7CHZDwI8WmNAk7Iws2gqgqkZgmeLbgTRT90wMOoMIIfYtKtYpH6w==
X-Received: by 2002:a05:6a20:9185:b0:224:c067:66f8 with SMTP id adf61e73a8af0-240a8b57048mr3545254637.37.1755071759151;
        Wed, 13 Aug 2025 00:55:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:55:58 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:25:17 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-glymur-clock-controller-v4-v4-1-a408b390b22c@oss.qualcomm.com>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3WN8+uCZTBRe
 hS7gIAOw6uB8JbnhWWK0OQ32xJvgf/6x/0jc8bmae7E14r+AoXQY2gQhHzTYC+7qPgpJRMZvcGF
 Xbj9v3+Gc5h9KMXepULLUUyt/nqSib79ZQbTCAjRiDDkRJDloXvZ0PCDXT8sBJPtf3u0a5RR5Z0
 OfY3II4id1XK/trhFXbRYL0fsfSCVDRsGnmMLw1EMZOQnzxdwg9GelMxeuEGedsEjO/QMu/ae/u
 EZZa0cUPnDA8NDi3MzdjtLz7ua6xNMOGAy/nALQeD33gvgVGEh8BabJre/l3Bluyzt+A9oF0Aar
 rg/V/h6369171DQ3qNXcgDqsr7rv5hEQy3hJOXn/0cQHHUsjDTpXoqblmkb/WwXc86fckEH8y+8
 ohihCR34
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c4510 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZmWPdgOBrplkPgKrADIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: tL0js9ldyWwLtfK4GKb6AwW8AStn_aDG
X-Proofpoint-ORIG-GUID: tL0js9ldyWwLtfK4GKb6AwW8AStn_aDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Add bindings and update documentation compatible for RPMh clock
controller on Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a4414ba0b287b23e69a913d10befa5d7368ff08b..78fa0572668578c17474e84250fed18b48b93b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.34.1

