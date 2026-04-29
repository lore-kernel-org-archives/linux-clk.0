Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425FC276028
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472167; cv=none; b=m+G5l/oVSMj1o6lEvEvn0d65W3IFDxgNnvgj0Xxlghy6al7/HI/c2rfIuvYkHtf3BqYHZCmJXD13Os2iKeoDSJFhhXJY1wf2gOn8SlBCVdP8I8crS1T6ihcmT06xhOxYaADvY2nkY8NC8HWPODSN14EQQr4/MjMjOITGiBswl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472167; c=relaxed/simple;
	bh=p1psAY240TWjrNT/9/A2dEWv0oKUcybspgY7ZKfLuuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxi5WXT0RSyEBe1/uCsu328mRrRXEY/CDfXuQOmn0yWpLjlGynn4Kgt+AFG/uNRtdmJN7BLo5UTXdtBBqObr058uEIyxCmG5jlCJ2/kLYYZ4juFLL+2AMN6h9o1+pAXPfjCKw49BZpJmvroc0c73tXUR4zusH4wfniTm9dEeT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLmtZVB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZivmOOOS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLmtZVB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZivmOOOS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qF2N1642726
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=; b=lLmtZVB+ljGYLIap
	DzB9ITB3OjLrgvcLtIZ2KJF8hMFWYGod1IzWcVKu6JmZHXouJBcNCNfqYtL6r8vN
	OlEgvocC7HV8nwTctrOFuwk0Q3JKfcKnetMvIO6nrM+u7QGT8eDgooBM+OyC56mO
	JBDcXDXChsxCp7utqjXhHCli9VUCUHEGsAKr3g68MnUFxMG5TJmZg3AKiPLJGajd
	3DaPm6pd3+i/JDb7HWhSxcVXGmuW0rF61uqnxT7vXJpz2dKNWxVYbQXaIkMwD8k7
	MSpRxot9k4IouIUeR9NyM6N5bi153EtNwiG07juGc8mfCZxGnhkFiqMMW9sB9IKa
	YPT8CA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81vp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:16:05 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64956932a51so17680394d50.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472165; x=1778076965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=;
        b=ZivmOOOSvFGIqvMXa88L6CPsebBjKmZ8Be323Z/RXayiuQIIGH0DaYqsATcZq6tYIp
         Dq4k3BpILOeJSqdt4s+dY3fLrWzC49WvhGoQvRM7oDlaqbzR2DSjyhMS4XlKI4ZAByUd
         uWQNW+c20KiyWt/Kd6OFj4UZ2D926fgNsVzBe7QW4uwKJOx0mT5dXJkaocZu4ll2PIxx
         WVnmVs9kKI6v3axE9TnpcoaJzS18rLUjz4Ig2Ki6WW3+zw/PzZrwRaLHHvGshFGwmIWg
         ZNr92PFWKOzOIvFO2fGuDZdbFU4OGQ9xQC4+/FaLxLnwfXqJsGTWo0tm9FJ1ZGvtdRrR
         VuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472165; x=1778076965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=;
        b=Z+QN4vQkm/3RXxRpW6y0qQoO5PekN/4r3TAVXDsFMV8FwbftKHpmkRwH16S9AdFiOK
         21OJqXErYQ9v59uRJD7FJNkLFHzgeKcjXcup/hKPAy5i9rDBLF6UE7JEAx3ao9V2fm6f
         0NzBF5mCqmUi29b9iTsgtC+rlU92cY3UitxkDUsHplBebJqpzLJXwKjbE5b6A7q7vEWE
         8oX+0fAxDxPn1i+IVVl7Y1weIfDQlUNHl61/WtocLKqkI8357xDn2zRz5KenlR7twLdt
         nSPh2uS+sNAv+0gM1kJhR1Ft3DFrMa/Q9Hz4WeE3anNK2oa1YDcV12VY5gqd5EZ5YbwV
         1kgA==
