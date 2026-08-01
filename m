Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED7315D49
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593652; cv=none; b=craU4IGCdWqVHlnSY6EBXsHOeFvHX2unwHEAiQbzkZODVeYK/aUyVoqmGCSgWH/K+Yny/CDX46dLT/OixPLKfAvxtRG6YvzBjBbOfx2cXh3HCWH82wb75d9uzjCxVWUkgQfEac2qLdibX0gSsDB4OAYs1TFlLiZLlwZKbLw0XBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593652; c=relaxed/simple;
	bh=WhReouEPT0feU5MQmQInaoMDe0X4aQOAzAKso31UGbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVhZXe3bgb3eIu1GL+tEGRAEViLU1CNPiPK/dBvO2310I4/N4Piq1moRTZRxZMFBwCdg596A3lWxFTuHcs5HezdKNKjjrGaPKKHS7dvK4lf8F9vwajjgSpjI52KxS6ZHynnI6hT/P+S0WE/2HCO3Ic953b7zd4J5FBJ6TvTKgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLMPe8pT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU/SD9h1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLMPe8pT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU/SD9h1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CacMo3121940
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 14:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=; b=iLMPe8pTHSuqbZnL
	c6S9UdNkfc+oSCsmzBQmAvFvEj4QYDeXSnYgATx3NBTzyTr93eV40GCDTQD6t0Z1
	YLy+tCp0XLuB2F8rHCOtQ97DlKRKdzj+oCxfPNMOYvooaG7D05FQaf8tS5RVOceY
	Diz5ZvAcId/3b8tircduUr7aU/D15utrVCwBuYs9jhdK6r1TSH8I21Sxp2REAQwV
	PKomR0Vh2p5y77OckNl0r8lDCztGhgdOPMm6LRbn+yUW7DcTOVv3BCaHT1szhq+6
	4RfkH9LZG5VXT7KJ1QJDuZIHAijKfkFR8/E8SMbg/KOnu3+HpodhUpDr3SPHohOk
	IONE3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs91190u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 14:14:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccd1958e8fso27438005ad.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593649; x=1786198449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=;
        b=HU/SD9h1vvsWPQOD4vyXf4gpwlQLvfbFYpX+/LmK/7e+GmxHnrzbvKWL0YViaHuhHk
         V/OiLnugamAdHvs1yFogkdc+O4U+fxS5Tpc5PaF59gKKYIDx3saplVMi2WmhP4O3Mxe2
         /PtP3iXBAR9NsENK1mHFk6ctsZrfEhb3kfOYCtCEgHI1trjwg6Apw2z8PvqxnPqb5iRi
         ghzbxZK7sZcDQuz4cZJ74Iva8BTgDN1jBGNK8BfWyq2DAY+xbDWs+texUtOt11cGOjEc
         pLucT50718rT8Zi0X7Wg6sCEUKlKALhxnTOvKNuu7AkONE1m1P7zwh54cKMEkqpNN1nZ
         kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593649; x=1786198449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=;
        b=Lm8hTOqa6DLiULg8yuG/YllJCYgopVwlCnEQLdRN6zi9HyVpLNX0J3ATCia7U1gmp9
         I52qTAb+VGeMP58+o96WGGt5LcjfV5ZMfk2E4PAXV37bu27iZUon82FwI1ftpEM/Eck2
         9NtSy0um4xVE+vX1+jqbaE0n9TOTM8WmMhKw/gUPgD3bKFohxmOVBQ2/P4w7WqKfIHAG
         1jRlJ3lgRcKNVXvsTiggUEPsFMZF2G/bno9TMirsNL7q9Mtc4kVDjEQDV9hNaoMzWVgm
         O5tafPIRcau9ctBKLpDJYGv0Q0PhB5gE4tnm2zZOpa5PNnlWxQwTwHdnlc6eTmFOvUg3
         YcQw==
X-Forwarded-Encrypted: i=1; AHgh+Rroj9tYX/RPEYkBno4uYLuQ1h8ta3jJZ05iCZl9gYkCCvH1NxSNxinNIsiiBicqFtH3980tdDYaEa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9++4pjI/zKMOKkRXQcGr3QUnzhsMaeWwPosJBU8oSTM9ZVLz+
	FR+Hxa9Yn9CH88BGRC25j3Azjr9oDSRWaRESTh7lBDGn3JpG/NAcq8mU5RZeyfpI9J0tfEU5get
	TnH+W4p/1bAXF9mrKo8fFQgoqouMKmMhrTwlwwvDH842sWYpTpcJG8QK+FNIHkGE=
