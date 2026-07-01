Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A113AFCE5
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889802; cv=none; b=TawOT/hwCDz12pW5pBS5wOYwqD0dhUrcWqlU51ksziqWZLgKEVI7BWa77Ninc+QpQO8MOJ/UyWK+7UKWiWbc91Leh173NlbyGiFeBluE4SQpQUdFJjsmaeMNw7T4fvn68GwahX5xwooa0qoGbXR+X/r+44T4MpICRGZZJc8dJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889802; c=relaxed/simple;
	bh=5MKFt/zaYcFq7IKuke7jKlaQbD9tKD2HGDHqp3vOFnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bwlA6chB3rDrA95niJayFCXgHBcfdHRQ3828sEN3z0SG+rAM48z2EZEmY3YV59W4bIs4nwrAPInNh1K+fGfK6OOWGZOomDuGE1RGiNHi2WP9QJAvwodTWcAGShxkxP9eEGRUqP1WCO/27MlU+VKYd3gQymzn0ObvZge/OMLSN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTck+D9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfCui7+y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTck+D9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfCui7+y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lTH3140736
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 07:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7NCJWTnRs/jLLCrPUstOfZ
	DTejQrI7BQ7/YfnIbBOKk=; b=ZTck+D9hKsuTr0ZCuipX7Qka9QBg2oQEtRFADS
	++i9iehiNQ05GHEQdkQXY1+KaDhLmT2wXhadk/p7LfwMP8GYOgJHjLP8L3jGEcJY
	CLXteC21YxEynWlscW4RRPoZc1nVQalSA0WZL+7zDmDef9YjH/LubTF/MFRHF+Nk
	mMdwBlPj6DhoSzR/MGQVIJkIsKiLPT6ER/rXc71jjENduk7Up7D2Kq/IK67LNC1j
	zCkUxp5fOKwkDpV8y0CjJ8VgHZCcF06+F4A1QsKu9lCcM9ZRmc5kA66JUIZMDKtp
	jofmkoSj6GQ7rlUxSC2Vl8Z/CBtGEyuVnvUVVG5zY/z/VXuA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99k1p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 07:09:59 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139f2c46ef1so474269c88.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889799; x=1783494599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NCJWTnRs/jLLCrPUstOfZDTejQrI7BQ7/YfnIbBOKk=;
        b=gfCui7+yv4nLL2+Af8IcKVZ81nykOXya12nBkwNlKys/qXHALDeb/V4Feczc5HBowS
         hgeYW9Kih/6vapUKjoU5or7CVxIBCn18rjyIuhAzXqPvkXmaJibTgIxmufnxsrJdCUBY
         /EbTIhKdyL1pZKLEJDIgNJdri6Z/AGTsAyA+ckq43vf3+4E645SWOpEn3GBpLZ6Q1cId
         +0z+FFoHoSmayZ/QcJAV2ZBujndJYvJBm32ABRXSodm59wOyqX2iwQijwXilZyJLcTDO
         5L8i5Vy7I/qgvRt1d2BDt6ApMdAdu5KemiSIi7WK4LHO0OCLaf6bCNVqKhr/sjPHzmn9
         BPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889799; x=1783494599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCJWTnRs/jLLCrPUstOfZDTejQrI7BQ7/YfnIbBOKk=;
        b=U0xcs7OvHNuk34mpGZWvjA2VGMKKxCJtCwFY9z76ulxr/yWFUCNtzf1Pxkhbk901Ss
         Pir81ehdC1XbMEO8lAMfSIrag8ceeh3vtCk/VEUak+SYS/YwvpRSuQ5EtKpY6qLGc6mL
         IcAmYg6vps4eNntg5t9z2Cr91N6t9i7H/rwnCHDktRjUkXR9MANmg4kw8CwrBhWKNyxG
         Gh3mAPltwmlp5NoYsEfOiZYKPCGCPh012kkNzhAOxL2/bmKtNrOGC8ChJT5ZdwUvzfTe
         WXTHp3piWyREp/Aei+8e3Tpa4/Zh4CWVvfutNRYjoyUFeLCWXWCVYPR84r/xxxvwBZbE
         q7wA==
X-Forwarded-Encrypted: i=1; AFNElJ8C1KKvwBMx7SLrY60PyiO/EfCuMEQN8AqaSq9iy9PDaRTLs4V7ePUFdkE3NjxTbbFZaNLC2pymUBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjJILneWSfr8LV+OWMGxs80E6Exs4oDe2HeKnU9epnq924pBd
	3gmpGOevKQ9NFEqFdmKrAFNpBZD1F1X6CMyyiYnR7nY+pjBkvVZFnWe0emDD7K+8ibfTGaqafZ1
	x5CAtuFOGlqMdgxqSmZVpP3Tv7yfwwDFYaPVe6qgmVy6VCkI+0shsqYzxlerHP3Q=
