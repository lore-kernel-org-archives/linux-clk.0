Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7952C2340
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454299; cv=none; b=Abqv/Wb55EjpzgHltyhE0Z9g67BNyAI8i6/DAfU2RkVgxtgm3/TSuO5H7wu5gms+hCCVzgX4t9Ts8jYxCiJMzOo2eXEjQUcBqoAowS8K01rmUnf7RH6YI21bLVYshJvKTQ/knTsiTvwggI0nSCLfORfPoo70KtewPkf18tdf6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454299; c=relaxed/simple;
	bh=2PKGQycBUFlWqOeCmczdNYF3bcFIHeNZBIXA8HRAk4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qybwTPdFBvm2tWG6oZx00H/+PkK4RQo8qiA92hV12YjcipCMRvGgayxAvAwsvDlJmTc3SsrDMJL94pC7cG82zTL3Wm+QVp7jFpJ6DOWGncC+W6e2cGsXeMSRztyzIcD+B7HGnbBi6+oPw1JLY9u9YDs+slDbQySWXE8R8qFx9zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXJuG4K3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXJuG4K3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T5sfUP003594
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 07:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nMmvvuBBHOBvmrBWmarNJi
	Kf7qrOg4JEex2f2Ps3aKM=; b=LXJuG4K3BgRrfeZMimgCglFvWnzC3A6JB0c5b1
	gWZAlKyZD1vBDheU1lkx2rB7d86lUE6d8hZMb7hzJ2dYvgVmpOrfddeR9oVHFmRp
	qD4EtZbCxAIWzC7vEta6BXyasLicDH0iYYIFySMPxFlUIIs8kfTr9lJ7QXEOe3VY
	uQTNShypSf92R2zOpM7NTtiAQGxqaR4skZMEP0btSOnQpAgurJ5lNQeNhpo/9OdS
	lZYGdh8DuGL6z5OeuPxKu3iKb6BEA9uRmmIgpcv0UCMgo/XEHyaDRi2haDWIdJ26
	cKognMvQdFp56GC3U2sapYvWcsMUUZDa4Gz5YU907J/N7VjA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5weawu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 07:58:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47174c667aso1535137a12.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454295; x=1757059095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMmvvuBBHOBvmrBWmarNJiKf7qrOg4JEex2f2Ps3aKM=;
        b=hKJGr4NRud+4aXgkXcOFMvuEPop0B7n9SwAY4yPxhajcBFtUJsT3jFZHszh9z9iZFY
         9H/w/R7SBiHthqFQmVdSOOzwDb6ji8X7FDGj3zeoNvqOVyY+REbWeq6cQ1Zna0rgX1Zi
         WaBYnwnbUDv/0DKJL7G/U+3yxvf1agv7Algf8xTU4M7V2TB/9kR7mtizCWaX11Ea+OYb
         vC8l1yg7ct5/1wUGEOQdGZpA2fwhs7fByrFD1jN8sdIpe8lhnancCUDkYQmjZQ6s9mQC
         KYx5GC2MSD9d5IhoqiWTbtqZ1kHLK74PNWsTBDPQ/DjCha9r4M4ZZvNCK+0hgX7kHF5q
         z1MA==
X-Forwarded-Encrypted: i=1; AJvYcCWV5YxPPPaqGkHgrr875P4QLdUwtOcGGAoY3fe0w3eLbt3SmYn+6iQZtw3/iyMNu5/LX1UILoJWN20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyMMfNJmZU9I1+bSfGQmYj1Q5YFSZGDJyuMrcy3fhhQRDsmut
	nvsTJfOVlANgbGZop69/AgKxZeotaBXg3Hp6DZrFClUGdH3Sf8iPjCNVrFXym1r9FRA2WciNHwA
	kxXZ4Ml5b976+RtD9NNvGu/xqRZS9HHuILa8qWESfN+gc/RPm5FS7DR9kQBlp3N8=