X-Gm-Gg: AR+sD10hEA+dDA/PxN2ekW5nk9ZmZqVA8N/n4YSKhJ3bnfV2pmvvU22ffqxyxw4L+Uy
	w4IClptSOq9W+Xh9y/M/HBVFFwVkmmVlrnQyYNOYcRu8vpr2w0XKlGsbl5iZVRLAKoXvsZ4J5Ql
	OLpENZXDOVFH34eTrIy8WVavfkH1kYOO/Gc75wQIGWjTR5KAAOT0ZNhl8YVoLuwnrHaOBB12O78
	YIylprwlmJPlhDz+w8j5yhUXc/J1pRnOJOaW53DCgTfwXQdLnVYD1ikzP608rCS3CB5OjyQAzFd
	hSknxRmOQZWZwR+RuQZJcGM0Vl0LYlvFccOH04TbJN0uKnuJQBiAS8/lenR8JCs8YUKhW8fhLe4
	KKkmU/ETy89eWqXBF7aCceaB2
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3c92a7e7e6fmr3392555637.22.1785593648681;
        Sat, 01 Aug 2026 07:14:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3c92a7e7e6fmr3392510637.22.1785593648265;
        Sat, 01 Aug 2026 07:14:08 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:52 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GCC video axi reset
 clocks for Nord
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX87sC9drFY3CM
 z9aAa2PszsW2dvwU5qz4pAC5xCUOEwoI70DjyRidBQLbtuUxYvm6e4gsxJczvLSu0CqLuaEJ78O
 WiGk9tieLcxEA5fxx0zQrCU/h+NgsLU=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6dff31 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wyNhwcPAjvrcrPB_k8gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uxCMu0dYfVBBDf1hL1KieGZ8kBImTSx8
X-Proofpoint-ORIG-GUID: uxCMu0dYfVBBDf1hL1KieGZ8kBImTSx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX9GSUugmAreY+
 2p/Y9dXpJc9j4AGxt4YFXwDFA8EYrSl8UaXBR5WvddNE4skHWoziXoZzWHLJYKbFXxwfFPHB3wl
 rwf7aoTfwro0gJ2J+XcLRJMpL5SzouDzi73Z10kvzQijexYm1AQGQNVZ2OH/V6ZJ2PbuXeopUTb
 udsVIoo1Ep3xy5ODbYJlsoIVYLgaqhbZBmfi/Ni6gO2Lz2jjbhDq9gNNvUb3MOz1mDuGyvWQ5+v
 2fx2kcDfVK5NIYm0krapZKYefTxv/hewoFW4ifZoqx225Q6DKFV/VhBksGZzDxc74y9oG1c1HcW
 hvVOUwRgvtd4NGkVkjhEOjDZhxOyafbXqLzUDgAJBA+d0YvtIYhonLeYDbMHC7bKbUKGmjQBCJ3
 HWVzMQwqKgPCe7z2alaeCNrYptvbpCALoAiU4Xav8Uylc0eTiAn+6P6x/1sPOM6ZYSJ3wCxBJMf
 ocj/d9znJgVfSQ9mGjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010114

The NW_GCC video axi reset clocks are required by the video SW driver
to assert and deassert the clock resets during their power down
sequence. Hence add these clock resets.

Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-nwgcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-nwgcc.h b/include/dt-bindings/clock/qcom,nord-nwgcc.h
index b6253dd2aa85a3152f99447a60a6f8a3e85d8f3c..8beaa129aa814c82470deee4382de5bdf8177892 100644
--- a/include/dt-bindings/clock/qcom,nord-nwgcc.h
+++ b/include/dt-bindings/clock/qcom,nord-nwgcc.h
@@ -65,5 +65,8 @@
 #define NW_GCC_GPU_2_BCR					6
 #define NW_GCC_GPU_BCR						7
 #define NW_GCC_VIDEO_BCR					8
+#define NW_GCC_VIDEO_AXI0_CLK_ARES				9
+#define NW_GCC_VIDEO_AXI0C_CLK_ARES				10
+#define NW_GCC_VIDEO_AXI1_CLK_ARES				11
 
 #endif

-- 
2.34.1

