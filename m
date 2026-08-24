Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758F0411F83
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572529; cv=none; b=KnAEyloliV84JqUD+1pOlzZlmHrmM63lsTpiTiM0nInUUTn60V9r3v5SjhexG4e5UX91iIychWdoNkIo1X+h+E8031tGrW/Ul1Ux9J4K0WFa8tFaxUFiyPHofUEj0CLS8k6dd84Gekb81sJmE0QqPU4mu4Sx7pHOsRadR0Emv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572529; c=relaxed/simple;
	bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hvb9dNtmGOHNzX47xHfVCHH270WFQ0W4Z/62UEqam29L5r9+jMTmAxdgQuVxfvepjTLlHneZWIjDaxj/29AR9szwrOAegpl3dJojOx1OoMplz6vvA/rmsFMpGCc1I6xmIQq30YtrshZjwQtwWh7lm0ta0P0y6V+KbQOEd2Yoi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsmSuJQx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Drm2GYWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsmSuJQx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Drm2GYWX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeIa2372617
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=; b=fsmSuJQxa4KgtsVY
	xqfWxGzqKnvkGaEH0cL6aqf5h0TKXDRaPx2X9AqBbjz4P2n8MB58lCGe3uJrfClS
	eqJEweH5/5m/98SuHA+cbKvP8h+BRyeUHBhEo7+JikpHHqzliibM+EesRJ2qYGL+
	Wn4bAFay/3cLAmVPL3pKLCND+eQhKq3hq247icJkpusJAvrrhJhd9Cg6sE3KDeeY
	HJ2G68K2gYyScQg6x26//3CSironsYGw8SJjUuMAiAmBuTzwVHVuBoQxeHA+azIJ
	1mrogeZCLKWPGit5U4862KJElHyNlCK7zL/R+8E6HHt+ybsyNx22hOdoXSd8EYXH
	cp581w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshegw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso48089381cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572527; x=1788177327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=Drm2GYWXKeoCLyCyn0HR+Npd8T5ocgQSAVSzHdyNgRKjLaXWlszksTcSry9S4f/Q2M
         5e0B1EgDOmKQRklV5aLgRnzoOs4MSc0pGR3lRKO7pwxvlk+psLouSrFhMVENQkJellIU
         dzhpf5ySy9EMVfHZgKuBKKPDjNJbvnzMidnCinGEc+Kz/N1Kq8CK7tSXKOxr9pyTQ/Wn
         U6zeHhz64zPCyc06snEmjGRYMlLNn4vlNiRTL38Xt9gS+fxW9w2BYs2blI8GmTCWmBUr
         90u5o4G+CmgyLkqNG+BE2HO41WfgB7G/2PMjCgV3t5ulWvVfXZjTO7eFrQusEIk/tMiA
         rN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572527; x=1788177327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=d0+TvahDB+VyESOmmG9iJ5csitYwTcGYPp4BBrh3cm78W3PvRTZcsVH6m0XW1/1MNB
         i8xNa3fm6JT9B2GcdGCqRtFEEpA8plMopZMV37oB1gjGNFgcXC5LsXheu2WMb/O75spS
         Vcq35baeY/V5oB1bT9PfeZcDU86/jBlNDUB8ObDGaI78A2Yc1qx8hsav7h4K/EeNbicV
         aEu22s/0czmWL/O8DVU7Ej7MBgVbm8Q8OFtviVZ2PpXHGWOGOYYFI7Q948jqQJsEYRCQ
         lMtP02d+oZ3jcDfUeAhjqui/9jrKmSzgD5prHgxb9HdoVuuPUoDRBV7wElkG7w9I8YF0
         Ezrw==
X-Forwarded-Encrypted: i=1; AHgh+Ronw5oEN4GjfARd9nVXIZup5TW+amAvBubAGHKGTfea0imEpCgqDvWIo08l2ezi8ru1G4oaSPY2kdE=@vger.kernel.org
X-Gm-Message-State: AFuF++lVbF/XRjv+goKwC9NaZeDkSk4R8KM09lOOOyRWCAk48xn1z6xJ
	kN6xjlgXxschxlUdP4JtSUmrbIr9YUP3jfa542p/AMuBjeAqCEBAo4z3R6Qnv7JMM2EVByjui6U
	gyLTE73yChW+M+aKfg9rjZYRfhhB/BXK70V0tRUQ6JjgyUlUtnZXeHQjbcDGL5SI=
