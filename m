Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F33CBE60
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921011; cv=none; b=DZUbEgAnL5CYlNKi30dzlohpa60iWMjFj3tvn4MHUbl22+ZwJg7SaTEz5NHrSUNvUhscrDRkueZXkyyiHDNhsqC5NPrTNP5V7IEcTnFbuqVF1EAHlz6kFpjz6UH/nWI+N7Qs7OqDaiqfGwfgNC31JNMH/Ugn0Z5m7y7I283fPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921011; c=relaxed/simple;
	bh=YuenEqIdRg8igoTxz+P4VVeydHagY4n477IqpuqeT34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAsqindy4ry49LmfbOlKL4+a/fOWWVISDpN4DVEWjNdaGIgRcgGqypESEtyb6mCvkl9Mkxez6FrvNPy1clPNCaeMB+xhvF+6kUAOxb1AOJ3I53sd7b50iX3NeGcXbE57SPWzvvIRRtlkIGTpBanRnsMMkMXAJSjDNDvRjQcqBoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+FZCmW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pfgt2PrW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+FZCmW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pfgt2PrW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J7429r1027199
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBqgvvTdnBvBQQ6eU6WnaZtEoLuofUqYLhKUpZdY8JY=; b=T+FZCmW8xtSqgyXq
	SzkSnf6Mfk/W1EZhjOVWNXIMZyweEajYdG524lhbY3saiMMxlG/SYiqkIQqiwZeS
	VTKEZ4egWtduwDdabpQZTuYZdt1fqkGQARehOLFT6rhVsCVlp8uh+Mc+pFbgk9rv
	1yd3c/O5zsaxu30xrkNix9IrNTh5PJosLvqvxm6iW/U7ZJ4pIcxaTmgKyErIhZqr
	XGaZ0S855yxH8D8I+y1iz448nmxGf7U/fuZZkRgo7S37QT9WhVZgvpZbq991JYc0
	93uLfgijOtD0bWsh4YisFlF8/8ryHEH/cAJm/f/mXZFSN4RQVDYrJzkArNT+Zofi
	vD8RrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032k4xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so121655021cf.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773921008; x=1774525808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBqgvvTdnBvBQQ6eU6WnaZtEoLuofUqYLhKUpZdY8JY=;
        b=Pfgt2PrWAVTx5MZJT1c+wYwqOOLAnY3LpLgIPJZ7928IHUIg7kd+KZ2VMPsCDhka8h
         NDYv17lZizX4EiuEFDllhxFfHkLx8LHjg+JWvPzNrlDrNRQK2vkpnKkxjVPO47uGhVE2
         hxBqIE1Y6Z8Pehg81RzzvPK7lw/M10kDBrYhZi5mg1lmyFTLFWu8P0x8UHb9wIqQ2+sU
         spEZr0Tkk5V/pE8JQBclCBYLQ4DJAnafgN7Ifmzoq8SmpRPU5bNJv6yQxAfinN9KX2la
         e+4jwmqZbHWNZLgOHWmJgXZNknclviaJKI1+y/WEUcXMUGI3jc/ehq4h4raO2v+uZFk0
         nYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921008; x=1774525808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MBqgvvTdnBvBQQ6eU6WnaZtEoLuofUqYLhKUpZdY8JY=;
        b=n/JjbUubFbKf8zudp723R2P5n2ajq0mmf389d7IfINpIYSngsfIa8BdOy0gdIPk/VM
         ZW536Qib2NCdP4zbKIi4VocCnDNNi9XaBTevFI7fFlm14ylxxpn4HZdCf0d+zH5NfZOi
         1JF0lYUsX9S0c3kMXwGgiJ5DL9mPtWnTNlP6L0211CyQiRSjiClAS/ZVbNWawsA5NZ9B
         aIkU9IoUyZ9mrbtiPTZZFhxwZwEXD9GqnOLowiPTWhRm1NwSBhyA50cN+hHLlcbEjgWi
         s2vBjXkYPjLNcIqSNqC3taxjluQXxmcnky2zcqPdMHWerZnnEnKmycSDayy215LQ+3ex
         Z1RA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6frsivREdJhmyDfPRb3IwulBRPjqyXG0AXgrzColuZLzkkdMYnVyuvCWZS+b+DbAS7mUSBJ9SHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YygITse1DOuWN01/QG0fzKthLC42oszU0Ju7Mrm7GkUfBDzE1Ek
	IzdEWD39+mpAV7nORa2DhqgcXqyoYFA6TXnWbcreXNAgp5NRQxKbEwHXYePMGAXbn6pLpc36EGf
	i7jfwOgEwoaDB0FTeEdffKvFP4r4C9FuaZh+hBdxXo4jk5jDnKP1jSTESzpG5VBuDLBJgj4M=
