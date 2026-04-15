Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E73B3898
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260033; cv=none; b=MPWD3K/Xh7E37AR7MQBydkI2J9RFGbJfUkaY11DK/U4uthXWhHLrZY6D2nRrVBaPkko+U8in7zvwFYMbNqXsLO2bhmw4SSDWMUFTA20Ol0Ku3oyzYM/dm+oUMvc2MKRCltdMElncbsrCY2gbXIPhxY0sGAFbv1NITEs9gTNF0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260033; c=relaxed/simple;
	bh=jaWvwEt9ndPuG30CRSFYIxotCRFGMgAGMMUQpYK2etE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hx/+iDWTKkaFD/L2rgF2uRFSYo55TsSAXUcnDyPThQIUMjt7vXxdTIv60ZvYyxN68hY9TE7arqUnnJtoxKwOV1ebTIFincRx04EhuaFsFKRvH/lplhyhdmu/BECnC8TeJJtLpH7cbPb6ZO4bZv171KAd7IDfFp/bOZ0KDBpPykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3rfyK6S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUu0FoJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3rfyK6S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUu0FoJC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9HrMG1565849
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=; b=l3rfyK6S14CBobxt
	M2QRtuwAl6XsO/3/kNwNegw1fxr6E00a6dMX3iSrWzAPOe2rlj8iN8ULLpbBEpXr
	2V2uyhFYYkTlLHdOzbEWwTTRtMTf/rpP7fPPM7IZ2eGKb28EKCriKSAa1U7WnTBy
	ugUyLF0z2A1IFpZuFPr9Mw9wDoCRIsQqilfPRO6kZ4UmpvVQpivkq4N4sWtjBk+b
	pZ8xAeQhi5NzuLpMeE7SaC1bGa9kg00S2Z2FKRmo7VW0MaCvSlCgMZX6ogLKBLus
	sNZiUNQoV4Gd0FoFtcofzl7O3ZAmVuq+KR1yUe/5k/fjYWgaeI83fnTvDf+FXyN7
	0S8aig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv0u3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f308d385bso1895322b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260030; x=1776864830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=;
        b=jUu0FoJCIfbsMeH9SXW5pAJvYirhVPj9vIeNfQ7rZA45ZGxePVKxhaNhmVYdXgWR+i
         Mg138S6FZAU3nvA8dodimGejfjdPO5bDaCBWz/uILu2nbkTvd/dCpyZZX8EfxNjFr2oA
         h+nnlZsqB0f6v+u0fCUd/Unqw7foZySkUkHmWM2S+Q7k01ZPAS2rm0R/7EL04Wrpboq0
         vb2cfqby7yCcgS7kC/2UNz+6b/TPysDqwf3Nc2+1MADLQTJnQVVMPDveLVC7kX60hb0n
         RjC+i1Lx8FRSitfFmNLLZnl4y1Y9CuXJfqcGO5t+Al51wFv/EmVaHYK2nFJl9bplQkQZ
         yg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260030; x=1776864830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=;
        b=NFCDrmG+DFWcu3/eAvVTEo9cRq6m/tpek/AFJTzjWz81qU/MR0uw2N0XnWPZtREhIz
         aBYgWDgBgipWLe9iB7BnMurKXnddcFIVX54tQhK9ryeq/vB5FGn6HAsu+v8cIL9J9dgW
         FVh6Q2RICgFpwAgyTrf0h4b7F1ZgEw3fntyzPOzNqAX3IMfDMX5kuxZHs2TtNyhP2xUU
         +Nja1GnRVKL4pNAKfsaFtJCgbd/kfwx4xWUQc66QP5IEwX7hLZQivCdLUHFuduFCFFFk
         obNH10p0ZmZc0BmW+q7dv5Ocvs/sKQccXpKpOlAuI0KidF+woNsXHiglZGzeFNeQfNUw
         oaHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HhP4pGgg0LC4zesi590qO5+MT8mf1ICNurgluDbu12x6mNADTff02c8jHULYwNACgCy34nF0UYSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDRdO7xWoLNT0GLArpfofRo/USvpU5+Hi51+F/0jhVQWDbQRYR
	uAw3mte0H7e8ZxCED5cJ/PdTpF5JSmS1bn7gFTnbzB3/+RUmsEI0BZI5I6mOITmRJPqdyRY62dX
	6XnKnv0lhnIoxB7Cm9dkLFFf4F3yMZI/dhdhu62cxCOo7947xAxoo1gEcWlbAOlTqJNH53q0=
