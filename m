Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB23337BAE
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822581; cv=none; b=Q2iO/djbrsAMj2eUxoF6nTYqJp7HnUy9PhaUShexZ02Rm47K3peEswfdxGl5fNA+j1nOPtbolWSvVnJMuOE4kZmvfZTaqfEbX1ucw0Yxqj9YQaIYbaCqCv0RW1Trmv/XTt1cqTHdcY9WBmtnWGfB38hQPDtoycy3nQTBvQPtNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822581; c=relaxed/simple;
	bh=bTF/HTJGitlCWkiCQBfUce6uEKcUNHO5/aywbfeUeGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pim/SsQPbkAV//H3E2+2zSkiSixehmQL1vnsemgRRRS9kSI+iqLxDRnp/RWclWaSIt/EtorFIawG5h1HEsEK+Zndh3PkLSMMgLoInJUxbrwricvUHJhB/XL8T9vdH+wXDjzDf4nWIBs28S2NbCxL70YZvk8Dr9JhrGggQpLwFpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0pHTEXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4qAwdE4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0pHTEXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4qAwdE4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7Yd321694250
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZH115Y6hMMe7/X3DCQWnOO
	KT6D/4xCNNKZ88coPhSO8=; b=L0pHTEXu6DbfaUXu8yCX71x1NoVEiv51N9n8gO
	pY/rA31xwHQ3yChNjxEKqQHrQGVeGlnqPIKvPVnEnfX9Y2b+ndrlgyU7+XyrREZD
	7QN0Dv1yFGKSrbS1gvd5bIDNbOqAFdOEireAWNG4WA3iBgPfgv2q8cDqss6v6fY+
	tV7oxqAwQPT28TMhNa4sM+dsDRj9xIQKiQceQ8uu+mGUsSPFIelKK+wyBenL6v3A
	fDBSoDpu4cmJ+wI7/dguM0KGQ3mBMZbdeqy+ovSygNNfEXE/8yZlnZ7ccJRLgI4o
	2/3FQ1eHMumwhfoIt+TIHg9Xjemq/mIcXi8SxI/0ZI9LFzEA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv230w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:09:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b3eso1413485a12.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822578; x=1762427378; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH115Y6hMMe7/X3DCQWnOOKT6D/4xCNNKZ88coPhSO8=;
        b=e4qAwdE4rEMdopby+qzr1c42Gc125gagsupLO1TYejRdFfrRMnGT6OwxR+G+Shjm7Z
         XoVuqHgfzs27S/vG/dL53/kiDhJTRmbKFoYCGdDEFfSzVXkiPPH+GeGCAUBmbI+YXc2Z
         5GuEdcTj8jdHq/IiycMxGMKkHxRbK+TOcKUqKoJuBZgTdstGrZMtPVfssBJqWxJRG5Jq
         1SxGdsUeY+J3eWliXlrY2TFjOl6EdaLMBK/DcUz0yT63/LJbGmLBuqJsisRQZ6AEaBYp
         5DgAwT9ZIgLUuhIanxayi5L5+f8nZjsrQuVFQpvTUtsFvpgZXkY9E2KoYwsPRbY8tiWu
         sQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822578; x=1762427378;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZH115Y6hMMe7/X3DCQWnOOKT6D/4xCNNKZ88coPhSO8=;
        b=XUejcfz28NQ0fyoC/2UU3GBdCFEjqzUi4RD4PJoMl12WxBFwiNQxeJZyB40SYZhB33
         xMjg5Um7DL52whvwWwNY37N3k3atnA/dcsHgqdV4Mb+iMrVgxCMEe34EfEtCniNtYhHc
         KklJfNbZDr8x4fHG1nGepH5mkrfWer91Id8MfQ9ELjMyXOb2GAQeLxP2/GggPiN45tD1
         +p7L/BBXRUuhwR/bEW02ZacoS5C4TaTPMPmB2x5MXIxh6SF/YlMBk60QMOprxvkV21qJ
         bg7wh5cmAn9orx1B4V+4mp+fK2IaO84NN/+P6nLvpghj0lwCkfNn77m/CD2g8nMIfLgi
         Nohw==
X-Forwarded-Encrypted: i=1; AJvYcCV8gKu2n4KoaJQhY74974fPBwy3K5QsPi/vPk0Z7G+NYNUH+Qde9C6Hp9zT6TC+LNZvhTj0HIrpkYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6BvpUFrkJMV8omdgFKBPPq1EGf73n5e4qC9xgBAVQwqHzv8XD
	On/xCCC5tLMhpaH84ZNtB8GnSQ7F0E2Xzyrcoqy7MfG5Af2Zdgss9Gmt0F4m8F1aloRZZsPvKzz
	Y8M6hFLtlPLe8PdCs7en5MGEg68WeGJbWJlS5bE+dx7sXPN6lHHlKejpI2mwGJDc=
