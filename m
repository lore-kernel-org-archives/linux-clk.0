Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222E13346B4
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562794; cv=none; b=KITANo9rGM0aYnCANlKiat8u9qIZ9u3I1d55OB3IwoBy+tgIpZiCJTNsGDQy1qP5rvBgGTmClaLD2HYHLgxkc1lVEOoNRx2GJtSnMIrcpjYyr3880Cu1jq+PDx9BmBshXj1XQt6zokwdAqyUAQSe98gkSa2nyHfFf8wzOSsFnhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562794; c=relaxed/simple;
	bh=nbRy1tk8J+o6IdDCQBAh12ISVjY/AuDFM6QaiexvfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOxW+FDLe3xpuXiCrSPxrzmMBM4Mtgz16MPHIDePWtm7UBlc66m5fda0s6nhSIqwMkTmXRdHORnTYp7fsiUtlGsbnl10Nx1fN9IBvQtdUVvuIDuseX8lxCIifozuHCM3PM27P3n11P6FbfZVUmoPZ2IAeWrNICJJUBj1KiB8QBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isCqtSEp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brWkfE/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isCqtSEp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brWkfE/y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6YaU2202529
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rdS3CX8AuXij0A3KP0IVqQPeAhrQ+0llZa7CdfGaJ4=; b=isCqtSEpvSZf0m5U
	UErxZyZH59fvXT9Qmhn2MuD3EbFeyOVHVrZrtCQtD0yUoHzNTC9OyA43XgEPrtIa
	BvkSTe/SyP1G7oxg4sEa3bQvezBYwklX7RwoNg2q92uOYRmRl93iz0r/e7Pt+ojp
	fiIrQCn3fWiRHA4nNYD1dLi0gR5n5eOuwSeggrpkQu2I065RKfW72C4ubHJAYufL
	7d67YJry/EX4t3AR/oBp3xrSe3bJuGJSZLzVJAxeND3BwYcuot900Xo3g2w5Es2i
	0gLX4lPsmSS50kDMVHpLeSbMsShrOpzZDwjc25R6KxkLQb4JkmDaMuYk86EPORee
	ZCFJCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyhhcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:13:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso5981807a91.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 22:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778562792; x=1779167592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rdS3CX8AuXij0A3KP0IVqQPeAhrQ+0llZa7CdfGaJ4=;
        b=brWkfE/y/jeW3h7g3ROndGVHomGQDbhCsxoUQjE86dXOAfD2uHW0QQRpvQf1TXGIhf
         sZiJq+rn3WFLfC9wF0Ll2Dcchnh3fqMMP7fgEkyWafj3xOyQDQgAhOJ8VfGriii8l/xJ
         iEPNy6X5r9Yqr4MnGVDu7gikueqdW76XqZBptlkBk5lJz/n5W7JIMme5huf8+YW1jT7p
         CRVapXYMAPUtSPT6U8OwQ9KxnqjQkH1OR0CIC/Qte1X91mqFjCaRm0noDRVtGaNAdp37
         0pbEtNGJcTGaN7lnIBACQlKsh1YEz83l0juKaKjUXMRdj6yjo0y/EX3/Km1EDEOL0yb/
         HjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562792; x=1779167592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rdS3CX8AuXij0A3KP0IVqQPeAhrQ+0llZa7CdfGaJ4=;
        b=EO3G7vlDijbgg9HrqzEfugwZa5fy3MeuDgGmO63ESaTxqgcZW6JFPoJ9mM1X5mlUKs
         c2YcaDYjyasp7Ha5hrIxnvYzFpO9GiS3bttxp07wk7MnIsRIYURaKy//k4304QwejljL
         FLkzKM3QZQ/dIQBUS0DIDC8Okc6j+jGCkEjpfHGXg/djXlttvly6B/nqIuLEqOC5n5vN
         /dbULgHjNXt0Ttn1LkovObPStn0hQ95BZU1FI/2oSWumnEhHKIbpYfTJnJmS2gSLgaAx
         Mf206WDaRhZXlxdjz3XtZ4AdX6kM6bfYYnn9h2SXzyhsaHfo5oguMIg3JTs2vbX2qeoe
         lu8w==
