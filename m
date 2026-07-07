Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569793BE642
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407344; cv=none; b=YbMIrLJPkRux70FNxaxwRvX5KaWZB+PPL/D0PVIUucSA18h8F4s5zZ2vh0hJZsQwsMrUuk9J1Z+JQNHhm66q8YJV32xcMU9gD04T4J2HbM+DSqoW207oe4pbpSilIBWk5EEMJzwH7aS0UjdvvOKYOSpnSJDamP0BRzKd4MPKM00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407344; c=relaxed/simple;
	bh=6scFAplSDWvq390EfKwCS0q8qQMAFjHSWaPuzf2+Lo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1h8jbhfX6sVlQOMi+TAh0MvkP2b+73XVDuI5dt4wggcCZV8WwgrS5T7Rb8qeOFbfKyhhNZTaeBv7cFtE4UXAqvf2HQPSB0fECCRWTqiBWDcEU/lCt17Clcrq1xdGcZevtD68FG54l/T1fU9/F/QHOBA/kXRoC4IuO7c/udllac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCnqNWa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4veI2su; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCnqNWa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4veI2su"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748tYQ2675481
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 06:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=; b=FCnqNWa+Tbu3Bsav
	p0qEapJmMVUxWDb925ZG6Wir/h+ebKDI/fPCZTVSGuFwIbVjdstOAWsc6KYs3BW3
	UMtr398SK6+3gvCAPUOwce1ht2+AS8Ug3tQWS9D6HFr77lFBnA10dYEfSrqi5gBe
	xkKX2WsX9DzgYNRqkAc0JQ4/YwlU7dYcFS2yrpzW9397LYr2gLWaFQlp78CAoTAN
	//oLkm7XS3X/aOfL7U+8BuaRPLVT7DRJISEVifXLY4Oa33t1xvO3UZTuK9WaZxCr
	4TwqBaPRp/3qcKzAdhECdFAVEMN3+HQj/s2ZIZsQVvDQbWYeCDqXrt4jo/vZdmII
	VJrfvQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj792q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 06:55:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6543102a12.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407339; x=1784012139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=;
        b=U4veI2suERBXqA4BLFMWa4h3QPwwb3kHWQ2H2DVU80fxLzewG3nUUNbMw1Mr7BDJUA
         V9abyMcbcXMTjclMz/nwlh0SnAsByhQqddH5RMOfAIV8Pntefy8CLW4BzDdCh4VMsVPt
         PRHtj7yB9GK+HgVWdRN62SosygTjAIwkYrQrK6u5cHPGL//t4m7rMjDFujzO1krqVqnm
         n1SGOrNaAvA/wu5yjzdg+rvRL8tOLuuDVPa+bAz3rUKVndCaL27Bk46P5M4xlyCHhVQh
         6WTAmwJ+X8Fb0SSNB2L4PbC/jcJsFBYvgYuZUTX57yclwMRto3PVqenaaxe4jlOaz4jJ
         OoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407339; x=1784012139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=;
        b=ciVyW3RP4JbHcZz78uD1HgGFjk42Qy6vuW1t9JWP/PQIXm2Q/Fqr4VrAHGza1UsN3R
         biL1Cn9q2KziWIMHGeINK4Uhm6i5dhM18IASuaqjAMFOtVa4xCpXAh/XZ5XKRvYekuDh
         veRLGJVNDOrRZUOzLrY3zrnooQKPMzAMdoru0etobRkvoB4+ZYbOoNZYj3tfpOyIWEiH
         cZcJSfPi2EoVPmcZzvIdo1aq98V+wnpXYThNF9JO3eURuK7kDOKWYAKMzDWxDlVbhnPO
         1oL6defUiOccONOGYyrv1Z4uJF9sWoXgyy+Ohvn4FGe4FMigsbhnsbuRvIbbfcId1qur
         qeaw==
X-Forwarded-Encrypted: i=1; AHgh+Rqkh//rJIxXM2SKZHlUQarYaERkAp4n3zlj0GJdfH6XfNzIX8Ye8hfpXfSK8PSzWidPCPDN4n0DYO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykmwj0SKN+T2soKEMDx6lz/xZ1BZYbkF5Ss5abUwKiI9obbPk9
	sAJzJXnmQztZM5aluneXNbRHUlJvGpbyQqpsFFbIkCee53TlhAI2B8R2nw/zKA00vHWb+BmFsgi
	VO7oJE3ZoWBz0XdcYA1+Mow8TYC4orYMiS0rinEhFFAaFx/0HVkequHLSUysb5y/yts/bb60=
