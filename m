Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470EA289E12
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349366; cv=none; b=hpTsoJNresw2r9aQhhbtNbMKWZo1IkAE6wEuMSnDgUpQ+YYIZSdvaNAOMLOhoc453uIPxMNtb724m8i9pu/n9bo0aWlSYuubY7SNKMZkJowZlMAoT1/QmTBtWkfoqSVF0lgBhp5VigUnpcdxBRoCtsslMHUi8eK8O4ldczP19Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349366; c=relaxed/simple;
	bh=PPHlJY0DBTcDAyhfFMcfSfIO7XmnVHjq+LatoXOHmkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utdUbsa6uBp4yeeeE/GsU4CaEyyki/SoGXFH6lFCcrCyOp2JTVCD3x4nKjIT2LTCxF2rfctNTzU6g9oZGOXUI+T75xXI0uvQUR9f2TzQLB/3l2e/5grRMYyTVucMi2R064PDA3lWH3lxHyTdJHBPCKqlQlUFTKUae4g8738ykrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI7Ro7Hd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI7Ro7Hd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXjcl023140
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	moYVE4cTWaiaAnOXhb632zZFM1UL32qTF0JTX3SvtkI=; b=lI7Ro7HdcPEwvycZ
	i9oVlLDxas5mhM78zMZFs7DZk1h9GerNubNEHnL+M4ilmDOs5GXKW9HfqFSQ27V1
	p4o8Se822Q+o4u7VbrQShnhpqJYGGm/kWg87lOe5J2FrguL2U3sDfaC1xJBexAIa
	URbHPGL/55JGF0M253trHrFE5X73PwQTe3GRkppDs6+QvO8D7IUYYkjBBNbE+PMZ
	rI5bnVHniCnrioGFgGLVM4FDVCBSGBoZOtHrkHPCCmJ8APzIbfUOt9Nnh2dqF+h3
	lAY3/Pmce7kg9DKPUM0ynqj3WDRHC237tTfKzWUyHDbHGf/NMO2Haf6sfBRbXxLm
	93k9hQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kjusv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349fe994a9so6905265ad.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 02:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349363; x=1753954163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moYVE4cTWaiaAnOXhb632zZFM1UL32qTF0JTX3SvtkI=;
        b=Bckac2YXM86fSP1isLiuQ30CQRH63WrV/6jfHh4jA4/QoMwLwm9P2juivZ0EWyvzO7
         uD+H6FhR96F/FSlFKfLvbcQQv9Vvz+ztLXpZbohdRenXlazx/WbFU3puXCc4jnhAjZiX
         9gWpfUPIwqzzDjTQab3DCsd/VDOCeKLNCzaH5lv3KnwVSGtVu7Cb8OJjBk6cJvTyp3bI
         lGo6U3HzqxacgaPgOtlfbKJDxwWHWtvG7aAFNTGx4U6VGkfMB4YFHPzRVo+4mTrSZpH3
         gz6HaBrrrH8rBKmlr5MjGh9LwCXM7Qfce7l/wPmkMgh+R4vDzNFP+o5du/PBUkJ5W94D
         Allw==
X-Forwarded-Encrypted: i=1; AJvYcCXpPkncrJHkGwMemNL3sWVzy5iiepby1Ls/qa1k7kJ7Qw05iTrTSyrHIK2SJVMWL7Ewu7htpo6cLt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCurFz/0dC3jl/1ivhsV0Ay27m2xIKO7aN9PhdP84gNBC7Rl8m
	ki8yEEIUj39GeONDNZXHJtHbxNkZG6oRXi6TVdUaGEgd5EwKTUjEHC9NvlcsvcUdMGxVdYZIwCa
	H7qDfeoHDGjkWqlyfYGpqySUd7z1jXGKStrkAqbEc+Sf4YVTTSOKoHYUV7AekeLpeSvhCe2s=
X-Gm-Gg: ASbGncsdZhkf93P9vIRNAY82isvS72lYizsFYNXlarPfiuaJ7kvXloHzmau/mKuq8Ts
	SRKuIw93esOjIUQkjbUNandwDCgpSLRii3EWBGnR6IahZ5489uHyrIw3wiXIS1qbRIT1mma4Bl0
	jr6+9YEwKcxF+572YPlamrMOGvl7f0yd5hDdjYdAlgJ+uKYbyaeL42y8qTt+ELbldPz5Prz5mi+
	nU63DuL6NuPES6pKPVGdiR2yZnypvge6fxb8mUcmmc2Lov77YIpSaV/1HHyN3LiyGYp14xrZ13L
	1AzpvakJwYMEuXzV0+hD86A1vybljHN9EOmadVCaqa24mQiCm5oOtrkK9WLlByxO
X-Received: by 2002:a17:903:198b:b0:235:e942:cb9e with SMTP id d9443c01a7336-23f9813ac30mr82925675ad.9.1753349362730;
        Thu, 24 Jul 2025 02:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzUDlAxoq2iIvpAwTAbSpSv3iI8qSUmVJX5tT0OXMmNLVHMLk0kaGDM/qQeIZUKeuV+/ACeQ==
X-Received: by 2002:a17:903:198b:b0:235:e942:cb9e with SMTP id d9443c01a7336-23f9813ac30mr82925285ad.9.1753349362286;
        Thu, 24 Jul 2025 02:29:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:59:09 +0530
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-glymur_clock_controllers-v2-1-ab95c07002b4@oss.qualcomm.com>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
In-Reply-To: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX5VZv/ipp7hOb
 bkqccqK+T+r5u2rlQhYHj2MaI7m2M/oN7FbJU+V0rr7yIW+UiLbFIPYalPtX9iF0+q9jY6D332z
 m3rbAfq3lshh5S+QwMO+TTil/GX4n7n55pefYbauJDcYk5Dky5XaMXsLfDcVIx90/LaaYAL90Ap
 UanJb+On6AscmO7x/GSLWfRMxEIIdeuJpm6AFSv8M6rvM+2Wmw26thgZ2au7CdKBx8c+v2m5aEm
 PGqN+uF3Oajr4aZR3JK/O/ig0SvtgZjfhp2JBvJePDH3fuYQMxfoxxndigL6mSye9RthO63nEcA
 dMsz8EUvrmU9TcxjEzwqfMsuZsDmc/mrHSoS4aZTe7pNfC+UFWrAo8SljESn0fdhXXp3CxFx/+f
 SvjwbjmKAq/MkvzYG/yhl6ZSOXrCKoSpYnG67mo2mcEbkY8dK6nuiovcVs8shzsw3eu3y5Qw
X-Proofpoint-ORIG-GUID: Vbe6SCSvvQACQduoQa4rPhBIVvWrFOAV
X-Proofpoint-GUID: Vbe6SCSvvQACQduoQa4rPhBIVvWrFOAV
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=6881fcf4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZmWPdgOBrplkPgKrADIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240070

Add RPMHCC clock documentation for Glymur SoCs to ensure proper clock
configuration.

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

