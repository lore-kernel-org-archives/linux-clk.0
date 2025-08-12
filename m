Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B511B4F0E
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968313; cv=none; b=oMkN/wkJHYNAiPvLKUeYID1OUwqDPLUlwthdhVfCQ6uufqqYfjsTxvBKSUWXysi7ID0zCHr4Hvj9f0aXW5T4Or4BaEE8xt+/UgSG4/66+glQPNB7mdZ42BtW5OWRsIa5pZJ/38yccTFR+pLTzgBDbJrR3izEYPGkqiy5KNvZr2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968313; c=relaxed/simple;
	bh=Mj/gF/9fSY0f+IqlOycaY4NkWN1q9QsT0o98LvPFuFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o3LjpOyfTtwvN/5Vm/P5hkt74U5vA3lB8z84cTPgluZmhgnd0lI1lDqk3JD7B4SXxa4J23kAAzY3BMkTsus2WtBpFohqWj72VRUFEm4ts6exoJeUIZUUxkuPlwG3INRI/GdjercPOSlAz3GPJkA6PAxYWk8t+lNw/T2WKVK9GNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkNRuuf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkNRuuf8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJCwMu007754
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BAV/apLO74df1jngYHBqyu
	gvW7f0OfhZGnzLMbl9/qE=; b=YkNRuuf8WmFB7xXuqOHsLC7BXFkIjdhdVTPmGX
	MVVaqNew5Dwv1yehOtLa7dRyKt5v8jam/TJAQl7bcKVQuwmrO2I8fnhxoWCPZEeU
	qde1hSQ2ykvX4YKBbF2/8AYcjGXgfYgCfuae7kTaDxt106XCJfYWxfCqO2Zln15P
	iG3WHR9R6HNOoaZgtWEBFVF0qBCg5qNx6fGb+K7lNNl5CMtC6om9Rk2zlr6xYc5G
	5EbUEgmcC2mLBv/jKEH5ybC/l9Ai0gJ0Zvz/OfwW0OlHYxFVJUvyLVBnZJnkkO1j
	d2A3CzBQkkN9lzFfxmlHYFJHowRiRIAB19XQ8BkCgkcryXqA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6je1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:50 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-30b7d09bb58so7605970fac.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 20:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968309; x=1755573109;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAV/apLO74df1jngYHBqyugvW7f0OfhZGnzLMbl9/qE=;
        b=XGoSEbV5cW/toO37IvyB9nGMToXGwFBzUf44N7u9pPvbw0km4m2x0VStUtP/XCR62i
         38RPR3HIEFsTbn9aymEEWRh+5yQssn2HnrAcgvML3fpQV1V6945SBfBYAEm6ube4hynb
         7c3PeUs6DU4oE3tBqQziePHprsmJKzg/JNVNnv/z15VFoMW8tAtKLXgiAsIDvTcfoCjF
         AsfV3vLI3J79rWykZmMQFV5L3XObnqg9nEPXhnnGDduZPEsPE+iPxk4iOpIoVPU9pY8Z
         vr8xz4E2nNuMUjZ2gRFXrrsB4UqF4B4yq5d+M3UnZ/ESUe7sNhCY+ePub674mE+PsWpC
         V6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpdQjHF+OBNZv98vOwm31HLZ7wNMlHa4+oaId0WP5OJEqs/zPYK26EEIhIsymJ4rD0jxvIIkU7J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBLo6OXgUjXQbLFbOa9bP08YHO60dz+Yzb2xCkuVSj+kE3ls16
	KEtBKxkMnCX5vbnNNL8MtMlRUdAESl2j0mvQFn08REiscZlZobdYm8Us351fN/breN511QMdqII
	3K+qu0f4kmzccPv4beo0aJ18womHmPKyx3uoh0b8d2yku32sLJXJJc+d3rdz6Nos=
X-Gm-Gg: ASbGncvwTzpGJP2vdB5D8S8xEUtv7XE9ZRKVOacWSPjWErZ2/5E8fGR+5x30EH7bpVV
	tN0DYNjiIJhwUBbcGoWMuRCJFhmxXSeDRU1WvLp9ZxzKLu3B/FojdaKa9VmY7EMa1fJuvAx7NX3
	/GiMmizA4XFdyTuEUwTjum0gyRnn36KK0GalLqnx9FfY4eQ0uRPN/rSJklbi1e5oH1BdW1BSYzU
	VYPNA5K3NGNwrNJuKELvS2rTyfvNtQYwUI3qr5S5HAXePjoOQieZKK7acla77J0fWwVCLhTWKFQ
	o8wG/FwnZIJnCMKlLeeroi9UnwPYq8q16J9gt4sSZxGreC0Kkzxjqztnp/psxjTuggwtbNbVM5N
	0KrtnuYBZObNCWEE/cN9gBWnmWMA5qmsIugRQ/DA=
X-Received: by 2002:a05:6871:1d5:b0:30b:86ed:a23d with SMTP id 586e51a60fabf-30c94e807e6mr1136990fac.7.1754968308924;
        Mon, 11 Aug 2025 20:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzNlsbXJxq2ZDPixpYLAWXnmxJmMs7DRwNxWd4nF+aTiZVLDZe8psAbaqwD1L0gMyjxQUVTA==
