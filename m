Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328883CE083
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212055; cv=none; b=OvulIsdnf5uv6N5iE4RbkvSu26jOUh1fwdw//FAGj/D4iVauUGWm3kE3WoXscAkmQfDcGs3pxsZ5aJHQyC2sly0dzJxiEukUgJngRSgcPR1PVzVZVHjKJo2pyQywzotKeQ8wEJSiol+A1lkRfyUAyrWlC52E0wBKM8WVvYfVrvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212055; c=relaxed/simple;
	bh=CGKHmceFpiofqKPx4rDZhXK5Ys4QkIj93QxQBgPZLag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ES4skYqk24/EzUBGj8L89cahtkJXMINsSh4ewcziu0dtMq7FKUw1KNaWqSa8XvgwnUHmwrwpWViO1HTn+wUFL8xlDxQzyMhSgMgwO/XTM4q02iX29R9/4E3m+3g3fi1etwV3BkCkPbyBZIlFzOuPlEEULpyc+JpQFkB9tlWeK+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9RYiuvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOQDcAA7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9RYiuvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOQDcAA7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6daHB3631915
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/g+/cyyg8C+7YG3dVUIEES
	Jep77mWvEbhJS/dThQ1Js=; b=T9RYiuvpR3VoDX8YbH5ssVMj2bxEh9FSDiEDk9
	7j1gwGlSrnEoTQbEMncxpNKhFLx0+M78gksHdXUEk69Fci61bliFxqu8Q25tp+v1
	e+fq7GDyOmbhRvc7FSNJfhJGa1fm4VzwPCpZGyK0AJtKe8lfqxXWrCmlCzpR5kYR
	c/DX+z6k8Yl/sed9hpRwTcZt8PuN5tkj2WhDW2uVlxR6bYepnkdKZX+PAkXshKEE
	B7u6zj6b/xxkMNDS4bryhrFMFzVuY7G8I0lNFQCIyIhVPC8IoxFM+kabhkpI+hHU
	FCbxRbEmwqch6WztJfKqonxMDtRD+riDBupdyJz0eGn/X/kA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs4py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:54:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6652832a12.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 03:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212052; x=1782816852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/g+/cyyg8C+7YG3dVUIEESJep77mWvEbhJS/dThQ1Js=;
        b=EOQDcAA7+fCYseBU4H2bASkKo7WNzYDLJioaKBU3/sCbqU6ZY6kHZmWRx7TEboGCc5
         0EM3CDuijAreWkPbTeSQiCETVxydkAxH3NxC0BMu9C3pK42dH3vC6RkBl7SvEf2YwAWx
         AVyZtqVTtEbgMziSbTOsMjEZJdKYaB5clt/z5lvFqDntSqTXNr7KAOjL8CZZObWYijRP
         m1Dnc8TUR1E0MpYvU39tgt4jxPgS44+VhdJDs91T9/z4TX+udoZVHrKryE+Pk6kk+hr/
         n06hWLhbl+JILarTXhMltaUP2Gy6nnLKDWP595UPqGnagZ9FvvGvt+RmcogngkJX6pbE
         zzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212052; x=1782816852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g+/cyyg8C+7YG3dVUIEESJep77mWvEbhJS/dThQ1Js=;
        b=Bc2SgdruO8cRyPEpqMfH+w2FjZPVUdjsXke6/TF+v3d0DmI3NmZRSV+GPEtcOHokdG
         3CLHG2zbnfiiSbVFDGgkjfXEGXKMmNBj69SNvBd6fAE59GbzYzv23urkwIwaEXiIiOHX
         HOG0Zjf108E9syQ00ty1pnb0zWDoD1S7AAKMb27WKG5E1k/X+KS5DENuPCUYMB4DFiw+
         FFc2WVTBIxkh9+1ZNbxseVzWhSDX+evoGwpanhXivE4+qP7O0lCn6Ln4VHVuMMBOupf8
         lRzYRaGYpFpmTZnNrfPBdwY4qjM8OAyEk7b+G612sHnjKlX+CVzDK+YV7xIYeuPTqF/s
         Jb6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrmoSERKkKuqb4eGlm1QZRDOhd1RagQfgpi/m4IloWBOzmSIjXMSH+gmeWcZelD7Xpgrb25L1XfdC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymVoCB0VDXYjNj3k/B9/vsvWwtxQN/37YVJP31vXK2Ssbxdknr
	xIXwMfIorHu+VMA6CfRk66ex+Pf66NPTl4EVORgDTpQR4z0m3Si4fBbt1sEEwp3xweQR/3Kax+f
	wED6+9DEGijHltr6OoYqpDgeCWmZDqGugvZo3MIctj4Cf2kjE4+m8xb/4MDMNYVQ=
