Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD23890F0
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504977; cv=none; b=FF3QXCMFUm9Vrku+Anm9IvBLqQ55iJeNJROc0duQS7OIGHCYrBkcLMAShz25CSZD9fmZXeKnP+Th9MAwKf+5LtvE1rBm3w+ukUmolDYKOwwT+AT2jGYUl2P4+59jnQ5hr1uN106hVqDKzta2BF4rF5LSkzZvm+EZ6OOVKPd/7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504977; c=relaxed/simple;
	bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJgScEpe9dr0TTm2JCGchAFxTBS8XI7vUcZhyUwMaE2SqEiDHMJ4J+EhzN9aIzBESPhIh2lOiG2Hgzmkib5VeBHa0IGqovqQEU6Y6tEXN69uoya2KCF8SZuZ58FPvRQefzR3Gmc9Kdu/G32nFCPNJDY4/EMnUhBYQtDorpZ5ZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TP8pqTCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkvUL80E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TP8pqTCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkvUL80E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688913Y2083334
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 10:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=; b=TP8pqTCbtL2kAaHN
	NHix9DatpUHyOrGfi1rhWg0WRSA1QcmAYCDb0Sa72fiADWcZfodClzsRNsaollbH
	0bOxJJx1kmaYWajn9V5BudkWPHUhIZ1YqVE9r7olPv5e+kEmq6jEqub1yi6EvhIA
	m2n9TCqJEhq1Wi/twVeeAtw3t7jYSJxIE0nV+fBypKR7FTvEDoZ5te6LtnyNh7V8
	mOONkxRwhE6cFbu8tj/77XUlUPC1bUIq//0qZ8WwCVVNXE/dMmT2fTU9qJNuXtdd
	0cXZCzxHzDUlk/YDBYiRHdjcSSmiUQs4mOE/Xywxu+IAuQlv38cH1ESK2TpnAruO
	SNGxbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw90d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 10:02:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384636ba25dso890204a91.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504973; x=1784109773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=HkvUL80EhmYuraxTkoIMoHiazscorCv+3dk91OBLB4ICT+rM9zKdW+XsfoGtpmNO6m
         WbMCA8ddcuHGp59sHUnYPbypQ8Pkh8qCKxVJUhrIsEGkdZ3k8FK2JIQiDfjzReON5zMp
         sqsSMGKcCgknjxQjEGTQ6QsUo9az6Qc6O5JF07gbsO1OLyah4Rsh/C74wEiLIWU71WSA
         i7Q02U6M/4EQ0xGZAiwyny+hlycjk8wq+2fb3ZgqAoKjpOkWPiY604EtexcrOTN+BAIo
         fhmX4XlTiJr8OKcttSAeG913pIDq+S9LzDelADmpWy5trTtBNtPrQQukkZMdfdxGCPxT
         FTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504973; x=1784109773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=OKjmNxfcBLOrt33ktaUxCOsAJfbQaXPQ1SOK4B9cLOKcymfEparU/gda8EyPAe9vWc
         bDmF4yWBZc6/27wCIzTAwXoWo9eej2X9Ie2077LR6KMznbkjc3r/Y1j0xeWe7WddT6wo
         Fm+cO4iL95s1zpyYCCvrBgC+voYbDzeNbRruCw9Ww6BFQ2sQilqBcrLMf021OP5DhEPN
         VAwFO4V971O6fA/mrAlPu7aYXBc+QDEuL/mN56yy3XKbn1rzC9zljZOjrkOeu9RrLLy8
         EIWoEIhcHmkynr9GlnuPMLppSFPL9tKzQKBDdT5ANU6OMjD63/j7nBiEjFlCVB4BC+Df
         yYiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpczsq6Fin2H3LKjg9hyT2zXo27+JKky9YkYBHIgwsSCJcVVLHMSkBODYy+OBjh800AmIlXaudKj8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyerK95LjujwxQByMoyVR6FzB58Xzlo2CVLnLoA7rebkwJu530V
	EiO1jiPsDSYGsc/Hp8H/gDyJ0EvDT0wCKNGXtCTnEMW/mQM4Cq5LIGCDjU375Q4RIe7ZZ2GzV/w
	KDx8VmWGT7W1yLDK1tWnonbIlcbo3mjhPDcHunUdnmBO9+SV2VH93coB40NFIHps=
