Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F03A5E7B
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742023; cv=none; b=fS6E1GhsIqHKadw/tPZGeCMd+7XudN4MRKzgmjTBA/eREoweEub59rfZ83K/uJUNhmx0O0iIDNBm14e7xxGOTm9cQXel4PljuD9nUFTfZsKpk3yhId7Xl3rqAy20hE+9FEPUkcMowTu2Zd8FKgjKIA/m5LQArxfVK0dwk2oYSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742023; c=relaxed/simple;
	bh=IRck2ORti5++vzKnQPjaqIPGPrwD8P+u9lBXDb7d1Dc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uITlWAhH8nQWYyoV/VIQjGUmNufOeOq9mH/mS+PeKa2bvmupOOMy8yZp532RlL5hmr8aI/CqiwICpFp2F02z4ktEyhu9USivmITW97ZwqpRds43YRtRvJqDk1u+1AlYi8kEjqwnP9Pc3q2FVDF2nCZCWAMQTE/WJoZYMSMnyA/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6ehrvhK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4Pj7RHY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6ehrvhK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4Pj7RHY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8JM7T1534027
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4wO1USks+UtompvppfcERO
	Sf3ZplEYIjCVL6aOBEWjo=; b=k6ehrvhK08Iu4o32p19HlIJTkHXJIU8/xBv7/3
	e9/qFFK/GfxTE7uBoR5vwCatwXf84/4igZbBL+PWj+1q4lHM0XEUSNL1zdVlHG0s
	FVLde7f+Ok2dG4zDCHh8QBVD8y5+jn77mEE14XDEw7aVY4wKorGHpe/BH0vDULfC
	BsVhmRF4Hp1fzSfA1JUmjG5kHyOubArtH7Jv2a8VOFoOKChzMzBMXxfSLMcMS3W0
	ikNUgFydxExgeEwyS/Ybt8Vt8ntZ+LxUwH6Xqy0yYZIS6k9bn/79bCEzETEkmxt3
	sKvp9B7/vhQOLiiSTv1MQoA0vNYv+9ufXh8iICHSABGbJLdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k3hy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:06:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd820c6a4fso4877478385a.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773742018; x=1774346818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4wO1USks+UtompvppfcEROSf3ZplEYIjCVL6aOBEWjo=;
        b=O4Pj7RHYw5dvgOvP9sXJjiW+Ia1y/lB1Vvjp4hNZadttBKlfvGBaKOSPiA5HZ23s+B
         lRG/fQZken9QOBWGstrZTiFM1bc0iF3wTK3S3Gr59k9CY56HNlLm/ilFMv8fgEerGirH
         6GEHzW4nU8ztpxev95As65lqY+mSNavm6h0wisUn3N2quJJ22YxMxWgqB3xShwQlME1Y
         xdGABe3o5Ghiul+D7N3a+QQVABMwhOIL9KkDYCtwZo8QehDl259DF0bFpobIIUKVfs7K
         ISk9Cu/0FNpjgzsswzsw/E3CCx25NCPVyLk3/qhs8fUk6R4PpGIFEXMEBx3AayIIv3s5
         6a9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742018; x=1774346818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wO1USks+UtompvppfcEROSf3ZplEYIjCVL6aOBEWjo=;
        b=QF+v/DgNomKyEgH9B/fmJ9TjLO/QNdG1eiDoLneAnarwWSvpYV9UERQSo+ttBApOBH
         YrfAwxkLMic/tZkU+lLZK7hw+4TNdqjEcrngIQLJVz2B2wcSL2PdlIVE6IlYoR3nZxd9
         24YdCz1sLn8IQHbIcU+L0M/ihn4M6RolDA6h0SVE9r/CR+k/mIHY4vOq/0yIf+dlPntR
         9SS5hqq0fj57aoWECRk+x9GHmjKrZNXZ5hkXCGs87o3GnyI7Tk/CxTANRSdUx0nGo0uD
         AQZHj5Sve1TDZSj/cavoKirSjZ5y2Ms17Om32/A+ONleDO9IQAMVL5ZA0BY7CUKyqHao
         l+0g==
X-Forwarded-Encrypted: i=1; AJvYcCWoAA3vZlz+qGcThwONSvonIDheTIWWrW2w04bMMR4IbcqJhKKVmGvVGUrmCqFyqgXaECTJEmkJmHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywoPovXUS2J2vKh0QKVNhUmZCxbEgUi5heLuocxo9AzZAAoCj6
	HnyL3uRDhZMoZQI68dohExsr7sgfnxOccW242jso9kTazmVcGdT6/9F/bDFAmckbQq++KMOL3XE
	I4fbTYAJi41kfZQ0rinBTTd+nOLsPDtGqze32mMbEgeUyhLE9HoF9DyXfJGnz2Wc=
