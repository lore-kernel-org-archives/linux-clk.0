Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BCD39280A
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830403; cv=none; b=ngBi2ozO2GUfxN9dwpZ/20MuLoFvHUCuLLujLhQKrklMEpgp1HZG+fpqxsWu552CkWIYAQKVs9OpbCAmLFTAdcFimcKBwgqfmWQA94MzrvBXa3NMXdLfhfQx/k1qeiLEhpScQHNwVpxfeUdrlbcs7CiyPrdbXjN1yWSjII6SN24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830403; c=relaxed/simple;
	bh=401D9kEmKTyHpPqYAg/Z/Qf5C2yosiphgkzy42eCnGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GbR4IQj785dqeFikh7sTefw5jSI/5Jzuyh62qTsU24dQgN0ps6kKowFxRwk8jFjbJO5ZCre+FMYcARiVPKe/U3zcpUB1+66ks4fC7cpg/FJo9XdIUtwIvd3b9ToBUU77MR0md9cwUa0QjHVq6ONrqlSC2bTWrYAaueXjOg+QQoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX9JkzBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFsUSyqv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX9JkzBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFsUSyqv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I91VC03281294
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NOT11fLBhg8AQfpgLgkRFQ
	5ibPvIj5FtpD4Ln8bl1q8=; b=jX9JkzBDUNbkDtRL+y0bw+dF1UVhPzIqRopcvg
	xIeCiitkKkzTv7d7pEDYR9DwPZwnfX6I9VMfLdsT26FmlZM5Qd9aeE1bXw9dfQyA
	kk2n7STSl7wpp+1P26wKnCqes/H1zIvzBW9K5b5vUhgpy5lWwMxP++vRfxbQaA+Z
	K8r/LqwkvlUlnhaqIF3a2on6EdCv6X5dEcLB/lWhLsNtheOee/jVBQ3TGwdpOMST
	Hwe8mcLqO0u19y1hXn9fwv11HLTZGzVOQ1YgArxoluPNqk/qOmneE4qZ+LNlgqHj
	msKQ8QHIl8xIwInp3XCktwLQF//Pt9QlkA8JPtrxfk5V9zzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62v22p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:39:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so4256481cf.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830375; x=1774435175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOT11fLBhg8AQfpgLgkRFQ5ibPvIj5FtpD4Ln8bl1q8=;
        b=EFsUSyqvI27imOlDc8pgqlzTfAzan8JqPTOyxbgg6XCrmY9N81ejyElEpRaYsmncg+
         5lZjUf0XQWnnOC6ds3iZxPrrMEl4oqrh6g6fo8zoMpUjV1dV9ajbmvg+Xx9MJ5Hn6bEY
         4RJNzpXg1j+n0bdFQGiB7MiISapmH999ep2mk1U2e0mIo7Cy5H8SW8L0de3ZCUjHs6/G
         NheXcFmwGj4ZuS2/3/XUfCen6Oj3gy/pTKkVV3RbQXkbsAQbNBTSBusJjWuIyyz9iXPN
         eU6ksDa6DhqVv8eLQFbOJb98qNWjUVn5l2wa7yXrfcy++bTaZqM/8bXR822t/sc81mjz
         fKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830375; x=1774435175;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOT11fLBhg8AQfpgLgkRFQ5ibPvIj5FtpD4Ln8bl1q8=;
        b=n9R8PoRlJstm4+8D+YWo4XWGr0CocvbCqaZw8TGM+WcwjgbMEepuYviuOyfsF3sz28
         7SZpPoGo4+mIGA2w3OAf5ECpzN2Wb/cijdNei2YcFHZrvWHVVyRXu/0EI8aZXo4yKtWH
         Ls62mgrDeY/n4LXUvZ50fpfpDPafJt5BgIKEYk9DUmWdtcJiozfeA+xlk5M8Qi+J+tQO
         SQp91qpCn6D97196bl5oHOGs/GVAspZhvc9R4kRol2J+2j9f657r/SG/V+v7Z2YH3XTZ
         Ii/0G5hzYOjW/NUHV8hEckIVYFwYIt2f6kVp5/Ttq0eylca/XOWWsH/jfRkTUL8Od4Wv
         IYeg==
X-Forwarded-Encrypted: i=1; AJvYcCUgPmBZhc9ZKjYaz6WB3waAE/wumgbW0aG+X42K/IGO7GGzg8hDzD6EtxGU3zG7I1nrSCnSFN+0XF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJfjBKxB5PGabFfrjgC1qeZnAv0pLJ8pdwFaOUZ8P008z9F2Xt
	CEUZR916gTmYx251TdzBRuKLQOuy4DsiJQnHJEFX0Ni9+fZwkBPVfXuu6+DXMGIPcwhyWHJtA0q
	dL2zI6jwfNbDPpJBcv0O/zCcIXDTO+pBxYEX8TtyscEg+89UtUPoibmg24rOtDNo=
X-Gm-Gg: ATEYQzzGC+bRPzWnlUvSw4wnYgX8hgIEIf7SD9rG0W4JFmoKVM06ytBWo/vA13YCf8l
	JnbADhZq78en2o7lrXt51cMAOkcDmZIQvVgCcZcdWaoGXTazelQo66pRSm4y8J8hm70Bstl0AfS
	4N2up0t0mNn3LXvgonkOe95kIDJp/ziChVPSyuAzj8+fE/Ot7Ip+Dy63Yi0ax9YcCuaqnfAhARQ
	bkW6ts575iLRafVl5j7Npk3m3117nEtCxVhqA6JpnqmciUG2Psa+3EyLFGb1C/6QLYBV6Uqu7aE
	+DwHWcGHCWXz963EnCs5nrh7zs6LVFYXWtQWJOdz7Yv4Sl1C2uRP5dEfrHviMrDlBjfvH38SvM+
	7Oz3AQLLTIrHDwHQlem/nwC4ak9LFDPP+GoPDevIoZ4mu
