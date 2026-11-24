Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527028;
	b=L17z07uDcuqqL2rq6d2wBj7pv6B7j95gA5nKVlO9WLj97w3Q50NU/zGuwKCEqvt4wqkx
	 f/6vP4XfTxkoTRuyNG1H05h2t4XPnovIjoQXkxmu6f3X/oHKxMKs5BvTdyQSnnFkdDdcx
	 bGYRnc83Dqgux4jclEEFSljfG1miHLB4MEXjGAbUJ6LnbsLhexxFnV6mWZ+GAY6zuZWTs
	 4G9qRY6a6ntxc9NPj04PF/KFo5oypNEf+XKOsMH+1/ZC5YDJ+gs1pihqqvtmrEwcjiQKa
	 bJgJIz6P3RDt6GarWmf3KJe2YzD5vOdPJ8xZ15ELgiQGCy/H/BXvw2n3fCYbscvUIxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
	b=ZfgdRrgPqSKt+deeH9h4DjMD9VFJ2X677qK17csTQBoS8v5r5uRpok/l9MD55uzkYPoj
	 NYRk/JcyDfB+umOYZrIJmnXYz0rokiJuJcozpWJsIr+PEI7QDix9vIcMmIxvPFyED5RFv
	 AfYrfslj2v77OGRFlawHq8sFLkv5VBPZG7l8c/6FzVzgc3/pOu8q0JQh3OW0fSZqqtn7i
	 34SoyniqKh3jkwWg/SMJpMKVcmpwUysNaq5zv+JRH8bXo0cC9HExyqeFJ2in3RW1WzAf8
	 2jnbID6Vl/bE2EHuj9ZXu4Pz9gqjswYV0g49hT6f2DCKQOp45KUL2MxQVTY+T5m7INQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJnoOyXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGVHiUrY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F5606A327
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 623F5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJnoOyXv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGVHiUrY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuT7E120264
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kwhDsvnO/o8qcFU8scAsqJ
	nEmyOdONiJiRn/s9wT6pA=; b=RJnoOyXvdvN3AmcUH2C3QzCBXAvrSdLfkYfbw3
	zluG3moIUTe92tkhtWQAQYqj3nxA41sevfTM8Y7n06cckyTGsA/StYeICrLmfLe3
	mPFfmDI7Eif/dNTS26sahHEU4IaEAHm9ybz05y3Ag27zazdQIWpcxuR9yr34Wj4f
	lgXhuQIO9EbxsJbpHOj1xSFWkl5mVm4JqQHoU/Sp8g3QzYWbnd0Kr+pEd1n09UEV
	w0ehyjqh0B9XqSKRUEVJuISMvZRIZQTX2P8la3PN88o9M0Bb6PBz9VsRcYZ7MRiI
	Cc4PGXj2pYjv2qOUPHjU+7aQkL80df1ui4ftxt8rWlmdr93A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f39ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:26 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b30b51e441so2225157b3.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527025; x=1796131825; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
        b=gGVHiUrYk+zXFr4VpaDpry6iM9b7XwlRTGClBnW6Drcs4s67lKsloWTCnVK7FGhMKz
         J3JHz0uTc1CUK2pyhHtdPr3c1FZBzYJRKxmv1c5/DvczCLT2RZnmokjidnCZJqeXHP3m
         UfTWo5WUumCmIlOEBw+CDNTw2nRLIyXMZHrKU5ZuiDbysp1K5OPXt1HYawEGwgFwMB9+
         QtxcyB0gyFRx2Zy3Puu9D+SfB6POhqh9gOMJKa3exvgodF6RnX34bY7BiiF999mnZVBd
         vcGyo4A2EoyttHClIge+6YgsMHk6UqXTsQ1hSgLE7IqiVPZBE47+t7xcnLv++H1H4hjW
         /XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527025; x=1796131825;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
        b=VSyo4e82KyacpSPwhdJlV6hMxY/jy4H3ubtUH2e/Ep122LXRDr1d1SaYHHA35UPku+
         ATOvnIa3HqH6fiDfqBhAgU7xHeQh/eGgDg2Rf37MnvRd9nrIWJXPLaT8Xn+w4YfXKJ18
         axIN9GNpRRcR1UX4MhtbR8D/GbRRelW5amPa4ywssU5wJyhGwY5y4LWlzqguCM4asu6R
         btEVGc3nQyjrJdSDCicNYB0y5dFDRU+gn8cClU4+/YFF6IA1CtNX9vkQUCrTFuzPxmtL
         vjCLab419w86Gwda/fFCbuj+310jw8AsfKPJE5rKu8lq2G3yWbCs8q375MZDSQ1Qenom
         HGOw==
X-Forwarded-Encrypted: i=1; AL+hErE7mPHeQLjQQZeoMeQD5Pc+vhcQyqV9qu356uGQckJh2bz+QRLSuzl/GUFDrczhaALXELcFIDd6Ycw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z0P7ObBEVpAPIXJQX9ZxE0FyqFY8Vzkufaoop82IFxD3X0GJX
	96XHgZd9lf9+3ax3lAIey+y2SFDFqioaZeFeg4E1DMErb0D7n88Tuz0NgZJDwo4aM5idLOYziKa
	nsakHIN7FAPxjy0+P8p/CeodMzEGZwLEhJEGcqvXUspiu31rKD7cM+6Xkf+R+rAE=
