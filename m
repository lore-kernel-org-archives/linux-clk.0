Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6437D11B
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686552; cv=none; b=BezRO8fVkUljHNkLufw8bWORHExAK/B/wI9pQDWT63MD0Oq8bTZCcLhfJyv+doFvufv1bpVKcnFKJQ0RaWmrLaUfrKQCWgyeWKJhBfw4IavpkIjS4Oijfz1A8G9P00SPbmW0vkbtDAZWkrT+IoJoNgW5DGxhH0prZdQ7OZqZ1Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686552; c=relaxed/simple;
	bh=tYHEyC60vh0yA+ow9iEUUDHB3KRZUf9+w+HPXxDH/0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hr27R/Y32HpILMOOVL44G3pbRmIQK1bjGR8mRsJWYv0B3XX4Qs2oGLmbJdZrcWZ2qACAOf0giETiGQa4ldHp5qdh14grck+pHt7bBl3yyG0B/Qk2JZrFGh1IQqrs8aFFMIi/W7yMQZobXqlzjHcFbKirWwzsuAQVFkeS9aXBAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHRYaxAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=as5uOz4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHRYaxAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="as5uOz4U"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEf70a3474773
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=; b=VHRYaxAVAMY1TQAB
	KoF5y+Ky9JKEUnvGQjKAT5Kg7FXK8S5Ya4JqVzj7g6A1UJ+Si17SRc8B+R6Xpu4Z
	r7Ach50hKc7OP9DwS2hYCsb8WM2qAfNpVEH6binKZqqgVA96wpp206b8LX4QScYv
	O4IpsTJoBjHmhOCrRj7YkBJ2XFo/qZn+U/G6vyHi3ihGb/Cov7dGjXQ2RjMoMDsb
	ZaWqvkdXGrPmJu3GImVFCorqkOlKxXnbJo4jyXKRsfA7bPHHAisVWRkcqzx2Fox7
	ySY8/k7+nm8sJSjfOuR7NKqYmJYnnVMCCo3xP6XnNqxFu/PydPquyyS2pacZhMEa
	tb82TQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419khy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so11568199241.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686548; x=1779291348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=;
        b=as5uOz4UklYPq6mR5mp1E97UozG1848i7MMdX09c5g38d/rz2alRwc5Faznwt3auqR
         8UtZN4HFJozPQ9yMVxmD4tsDx+0dUSDmOLXULr930fS4Ij7crjFnXAdHort4l3xFkwbK
         dg00gEN7YM9uNbYAonL4qN7A8k4Ux1t7+FBVJSOW7qjYbarIb/oDfx5eXQMXy2qIM5TE
         hZYoMWSiXKSitZ7hKQx9hbkhSQyaFg5R+YoFykC6N1WWaPosHaxbuZcMr9Fk7bs6U42J
         kJjZ/yWVGHm/M3qccq6ayoIKnO3mA2HwQAfEi3DFWW2gJb/TITz7PoVjZZQhOCGWkvIm
         pl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686548; x=1779291348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=;
        b=DBvRDZ/iiPrDOTEAL8rw0nd8IIRfGa8hF74dm2r+tH30/3I8EVPKGk+b793a+c2Maa
         DlSrLQh7kgnSj3gA7Jh3lgbi3yU3r+h9/XGxhXQQR7c4oE+ndlTFzz0TJnZc/hj6V+HF
         IJNavQYmRQYtmcADY+mZevPF70koaxnK2EM1BBYGmOdL099Ixhv5JhH1XtLLKSMH7nnu
         SNJNMCjip5eDP7Qhl26e05+OgNciLXI1e7atJPrDBI0BntYQY5UW/V/LZ9i1o07Qth9B
         Fdcd22mM8hASyKyOWbBx9gG6A6VjXd0NtHadpM/o5Aij4fZ2S5iQhDaOpJN0aRPrd0I4
         Jgmw==
X-Forwarded-Encrypted: i=1; AFNElJ8cWQo1IJzf5dnkpd0tB6i5LkgWJAv2Bjf1O41Nhz35w00ewP5hsG57QzIA+okoTDFrQoy15V2WEco=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXK0TO/Q8r4tONGgqr7TvrTy8hafj82wvO2QzK4vL2p6p5OxFx
	YsBWRy9ysVrhxRh/+SIDDzFlS4B3++RAkDS62ryj5zA8JH4EqIeMIifug8BbW+GjtdY+bMUVv6H
	jG549yVCp/kp76owBwUVBNkP9nhX7Z8czO6DFdx4Gn6lgwwGTPs3UHJCUzh0gF6C9bn5p3hY=
