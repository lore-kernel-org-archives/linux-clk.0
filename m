Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA43655DA
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017282; cv=none; b=fxDaexrhxpedWiNovKb/8KnsfSkPQu5GHHCW7rx1MQbaYob5uws2juG1i8hYJwEq82q9WnhFx4RTFCyeLJDjg1mBqf+wngvPw3uXFamSrycDt0KeT/7zsN6SeuOU4eQW3IucO4LZkKgZGz8kA68ol5XdgGPILuz0WU6zZ3Q3WeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017282; c=relaxed/simple;
	bh=r03mqDr0zXMme2eLh3UMMNhL93L+E55I9me18xI/3lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zyt+rIaMru5i0NZHTnQ0ed8E3WZ1tuNkmwZbbZPn/f43fvvPlcmJHvd6DZ4LT31+AY/vz4JmOXnhBSG7jptKEJW16beiD0l2A7A3wBg4kZbL8NxvMKZMOEciosl4+ky6mkLCZedE2vory8tQEL0DFN1Gd/6KMoUSi82va4ipN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRs3y9/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlY+4BtF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRs3y9/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlY+4BtF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUeMb866100
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J4B2q8cWXeNVw0rOowPJSU1IEMVAe3tvg7ghlT+Np4=; b=eRs3y9/s+DwWhpag
	uE64q2zw8U/hJZgL/Z+JCdlQy+uS+YbxaoD2nk83h++dLBzwjSxi6P35pYWRXvrQ
	k6Adu7T5NRC1ViryeYnMNA9wxDaIrutaApw5sK6kB6XvtXO44pNAqUx8kN16ERRK
	P+ae9NnFxcQSkSeungLlOycvIgARiktYjOZzJzz6TAaJYvgt7AGwSPXR0QlnQnru
	/s0bA32NP3TIR3KYZapGbN49qEMkLlZTjqxw8E4DRP8DX4c8ePFVXmrVxZljKRYm
	U4snvi6m0aKWIoXiRvna6wOOYgopjYvggtKHQCpuSm1P6BTtCgYJW/YG9U2Gk8Ui
	6Pmt+g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-846f50381a6so1519865b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017279; x=1783622079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J4B2q8cWXeNVw0rOowPJSU1IEMVAe3tvg7ghlT+Np4=;
        b=GlY+4BtFbnURQyimaU7s6Dtd6krXsIEuLgGf45d4qVjnc6jxPnEh/dpWvJllCIibQQ
         YWT0QAlIJRO4vz2ZAAcWhPw0z6QMOYRVnSRCGIu9wfvyoC8Ze1NdCPx5+EKWQSurNH2a
         JhdpdVGXbSwZfHM7iFC9uFhFavGUrSn6m5uBStsfpUmzJSu0ohng4WNxwjpR1tmUpviO
         LsNoCQTOg5np7iHh7eQ8o6IadKIDFef0oyjZeDD/6tpiiQFTuKltS8r410khD6JI3luh
         W7U8+u0C0pGrpY8leB2+5mTWbnDq3oKs1BEV/6vGawKM/tKcK7uWXbiR7hu1phfJm4b/
         nySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017279; x=1783622079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7J4B2q8cWXeNVw0rOowPJSU1IEMVAe3tvg7ghlT+Np4=;
        b=pQifk/txUtM5XNfIiOLXTezq5P8Rr01LBJ9msYTgHTTblXXR3chWOHBI7TK6NXV1AR
         bOk7r3shqW3mi6cqYKZ2/ePN25bP1MgqdD0xXWhootzTG22iWE4VesuKbvjibKP8lVN+
         Een/D9sOZU0wZgsXlW7BsmB3kPt+nK837oqVPP2sOMYA3LvUyiT9MhlguCCKvG1hNhDB
         ojKGPaFjs6E3DxXUxxUkl831unTw3Is1NtXa6XSG2vOLGv9LuC8wWkQxUp+pLWwD1+Rx
         TwzK7fSTgL+QJ+I5HFJf6vHstMdQfPSbHC7zawv//p6rt+svxw5u+ISYM1N6PuX5UdbI
         xNKg==
