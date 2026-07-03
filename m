Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BD35AC1E
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 05:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055060; cv=none; b=nJsknW/E2WkW1BV5g0NjzYVQffgea25R9Pz6VfoqmUVezaP4jJ75XqMfogrMqnwQ9RqF/Mx37a3rodtjxdh39UHCVqo5MQD5S2qc8L774ufhaXMBQgaM2i1Onioej+EkTo+eS53/fgkfvECAk0QJTqYLXbvXV5pRFENGMT2VXDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055060; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBeVW0IFgLU9lo+mcpHR8DvnZFwc9pIvOV++MImJ5qVY/bjB2AlLH/XPbzQt3aMiTgypYI6WiWJri9eNlA1DKT4MzDCj+/95/Kp9N/oVSux5j8NC/5oDihR2pAiYHC/e3spBDmUfGXOq/29dV88j8ZyMeGnYyhzIjSHO5QaQCbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE8cVjv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9AER9Gu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE8cVjv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9AER9Gu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342nWF2687245
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 05:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=RE8cVjv23JrCfpd7
	FIVRbDajUOZDh7MXaDvdG5eD04CcK4y+LGcZySUAp/E/ZW7gfhwM3m/Odk0Oq1MQ
	XNC3Sl2bjP9VdfpwDpUt4vHAu5R6uGixFq1aa1zx3O9T+Lxblp8Eu9cNWc+mBEb1
	zu5r2coNswYq5Uk7Z3fFLBE7vmZNCRAu58+Uq591oV0101lLHxZJgIlz27p8wirv
	Y/RdLrzmzPXkbhzclvxNJPFHgpBWaeVQxt9dmAzT1ox2mm08LUiV40kVwhwL4vrE
	wtZAyoCK3RvU07c0W/XFmyBGL9cV1DnLIAGrr5xnVXMRI1vCdWjmmFhLFfBXTtvw
	fM3+dA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0hrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 05:04:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso231238a12.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 22:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055040; x=1783659840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=U9AER9GurKy6kYCrz90axnzOPfFsn07w/KFN6QvU0nt3O94Zqg5Uw04kRcopH5lnVr
         aj4qVA1mv6BdOPISB6qjsX+Iw2DRWuAj2B1BDzFK7F0wxSvYjbldOTt82C47ilcuxzYd
         B677mgfmHAu0vWdrqoTGGV/ILQERJ6s7/WdL+mNuy4uEDa0rEpq82i5eE7A1hXLnpEkb
         C+vzVtQpaB+YrOySd0EGUQRZaYW0+5c0ZpkVsG03hiQ/Vw3I5Zbp9av+gtPTmZvXYCLR
         7rgJFyfsvBlllkfjfYP48i8VBcAdCg06WHWXKSLWZ0pfXdUMsEJ+MdAOzSTo4MKoA1Pw
         FXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055040; x=1783659840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=tEp4RRPojNIY2Mx6Zee4ocqRjSgXUO0DQA4FYrFWRlEVCpXUdJJh9hu2Z/6tVHqFP3
         72q34Nw6zWm54fpRcTqLFoXuDWalZnZAmQwh0ZuD+3MGeZpVpT8QAQw2qCRnnuHHXmIZ
         yLeGbaGLFvPeyLE39fueMf2kOKr2IRlMoiFda1KTzLtMprEiWoBZKfKiczlbh4bWIhmS
         ESUS4eXT12nmTBnB6HxaVtJT2lAuoBNBva5X8D2g2y+PEJIHabOqqNX2HXpiSFmqsblb
         2xYtoQ+AjNoMdG1cXsMByeXO59sHv2kL1vV0wywztHFVcC7vRHpuT+cxpqpaOfVs1Z3Q
         UCAg==
X-Forwarded-Encrypted: i=1; AFNElJ9pg+LIZyLtCS58qW2vrYTyZcFaFNxbPcI3spYDFaYsMuWXiDNKwttz36XkqHnQWtG48XmD9D2aCjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rDyzDje0ar7qIsuboTRBjkl7ubX3uOmPAxtmdpXv3fF7BeJi
	GIciUXgggRouOmo3/wcSR6yqRBBGBe9FGH3OPsMdQXjsFCAGuXzr59hCnGxtjLoCFX+DmgehFN/
	7UR2ZOA7M7wXN8XM81i4y1Scv9RlsFWQT6RH1scY0HXjcEwWADFvukFHOKEfpVOE=
X-Gm-Gg: AfdE7ckyidZNYBENxsdTAZQCXNF1YTCIzTOkclLXdd0Kl1j9rGQUn2vtvm1eb2RzAn0
	frOjAyicGshPh35KLtReTCsEKbT9Gl0XcqWmxyQspAkPqonXgJ8Nn57CuJFIiJar0PMDnrLKxIV
	CUr3wpkpd8WCadUX2gFIeRNOdgywZKMMk8RGmFfg9mMWP9nCvkZyyAzdXl23cd6rMhFhI4XwWdg
	ouMAZ484+fWcJ/9s6K1bjf1l/NvQI40G2FAhiNHkWlo9UHtHXS+zDMv2Xor4+OAqIvH1b7AbZbH
	bG8X3N/D+F6zpBjf8OFgcNsQDXkbt3GdIzGQXyldIsC7heJLs+b2kNIhW795ImQYHQt5C3uo9pN
	5qQ9HSLFeJn9dgYivZMkmAu1iYFCeNzrkIBOxVOuwtr8TTHiPANJbGFA7ne/DQZUgFoWDx1DMJM
	6OdLOzS2Rfou72aJkFaWNo5Ca+kaKnSEUUSuCI86sb
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr9305617637.51.1783055039909;
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr9305587637.51.1783055039367;
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:47 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-apss-clk-v3-1-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX3Ntntx1Hb0gW
 DY072FJ1l1l5huqOZVVtMON5Ok18ZVmxc3Fk0OKryJ2a0jawQ50iVcdHbhYTmdbpkhHToJmr960
 JuAco7xgWS2tCwTOmtH9bKLaZQFkxUM=
X-Proofpoint-ORIG-GUID: ey3t-7AVpWYGteuyjNNI26s8bArJGis_
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4742c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ey3t-7AVpWYGteuyjNNI26s8bArJGis_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX9dX86lOyDzbx
 87OxqjqAVM3+muoJX54Wl+R/roVEWvXLKAkCvN9KlYCSIlI0IgdTNGibH4l6yTa90znaydHGiEY
 oD2U0UQXzWfTIhOKUcmkEmhv+HQPBOQvWxgFG+gngHZn0zlnEXqkARqSU4aqUR0JDgOgZtt0uru
 am2RALJb25U0luSZCTaulp/hv4QWaoQeR1NiTORqp8Hke3V8zZXavOiltQXA5w2/N2uO66J1pCc
 HPziwXZsLOBwXXv8Be18Fvo/DAd76hQDLL4EjhK4Sy+LweVsqwzv39E3bXzkzY7uwU//WAoD5ro
 wpI23iGQubMlytyZztNQxujIk0fXSI4lW20IUlTds5RXIroJXA9pP0ti1ExH1jUPM3bjRnZUWYf
 AIzH8+tKZZ1ds2aXYeVQrYNntCJMLHfTD2uRCHHIRTS/INtsTCj6SquaviMnmOiwC4WV2waUbWA
 Nt4blrswyXyVJRpNSzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1