X-Forwarded-Encrypted: i=1; AFNElJ9V66GdpPdpMCEELo+v4ZGnnKxD/EYCilRc1M4vPiWUORuUKRpaexgtJbRF22iHYfmdbN4hQWsTczI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo40pXHjTKek4vu62efFQ+OEn5A2urmrIbqh5pyvrV82dfe4cx
	LS9mOGxKf6aQYfIokS/3j/REhLn79BRLuFSV7pzs9BTpngo8hrwG29QokHYM2v5VBacr2QDe9l3
	Y2MkBP5DLnW7MCpP1tbD//kP+NL5NNI1QIE8C1P/n3gjfK32O21ayvmza6gFR+jnQvMfJO+U=
X-Gm-Gg: AeBDieuJIwCBdcPidGLkBaNBL4XhkAF4ZqVs82Qskm9racQpv90vboZcHxDcIane0BI
	VEwGaOH7CUSbMejM0qz/NsWMhvjNP8XrHAGJcFJ/uybmZgSfnmgR+1BekFDEZoGh7Eo/jCklVxs
	KQByTc2b/OKmdAgvJeHb1/ryT0hsWIX8Fw+b/HgC5mEIktSw+nYG/UXCob7wyBk7+KdN3V33FCG
	tex66mkiOqCpJFi+X6quzWIPNm85B+P8+jU3dokaJiTJ3/8oiPFrqcVUPbzebI8TlJ6zpZ6wSAI
	37Q5eIPKXNSbdfIytzE3k+Jcinl1PCwmdlbn6p7ZzMrdkj+zLsxMucdJdEgEW691gjZPrzjWvro
	OD2WlKKWB1AMOQaEVGkvhdydkPupHh4h30SVr4mvSYer6pHFMgF1Svci7+joxkvs=
X-Received: by 2002:a05:690e:438b:b0:651:c6e0:6bdb with SMTP id 956f58d0204a3-65bfb5f9cddmr3360828d50.18.1777472164408;
        Wed, 29 Apr 2026 07:16:04 -0700 (PDT)
X-Received: by 2002:a05:690e:438b:b0:651:c6e0:6bdb with SMTP id 956f58d0204a3-65bfb5f9cddmr3360759d50.18.1777472163749;
        Wed, 29 Apr 2026 07:16:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:16:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:59 +0530
Subject: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: jIyua5Edp4c_gpvWmVxVSTWYwZl9posr
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f212a5 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2tOI7iOMnFxh-ToW9usA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: jIyua5Edp4c_gpvWmVxVSTWYwZl9posr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX6Lw8dieVsCAW
 x0QnjYQiK+ypZV6UuZLUTuce/68bfGrIBm/gjKrxRrUrkYUrnaJ72ql3hZKx5XJRKlsTTf5HVz3
 poSNHCOynoUzUJfyM+m+9rjTIlTAadcEK3x0kmdUa4HkDT2Z6iNsUSLX2/O5LzZ0qVvIV+P62XE
 9rHuEZaJKoMAgk922SOBV4qeEe6U0sPRiMeV0BW4biCJmw2R6PI/JUevQW/1xyYgXX4QTwVyYs1
 A4DwK3XeEiKzrPBmLmL7Kis251JvUNm07MxYD39gaKbU1BsHtreNG7TbJkt3FP7y2Qc4PJ2s9ad
 hNwfi9O5d/wb5Vv6+ddMeIWuMXOMIrv0POCy5d0WwGZslPfcBTJsIy20yz3KdUDclTMwKdg5sjw
 nKrR/hVCKv4uzCmMWHMR8Y3f0ZmxzAn4HBQQwL0IKVCyc3z6q2qHhtH/D2Pt+tEUSaaZISIIZc/
 7xRyePpUBc+M44NwU4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290145

Enable camera clock controller driver for camera functionality on
Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