X-Gm-Gg: AR+sD13+4r/o9EokkI3WcRqSY8up+t+luLPQswSbIczyxKtlkMqpHpYJWAaq2LJEO8M
	PsTfT/T96EOJ22xcccJYeanhSnBOSXWIua4T3HxMQOdcSsgVFc1AzAukjzG2kDXSIAN0KHCuQiA
	rq7HFUPtFe1N5QEpQ6KVTDJNMKdcn1LsIrI2e63mQnNCItgiDYkBcvg2bpwtQMoR/RDpXSmcZJr
	dYgysngnUSq8DnK83KR09PpDzC1olpFI0loRDnSLFY0pCMXYgOEqgbTFwne6fbDMcFw0O37s0FP
	6ZTCcJehtKjNffxVemyZA7Cepv78PT9jse/La5pW2+UPtbGcGuqRVzWVoD5fPrEl/vBaDq+OAVq
	yAJ0BgCHS
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr282719711cf.33.1787572526883;
        Mon, 24 Aug 2026 04:55:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr282718701cf.33.1787572526275;
        Mon, 24 Aug 2026 04:55:26 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:01 +0300
Subject: [PATCH v3 14/47] clk: qcom: gcc-qdu1000: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-14-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDjbwNCa9vAm9uHMGq8HoD55dfoMDpZTayPg
 +qe6rkLyY+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4wAKCRAbX0TJAJUV
 VjssEAC4kLUp6SncHvRElvZuLBD070xtGyWjT3RdwpTj6vsDxAw//xJOcUsKP0P8YHqJ8mvarAJ
 WaIyVLNLkPCXBXZfudz/fK73++2XEwcJRdMwJoCPBKGlyGIGSbT+zgm8Z2Fflt8goFXpVqEGvz1
 8eXbefNVoxIGE25aegwuPL08jMpb1YXP6waPNEv3dFGP1GNlJ3PAzhSwbmeT1NKVyPl2S4YbJvu
 fs2nCiC8lBw34FoF9OfwGTGQb52x+aVW4tgEBzxHUjZesxJiVJXrP2Gn9wYK2kYjpPRqDdSVUjb
 pJgLG0Sw54v+8yWWs9Kjrqv8stLzIgUJ5qe97Fr2yb0n6wuElbwO6AtMVW3GK6JOLhX+p7Gl7yH
 WMUECluqr+CQhCmQTfREqtbcRuRxDDRA3vVaVNmH7QSybswYdSquDrfyY5wQoEiY7TOsXwTtBf2
 il3TjMJeHDjth4WcV0+Zb2j6VifzHFbuxeq4dYzpGf8yfFNP/L9AVbc2eE8+uFNhCANcYYEKfAd
 UBjf02YrnZuK8JHCh/9qkE2LwhZ2w/iUgnMBnA+3dqG4AC9NuRm4h47OAKrel90QCjozwNXFiK2
 6GVHIQYn89wqfkhQQ7rf7s0L0c3FBiXtGbNWzp8oQDouTIgjaYfYM2cn75gHUp+9bjA5aLRaPBl
 5XE7y8AZMVT5UKA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 7M16WWW72wF00rB4vi7HcL-DwZtelXZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+7Og0DziVERj
 H3cpLV8L4KSd88JfhTTtKQs25bCP3UjM7K+IlnElGtzYWufZc3nsP4PV+ZggZgsXH45R48LF6bR
 vDweLySbYbvlGSHgUYRhkr5Okg+2j3PQ9o2kZcjkpX4owXjvzg0SuSSun181KMApwqpJN3YKxZ4
 Gksq/Ir+wj+Ux4DWrs6SqoOwJbDfpyHRrU7HdpOuQU3lHw8HubtUCLl+bITCBHXezcjW6/LEdI4
 AXlX1lazkLFM5QssV3bak5H9gSEntLVch0JGvx/9wDtdYFbsOxRQuIo1f/0RojEbSApSIdVZmZY
 1WElnZZ7oD8077A5Op3z3iRdAHOL+HZZp8o9s/q/YkJ3YckQcm+k6QzkAL+/wPvYg15mDCT/cw5
 AmOSKantKwJaOPf+CZYBUOSHJYgFTmZJM5XyRYk/b1DrujrIZBIzUE5kz516Jq75iUKMTBPWdt8
 ZldMQoUF5S37+1rhdWQ==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c312f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7M16WWW72wF00rB4vi7HcL-DwZtelXZ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0BYmyIEsWghJ
 chfDzS7CHz0rEnMH3B5o1FrBQeQc1wtsHJbq+95QQH/2+JuBOQzH12F5MJ9Sq62oRo/98sVxkNr
 GAteoSU23s+HwUftmMqQkuauHXPOPx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..172303ac4c9b 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2649,6 +2649,7 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
 	.gdscs = gcc_qdu1000_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qdu1000_match_table[] = {

-- 
2.54.0