X-Gm-Gg: Acq92OHQh9TlzfwIogcgqDZy9ZOCV2NENSpsm6lXPaT394A2tVljM3yveK2eQoVIiHr
	st6PYmUI4VY0Ec8hmiKWoSdkP1aBWVshf9vo3YzcgdhdukpBvNm0cHHUk38X0G0RpCcs9C0jih/
	1QThy3MjFDO7gb0R6pnDFbvrVg/UCmgeA2ZYGtJAgHlyEd/aTIdUI26QUpGNZWzUYsqSt3vmy2M
	LyUjc81ZlheayHdI8qntmYgCOhNrBiWp9IThmHBD8SEkviFsgNNKokaoTUuNQgvyQ1sGMOrlFqr
	Mwa1hn/p2TeAyI3jbBVy3d7LH8ANHzMvYx8+6hwvG5CjV1jcOcPU3ripev7M6+XhRq7fKXMEX2O
	xfbl/rYz6/cXd9gXJWBUbslOrr04QiMsvS8/izAfe/bBOqrRh7Q==
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr4077216137.18.1778686547519;
        Wed, 13 May 2026 08:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr4077196137.18.1778686547113;
        Wed, 13 May 2026 08:35:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:35:30 +0200
Subject: [PATCH 2/2] clk: qcom: nord: negcc: add missing definition for the
 USB2 PHY reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nord-clk-usb2-phy-v1-2-8eafcb2d5129@oss.qualcomm.com>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tYHEyC60vh0yA+ow9iEUUDHB3KRZUf9+w+HPXxDH/0w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpJH/y8U1Ax90iAVFo88ARvOBAlUepzPrrOF
 J1MStmY7aSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaSQAKCRAFnS7L/zaE
 w1TJD/9j8QT/YDEs2oki5aCHPO08dOSd3Qp9f6Tvw5j2MVKCfLtGeQ3iW2LRUxV/IodcOV2B1vE
 qKMD/4qwFDWj0r/7J1tp2cv73+wEjzLcqfKUv1tMCkUuifXN+/JgfYQyGmrl7sc7chbgaCGCSLf
 vSECnqndKy1rUoLpZwWXR8O0XB6lAgGtmqMLBA/cU7z+n/Mhd4zYAYHKdhvDttIgl5X4d026lEU
 E51UxhdKsYch1QcKPru0MBAZUf1905RvilvgL28zZtIldE9uuOnm07GQlwlhGWRs5nfOJ324BhA
 ccJi40yK/xTfVv2f0Ec/UChSrsePO2eZCVbrK+jKSDMfH0djrOtUkhu6tTExXuaLVEEOOowf2Xm
 pxyYN6DIZaJqdyqJEgAKNivP0hQjiJHct5Q4atL+41aMeZTZMj6vFifYal0jYEp/llPrgQskaAh
 qB7DlibMkuvtKvPLLONZb970etIpzlypym23uaYHRo+meKMAfM8+ZR5Q3FbpVV4k9zktdqtqe/V
 kiK+I436/QQsBMPTTQss4KNqWBpAI4GJdgGnCSjrRImQJcyKgq7ps1UegNiX/RaRXjn21d4rPeF
 rGLCFLFfWxxLpYLh31g0QRCQjS8Jc1BQjxv96g7DDwGw0IukCfQ61wTXO81B+U6KQ9xUL+JFrqi
 XXLHe8/J+HxnvJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a049a54 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JLQsvVesbaMn6kmgP5oA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OSBTYWx0ZWRfX5cXbxo9Xl+7x
 aHpAJPDekKiE3Dr1M0la1l8V2wt4tEP9k4wo2x9wzIsmzuyK3WkAT93jn/j4wPbL40LRNDxAKDH
 bf06VmkmNLzbnZmAuMzoe1+gZMIcxGHGp97H9lipiqWw+24oFRqvPmQ42dIkid/JyhHL6JK5Ckd
 9RJqF9tBZEkkCBtMMd5E7mFR/YPNmQTa+0ZRSdSPFc39LejRbwmvjwLWafGQtWyX4wVxLErx5DS
 WI1Vq6QL50R+uMrkuVlrqbQoAgiXS8N/WaObHZJMoYwO5CyH37h2w8aCPat1xUH216QZjCaYx8q
 pxJJP8SiWGn7rtPo76f4jk91PMWBvhE+Bv4l7Xbys3ThYsFbnKUQnJ0F8ztMVR0599JB7c4KX31
 0Kp11fxeKf/AnL1EWehzIX9R38mavmGK0Ty8OiBmseCnWaukABKRYpaMWclz/qicf5F3m4Oz06x
 pyCc3LR/zQKSBLhtyQw==
X-Proofpoint-GUID: rdMkiEVoxr-ItJvHXFdbkhfnu_ZE2uVF
X-Proofpoint-ORIG-GUID: rdMkiEVoxr-ItJvHXFdbkhfnu_ZE2uVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130159

The USB2 PHY reset definition is missing from the negcc clock driver and
its bindings. Provide it in order to enable adding the USB nodes in DTS.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e536e6b6e76f488abd0e2fcc435380..31442d39924a6f79bf39962ebb0de8d5c65fa0b0 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1918,6 +1918,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+	[NE_GCC_QUSB3PHY_PRIM_BCR] = { 0x2e000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {

-- 
2.47.3

