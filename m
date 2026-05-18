Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54D3F0766
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100508; cv=none; b=NTHUtVbgNTis9/MVpUcmpWZ9cVpzHVGlrZE97rh71k1AKFwDvuVoMFVKjT5Ump/emnQJuvDGgATSCPDsEb4xpmQFJCPQdZ5Z2k8a/bmvMPn1MsuMUsx0eu//AUx3KSPztzdUKc6U0BOcolmSBUgs+4S0TrqAQks6GMcxwCqt5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100508; c=relaxed/simple;
	bh=HruJCBfmYQnSIf7/uG0sMk4KwwbHKq9ZOPIx9Z6UMzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J84egZSxX/Ha0q00AmrkUrYC56g79mCttOBjNwJnRzROvonJmL67x2kXaiPf7jQV9Xp7VoZigu+0ccbGprgz4J3bVFfAqLxd4gy3ckczx6kR2fbzy9sT7ig1Q/x8eXbYxrCPu8fHaFNjNhtYoaJHDUAHoMR1i7A2m0pXvce5q6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYzMix8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsEFZ7qH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYzMix8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsEFZ7qH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7Z1xl1931006
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQwk0ZcYwIT2ZAX0lFVV7M5q8STCdl7o/BdUfUj4Vzo=; b=kYzMix8uJagLVQ8z
	Nir4lY13cctMG72q14AGINLrAcTylBuBsduqL/iKgh9Z7AvPd+5qLBDnTIq2gCMi
	wbdLzviUc9JZpEBLrbQYhzicHEa+/JqbY2R+rvyN3ZXivc9/ARHT26gyuWwljaNI
	idgaxcpYK98P/+k2qj//TiKpto3LitX6nvWzGWOLn/3mLOQLW6TWfthnEpF9+jCm
	qdlHdMIXH5CR5qjUU5SDI8QF8HCFyvaZsKXT5yEEOcL+5ZVq13qxoQq2mGeke646
	c/5MZnS77zQD8o3iFsPamJPt+57hlW0zofri3XAe6PswI15li43ckwJfbfis9PWL
	UIbl3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6x0sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:34:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516879bf1a7so37155351cf.1
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100485; x=1779705285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQwk0ZcYwIT2ZAX0lFVV7M5q8STCdl7o/BdUfUj4Vzo=;
        b=WsEFZ7qHW3QTJMh6RFSFBPkteuWqopZL4gyh1wNSzFM+y+LojNZjC3z9ad5LAFaY7K
         LObSgMPyLu44whVbS7FHVWg6IUToPM6+Vj7ukxNn/Va855XcCFViwH3Aa6aJkMv9+3Ac
         NcHBklffz6xU/qroN53Q4RqE8mfrSemqz0y3c9hefFtNI7f7xHhbDgBFdrx6hTKzqf3Z
         HQM/yFvTEOi1AbrTSTilp8Re4qRth+5Ksr4hkcxSm7chJi507JjMic9f8YcTgqDB0KbW
         59uO+r6tgr2V132FC0iJZLFIokrq7UuHnqhSzTYBcXQmF2AoLXqDJadP6uhjtp8sDnV5
         mk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100485; x=1779705285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQwk0ZcYwIT2ZAX0lFVV7M5q8STCdl7o/BdUfUj4Vzo=;
        b=UYmEm7Iw0qeGZd/WairDNd9RnOSYOT2TVJXQAsBxCKckFpgMEFBfYizI9nWE3N2MFR
         I1AdpYO3F+l0jHbjzxdNpjD2+IuYfoDH2aUsa1bDndGC0Ew1ycciL53X+eyD00W3WM1P
         y4nMuMcxCj7xnl4l36V9pcAISF8gISnsSBZzBHFNU05u1AB5PHe0Ke+eBIHkDSzAADiQ
         QLluBD9sLGyQPy1VM5AjJoJcZatmdQOV04ppYNtZeqTiZ0/zEa8tY5kpQGyysLvb3qEi
         hbOY9PYr3UE8Z64v4VnFStBZqU2aaUfX1OjA5CnMM9SBnTes0bOeYb09xs6DJsZlwmvi
         uwDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cwiLinCSkp+h1E7b1V3LxC+jgeMzxvPTDw3jBRQAyDozAKSyXoNb8SbXYnU1p85a5lkFOBngre2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQM2jr6yepVNLX0243o8uMVoLyiX6oxDKyGBLnXyxnrXeNp84A
	pd0ruXzb3h3NYW+UwtAhhumfcK3RHrd4fEWCnjtnW3NTYIrWqorEf1ea91lze7Dnh27yDps7DIY
	69uDmmZ3Dn2UkpbiaJZVU/j2hn+tkkSTGXY+makE1XGgExzB+a/XkGofRfNtFzYY=