X-Gm-Gg: AfdE7clpLIoa9nhAoL5MvjImc5devNGCQE0K35rvxHqHt48RTHt+dE01L0zx/UhkTzw
	rkrAml9dylNQG6sF3rl9SdEORdID6m0ZEZvOL5mko7jMjCixFEHf7cZubC0i0zD68u70y7hUzpA
	e0dMvY4akPQWqxlijt3tkrO0eS8w/6wHBXa73avYYV8/wUPdOvVPeTuHxQo7mkjUB/IsoTX768j
	GyHNqYOf6BgtQL3LDdHdLmvKevBePLUJqoe0kbX/iY9X0QDt3WMP93I2B/lSQsNrSyKtScR3Ych
	x/IDxyD5VjEhBinm2kVapD5Ty0JjxP+33JqQDXRhIF3Tn8LoqQPu7y7z+irSonJopzKRrjRpNik
	o2iIAvhyShODjrEEHJZD//lTou/QReCE3/RA=
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr2393220a91.8.1782212052132;
        Tue, 23 Jun 2026 03:54:12 -0700 (PDT)
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr2393147a91.8.1782212051621;
        Tue, 23 Jun 2026 03:54:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:11 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/6] clk: qcom: Add Nord multimedia clock controller
 support
Date: Tue, 23 Jun 2026 16:24:03 +0530
Message-Id: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtlOmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMD3bz8opTi+Nzc+DJDXcsk85QUkzRLoxSzFCWgjoKi1LTMCrBp0bG
 1tQBi414zXQAAAA==
X-Change-ID: 20260620-nords_mm_v1-9b7dd4f92d6d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a65d5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_t-zcm_tZIxzBNxMqFMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OCBTYWx0ZWRfXzdIpiadAIXoY
 HQfLUVKi6+8Ybr+xDO46qKbyHAydpDhRIPAteJi6SBj+i7YX4qYkSkDdomXC0R7x3UD/EUub9+q
 xDjo8LByo8fvARXYcvlRwbHtSVhG0fM=
X-Proofpoint-ORIG-GUID: DEFIxNu0Dt6vvLtPbqXH0JM1kih58LIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OCBTYWx0ZWRfX7P/sRN+Rp7PK
 pHF7VlIToJJN2vjlccHRdKRWW9YUGwQPhzLVKbxpqTKN77dHLuMV9bhYT7yRNbz9gWzroUr9Pf2
 /uuFQ2lJ8GTutIsKRIfzRPoqLA3CQOz81HGE5fyTRyhlvJBaEAtvdn/JySNRxn4PR292qZ//4W6
 U+E2s69U92YmbnEaXPskHyorWlTNS6gc4z/hsTBir/nqr5h+JZtgIYnI6ks8NHMwpkV+qCCQ6Vv
 e7wU41+NfU02LiwfJscuFglqx9MFOR8/cDv77jO2wxMiwkYGI+qp3dUsUmdUfBuu4bxixERiIrf
 tNZZnigwyIYvlbG95DoXr4OeOaLVR9tT/kAh/Fdad9GtYaLlnF3lWRwNA9O91qO2vHhzO9A6ODF
 iS+7ZwzIBPB2ejkIwAENRKtiQUUPVYJxc/WiMabxMf3P5SwOYfWodPPYVyFDAEGKmoNcIsXzBim
 gBUQR+X7fdeJ4inuQdw==
X-Proofpoint-GUID: DEFIxNu0Dt6vvLtPbqXH0JM1kih58LIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230088

This series adds clock controller support for the multimedia subsystems
on the Qualcomm Nord SoC platform, along with two fixes for always-on
clocks that were incorrectly exposed as controllable branches.

The Nord platform is a multi-cluster SoC that includes dedicated clock
controllers for the display and graphics subsystems. This series adds:

  - DT bindings and driver support for the two display clock controller
    instances (DISPCC_0 and DISPCC_1).
  - DT bindings and driver support for the two GPU clock controller
    instances (GPUCC and GPU2CC).
  - A fix for the GCC-Nord driver to mark PCIe link AHB and XO clocks
    as critical CBCRs instead of gatable clk_branch instances.
  - A fix for the NEGCC-Nord driver to mark the GPU2 CFG clock as a
    critical CBCR instead of a controllable clk_branch.

The two fix patches carry Fixes: tags pointing to the original Nord GCC
commit and are candidates for stable backport.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/dispcc0-nord.c                    | 2006 ++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2006 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   37 +-
 drivers/clk/qcom/gpu2cc-nord.c                     |  546 ++++++
 drivers/clk/qcom/gpucc-nord.c                      |  593 ++++++
 drivers/clk/qcom/negcc-nord.c                      |   22 +-
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 ++
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   51 +
 12 files changed, 5360 insertions(+), 46 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-nords_mm_v1-9b7dd4f92d6d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

