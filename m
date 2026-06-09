Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0F481FA1
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019169; cv=none; b=VR0LkRGSxvzawlJoYJcqmuy4X6YzEh5fPgiJesODlqLZ6ompPl297UIQD5InC0w0vgAHLHh5ZbQeUk7kPUjHBmg76j15jX3kiyp1B/tGiOnLiNCM0KIuHfGWDOHgohVUfJk6+hYrOjp5UmdWZw5koSxkqu1I4lPv44BYBWLZnjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019169; c=relaxed/simple;
	bh=A7GoQjWhXQ7RHWuKuc9bRKN88zKtGeMVd+Z9hFoM7hU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lHbinZ2gZZ5d8IqGoOTxabQWtz4wkO6RwxMPRG9irqpiJgb6wqp6PlO3jB+KgFamxhrIDK0mjVUKhVPPs1fdF/5aSS3eszB2+aYvE/OPSCa1LkFdET40ug/5krAlICvnzBnC+pTqwxL/TnNigLmKmY2rASOYVWBqf7aThvAXjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5N99VhW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fb4pV3OH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5N99VhW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fb4pV3OH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClTIV2693928
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LR7pUiOtXdsZWwJIp+kELZ
	Y/b8Vn5ylhhfHllSjIREM=; b=F5N99VhWOmRfo8hYr4nXO4+1hNWbXfeop7oRQx
	ppyC73YrnQKMgNylTj8fVLDZwuYe4hcelmZwhSmEoKLXljzvra/OLTo67sf0CIzS
	D0HigTpmC+zFvATysi8Eac/MInIvreUIeWX0J1aV1dBRY8BHKtT7ir3irlMX9SOQ
	nuLA5I94llii8zin02SlRhvfJjpxTlC3zpNO2TCWOUCu0TlqK97TyHJce7q4Lv65
	N4Vad5dHv1guKNv6h9A5znEaJf2oMXhiPuNAL6pKaO0ZHqEx7BxBM3ACOFxxlEYd
	sEQMfpp74ftFJ+MIeg8PjNnnPcRhRd7MU0D7hThhyTJInEKg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1s9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:32:46 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e74781faaaso2991308a34.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019166; x=1781623966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=;
        b=fb4pV3OHH49ir70LcrFQcWgzw03LUqNIs57eL3Gl8Q7v1C98wb5/rWJOomPcm4Rsgv
         2L1Lljn2xRmBxaizNLemvS6DTEKMKBTb4tYmkxflrfquElfCm5wiVqhoMavCvGI43I4A
         1wO2YLheSPW2Do49ePnbHS+3hZwCuz1Sn6Kn0NUFU7bT29Yuu6s10tUkuB+MxZmUTuTU
         /aHK+S9t5MOrQkfHwk1F1Ckr6hgPmnzFxfThQwlM1kjZtc6re5eynUUXeesXzC8LYUPb
         MeZYvjcYWtN6DKIKqcjU2Nkoop5RzoGeSyog4TMnx6LGEDTqJprJaPevPr0817g2XYwq
         tTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019166; x=1781623966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=;
        b=FNA1sNJtV/9WjBZKGfDIT2+G+YwOVU0TVnyhzipUbO25E3nui4zHRxfBo324eOsNko
         Gc1sgeVCVspnGOSyr5PMk67V+LUDeuL8Fhr9M7qW5ylzZPEnXdSG2TvANTdjmDum3qjO
         kqb2M/DCBoHdZ24arvPzBxOczg3qbh9Kjwxkpkh+bM8+5geypipxVL6rWEUylC/6w+3D
         bPzlJO1coQ1qo4DIkqY/wZ1L9Mz92N7VbDoAeWuhVTFKAgQr8e1nOfVn1vvWxiEYECGI
         4k9FV6Ug41YwzSpU4TNdi+CLC5/Ko3rX8oSpgYItIkxvKVz/hNG29m9PoDS3Noac4XFw
         FkBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FrWVtB/e5c/0trx2eQ6RJAeCKOOH46pjJooa3ebHcu2zlRItsqUz1vEWB1VgWH6+6zeb7ScJVE34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXL1uqdoeIiCZB0ykvTr8y9N26QbHF6UoCGMW4/qWHpMDkttc
	ORZ2XVwAAemUVcFqplcH90ajAsUFytRsuzSgwCE/OXP6jTOkgyxD6M/QjVWm6s81O/HruJPhnMj
	Oi82XvRGl5p8rVvk0JUzbVa1Qw7p7GDmkjg3fXwRLiYZ/NwcpAwYAjSEkxHZYIuc=
X-Gm-Gg: Acq92OGg+m9W0Lrn/4FI/XBGpZQm8gT8kktSvxZ/OUZiyfLvYRrU1CTwCiQzeaeFQPU
	UVT0NmoPhVCSGGfVxmJWTdb6EtZqWsXoLG5d5hghWvaP0OvXsnYSqWwadZddTAvKtfz8X5NxSqI
	FHGMdnFrpF6uuCy1xxt0+MgZKzaunodvlleeCXy1Wzza44Gzxj55DPwxLwp8oLe0ocHI1YdqZaM
	oaIfaIpPkZHy/P8NLzcDcC4cfc2tCqWPsvozjSnriXyDKKZa4nzYUsTNpqmI8o57oBnlz53Ow3l
	TlbYm1cuSOn2meypqB/4cEV7vjr1OzbP9+HHyIFx9s0DAU9su40LVln1/R7SvZc4d1Ob0xgEwVY
	UsnjqUllpfjrxMIyX+zNcHIKOmjyoNm0RFLIsITbpDJ1yRCdEuWNRjWBV
