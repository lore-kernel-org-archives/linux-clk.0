Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82371337699
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144017; cv=none; b=WxhWGwZlv++ymjD/UBhjdANQPXebGqWwdgcb0EbIamCxTu4zuW2YF/CXusXW8vkaeiVE/DzO/VAaSz7mrfW7LZuiendn2CPtou95YcniUBdV7PyDpKwIP/JHZ5Iy5f4MRgDb5sLY8zYBttkQKOq96xRVvrxpuZosBUaEsR8m3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144017; c=relaxed/simple;
	bh=EEPzeKiQRqPtIeuzd2KrTwb1z5xjtGiWFxIPS1hRuYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uiYchqIigTjoTjfHKgvLV+6tuU1yLp3cXLBdWZtmI3eMG9hmDtT04uCwlhwn7YS+ZbJNNn6LmCfLiLCvFIsYTW3Kz0CXzWvMZed/p4oB2ZxX3juuE49BKUgOT/39B52Ftp0TTe6xZaFDmQkWR2QhI/4k0wLrckQOCg1WSGudohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKGv60er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN+/VjE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKGv60er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN+/VjE5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClNF7143693
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/d+1zB0csAnS/x9UR4V11sunfnFsuJDzxvGd0DVjAM=; b=mKGv60erSSMK2fI8
	gDtKTekRKpeJp7E29ZjwExaD54XgV8qCbD1GZBnUemKeHIMBvJt5h9+YZx6Ukl/l
	ChI3tOhkHAoBRclCAtkxuRKU+OPPUu8lr8/BF8Q5N8W1KFoUqJYE+mwZI4Zlc8gh
	ojZh2a/wJNy4LWBq7VMKkg8wbpLPl0PqjcF3jz37mh1kfTmUPnme/fK4XmAu3V4l
	2x+q2nGPMs35cpcYpb375oSIG4WBgWB445LIY5TWJbzFnnbebsoECDVL9nQUE9Tf
	az6lWlFuoTzn7mm4ijM2OJ4foA1HKw7hGuWdpTtGEJURvPGVtJspaSiLxOtWKrq8
	1xKjFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkbte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa3d9dfbso134007585a.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144014; x=1787748814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/d+1zB0csAnS/x9UR4V11sunfnFsuJDzxvGd0DVjAM=;
        b=JN+/VjE5wZVvkBG++mZF1fJ8N3jaJuOrfkbRj+65g+VlUa7oR3Gz3p7+xHpe7ntama
         0HbtTaJ8vRkQzETQGnGPBZ2POhB4itlSqUDZiq6wfaC6o0smsQGFCmhcyJ787i6D9qet
         TKInjDUEDXOCiJ7B4fi0cWI5/MG+71Ot0LVBgTwSuH2vsvNuBPrki3fB4QrylZG4vSZe
         Or7A0y2r9ERQf0AMtTHaAk9/8tTxWBNfCa10/7zTXLVTe4O2wN6sW177CGDQ1OZUjzw3
         5bKKt1RojG2OFBjxFGijWjDHo5iKUXBpxwcBpF3+D+olZGoUy6nVGFrdBMA/uIuzEEVz
         PbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144014; x=1787748814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/d+1zB0csAnS/x9UR4V11sunfnFsuJDzxvGd0DVjAM=;
        b=obXbPVP44Tl8UF1qR1OrZGXPI/W9L/Y3y+ZXSVjZU22lP7fO0/ipKpk2MlovLKVgWJ
         SsqzvdTTosKcsLYg0uX2hHb9fMe6wpaGcn1PY0jx6vHv/QVM8GP4SetLQ7JIJ8VP/nJb
         dt4sSZevDHQqkPIfC3qg18chWQHPLmXMBQAha9Te3CaAcMDm9rpueGfGYgBoiLAb12LT
         U9E6Cq1EzqJDyEu4kwTN12GXSDCX/u0s/Megkkmkywoi5ogjKZtrbWh2S7cSFxS33W1i
         0dxeDf61x2b2rl1PxL9VtlAq0tBSDgZwEkQwS8WVzxniH64WmNry7wQL2PRRmgfTFUFF
         MGsg==
X-Forwarded-Encrypted: i=1; AHgh+RrSZERrreifh2drF79LIfMS2ivClFp3sqbZaxeI2wZhRsj6RO8tK0XjhkLUlUPNSflMwApiqM7rB+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ZMTXWSNd8g0FtqOCBFgk6u/v3q+fyoPW3h3Ra78+dU5slwNG
	eDBR5u0RX9X513v+tdTyz3I1pH3TumBbMMibMwAd8WvqyVotnzDpKkvGwhL5bGuJ0z1CzPNnhQh
	puvTq0UAmldvu/iEHDHY/xRTIlTQFfVOWbm0KkFvLPgvd1XbpjGOgO7n4zrD0RTY=