X-Forwarded-Encrypted: i=1; AFNElJ+5rvL+oCDCTOsceX6oGxu9QOh/kq6OruEL8wh5yeX+g4/jveRvfMJHrEtXr84p3FmoD2GhIO1viuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcGKStQlbTfEulPaIH2y2yM0r3GRH1WkOLhi1d9dAxRSbHBbd
	94i6797bY+Ct3g9VjSPZN3E5dsttXAgjp9I5yHNgiNCAeBG+qKer5kRle+HmgX/Imjh/m2opnTp
	Snpbxclz63PZ0BZxtBqZEk4fAWzzPjYHY10xQqWu0zZnAPCye7UqwrH1cozanZSk=
X-Gm-Gg: Acq92OGFOF06T7Q3ZBc6qWmxQSP4JLVsJW/BKkNq9LnaHtjR2PdNhNzwpPmsAPjPwqv
	GJBjXqFgVJPd5cSogmJdZ7pK8wD2QaMhRgGb78nvHR68xLbOSktPra4ZV+rsMDD+hW2cLTiAese
	XFtQPJptVIisZgW4cj71M2tYgZzgcQixe4VAW6bmEvGxxvHSRLyIPePhhBGX/8S/wtS3O9Pzbu/
	72/4Vh33PGIZHO8ds2j03TVaVugfEVGeAc2Zy6M9BGzq45JEcBwxLxs9EVplSGma/xtV5kUpNg5
	fP1HmYkToYuLI8YSGhuQ9w60u4eV7LIS6SrRF0XENVXJEUHRceOwpK1WgXWGKs4/fdzl8lVtyQx
	0Hp2sn0vBCdHhoOR7HMAf1PH/Nv7OtoFEXF6dtgcstF8GeldBYPuwQ3ML1zBjEgSWOC1ui9RM/F
	OnT4Dabz5kupQyyWxwkm7ErBak55xPP5ev+qNPuNBO29v/tXaSgESX5GRB
X-Received: by 2002:a17:90b:588c:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-368ab9f86bbmr2208816a91.11.1778562791842;
        Mon, 11 May 2026 22:13:11 -0700 (PDT)
X-Received: by 2002:a17:90b:588c:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-368ab9f86bbmr2208776a91.11.1778562791399;
        Mon, 11 May 2026 22:13:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b06d6b33sm425701a91.10.2026.05.11.22.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:13:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:42:49 +0530
Subject: [PATCH v4 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_boot_to_shell-v4-3-1e87c8326e59@oss.qualcomm.com>
References: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778562771; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=nbRy1tk8J+o6IdDCQBAh12ISVjY/AuDFM6QaiexvfEM=;
 b=+/QaBmEbfTs4Eeni7H0+1Xx+3GEVzo6rs4t7sEzHBQLHWkBMtRsOFkLjwJI1+ZIpYNFuBU1u5
 nyAGm5cbwUXAU2AxFGXtqxJhfGRmyyaWR/AXgI4+Kji/vHUqbyI446X
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0NyBTYWx0ZWRfXxcb31wXJ3F/6
 1L4n8pa8u7YsjRzA54y+xm9GaJnpNPphfkcs/A0Ivt6ZmqdkumeQNqpoWWkHDM9x1NK7Ccasly0
 dAcKr4Bu0/wMd5/y9KNQ91t9ukW8daMQSArnfK7YHE1RsLubqAXhFymwD0L3JH4q2dqPQO1Oduq
 vVUbh8xbHWpH/sPKRX5P2oyhLS+bNd0n4QC2wZ67kLE8UPCfbqCfNKQluP0drBd+T9Z9kFRQ5Z6
 7eMk8e9AxTEuI/4/nm4fqNaM72YeD/qGfgxpWxkHRRwQvuGDcIKEEvnyuofAImgOXuCK0mN0zfg
 sKoG06Wno1C9ASOnASZeavE9+PsA+yXOp4A2UeZNjS9Z8Ik9If0kMuFT1c1an63pYsJx89QQsVS
 Jl9qCFdRwGqRTkor5WchiskOJawUbD+7vpz5nSZ5v5M2yQHfeiTdqFUU3hi46/42HgluvIAz0t2
 AyLCYPGbFc6/rYRIP/Q==
X-Proofpoint-GUID: UQe6TVZX1B156E1s1oDRlZhrvdr6j3VG
X-Proofpoint-ORIG-GUID: UQe6TVZX1B156E1s1oDRlZhrvdr6j3VG
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a02b6e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AoPRivk35tf9mwUyIFoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120047

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..af266d584fae 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -366,6 +366,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

