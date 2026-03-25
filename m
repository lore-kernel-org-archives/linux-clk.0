Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3335AC00
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430365; cv=none; b=GjA2AhKB1YEnj17K4BgQfJj+lycV/zVMNTLPBBCE2irjzNEdILVuFe6/4M25oEKbiPwXVK7ECEmmSOfqpOkSCr2lMDfZMGVjx6ADCdsjqmHv0qFRaV6XCQ3NAqKC4Ug2HbWZXgx73c7Ljf3zLMecvDCvMMPBgTsazHBG15RFkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430365; c=relaxed/simple;
	bh=DqGHiJTWn6xJDqHoA2f0o1Udu6/Px365tf8MWIx0luM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNowxVV6Uh7CM4i1kXNgEffbG1n83seR9A+V1nvbr8P0a5qTmnoIz96FF0kV9YrMyFFmZIDS02/TliOYSz7xe2k6k5YG0jsiild0u7HsbZnjcirR82zq/4c394RPTzxgf2trmSBHylzrYYW0ZCsx9YfIVm8ROtIOFWXu50ACM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvm1tVnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEqnyaIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvm1tVnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEqnyaIu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4Zq9D2973581
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=; b=Fvm1tVnC1hgqN7e2
	cjokBbdsl5quK0YCTvRp3K6mLsQ13MLXSVyaTsHQMRJHAf/OWLUGbScQIw5oy/Le
	t91uA+tSbabJAAAuXUF7Po8VbjA4LcvbqDHVAClOHIkZWnoRPbuqRwe8Kl6/Ap6f
	S2G7oJKXKEMbDLpSGbr5/UVPRDMK/gsRl8ft9vprZx9TwQvMv+3uE7AQnuBvQRq0
	c1+pom3XdtCkY3dvq8S/1YWfktocj/rRirGmACoz3J3QXRC5ZA7+nxyfKuT2Q2EF
	jPwNL8j6UOXyA7FBITLGrHB7iAerJrzlt2HsbzijdSerr+2ktIJax5KljUUQTn+g
	+mLzTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4jfj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0565d77a6so32668105ad.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774430363; x=1775035163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=;
        b=dEqnyaIuacBa8AXnuQUF5W7wWtscf9MF0Mgx99R7oWYKcMzgrmWFdccQebwRaEcGqE
         OFWXQIm6nfxTmgnpehD68S3D4OtyY4L7xw4P2hLG/elWu2XyqZy/xbzoaCNX5gKdPiKy
         RTOsSe0dqwjJKimtvuGBfTl1Q5uz3lBNgbELZRLVZ5mFi+GYJeKcBApP+Cp9PM71Wmk7
         RnqdlVXaPcxdBELJVajaFhS8Q1PNnY5lbOOs4LEzzvNq7R31NaNONdHEBTtcj7LwJlO4
         Lh6qxVj+ClnnccpLbVFne8WV2ktfEAAXMSHJ5WOQVfkhCUJ8QOydX69uVcpsIsFzs52f
         v78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430363; x=1775035163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=;
        b=HZ9L8Af0vlpbJLbhbiOoWrGZ8XlA6BlqUMZYwjBWbOwZy9rg2uisdvqtHXIKwqYR7N
         liALvamt8LQ1m0zfkFZ+TBdbUPJnoKqwWQbv7PkyfQELMlAPrDXxQV1RsS4oZouTH5E2
         3MF2pTcCdNOSYlNsUapnMFDpMlF/4xIy8vSNCv6RNc4BcjfVjx1YEjK9Sl1RjQpgJUm8
         3BbT5xHvo6EerNPiFxOJzvzOGNTduu6XGEWh8yo7UWJ9UOafaQJ7Muy3VIlShKbamcZs
         aZdPWAg7KqMhFZU2DWvIG1rZgRkbvAjz2CNzvDvck4LNQsOpJdj3F/EkqpLTlT9frB8A
         Gcjg==
X-Forwarded-Encrypted: i=1; AJvYcCX5CN2ECbTsq/zUUIFqqKfziNR/cuXWU43pORRRr7aJi3h2E+cF3Kvhwp4j/D6kNGU7Yccnm4/cOHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6fIpsI55jSKrJibyfszQYnFnVt1ICQ2vYSutHFnEwgbYMUY5
	9N+W3gG4xxY0qzgbHE+GvyBMnn8whrVbJCwkSRv18pFZU0BL7HY0D9xqH2n4w9JGhrP5qy0Doqz
	Jh/fLibtr+8L2rOYNKvFOmJz0O6bEhYJJzvccG4O6JH2TRWWDBwbNBkqX4xJXIvE=
