Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F323168E1
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 04:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288166; cv=none; b=Cx0rPKKSp2Phi1kB3H9+iVrWA0amXP68RUZUEIwNAu+PgW7VWgLpr2huV4N+NR2ISM2fO72C9CYn3KaRTdYKJtOkolWyJlF5blYFol5Wc6kIO8zQDXHZxLbXKjJ5mKV9X952hkDjM+zqYjOeM2KesZHjSQVEVrQFtBMlPeS68wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288166; c=relaxed/simple;
	bh=oj9NMY0dHTGaZ+fF8PHGfV+wg6hs7AbMX7SVDbau+aE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XDwkAQwQhb3sV0LRSEqJ2BrGMsWtWcZFrPTQ6dNXs2A75LugLaLWoOjO3UdLVut2QwHOQK+Zhfqxb5bRnJ2wZ2xICwI/YOM41Q/ZihTxES5fI1TcwAZ9KO9wQAQaM9EHpZMBsiZCN4zketCrOJ3EJjUUgVr2Jka+b8XVRtfCQGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcBE1YZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BF6DoqWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcBE1YZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BF6DoqWw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651005he106175
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 04:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RKGMQInl4zv/ejwicadaXC
	R+S8YrLXcWc62MxjTRBcM=; b=XcBE1YZUdE1JcLfjwWsiVHEdYkj4eBbsYoyD0Q
	PlErcJ7TNfNVmVx6GSkFjBUyO50uInsuu7kknpzsumqcxTPxRwRqm2+Gmnq+wsiP
	vqbReIg9iw3Ryt1crKdjReGCb8urY/A/3AH3oZ+WHqzC8BsM+kGwYskrrUkgbjTO
	MOK4gOj6Y+Z/6Dm0CzVYZPbp6SqB5bpgVjhUOd6xQGcnZQmfdyaSl3vpnTft5iG/
	FlNQp7VSJeS6b4wcKljaY7uxHXvIra3JaJnsrMwAMALVo5dylSwSSJTq9hda+uXp
	N2HKAarj58dMUSlNigh8/toW0T7HHAcMohO7w1m9f6rgQ3FQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuwkhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 04:29:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c20f7581so10156885ad.0
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 21:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288161; x=1780892961; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKGMQInl4zv/ejwicadaXCR+S8YrLXcWc62MxjTRBcM=;
        b=BF6DoqWwJKUwJ10POUU9U0jnNf7zySK76Gou2OGjTqAxgX1eAQ2KJqcmH7HPR3cYiA
         ruqHlQxRnh1zsTZ9lsK9H+LjWKJhwL8IIUnqoE4HJaDG6xVLjA6QL1LuQgmcPe1zkP3a
         3FzK5eUHbNxdJZpqMh22/ev4lIR3+UMAv9rGB/lyZefWaSOAaZnIVovpNREXcOHPvxee
         IGo/04zPmKewzl9FDfTC/1rmli3bS15MBcpEON/f8FsUjiBo7rOnBZWe4PD8HkN2venT
         FKL7bD+B2iC6DdD6sHDohk5vB0QSVtyf3Y/sYsiHnt3MEtUCRicqHrxNZldJnPBjfrOT
         qHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288161; x=1780892961;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKGMQInl4zv/ejwicadaXCR+S8YrLXcWc62MxjTRBcM=;
        b=CZKPSkoQMJFabwVqjEe7dPPeNjmatgQGrex4r982/cz1BWkf71YXSDwbB9FESzpkyc
         hqRgUAyeDmjBhTLMQXzkBj9HivOqwknjS27PRpn7JpEAKEvJE1D1L0rvoUdC5501Df2T
         YCZrFsZqXSg21vxjaaNvgkin4BKwgubcVY9tMP87IOGOwbzwWETllc6oOop3lQXyoyp/
         eGkQC75/gm2PbAjvIFCowK/lQDAm4InOdL0nBI0dWfy5XrIBgyoYSo5QVXcopRBL3i0a
         pc+OOkqDaCcv3mMw9XPRHPJIMlclYEYFyKkxzN9pMzAJe1eAfucWW1WD330RlJxL2wlE
         Hg5g==
