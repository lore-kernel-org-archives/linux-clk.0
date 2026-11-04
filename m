Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768914;
	b=MjQAyRomM0FGGCHCAunyUmGwYuttfxf5rTJKxvCuAphUhNBuNwZGeUNhW6hvSKYEobV0
	 1JK785jwFZb+bQoEGyRkoxqpqR2lQc1K09hCQpb814PzEnnSt7iU7/PC1CgJQWFb/Eo8K
	 l378pgx3gdTrkJDFWijWp+iuz5SEuXLehT9Px8EtDptTZ4TWyZh7qGxQ8dY1v05YhwXdG
	 k/aAhze/zaU8ipuI6lxCcKJU+eNd7sr0hCMFI/11FV5qsIGQJEnDOerWk5QDXuFCU6APS
	 dd0G5oq5P0P5iiTcIk9whx6AUUWv7uL6+cjVPMQFviSAIkTqLZKzZgRIeDdjhCFiKBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
	b=QO/6MoNE0xecBcpWL6Mw8ev9tpDothR+fFIdoDJF32mR1TXVWQK5+CLDuU9yfjpv+FyV
	 1q5xb05HBuD0jGbf/Q9M1+NIu/5OfHFGIjti/i+XfSMQ+g+r0OE5OuEdKEkXO2lzuKaDn
	 Kr7sIEeCdwwLYcgGpvAloOgoKs9p+1zQdpQ4qG0KYnat9gXAXZSkqKbr+DoQrlLO6bSaK
	 AV7F9/Md7ZDC+tvv7XqadK6vWyhw2jjSc5Gt7+kV8cjGhgngiz9+nPGHF9jRpQSEAN0uo
	 zxgluFq/r2LkVqryeZTg6Wqw8EMV9ybEpiqjY10tdB3gsJyaPMnVy9JiwghJsMKSwqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BB606A328
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593BB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RPOh230657
	for <linux-clk@vger.kernel.org>; Wed, 4 Nov 2026 05:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nwK1MVA9UCwz5756RDh+kT
	/5Gn+aYpD6Nw0j4KwOfYE=; b=l49cRqF+4xbbkWwZgLE2bW3VTcobyp7uvlEDi1
	yDEMEwT9d00k1aGQR2ak38exx1wGV7uqTIZKOIZdSR61sooEQ7uSlJkt5EWJWzsq
	SuQ/v9lP30wDavM4Qdl9VsHWmmKdtnL9iaL/aBqvAjAPETgRXgXKVtFVoKTMuvXO
	CBCozjlpoin9xUtHNd4/uXI/3pAmiQDOvMNYLeGVK10UKyKiKNnAxTkwY0aNlqrJ
	BVyhZarudSm71vtGMJzQNVvlDtJofU1VYujqUZRsmim1HgGqNH4DXkNjPKmmFO0s
	qtzlWC+A2OfU1cYsaWY1SqBUSrnm+dyQlcMnG5oGMZjng60A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypk7fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:08:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so426120a12.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768912; x=1794373712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=aqI6ATul4fNkxNNTs75ytyRgjjHOEK30aOk243zPIdKIwnMpHSuGTD93l60w9Qi+X2
         VufXsZZy7ZyKvYEJ2KikaNW3WutGi8BMe1OBhInpYN9AjgOLPXzUDcwQN/Zr9pOWSmYJ
         6C4+NAmsWr7539UkDLnRh0SydcWQFVtylyM23q+aufOF250wAuBdpySEIZXbTXKC5msM
         YNU3i6R7SxXkZIUPPmP+WU+WrinkfzsBjZ6tk95zkqadj/78mqVE3czXAlatwvI9jNYf
         D+icL1M3l01nkIyzcwauF7QAlXKzUiWbwXADt4GlznkZiOxvoTxTB9YV9ejtwlobKgzQ
         RQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768912; x=1794373712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=I66GrzdeR5MhhXkrFkCmVh3Umy1gF4NSKgRJb/176YmLQ+zlo7wEihqCc1MqbwUK67
         0km+ItHJHMfCOwc326weLrzFtEJyKG1XQyTBm1SIAYcpkcaCj7RcJiCnmRS8r2rUab1+
         +17L69dNV7IAhc4nJlYGWTPqJ89P0Ip79NBX5rR1OyNLPXYMOTolTgC13Tko0s5af4rv
         8kMJWAadrvy5kpR7ALsOebbCYypCCtY4hCtm2hhtZcUIyjWVNqgzQRd+5LmW/HeM3dMg
         UQxQnTRTPT8xDWGQo4lJajuW9XFMDXlPHbG/ZXCKc0Xcz5cVdX5pqYnfLa0lccCHyyz7
         4smQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbnaPqsiaCKTJXDjQejivmxclC41w7m5eIQ5dRf//BFWA37PS96cJ/nPAe+5ES7L7KYR8OS5aMusE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rTVwqy2teOQ1yzMzKbGJUkOksVOKGSW15yORd5U6Cuik6rNSR
	pRQ5haBVdTrGqAt3FjbjK7hv9YskSPZ1dfeNViADokzdQtBqrO96gSQWrfX78j4ZOT1PHkhzyVu
	D0dadbi7SOQ5RIBYilsqgX3RcDhNoXEmYWr8O9oLkpN3RCPU/kXkhqrj4gHExv/c=
