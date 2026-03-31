Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8A236EA9B
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934721; cv=none; b=ACW3RRSVd0P+GY9vpiBae0Elge7j98/8IH12LEy0aWdcBHx1890HwpHSCAJ54eFLWkq9w7md+Mb05+bA7nS20ywjqliTO8fcApwqZ04cCwf1n4Mdtli1gs5zfB+ox6vuFfs1eGwz1iLX+v8m7m7iozQDVx9EDWzTLt9Ijkv1oZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934721; c=relaxed/simple;
	bh=UhvS06E/0zxHH+6YzYwm2XqZemBnbJ44byW3vy0sff8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPyJnRjHbuYbnMmHkBwS1138seLnekEBkTtnFB766SXA2ipc3uwTRB9N38PSrSmQ9DMJrLcGhxj9G+Fr8YBe9GJnW2zvSLVQwFFonJSEsCEIkH9O/WcpeP4XZVYOMsab5UeH/3GLzEj4ZVkhpcCVx3dLohY5sOEOaU0DS5Wxqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+VWp3JT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqpkL5Gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+VWp3JT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqpkL5Gr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMN2Mx2391218
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=; b=Q+VWp3JTr0c06NSe
	iRDfWlfkUVRLurwuVNrDbXxa+BD7xrs/Lwy2qSwgaqwrJIiCiOFmrhPsAM0CgyZ0
	BG75IW+xgO9DQYc/bQ1g9B3d0lRDSTmuHJ3DslFS43vWWkrACebsQUIhQcpQ8Vdp
	O2wuZQwMUSglE4w8DF0a+VUwTSnTZ1OK2h6gt48N7/vXSkRy3+mU8Q6B672WH193
	pvhx5L+q74uwtE/bLfCUg002nFwxllUCIuv8akkOqhU8DBOoUApVhVjlsxMCjcwt
	9u//A4wtOi8dGJKGIMqaFxMM76iwgSvlltfZvU1B/C773PHGNZQa7X+2u+24olVK
	48oOow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7jsek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:25:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b7ed8964so4890750b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 22:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934719; x=1775539519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=SqpkL5GrnOHkTbuxiaAJ0QHkhAuiuWyEkw/tizrvGBcxX1JUOMPwp41kbU/9UVBH3M
         UC5qlSlbOSdC3aNJ+QdACLCTUVCb0dWnhsHOofuCdpBP6SG91OyRIzLlubuSAY8aAi1x
         hSErdjtEo7RGmPe0izsoB3Y9h7/9Qdsg8QIbFRbKiewmxCFz6NpsCQJoN0ju8wXqFu49
         NLD0P9KEwtyz5mK93loqXDnbhdnxOGkRG2CcSelYcyJOWbNw5aXBvNRjH/73Y9X/AeY3
         JRBGk+sQNxSF6jX4dNaxtOcGWWyNIId/yMHiEPMDkKBYZ2mPzQehZyjBiDqEvbbFTY/q
         M49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934719; x=1775539519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=a1hw4F83vPqXDkEvphZwFVPnoeRvXHaI9LV0m48c1D3KVGmXlEj7wijYFPPb2Dq2zk
         7R6oMbC4roRqWci8mul+PL9Kaj4nXl0dWsDcy+Q/fsqHAUIgKBZ2a7AsI27djSpIJdG8
         UNKQy2I0MPeZPNw43ZJWCMcKYFGTIKU2QpsXLUwwIg7ThNMFLGr0ZrciAhuu6gY4v4a6
         nSoJ34A0jgh0gGVLr463wlZe3T0bnN8Bn1RjFq8UwA/5xFFcRNtPlZGk7by0Wbn+UH4j
         flJm0Z0hM0H8Nsy/7tuBtj+sayqyIrx5FI6TZJ179Tmiune/eWDD/aPya4DfS0my//wX
         Ta1A==
X-Forwarded-Encrypted: i=1; AJvYcCU7MefyPCRwggkqFo34PpAHxM48krQdi1mpPcZAYb17BLPix7H0y8qcxz3n6tOz6m1VgM+uqIOeMac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEH2wAfKNzPnWsdLP9qQtWEpOfkKBIIIs6eu5jBdON4g1TQuA
	UwYZILdOExKNdSNE4pXHJRpLRv2YlRsrppXrLjx5Beq7lC64tg+v2bfwF9TTM9eTAN2KpDp+JoM
	0gW+1IFsFj++48PDjp9VcdnjYsbHx9m3M+CIDcTut7cv8CxhJOnUparq23+Iclkg=
X-Gm-Gg: ATEYQzyInqZYXaLWKhNT8e7f9yapHATbfZXeXdPlNdsqoDzXwAEDKHkxApKoP7WuURq
	sf8RHdvIzthMYEIaA54+FZM8CZ3ars+AVawKDW6SPfNqZbfPixh2qfbjWpQy7vXJBmogv7VBncR
	/7zBE/YzXP6QaMWRPtzndceaO+9txJi2gphUbwynGIOz3xUXEZE2b7k2eqAR/ZlkQfTnkQmMRQW
	PpswdKFrFDzn4UTuIivzv85T4YzA/fQu1I1rGj7v1SekHeZDs2jAlMgK/JTNjMTdvQSco6KLAok
	gl+tGtNrf9Crb0hW3xo1Df110SNt9GwPvzQWtcxSK5Cc+TSOWfyj1BUjQUXSzgZ561svMbWBOl1
	SrjtZJGn9mOel6TFC7PWULybmceskVpOI4MD3qJSrhLrh1zEp3YGP
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82c9605d1e6mr13802083b3a.36.1774934717237;
        Mon, 30 Mar 2026 22:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82c9605d1e6mr13802035b3a.36.1774934716737;
        Mon, 30 Mar 2026 22:25:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:25:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:16 +0530
Subject: [PATCH v3 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-7-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OSBTYWx0ZWRfX8F8t+dmVHbOr
 SHI5Pt0TlM3VJkHq4Bb+x/n4H1oC2uirfK1dSFCauKE2sO2WQqAycxbA+VkwnZi6yb3ItVVedmL
 PqSxJZam20/zr4DNCsatmfdNLgFR6O4QO9XVbx7114PLRDjTCIedHSwGdlF5lyquy7mGSYO7NrB
 fegNTo5kRgfuVRdIUK3F7v+uwPfsGJW4lDAIKhLsdfdlNu1gu4VCF3Pd8Ei9y5xw/7627aFLwFu
 m/sRfeIHA+TTSVjpWRyzcO64UJGhfprR5GydEmj1nYpVHI532W4cuZIAUaTNyT+i7CBZtbSYDQN
 QZ0ch5yGCcBLFzRT5w+qG7vjrvK9nctFm9YXoWLoNe8ghTpLd+4RvJob9wN/+3kLnAAVuBaFIs2
 UJwIIDuuFJ6dTA5mjMF6oxRCzC5r9jDgQ6ilhHYatjw9NqL9IdxXnkxHMAUuqC14JywOnt9IoyA
 BFfz7dUmkagproUQ8HA==
X-Proofpoint-GUID: Oiab_Mr-4Bnn3Xu11gk2AZqc1qBUo0Y9
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb5abf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Oiab_Mr-4Bnn3Xu11gk2AZqc1qBUo0Y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310049

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..44dc5da9805ef01b30c39ad2235f9d294515b360 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1492,7 +1492,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
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

