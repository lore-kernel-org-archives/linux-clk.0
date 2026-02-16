Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF9330EF7C
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249406; cv=none; b=ssWKzNCSn/GOKmyYCG/dlU+zm6xf4052vQ6lq/SYECMVY5NfVFmmwMxVBoGlPBgHgNYWNNaX7Xv6mIsDIrJNi2Aiqu4C1SsqMdCUSSVJKUvJJtfc5CAbjWPMRRAuzerSmwwpTPY2WjjpzVnQWH5hY9/QBXqzb9lrStpWs3nBQmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249406; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQdk3A9tw/axmJSKsI7YPeAlhBGga2tUMzV8sUKpAiPu2Q6dO0ULNi9UkH3gn0e8GcUAM7+2eWyMmuYuemC9bKBu3MVb121WepHsmKw14Lqp3S6tH0bcSGrr+DCvn4/L/3se9yq5rmzlpkgo+RvT2mPwyT1aCfhcb4ltjhCj2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMsQKr/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQEsS7L/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMsQKr/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQEsS7L/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8gSPU2803368
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=ZMsQKr/AKn766924
	faeYOOkWHxrN8bvPrVdUGhUNjS2Ryugf7WYOec/bAzjiHBIcMVd1DJg5KRyE1WvZ
	TB4IctYbEj45fXTKqS4rucNlxz9aRBSQgi0SWsTSZS/wBvHpuyeKyweK1iVYDu+Q
	S4KZNeq/h9rxQ5h5CU4cHh5uQc8vgiWki4E0N4T91yerUjVoHTWyxIKOF03Bdwh1
	pLwDTE67uUI2ijYb11OO63iuRgnTV0dfGcd5L0GSC51EMuZjFJf9qscDU3KvHoi6
	thvAJ+sj0wToSwJrrBK9TcNLzT+TBi2OMBzvV7p9LDl/O5BApWZ0N36uFCZ4ab5h
	GbXWwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugq65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso3134249885a.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249404; x=1771854204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=SQEsS7L/FMkbEuZkl64PwJI8u2axpHpYRLscGdO3wW/B9Q+p0rHYdY32IbL6vo8Gpj
         Pln7N1i1zM9Zu4Mt0Gd71/yu9A3DUrkndKk0iL/59XK/k/zZuLVvaNe+07HOVPI7d2JU
         hY9B+RKkGuinuH15UWI533mebxgiEGm3RTZ3MnOcyOGL+9+6MzDntz+anKCZV3zLmQZU
         Bes1ZNu0dSQ0M0F8B6xKe/i1PyV+yivB+w3MrORf772l/MaxJQP6+Sa0b9iQDSk+PeJK
         O08/0Wkyrj55zS5Om1z26ZlrjJbJQqGnybpZOOlYaawbTJcpJ5zDHB0mYiMMJe6R8dZ9
         xi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249404; x=1771854204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=wh0dA5XGGAwFWac3ycwo/TnI0iXvcXbWy3EO5+tLbpbcUmP13NnFa1JAXP0HbVEo0y
         OegfoOjqabvxTaBpAJtMB307packo8TJlL8flXDmInwXqeIgKu05C23dVg3CteM2yeAM
         cBr2esKly/HsktuUaK6b60g4XCC8BAVb+M0cY4np4AyxjT8eEUCpnVqXWoIyYWIIY283
         D9EY65va+TgR3beSOnb9RCYC+V0w80ku3rIhPem1tzZE/IH5zK5Km1JCqRx/6TnN4O5Q
         a+pzBabmS+pfEqaeMZpG69B+IgiYO873bX0FvbGs1akLl7sZ04lWfaiZvkGsPC6iBYHd
         DeSw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCVUbDldmiIJLHEtymPhXrWb+X77GTqyRuLeI14LGI67GhEeD1F1IXVZlULY/BeQRBFDG+szz2SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbnAJFObbfh+HpFsUdkqsQ9wLJUREy/VTcgQB5Xn1AmJmGok0
	fFY5aSz0CL7lmA0GWtyfoBd3niOr8eH/RQQuONETZ1dnKMHBTMN9fHOPrFEPH2uxw7+rZARvjdc
	yIM3J0RTlbz7DCtUx3ouLOJgIF1XBOhK5TKc/KdG/rSKPIAeTbFQ8tDHUKfzqQiI=
