Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D74355053
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822585; cv=none; b=A4k4hJcDJOTV8W1cYXOgMP0SG1t24MAhTKHegnTBF22vuo5siPdunL0TfOOxmIeXQH+Df+CPflhT1zsYjKjt2RXMZZXg5zOtw4+Jjjrshzz7gbgMictplX2pOhnzY3q0T3EQBxOEUAI04Xq7wIa7OfLUpc8q1V8rZWGcllHENak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822585; c=relaxed/simple;
	bh=sIVIbq8czOIkzw9bYkb2A3almPPM6iC51MfR+uV4wx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6VMP5sWNE+J9n0725hugaGKiFtNgK36b54kniJyDocjjWpq+d9O9hbMFZxpWr5swz9Cutxtl41BmBxbnxtBDgaCNs0QRo7/YgZLeuTuVXViMUAxvCC6v1u16u7D/kOvSFz2yCClC8GNIdGjLEJbV868h1T8w5buv8ws+b6gTlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oetmv4SE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2LZgn9S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oetmv4SE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2LZgn9S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UB8bYs3808770
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mirFkPygeIN8JZufnUR1dGGhkj3iIudgxgtbmCSigM=; b=oetmv4SENmNFjea/
	cVo3s0bzVdgnWX44QDbImZe5+E5nDRW8Zx61uGrhxfGCSwWkBFViTgfyNsb8UE6m
	UbJZJ6MYiDlPxmmS/fD/gaIrWG73VgmbwiVKIChBKeN8DsGWmA1WQ/n5DZbTmkjx
	lU83dulX3GC4FwrDzGObqC1SNEMTS8Yw3Ueh3T3DLS1/yyAyVaSzVHvq84e31r/4
	CbMKpBQMHZyo6R5ez7/AtDBzgGMn5lO5CtHnbAQttweB6JaJAuduuqZQrlw4OZYy
	ca8zfGPxPJmzhx0zFPdXDl8+loLaUQiLVMTa0ffM+sjxyLInWwYJiDKq2ILT+HOu
	ndgmXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv803t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290cd61855eso9262635ad.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822582; x=1762427382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mirFkPygeIN8JZufnUR1dGGhkj3iIudgxgtbmCSigM=;
        b=F2LZgn9SV+S7bo9y+cR//c+n59rLuJNk0XeC5tjjJGAm9tmpmmrLf5xYPxaduQQygl
         L8s4dhKX5FFPAUTG9OByZwiPhcaBC9uLbNXQMeAIlpjvpN6n1YFsdbCGlygEWOf/P5X5
         D/CZ2jUkRpXeSOdCDKT2cQTAcgf7VpnToah5BM4uDEb5JewxXSwH2J6k16he04aNM3FJ
         JIfhJt5UoQuH4DmaR2/3Rvrba81xrQE7LizSxkBni7pFkYLNkNrrXBzybWPFWpzHWwf9
         Aqj+2ap23Q/8SPWBY+Rlm1u9sg0QUSfPxyt1TTjtN8+HZR4KcajkkDwXzG5Hb+BpbQ2o
         G48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822583; x=1762427383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mirFkPygeIN8JZufnUR1dGGhkj3iIudgxgtbmCSigM=;
        b=qjTtJdUc7qBy2rYdWEko1p1/XnBrXMcyVCdQE5HhhPhVF9+nSSKhBcws+k4PocT23t
         A1K36kR2p5oR9tgheALAs2tSWZR89G5y1DcxRX5znh65zcY/3gZKjSe43HfPXlgncnRM
         MF/ggjTK6xIJ108/2a1g5YjYZicgZ2mxltHV2hWvcf8GPZWYP0ENGqWZLZtZYaJTDXzC
         J3RdLR0aDvXmjisCyabdmc5Wfn7B1E6jhVHCSjGVm1jSMdS1mBvoW3xcJtK1htGlp6tb
         PCxW56Ab7bnvf59fCYDn+UnT6gQBRQmlElcj0mUFIuoCTTQxTzoVr2ayWzm/Tei87RYS
         XbOA==