X-Gm-Gg: Acq92OE4H5X/Mu8BruzBJAbzGro4l3ht8KPZMy8ldYauGjyddmYynZwIzmQEeuyl0St
	j4pEcrLi8WXeuoucYy/3Z+8n6WvkJCiAljX0pt4vn8n8VQosC/+eC4fFlYhiAUWibcyVFvpR93F
	TN+WT63ebjvcluaUU7FSRX3WcwRciiMAgEYU1ENC8jYImhKWG1Jg+IPLKc5T53Vi49/dZQjo4LQ
	nqApyrgYX4Zbwac0Zg5LSLHSZHZm9f9lhNruff3/9pk7XEf8iecIvM2sPkG6N7atNxZ+IFPNDaw
	nyVbK0NfndRjRy3wmPf3JA7MGIZfd1a/9Zoc0Wy4YxPCrG8wmDUZEAcwCFiLbZnQ8NNUkUJAQT9
	yUVxJl3y5JDt5vdqwU7aeMORPaA1cpoIBfZMsJMqXJMv/icL1jQ==
X-Received: by 2002:a05:622a:d06:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-5164186ce39mr189401581cf.24.1779100485497;
        Mon, 18 May 2026 03:34:45 -0700 (PDT)
X-Received: by 2002:a05:622a:d06:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-5164186ce39mr189401241cf.24.1779100485099;
        Mon, 18 May 2026 03:34:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:34:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: add the definition for
 the USB2 PHY reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-nord-clk-usb2-phy-v2-1-17a86cb307c3@oss.qualcomm.com>
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HruJCBfmYQnSIf7/uG0sMk4KwwbHKq9ZOPIx9Z6UMzU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCus/55rpVeV6o37pq3pi1Z+279auIAgvMmoNu
 /3XiIEfw+SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrPwAKCRAFnS7L/zaE
 w1CSD/0TVTTBuhGfc8Y9Rz0xmWiJNRMZSpFbc4nNe+tA/g1KYji0JXibnUWZ6LTO+Yxh+GVn1yA
 omNyU2SqhfmdORpPTnQVUl5rCEulcNgv7YBCwkwjTfCV52bqkG8Vcoi7XyRQ0ti+iKOJajEtBGG
 cOL9ql+dhF1tMn0xhd/E5Hs6x9TuhDnDpUDpd+u2FOEz+deZoBo8fYbLPdpdRzDde1VGhLfFxrd
 QY6O4KHWKZ8FbVVAOxNZFdOPf5PxHOCON+Ig2FiU1enTu4JJ9kCo7jNMKgduJqQJXccla7o69wp
 GCrT6la15fHOcx11KKxbsH0mb5JPPI6xb58aCG8jkuYhGjpZQV8U+DlrRkpMWsnuM1htYoZ9oW5
 lhaVobP7uwIavARvTHbIpsBrP6aDIQRIPUGxhOUyzdqU1ybOwoyx9h6A46AdLUkpMsEMCw3F9Xo
 w4DbICBydSNczF0vgS7c/sW4oP70SQB7hpHgtuN870D2uV2y6G1axNGb2Pr/GfrDHd/g4Kohr8P
 qxKbYaU1yUH2jPCeoZYXMmbYu1mHoOqaMq8hFM+37OD5ae/OjkoWnwX/3dVckP2w3VXhkJbkG6l
 voGN1akXMWPgjUH1rEW/PlDKIq+rzAkpf8dT8P55YXEnyzckqd233Jqz5N/8Q9Ohk/LEfQsedLk
 oEJRJZdPeHqu+Mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 91yK-oYGrRoMeEbLoBb-9dYfGe7O46C5
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0aeb46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yy8D4xeqwGRH-rPZM9sA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 91yK-oYGrRoMeEbLoBb-9dYfGe7O46C5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX2oG54XhFEd3J
 lpd3yx5fctxtNk8uAjXqbL/UUNwYJHNWGBSsF6ruKAtrsA4CnnEHgReFE9bTggYMsLo8Aqu/eOL
 POL+dfEIRzpXGJzix/ZkHGju5Eik2mLjjnOtEwx/PjN3MmB41tMWvqMQvBJaPv5oxYbdg0m0CtV
 gE5NZTYGi8+FsJ5aRym8yakzgKyY1xxWhL1N4MH5Cqsdbn56Kc4bcxHxORRMy2hrsNx6UA3eBKc
 jZyAFBhOtKMXEuIOSMpa2SMBd1Faak9OGSvbWJF/PIB11a9IodsjndfMQlyzXDe/U5TaywYLvMq
 no9toH61L3iRSyHSGA9gwmXPNhZGEP8ZAZZ3Gbp5lQOMUWcw6B9sDzkhikFawHaBjXRaSUv/IeZ
 gmzgQPaQpCaGDFfAiepTnq5KPxgfo1Pna3nYHhlI6uTVNkXucK+n/ZgrC0KQzLlawjyuj/ze1W5
 zNrAv8OP+vyOsLP422A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101

Provide the USB2 PHY reset definition in dt-bindings for the Nord negcc
module in order to enable adding the USB nodes in DTS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index 95f333d8e1aa7cf1e386b6926380b2c853f7cf43..a7024317e90b136841feb48486a04eb03965109c 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -120,5 +120,6 @@
 #define NE_GCC_USB3_PHY_SEC_BCR					10
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
+#define NE_GCC_QUSB2PHY_PRIM_BCR				13
 
 #endif

-- 
2.47.3

