Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C233191D3
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144002; cv=none; b=WyKjDe7o3rgo7IGpoiXitNchCdrX9BoVNwPpLrMYBxqtEes4WztSLUMk36dj/AduCDVNTT8g5S8x5fFLJ5OqEx+pP54u5VtfA21I65BHwNBmSYlhEsqOiLaTY5vCjdH33iVgsQTQTMg2obN2FuigAyfdlq2Uv/YX3oMSB953ZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144002; c=relaxed/simple;
	bh=j5kfJArXSGGYxxVdA3Rj3Od6dNwzJftva2Zw0ljs6Go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VyEgsTWdG6WKITPLlUIrphsFb3tt3mbVaj/c9Tw9tKfbWKzbfF4c5xW1Gg+lpEhNdvQLbNLe5rXBz/YWxkHwyJphr1KPcZ+0IuABgaZh+4OBSD3bhcKGsUO5x70q1wdgF9XWi6GMuVxfP+D+SmxXbTqHmp0tSs0MfJlIWxMNBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ITMQXfQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPExSHeO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITMQXfQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPExSHeO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClFpK341589
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsJrkUV/LHXxzUNJhN9DwH4/o6bzpnIJzjlKORIFfco=; b=ITMQXfQ6lGeIorZn
	BSbOgxV13E/o0Ecsw/qDFiL61c0eXu1OoEVTmjzNmVdYK0/t3D/u4c89fOeH5cjO
	LljqOBqJHgCCA/3/eHGTCeLq8baNCcnzQ4bcqjiOEp1bM9VGhwI9vfVcIg3fq4ID
	LkCZ5bt066Iu1Av7CadHuV6FtywhvULgERtj9hmUj2Hm6GPZkA52nEJVdjpTQ5kz
	c0HI/zJItnTLRlTywZudMa19g2KG6KwdvCj58Fa3MTj7+u2rgBgTH5F+Vy45b47b
	QA6bQg1RdzeJ5QI2wbAwA1iG9U5JItzfLOBmopuKWpMOaMAIymfPi1OZqkm3tDPC
	XQ3YiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb8rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9309af14fd7so114173485a.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143999; x=1787748799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsJrkUV/LHXxzUNJhN9DwH4/o6bzpnIJzjlKORIFfco=;
        b=jPExSHeOPXRV8QMrpbrxlzNCDjl9/NoPUfVAMXHNJeiP8/zWtOeYvypgqo02aOPthU
         bP03lEgiW1eTbjMASYgtP8coRgt56BcZ3YfIDXzHHxfvnp+RPs0A9LcTkqHzcWyDuSJQ
         hBuBqIK7EhdELd+DfiGGHb92lT1ESFKYmF5BU+K2mF7S52Si+pyAqoQKOYTaUgIDDQ/X
         O9a/rVrlbMU4vAiOBl86DitEd0pY+Rx40pwirPUFNP42lXyFGEUTKyoG2ribqocB4pXK
         9Qu8D9BoEroJ+T05OyKaL5JFFWpho3cPlqNj/UPq2gKG2VYiHaqrIyORmpg+xaaiCWux
         aBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143999; x=1787748799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsJrkUV/LHXxzUNJhN9DwH4/o6bzpnIJzjlKORIFfco=;
        b=e9WwBwV2fY1fXG6sFld7RnCw/cKxn+7c+IBOW624rEnB59cY6+TgirOZ5Ukc/ldmpy
         yh1ppmJzs7nSIPqfIn0igXhFVfyNuNVTVATE4S16KoYsayJcA1vb4woaNG1IU/IyuVFR
         iVj78AzFl33XJ8XmV+oj9CvLwMZobMMjMU283gSk+JJzuUee06YD+SHTTVgNeWW/xDGt
         l8ajL+h2lQXvnyUdS3fjbjqHYyrmk+TQnujfbpQfMBNQwSqnS+vNOTnEDC4wf93bqN4o
         JnPtnbAKH9ZGP/nHd9Yzo9AHV1RCyhGCwfUGsnCo79ckyVI80LsTS+Ge+qmswBIHY0at
         IJCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqri3b6Avf+oi6HzZd21JEoZChaQ4gfTNYA1y7v53vyEJ9URYvOhMc1d0uqrO13ZZT/2GoPQwdUa28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6UdWhMU65IiOqHmsHOMp7yfm/RTJg3PPaQU1UaQXsTbB/QxAo
	+d7laLQU65tldkbOfg0gX+o/aDiP3+pMxf/C+a23DQX79Y5qj+DpZ7+yEjr74phmulb9YT2cDzT
	jbvMUQav21VhYYdgXP5pkNtr/L7szzzOoJu1KhovhAoYy7tgqTBcC+g+yP/eKK/g=