X-Forwarded-Encrypted: i=1; AFNElJ8yQOW+0W0EkSi6GpPjLUlI7+WbY3MW6CV7lN5Ep760RMGzLiHJc4ReSl+DCu7Gn+h6BSNmzjVlwr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzONI8042VOntE+qq/F4Lb0zVYvzKMM0jnVs1N3UusMSuKvc8z5
	4Hhms/RNpKrTlssKnWpjzBCmgvgWJ1FvG94wn8sq/B16zm2RmSb9LpVFMHjgF2OEvXad4MU/H0E
	WcRDzF0AB4YbOf+uGTtsWM5vQ2R4ioL55ZQ42goxjAXoKlYIVnPEx71V4RemIrqA=
X-Gm-Gg: Acq92OFWKm8I+bCEW14Ogl0jLvpEKswu0FyU9knnQ0iIf1KygRxvzRdDhV5LxedJxMA
	Y/blvfO3ZQaS9LxJ+XnHiYKttCYMtUEfEKSHwo3N46KDkr48srLjQmcgnt1F7IZS/C4M/ZE8hon
	a71FD5fmCEx6Z0MV2f8xrgm1iPXATei3qBxAp4VCuqxGPg7mB1y0K5JPr+KftsxoF/0rbYTnnzE
	VLTK26g4hdf1pD1TefjtQAYwY4IazvhHiycqD4LfSVoc/FFO2Cym29h9bCzqs5dcZBeHHJYEhpL
	+kuFtqlAMwGRnjaaHMaPeTnRohpZD81uILUa+IKPojTVYGjBIl1m9UjuqUhzW4w6kDv/7UIMTBp
	gu5dsy6i1Bsq5qhxRy3EGVRAwzguxAnEPWy3f3U+msQAg/ALSEKtgti1yNMG2TWE=
X-Received: by 2002:a17:903:46c4:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bf367dfc87mr97329795ad.18.1780288161463;
        Sun, 31 May 2026 21:29:21 -0700 (PDT)
X-Received: by 2002:a17:903:46c4:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2bf367dfc87mr97329155ad.18.1780288160930;
        Sun, 31 May 2026 21:29:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Mon, 01 Jun 2026 09:59:12 +0530
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgKHWoC/4XNyw7CIBAF0F9pWEszDn1QV/6HcUEptKQPKijRN
 P13aTduNG5ucie5ZxbilTPKk1OyEKeC8cZOsbBDQmQnplZR08ROELCADCvqO9M7QVspqZvHmHL
 oPUWoMtVorVkNJG5np7R57u7lGntn/N261/4mHLfrPzEcKVDJZFOWec7rUpyt9+ntIQZpxzGNQ
 TY44AfLgf/CMGKcIeO1wAwK+IKt6/oGB3ZhSA4BAAA=
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfX9uH+R//wu2aM
 tNhyjM/8tmGPuxwcgC4tTWoFG43liWuWbfe/LlKpFH+vrxEyVIyEijTrlexY0UWZvwBZf5HcNJz
 1Jl/IztukJ8NGA/5MKGTgVoDFc0aopztuXKCHZ+GePgjg7sZFwB9DMgdNaONsYqo7bPPbTL/ouB
 hep4LuelSLNbE5pn0W5hAjOceGh9jquV+Llaz5fnIBBX73EUE49+rC4YcqhS6NbzptC4P8dLVVb
 HzyFsLEded+pbQZSSPNSKXyCSEZEOk0lgwo2vE5/SToDM+bem4FzpDYA+c9KeXoh23cPIJSKo/T
 mQ6jH7pu0mmkprMPrDvpR2D3sN9i+baFpGs8KzG4mKz7dORnV9yuF1VopM7qPqnVQzhAvCc+tlF
 8m2qWACIJ2QyFXFcIyE6htyaZGkptx+fbTlCl3m+Uq/ECOK9dHJqgd0y0c11Tvo3MtKnrI+aJsY
 zO9/GlyZH+1EqmHHuHg==
X-Proofpoint-ORIG-GUID: xZf6Q9VBRWwYFJ3tx_tNDVz2kn_paPY-
X-Proofpoint-GUID: xZf6Q9VBRWwYFJ3tx_tNDVz2kn_paPY-
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d0aa2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jEWS2u4n0fhbBKcMAsIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4429 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4814 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

