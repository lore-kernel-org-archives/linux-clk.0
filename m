Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768938;
	b=xT+tNnUpQ3w0BVdXj8iVIQ2BBaxCAmELXRjBDetLvyZn+R7bZqQZfTP2z8zqOPBSks7x
	 IljWMKjnbE6mZ+6sbsy/PCOg02PF/450fIF9Klo46KYCqDGLAQKjoJAWj4+2lpcFQTbDE
	 jRGLKFadNni9xAzjzK4GOhEflmmAXelKjq/R64nymVCiKmsWi/VrZybLoQS9px5Y7PZUv
	 HDYFHjmfBWHXuRP1nViV/R/LyTsgMtt30ybblrH9dVpMp92MQtmnPcWCZzEquJ/i3OCZb
	 ODfvkUOHK8UYkd6VaoX5Z5a2U/M74JGeQcfxILFqQDvSW0dcxCuv+euBtMdhSS5PlRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
	b=fYRg3j5thYsEb2PBNSHtIXzSGjxNwNy/w8AN7yBcXP05PzECrGoDwiv3b5HHIzfNoyTT
	 Ie3XNRq20wWv7MAFNy6sNa6V0pTTUOqeGOwpbth+cGy7cl+6gNlDpFIWGHM4/BP1W+LvN
	 cDHE8jEPBiUwNiud21bLJity0YYhktizyctwRD8qc3QYTgXemczAkSINYsgOWAA8fBPMm
	 aE1scrb5VYArikeKaBq+YwOnHqZYKMc/5U7RzQ4Fdb6q09dPpOOAEoYiMK403PLWVSMxT
	 ShQdYa66cAlyY49GrOgWSXKGT9fF2NHNSZhBkjs0DEGMNNWxozrrB9GFRukhnmQHJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA93606A32C
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA93606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R1lN1191097
	for <linux-clk@vger.kernel.org>; Wed, 4 Nov 2026 05:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=; b=RefKnmzNWvv4FqdS
	xjwAg+ah2JqQ5tnLdTw9NQ7kuRiVB6RqadPB6wdN2VBHIvYNaxALHBqHxC8t+jlc
	lzUldt5o8P2J+iDReMwSzR+ewNfMCxHZI6JBjChtJc27vswdp/PzTbL/ooQuFXwb
	wepIsbT1oyiC9rlkWbaC9qYbGcFArUYT/uIX0HetS44e9SOOn7ESosi2V/3nw3U/
	A5U1R24Onl4JKlEhn+PXLZCMK70GTS1agkpIQAV6xnM6W1mVfh5Z+FhMl2aIrWuw
	eF5pGsUhI3/2liur/kdUWs0XGAXOMQ4VTCJhe0j/KIszPqdNODpsPOIPTtB8ri0O
	yByH1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pjbvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:08:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so696469a91.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768937; x=1794373737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=EjbueMa+mQIxqpLaSDEecuN5Ny1MGeM+1+TZUaWFTXbsXvAmDII7cfDAij96Bfzr76
         PmPapXJlP0wKbY99PL4NLTLO2z6zOxWWN4RS0WWDSpAC3JU9v1HXwRYm7t9/O37AqC2R
         xMyvuFF4/p9fG7MLJ8mCTlSgpOuJhD6UjtXR0IlIZ4b+hyBrCiE1OxUMqb3fl7YQw1zF
         YwuFNELgOJlqr7zoP6WOLjoY8RjUwq3KEzuiUgAFuGkOGxPyi1HxhUJfEqf7v8vWjzNu
         jef5FY3JgNE1NJ9kSb6cbN/1r9aAGtRtJyyzpJT7PfVHpph4jdLuZQpk0cz5G1/IMhIj
         9MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768937; x=1794373737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=yP09QYD6kxsFhItXRkpTRU6u76749DeZLNo7Qy5xmBeYYPBvWFLGioreOo5nsu8yBZ
         cuuFulYl7CAHPqrnH6/0vB6PRJ43x/aUxkuJkw5e7PWBGqEXvYHjmefOzwnJpjt0QJ/C
         lJgZFvh2JlPOVKHOuOkY/cqnzfzf2J3QZU8JPfkAapzOCl1LXwgbxT/rjwRlVHmljx8+
         k1qv2x8pFD29Ijpy+CWi4BAM5WBwcZKdXcImCjHK161N9Ie2nojEZKcPCLPp9T97RgQk
         1YeH471XQY/LdacBVydKJ437gFshvvUJTbU5Jd8rpebo6gc+JgYNA7OyZJmkU6wQFYhI
         k7OA==