X-Gm-Gg: AfdE7ckvBtTemc8CrUNoqNDEODsHNn/DvGTcz7zGC3Nq/RSLB6WxwSubDNWZSm1Wmlv
	bH5FUX8UI1jbvN7x6rdr2NSBWioxTOdwYlgskVbGK9pzzEiWCIt2JJhOKWf7cwj7jARO/4MKeGz
	yOZuQyeIQyYzDuNe7xoiIDdo8Nh7GrmEpwP9ip4OvUycj6puiqX776ksBngakcTTvJmEVMYeYJ4
	yjG9NTt9CLJyA8xlbMwJHWzJFKkgUCufmYsotEjOvmc+JTXzFiyY4dGhxrjGAe7oApJ2oLg7iXa
	AtNwJXcP6kfbIAMXZBhYf8FGe0dvAM1AZul/sp+M5fN+IAUu6zY2A74altnvaUPs8r0VhZNIGOD
	nACdsCLf55gxLYoHAjbIiDTpp3bH2ZiZPWr6MYqWtP6d0cTltaBMxZbQjpxpNSWEZPx32cH1nRw
	uzvwyv3ujnwMif+v3P2yC8BWi6ElzoVf/bevSbNjmwlLSbMA==
X-Received: by 2002:a05:6a20:a103:b0:3c0:9c19:6585 with SMTP id adf61e73a8af0-3c09c1966d7mr2006045637.63.1783407338809;
        Mon, 06 Jul 2026 23:55:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:a103:b0:3c0:9c19:6585 with SMTP id adf61e73a8af0-3c09c1966d7mr2006006637.63.1783407338339;
        Mon, 06 Jul 2026 23:55:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:37 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:25:23 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: T4krQpD32osQoIPgeJu947gOyEnivKYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX/AALAQ++N+/z
 /mhbgCZaQJZbAnzma6uUKlZoyPEcNuLrZk7JyLkS2GK5WmVVDh5IPqR56y4tqMwZCL++1rp3mYc
 qr433CYREeT79fSrEtB6MvFkXGUqzNeVtXvJaeUEe0wOuWYnXRKlLGtNpjVqhlLtgfOzGEf4aTg
 BgDuZuL0CJsR/Bzf35k3niDxXM/0snXVLlRwfCCcndY7BqsmOfFrxJaPJdJo/AZw7brghwodGT6
 P0GM/LyRj15i4qhKcT5k28NImPv/m9rZGxfIJGzWeeG2IJ4dFZBUz/q78+0/tqeGbd+AVldHj5a
 GEYRPDlwYtykPbgEZ3YdoPQLKIPrq4OWuSah8C4Zt9hgZiR1BU83u8hO8qmlQCojUNdRc1VEJw5
 O4XXAaj3uRW+jKoMJynnuYG3c4R0368OPnBvsVZHjLKS1VypbNankzc6biCF2wtPTaNYQw6P6uV
 iei1oVHrwrLT72QyVrQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4ca2eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kFjMkesOqst5SjKo_mUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX4NomVhe2tVi4
 gMfA7cO9DrxsCXp0cYIkoyq5E9rU0SCyc/05xBdJ8f/27FlYN3O32142taNb2g+YqiFQxmGfNwA
 4zE3Y4qfc+aMsB+xrhADPmXsCfVKSxQ=
X-Proofpoint-GUID: T4krQpD32osQoIPgeJu947gOyEnivKYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064

Add the REFGEN clock IDs for the IPQ9650 SoC. These clocks are used
to enable the REFGEN block, which provides the reference current to
the PHYs in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,ipq9650-gcc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq9650-gcc.h b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
index afd17c00d96e..2d43ca36c09c 100644
--- a/include/dt-bindings/clock/qcom,ipq9650-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
@@ -169,4 +169,9 @@
 #define GPLL2							160
 #define GPLL2_OUT_MAIN						161
 #define GPLL4							162
+#define GCC_REFGEN_CORE_CLK_SRC					163
+#define GCC_REFGEN_PCIE_CORE_CLK				164
+#define GCC_REFGEN_PCIE_HCLK					165
+#define GCC_REFGEN_CMN_UPHY_HCLK				166
+#define GCC_REFGEN_CMN_UPHY_CORE_CLK				167
 #endif

-- 
2.34.1