X-Gm-Gg: ATEYQzyb9b8XjXPFTOeaaeco+y1vJxlnLccXGhW+EgrmIfttZoJPfdKj5acwLEEL3F8
	TVxZErOUkq+nFqucRSQtGUOfVjF36Yh9NBlXusaKLDeevM/aCh58eu1asDwyAD8LnPcdf+1jZfN
	39Z1CFiNEl7zMqxmW6xs7be8bZMNDDETU2YiDvWxkFx3Hu7l4L/S7Bh/b4LmFFYAqAi2IWW9Uy9
	f886KK+9cD1U6jO5ByA2kWo5+v++VCXjZ0pDo1RCBb3lv1qkvqd6GTqnSLGy3Ah3VzH1AA7zXZv
	9akJIgUZJ/9eA5NIwMeBuds82o+aNcGKEVkKG5mZ/PM+UbWZqT4YUo5EJPsJzttruOzbgL/CyCo
	Des7Ee7UhxGpQzS0ZaDQ8LL1Lo2z2aqv0Xd6w7Zc4URvn
X-Received: by 2002:a05:622a:49:b0:509:481:536d with SMTP id d75a77b69052e-50b148b1f7bmr90699031cf.59.1773921007868;
        Thu, 19 Mar 2026 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:509:481:536d with SMTP id d75a77b69052e-50b148b1f7bmr90698721cf.59.1773921007438;
        Thu, 19 Mar 2026 04:50:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm66384605e9.2.2026.03.19.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:50:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:49:44 +0100
Subject: [PATCH v3 3/3] arm64: defconfig: Enable Qualcomm Eliza SoC display
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-clk-qcom-dispcc-eliza-v3-3-d1f2b19a6e6b@oss.qualcomm.com>
References: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
In-Reply-To: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YuenEqIdRg8igoTxz+P4VVeydHagY4n477IqpuqeT34=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu+LmjS8ixVUDjwLmPbYJQRb+GL1jKOch+YOR/
 7Z8oFgUnxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvi5gAKCRDBN2bmhouD
 1w/kD/oCHpu5+NgTvvRral4MGc5nyM/szpV5EKFjJccNgcirDdemS2AA6tfrxnmBpefKdlp8HRf
 e3Ff+6S91s4PEcfMJ0UzFoF8lotUFTxM3qLpPcSwSwolwVdZBqRNtH2uOQyGR0TvUG5O9eMmfLZ
 xV36QrF7WVP2UMqYRrP4Cngw5bFYXsvAWHDA7hzIuY7ckxnWMN6Eyz1ez9Am/MYLUMZYQQfy1ST
 4yxcQVeVxQL3Om+nuKS/Pe7IDc0l19FMuJqvDFvGfcdtg85u9zD4LTiV4A0gmX7xdALP7NMdu5T
 nb1yhD8+1NsIN+rUWkN9xB16QWNbG+VV11wbBSbraG+0n9brvkTd3sj/dDsdwq/taHjLlKFnI+4
 9aylRr/3vt6vX8AFqcq2gzWCYR8Q63Uo+Eu7Ri07JASPf8NaPAPapiLYmAKzCMcITXTfLxiywS1
 kwbIHAStUzXD4NJAY24ONOzm/3UBOjwdsR26n+g0FrLXRMeL+9z9VYv2rVZV+ZOm6fJ03QSnrjl
 r3g75JaLHyIZ7reXnxWSkpBljc+oSrrDDOjUCUr0AZlM/vjEkar+w2e21M1DC6VXU8woUCids0h
 uqF+MeXY6WIMdNlPZi5c4Y3Vh6vdB/pc8rbWr0Sa7zhQxTMuRBykK0vWUwUjTh+QGS9EcSJDbTQ
 5yEnO33XPWPtPNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: HmCXkFZBe2KKguZs6b81N0NsCPZ-9S6h
X-Proofpoint-GUID: HmCXkFZBe2KKguZs6b81N0NsCPZ-9S6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NSBTYWx0ZWRfXyIfWiX9uakNC
 FldGOt4gkVlmUEWVo14g4TzWoqZLp6LkvM5VQNsmIfWAE2zDOoHUC2ptFlFX4vRl9rIBZtXmN7K
 639bkrgNoIRgRPQiE+Dytwvxp6SJXLlRDs6xVCPN3Q4zZ4CQwjgBGLbgGK6OqII9XmtrMe3Uo5E
 gWRnEcUS9x/dEYDv0ZbC5BSCuLt9vTPSliiH87oscJJ6DHixwfuweCAeCyz+eOXFls/QhNXh6Dm
 KNbOiWAW8M6p5ONVfMrOMz7AzZ2X1eao7AacVs4XM9tr6j4v3EQCfNmRR5W4AoXeSxLgYIhNm3k
 WiBSmn9dJSJDc6ZOYCwwuUG9D5CHAlVytpHFP8Nfe9c8YmZX/esRfYT7+OafQAF4P+DeEuPWOGl
 iXNbrbH2qm/RvljKFuIdsT7Pzmal1tbzh6OOrs/PoxLikjk3QnetZmc2qT6UHE85KFdwC2qgbNy
 wiuYJsBKO2AVy82fPQw==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bbe2f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2kCACx5iOotzJP14eBQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190095

Enable the driver for Qualcomm Eliza SoC display clock controller, used
for example on Qualcomm Eliza MTP board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Eliza MTP is being upstreamed:
https://lore.kernel.org/all/20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9..d8938863b84a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.51.0

