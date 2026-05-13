Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88046AF1A
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686547; cv=none; b=XTRvIEPH0D8xvxh0Pv1K38Or4bj5pTMqCqNHIlK6t0PRrHo/Gj9GYmBLF+Npa199BBEgBNfMKfgmIyPjfWPQ3Vs+aRXG9kQ2DsS9b3snHt5GusHp1tHoNYCLUfyBoqwMdxKEZh2cIKk36WqUVyChFgKdshtQtCa7poWXrgdLiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686547; c=relaxed/simple;
	bh=kMNSk39bNo30KB6WJu2vTf44IOSSIKHLbKFhKuRsR+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I+wfHwwfj/6Z4LwTK1gSd4BpzaWz4k6OuikflgG/KVB6T7bPKp8fd1v99cDatiV1TldzNHPcVDQ87Gg6ELUuxJ0uCjsbPNxrosev2GhKn8T9J3ZUD9XP0yGccoTSlbr8vS92pJa9kroVhJ/kLDjs/erFJ5Ct6aC/v6sH4LunEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f44m0/V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B75nJDNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f44m0/V4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B75nJDNS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFKWdF4082468
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6AX50bGOYpZuXgoP20+PQy
	NY7VRPx6PEWPIE0dzplYw=; b=f44m0/V4a6Ms4JiVcPBEHQeUCOzZk1hCW4E3f2
	Zwpq4WEYPfVTUYpi4LHoxmfJHFq+WEbfwQy4h9iwTqq+z5GZNpMZFCr/kTmRlfcH
	DpiuUCa1eNyFs5DhVhQ4PJDNmKRWSquMCFNqhQFIf2vPqiKVRPPMFIa59SR1IwO/
	Ajp/Pz1wOPpoda7TfzKv4Z+AS+pwRkHODMB8XSpUELeK9aqxs/+Tc1eqRnMNNfWl
	SsXyzdAVvmmMyspCW85u1qcKyGKwVnYe8L9UILltizwW7U4LQiNtJ3L6V3dsZ2pE
	o2jR4an0KpRK/1cCuLKzc3f9h9clWBxptbB+EuADDLRfh95A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1jwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6347ed78bfaso3001022137.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686543; x=1779291343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AX50bGOYpZuXgoP20+PQyNY7VRPx6PEWPIE0dzplYw=;
        b=B75nJDNSuCUvaNoAvhG98XJQWNz4Ie+fjnsc+h+ZySk/kVwTEDVXkvme1mBk1+XVMV
         w2mUyv3hofbTJ7IYjD4Iqys+9+7oCjjhGHUyxmITEB3lOxjpYvVZJToyIXrFz2TUL/++
         auy4VOlo3aDoyCIVXaDiUMlyg8B9h/utgdVrJ/1/URJV7nB4Lh8nL2bhzzbTG3fosRDx
         ppRw5nHHV7fQgnl31nrN4L+pEQsOuQt4Y30kPZRE1foz4zI/1YxwHPxjRTtePdMJdVr5
         S+KrrmESJLR6rGP1J6ScOpo+KTxWuA+qqxu8fQ7aRYNNA0hgpv4geIztiHV2xiYki7R9
         P4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686543; x=1779291343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AX50bGOYpZuXgoP20+PQyNY7VRPx6PEWPIE0dzplYw=;
        b=Ue2Cfy4AUU8G8JOU0Bqy+PSJ41FyKxwNZJMIENEIFReneELdqxeiTFNlwYzD48MMql
         zgaeTXVYgbkGPMnAIGQeIypDYs/tF5txJcUCr9pKiWwse57vSUzJfcV7jO4w9mAjR+Hd
         gnb6X3nWVQl4Oa6dummIn8GEC9yttSIClpQuAJiunTMbfUaRI1KVmpOZAamGWHIgAL+F
         JOZPq1iSFw1DvglE20uOaUbVcnmtrbHqqWo4fQCkhyJ6D9nXHfdb7P746XB2D0UYYhSv
         Q26Fjsaik+Czdzhw768LeWddvotYK/hoVgp4ZCK7giflfGey0VWNH6MT/5rHEemBSA51
         SaNg==
X-Forwarded-Encrypted: i=1; AFNElJ91h8HkCerhEYGALJOUdAIsd3Q2n91S1I8TeZnKYyhKCqAyurjotc14Eaxp+SU1OKF9DR/a5kAL0Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpb3s381x11iyGtacZVB9muN0NweDSh4gBJ2tSILu1EUGRWZT+
	1rFob0qgh4YB1KXWBcMsS7WmoABniXHXN9zlK3+xYLwckvP09/ts3tvZPsiLuTcPipKjT3e5zb6
	dgFFtcrFcDVw/uNOUzGZhuyFmA+dJ7qDWeVlIPD+Vpkq8AEBqBAjDHQOlyDdC+NE=
