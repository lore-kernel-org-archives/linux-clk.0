Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3407A1A6834
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971633; cv=none; b=e8pOyZCXKm8mK1XBBJHivPnENxc1ixabtBiORY+VnZ/6aOoyU8HWWZDY8zelFhVxw7jauytguuzzttyyj7z67oWf4LDJGEOQyQ1kzSq+44PosRpp3H+K4yhju6LxEXrRtz0Crc8ZVMyMQo6A+xT1N0p03gRinhQeFPG3TiWBi9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971633; c=relaxed/simple;
	bh=xwyDh/gqIKThBIDqDIaDn1f6CWzTkjln6k/sldLENWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufxke19bEBhHHFXMn3dc2HMBfn6V2LqJsFHg5MFsi/yYTAtsblLnI1IOulFDDRH1aUHU5EL4Tm+hLWGjmTxStp86et8UxG6u6+u88w7C1vtvySra1Z5ivRi1F6VtygrgMtkk8FJ64VWZ8Nk7x6mOEnC7qSd91WBsckxG7NGSbBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFSdfblI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpJQd/nr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFSdfblI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpJQd/nr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z2g3485210
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MM6fxEdC63BYt4I9p9mHc3crUkRM0DfxDxmdNan0WwU=; b=kFSdfblIN84CxHNo
	/E1xDSz9N0L1oPeatOKzBH4/3eF5j6Z6ekWOb++EYnCGGHpX21Jg7N+CC2wsU5KI
	sdhDzIrMPL6eolEw2DUSTzjca3WwplAlDpzMfR4+IcBOLE/ye6ALxZCHrh+VoXe6
	pVNJCCZ8dxnzg4XOQ4OxtEmLIH6cHgPI8R5zF7B3g80yfxxeleZtp/AvEpTcEozO
	WHLGDEs32Cs0o6gE4hiDIlvCRI65VMhFDPB5fGE2Ai/eUBFWA+XbHJpACUMFWZmA
	sknvuZXoe76rPwaiCD3odFh+uUKUh1ADMGZw/hQmguQY7mj6Qlct0K6+raF1ycGy
	++CGeQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j96sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so16072015ad.2
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971630; x=1790576430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM6fxEdC63BYt4I9p9mHc3crUkRM0DfxDxmdNan0WwU=;
        b=HpJQd/nr2yHmoBjmC3IY0/zdjTQFmhap15sTThwadxtx+ajuGu3P5yRcatsk2Cln2x
         NldGNl8TZTTMSSpna0Ti6sog0K8593sS0O6X+0+fDKBPxFOs3TdTUTun+E5oi7DuD/UB
         UYExv+17v+9qYPRuQ6Lhq7kIhUd1+ocx5UefueCebLfTJiBev4AHDF35kMWQPXhfHdV0
         AagCOx1qeHGjIrgNwk1J3kHYBRGYDfNSe7w9eE6LauT9RRjUJs05+emnb8Q32pIFesik
         eRkJY4bA2wQW8Lq1JEjaxhkqDcC2m7cJ++daVBei6xn3CKTbXQOdW+tLq+nuQ5F56rps
         JRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971630; x=1790576430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MM6fxEdC63BYt4I9p9mHc3crUkRM0DfxDxmdNan0WwU=;
        b=QaTrJuoRQUvFhSTwRa7a3Qlom2GS85VN7U44yBPpVI5OUimC0czTuzhXQErc/j9lBg
         PIvAihGMegG5MzuBN22MLOVChCy5ImWphJI5ZiFQr3nc2erDwOYKWkOZRUkE4gPVHIZh
         Z1RWukL/ntBBiAhOCqpYlm0MFdWiOOle90G4sflqM2jFbLwwB9mthp6LkZC0G8k/LCCx
         abkcR1szdOkV26RTf7ePuE6BasMxRxrGp+bxcVWIvQEMiUoGL4jXCPGooXws0ztODIFF
         cyTiXJC1k5UEXvrjlo8Xij0Xj7wtb8hXIFFAcmPZoibHRls2A00qGh91sgTeahCkrNho
         w90Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1swbnsyyWqpRCMz2AL4CYsMb3rI3Xx6libPvYrEhCQYZhSqrySjOj1NESve+SwuktU6x66tVcNGc=@vger.kernel.org
