Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9883129CB2D
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754749; cv=none; b=IrsI4I47qorlOF2hl7fjtL8U5E9C0lbyPqWc/6tw5d1FUJCpfh+1SRzcME23EeSwcYUS0NvDLjWukwwiXTk/gUHk0IBIEYZnnT84T8f0EFkiIG5PepDNsaaOAmDtT6FxRHhLtxUvQvPEjyFPpiRcNOxRhwzo1MSoO0TCtLplOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754749; c=relaxed/simple;
	bh=yy3Xacla9UOxbqXpSFYiKXWgjPcQnywvRkT5dQdRoDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1HUvNwHcssIKCkhay7NuxvH/JeTG+kS4nSkymgZZxIuQeXiH5OmCZeMsoWyFgwSKR7vJZ51eObG8jK3uqlYOeonAn34a7I6NS6podHb0sNNO3+1A8YBMY+oOZF/477gx+vpJGpiW9kOPk6TCCwYnO6l4etM42w1VB45CQATfe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kESsrkZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kESsrkZT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCnlPl017424
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDXmYjaKFwBzPJwxWOUUE13s34TjJw8/HcqN0CXLaq8=; b=kESsrkZTgEelK5YC
	CqAmUELec/AyuN+ZQN+AVMIbaolhPEVPXzaBYj3b0pxo6R3/8gGwJvnhcSRHIEvI
	3ewMXz8AgG9Ays04HwIxMvIrtfB91UdnTclHJksiknp2QF0A75g3Ac1K5XnkUIEC
	dbxO2RG+DibEsK+rmUi/5Q6EsCWSMpfyozv61xf2v+q8/0HOhy0pnlkuW3Ga+BzK
	SVw6w9/UPk+s1QxSRvVX76Ft/NuS6srOsNX/luroafxRtFT5MzPxM8bEbVkgTYtT
	2oQfmZq1XJX18+HPij9TMOjXVFlO8EIvNZ6XF1hxGN/e7mi+T8vg3qM1knUXrdUK
	dtBCvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjya06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 22:59:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f82484faso256840b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754746; x=1759359546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDXmYjaKFwBzPJwxWOUUE13s34TjJw8/HcqN0CXLaq8=;
        b=KSIXKHgCKOn4VIZEQIxz2sQs1fMQpEAF1qxeTejzKWHp1U64lLEFTp4XcdcJYevqrG
         WAmQSC5cBrrGVmmCIo3Z/YK+a8KWpDs1mbhAaFmoDHDqvJyIVPP9GCyVp62l8SThN2CR
         0BeiXdrkPsnAakcGbAd7IeN/Up9O1gv5q/vbB2MGvqeSVE/HM15vzzsh4v+TZLBFlUy6
         Wn40/+nVPnTMlwpFMkw9n6uYY3BtNAvZVHEaKLgWiAu0S/lHlWeclITV5TeBodbUIHgc
         FC/vlGxD0AOBR+IyCzQReFoOfjnwnwfPOf42BXHDOwO8KV3RKn0xyY0WztkgjbLF8iSk
         Kx2w==
X-Forwarded-Encrypted: i=1; AJvYcCVJHqLAIZo9aagw02gTx6SEdJzfG664LFm0YdgnbptqlK/21I8j4a6DdARePwzo1allfv7/V9VXrA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwugeVsswMiolzE3icyBpbvf1rBwcObV2dlaaA90ZMtEzkrQ/yU
	23JDnh+GVz9N7RoG8EbtlPhqLbdAL1+JcPmc38ifWKJf54heAWqAm45M4Joqz44co04Auacke6o
	QHbb4C+9Ck0Tf9XXDQ7no+d7kAcVU6H3LtgtfpenbwOnUFA1CGBYteLeoOGYKLdffKEtaMUcbrA
	==
X-Gm-Gg: ASbGncs5oPB2lDflUx5MxPp2xjgI7324WtCVQApUOa3eHASP44PvxKipFpcrW8YSOdE
	16rkckmIpxsvV3SScf48SB5kQVvbGcH2CC2wHgHp6dbdnfOdHuOyN34DSIOL3YHxcYV3j0sbl/z
	neiRlooxvKsES5eC/5xGnKDeKz1Ulyq9phruY1KbyRkQpoE2m5rUIeXiZmNlRWRcKl7RMt5woAp
	QORvHVjviRi+zB9j31iP9tcnUHdbQlULb6EE0vUrhbA5jqNZ3cLmLLPxDDBKkKw4/Hycy9sEu8m
	MJYbH9Nu1P3fjmgaeDN/0MTdaRqTbYeuwwMlslGiRdX07itAsnbcgX16sy1MOm7BJzT9uUvSUrS
	1kiijVgX8MbFab4g=
X-Received: by 2002:a05:6a00:4652:b0:77f:d4c:d815 with SMTP id d2e1a72fcca58-780fcf12f08mr1845314b3a.32.1758754745287;
        Wed, 24 Sep 2025 15:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXdNFszcYpPVOWvP7/6u2P7TMeM6jhJHuAYUv08poAqLgqu8gdyWlL7gMQG3iJ5ZaalGJe9w==
X-Received: by 2002:a05:6a00:4652:b0:77f:d4c:d815 with SMTP id d2e1a72fcca58-780fcf12f08mr1845281b3a.32.1758754744615;
        Wed, 24 Sep 2025 15:59:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:58:54 -0700
Subject: [PATCH 2/9] dt-bindings: clock: qcom: Document the Kaanapali TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-2-29b02b818782@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=845;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=n3FQrcuYcggx7GKYI3TsEagZ4F/FDBIko9Z+j9mcdfs=;
 b=IQENasXY7UJWL4ilhrNMEq82ty5OnDeUF56XaQgoAs7z0brkBSWz8zHZOmQl/uS2VqHI7eiiE
 KtywVyWntZzAKphL0R0s8L8sB/qzZi3ZXKuiWrYT5C105JMSjK9C0lg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: RFpUix9Tf9JwovMJXphBMCbfpULGwdeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX+ji947R7WFME
 XvRr5JD3izWqUjW/keOdzGuVl+ACOYL7rsXct9XHsQPwpOteAEaOckfFpj/AiwfMkjl/O97Yjgn
 X8bZxXs1QSiOg4zcnD2MX2ORtyXFaLTN4S78T9tPsSEApDj4Xde41jGiKWVF5JjTr5i6QWOp6IM
 +5MGUxcIdsUqaJIdIbhnXjEYBNt0jPHnIj6ddFqFvWeC+6GcYCMT3pG6CS4zEjYO1O2/ZYLf711
 wbnJ6EacM6g5NluayDKRxAjB7CDOKyo5W819ENHPI+9MCj5GVQ6glzXRSZux967ojUOhQ7Tj+A9
 bnDkURjlEy4cFI6BcpbeNhbhR0CauTqvRDrefbiFPVky4pkhH0hEazztOxriZO/8NJQa0O9iIfY
 4iYlYlk/
X-Proofpoint-GUID: RFpUix9Tf9JwovMJXphBMCbfpULGwdeg
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d477ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=m9xIYplGfBuRHQtD53gA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Kaanapali Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2c992b3437f2..784fef830681 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr

-- 
2.25.1