X-Gm-Gg: Acq92OGdhLcxznYHUk36Y3CEvvie6FV6eSlHbr3NTlS8gpR82OFnqgyPo71iC5gjDbW
	JTdvDnDAQ2dJXYif/a2wB9rSTJaTHYGE1hSS+dEd5511E4ZdKQ96mDJmWcOLshLLtjogwCvgQU2
	xhQnKkfpgrE+6eJvQHntH/uayCz0tBLXqSBh1jQ8JC4lIuU9xweg4HBGAXT/7vCZOqOmDu2TMbg
	PDpRcDe1cPNO7y8NuUT6EOoBEN6TdvLlhr98sqUBkaz6WCtEgaZxX+zvyhEMExRBYRI6UIatj+b
	r6G9kqLA9tCgV2yuE2NHHFisDWU3UibVoMGJ0b6lcXVhf2zK52ziy6E6lY0sjIurGMs671ab29M
	u7PUCxZ8MXxMtiZOmy/5hsEpd1g+8X8kfHVMHAQhhQHUMctS0Zg==
X-Received: by 2002:a05:6102:84c6:20b0:638:944a:49a3 with SMTP id ada2fe7eead31-638944a4b17mr455714137.11.1778686543428;
        Wed, 13 May 2026 08:35:43 -0700 (PDT)
X-Received: by 2002:a05:6102:84c6:20b0:638:944a:49a3 with SMTP id ada2fe7eead31-638944a4b17mr455529137.11.1778686540123;
        Wed, 13 May 2026 08:35:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: nord: add missing define for the USB2 PHY
 reset
Date: Wed, 13 May 2026 17:35:28 +0200
Message-Id: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECaBGoC/x3MTQqAIBBA4avErBvwh1x0lWhROuZQaChFEd09a
 fkt3nugUGYq0DcPZDq5cIoVsm3AhikuhOyqQQllRCc1xpQd2m3Fo8wK93CjJiP8LKyWTkLt9ky
 er/85jO/7AVqBoYtjAAAA
X-Change-ID: 20260513-nord-clk-usb2-phy-3e60fb0c31d1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kMNSk39bNo30KB6WJu2vTf44IOSSIKHLbKFhKuRsR+M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpDbEKrugiY1HaXa3Mgrvl6oSYX0qZDcaT8x
 YsUb7Oq0qOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaQwAKCRAFnS7L/zaE
 w02VD/4jkfnBKF/itcTSEYinM861teAxQqad2iojoN092cfUl7K4tpOkwItU6oHq8ZbEoZRdCEY
 T8oFjikG/NTthRYMEKdBZZF68rMdvJdkhLA6xhPKDnLqfEyqyZckEmMTEEj4U3DGbhUvsxz2C1M
 Wu7LL+Wag22zYDMGjcpBUmM4cQR+pVNFMn3v1FU4PLarEMkVau07ELFkW7XziAK489wxDE1f+N+
 4QHsj1jtjboYhjgX2wb69qbBfkiJQnnuemYNKPPkb/ivNablcUuYAgwlPojY/qvU0sbflQH+UlV
 H0G69e7XbemRgpORdTE9PSFrloykr/OrAYPQ5DinbP7XnVuO/RKlfwLS4fbogxPOFeogKCw4PSa
 57OE0eeAGRW8aa0LcCZzn56Hu+IVBYlXClTSza7itAMlNMpY5SzjiqWanEpcgOH5oZKnWh69Mpi
 230VtmlMcrnKfwXkxI28ajHmImw3dxwYGDyOHUJaEPSla2JR+q5Yf3S6pJVX1BXILAG+iFqS111
 g/Vrjs8fmy4rKCU/Rk7P40JCbJpjUR/NYyjWF0Jxm2oqqjjOXCwRSJWSGAP8i5I28ALp1dK1sqy
 8GYDIC45ecUiPgp3oHDfdyQw0/WNL2NqpVcqilt9rE8IJ4nBSCYhLZ1fsy96rCCPfta48/xt2/K
 BvJo8uTI2TUTH1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: alAHYdsdTdEtxWJminH5VCqHzB-5zat1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OSBTYWx0ZWRfX3P3nkb/ioDEB
 ZVbxg2WiQqhNR+0d+eyJW8l+T2i81ZAZoAZCnH2haJAGR6bFxv1NcSj4Mqem6b2v3L5XZD1OfQX
 2y02GZlgrIKjq2hT2XWRZsQQPGNfaeMCGvtH58Wzb+Q1ba3RMisQFBbgV05GwJj4reK/Lg7iyOA
 xVBH7dSAs9x+4DPR5P7nFTwAubTEnWh4/rFfZwo2XX8N6U3tSZiE8XRoVuJ6UzCJe0p9k/TiZdZ
 kxxILyrROP+OPIXb2R9Ydq9OGfSZDQorGKrHiKxX1Zn8jWM70oILgTrl1+LcnFLWJxVPOdzaZ50
 CaP1GXqE39poJQhGRLwOlrCl0azsOR38Of1FNcGnYEumUEQajRclFUtpiW7w3HGT8MBg1cgJP/2
 o/vLF2B24UeOWEVGu/vfuIiCb6IQQr0D176ZOs3LqFyJWakTZWJNa3ig00Zl9ORKohuxRkyiQ6O
 jf/Y/sKhJrFzlII8fUw==
X-Proofpoint-GUID: alAHYdsdTdEtxWJminH5VCqHzB-5zat1
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a049a50 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BGJgbtQK9DYxViS1Zj0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130159

Update the bindings and driver code with the definition for the USB2 PHY
reset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add missing definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add missing definition for the USB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nord-clk-usb2-phy-3e60fb0c31d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