X-Gm-Gg: ASbGncs2r1Nzgsr3vJ2eJguVhhIh1t+WA6osgCZzWuOK+gjXDoSYHZ7xPdJFecx5ybS
	vLHoeepeT/7zvUPk2CMKve55bD42R1RTvhecQiaLb8mxHtqalgu2xu37i3fPAHLdVt+IdrOXc0V
	jLHqHoPGfrkoC+C+Fe9EdfVfWdhDCpVVHzg4qgEpwJIqFNXRDAnbe/CgJv1YJ0HNjOUI9WrCj81
	LekgSJ2HwikumPhEGNESjzQ2ll2b3PvekSGCtCnsSN1l5MamPgXWeEN9D2/oFDl3sIPKmlCIN5+
	uEizf0eqaoJdTlt/mShqFH+UupWOhRVj/FeJiXJIwxXw9U5YLaLN5UhteEDYh7dXv6heHL4PdXK
	zGwcMg2i9GjQIJvWUnrzqmO4=
X-Received: by 2002:a05:6a20:2451:b0:343:70a2:bca9 with SMTP id adf61e73a8af0-34787577cacmr3578967637.53.1761822577841;
        Thu, 30 Oct 2025 04:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatE8uROAdnCWiw8m3mzuGzWhz3CpHUlu9lY8QggHRB5tUmuEVy8KbUaCVgmVdYIa95m2z6A==
X-Received: by 2002:a05:6a20:2451:b0:343:70a2:bca9 with SMTP id adf61e73a8af0-34787577cacmr3578880637.53.1761822576558;
        Thu, 30 Oct 2025 04:09:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727fesm2262839a91.4.2025.10.30.04.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:09:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add support for Clock controllers for Kaanapali
Date: Thu, 30 Oct 2025 16:39:03 +0530
Message-Id: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9HA2kC/x3MQQqAIBBA0avErBN0QKKuEhGDjjUUJgoRhHdPW
 r7F/y8UzsIFpu6FzLcUuWID9h24neLGSnwzoEZrNA5qc249iCIlOkXdqEZtPAfNhixCy1LmIM+
 /nJdaPxM5/s1iAAAA
X-Change-ID: 20251027-gcc_kaanapali-v2-901def0e1a52
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 5KjOGboHzZIE9cpiDKBX9zcdD1aRXtKR
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=69034772 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pU5keNj5C49EkLXuPzUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5KjOGboHzZIE9cpiDKBX9zcdD1aRXtKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX2494C+vlXMSg
 QAS4EDaGrXa0t2PYfDZnZKvGMFXLjsz/UAjod6aLw9nhgCu2JNOZ0CQUiO6u5uGxxfFLQ/rsmwN
 PbUFo8O0cG16jz1+0XmQqXlOE6S0mLtUhD5i9ak8/XJXagQ5lXwylKNg7yV44VPLsnXXfp29uyq
 3fvkR0H9+d9xKKAzV7AQedGOdNqqUBJYIDookSbQohoj/AMAR+qNjETl/aKkmQ7IlDOy0Qau2bF
 JrrtGkL8epFAAqx/xQP4tQMYEcpDLE90VmgXRJr41V4QmN3TKlxPLVrPgaveVsdNB2S8URB/ziK
 U6q9RcD1BP0/+X2pNo/QelUAZ/TtIopGb2EjDMjRLOpe2rakPWQKRywygME0OkPiyISNXkjiwM5
 dqKT/x09HNg5nxSMClXv8xH7mzmIyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC.

Kaanapali(Snapdragon SoC from Qualcomm):
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Changes in v2:
  - Update the commit message for all dt-bindings to incorporate
    "SoC/platform" inplace of drivers [Krzysztof]
  - Add RB tag from [Krzysztof] for dt-bindings
  - Split the TCSRCC to a new driver instead of reusing the SM8750
    driver with offset updates [Dmitry]
  - Update the new RPMH clocks to use 'clkN' convention [Dmitry]
  - Add RB tag from [Dmitry] for GCC
  - This series does not have any strict PLL code dependencies [Bjorn], thus
    drop them and will be added in the Multimedia clock controller
    series. Drop the following patches.
	- Update the PLL support for cal_l
	- Add support for controlling Pongo EKO_T PLL
	- Add support for controlling Rivian PLL
  - Link to v1: https://lore.kernel.org/lkml/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
      dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
      dt-bindings: clock: qcom: Add Kaanapali Global clock controller
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   42 +
 drivers/clk/qcom/gcc-kaanapali.c                   | 3541 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-kaanapali.c                |  141 +
 include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++
 9 files changed, 3992 insertions(+), 2 deletions(-)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251027-gcc_kaanapali-v2-901def0e1a52

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