X-Gm-Gg: AfdE7cnwIMccIhYECdkudGsXdKMxZ4G8a5mAylkCH7X85JHT80j6rbUv0Bsfy8IY3YK
	44JK32yxyZmoifBTENYBehsjFhJM8AEePo/hNU9sLW3WXVZTlUI8GIAYQKf/h6b+t0GIqWu6QXS
	yraK45wAD+VjwPmQ8+TgR2X8fJzRJNipIP2ko9o9dhzM9RJdDfvsd99H257AuGxMN2e5QbZYQJ1
	eJHzFsajZ0GPeaWvdA72S6mILRDGUyYB22Cqfz1vkrZ1lJWSrsSEiejD6omP3SyvNP9J4+caxWN
	h5O7NE/ciJWo2wnomCsFb7jNQdhRMjK7GI5zkAqcL7bQ/NFH80QGR4RvrydVx2wMqbchIBvTo1l
	1MedqGjzpnVDJXRm25OBNGa95NRNkm64tbwYjSvlRUYmCC+jAuwRtIhP5pVY7jEjBPwzq3waEyU
	BRAp0UtEfQ2vMQakHheOX2R/L4NCWDYrUiuHyqOboC
X-Received: by 2002:a05:7023:b83:b0:139:ed5a:eeec with SMTP id a92af1059eb24-13b36e0d71dmr564876c88.43.1782889798374;
        Wed, 01 Jul 2026 00:09:58 -0700 (PDT)
X-Received: by 2002:a05:7023:b83:b0:139:ed5a:eeec with SMTP id a92af1059eb24-13b36e0d71dmr564829c88.43.1782889797880;
        Wed, 01 Jul 2026 00:09:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:09:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add APSS clock driver support for IPQ5210
Date: Wed, 01 Jul 2026 12:39:40 +0530
Message-Id: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADS9RGoC/0WO3QqDMAxGX0VyvYqtTtSrvcfwoqtxlqnVpopDf
 PfVH9hN4CT5TrICodVIUAQrWJw1adN7ELcAVCP7NzJdeQYRiTRKxZ3JgYip9sOwinOVRFglaQZ
 +fbBY6+VQPcuTLY6TN7qzCS9JyJTpOu2KoMfFscsawx5oNDljv8crMz8S1zz/X505i1imclEj5
 5nC5GGIwnGS7S4OfYFy27YfWCpgstgAAAA=
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfXy1N19+Ow5iIT
 Do0718xGIG8y22SEiNmsqG1CQwIDymbqYroWB0KvU35KKvYBJVUib6p6CSx0R0wae+VzOipaysA
 VNX/oLL/Wd9cqGy308AGDZg3zxvv+ts=
X-Proofpoint-ORIG-GUID: NcDbAH8TLhgCxCmvfZHW9pX-pYD-VSOq
X-Proofpoint-GUID: NcDbAH8TLhgCxCmvfZHW9pX-pYD-VSOq
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44bd47 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nZJT0DbqkGW8ujxwV40A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfXz9DIxXkbtaTn
 5IJxRk/W5klNL3pcAYsbcsgmNUYAhD/BVD8nqFQfTEofsr3dhOHMMAjFEPLGleKQDHJJbJUFiwV
 XieEW3OrsWI2yUOA+8J9fSq3YjNAdlSQ9SJDC1dVyNS13uIeghDkFx0BzXqpyzfj/X6pBRpD+A6
 KvUC9OwDs9HgiEUY359IHNEUQhuq9edC4jUvj0TT5z4EjwdE3R5g+0PogS8X7kXM0hWUwuoktoH
 sYw6DXU2Yi8/kAMo3SqYgww7cvRI32Hc+aGeHxcnWiBhx3iEQon3qOeEFN6EkxaRlC35vrIzYK1
 M53CpioATDD+Q/IR0i0trpy/xEhzmTu+hsv0zdltcKqtTbCl3Z5CVQDP+tJYKqzYoUSRTiQKfq9
 pBO/IobQUhbySGWl7dwnXiJ5hL1qyuLIL050vxc1exyFqCgIiWO4SPuW80nXQ+iSIwWQmsKDNRe
 Uw76PcXY1kcbgdoyC0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Remove incorrect tsens dependency
- Pick R-b tag for driver change
- Link to v1: https://lore.kernel.org/r/20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