X-Gm-Message-State: AFuF++k/umofJepf7xT9Dzfrh29rT8iWiGLn8BdLK9yL+max3PjXU6Tt
	VpcDC4VdI5e3y5FMs8BuDWXlyh/H80sHXruxmGmabCmk3m9RBTT5jD3kixaL+2bWGqn7UvegqMe
	rHEpdjw1ZBODGp1ad4V0WopnFl4eMUUvv6ZoHc4sTyCOrwxHCdHBNDHSqDKItm/w=
X-Gm-Gg: AYBFou3sqwHi5iTLezkeO9GEKkrptJLJDuYnKs7n8H++2H6LIkO8OVoeTWTtCwwv8nu
	a9NDNBaipy/nHgYPtEKAudEKsjnXZRBzhbOJyQrHTBLlKcGfxXIAoTOYtC4A4WEpDn34IMYEzkT
	baN6DYmJXrB3zN1v8CZUmWICYvRVEL8YxlkKgYNGGNqg7FTKNDxqLQfaCPyN/8wxJDi7QQMPqHS
	xk7JB5il7kafCBRJjJ1dknY6VleTtqq+9an3k3K1/c2ItHUxIkq9tbexlwPK7kymk3E35NcFw3I
	I9DLp8Ttjq7LhqezjhIJ2jkdEFAuIbRtmEDoDxBBNenw41MSDVE86a6ccJQYsimOV8QR5hsbxpt
	cq685iH7ZZD/BvIxQfB/4GtIZM/gIeBkd9w2/ckqdDklGLkptzok6DhkJFoCwfAPLmnBlRiudhE
	6Aynmlhv13Fjl4Vl4yv+TwI7AXhmJwGv/haw==
X-Received: by 2002:a17:903:94b:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2ddb1ac1c03mr132240255ad.2.1789971629717;
        Sun, 20 Sep 2026 23:20:29 -0700 (PDT)
X-Received: by 2002:a17:903:94b:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2ddb1ac1c03mr132240005ad.2.1789971629268;
        Sun, 20 Sep 2026 23:20:29 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:39 +0530
Subject: [PATCH 06/11] arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE
 clock to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab0ccae cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0BHkJw7pG0aoMaekWq8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX5ElkFi5N7H8s
 7LffcFJA1T5FvyY4M9SD47rOap150qNyqfEtVHVlvDwN8++sFSfxe3p++GeXSZB9omAkvZAPwbE
 8FAHRUmJhIIFdkNhoiSMOU1mD1fF21U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX6ECNgElWSPY1
 wC/Q/Uw+oJ4rU7TqvqgvSHJ56CIyW10cXAQBT1M3HgVOs6qyJXMDqPR3mwjUArvYPFpVLbrwZnu
 R39xokFKVLnRCOyCRXbYQXd4IC2xWi3i5NaB2pHjjjhqCJEQVjr20QU8Bk/22Tsh0F0GSgK7IqW
 HBZBY3Tt+2f7tB/zHApZd2G89Y18Y4D95j++xrti5KFaIj45ln+YIGgN2hIM3DNWlyObaWo43OH
 RHYF2DRVmxcTr8cEFIzGv90V3DeW0t2Ah528qZVxnlGpt1lCzE9uqNYhoijs4fkvIBcFIiMVct6
 k6eIK6Y80wFI2YqVSGPQKdfVeG0WQLPzePJNSWI2td5zTMXF9QOL5kFssEozHBCJmjBUwKgEQTm
 fZ+NRJuRv6nkHvo6SSYnL+0YCBL4DMVKZCC8UL55/7AH/aJHyhRczZCqJ/DUXxQqsbS4R3PiksI
 by2JbeCBjmsFwBmldAw==
X-Proofpoint-ORIG-GUID: SqdRmBOgswKKVVCRwGksnSKPJmk-I46i
X-Proofpoint-GUID: SqdRmBOgswKKVVCRwGksnSKPJmk-I46i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock
can propagate to the USB controller.

Cc: stable@vger.kernel.org
Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 702061e16a58..95e2508ac145 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,7 +486,7 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <0>;
+				 <&ssphy_0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1