X-Gm-Gg: AYBFou0YX6pK+twXHR64wHkkosg86mmrhbYtSxVagmFY0vbB2mqygqc9F8d+etCb5mv
	qqQM1u70TkVESOD6saQZScaH+Tunr3f1vaBkknChZ/CKHRGtTptIqGQLZdoE5hF9DqvJkL8QzV4
	fnWDu2NvtYvfRWLM2o8w/6RgAS11SakpsakG7ZKszmogaxv1TJ+MZ3a8ECN2981OYwtA/KjzG4m
	Q2IHEsdUz/ZnDOjNMSUNvF++EpBJ0on6/WTRDd38XxB4pRLIJKuUPy7DAHMONZjALIoBrsNmEka
	hT/D9AwECU4704GTdV5Fibe4LKY8PpR8YtjKrcUq5qbVT6B2kitkWJU3AjsG4PXtsvxi4bAHn6X
	aj/dB7EIek9kH14vpN493KK/pKZQao5tJh5CgDcwKJDC8U4ISwax24MlEPxxl4SEZazdbckaujw
	P4pBE=
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971751a91.51.1793768912088;
        Tue, 03 Nov 2026 21:08:32 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971712a91.51.1793768911555;
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Wed, 04 Nov 2026 10:37:32 +0530
Message-Id: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJS96moC/13MTQrDIBCG4auEWdeg1p/SVe9RshCdJEISW22kI
 Xj32kA33Qy8A9+zQ8LoMcG12SFi9smHpQY/NWBHswxIvKsNnHLFKDuTYdrmNRKTGVpLtOTcoUa
 BSkLdPCL2/n1496726NMrxO3gM/t+f5L8kzIjlAhxMUIrJ4XpbyGl9rmayYZ5buuBrpTyAUyOg
 g+xAAAA
X-Change-ID: 20261013-glymur-av1ecc-7522de7e4e65
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXzcM1QKdl1S6p
 7vayDF9FFtNPSsZboHJE3WWHT46at662XrMzyJVu7vhKWwspwZEAIL/u0Bko8pSkLm07vKtnHbb
 GER8ZxPPxs2ci7rPfz7R6Kn/y/oEbqM=
X-Proofpoint-ORIG-GUID: 6Q8z3v9WWI_rqOdhfk5jURUqCC94M4G2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX0BLorun956EH
 lJEHhCjYFuvAP6bVwPwjJJhDiDGNrJcI2zde6UDHeakYAAHBTyI36i4uPpMGxOD+4OKF/i+j0bL
 BpzXnsq4NEsZfsXrA9k4p0zwZgKeC4gY8Ipot1NwIlmp1N4+OVGE3nRzmQO2SFItoNSKPZE7MIf
 ayzjDCNSy0BR6smq1u7rlqdZOOh4+L9hFYgb93msAGcmUnWPDP6CX+yPvrP2sCzrtNSKORfV7Fy
 bvC0ytiaVm84Mgc2TXdMBhSI6+ZP9sQGHe/y7+TU1vEfHkX88aEbtwHgzjGsSsgTzkdMAjMJDdm
 vMIzLJKhgsdzaE1Fj48fw5uohSsE8q0/ztivOdV8bIhDoW+3iFmfT2dI7/h1EylzkNzQlyiybTZ
 U1CPyI1M23K6ZjZCKhC0zC3riyv9ekbd2Qv1zDrDo7GSv0edMy/XNZm9m7KzK2Qp/XQMwpYB1EN
 VeHl3l7A+yb/1Thgz4w==
X-Proofpoint-GUID: 6Q8z3v9WWI_rqOdhfk5jURUqCC94M4G2
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeabdd1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next & used clk_rcg2_ops for
  av1e_cc_av1e_xo_clk_src rcg. 
- Link to v1: https://lore.kernel.org/r/20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com

---
Jagadeesh Kona (4):
      clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks as critical
      dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      clk: qcom: av1ecc-glymur: Add AV1E clock controller driver
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  16 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/av1ecc-glymur.c                   | 393 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     |  35 ++
 7 files changed, 460 insertions(+), 30 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

