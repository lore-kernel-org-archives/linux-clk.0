Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806886;
	b=c4DPI+RgN2N7ofXiVRLVqQ0AFNjfrGEVt4+LYbqZkwRPMVokrjc/RUpj1Y66UWGUeJBd
	 LNVT4D/r1ScymSE0IIBdx7V9027g0IkbzU+hAbK4RaTmUFdAQJL2054wC29OFWLf1/5wM
	 AroHeT3wmLBJNtqX33pqL8SQczuS8WvOn+GZkWBLVo8YRDKcZAUcBch0QFqPrVtB8+sPY
	 a6h55Cf6hPCJxxZZI5grJNUOl/kUKL59ZviwHaOUlTBr9oke0p7m1O9sQNhUQHQzd0oYB
	 imZCYEkB71gG7YDK04IFv4GW0nqneDkMCLG+zADc8uaRYgbD8HOfkiG0R9OqUH3beMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
	b=WDW2BJQrgDedM15MVtYk1evNdBGYZn0OcD3xWLIoegeAN2pF4cGOiBerDMDTiT4/sT/y
	 x/MFiA4UQU0OYdrLel/MvseYjR4wim08Q6BCqQLAtXM337TP1pjMkMEmK+dFQ69DrJktf
	 9MtroK8tX04lLl1/WE5pURUEBE4Zqz9XGHwOWM4KbmsjX9nkMnBVqk4SP+Dr97DGCO5ua
	 afo5atRC/oMm8qvoCBLlNScGG4pFT+seX0FsDlvi9TXfN+d7kBv9R/lnYj5V6+S2xsArr
	 P6DrrBGaAsv1JXP1+rD50MP8m7YvEJ+3ZHIEUlO8UE4bE0yPix2DrckTW38nRQEaxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9921A606A338
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9921A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M3ov3177620
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=; b=lgU9aBCvep5OTeVe
	CKIG9Qa2yYKfBBe6Ts1PyuGw14n77riQ7lCDrD1eYJ5fQwqLHrW2j86B6Y2xTAsV
	FvzmOe1GjOkj8EsaqGsz82cXrwudtRbeZCfIJT4W2JtJpx6FIE9jJ6/+kYClK7Lz
	Ka7Ded0TIOEqxgm/74+ZDAmtKTCz+tCiiRzMQiEsUgt3OnEav4mskhgaPZOXzC5g
	PGEzn/s0RupRidNHOeM5l/zHUCFUMR12rmNxclmsgDhbuq3zHl9SgiDYhUC0RQpW
	1sv7g1NghGArc21pNHK0kuviRsOVzBVltWLykeh9wKIfDh9ckV8EtB7OaWmGlFeL
	odKuMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmccubp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05900df7so8393925ad.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806884; x=1795411684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=hOdD+iUMZ272ZRQVb9MEKVS32yfNVni9+wSm7zO6duL2SH0AcsE4Pj+/NK4xmd8qj8
         6YYKetwAoZFc+Lzh7xB3/yc/uPJWjmzkkZTtJp5+yAXb4lfc3cx8NBC+4LY4RfwAxIr4
         qI3V5vZ5hkXdaZYRg/tktbY0PNTzUuoyV66liJd0k0mi31iYdHSZdgyU1Rqm0DnAlHjH
         ykYVKnWrnLKH9yQOZSpBSOHvf2DOqpOcOERYaTJELPYiw70m5mRYogHa1WD/1Fu4DzLY
         +Twsp5Y78hSJVxikMnqrSYABu7yYTsymvVcyIHoDqjCWn7uP7Awudjmxgxy4GKhnAaJK
         +5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806884; x=1795411684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=wLbpSFxjdnFuc5fxGmtESMc64uTXwNHUb3Xz2xezbfJKnwtNuCbs4brAASr49Nwx5c
         Ue19Ggxa2wZ1d0bzzTfxOdlAPLL0ZCOtHqgU+jQ/XXxXqOoMjRUic0RtMjFs1uucynii
         917de2uAHx1N4nquka94Nnab2e9lsfocIrlXZNMhpaLzA7UN5oLDQcI7GnhvIBezp7HT
         QZKgCqUadCoybxnTBJOcPXkadi0Qu3iM8lKmWc36mVVgzh88EF5KjDj89gZZlNSwpO1h
         LFgj5Xb8KZVkfXFNLFgGoY19iSHEKzsqeE9iWtYnGofSJoQiPG/cnx1s7jOmuVyo91r8
         NOJQ==