X-Gm-Gg: ATEYQzzoz7/15SWo8s9Ay5qXxzXAVAG2rZT0eWIglTa6hMWFCAt38ldWTt4zdx5LiqJ
	Vp1rW902jh+ua+KZxgD1rFzzYHwJYhwGMni2ue5439KtkEqO0o3lfnhHhk0osFGfffw7/A7ZSlM
	Sa409rlFvBWm219nr33nBoJQYr9xpMLROsymQ2BfBScTceikhwbWZOokz572cL4Fkn8oTlBWnJe
	N6x556khhXhkyo+PPQQvy+L4AGwbreS0KQeH5rL77jbIFy+qFiQrQ7dTowhx3t6YZVy6GtfKDvN
	WawOd1cfbC5bXvxUKmHA2cJdvpzkoTW9FI8EZwroAup1TGdYBDLfln9ihAOm9awJ48lD1C1WZVs
	cVjMHvNBYuf8vFuj4I8Gwuw6BTSUWqT7P16CTnzTxlQK8
X-Received: by 2002:a05:620a:170f:b0:8c6:bbfa:36af with SMTP id af79cd13be357-8cdb5b59a8fmr2112600585a.40.1773742018332;
        Tue, 17 Mar 2026 03:06:58 -0700 (PDT)
X-Received: by 2002:a05:620a:170f:b0:8c6:bbfa:36af with SMTP id af79cd13be357-8cdb5b59a8fmr2112596085a.40.1773742017945;
        Tue, 17 Mar 2026 03:06:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm33271395e9.2.2026.03.17.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:06:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add Eliza Disp CC
Date: Tue, 17 Mar 2026 11:06:47 +0100
Message-Id: <20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcnuWkC/x2MSQqAMAwAvyI5G6gWLfgV8RDSqMG9BRHFv1s8D
 sPMA1GCSoQmeyDIqVG3NUGRZ8AjrYOg+sRQmrI2tnDI84QHbwt6jTszyqw3obdJO6KKvIXU7kF
 6vf5v273vB54TWvlnAAAA
X-Change-ID: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=827;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IRck2ORti5++vzKnQPjaqIPGPrwD8P+u9lBXDb7d1Dc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuSe7cRkCS3L/kcR+YheCci56C9WI0wMf3Fqp2
 PobUXJfeJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabknuwAKCRDBN2bmhouD
 119ED/9hfPefOSS/4xCkWBjSPeANk44HAWzM79B4dOlmhOqz5sHDGTTNRwYYvQDfGqjZVr2xaeM
 exGe7oxnvxACk53n/IiGiciCVC/rCT3SQRfnGffQoIEaH6nxy6KjiXXORPjvPZktsH+B7ovH+aY
 XRBvH5bUbm8d0HfP0HaQRRM0evitBqHbAa+LfPUV7j6VhtPzXg5eysCHpAW2DA0NqLp/nETYmxc
 1KJikAigDUpsCNsxZOuhlqjkP1tyobw31GC/cBzwZklB0OX3zl4vysu1a02Qenzf3t3gIKreIWE
 kf0p7yOAykuBmClPXgGQ6d/s5lrwlcFNPfhyI1a5jKCyHam59EhPFC36G/kH1h/eswHoWh3z7UP
 Uue+cT+kuzuXPnNLF7TxsiFZN4EQ+REXGE0QpFZESYmO0P5B5Ot6y+sjHj347+nbj4sRtcsrsvT
 lADzTiIpSMD6Ce4PqN+2cl3aTt41SXFV0Z4WW1WHTWrfxuYLr/6n3gPBA3bTVWP5sxawtmHXgZv
 vfus4U43TJeAyep+jWFq3/vWe+FeUjUqflUpCZ8hnWdBlP9XHnNyBuh4wf4/5IJupm6sdQTy8+N
 hRFeWphc0c7sxvubUwm7/Qi9ZliOtSkvJ+lWff6FzxJsRULo83+5AI4eSVGdeJoLF8EofaSNDLk
 PNn7ugWiMRAoETw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b927c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K4JGPIF_-WF9Dfj19fAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4OSBTYWx0ZWRfX06KryL+qVzhN
 ZaujzRHA68mM5XDQkP3xXzb4S8VoryHrHdgfwFokj8eeIK8RL81Ep46x5WSfUbvdSPapjIAWNje
 TnB2ywmtijLrsMn4uVr8xv+a9tJysnui1TEOywbudnrLyBiIyMr6x19TqNxNY1nWRAbRPHAhl9/
 fpooQVyeYndMkJJz4tAg8PrlotdJClBRB12uyk9VVNaCcwAQmUp2XLVMytCTiBUYkNkLj9ly3qg
 8DuledUkEkkPZRCFZ3AEHIKTSFLQCwfThMhRDTpmr230ORKGKI33JUkbEjTYa00fHzOOnpWB8lQ
 b9B11AupNSQUKg/vwt2T2z++/xOmd0AvROKTzxdgd06Mdo4QkLjeUAqXKFTHXU0FFeWFmTGWQV/
 WMCKVAGer+WAO2VShYbLuxm+gNk7wpX+zb1MLtYbWUp1KC5T/Md334gFzn6u++0pOBGK+kUc/iP
 VCZZTaPJfLelq3s6WmA==
X-Proofpoint-GUID: TCJ29FaM782WJvzPJrRz_lDPheCwiRNa
X-Proofpoint-ORIG-GUID: TCJ29FaM782WJvzPJrRz_lDPheCwiRNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170089

Add driver for Eliza SoC display clock controller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support

 .../bindings/clock/qcom,eliza-dispcc.yaml          |  100 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-eliza.c                    | 2132 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      |  118 ++
 5 files changed, 2360 insertions(+)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

