Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6503C6A55
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646115; cv=none; b=jXqHCRdfRVQwNV0UFsnCYvuO8g+YzkujOichuXwrqPx0MT1fnUsAVJ9R9RLg7ch8q5ift5tPQn9zPuSr7kfC5ddI7RZtox8Hao82pA/nFdxQmFnKe/IOYqpHNObNfTvJRHXNBqXgg4CSiIKnevqsDX6JqNXMhgb7w63NlrFhsq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646115; c=relaxed/simple;
	bh=FVOZTq1ijDV9vsfM+ILLs5LfQatBgVIEvFea2+aORcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TPN+7Gjlhc2s84V5lSWYXpSQa7iqmiaDxR1nvdgGtiwGKxR1Z9cPod8xhtVN8/wJXQ9jUeYeZHUf8QCui1qkEJzw4oe75piFJryUmyHUuGnzh/mIGhuOKF98ocrRf8nPA+d5BHyHnCPbNo5/JZo1/ikDDoCakcCTJalQyfsnZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjNEJviD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBZw9Z5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjNEJviD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBZw9Z5e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHiC42494564
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLi8blPUA3oM3r6i2Xmgi+ePGDxpZMvutkakyZOMW50=; b=fjNEJviDsRP42Gh+
	4mXDbeITNNfc5JvCI6AljHT5ImewYrRfEtoY1VgMWQ6uX2jeT0BN52uFxGb2+k8p
	uddakazgBHtX4bLAa3A0u/RgKQL7RSKOBO1VsKXnDmpVk0XEcuHrQ+2mCQKRFUbo
	6lDZU15+zyLrMMCQa6yEdR9gza2cUTVhz2pNksVJ+ghQf0Ec+YPQRUloBmkSXOS9
	yKJCiZqzAUlaNW1XfGohvTUTA034hBwqS5L/X6gxFfBWlM5vy2O3eluAiRKjdCrj
	BatQZPJhCkDOvJ/S7gDbqBHIUwzIe6puRlab4YjOzxYhvB23srLlgick/Cd8UBqW
	xkIScg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wg2f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1d32a128so4293571a12.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646112; x=1773250912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLi8blPUA3oM3r6i2Xmgi+ePGDxpZMvutkakyZOMW50=;
        b=YBZw9Z5enKFmJLXJi88RQmwkcfe5B9Mr6g/Am1O9Kx8Uc86E6gHkwXVWVhmHfcKQg6
         nRuoGbcKf54VqgK9uyuY2aJu0aJr1sb34iwBw6m7RsH5r7+WA3zGWkcr43wZftrzMYIx
         vYYKpV9kmBQff7S+hAX1ylySZul/UUB7p7/l8EG1OyTHBTrBI13qJ0vQLptMPK/x3IpO
         /h/Llm9/EKNF74UU/Psq8B274i3IdpwCk8IliSj1eKg74T0Y62QZO5JlyT8mi/r05l91
         kxRLJjhv4OBVHRgFH3mN5De7qbVTlhKk9LbiEXwnaM74YDue/nW92EIlxq9y+52h6z6c
         LAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646112; x=1773250912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PLi8blPUA3oM3r6i2Xmgi+ePGDxpZMvutkakyZOMW50=;
        b=nK+NH4E9BUYGxAI1DLAOSBmnMccJSvgQo+cIuo2LcnaH2eq+LyEtYeffor7jlNhCBT
         88vvWBd7IgbX4BPyau9tIrFo1C0qFAuswBUkIgXQvGX+/YkNaRXZhpBHAidvawl9qWZA
         irMAAlVH5zTh0mjl7r3eOQz7KsqW2HsirmtBE+brdQY2X2Mdsww535gT7RkEAd9DRUEk
         Myt8nO5WXX8B02wvdNe9P3jMG73oCwcN8JxPtTHZQ0+KMmezBl0m0Kxqy+iPQklkdl+e
         sqy13HfdtrDt2j2y96/SUCHcyQZ3r9pa/F1eovkwjfTiYKhMSNso+xaxZ9ETsihP/VeK
         MyBg==