X-Forwarded-Encrypted: i=1; AKwUvBzEic96SQdtvSRHfoXIYtDKKgn1uR78Bzv3JnNCQsv9hbnUkJ2bDsWPE9YoUYLK0IhW1CxZ8C2oWcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1sMSvDUnYJ1F1nyFQ4jvqg0oeZIPNMvQgEDdmLmAA6H2p45mA
	VwNXh8y2PW5a5cpZFQZS/Ny0H8ImP8KfkksIWZA5EjsccIsno5mMxEafkmOc3xSnjFOnv0VYCSC
	d2vrAl1sSEtoL6r1WYWzOGExCEnwiVQCXpfz/fg4LvzXqQzIN7/ekA24XHFjU5/o=
X-Gm-Gg: AYBFou2ZADnfWCYR/iTINE+beIWJz9y5MgMMbqL4lJJdElWCHVl/WyDAMpRFkjTWkBa
	oI1aWJD0kW4jDgV+W6a2r9GYO/ERdQixzXluoZ95FJP4aoEhych45A2A3En7+7+UpKmBjkFlqJx
	hu3k8TG8vlvnSi3Ag0JlP8GqMn0qkUV0UTkmGus4dmGrgyyBuSBwNzaET8T+LpApyoWewCuJBWK
	QTLJ5xOeZyMo6eylqFRBKyOa29ZlhqWCu/QwQ0QDNs1B7iBdbA8qw1sN+CrYE6bQsT4zvb48NmU
	66M4e8fvBz2s3PQvo2QjRCLMSnRXvtD/bVv7aPdyNqOgtoItVqqEXokODj3+DNZDFN1rxkznSq6
	AQxTCGOOQiiwCxj8/tKx107g1dyKWGYoVmxy69IKjMOwQtnM+cHWFopkX58YP8YPFs+h+fH7lqC
	RrLQs=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545620a91.45.1793768937108;
        Tue, 03 Nov 2026 21:08:57 -0800 (PST)
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545593a91.45.1793768936590;
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:36 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add support for AV1E
 clock controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-glymur-av1ecc-v2-4-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX8TGbjtQgiXul
 FAwSktouf52LY/rBRDwfV0mBjbelc2OC0wyA3B1hd88LvfYZDnYEqxU/oQMN8j060lVzrMl7Nea
 VJCbYQDYUe4kqMNbktOzhzspXsafgF++Cl4y1kLpe+xg8HFbO/cBgakm+Uu3HGjZLuYO0xEWlt1
 x/RjdY3LuKXWS1Sagggjwbh4uDoUcGeKdUu/1cgaxS9f5n+pXoyWL8p+D/r5gfNCc5oz8M329Z/
 /xL2e/FE3HXCVLiI2E1A7Goh9W089WbNF/LZDY4/u0OHJkO8VX1NWG/Ru2qW0Hjba8bhbYKMOyN
 V4++xykv10Ql/KP+94zcmiidE0Y5id364ttm6vOghpB2pQGmYQfIuLiZE/C9Fp3zbQGNAIfamqa
 Dnb71dI+WXaRZC74vq6SAJUS9pKzbiNl2lEdRytWaHKpk2vYe4XMBmEj99LoSmQLrOZaaX8cTAw
 Z451gBWLm4rG+NMQcRQ==
X-Proofpoint-GUID: edqHZ30kykTidZyA3oNaI49kAX1FTDs3
X-Proofpoint-ORIG-GUID: edqHZ30kykTidZyA3oNaI49kAX1FTDs3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX2pFB17CWE1KN
 78guJlTT6iGPQsQT1wXLl85APj2OJxdv0jeZaVrplTRLf5MGMfGgdB2iLVSXwc/iht+ZdKdmYfF
 dFHnNt+mCtduK4thHQ62vkvtI2GD4TM=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeabde9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2qHST6af7bV6ZHC55aQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020

Add support for AV1 encoder clock controller (AV1ECC) node on
Qualcomm Glymur platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..da7548e6f1c555a01513c964dd974d45f07f7266 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8146,6 +8146,22 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		av1ecc: clock-controller@15220000 {
+			compatible = "qcom,glymur-av1ecc";
+			reg = <0x0 0x15220000 0x0 0x14000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_AV1E_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;

-- 
2.56.0