X-Forwarded-Encrypted: i=1; AFNElJ+TiWmnxtrX4cyGQ7WwTFhN1YZr58ige6CJVyFV7K0BJ7srhm9tZ9Hia8LDbeGX3Kl01uy0dV6PfHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmyAYUKoqjLjrN8qBZc892wvjWVDIvuh6wKcwA7Zd4x8aA2H4
	5lvox79TtCSUZJ5jVB1vXfEhba8wTe0Jn/llYSg96Cm5yvLvcWT1sXjgV+9+JSOp4DEVdYlYd46
	pbAFd7LcgQ5n+7UOEm+3IoUUei/JCK4olkn7Qyj2329Mw7R4i0HtD1x+Q2GHPz44=
X-Gm-Gg: AfdE7cmgQZzVyTC9BBgow654GrnH3Zj8iHOYFBw/3l2MgzdAlmNt+kENWWTMuj5De0W
	ZHvnd+eoy753DbZ2gVvpD83ktk7MtsVCLSp0M/WrxVqxEBFyb4B0Ya3mBomJFlTxN2gM25RaZmC
	Ej9KXCQMghve4yVZIpA2/FOJgEnR4vY7ok/GNP2q9aMCl385FlgFwEUZtZiuBnKXN7CtmLIssB/
	kEVeFW1CIa96iBVXXAX06RsiMDmdT/4SXd5S3wk2/F9HzXoRyypaV0OKFyKlZJhootryyVxCbK2
	Sr9sGwrgsiD/VNOWm/q1ZiaCWjHCqc5iFv658MyqgluxuL79XFwBPaAAmTPjLHysgwFFma44Vlo
	oFl2aWB/vukBjNS5JYHdH0FIFRNGgYk3KH07NlOJC4g==
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr7432157637.36.1783017279284;
        Thu, 02 Jul 2026 11:34:39 -0700 (PDT)
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr7432088637.36.1783017278666;
        Thu, 02 Jul 2026 11:34:38 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:40 +0530
Subject: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4TowGv337vd-EQGNEXspkC96HVIXnqtZ
X-Proofpoint-ORIG-GUID: 4TowGv337vd-EQGNEXspkC96HVIXnqtZ
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46af40 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CskgkK4JsQByPEGY3C0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX67HFcWWUCzIx
 ZmJPfhKT4prWNA0TS2jKPvTvo/sIDFE9xKCXLv/oR4FNp5qzrRCsBwIRcPH3GA5PBC4DFsPc7iE
 JX+Q4lbhDUs8mSGuIJtEji1lgqndKcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX170JT0uQRMmX
 fSJTzmX4wuOmcbxHROCKrEzw5gqOQqkEga6Q2hp7Me1ZI287USsyo1GnzZoVPHgbNCWkUtnyW2W
 414En1zG8eMehZ2z188kl2eohYxqjoU9BKFn4zw8uHRDqFqfjRnXY6uA897Z/1v3gz7Ls4bykEC
 WE8zQ94S+6teC2ykoYdmv8hzmZ+foelaOeylf2tXYOGmLq/PIKn7wPUBr/JEijg3Bkgl2JxUbKP
 Z5N0ghxd6MtnH8+0XmVwjzCOgyiiGll9ouoAqz7vZh0xQZnJM6Kw7bTpax9CMrWdmx4B1/wZQI9
 I2EzwZXzWaFF+ql7RAXze78wGPww85hHTI0ZvnzRhRCdjDd/eBqQriiyt22L6zMBwLOVAxJmPMX
 zu8QOcZ4I45ldTyYnKqoKxa9MYNNgyqQEXJxToZHVsDHakSfkYgxCl6KMxzYL8ag8PvZOzmO8y+
 T05A1L/cEd9cseyqghA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Add the missing power-domains property to associate DISPCC with CX rail.
This is to ensure the genpd performance state votes on GDSC the to get
propagated to the CX rail and to avoid the rail under-voltage conditions.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f1d93f86d0a62a813f76580362e850ab847e51eb..2e8a8ca9b9d5f40fa102862b5a93dbd1996de8be 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2203,6 +2203,7 @@ dispcc: clock-controller@5f00000 {
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
 				      "sleep_clk";
+			power-domains = <&rpmpd QCM2290_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1

