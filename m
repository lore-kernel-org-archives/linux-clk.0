Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725537F72A
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110597; cv=none; b=jDBi6y9AZgJJ8wTrRwqeFDAZpQfJ76BuQkoA2Y2PuIIvUp4k0K3yZtVWFyMIBxcHs5LM0kGR5/JbkdoFY7nI1lL83uoQrx/zWgqpOhvRoS61l877VA+whwtZYbV7A43AiAH+6f2iwecVIF5a5FjJhYNtBOXZGWa3qUCfWsObvOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110597; c=relaxed/simple;
	bh=R64Ez9vA3597UhDxqN97/swYHqLmJxydRguMqhBH2gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bN4FKretI5Sli7NkxTFJJu7k/h5LNrmnddGGvrnNtGup45Y/THxJ8W9MFzEM9iGLwA+ywGw3aNV/uVRkrYmcHY5BhRVzAG+Oe4gXj/B5QojiF8z7ieQQY6bpz30RjZ1ZBQlcxVhfDtGt+CoV6mU/oV9XMLOK/AabQHtMsJ5olbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEYDbtSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERrKJG/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEYDbtSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERrKJG/V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4J6s3044195
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 06:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtKBguUI5hjCUI26jN+AsfCrHHhyzQLyh5wfQp4gvJk=; b=MEYDbtSGilz9wMoT
	Zcphn6ThY1sDZliWaqMgsmU8iqS8TFLXw9wCyvr3psIIo+CfM6glJqQOA+8qklD0
	TFDkA4U8KuX2RWjTup8LXizyMTeJz1hqpiNDyFTwCtpz+bKs2wlLEyCv4o8HzNyT
	mFn8T46lk4slWHX/a5WlmqMDf0xEe0FUHGpmOSQ4CkK3TTTmh0+tppWgyM8XyDmv
	o8Fx2JZ1LzD2g/hJVLZewIWCPbxfA9jSfzU7Wfj5sN+bYja4xTF3c+wOzId2t0M5
	6ulrhCKEZ3VIT2a4OpfylH1Qxn1wZ8y5Xk6EKOHQQLLMXsfrFck3pUfUUVwqJvnY
	ulCQtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483u9qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:16:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249975139so13491105ad.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110594; x=1775715394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtKBguUI5hjCUI26jN+AsfCrHHhyzQLyh5wfQp4gvJk=;
        b=ERrKJG/Vjz6p+u8fdq7j/vPwR2gapvd6FVJOI7vbITQQ6NwHw43EFyXjzN0GI46/05
         FaQPtoYIB1n+vzPYREZBRwuQN6l8iBvxj8ScFnDjeTR/T6qQ7VU11scIO9tbmRCh2dpP
         463j+CnBSGiCHDiHAIx1nu/CwdJzgEyDAdsfcQgGu6YYJgbe8364j94dVFJv8wsjucRN
         QbWmtJEEyHtrDV1xasCI4zUFNbV1hSpEZXSOUSRH+xj8o89gp/AKCMe6vutG00ZeBYT0
         9FjF7SkIF/PFT9MMSMxeH7T4dswTfehuqJT70MVunDfvNIhD/Dr1GzJIBstcB08eB7y4
         jDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110594; x=1775715394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtKBguUI5hjCUI26jN+AsfCrHHhyzQLyh5wfQp4gvJk=;
        b=fPgXracbcHncrvECqkNjl9JP/bYn6Ttu9Gl1iqEkwGEbctYqzb/nbaRoecuqujm0uR
         Gh+HnXXnpjyxmeOP9GA0VA2Vkn1Ia25x6KWCw17ftgBDK/QcZahyhOaZy31pHYXi6aKw
         7oDJB4x7SEL35ZSRW1RvLwRuVYOOtRaGC8Dlu3ZmYBDsgRLvqBNXilYj7WAKv73XDzsK
         y3hEY82qKYUDTfWmasd6nzXQJA5ehw688w8FFhrTfPSwanRR2F04qkFNhwxwml5Cj8y3
         /MhEecTKe0elDeFjm9QzBYFcMmbRDUxNEDuzfwS2PDz+pYGMLI/OFM8X6lfdBla4z/WM
         Gf0w==