X-Forwarded-Encrypted: i=1; AJvYcCVZrQxufydKqNbqqrOOlxnTyeAm1+iLhBU22NtfBglgzvo6c9OiUDnT9Tz3py6RYQIiyqrgsd2efwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTA+ucYdrAkrIwUlFqqLyvC55lacJibnXniLf9VDjAoel1Gbq3
	KSOfFVJHVMyPHWs37zjl3GT9l6xdLv6RPo2Ew9xJhU5IH/4N/+V0jzsufbIeWHNllG8ztG66He1
	gPFCg4J9JBse8M/mVhRIVJ41QPDPwbikX8F16T7rmtgxA1BUr/vHK949h0gGkZbM=
X-Gm-Gg: ASbGnctVwX2oHJ7PNZAkDXOGWWG0vi03dFXryfs1avGoAk7LLiPbJMVwUvD7pCA/M+Z
	swYPYDCgK4s3gSmBcjKl5DYCCQ4715SugK20tQe5DkTfo/YFesjJbOe3A1buL4c+fQcl4/ykcCh
	lsDFA6G0tWNU17bJgmsYoXHewRbCuAJUVMTrL1TXXZy0Fy01XDY2IkkAuj9uPBmda+sCxbxvkmT
	D793REl1x5KxiwoRfvwHb7MgKyjRo953HyBtjebbkrL1pwk8S0PT8cZEheEBAGHOayp4AC+nmLm
	md8m3zCK9Ady8K2hmOiSJLXwZkLSwxJRBO4e57DA46MchqYgmyeluSHlTXa42qdrezHfMIo/NCr
	JYdNx2wyhl41PbDWmAOxnzSY=
X-Received: by 2002:a17:903:22ce:b0:290:a3b9:d4c6 with SMTP id d9443c01a7336-294deebbd15mr97770355ad.36.1761822582499;
        Thu, 30 Oct 2025 04:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG99iD9Ufkeeex/L2YaDr5szoHa3EyDBbap0FH1uhJqjPSY1iaP8jBt/oVhhNU8p2p9da5Jw==
X-Received: by 2002:a17:903:22ce:b0:290:a3b9:d4c6 with SMTP id d9443c01a7336-294deebbd15mr97769875ad.36.1761822581969;
        Thu, 30 Oct 2025 04:09:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727fesm2262839a91.4.2025.10.30.04.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:09:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 16:39:04 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-gcc_kaanapali-v2-v2-1-a774a587af6f@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: on61vqIcfXpQCPGVLLgl5kZTN147BlAk
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=69034777 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1qsiTTBwNum--65e5p0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: on61vqIcfXpQCPGVLLgl5kZTN147BlAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX+c5E/vKUBmUg
 SS9xWCKDTynTG9hvB5Zw08kj7vMBzxJJzXD5PrgTZKL6Gm9lqSnvcgD+JwAtkPlFS/UUqavaRk8
 i9h2Qc3C8W8nKIoPJ14zXn6fkbzCh28Giu9aLQzXmNtdiPPav5Nq2VzYuGxgLa/OnevyS04ILPi
 tJI8qao+dwQR4tMHlEkMHbx077embPDHFlNVdq77cFBaDlkoo62eBNLkfmdkjncx1qdmmA7O3rz
 /rmp/0zgnp6+4LJE2R3lroIQw/wtKASt6bPQw7J7PIC3lhI2aI+5j9sCF++3nhEDLt73HGjHBkK
 HNdLBnWpz9cvFgRhDe4oeU23pCrcjRyMxeSiUWuyMdi/VqWmFL3qYzULnJ2NDgHRT71PgOcbHvq
 UdjEQIVnPHQelgE7/aVghh8YCkMIpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090

Update the documentation for RPMH clock controller for Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 78fa0572668578c17474e84250fed18b48b93b68..3f5f1336262ee60bb29c2fcea4a9212ccf7920f4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-rpmh-clk
+      - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.34.1