X-Gm-Gg: AfdE7clEh6U4oymRn03D8ANfnK54vREvRHrYsTXEz5O6wj7p6go4b7J7M/bi1eIVtJT
	SCg4EdEVTWx6l2TPvbZER1kjcob05tdYeFj5g+LdfBsXLZC4FudAZCN3pOA8ZCSLonB+zK6UgDq
	LYfF6wg6PfeqmXslTDVwfI3l+FvxgwUe6UMvu8g/5dg3pd0I2UT14PDUFBuSgKvtjtwweIIVX6g
	AcZVh9bZdj3GDgKrF6Z/lWJsRMGWkXCIyz/jtyAhKYCy5lWXL7b3yYWoIgMobd5R4sKPWvZMlVL
	bQucA3IAJN0GuZHLChJC10zSPI0P0x1MCmVmDYWBmCe2KtyYARVM6gVZhUoHkGbYd2XxzCBQ75i
	nkb/lkSKxDqI1JL181oOggTQq4T2cCqpUvWMPDALsABNUmhZ4QeCzwkZFSg==
X-Received: by 2002:a17:90b:2883:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-389421ae226mr2037723a91.28.1783504973031;
        Wed, 08 Jul 2026 03:02:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2883:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-389421ae226mr2037659a91.28.1783504972419;
        Wed, 08 Jul 2026 03:02:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:52 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:44 -0700
Subject: [PATCH v8 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-7-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=2520;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
 b=ofDwDU6QY94LH8znEWl4KnkKrNyk5BkHR7B81ltOds3r2QDUqDMzE8/CWVIyYSY0xdAneq1uC
 U0aZcCdJp1JDv8dzenw4hdDLtsk/0QnW6iLOviEY4mRNsve7C19QmHU
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NyBTYWx0ZWRfX/FDMGxz6okd0
 nn+4t/rQTNSTxYlocPVspYEAKXvGnKrIi1bxrn/YwAi8QW6GwyGh8UcwSPjcwHoFHcg3QNRvAxl
 /P0N4Htzb8leOLb/0DSYlr0vllQ/w3yWZkl0FfmIsokhs7iTESx5uyBJfSKtUvHrjYQcnruYfTq
 lKbCMGfBvlpp4ButaHtI/ns3d8Y1K2FPHJ695Pb0wHZfv5GMql/ZeEOCIS4E+/Su3bZPgVVvh1E
 pYlWWzAwrvUKo7VFq7U1Gl+7pGt//2DRzlnqNnqQPm0uhvzEMt91bxSieO7pw3bnIAvVC40RLoN
 yw3+Qr36ScCP57Wm59lwqYIgxjz0ZuqCOLpQ1b4UjumjbUmIX3pb35zMV/oGy3Zl3hlZhsEVU8o
 dK4d4mOG4MwrSU2wV5EjoYUSszP8hMb7H3hvHxKG1/xJNrfBqHG/2KVylQKvHY967OL7gyyWOHk
 6bBLDHQa2EhZwSI54kA==
X-Proofpoint-GUID: -qnkjNmfe2870yZNfXZcatWVcoQuKGMD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NyBTYWx0ZWRfXwRTNZQa/7ukp
 ZYq1TZKh8B+x3gHTjqDyt5XKohAclkmKB4rLBGKJGupp91k12YWfS6jthkjU+43b0EZB1ResL6H
 DMrwAzHBdJBgjtnl+32kvUBHUDLGxBI=
X-Proofpoint-ORIG-GUID: -qnkjNmfe2870yZNfXZcatWVcoQuKGMD
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e204d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nz7bh4JJC2V4q-rTAcgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080097

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1