X-Forwarded-Encrypted: i=1; AL+hErE55uF9yPEaEHY+7to1YYgdMrwjfMMmEb3o7SyeADBL/uv09cHKXcRVtElkQRXHzfgUMfv4/fiVkOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bMovb/LqjaVpb6QXXQH4xyYD1vMPbpEf+603O712jyUGMUAVf
	cjOcOxcNQTLQxdpxuj2aln/CrmG8zsM5gM6hObfF5zKvkPh/3khVzhAiN+JobWP5I3lr3GUOEif
	sceFy/YJWYMV/CGXM55p8GABTkGQLUKNRGWFc7cibBIoCBbMYfh62afVJJUBXjd4=
X-Gm-Gg: AYBFou2Uv0coS45MYpofuKzLBXPSpf63SW3CmkObm36ZwykfvJV1bN0Kmsop0vencOZ
	MUZhPaa7G7WXzvXTscQRxsHga1OBkVk2DunBKuA5WMAewPUMLmVfdpIrr9igKhKoUBteys2UUL0
	Infvn2QfhD97HDa0ux7/8dqVix8pc/seiWOYTfSBWqsdt/l7vPnyapqygHmWSt1W4fglq6uXaV1
	knudVbkVdcgc9+uGcKsFyWOTYjv9IzvEr7xLsk51KRjRf8wnufQ3VTtJ7vAey8Xe8mX+9/fyn0N
	LTE+8TqDKaRcK8WonzzA4oY17JAH9Sc64Xdy/wPPv1eCX/Fwwzr61ENDVs56eSfguU6qVDA+Orx
	5hIh+rVnz7DkaYdcNrLEoUr1RQwMOn/LXf/ANDc/ImGOiJyUYQN8/GPR4d1lw6YHxkbpaupyTOg
	==
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068795ad.30.1794806883690;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068535ad.30.1794806883260;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:02 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add Shikra PWM XO512 source
 clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-1-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfXybzm/Vn9emAr
 Ei5UTR++73jpUsd5EOxJCA9RJ0Xl7LHnEzQe6bYo+gL8miWjZJ1tExOlULvEBwsdawxbVEq9153
 EFPdM7Z5XDRl4YMTeuM4r01NLubsr4c=
X-Proofpoint-ORIG-GUID: JSKPrLzzOlM6TjeUCzZxas8LBMMNiyT4
X-Proofpoint-GUID: JSKPrLzzOlM6TjeUCzZxas8LBMMNiyT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfXz7DJDt2qnOZ2
 KyD6AYbdXGfyl2TkIkW4wj9dU4aCMdAiyytZaM5wKtsAbbf5fiW2hRZki9yTfDDeYQvqEAXIL9/
 jcVqtc3zYJxaWEFSIqCt6nd3dkVPF/LkXgHvY4Iv4uTxfy/O3emCKNzkXtGn+aQ86e/47EzTZ4K
 VBGdtz23GOhcA0cynRjysCumKOdpJ/lb1Zyg8/2cFL9yXu8Iflk58l74dvDhkdngI52N9qvHz2D
 IU8wC5PfGWIU2Em/KZOxcNgf8jZMulWdE/zUAIxc0uZ0PJhoHtDyDFSw4Q3d1ANbUbxPUzjpY20
 72OcboiiKl3vUBFBs/d/wM7yU5w9lUE+ipMNo6NsLdWlyJ4XgoZuaRpn+p4JhS91nRQF57XQFdS
 xi/CgxtMOtQV24qfZobdBztMLV/Iru4WDOJ2oHIExXiubhpA8N9gjjmYxDvxJW+AZl758057vXP
 PaDDOvjFDvEzb8nwzgw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa9464 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4k7nqb-1yaoPLSLXa1YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Export the GCC PWM XO512 source clock ID so the Shikra PWM controller
can describe and configure its complete clock path.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index 656c959c7e1251ed9af8fd04285fe616dfe9ecdc..b86f122e7a9ba0d10c84aac954626eb9caaf0788 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -222,6 +222,7 @@
 #define GCC_VIDEO_VENUS_CLK_SRC					212
 #define GCC_VIDEO_VENUS_CTL_CLK					213
 #define GCC_VIDEO_XO_CLK					214
+#define GCC_PWM0_XO512_CLK_SRC					215
 
 /* GCC power domains */
 #define GCC_CAMSS_TOP_GDSC					0

-- 
2.34.1

