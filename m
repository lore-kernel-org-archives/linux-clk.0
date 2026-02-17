Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B872D4801
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314760; cv=none; b=VjCUVMIU9q2qiNSt+f1qulLxlSVmC9kwD9Jn9RPfzF2ZMXKkWyrUPi+gxA7+yUWXEcP1/BiWBcsQDPuajBJltTl2J4i8G2DTW0m8PlPcjZLcagKHSj5lrBmjLJe6zq0+5PUowjM4oUwhpEd/0CiCaSdnOwVzSYx5nTOmHDjJO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314760; c=relaxed/simple;
	bh=P99v71vXB6Tma+3ODU84FAJ+CQjFueCfB2f82YzLfo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IV8ZvCvvTCiXR02pkeo+TvHd6KoxHG2gVhAWEucAz/iWUomMJsHX67mvS5G7ZfTHT1VUeuI8OEKHg5wwDVWt+d8lcndS8NI6mZlPIZW8QS8fRDJ1M5GOcZOubYhDAMEKixUgjz56gOmR+Zpv+XQVzxwUPXdtiD2/kXkn9YwhzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nofkihl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFxKXQqt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nofkihl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFxKXQqt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7gD21613313
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wzrtjHoE6XpjJViBBbpctY
	HXSaU7UBWJTh5CQErmtmY=; b=nofkihl0j+J5glqNTrn8kPc+wcthXyt6kWH206
	Swza+OCb133XXQG7t56RswkMSUehu/wwJN0e85JxQ/Nl4fbsAjIeGUxXkRs7kLJ+
	fYNiqZsg1VFn46iBVN/tBfSZFE4IYlKz5cG2Q1Tbit5r3cN6XtgGKzTd5nCc6h3n
	b6eo0OyR+ZTpBCES7h6+BAeh41Sc4k+DJBTZBLrkxNDZu87pb6jp/CGFlYbtoIf2
	lnvnUtTZetSKNBYCSWtFa5XoLQqQ0jzfRR9ox4BDjlTx921B+zxQG+H/Cg/a3//o
	4GsLNV3rcU8WT025E1Wn9UMdIsj/Xxc4Hl+AKRUANhhcb60Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sk4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so2036613085a.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314756; x=1771919556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzrtjHoE6XpjJViBBbpctYHXSaU7UBWJTh5CQErmtmY=;
        b=hFxKXQqtXwfXG8sgRXDxiFQaHKVLXy4wb7tMwTlgslElOuIL+rCvx6Bn9MWaJdXQER
         biUOnxD1imGfs1w2ablZKd84qO/pGnmgiWNVZ38a/ZDn7VI22Q01SNd1o/zwh9XYQodT
         QV7CR3oQeemqcTjHmZRYVw4B7Tq3jcrOPtQDmWAqfmNeA0v9+xQmuEIN9iWFCoZ53XLy
         YxEsLmykt5aqjkhLQvwYh+de8La3KGIHnqU5Pm+Cv6o/M/FTn3bfn1WItPqW8cVbh63l
         nEvjZokYLYPbi8ZzKQl78Qv9nOukG2HfKSjBl+/lb88umqZlGsqbXUSWEDZyfc6igLr6
         Bajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314756; x=1771919556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzrtjHoE6XpjJViBBbpctYHXSaU7UBWJTh5CQErmtmY=;
        b=PeJ+WJ9sbbUl5lM9q2/eFAauRC4obk5vumHGlKu49ggDKqLeZzLhF5zHI/KoN4HPJE
         lRhegwqw4F/YD+y3ssWUG7w2St4ussp+JQGSlS7BW/NsSG1YPk60cJA0bq8q5qhI7O+0
         j549D/gTEEctYPQskARJImhRYzk56AjZgy3Y93w4GbML5cJc88JFJIahYtHUk4+8lVe9
         LtWTNt8sUY78PjTEMeSCQyraMvs1oXCdHDVlMMxowaRPIA/0MeSYRhLjQ5QojNXIUR0k
         e5wUq4SMToA7tAfgJtgMvvNlTkoSFlNU/fKOW0Muw7ohgbSMhiIu3X8ArmaFFbjmHqcG
         Q6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWOZ81B8lczMV0egNQ51YrTdhwG6ANUlBp+ppIY9jSk5orzRKTertNvMc/AmNxWJ2/wHcUD62e8FgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2znEH+xiurNboQjqbLposE9D6ZS5rc6ACrsthjBew19LKzrh
	p3Ruee4z1mNMUkFfLB1Yi/vRIBUgjM3ysSA8n6qunNKQTSeLdHnM1iL+z5nBfYgzeUnZ62gYt1u
	KXypRQMV6v/p2z/zJJEVZKbNl4W2mP+mjyildlJxLA5N9aFUvPTtQlXouHTlHdOk=
X-Gm-Gg: AZuq6aJRoh6m7nOcXkx92mcUh5kqHzqE3SlJsjGkBIVIqfhPjLnYL4Sb76N9kD8D/Hn
	9eeNiKTqrWIROsrcZHmpj443lq0+9Mp8xbQ52KCiJnr1/rta4+RVJkcZRhq7nUQMrxTKJlYj9dF
	B4VC132nADY1iYCsY/RZCBPSR89X4rPLj8qsU+faRBZ5YaDBALrT8oTraIQaNXAG0QWnoLcmqoK
	qtkzxhtxfBEQhsR6pT2cwAAvYtpGVITFVkfW1ttNSDOAbI8B/KdlQJppIb+GuW4YFeJEJxR60zx
	EIlBPtCyKf1e0tPsievvOfdMapm2Vbc2xEXBS/D2+q475xQxhqLTgZGugtITcDyt0SkHnoc6Aw6
	ZBkOUrIN7yL3pnO4gDbpSpvfuyJix6g==
