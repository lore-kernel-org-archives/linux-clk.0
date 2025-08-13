Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC277464
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071758; cv=none; b=jMnFEtfQFdrmu3q4sC3QDwXGDuKHrvckVwZovgo3S9j1DSQ7alMcXkintWYIARe8s888OrjewyoqAnRvxjVQ1WNm4CeqmbISzm8RcfCnJYuaGMEg/akSbTGwjAzto1uK/4qEdz5HwOgEb5WXt5U1bKBx+M8ZexJesSzqHZx4lkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071758; c=relaxed/simple;
	bh=N/EFTl//MUVpepPSVYfso39VLXLEkNVBQ8GJWEUsU5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S9LVkRnq0ZyL61oZ680cUhDzUlhkuMuwnjtqRuongWR21XN92gZ457ILV+cQ0pulNuux63lgbQ9NBjlZ5Wh/WfZVRYhk5P3KgWpaoWWC5QXkugbd2dSem/RdEnrhwyJOqY6lsTgfyUIMHtd0ERtAJ1ouI1a4PshNS88UTAYs2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWCU/c9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWCU/c9p"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mOYm026071
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PbxeIGNssb8EQVu2gX91Sa
	Cd/YhbWEN2gAOYLERC55E=; b=WWCU/c9pA94DPQT4oid+EvX0oHaVGN8N/YvZw5
	yN06bSa7E/pAw4xrLqm0kzDM8QH8Dbca4+egb1J3s3ZMrbNqKITeEvXq0xQbKQQx
	73eYmz+VNY86VhMkq+CrJreT4AlfROUUTOAM3uQx3a1xFlm2fZnvLDpTHl9Ki3BV
	ABGsxuHsWM8G97Ajc+pmMf7/pggACSUsqiQ2Y4bEOb1AU2+qlpLR/JFPGyvhUvbp
	gIJRukHGosjDEU8Om4I7dfcVtdlwG9w6r34ORRyZFmhfHv3O/N+aTLywj8lQQYuK
	BYVtiYG7TLNcTArRSzuNbc8UeuqsmI5ittEp//vLu1zRYBlQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9su6k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:55:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bb326ad0bso6425248b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 00:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071755; x=1755676555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbxeIGNssb8EQVu2gX91SaCd/YhbWEN2gAOYLERC55E=;
        b=lo9KbWt+vtnN+GPmfzYXt+Ckuhs/UZddFyzp7uxBaf5dIteiIzJJ+cm5B9hUj1OPWC
         mbDzXIiKlmD0WAqUvy9pMk2bNdAluTLzEAg29d/wJ87HT4sbFk0f4ulmdW55MjMKTPOg
         5Jugl1S6pI//hYsBB1gTaKoz6QksSr8n7VtVoHEWC+eyuQ3HNTM4xzVmgENIeDfXzPbn
         O1xzy8jcxudQvPaPFkVGAkv1YO6Jf5LBzJEhtvVlUwM7nvJNC5mSKpRCz0Cr9zy348Iq
         BOAgio7Sn4+D2P9rzZr+BYQIRkpAI3z8S0LNLhkev2Mg4PNdvU8j/avuGDdEaHN8X1d/
         HoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZvvEtPxUYiev/tIjzOQDMDgkQ81ij4TyqCSDU719s0xemWqhxMLy/WGZejgZIS9WT7yayicozFNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpvOM0P7TCIEIYQcPNxrb7YWPgu7feKoWjUd31G6GSM/RlXqGZ
	/GQQ8g4ZXnl60oOUluhDHNEeCZ4YQ7DtK/OyQ9AQvPKfZqjPE01pdyBudIQ2eAjWx2mSUiQSu3f
	kszZpuxTIaPnG7kTmkCiu8GPjQ1CovjRNTCcJOpiAgD3Qyy5faBb8pIt0lNmToeM=
X-Gm-Gg: ASbGnctfG9dqCw2rrItyDliUTUHoSr/Q39HUwYu2Z1Wgqh6RPyW+pZFDkN+UFnW8tNA
	rHACyL3cd3v+4mrXHYsaLIMbgy0vAbhkpq1d/DZB3N3xDz0zEafbHeOCHDf0Kn0gnwQ9JnbY9Ik
	bMx9iM6c3AW3otkowdZLk6CXh6ixyp8pJO2a0dQyHfhgABAKF5v1bOTl0EfydciMTj+yHSO+gwy
	pSuSGYFnSxhS1AikxxhiYAl74NSPujbBzEzN5mcVYuyoVX8+z17ElfoeaYEOuD8OF1k0Y9ettRt
	WVpxtqjElJDf1cEnuwKJzyBmNq1ZUfwww3RC6vTd3wPEuhzzBvFzK3XwNxutg3Bc