X-Gm-Gg: AZuq6aK5zmtopTnyUBdq/0pYvWlVULSW+MBhlBgjVkg6F/7erbSU98bc5SDJThgFuwC
	OQ3VMmeXEa6p9xME37OOGqyzFj8W7oHhsC2oLhffwfmx+YoNP2FLpIN7tER9q6dHyS/PBmy/3fx
	q7+o8iJUw/i3idUPpsRYlPcD+kUFqEkSwaMth6KCDUpc7b25wisjSCbwoNvI8MDJcJjrbPV2mCH
	0LJrFfGdWly33U75LKMFPBiAWJFlPCCdIuBCB1JR6DGYpTSjHBI2DgKV7snX/UgIqdijzlXSKd7
	c04wmYJDU01xMWkaOSLU7uV4vNOIb5PwbY+5lcTWEl4rCa80CXRvNHs/pICjk0U61DJQqDuE/CP
	tVLDehZqBCIH4E24dcKPAhijDMvQFdA==
X-Received: by 2002:a05:620a:698b:b0:8cb:4059:a90e with SMTP id af79cd13be357-8cb4c041a43mr960460085a.80.1771249403606;
        Mon, 16 Feb 2026 05:43:23 -0800 (PST)
X-Received: by 2002:a05:620a:698b:b0:8cb:4059:a90e with SMTP id af79cd13be357-8cb4c041a43mr960456085a.80.1771249402904;
        Mon, 16 Feb 2026 05:43:22 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:22 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:05 +0200
Subject: [PATCH v3 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-3-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7v2otDH5sb+vzDJgwVRcAv+NbCPxufSR4U6
 +bV3RqJQ/GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe7wAKCRAbX0TJAJUV
 VosGD/9lxzRsPm6lvcyqbdl7S0WHh30MZ9GNaEnOVUywAuYse8Z2aSVI9N0HxqNnb/ZwfrrUwaJ
 lMqChiFPzCFiwWpet8RrCB3dMX3X0s2tKKRuLuJsx2/6BYvIYHuoBa3NWLqbVKhy6PQGGCI8iwi
 qmwKGYGg+zyIHfv+rziGowNSiiet4TnAcznjhQkNIPBN0YpGQngEbXtsSAPUUXWyOUvrG4Jb+gY
 HH0tS0BfGYml+rglE6oKhyC3Z3GJNTPhE9xlcx27UFnnB1D/x6Zl1L/0td4DU5c1ENnqDchLeBq
 mdQukDNM31fZ8zSI4CRWyo1jnlk1grVn8fsrZNItqJKlmJ/gfDzrmlyCW6P/+Fu2NBVJPfy7nIz
 n6oF0LPepMNcpGVRS22Kx3bISBsnJzb3WTiG2RDYHhlN9DYBn9chVjnaVpc59wWo2paqKTfY311
 oFwn8JH+NEVz5rPyt44FXmTsxlAWVlNOtsTZm16gg+/bVe6AtsxsvNzEcQD5avMHkArtAdjNcpX
 rV41BaT64XBsvZzLDMhcL3T6fcLgbjYIH54CTtIzrMdsoKqA/LvWzNE+qzglg6kIiPopmz9U59L
 cqZfkuugNnN35kEynINupqR6H7kY61361oyqCMdbNhPKpzvcQjeQyfB4HeAUGWRYe0Ywl2xFcDY
 7Z6VReUUbMrtp8w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: qdLG0ncdCxdpg5bGWc-4Y_6U9_ZAUHPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX1Byecvtlsc7K
 jmWAIwEdQoe6Cv5xy8ajaYma11k+pBpwZ6RO1qO03L3ub2iDCHOtpe86ks2fBTwTWkI28DWdVYE
 /YyKS5Z1oRJAjXihFrFhtyvFlRBt0QInbHLwPyzeuTasEzxnM5X+ZOO66XDScW8BrRvWTdlbTzU
 JQ+MHej81uk8+dr5WsjmqJBJIHwyGIa4j23H1FzJb2/D/drK9G5bvCSrmgD4RobMysbKJEgcP0N
 FFMkkYperWqDt8W7K0EhHDlLRPlGWQuT9JPO0SajOSsGM0Zzkh6Ip+JemedPblCiOaEwaOOPeUA
 4HppaY409a+MhkrBm+Yr2Q8eFnD+JDWcd8jte+rHA95Qlpvm8bNRd+ZyqUPg2i4N/XyVFFlHDi/
 sOD8S9wctAP/kweBVYZqgHk4L89fTRaOhRI8LNfVUvTtaDEZrVIbVHvASLL0FMCg5MZ2Exz5Ia6
 0T3H35sxY/NiXSZWd8A==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69931efc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qdLG0ncdCxdpg5bGWc-4Y_6U9_ZAUHPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1