X-Received: by 2002:a05:620a:4405:b0:8c6:a628:8608 with SMTP id af79cd13be357-8cb4081f75cmr1568213785a.6.1771314756112;
        Mon, 16 Feb 2026 23:52:36 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8c6:a628:8608 with SMTP id af79cd13be357-8cb4081f75cmr1568211785a.6.1771314755549;
        Mon, 16 Feb 2026 23:52:35 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:34 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Tue, 17 Feb 2026 09:52:20 +0200
Message-Id: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQelGkC/3XNyw6CMBAF0F8xXVvTB1Dqyv8wLsowSBWsUiE+w
 r9bMEYlupnkJnfOvROPjUVPlrM7abCz3rpDCNF8RqA0hy1Sm4dMBBMJ44JRrOzNUKgc7D2NERW
 CzhkqTcLLscHCXkZuvXlm32Y7hPNgDI3S+rNrruNex4fei5bfdMcpo0kSFVxLXqSgVs77xak1F
 bi6XoRDhoVOfBpqYohgACDqSKZZDOkfQ74NwZOJIYORmgJio1Aa/cvo+/4BSAu+3kkBAAA=
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2651;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=P99v71vXB6Tma+3ODU84FAJ+CQjFueCfB2f82YzLfo0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB42bo+oDpK3+KxewEWsRstdqcpXf/z3Rg/Is
 2l8XyJeEJGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQeNgAKCRAbX0TJAJUV
 Vu/1D/9+UoFQ1AqVAPrK8EHBaQ6jiWCl6rftIwnQmm6T4TNo5v7Q8f0hGh5F0D+ScxN9EswIdEI
 C5S0a2kJbrYgdkDDKVNmEYHgQtN10/ZDyzN71qqITI8Qa6cg8kskEOsItlCqOYsjnF55lDPnD5/
 h300y8Z3/lbva3nSfVk3DFyCkwJh1RsjUaQbNZEDoKi3tWob21q1rwPyj8xoUMzd9ppEQHyuCrE
 2tzCwXI8bV/o4qhP+6qeukNUJx7pPA3ctlobiXZBhG9pu8ohc2txGwJCSGsrUsW9CuM9Qxve5Mo
 B67bOlC7XTt9cRlaH/OYYdvzmhO8/cnZjFZyJ8278Aq3gOjx6cdr33TM/mSdemPhCSBD7HLa9bw
 8zQB18bEtKYEgTPf7O8qz+V2NsQgFnZqsCRCn3T9pN7LJr0o9TXWUWoaDhdkiQK3Acs305XjvrW
 KRbU7nqtWZIcTK7VX6+4zGps3zlW+sNFgnFp8mYkr6nzUodajis+iaDyc23pbzBW9RM5i2ThHPf
 Vc62DyTQUjMUn6WZZS8vUZpvezlFni+tm8Kw8RiDfQbQ81AkJf//bOMEmQMS6jI6b8c+FxdfS1u
 nug91GGmnzQpBX95l6Sr1TZHbap7dJ+MCNTcaLF/rpwfmudJP10zZbHS+Atd+xSuPgoA5AQaS6t
 Q/9HvYvxq8J9cvw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX9sFQuN7u2sAP
 fNyEl97+DdB5UzqiJMdrJ1z6Xd81+cPef7VUnVhax4aE9KlWvpBIWRAkuTLkB6bdt7Wz7LF/dSr
 BPMejwbKFmczeercni9MPJq1iCqvfeqFr0xTO/rr590gkpUDWRErdA6arPePktk8gPVkxRK1GxR
 FUaTWrBZ+WfmJjabXWanBckwjX9SwwFLUviwSN9ET9LqgRgnUNnJeX7YDj7KenZXDok/NomkFcd
 +1MrvsmsmXJdCSJLgyj2wmC96ur29lG7uVVhtt8i/TPISKR8V6vaKKMRZgRLA4WsRw1sZh5+fP6
 MMrX3wgS82P788qE04BSZ7NfZakzXhgtzJff6nbBPB13x+bWvxYYCHxvaWgylJnEq2HJi8QCzVn
 2uJuNDqRk9OPTbYF0tM74aQI+eI8JPqP7AB+rgG+qMEi5cbIkNOHQjOzphNDMqsAUbNPRyxaHXv
 DlI70RCf3Q+AhMIbQgQ==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69941e44 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=RHXNpSf-syxuuu4qC9MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: u1qGdKzqP4pidhml1UuAh0aZX4MhUk7R
X-Proofpoint-ORIG-GUID: u1qGdKzqP4pidhml1UuAh0aZX4MhUk7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Picked ub Konrad's R-b tag for the TCSR CC driver patch.
- Added the rfclka4 and rfclka5 clocks to RPMh CC as they exist
  in the cmd-db.
- Added the missing HDMI and PCIe1 TCSR bindings IDs.
- Link to v3: https://patch.msgid.link/20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260213
- Picked ub Krzysztof's R-b tags for the TCSRCC and RPMHCC bindings
  patches.
- Picked up Dmitry's R-b tags for the GCC and RPMHCC drivers patches.
- Added missing TCSR PCIe1 and HDMI clocks, as reported by Konrad.
- Fixed the compatible order in GCC bindings patch.
- Link to v2: https://patch.msgid.link/20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   26 +
 drivers/clk/qcom/gcc-eliza.c                       | 3160 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  218 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 10 files changed, 3630 insertions(+), 2 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