X-Received: by 2002:aa7:88d6:0:b0:76b:ffd1:7722 with SMTP id d2e1a72fcca58-76e20fe52ffmr3695009b3a.24.1755071755285;
        Wed, 13 Aug 2025 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFejr+/favLOO8iLHlOBozznAzz7xZoBuIk5htMdciv+yIGlKh80pmUms50GL2E13VJAOM9w==
X-Received: by 2002:aa7:88d6:0:b0:76b:ffd1:7722 with SMTP id d2e1a72fcca58-76e20fe52ffmr3694973b3a.24.1755071754778;
        Wed, 13 Aug 2025 00:55:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:55:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add support for Clock controllers for Glymur SoC
Date: Wed, 13 Aug 2025 13:25:16 +0530
Message-Id: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOREnGgC/x3MQQqDMBAAwK/Inl1Ig5LYrxQPIa7p0piUjYoi/
 r2hx7nMBYWEqcCzuUBo58I5VXRtA/7tUiDkqRq00r2yD40hnssm6GP2H/Q5rZJjJMG9w36w1sx
 KW2cmqMFXaObjn7/G+/4BxyDCIGwAAAA=
X-Change-ID: 20250812-glymur-clock-controller-v4-59887f028a7d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c450c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9iZiYaJo2d43-za_6isA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: a0viHEyfouMVe7G2hcfrVA7Mii5yEi30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX5mUgDHEXefbK
 M3GM2hSiO2tCtvMBRURbVtDHuD2TMGIK5LnoC5zXJfnFeb7ni+KoYVGcEBb8j6wDc0fO3No8WX3
 kc5yA6AMZx2ymSIDGINExkaQuDTOUS+OrUht2ZRlAAxMwoyL4/Z6HUrPY/ZZc2glKL15RauVky2
 Bk3gCgPZJrYzEed5MHiQCDWOQxUZdvqeUrAtelYuYQtVsBF7QSPl7TlRDELm5LADLYF41YKMjpz
 IGT4nu1ljRs+UWGw36H+yZoJ+o6M3w8j4zhYW2V2Du2nOXX0OW6w3nrmdrZyu+8AqdqDM2zD3ON
 hr00qYF6RxS3nJKDvdqJhainltfEla4TLn+QaThXwlflOiudhV44o4zRWDjbBvZvsMJzy/mOvYE
 9zWLz579
X-Proofpoint-GUID: a0viHEyfouMVe7G2hcfrVA7Mii5yEi30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Introduce the support for Global clock controller(GCC), TCSR and the RPMH clock controller for

Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted separately after the
official announcement of the Glymur SoC.

Changes in v4:
 - Update the commit message for all dt-bindings to incorporate "Glymur SoC".
 - Add the xo parent for the TCSR CC clocks[Abel]
 - Update the GCC driver to cleanup dfs_rcgs as part of 'qcom_cc_driver_data'[Dmitry]
 - Add RB tag from [Konrad]
 - Fix the broken previous patchset links.
 - Link to v3: https://lore.kernel.org/lkml/20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com/

Changes in v3:
- Update the commit message for all the dt-bindings [Krzysztof]
- Update the commit message as required.
- Link to v2: https://lore.kernel.org/all/20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com/

Changes in v2:
- Drop second/last, redundant "bindings" in TCSR and also align the
  filename [Krzysztof]
- Update the year to the copyright [Krzysztof]
- Align to the new Kconfig name CLK_GLYMUR_GCC/TCSR [Abel, Bjorn]
- Use qcom_cc_probe() for tcsrcc [Dmitry]
- Add RB tag from [Dmitry] to patch #5
- Link to v1: https://lore.kernel.org/lkml/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
      dt-bindings: clock: qcom: Document the Glymur SoC TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for Glymur SoC
      clk: qcom: rpmh: Add support for Glymur rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
      dt-bindings: clock: qcom: document the Glymur Global Clock Controller
      clk: qcom: gcc: Add support for Global Clock Controller

 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml |  122 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    3 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-glymur.c                      | 8616 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   |  313 +
 include/dt-bindings/clock/qcom,glymur-gcc.h        |  578 ++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       |   24 +
 11 files changed, 9704 insertions(+)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250812-glymur-clock-controller-v4-59887f028a7d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