X-Gm-Gg: AZFdTZch4h9s4sndTCCTJ5KTr0ZWJOdJ8X8ujC8QjRqQEcp+5mtfXZZPBGUSMhioecN
	d7n+YB9vMg1Sba+MvFiK3lwnsNVtfmH67BgPWCdJRnSL1ZaCWH8eYG5sPSW8cjk0OfbP5I+JPCA
	9OzYa17ojtGOvbcj4Npdv9vHrgVjT5Xq05uX4yMwouMvrbpqUGdj9kuFiq61HwLrryLZLPs1qM5
	haSTc3skevJHJQ8LCZiOpfHISwNS4vcQNMlrylks5K25HsnlA8bTM1efdcCS8QMSu2zRdC/vxQF
	SskabeXzTJ/GvSjUkvesMxbBjpPpI1EQskeORV4KDX+DUV/onypUtzy0TamNcJM50pdRUKs8kwh
	Suuxp4+5jrADEXFu2SXqiYXFPsw13yA33voHqXF6A9adEd+DJzOxyPQepgKA1n7OOePbceAA/uI
	9nJ6BSmUo=
X-Received: by 2002:a05:690c:4006:b0:8b1:beba:bd5b with SMTP id 00721157ae682-8b5204d9c46mr90521457b3.2.1795527025330;
        Tue, 24 Nov 2026 05:30:25 -0800 (PST)
X-Received: by 2002:a05:690c:4006:b0:8b1:beba:bd5b with SMTP id 00721157ae682-8b5204d9c46mr90520817b3.2.1795527024381;
        Tue, 24 Nov 2026 05:30:24 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/3] SC8280XP USB4 clock fixups
Date: Tue, 24 Nov 2026 14:30:15 +0100
Message-Id: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGeRBWsC/yXMywqDMBBA0V+RWRtIUl/0V0Qkj2mdtmjIaBHEf
 zfq8izu3YAxEjI8sw0i/olpGhNUnoEbzPhGQT4ZtNSVUroQ8xTIiUY3sl/YFr37fVlU5UPW1nh
 vjYGUhogvWq9t293mxX7QzecL9v0AxLgVk3gAAAA=
X-Change-ID: 20261124-topic-8280_usb4_clks-65307baddbaa
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=882;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=fAEcrKvCtRTvsoA/LdfvhqS9SoTGc0oxmz4TVXpFLfQ=;
 b=sUVSEdiW6LW3cEX5GTNTsan8jIqLwtf0zAxRZWKSFh5Y01XN+RFklBSDnkrRLGyUT1SMOC9I8
 WauilzOzb2zAdNtRPW5Cmcg0b5mZZEEp7cXdmBw+6IF/UsLcZpa5C8e
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfXzxSYoZyeIfh4
 n33nP7Fxk9c9MKN4XGnfPikimn5b94zjRrGzJiwjrIwEi2TnGZCNZE4LM99WTGdHSWVaPn+i03V
 cFMziMuw7ln8svZyT+5BsFoEEABtnmA=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b059172 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pt43vheFiXy_iBxo0bYA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: UA7dD0RwpnqqxJQIv1wfeUxaywV2huum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX80y+iIcV59Fa
 XFqyRrZEnSxhyLZNdvzx2kIKHh1LHkQYVSDt/ZIex4qvce61IRYB59KySv2nOyRepszBt+eKQ1y
 Himul8z70iLpLX2tHzhBPpdXxbE+tm57vrrYElCPiNrR5xF8D6kgzhZXFKgVBJX367I6PlwZmEl
 gRhv51EPNWPypeL2v1hyCZ/ThH4xgDV8spz9ePTeuPiWIjfhLifixRIe+P9hudDeqFPI3QqQHWG
 5eUsTpAFGdiPBKE9UEB6ITL7aPDNS9MxqZvFw9BLQP0wuxbWRF8ZRqidYQ9st1D7nOUG/X/iJ5L
 UKcs0EmfvNM7R5aByqevNaWJTgZxcW6RepdDOcy+rr8MHlOk/axMgZaRISy93hn8ixSRfMKP15z
 gtpLaiZNV73PlSZMmKZ12BYtAEmFAQ4bSrb6WxDSJB7/e/g1mKqHPvIx8ZWfb8THnGWBgkHREDv
 Bce4yuC6Y3XKBk40XSA==
X-Proofpoint-ORIG-GUID: UA7dD0RwpnqqxJQIv1wfeUxaywV2huum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

This is an echo of the Glymur series [1] for SC8280XP, as it has the
same issues. Not validated on hw, but matches the docs.

https://lore.kernel.org/linux-arm-msm/20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4 MISC resets
      clk: qcom: gcc-sc8280xp: Describe USB4 MISC resets
      clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered

 drivers/clk/qcom/gcc-sc8280xp.c               | 27 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
 2 files changed, 47 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261124-topic-8280_usb4_clks-65307baddbaa

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