X-Gm-Gg: AR+sD13jf15hBRMA8gVD4EENreNTD2X6DmZppT1MRbEKn+fqlfOZMrmJlFqXFDQv9ds
	XLovZGdCay/Pp+TEKKKr7AQnzkEEsMAn7EdNf0mT0vC/6HNtpYvbk/tNiPOlt7UJTEsM4gyDuP9
	6h09xeNA5aKmVB3zLH3jSM8vCqSJEHNp9hf1XPTEnZe4i864I4C9ciuJrv5fmJ6Axd02XqMI8Lu
	DuzHQqLx3hel8SNRjY5Got1IUnsuZjjNW3rn0zuHqYnvdSjyORSDvKEqX+sglIHdPs0RMrkqaAB
	0mF+0Zk8FGCWHkpk0rF1ppoPeD5wv7hyusDgRy8syO/rObCb/HTsLFlEj/TPE41SVFdDLlKDvnR
	Ev1G+yHs1
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr418716385a.15.1787144013662;
        Wed, 19 Aug 2026 05:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr418710885a.15.1787144013132;
        Wed, 19 Aug 2026 05:53:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:53 +0300
Subject: [PATCH 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-8-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EEPzeKiQRqPtIeuzd2KrTwb1z5xjtGiWFxIPS1hRuYs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacP5DIfgv8tCSSMTRmpwMluEQG0kFwxzasEz
 g+jBIO54yyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnDwAKCRAbX0TJAJUV
 VrfUEADMe7Q4DJobGQi66cyQp4uBdvSex9Udu8JuO1aHuuPcaLKIJxLd00nxhZz9bpFsOexGcw7
 gtWR4vC/7HICYBIAARN996WLEjioeGQmEx0AqwrsjqosAvmvr2NFuRM+osyCpzr91tO2Gk6XRxZ
 8hf367DTJ1TYDTuA/tcwFKGjaO0gTD+Ym56G3Ajkdh+ICnHkR/xO9t3zlv0UkkwBCI0b371VGbE
 bZQJjXHyBz1SIH1uzoF5jzbv//+HzXNuY5tPn0u5UC0QkL4PPk5GUXlqW0qzBRz8xrekMvE4//B
 ybnBpEpK/sW7pQHhgZBvGI4/rH6CITqvXebkjeciAII+IWlDN1i063l6hNcIvDWxtRMTr3KSfRf
 NIxHtuhsxfAqyZ4UdCcHIAmcJdknAU0LgInVnWFVhv48OG3KJu42cYEDuW3v1c/zEFuMs7WH25v
 K078d87LxH13PgE7vcjV9hvxOM1Ro5LWZpNAgJmGmzclFqe7MQJI75DmR3TAzrOAl9c1RjrKsF3
 UnPCBoReHjKyS7FNTEl/XIE3bmD5XU2t/J5m2STnEuk4khQwgJXR7RMvawQ1il69qnsIzYbvqfR
 bL9OUbBhdzgFxQLnQTu4SWIz4ThyWPBUWZ2uGsVjBAqDffmKe6aBFwwIKhNXHZ+1bAsDq1UaI3O
 KFblzPD0Pha/ApQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX9ufqsPmJOy7G
 oQB2zZX9H6dL36kdYYg0twr/DwJ8osOXnddlW5hrZGgQRHjG9669Sou8ownAc0/J7JmGYHpjuCW
 PR8XqxouLnZFKiw41oifQ6IqDlYdSKjwoY6aKRJM+iwxE5FchHDaci6/GkW06G/2EJaX4XKgOJW
 PHgkNM8D1/mIf/LDLnBp+Vn9Csh3MSVrh6hbGTBfXzxBV4vc0T2WYZt5QF5ps4EJIov1smmTdRg
 ZNEjx/PdPO9u9rl4RIHx5PVQ3L/XbeS0JfNbkA/hH09+NzYN7rjVsweT8WnAYTkNj6Iu1yk4msM
 l3MHHs7tqAll0bVzOehuWpeHxcYatOkhHky1viH3g2JHMG+3NLJWq0U/9j7Xmwohbqez04XTOmL
 WAvH84iMDP7ivDOlTXCkYUYcKlrXqeGMM1DEBMk1WkLyJ1GbXrIsc0s1jEun47oHiZ9b3kV9Bzr
 0hYCk9nTrMmraymaoIg==
X-Proofpoint-GUID: kBvTK-V9aFvmPJaBMGvKAA3nKJpQ29Oj
X-Proofpoint-ORIG-GUID: kBvTK-V9aFvmPJaBMGvKAA3nKJpQ29Oj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX3zleHSvH/3od
 5nqzNzYU3hJDt6vAIRVWuScv42Rm+hAwenEzfUFWeJZIiGGWgKgXzurJs0CVe1lxl37JWL8giQZ
 UFT/iL9l7fWjUs6DXAiGnAzlYPtCIj0=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85a74e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..601c81c84450 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.resets = gcc_qcs615_resets,
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
 };
 

-- 
2.54.0

