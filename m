Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED412239E70
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767772; cv=none; b=TdaaIaZjIONcQCDwVUsX4grKr4EEVtX8ciOT0tCQzz8mH5G9pe1hyqevjcyFktLtLw2kUq/N1gQCF2ibCTLZyzp4XFgYdLSfoo1PWv5KH8JBddE451UJmD+5Wnfe15ELHRXVjIeBf4CuyajTsf5abreyDn8Mji+jx/a1jt0OxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767772; c=relaxed/simple;
	bh=esSyQi0W7TyT2YkgO1r6tVX3e2HQHpTIX/6q2Ao/a/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDBdT+mh2w72n/+BYNwKtqxhXfV+q7I0bxu9UbOwHJnzjwGWHSbHJM6JUefFTpVyN+F3ar2r9zddicU8VZCOWgw3jz/1SXGi4qivDEc3jriwNWsLlowH9U0mPNxcUkVL/QRQtAtwggwkgc3arXueagShykmhcd8cWQkHns72VZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGXYWVk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGXYWVk7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SL02Wb018159
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rnpiLU3hM22/JhSpmUfTbNPUyp22pzKiCZFvxt0pVU=; b=JGXYWVk79w1UQ9DB
	uWHR6uuD0pKY1y1X8F2Wq8hchuvhf51pE3Hw5W2wrIowEHPBt7aooHWbNWn8dWeU
	DdYTXzHK7Fh45ZpoMDGkfHv18VzoeZbPiq098AGb/GLC+w6zIXOFfrurNOdgxQNT
	aKLn88nakO4R2egjQNeZh3eLDsFkEm0doT+KroWoBr+s6yxK67qPaD5nOfhZ1abu
	14sWGf00hUaIhtWQbYKmQgF5lBwsLVh5/9JS5Oz7ucnWrNMVE3S+SEMFAQrN5KSC
	DS4HjUvmTlbiVFLhXm4YdUyqZp/1LYPkaTmhzYbbfbl7ZxxSDFwDiN9S+u6K83Iz
	RsKE2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkxus3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:42:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-240607653f4so5302785ad.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 22:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767768; x=1754372568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rnpiLU3hM22/JhSpmUfTbNPUyp22pzKiCZFvxt0pVU=;
        b=AifYcuPA0U6qCKyShPTft0dd73lJtPHPZ8aUA4cszZVRceSGeT/9+0nrHVoUF7ZgNX
         8RI3Svzfif2iMwQz7qSpOCysAEuaV/ye+Pts5nZ5DT9qCdtNjfkqcbskrGkXlWc9S+01
         acCsZD89nSfLQ5dDj/oPhVp1PDDp+2uZ1Usuxdrv6uRXhru/0WwlX8SUFH3bSlQFEFKo
         sgOp1CBAN0TCDG+I2y5a3oLfOt3dUuhF/Qqz3EXcjgEJMq0OitEkLqnAAjYPoSCDnMwn
         pWLvkQO0FnZp7cY+7xSZsT5b7m6HbtUpv9JXNQJTkEUGdZeLWfF77ofjFW+pzaTbH/ri
         tbGw==
X-Forwarded-Encrypted: i=1; AJvYcCVa5+KnOJCXrLUmAKvcnf6r0ecxcBHgaccLV+ITumL0G+JR7puLkTzAkWUIc2Ln3VAckPZvpU7frBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKRyqtsFYIAXEqpnQaqLMuwPJj2XvE4Qj2HhKSauZ2o1aTHwi
	CmraPF4NMVDjVJBIL+MxMEu/ew0K00sRqoEa9KiFKtydS0To05nLb2CGtnWQuE//ZH05hXJOwEq
	CLEv0/HSWddFU0hoBM8n7Cktt7jn5sXlMRd8mc+ln/l2UN57eWzCijmtxI6st37E=
X-Gm-Gg: ASbGncu3OE6yf5Z4oe46X1FmNQZhsG2ALB0eEVaRyc1OXqYdMhoUJ7uLJYlzuFCwvdJ
	Ajr+Y0t/0qSOELKcJOkwNKlMFsVb0ON3aIeHT8vibQzIpnPdC8Ke41lhUmj3NJDs9qSLXeIMlnP
	bc1+U7s86A5jHiglTR4sBH2KxXka6mnYzuTtCJKZyNgc8OaZnG6d20N7YgeGeNm6aGi7etO+FI6
	MBwo5nyBe/fOR4k4N4xYkXCkk72ws9fuNsM7xflrzRYybhWqbs46dK3dGG7eYL1YGlJZXDxZYkb
	Tcqdhwe1Wbz+gWLLSqVPXL8NaNuZdP7fFG1Z66QY6KyaofPSWY7cDXmpQvW71GH8
X-Received: by 2002:a17:903:228c:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-23fd47ad8e2mr144843055ad.15.1753767768571;
        Mon, 28 Jul 2025 22:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYKbGhzM8cnhDQGbr6CQb4riSZZBU6sRu8Iv3TLyFtGnM8iE/iHelWGK4PqkoRYkCzceoMw==
X-Received: by 2002:a17:903:228c:b0:23f:d47a:c9d3 with SMTP id d9443c01a7336-23fd47ad8e2mr144842865ad.15.1753767768169;
        Mon, 28 Jul 2025 22:42:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:42:47 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:35 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-1-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68885f59 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Fi3-m60RFDWPkiaf7JwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX57XXfDe9x0eb
 3n6DK1HE5fRJvXj/gWbJhLXpO8On3KrlUkrjPYSWElZi7CcLLumTEsyxz1rTGT7jmg//JY+KyQz
 AXZHdfucGfixz5aT2ZY06IK7KBh4r7XRDvsPw3Vkh5XeTzOipBsWZmHAGeusRFWEEmiswXOiCV+
 dEP6sYVvoQtGJJV2Zd3ddIdgGk/3gulSrssCa7vYnHUMFcasZvsfuhq0ipzwT/BiDxloKXBm4dK
 Kuf1U0JXeNT+3fGH1NpOgA2KI+ML+m0LeXRpWXZmZoz39MMf0HukNDrfxMikng0ThAcIhKDfArD
 VnzaoYcsBGmASWuBQSSOp/zqIQO+bRmzpiN/SzzKMv/+2J9FvSEHdcxKszaDVpLAnATVeqKQm71
 Fdc74m3xNDh6rEcmCxBdrgb0Z8pCIXkkUkV7ntQkoAj3GHcXYkZXr0fzOtQDaqFv4NapTKXT
X-Proofpoint-ORIG-GUID: mbWw_emT5BLX_It632xdach3Ks0SNHHI
X-Proofpoint-GUID: mbWw_emT5BLX_It632xdach3Ks0SNHHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=990 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290041

Document compatible for RPMh clock controller on Glymur platform.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e01f87d4fc546311eb758ee63af9a..27307e7bcfbc67853b91de5408b009cf6ca75ba5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk

-- 
2.34.1

