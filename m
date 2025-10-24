Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543741760
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283140; cv=none; b=K5oEm9TJUvkuj6U/AtsxZu3JtWkH1NbMzcERG+IZsZGztPuK+1sN3sFe7/5eykpzQeoOYDxDmPf+KZqEEzuLh9JHSOseye2tPDGey6BjlxT39E9TJncI4DS0tmudq10LmhXwRfPr5psbEOE9JSNw2DAkX3Ac7/a1htVQgwlBHlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283140; c=relaxed/simple;
	bh=XQ+JlN74f2Jp20YFK1NOgcX3NOcIEvg0gafRe+n0rv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h09HUWjBQmaWx/DvFRHQpLBZHM86mSMja1g5ovP5p+ejjxlA1mQTBtcK3e3vQxFG5snSOtgFoiE11ykwUZgmxUerTZ95G01GwfSsr4np0/EgrLYzuF5p85e9kSAeOMrx5cNsRmWXZIRrAREvb7vQLvtO8DAQKRaE39KI3HhvEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3TPD1qC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3TPD1qC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FqOv004412
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 05:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YxDg8wob0BqVw0+zh6pPHL
	5Cq3vrRGqu/p4Y/OVXT+w=; b=Y3TPD1qCP/C6roN35W4+PKI5fFPhwUKEh6Znl+
	WU2HiBBvUwOYBJeQoLFK4UFSirj4oYHG8tDqSkG0qpt6lUBJHZk2SMEc6i40V4l4
	3aUGJH3BKJ/bd7XBAN7MuBr2IIw9VA4bpH+Pd/HHwMoBK44OToCH+wMKYFn7ICKy
	njaLRtgXFz+LvYLF00MC13mmnKNvnKLD7sFMtl9yJ188M0KmLiW3b5ZsNrcaKiir
	MIb3ubQ8A3X9i/RMx//Ya1qxAgZxAnOSe615ioth+dTPLnaKyq8t4mwGH0Ph+xbL
	i8JuA19qdds55g+7SSbr7CzBF8nANRMEA9ewB6X3Sg+vfnyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2geauyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 05:18:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78105c10afdso1446565b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 22:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283136; x=1761887936;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxDg8wob0BqVw0+zh6pPHL5Cq3vrRGqu/p4Y/OVXT+w=;
        b=gFlO+KxxnCokDqbMXW3qPXAk275fpr+dQ/UNQDIdPGCZjZIFMbdOb+74CkOvvFR0HR
         GkwoDH2dDs+M1NqJ4Zs+9uduV1bzVrnwLcMvPSuo8Y8BsKuagKLDoVK6icp7Zuobg4z7
         tjLFz56b/VpKXmLXj/Ymku/Ckyad9SlRdUJSvubYLsUVUnLlwYKGjdvGFNi7mae4gKss
         rcS8EaRn9P8f9YbF/wM5dQSEBBs7PWgLVqxpaRXSeE/AdPXGl/p/L7+QM4GlTm23AxnR
         Ah/7DSDazKFdHkKiI/9XdxsCFYqZhMEkreAcDfhdN5F50o7nXsOEJs6Q91wktVSKl53b
         eL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVcb9BmRKgW6mrUzOwv1fWHUbFYzDkh22RZ3KOO7ceQKuuL2UNBfIu7gvDo9LuImgLG6fBns1lpnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDzkMa7LbuO9Kfo8PPxOkx5EfXbFm/KTlyb48wnS9iqbvMc03
	eizYdVK0cLR3PsCR3FMIxz+d/oCuRPoxZ6wui+h9Vsu1hrEiYTzmlv5RegJv7ftbD6vfaCVwUiX
	A0rmzp0wwYM9GY5X871QVnCk4I7Rdno/YcBuEqpYiOhP8FbKKltzXt2c97KXN2ws=