X-Gm-Gg: ASbGncucf+mOIg14UHE+kPzFBcNfW2HhJW2nHMe8VR31Ak9ZCWEKh91GhpE53lzCDxR
	7hA1VZ0DdrQTDmRg5dOcG266HHBmASvx1GtZAEsBSxeHrLRODVdMqW4CR6b43hapKHUli4hR19m
	1HvTHBNy3opeOKTZsr7vioe4MXAoE91He019MoTWZ6AKiWINI5TCxYADeUwNMNdiRZNRGItFrMe
	LjdfxWZLF8cxcZB/Qfdi1rm0sk9nXGat3kVMM7Bja+o3HtwQ2asJoNR6ZV5M5TL1j46Tty9eJ5T
	Kp1YfcZxRIlTswZQ1gitUUo9KgITkSwe/9u0rAXXRFv9xvCkRpmFIRrQh/3l6CCL
X-Received: by 2002:a05:6a20:3d08:b0:243:7136:2fee with SMTP id adf61e73a8af0-24371363240mr24723745637.16.1756454295484;
        Fri, 29 Aug 2025 00:58:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfNF9XR64zX9+kWe4I9diEOKRZ4goaSDhqBkb/7GI5U8d7hw0kot9p8BjaG3AyVB9EFyxlvA==
X-Received: by 2002:a05:6a20:3d08:b0:243:7136:2fee with SMTP id adf61e73a8af0-24371363240mr24723722637.16.1756454295007;
        Fri, 29 Aug 2025 00:58:15 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bb5dasm1554416b3a.55.2025.08.29.00.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:58:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for Display clock controllers for Glymur
 SoC
Date: Fri, 29 Aug 2025 13:28:02 +0530
Message-Id: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpdsWgC/yWNSW4DIRAAvzLiHCRgFpr5SuRDd9PYKLMFxlEiy
 38Pso9Vh6qHqlKyVDV3D1XkJ9e8bw3sR6f4httVdI6NlTNuNOCCvi5/673omOuhedn5S/O+nWV
 fFilVjyZ5BwCeUFRrHEVS/n31Py9vLvJ9b5vzLdWBJ9/aZO6SBe8QrBiKCQI5cVMffAShKbJl8
 SLI9tUlrNLG65rPuTNp4NAnLwSTRUYaex9JwjAMFqxH500zlNTl+fwHS8mF//EAAAA=
X-Change-ID: 20250829-glymur-disp-clock-controllers-50f728887bae
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ijIndvLJtLjtMJo5BZmKzUTg9FXYwXTC
X-Proofpoint-ORIG-GUID: ijIndvLJtLjtMJo5BZmKzUTg9FXYwXTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyvbhBxMuD96m
 jcbC3fWp1GNxmb6KVdlVk+2CAdCVWH+R4DQsT4ngpKj2oqt1HbFccd9VYnvf5/8l6uCpO7k/85W
 U68WMFXJ32ja2aULaWKN4OOMmiO3YuPyzvePEaGACzqDYl90yinNtgRnDeugohZfmcY1m2X0Gtd
 hJKfSC/qOULjCzTIx1QV+q2JdrjwZ4APIhD2xQm/X1bU3jKLfZS6fpvMBiciAUXOG/Z42IpvX0v
 dKlg13pPrNGt2UlQ8RR/pGHiWyAr61Nzp2e7b4zob4diNUU9VndQ98ZOwooGChLzlaw9Cs6+tnt
 il0NrI+++H3NUTofjIfTK6IuAyuHYzE7csDLisYfPZRbV9mZo3DnCZEnqUkCqGK6OGMKbZ794/m
 z9CiFJg7
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b15d98 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=01lUyKRgbtoGor2CX9EA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Introduce the support for Display clock controller(DISPCC) for

Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted separately after the
official announcement of the Glymur SoC.

This series has a dependency on the GCC clock controller series posted
https://lore.kernel.org/all/20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com/

Compilation of the series is dependent on which has been added as
dependency.
https://lore.kernel.org/all/20250825-glymur-clock-controller-v5-v5-5-01b8c8681bcd@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: Add DISPCC and reset controller for GLYMUR SoC
      clk: qcom: dispcc-glymur: Add support for Display Clock Controller

 .../bindings/clock/qcom,glymur-dispcc.yaml         |   99 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-glymur.c                   | 1982 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-dispcc.h     |  114 ++
 5 files changed, 2206 insertions(+)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250829-glymur-disp-clock-controllers-50f728887bae
prerequisite-patch-id: f1872a81e0bdf89b2e26397d8eb6dc1ce7eeac1e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