X-Received: by 2002:ac8:7d4b:0:b0:509:39b1:d4b3 with SMTP id d75a77b69052e-50b14894384mr34921101cf.47.1773830375613;
        Wed, 18 Mar 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:509:39b1:d4b3 with SMTP id d75a77b69052e-50b14894384mr34920921cf.47.1773830375195;
        Wed, 18 Mar 2026 03:39:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm7300906f8f.21.2026.03.18.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:39:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Add Eliza Disp CC
Date: Wed, 18 Mar 2026 11:39:08 +0100
Message-Id: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyAumkC/4WNQQ6CQAxFr0JmbckwoCSuvIdhUWaqNIIDUyUq4
 e5WLuCmyev/fV2MUGISc8wWk2hm4XhXcLvM+A7vVwIOysZZd7BlUYPvbzD5OEBgGb0H6vmDEEq
 Na8Q9htLo7Zjowq/Ne26UO5ZHTO/tzVz8tv+McwEWWqpaSxW1rsJTFMmnJ/ZaHXIdplnX9Qv/t
 pmfwQAAAA==
X-Change-ID: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=401D9kEmKTyHpPqYAg/Z/Qf5C2yosiphgkzy42eCnGw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoDfJUvaaPM9UNFdk/uOXkmcGqwHL3YOrdYOI
 eTEUwbj5IGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqA3wAKCRDBN2bmhouD
 1y54D/9zhxQDhsiAgKlDYSGau1xauRpkoR3fsRiwgGic5q2PAvGOyPnZLy3yYxrK/cbg4kzuQpC
 u5xPgALuIP/nM87VZeWOsSS8enOevYhEpGrFleQwkffJR3ftuWC4KQSQ5TQYsvS3GEmN7xNbCP0
 KvONS37HdTAaHJalc8akveeYjFgscYiXOoqAvqAgCpqHYUpSk/lNiIxrzBHY+3HtzVYJNdHoXbc
 3Mp6FuQr9QOfcTEFaxIiQRnKtj0euGMMh8/U05g9ndhYlPUvzCWxVG4iRMf3G/HjDVp9ZFbhjDZ
 IJfbtq0K1hehRDjK9XG/bhuWgp415yzIRRxXeTmXUhyW7DgzSX97EfJRNS1UxJcTKiojjRDRMuJ
 riG1Sm2AsyVXU8oJY3A/Re78dKc5VU8AW8s/834Vg9hv+hZx1sSSOZS2HuZZpNlwPqxgK6lISic
 5NWdd51Rg6f4fvqAoOmyF0K6cCegzLZnvb6DEDpFhvYXLywnluY+OCCm9E1/hjSPH33ApueKHy3
 VS+i2e1mVQ10y7w1sM5ZlrI8T1IBVVCQmIDaqLqem+OJA01czm0LXs6eEJ6CuMSoZKq4JRgZT0k
 YbgMCmD664OLFf63zSVvkESiRPY1rBcTcNRhhNsN0np8nJVkZ6o0kXf7eQZZyKrDtJAzEaCriLN
 BzUuEMh0PtyxJmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba80e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HbYsRfoLwT6iNdaUn4wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: o4RdglV8pKByYO8j93EyFI083jdvg0yk
X-Proofpoint-GUID: o4RdglV8pKByYO8j93EyFI083jdvg0yk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX3Ee5ixdQFccA
 +WEOmmZf4TxjenFIi/LceXYtQ60FmewGO0zW/g+mIWdTIdu0TduwgAbfeRivZhF9AHB24CvPIZJ
 M2ifJdIroEnTrlWzc/hL47SZbhNg5hBfXpJOuCmGowLqXFUikD6ExbzEESDu7B2BwxeUXrEQhdc
 f83FDixqewiIh49bgv8Ayb7VhG91uvwOqYMt9mx9JqIZaUQ4bCTS14oWzs1KBlEM6PXIBcxEpu7
 mjrIxboBlRoX2Ka80WubdNUXkP5sPncCfjOkgF/vjkM2Lhwi0fTAYMBf4VHpXFcOZW6Gh/NA9s4
 q9xlyMGJ2iaadStrJ/uyUEPzDUDVWuJ0APfT7FVpu1JySNOtVoJZsiVBgDURJ74xWwzZ/JRTQYg
 kj8napENWHee+d9OEVIJ2YN0o39Vi2s9VUloBem4f3qLZO4c2NOb6dfZSb/Ta2TMgGpj02c4xgr
 6teKKM7HF2EB7UUV1CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089

Changes in v2:
- Patch #1: Drop redundant descriptions from bindings domains - use items
- Patch #2: Use new qcom_cc_probe() syntax simplifying the probe.
            Few style nits.
- Patch #3: New defconfig patch
- Link to v1: https://patch.msgid.link/20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com

Add driver for Eliza SoC display clock controller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller

 .../bindings/clock/qcom,eliza-dispcc.yaml          |   98 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-eliza.c                    | 2118 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      |  118 ++
 6 files changed, 2345 insertions(+)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

