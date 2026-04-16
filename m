Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C773738A701
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327045; cv=none; b=SVtEr4sAefPMbnC5U2kLZ41tjz8H5CCbsVun3SBY27PRAbeXYlAIUrJzNFIZdQFi3mBorPAxqRWWCeUEv+5A//UolvGSg7VOSfTQDHrIWydvWo+WeMAJwg7nBEdedKgVaW3aoibKG+zdrlzVctpUjmpWJOTRx//a15b1TR3HghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327045; c=relaxed/simple;
	bh=eEkY9AoK3+ITu40bVW/G5qh06mJii71fT1hlMtShNvM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rXWgBubqki9/WqePfdgdHOPZNo6bbYmDOKamfsGXipnzcv/Sw4BNimMVksdSrzNU7dcGZbDEE5hEStNQcK/yIpCy5Swen9nJ0y/Ez8vJkipMjURARUEAEagpA5sICWLmBfI7euGLnm2B55xSlvrxnK5NZje3C+pB6S1o68dFpPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkZBsCaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6KMIZSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkZBsCaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6KMIZSn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2Cqkb1792404
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kYkN4Dhoe2kpoPvfNtItyV
	vMnur9ObJCB64LDN14BEM=; b=LkZBsCaj5D3kKHPEYk/sB/PiJSroyfD1H0Mg0O
	cmr/e1IHMLZdlZ9qC4PnQf5u1ZXLWJTwONiRdGphTc1LmqsMgg3Y/sn4WDFw92sr
	X0L+2qTr8Zs6e8+8xc/xgRnJAdL22DAFz8Ajg5oBHY20cXoQj69s31nj12+FQ9uv
	6TfAPLHg4LGJTXr3+yG3qOF/k7QoHgmCCcFnHkI9fY2+VS+kfYJG43Fm46szLoKW
	EY+7q+g6O0AVkBT0bfTEAMl8cz/8JcUsIAFC81CKIz3/uZKsCNHabrQuTLC2clBd
	4vCwIWa2rMmJc7A2xisyk78jZM6BGKtRkPbppoDWsQ8SSiSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd5ptvye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:10:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so189346101cf.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327041; x=1776931841; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYkN4Dhoe2kpoPvfNtItyVvMnur9ObJCB64LDN14BEM=;
        b=C6KMIZSntVCRW/em3Eb7JzCBgmhhnrlvo9dOSkIexvJeWpkUCL2aY9KQWsZI/bIFFh
         /qQHBqAeTkqPvk+ck3wLcjkK7WzcooET79ca6dx/UekSHm+9svLVS39fgNuq64fcKW3g
         7LFbafACB71jjb3c9TQqHo+QcE1F4EWaCiVhcG/SiR4KzxCGNCoPb7C5J1VC3Xl0ilwa
         Wd4TTSDJaxZZlXg6FmtFKDAZYmdkxU64hgAdwL8JCjJQR4e8RSMGaXmHuC2vMstx3XbD
         /fSq3OEvmGiN/ILOKLMgcVg4RxD4+EOTW8twqoAE8PFDEMYIaw0oKuiOjQ/cEJ+bpau4
         efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327041; x=1776931841;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYkN4Dhoe2kpoPvfNtItyVvMnur9ObJCB64LDN14BEM=;
        b=NgXf0QodBm2QQQVTU+YbgOnS3LEg85Pynq7m4cx0EwOfK0SAsasdviDURwhhpt4kPI
         x2EsU9Lx/o1r/I6qJuC505bLi0KYaYMGt0c583hNhIRGVWyfP4lsh1e/T4FYtEhZqKFK
         q2R2S0qoc/8Yq8D36oPZ7Q/8Iihuh/rsBS6s3gnLyVY5whQ/Qbzpvh+QOYGmLpegbJtS
         b+aqJiuxfFoVj9uL2LU31yoB1NU/ihKtSVdEtQky8HmXPcVgmTGRfvAbOj0jKn6QCpG5
         inkmROy1M8ddCD47/FIznzQ8FhO8SUYLdNwCABGy15c4klmhpbybW/2Ri90JYvRrQRUZ
         vdcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bz6iZZlAEocM/92JBlVg81Aw2yZyuiHxY6QpeeV25L5TjbwOidTSA721n5oHGkjhectndk/Hvg8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL5+ifBe/GaE2OJPyyC0HMWD7Z+xayULbmJem7qsUbkbTQwFsp
	86/MPsMm2Yv5AIw0b+E3r/sOb/VeplnSL93cJjyhUqRx3PXzUZuj8yBCiHgjSVAtrBY8eMLZOzS
	eCK+tt+aWevFY5t5MY+07jrkpDuIXeUvdS6iaFVLyLP00EWd5Uy40k7dVdpKjGk6+nvxcmZQ=