X-Gm-Gg: AeBDieviVjsyQX5XGU9fVAf7hmhIoe+azx6QcbIW4Qr41XkH1Z8xT4f/nN+DCdQljng
	/OlzvalYx0frp++iLW57WTV4z/X2syfDEBLfbCzD2lDnkUuG21XefTucI/oVxpQ7iGZ04WMvGtX
	k+P/VxK4umA9zsNYAxAARCcGEEkdtLOSeutzIgAfD9dx4sbOHkPdL4X1WKeXYCrkSBz+nrwnQR+
	Hvyl3wFlUHTHH6hjG+FXs8X9CDtmA5l6FnEBnVs/geNs2b+VYmcEeyYN8K5QE21vidRZ3AeQ3SK
	dFqAqrdiE/3Fh62EDs4jUtrgUDNP8CI1yC0U/Y5enT7OB/phGmR7YKRf4nRryPNK43sZTWqMr3K
	JrKfg6Zp02+1pJ5sQWDiwSUsCxqNFeWlxWPFgX7AXQFv8IAAN+wAxGaKgjItRjQYNRIBguhhGqb
	0+iD9HU0TZOwP689WroY3J1yantUnL/Utp8afyncR2hwmKCy7v+10WSbXW
X-Received: by 2002:a05:6a00:2a06:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f0d3530d0mr19462549b3a.22.1776260029733;
        Wed, 15 Apr 2026 06:33:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a06:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f0d3530d0mr19462516b3a.22.1776260029246;
        Wed, 15 Apr 2026 06:33:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:48 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:20 +0530
Subject: [PATCH 5/5] arm64: defconfig: enable IPQ9650 RDP488 base configs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-5-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=936;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=jaWvwEt9ndPuG30CRSFYIxotCRFGMgAGMMUQpYK2etE=;
 b=zjkiZk2sTrb/9BHcsPSY3WLlAPWnBr3E3SX6hwzQfhTJJEYfrStQUUiR/9unnwH7KZ0kQECvw
 nrBaNGo7KNlC+aj9RDJvv3a2wfq1yN7YRLSkBrsNSQKCUUESSGF9yXw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: cGrPMtHigN8G2VhLhZY-HwUKdChgE-zs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX3hW1jPDyDLRt
 XQWIiUEAVI3Wb315UZK70F4rF8wbbX48544dqssgMdz4Od4ta7G3fWL6egcPR17BRZgylEmRXlm
 gcGL8QtYN480AIOfYonmpXaYFRmG8jCEjFevINk4EGodXrkxvwmo9okq/t5iuezB6vIKK/dpWNI
 SHuUwNhATe1j4ggcjrkFuRcBLPH4EfKppSky3czS/PvhwRUYNFhOCFdhEGuUESsOBiTW3RXMm8R
 b681F1F9/EM7UbKvTqgxS0Bj7EZDqb2I5iRpYn6dXwE7K6ngU/sM26ZvcMGFT7DPxWYWTaSFMei
 H4MQ3eG1def6kwj2TWOLl/lYRakIm7tq1B+SxW+MusHR745Aiu8dCMi/k18pwVPmlejCjI5fVeD
 VXinjGzk7Z1MpE8LKNWNvHbzs6B9N89tnha2xYb/L+ZjiRvMn2ZXE77fToYJ/iNgvT5KWWlqIdt
 XkBdJ/kq1GnLOFT0ubg==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df93bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cGrPMtHigN8G2VhLhZY-HwUKdChgE-zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

Enable GCC, Pinctrl for Qualcomm's IPQ9650 SoC which is required to boot
ipq9650-rdp488 board to a console shell.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..442aee9d197c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -662,6 +662,7 @@ CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
+CONFIG_PINCTRL_IPQ9650=y
 CONFIG_PINCTRL_KAANAPALI=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8953=y
@@ -1509,6 +1510,7 @@ CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
+CONFIG_IPQ_GCC_9650=y
 CONFIG_IPQ_NSSCC_5424=m
 CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y

-- 
2.34.1

