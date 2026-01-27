Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E932DB785
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526233; cv=none; b=j+vKiqIm7L8BvKXYLsPkwzV5m39F0+MKjY3OmUyX3+uQoKfWMITAXhTQofG9IShjLYAuEm5mTOtweHtZYOJPut7kbTWtSsdrXN5PalvzkJsAm3oXNXKPw5nRaicZip68Y+s6XqRaRBUMkUhRlwq7+SeMXoPtRcaDtMGU55fKv+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526233; c=relaxed/simple;
	bh=2YM4XIpqzCb0LHUPbWTlm9mjtrLjc3dpK2x82XsFb0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nrjz7erKt5ysKrCPwha6V5+CdyPGYNmkkeOReNUxDqLlP4Bh6V79AsdKN8sr/CA75yVu+X0fjlHhRq87/s99mn379kO+2HHBfdGr81UNO8nTvkKdILGhnU9okHthxs98YcEsBcQaEPwgrSsiK6bcWYFta9tIgU8sT+q0I+g7BkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlEhvEJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwuGqlZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlEhvEJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwuGqlZv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA02oa184765
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NfI8wG2fYkxCZMur3SYNKv
	diP6pGEfXaML2kMJ4JiXc=; b=LlEhvEJ079yV0zydS6/w3Aa24XPpqFjUhOs4gL
	GHgsddZ5BVlX/J+qZyGFeJOtQuyzvQxa9O4Ctkrw/hA9FxavtPTwD6ZLR4YcV5OC
	X8+M0AJEVzDgPjyHXMFrLw+0WulQ8fmPxkwzu9+j3ZbGBYfR5OiEQEBHci2hzEuR
	2BfANCmg/mmsJLQ12SunfiVIzdlJNGhf0dQ31w+6BsoWHuVTT3b96euG7iZIE5PG
	Y3bvXlQ/6sJAfVueNI7YuADkE1M6VjNIdwVl1p3B/igi+ZHBwiTRrXmHWg6GquOO
	k+sGevxB2I5MiplZnT6qEyzZtmvfnngJE95UHeiqaaNzR/Wg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9kfxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56632d985e9so21996226e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526230; x=1770131030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfI8wG2fYkxCZMur3SYNKvdiP6pGEfXaML2kMJ4JiXc=;
        b=FwuGqlZvuhtOKA6VgDMM3VYeCEp+PPz9Kpr/haeT84LpOiI0z5cg+44Mjia9OCWD5z
         /rOaTCi+2OzFn2V0/E+kxOBon3JYeauDYRkj8YyC6S2UUulBLlAxzIO5KbsvZQvYiBRf
         CpZqwo0LYGkzZK7HWSO2slOrQv2MwCMstEL52SMrHuWzHv93cvZX5MREhh70giEdAfEP
         v4sK9X7xkrPOmpRrglEtPPpwxSVY0lSwJo5jAc0xp5Yfl0tMCCGLbJRFUxPF2X9hu8e6
         FBMTZ8zwqstanxPNHcBC1ImiDDxtM4B4XOZCzH1aGUaDHpuc5v8/0jm+B1JWsvAdKCvR
         jf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526230; x=1770131030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfI8wG2fYkxCZMur3SYNKvdiP6pGEfXaML2kMJ4JiXc=;
        b=UGdCYf2skrSM2GP6NPaMonXKp1O7bPICQFhZwFiny2N8p7gOMNK9vegxmYbvUogi0u
         brjZGP/Urfl27bFa6g1boytbClKkItLakz2Pvb5KDxdFNaSHYtMF7ZxJObmhopnULQTM
         8eva3TuK9EcmKjUwPlVCCu10A37EpcK85AKFqelTz7M4JTyX+A1YKKMzwRbWdjUgUd2W
         6n4CSbBY+78Jy0F4zhvEs4zOh1xHTE70CORe/Weg+jxl8nr/3p9Baq58I9GU1LicDA7b
         q/6Zv9uLoSDFbbVzqfaLJkLMcwBvip4loefuYNcRMSMCvvHndMPneIDaq5LjtIDo9XvB
         HmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXINefFwXa+fhS2jsg/XZAIp1AC3vIgzPGj6y3hT2tE1/jr0WP1brQlo3hcThWp9VfDAauehJ9pCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztlhScXHfJOiiDT0Z6fxBhqKbJR4ARVyF7e1Ug5fsic0oa343z
	KC6/gCKasJIfj+lZmzd1dgPMF0lPyMWi7omoXEfe4ecGCQwvUNxtpn+HN+w8lEo4ISIry8FLnF4
	TPKTXZjypj/lS/LsXedNYN8JUnE4NUtHpw/jdAcksGC6M6OLyubBLxhctzl0te/E=
X-Gm-Gg: AZuq6aJhMpY7x9t6Wj9jA/OoAwax1Hoz/CtKjDD/MQivjle7EItLHF9zOmkmEE9bj6y
	oRyGsgRkyLlPz27WNi+QLIpiPtPd/S3BCkZ3zKv/Ueq5a46pgH7r7r0npTZ7BwX/yWUzrKjs22m
	VmwrUQYIqJtNwy0/MVib216IMGLav/ZKnqsSJikpswegI9YbXuz5DbSfVHzcHwWFW77u/9pdOAu
	Xkvn2k7CviAPxxwiq8tGdEY9dfrh3vW6PIiDFqMxlgtdASenMTc4ZJ1OP1Idz20WsNc1yrl46de
	iKw9cslsD3wYUkPTPVuFp6FP+90/7Pzb1tEWvSGkp3tEmlGbYxHpniy/lFKI7zqZr99RsgQsIhw
	I/LMw8eoR4I0G3Ge8cg==