X-Gm-Gg: AeBDiesFn5z1mdyj16O5H3Aw/xFN3q05uxUXkwNBjnMDOOuZAlKbIkqpCNJiZKQ60p6
	mejokcdIwlyLEDf/Bfje7Nv1h5VZejrgueLDvLv0Mm+aDDA3NOcKWHXa1F+YAYt43bjI52Y6fz+
	w90j0w3U6ARG8oRNxeldydgZ+4JaRHU8yRdCejMiZEsZ2SbD6lBwboJ3v304X6npvMneE1T4CfI
	kfLQG4x13ruqEY0QqNEfEcQX+5DZdyjpiFdM2f3A8a7Yz0Hl3wO2XOqGoZ2GEUs1YBwhZHrT33J
	56Wd/kbQV4B5QYZogxhf5tkoKCZBYDnqYHW1f83QSqYSiFkGOW02EtlvXU6tHlGqgEbdZsI+8x4
	0U8Mm7Z44GC0N6eT6rLihrGXNASzEOHdsd9SAjWZNk3xk
X-Received: by 2002:a05:622a:2616:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50dd5a8062fmr365158041cf.4.1776327040905;
        Thu, 16 Apr 2026 01:10:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50dd5a8062fmr365157761cf.4.1776327040458;
        Thu, 16 Apr 2026 01:10:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add sane defaults and drop defconfig
Date: Thu, 16 Apr 2026 10:10:28 +0200
Message-Id: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSZ4GkC/yXMSw6DMAwA0asgr2spoBJRroK6AMehbvk1BoSEu
 DtpWb7FzA7KQVihTHYIvIrKOESktwToVQ8to7hoyExmzT21SN0HvzT26NjXSzcrFlS4R259Y8h
 B7KbAXrb/s3pe1qV5M82/ERzHCWJjsMB1AAAA
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eEkY9AoK3+ITu40bVW/G5qh06mJii71fT1hlMtShNvM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl4aQDFQvvtAImMK9Mh6ycVD9ahz6jx8qOYX
 hP42V6cK46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZeAAKCRDBN2bmhouD
 174aD/4te32fxMSiZzteT9r3Pp/SLuBsafL0O8TKGESWni9m1Lp+VLjcRnQSxLymEIg8NfduHra
 rFysxmsqPyQxC879cKji+dwsDsXBpOFnhn2Z6VS+Ymz14tj1DbOk75vbsQEJI3kw0pPBBjvj0ot
 I3/n0NaR9hZEQd6r7M9Ne4laLQvMx3ahdECI6LzgEHWFaZddOcPqA4shAzgdLpLUBgyspVJaQCQ
 1A8ayKNHZ/0bOXdQDk2yMzColK1p9+e/AmCqof+FTnamULCKXtDE5GjFF8EwIOHALNoKHhsydvf
 gPWJk8PMOBMFLuWKZ5dppH4MU56lqr9UzDtbD/iycPIXlTUrtIDO7d+sQwcqa/Ykgb9aCyTdn+h
 I/LG46CJRGdfXdW3PABJq9DcqwGPlNcwvLvRk1Ml6PK7GbnuXlMsg2g0bEOItnfWCzTNb/sVg+Y
 5AMtaZCuGIMSsG2h7h05kovh75fh2CsgbT1SAdAGIIYOgRqlW8kbVgBlchFx0HmP1uaL5mqOPdq
 C1811Cpr634UWQYZZ+VS9DezuuW8/x0yzHVgVQNJKbsgRDvcMSnKI+RQR+Db7oxCmyBviC7CcxY
 uqXAERJH4tEAElN8uLrWWoKfcBY4f9RICbdB8Ml+RMpjE2cb9hAV9dJdMzzg+dItaqoXL9/4BKk
 hgXw0cE7JyU1XIA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: GKSLsJLR9X5RZa8Mkwbw2YBThzjqVeNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX6kbooOmrvnkQ
 o3FW4DLa+wdtrpIlKO7yr7IK7AjmfXN7O0K1n5RrAzqHQGIhZpK4ZZdibpW8IniHJ60ajNruQ7u
 OlirFUF73GDVLcVYbYrweOb+1+97l6aD+SRSq0DwCZ3kbqCQ/l5KFKUbfCwibQRovN9eTJ0KqAN
 WBE55eNTRsvwAhMVl4LNIeB1bxx7TnIjXSZb0jC/lt9/REgiVs9dl53BuiBPq948xKI3u8t/81r
 U6FAY+3MwKC5/37ARVObHVgZL4yeP+6pXX9yZc1clfnJOwLhPQMda87QMgKdTq/orFg/udT3sjY
 3SMFhDRjqdMQGsluZXcytQHOO/tCquLla6b9g+HRNXJWUJ4xYquDqwsv6j9suSo6xnso9EVlMVr
 6HWzqiyEIg8kGTf7KB+yd1TNJwmDcraDqn4zdjLEWWdygoapxSx2kT1bl6grGNtiY6xjWWXRsKm
 xroGrXX6wvJuo1VbRQA==
X-Authority-Analysis: v=2.4 cv=AcmB2XXG c=1 sm=1 tr=0 ts=69e09981 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KTTc6GEDVJjevZXz-osA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GKSLsJLR9X5RZa8Mkwbw2YBThzjqVeNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160076

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Make important arm64 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm64/configs/defconfig | 113 -------------------------------
 drivers/clk/qcom/Kconfig     | 155 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 113 deletions(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