X-Received: by 2002:a05:6830:4990:b0:7e6:ce35:4b11 with SMTP id 46e09a7af769-7e70ca611d6mr14303938a34.20.1781019166135;
        Tue, 09 Jun 2026 08:32:46 -0700 (PDT)
X-Received: by 2002:a05:6830:4990:b0:7e6:ce35:4b11 with SMTP id 46e09a7af769-7e70ca611d6mr14303885a34.20.1781019165679;
        Tue, 09 Jun 2026 08:32:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Tue, 09 Jun 2026 17:32:34 +0200
Message-Id: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBAGX4X07JJCKD+efA/DAbZbqSKVLhAN4
 d0tePeyySTzza6CyVticY5W4WmxbN0QID1FArtmuBFYHVikMs1lluSA/QNGdE/QZJq5nxhKLHW
 lctNK1CLsXp6MfR/Na/1jnts74bSHdqOzPDn/OZ4uye796y8JSFBFRYXCDA2pi2OOx7npg/aMw
 xH1tm1fz+PPscsAAAA=
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A7GoQjWhXQ7RHWuKuc9bRKN88zKtGeMVd+Z9hFoM7hU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIUNEZUAwYJ/GEmRW5xyUdgf5U4Wc9gtJxLs
 wTmKqzs3GOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFAAKCRDBN2bmhouD
 1+OnEACKy72HGcg6UVD/PLQ22Yc8fvpcEZR+fOK6OGFnbp/d7ZmOTh2mqm8iAhkh0o/a50CujSO
 FCQDHuOzRAfxvS5S7doPFrjPXvES0uqQV/CykC5mlg4JiCW19tYiL9x8DSp7cMabSgOWZeGpQu4
 5VIiGZ1UZjiO5mNN/UP7riOYSgAfDEV1S2jCrtQYi6HLoHRXJZrOp07wYeuyIXyL8eCZev7fNP1
 4jEVw+QX2ObuRyYmXRGgNtRD6TmtV39aFvnLpbLWthQaloxj6d3tolvg737enSD1ohTnPi4lU5k
 iZGo7O3NNRyXCfa2F7BN9EGwcG+FpeinNwcO6R5FVQmKmvw8d46xjZp936MxZypIIwBDSTuzY04
 5pkXD39UBVW9MZ244of5roC8dNfICdR7bd0wEU2G0rXGH2rKIvoOl1T9Tjh2j5C8OaQhMefmhra
 T7AtKgnp3nR1iLQG0/IcWHmEFUwSs4xFisuRvjM9KaKeN0iqRVriG0YsqsTXD3N+NMQQP1LP4Yi
 LTscdd5IGyqoKwJMcyk/fZrawJhbMjB4MxA/4VGlSfsgpY/1om80F/fDY60XOE5DpXzhOPk4ou7
 2CdTEnySEw0jrWGrarVlAIVQkIpJlw5zpahFA9CtR/cWlCD6NvUCnuNPeLJUMEEZkEp8Oh9FrQX
 oohsHQUzuv8hiJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a28321e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KTTc6GEDVJjevZXz-osA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ugpVwpAB_TpM5n9-ojiyNKvnQfBuVa5v
X-Proofpoint-GUID: ugpVwpAB_TpM5n9-ojiyNKvnQfBuVa5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX4zms/eVYYz8Q
 kypzpSeQS+Rpq3t9dI78/KJHEcnd47JNDTYxd4R5chGo4XTce8q2LJ2SE2GAOX978F58VBkkXaV
 f43oM/ksEMphtnVF4+xdoqybiRa0J1m3pr97r8ipyzUDVJ30KNBha8S7QwclGGt1k89x482RVRX
 fdxouTAmd4J/xqQ8Xh0uISAzsyVb810FWgyYDw+o4ioh4QMZSjehIws3s0NDqzPxaU4ojTJj6hk
 qXoKdsfNT5kGiJOUjW/ozOu/JG9trb6WvsXvqr9439gNpxu5RzFyUXMs6QvAFFPEOhGz+DtDbG6
 0Tn6kRCLoAy8CNT42XA5nbr7IgJtOLLGW+PX6Wtt5iWGVZLH+cdMT7ycQ2nDzkW5uxWhx+4xQf9
 29+ayDqmFnVsbzvOXyd8E2pBtX8M1TsAZMuWtym7Cm5Vk0e0Ht5UcUjZCKK4IxLrdDwonKrrSWu
 btoEhElsj7JzWTo0sGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147

Changes in v2:
- Significant rework:
- Add more commits, also for arm32 drivers
- Split defconfig changes to separate commits, so clock can still go
  this cycle and defconfig later. Also, less conflicts.
- Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
- Dropped most review tags, due to changes.

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm/configs/multi_v7_defconfig |   9 --
 arch/arm/configs/qcom_defconfig     |  14 ---
 arch/arm64/configs/defconfig        | 119 -----------------------
 drivers/clk/qcom/Kconfig            | 186 ++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 142 deletions(-)
---
base-commit: 6eeab89909ff9d44745e884b65c8e0964a9355ca
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