X-Gm-Gg: ATEYQzynmexfQU+ZjVNI9rL6t415sd6mjSmq/fwCdVWmdiCnnNohJiKwQ+ywWgfiFDu
	U366GXMJxdr89CoXfS/SAdeTgj7VKJ/G8I3Wvq1HQ5FZoDegaICU4evYxAq3ZYZzP6hZ1EyS6rk
	S87M/pwC17om+hH5jiUItJse5IV6SpQq2g5idYX8gMyVVFzpCWWofz6EQ5k3N+aK8t/RyIdf9HB
	0uugxyVNjVsA2Ty3xuh5/FvTHQbr1H6/hUor4937fF7iSDdRPdAJ4Rvh2F23IpXX5kW/qvXemNZ
	II2dYh/mqpRtYdxnyZBGWEN76C0IwQddGQdWPJjpupA2e86uh+3WoqmXpmWGosGSAVbB09NubU6
	ipl2GXbEw1H2EgssOQEXoNHS1zRkV04i5vQFXSPiNYyhWXq54t0OhniMBDV6cxgwQ7FPbtjqpJW
	KsVTnDd+1SZZD/+Rx78wAbpEBvNwljZXghEM+lOE67PU+eBWL6l9PUKSM4
X-Received: by 2002:a05:6a20:cf86:b0:39b:e789:7d10 with SMTP id adf61e73a8af0-39c4adf4832mr2998779637.57.1774430362685;
        Wed, 25 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf86:b0:39b:e789:7d10 with SMTP id adf61e73a8af0-39c4adf4832mr2998745637.57.1774430362204;
        Wed, 25 Mar 2026 02:19:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm9643605b3a.51.2026.03.25.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:19:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:49:09 +0530
Subject: [PATCH v3 1/2] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq5210_boot_to_shell-v3-1-9c7360d19d10@oss.qualcomm.com>
References: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774430351; l=893;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=DqGHiJTWn6xJDqHoA2f0o1Udu6/Px365tf8MWIx0luM=;
 b=djQly+ldqLQ0wZD7dx5lcKg64pPrB/d2bMfDj6mDkhh60Nyu16gAcmW0jK5yWoo5WqEP8lxBh
 wlhvXDc1RiUCwVs9U51jWXEeEzcjlgNJ5NgKkcxHDiRPbKvFrXw0qVt
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NSBTYWx0ZWRfX2U4fHTwa7PUS
 5YiJ4+a7HvKnqy+ThpemOiOaO6mKlT7Kr22q7djFn4M99OW5udQkTq05AmlWeC0IqhosYUVd1rM
 xm1Nlvt6VtpPanK/h6YLrPk/KljPiEUp5GLxge+ujWGzcuOQhw6/8wcKk4Z2p9x4WlgeSha0OtD
 wj99ZPUW2t0gKLv6jA9H7lsP+7+B4yvmTi44lA3Y7x42ES9hZ/2IEfMsknqudRJ5XwTodBLm/+Y
 +ykvxkQJ2aWsiIIyPvnrxw3OWfQGJI5ZrxeWRcNMvqsoKVU7lGkoAhojb0uJfinC0x2Y0tGVGu+
 auVrS3373o4B2QdwUD1bD48SiWbgGk1w6NJ0UwRLfeb7EoYiRNrBy5s0RWEsWSrFtmXFVn6AmJK
 xzAzqTQqzg27PGpH2GEKO1dAHczu2uvdNMjQ2CIUIte8S8spT0tXwulmqtwU6OZ7KbRsowKQX0a
 D7bk9zLdRYfT1T7+J1g==
X-Proofpoint-ORIG-GUID: 9UTeXB2FSMD8gWiRGElNrYI52OO8XVez
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3a89b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HYPJJSFQ9-wKY5ciiH4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9UTeXB2FSMD8gWiRGElNrYI52OO8XVez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250065

Document the new ipq5210 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e..ca880c105f3b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -322,6 +322,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1