X-Received: by 2002:a05:6871:1d5:b0:30b:86ed:a23d with SMTP id 586e51a60fabf-30c94e807e6mr1136982fac.7.1754968308604;
        Mon, 11 Aug 2025 20:11:48 -0700 (PDT)
Received: from [192.168.86.68] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a717f0c9sm8174531fac.13.2025.08.11.20.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:11:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sc7280: Add the MDSS_CORE reset
Date: Mon, 11 Aug 2025 22:11:32 -0500
Message-Id: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSwmmgC/x3MQQqAIBBA0avErBtQK5SuEi1Mp5pFFk5EEN09a
 fkW/z8glJkE+uqBTBcL76lA1xWE1aeFkGMxGGU65bRGCdY4hVsUwUxCJ3qrmthOzpvQQumOTDP
 f/3MY3/cDmjfWc2MAAAA=
X-Change-ID: 20250811-sc7280-mdss-reset-a703d4b8a2c4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mj/gF/9fSY0f+IqlOycaY4NkWN1q9QsT0o98LvPFuFE=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBomrDtdIUCXra61pec7tBq9aXq9jN1LrBsryBgp
 W0A9dl1g6GJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaJqw7RUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXDrRAAhG+LiUCXoRaMu2d80RM4gpI8EvNXP68APXDoMwq
 X4p6ErAVz3w5vDkHfYhLddVIlleZn6pd8mu8KRk7lAx0/9Xk6f1xS1UbusKW4gmy4w7rkHlFujR
 oRrdUUHh/9M5J7dHnTbgSZrJPG2NlUv/rX21grrbkoz3S0xhN3dvn8xL7YtMNCgVGN7fjQeWAlx
 NjCLQDx9Rd0pENkK8Gsrom0HBhQz0DpMZaI1Qbzp+f6GDKCyKLek+whmx2Y2Q8qaRRSIDzYTmNd
 00/kDMNAo8wtbNJxFB024+oulrLkCIwWHSAoIgjj7S3WTtSNmteEem2G7g4DKSCrtZsycTq2S6h
 P0jU22SFJnRMpEB087pfDfUKKEK9CtcgB+c9EM0MzpSHNpNsFtNhXrPsOth0uW0FAIjtUD2nrWv
 s+pZde3w+EF+WQLrCING7CHyNFINdkB0aePP1eoKQiGVZ0a/tm9CdXD10uZH36/bS6FMiWe86MH
 d6jOfqJFb742acKpoHwKx40bMA1oXMcqlfS2NHoir5Q4G9NSYlerYKopdKtwv4tGn41h7/Nk2dC
 KeUD4BuyoNbQb0zclxOEf8TNBiMLDtAS+zX1XDCmVACdj5+REfohNONFKXqg2i+OrVh/zWZos4h
 ZyB0G0/rkbR1hv1SAHEeUzxvMiusfQfy6jOJOmH22AkQ=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX+8jOxRzEm0aJ
 oV3aZoZEhGfLZ9iHMCLqCIAINT90bRRMIgXSDgY/Mt5xRdYm+HaYrzkv9osCWsjw3US3D5NpiWY
 x5wyvslQaAt33IvPwl0up3tryimx6PA61c8ADiFdnelMiihGuLQJCHNrqolLdWycepfooqHKEWz
 1MXyiOVuGKxRp+xfQ/NY/DANFqcJ8WY691DsOnV18o6egiK9hQv4lcZJed+epMI965I15c91Dtn
 4a+ql6CoWmBzfnw3+MoDLSwLWVMbCxBSW7p/+BHF7nFJ8qYU/lecesoG1sF9toSaLXOj9CRH1ET
 lF42HXntBOIOh7a9HhaGzC85eHBYh2vbnCiDKP6bTH6lYYvUf6fgxnstMZp1qKzZdE54mfVWlIK
 3sCL1EUI
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ab0f6 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=SSnYddtK9NkD3JaiHHAA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: 4-DeDuGl4JvsdpPHxe5EvnEnLXsnO42U
X-Proofpoint-ORIG-GUID: 4-DeDuGl4JvsdpPHxe5EvnEnLXsnO42U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

The version of bootloader found e.g. in the Particle Tachyon configures
the display subsystem to the point that Linux isn't recovering the
state (currently hits one or more iommu faults which results in a panic,
still debugging this).

Introduce the MDSS reset, like we've done on other platforms, to allow
the OS to clear the bootloader state.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: clock: dispcc-sc7280: Add display resets
      clk: qcom: dispcc-sc7280: Add dispcc resets
      arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss

 arch/arm64/boot/dts/qcom/sc7280.dtsi           | 2 ++
 drivers/clk/qcom/dispcc-sc7280.c               | 8 ++++++++
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 4 ++++
 3 files changed, 14 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-sc7280-mdss-reset-a703d4b8a2c4

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