X-Forwarded-Encrypted: i=1; AJvYcCUgFPxWpLriIolJCJYt0UUF952Lsjfg91O0/WGYjhavHH6HqhqkLke37KZ69wNRHq0GeNZgSHdgeTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXkuxiNl17i+lkt6tcNV5d8m0HpdQMqHKAcsjQ7ZCpDMMk/9B
	mPgFmdJhCD8ixnwFw3OEfA/IYHppKBY/LFUAwXh/abZrMmCm0fpoE7THuSwdpbH3z/HUecEAFFd
	Uupqzi04IYWoMPtKbQtPU4CdxNCHjlD3EZseqd31gop6hOPYxqGGU7hW/1cva2Z0=
X-Gm-Gg: AeBDieuQV7lo+0SC9iuTpiMKBXZuCSL0m+uuoN3M6hwpio5JulgGrdMEZa7SGFsUALX
	RoGAZXtSc7x27wpfq8U/ea4f3kpagG84baGJ9lpbYT6/TmIvXLTEXt4rX0KtOYD7CLhJSS9Cjhs
	yWM5sZLX226BSveKhouCUw3lrCKzDFrQTk7i/Ii/m2TNl+jmpWW+S5QacYGrRfsYjmixi+WPRGz
	SyILZWk/3u6FgDdh3uSe01gcygg6nEiBQ7O+alYyvTBliPw8VUHwhWwYcDffLw+P2521N4BERyF
	9NYyeGt1abHyWdBKN93WbaYUkeOx0glVpkI7ayUjP/kafrJF3UAXR2UAar6C5ZOgu75c6FBJdIU
	ZiYfI8nMuJY1aFyLMlHb+QWAXCHwRCRM2kUsbGr44zUizPP4CqTsc
X-Received: by 2002:a17:903:1105:b0:2b2:5515:6629 with SMTP id d9443c01a7336-2b269d00094mr66342735ad.30.1775110593890;
        Wed, 01 Apr 2026 23:16:33 -0700 (PDT)
X-Received: by 2002:a17:903:1105:b0:2b2:5515:6629 with SMTP id d9443c01a7336-2b269d00094mr66342455ad.30.1775110593402;
        Wed, 01 Apr 2026 23:16:33 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:32 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 11:45:46 +0530
Subject: [PATCH 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-glymur_camcc-v1-4-e8da05a21da7@oss.qualcomm.com>
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce09c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2tOI7iOMnFxh-ToW9usA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX24Fund+xuFKs
 /pu+V8sdxMAE8WCaUSskIlo6QM4BdKU4VLucK0B73+J/e7StqzLY+u3HBR08Qj9Mk6Ke7Mdey/c
 xUhTQ29WizXEj3A6vx0IVTNgD5WouJ9rV7xB36OxVVStDVgu24eEZbj6izslKLS03PTRmN6P/BH
 5ICKcAYd5Md6TNfs1GY8HAdvqkidqr51MOJj44NA7vjsmOR8Gq3yld3XitwBlIUiPXJWkghA2UZ
 nop/r8HewpghZcaxsRY9QWvNkSwKrWJuomuMzEI/l4hoznptbqkjvwgsvfMH9U0x5HiE0A02j4+
 Ri0ehYo813O2VeDsrXY1M4TiFL1KxQfRp2ehO5BY/ui+E6d/vdVg6HxdG4fBJEJMUYw0x28SbN2
 vKSMCvB54NtcHMiIvo2rwrBHqTLhWZSlBbwukrSKzmhW4baYRZydNP3LkOUtD2uX2c57U46HsM2
 uDDbKEt9WceE9r/3/Zw==
X-Proofpoint-ORIG-GUID: vCyZz7SggcpCE_FA5107V6gSnTNdzwBz
X-Proofpoint-GUID: vCyZz7SggcpCE_FA5107V6gSnTNdzwBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053

Enable camera clock controller driver for camera functionality on
Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..f5aa905a6feb48e7d65dbf076f778bcea54aef02 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1478,6 +1478,7 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_GLYMUR_CAMCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1