X-Gm-Gg: ASbGncvvrwFuBRM3ieDFnAnbEqPfz0rgz+bYn12XET0B72OqMA8SdbYyoMr5hqsQn4Y
	EIIe6YYVBsnQCLVpBeAmzVqzfGcGCUVgGqLa2xDuHQ5u6VnHoQ7k9WcK0CtH+4MwiUcwR4TWLc2
	Ioakdwfp/AnXUStzQlPD9rIT5gumuWqg+tUqBgOh8asHdywWU7X2Oo6rmYqjHRJHZaJz0rEF6Ph
	FNdrXtPP1R93Al+Ed6+cc28UoxFIpG8haEvezA59GQHo+zakNaIJyNDHtJdhiOZrgMJE1aBqfJi
	BHaxVZ2FcDC0wG7b3kShXI2Ce9du4bkGGFpNb3TCyvcEQziTAFD2+PRYs6YB/PpAyka7/usM76K
	u90WYlMGvcIfYclKSxUA5VsU=
X-Received: by 2002:a05:6a21:6d9c:b0:32b:6fdb:734e with SMTP id adf61e73a8af0-33dead4c669mr1477190637.28.1761283135826;
        Thu, 23 Oct 2025 22:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3SypwBbaeYcsMylDsibkkJkFzpDnuXNKIAef7Zx6JcuxdUyRtNbCfZYucE711DH+oerQGg==
X-Received: by 2002:a05:6a21:6d9c:b0:32b:6fdb:734e with SMTP id adf61e73a8af0-33dead4c669mr1477162637.28.1761283135369;
        Thu, 23 Oct 2025 22:18:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb3636sm4502218b3a.61.2025.10.23.22.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 22:18:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:48:45 +0530
Subject: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADQM+2gC/4WNQQqDMBREryJ/3YgJKrGr3qNIiMlXA9VofhtaJ
 Hdv6gW6GXgD8+YAwuCQ4FocEDA6cn7NIC4FmFmvEzJnM4OoRFPJqmZkjVHBTELRrANa5TdiqFs
 ULZfNiC3k6RZwdO9Te+8zz46ePnzOl8h/7R9h5Iyzmo+d7FCaYeA3T1TuL/0wflnKHNCnlL5mX
 ooivwAAAA==
X-Change-ID: 20250804-sdcc_rcg2_shared_ops-ea6e26185fe6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXxEGqjnOrqOLs
 PmyNY9UaDPr4Jg2sPdLWdLb6vqdMw2UwvImTaiKJEgxRFyBhdeTEXLt28IhJwLEklba6AJ+8WLZ
 GJBmFXFSnxQzfxKpYLhRyXJ4fyWSohUpaA52jMTtB5vY1K+0vdr+GIY0FRz5GrMfCxG3Pzfjq/C
 5RrJ8XkSdeD4F+TqMwUoTrYy0ZkZaSslwaH+vWFbpLr3QRl/Bz307lmS4gXjO8eFE+spV7K+ual
 4HmD9bTv9jvzOox/PC84Ko39xX3/C9L/HvE8N2CJt7nDCJc753dPLZd0XLF9YanyV+ynEM1oWk5
 bhOrLVmA3NJx3X+49HJypH82dkGQyeXZSOZnIDwI24c3Lp+xrrBMeVAdBNjVOGpHBUhF4HxInZF
 5+Hy4jyco8IlIImST6A2e1j/nCwgdg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fb0c41 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqA27K0koNEk4n6jG3kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 0ykSTlz3rik8t3bAjU_BJJ5EiJddzUCC
X-Proofpoint-ORIG-GUID: 0ykSTlz3rik8t3bAjU_BJJ5EiJddzUCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
boot. This happens due to the floor_ops tries to update the rcg
configuration even if the clock is not enabled.
The shared_floor_ops ensures that the RCG is safely parked and the new
parent configuration is cached in the parked_cfg when the clock is off.

Ensure to use the ops for the other SDCC clock instances as well.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-qcs615.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 9695446bc2a3c81f63f6fc0c98d298270f3494cc..5b3b8dd4f114bdcb8911a9ce612c39a1c6e05b23 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -784,7 +784,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -806,7 +806,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -830,7 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250804-sdcc_rcg2_shared_ops-ea6e26185fe6

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