X-Gm-Gg: AR+sD10M0dbvuoNH1jljThaFMJ66T4PBUAmbfGp5UVBlDEWOncy2tY77FWSluXwbiJ7
	tN7LEkzhdaGfjXF1usIw7RZeXs/sZsd3UZ7HPo40aksKw5dmdggXPOD1HdqlEqectg+akpj8xLg
	9BeVQabvMRFJBTNajddOKBkUX3rXktyniVAR79dkpqjvYxkFXkg1q3jsnm1sOa9hoeMmsFV+MWM
	Aly45K7XhA1a6jMBpEZfZPQjVZ4poEU1P7ux8QlqsCjRwjQ77dTzB15BcodfO+PeufxvjVC7Jyw
	8JlranZSPii7ficZhBHTu+jUz/v6eY4GUFm6nG8f2VQFiKTKDH3tkaEkYeUQjF8+UMs4ElZldYA
	BCx3X4nfl
X-Received: by 2002:a05:620a:600a:b0:936:576e:227b with SMTP id af79cd13be357-9371e44cf08mr413261885a.24.1787143998882;
        Wed, 19 Aug 2026 05:53:18 -0700 (PDT)
X-Received: by 2002:a05:620a:600a:b0:936:576e:227b with SMTP id af79cd13be357-9371e44cf08mr413256685a.24.1787143998376;
        Wed, 19 Aug 2026 05:53:18 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:48 +0300
Subject: [PATCH 03/16] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-3-840034124e73@oss.qualcomm.com>
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
 bh=j5kfJArXSGGYxxVdA3Rj3Od6dNwzJftva2Zw0ljs6Go=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhab5l8GMQwQ2yd5csPod/IfTZIT0k+snHorHN
 rOEs3RwkCCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm+QAKCRAbX0TJAJUV
 VhyoEAC3MS9t5YT0T7L14XH3X1KbKNX8g+12rZ/SkKaWVAZ6aokDqDBzCLki74YaqA2qB1+XHL7
 ScTUf4Bob6xeOXGKAkhDfbHg4M/L8XPuxT9jqLtFQtaaY+O1Ydw+FLzbPueN9Y4h6vXVG5Y+XhK
 JkYEiwwpaSI36u0oMYjQq0K/qENzsVNFDmxAv1nnjxkr+NjsU6DmkIw/dzfnCxXCfPvF2xQrh+B
 rDIUywDW7Yj+goWddpioCEbtXyd8sk9MZYbZQVpvJzSZkfgISRngE+x14m1+Y1otk2kKzqNnX8i
 N7QHUYSJ7u6CITKtqf6jC4KFZiQA9z5BAXMuOsHG1lqkwNPUeGKR7vQsCbMRPA1ZZvpV8P3G+hb
 019ZMt0hpDBiq9kcCIH+IQjsi/6T+5kSl2RYXQKa6aL2u/0rJ2AULZUfwCHUDMXww3ksJwLCI/S
 nNjQ9HbfdH3jQo5+yBOgTJQvqKr3cRCWp9poZGXLETtKG/JbsZcgg6Fib3lUo7OOTOqh/WOsZZ2
 gndzIFpVVIbR4Er7tOOOHeyskJSzwSMSRCafRYs7sj6N/BijyjHI1MdvC9wtpXl+gCXAL8aX6fz
 jHQ7wJWsVCjLSuLRPgG0tBw4490MXv9y0O+zpwX6fCjrAfJFClxzDWXRskcXSEqP0O4/xRLq2oy
 JvGdG7UB0H1tE3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: _cs2bAI43_vcM_EmLdDDxdPatYwxwQBS
X-Proofpoint-ORIG-GUID: _cs2bAI43_vcM_EmLdDDxdPatYwxwQBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXykoVxPGjzKny
 CNasNbWSM2Ak2665Dxj8o43um0AbabVUz9X3I7c6/oD7aNQAlG9DLBcIPhrCZC1QVYBMg3w/nam
 lPKmtod09NsUE9tO73h9GX7zQkvVi2BGD7SLUcTfv4OB7GnGk5wQnoZwi4kO+1evR7+DW9Rxzxb
 +avBK20yzf+SHgqHrarYMs8sbuVse5/883KEPaBd0wNHYI7atZuNeHyS78A13y0dgAQtQM2XvaE
 dZnWgcJWMVRgMRekkGvY2GhY0r6uzfOTKkDR+BqiYgUCqF4Su9uNiujSQunBpAhRx98727E6RZM
 LT8VLpn2EiwJWX2TC3s7+imxcXWmVOIEcqbnXaDiQ3PycfyZWi86GTfV3c6l9BUZbRl3QA3nrAo
 k2fWEzBb1wMK1ZLFYifUjMSLb3hSGMPnsVG7GyaJIwK6u2Q4HvuiWqjz6KH8x7NmWmeLw2qzb4l
 AwH/LOsfxjAwQX0m7/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX2WFZx1QT9ecB
 ERM/0eMYAoS3PJYiVj6obM2VtFvAijsdzKzxnQz4/+dLP9GJJRhzw9WhBOruHr2oHAaZp5AWRDZ
 jHTpYt16of4NrNBcXYpMa6JQHx7Cpu0=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85a73f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GXj57v0THfv1quAxfRUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..b3ab458048dc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.resets = gcc_sm8450_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
 };
 

-- 
2.54.0