X-Received: by 2002:a05:6122:658f:b0:55b:305b:4e40 with SMTP id 71dfb90a1353d-566795e184amr744435e0c.17.1769526229434;
        Tue, 27 Jan 2026 07:03:49 -0800 (PST)
X-Received: by 2002:a05:6122:658f:b0:55b:305b:4e40 with SMTP id 71dfb90a1353d-566795e184amr744244e0c.17.1769526227507;
        Tue, 27 Jan 2026 07:03:47 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm36895097f8f.8.2026.01.27.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:03:46 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Tue, 27 Jan 2026 17:03:18 +0200
Message-Id: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbTeGkC/1WNwQ6CMBBEf4Xs2ZK2KIgn/8NwqGWRVaDaBaIS/
 t2C8eBlkpfMvJmA0RMyHKIJPI7E5LoAehOBrU13QUFlYNBSp1JpKbChtxG2cfbGYoeYoc1LiVk
 OYXL3WNFz1Z2KL/NwvqLtF8fSqIl751/r36iW3k+d/KtHJaRI022l8kRVe5sdHXP8GExjXdvGI
 aCY5/kDBuqrDMEAAAA=
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2YM4XIpqzCb0LHUPbWTlm9mjtrLjc3dpK2x82XsFb0Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNPAsvCagbVge9+T1BI+0XrRghQvxwm0KNCqs
 5Cu7AaLy++JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjTwAAKCRAbX0TJAJUV
 Vp6/EADH6CnX8iThDnDuJCNXyTPwYXW/icDGh0uNdcLh9haXkEwSl6DKzPgzyJBkN3tM+VEIzv1
 JbJuCnjo/9xezlpx5kxItx7D8C2xQO/o/xLlztEXXd6UpUICubXA2KsqMakEd5eB38U1ii9mawX
 5GImQChcQbQcVP0OC4uPEm7DUElJ5PoxWAXnl84XKdY17s6flEf/YfWmCjjKf+qtlGXGP4dKEgG
 p3rZ+PIYtZOFL/+GZ9GDMkocVIR1dSmH8PxJR+AEKMFNTgFBJokvvWwbeiexY5JYQ/WdYMAE42H
 4UoxaadVNMNHuPcV0Mai9rB4fp+NpamNsVBb2VYc53YFgLn8CpGJglw8/3gXmB94rgJkCW2DbWo
 VkWFahMwZ9Wq8HTGdkZruwCdDtLZor1ffrrranY5/ovrFestdZl8MPXftSyjlFk49v1oaL09s0l
 4BUNhMzIshtrLWudRVJJ/Myr8Iw0CXciRd5mE+DgLiNsuR6xPs7tQW1B7ylhqoGjX/fMARW28Fj
 TFVtDEiuPluiMaSRWLe4txG1BxpumB5cNyRWwyKX3/S4ElsUpFGMbcOnViRw9hvOdBiOzozTK8F
 ZW2KPjX9kNSM3NjHtbV6CYgkYqYj/z8nlPXJ63vwjC2YUchVLZGNTZy2mNVD87hotc57FeGgXn9
 M0exwX9FOEPyIYw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978d3d6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=_s2lmL9ZJNBb6SD5BL8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: moDJuBt3L_qUybkmsdtH2k_CPdUUrUJ8
X-Proofpoint-ORIG-GUID: moDJuBt3L_qUybkmsdtH2k_CPdUUrUJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX1yT5Y/p40lWs
 AUNdDbthWHT7l56Jy6M39HOlB1IlypP/dH2tQiY6GuTVlVx0OwMe7WOTsLtFI1HTBfotTicC5+j
 UUc36pNRuL5RQvZ16CkFZ0pPbFE5HOdqEThUqErpRO7lub70Qa+hCdauIRR0zzUD1yq1XIwTxCl
 gmalI4Q9KnbfUT/ftT3RSUFk+dO7SQX8WVLqB2dYMT7xntAfSvCVtfIGvzjVOfmcb/rdUp/zOza
 z52t5X+XDiYccRxK87mrPzhxssQipKSKBN1Zi/5TUb31qqVYAqLxvEbRxzOQKbBORrUcj40D8d7
 GY8m1mXbgy0KmGmKH6bLgHeaiBb7Qky50q/gpzWNqVkKb1mIyssuJfdqQLMRrbwG4e5P50pB4B/
 0okEm64l2Tne5WtVQlYkr+L/io2C/FgRB/kkvJBbqcFqHhBSirDKD1VEjEgpclR4Pshh97ro/Pg
 jtDPEy19UUAc4nRIJpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
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
 drivers/clk/qcom/clk-rpmh.c                        |   20 +
 drivers/clk/qcom/gcc-eliza.c                       | 3160 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  144 +
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  218 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   15 +
 10 files changed, 3586 insertions(+), 2 deletions(-)
---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