X-Forwarded-Encrypted: i=1; AJvYcCW9nqKYpaBkVKv7+KIpah6wyXbM9OjdwP+IzmBXkVx3RCcIGzrxPMga0hu+moq4jgboItmpA7BhX+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0BBL+pLEisCRv+abWDb6tNBa+DlzTEqzp9sS2DtM8VYLJcaH
	oiYQUCf5+ARwtbVJkk29cpiSMw+YwbPtmtlp6qEIP0qjmTktunmPEKlaB3BFA/uR5NRHUx0oB43
	X6eyy07rPzRZajs90W8f/uUHZY/n00Q1luggRz1QJoivSrpopjzYdO/tRpj5pZNc=
X-Gm-Gg: ATEYQzxIJxX4y1/zQB+QPcmi1gyEoXdqNYv+1hMLxHqPJevZESlyxI60FARQaO950+2
	4bsR4QthZVih0Ho7CGiBhCG0FwYg2ONosP3i/Yfmvs0lMLp3kqTn6u7jgVvHF71cTyq/blM6Sko
	T/EO49WcCAduM76e85gFWsXnr1LhfWJvW2itEmfuw9RudK99Ztgr0qCPwoAVIHxaH7qhofW9EIh
	HRzzRlwrVNcRRO8uDzO0ptG8PPoP8E3KRKLlDaM7wv7e/RSolmAs1My/DaeiSnmYiW3eXyxqMuR
	K+k4ZsHsjHEJuzzQ7DTqUj/PvxjbZ6ntIniXz2Tu97MfyhhWAYlgG/QWBFHKaroFi4GM6NbyVxU
	DpvTwQsXNmhKdnHalYqdQT0lyKDQoFBYRctbyU5utKLsvo3YP43UP
X-Received: by 2002:a05:6a20:9595:b0:38e:54b8:60a1 with SMTP id adf61e73a8af0-3982deaf562mr2751613637.4.1772646112329;
        Wed, 04 Mar 2026 09:41:52 -0800 (PST)
X-Received: by 2002:a05:6a20:9595:b0:38e:54b8:60a1 with SMTP id adf61e73a8af0-3982deaf562mr2751577637.4.1772646111880;
        Wed, 04 Mar 2026 09:41:51 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:51 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:57 +0530
Subject: [PATCH v2 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-7-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 0wVJgOocN7neTd8mSK5ut0HZ5RRvmfr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX/FjeUwLF0Gsn
 bfbkq6TH+0jZRtbXSiuTWNOTFdOc4BEtutUJFPlPPyrTNG+Pf4m80xGyMWEsUWNVsf6pV4CCCa3
 +p2So4qJOZUFS/MBAQ24/hbOPiv2kM7j+8+5pXm5vfdU5zZEn3qa0Hzv69GXnefYtM73ylCx4c/
 9rL7X8Ic1K+pIacfiSojwKGJQ/fx45mrCRBe/dg3aW5JKdwz04gQ87UDszoNvM9lYK8NcSryXX3
 rgnhD5uebz3F18Vfv2S4QPxstE+reRrjuLaAgQ+NR5ZcXJu9XgYsBEFN9+GNpzr7lNgFRsnOaSR
 s24kcE2/CAPIGg0ZfhNcpNb3cj5vDKtthnYqo7G/AA0lTeY+16Hi4St+3d055NGOV2m+niYBwRH
 32BMJ+UuhWmdXELNtd1W1PncYzgd30pe4m50HQC3/1R1BdcGcQj12z2cNkwQsqc3u2VNkYQI0Up
 y25706xYEwW07LPVBtw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a86ee1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 0wVJgOocN7neTd8mSK5ut0HZ5RRvmfr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d38352a3eda4a39c39a9549508b3b944..50cecf05027e6de754771b9ab5195216f908f859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,7 +1461,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1

