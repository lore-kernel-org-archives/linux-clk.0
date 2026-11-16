Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806881;
	b=5t/URU1Cix4PQ5QXV6XSquw9XBwlBYfgKhza7Z96J6DzbKlaALeeWgnC1JKW0nvVUCeK
	 lNcRP6Aw2lnUIYWiozasYt6K9MPcR1PtIWxfTO/TVx9riKKSEsGxvvMp0fZUxPdqoSi01
	 uCgDs37sZEgNxUzPn2ANey/vLKQ4Cy+A+TCuQohwJGSW0jdSe0OPPA+upF/8mrlnQQbHX
	 hlPxD9eYyusnIg6UlytEiO8367jmK1lzwvlv2OdIkIkAytfNfvenqxIXTGJSfEfNijJ+A
	 8BfwteNwwFWMXt0oUFodhIPTBZiMVgF6Auno4k6SOc/k+3TGyB8gOVdCQc/ONxpRSWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
	b=5cWr+0uW3eg7JxmxQMpi6J0ywonWi/VurAqBFb3SIiIJaLSjmE50ky5LKeSPUOVwMWX4
	 BiY/Rr30I4IoRk/gcrLsFRptkQ06X7WzwZSefZ5IL7wFG0SeWsG2X1/GVvVeX5kpbAdQv
	 IDKd3n/H9p2bgRPLCcdvArZX3xi2WvZCBfUZgf1DbUbo3tfTVet3jZyI4+t/pn4jWYexB
	 kEDxfozsGcv9NXFRNnh57s7DaBp9M+nzCY2k7xtpTTYZJhKgr3LuceNPu0m4UCFi1JEsR
	 UAsMBdj+FG34DAywiQGvf8xY5RMOVXycppsGOpS2KK/bP82j5L7B4nyd73G7lxAUK1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF9606A330
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFF9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LbhL3839121
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+weSNdgV6tyUTxoHk6wCxY
	0+uFMGSPWr+uTDp0Ozmq0=; b=Hnu0e8CaUWlDnfFFRPHUq5eArNphCs1EIWdpQu
	9Xq3HonxFTlBt8kgDrV1w3cPlOpIHUC9/ehVqHV4r/yKKcuP5MVPesE2XAlZtOwV
	WZlOgTvtisKbrAqvYhEkBXt1yCKFs1vb/gjPy8hxOazAv7YUud4Q4v4NHgg5VM5u
	aiYQ2K/ZcLPjh8OcmW+U/CciXkJ7w7R+1JBhP1e9G7dtnfoA3K8oxNEkT0BWYcIW
	SYc/NOirU651yYiGlGchxcF45D9q3zPTpALOqtcUANfDZfNinZlYbYfNgkpgNiBK
	yAmI6m06HV5unUFj7MPiY/c/0nOT4sz7gD1KpgI2UUun4KeQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhmuh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddf34086c8so561347a12.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806878; x=1795411678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=gRQh3tXWDi19GaaY3LckQIvctxQqriqHApjB5+26o7s/OEBIYUkCAoRF5HRDCGR0te
         iYMFa1xg/Bq1VS6M3Sx8xPOrE8EmoKc1Dj+vDxdKJK62LIsMuEp7tUs0OhpIpAIVqA6K
         ly6JxBZ0VYCoOqCvYMCmc/6CHlm6LTeczDwjPz26yoIpyOEASXnRncJGvhOeX3Larwx3
         BJB/CNsszg0EehCB9huTGkhJ5MY6AjGyHpqIwhQsV6BL80RwlbD4GdPPd8+6nNkTpk3D
         gd877+prVfX2oAUPqd6Agf/hlxkL9xh4+y0aoGAkqmTzHp9mt1G9Y/WYYiG+6LByQXyx
         CYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806878; x=1795411678;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=FB45hWpiMQ4xGE+oXf4pBt8wfDx51YmhKZd4/zMCEp8ZnZ4Gy5tVZ93xMGjDDe+Uvc
         8LHji889ZWaTndYzgKNxuGsLusOWIGvB5F0zZYQzTsEWBAl9u/eoLtGulYaHxvH7xCdT
         kQpgHKPSWxw5HfJj0adE8tLH1HwFN9UiM5Zf+2Fbk0wRbr6dXw63X+YYWBEwxmuHnD4A
         ecGXrtcPQeBqz/J615nrYIGThpQ3lkEGVY5gTivKzOM75sKigEnEYJfUPB7+oMrH58qp
         xmN6WUqlL7N4F+P+Ib3EWQoGquF53WUJiWv19Ce+7u73IvAqpKTktyF3mExA+44n3DVO
         93nA==
X-Forwarded-Encrypted: i=1; AL+hErHcAxlvEZlzQWidk6eSBwxUjSG7DT5h4mipqzwnS0ZHLCKirBGmBm/lj10HSM3QWkR0kZmF/AV/hjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rgLxhwiOvOxD7z3iBVx6hk6UR7gvNn9RgM5TPYD3AUlzLntNU
	PsnpdweTGzBO7NIi2bxBi+ETfcvDOq/hiUjvRmo2bt/ccG61DjXGv/5WZ8rSUCIvTcLpkz9SG5z
	BOmtu5tFfS63zJQI6tDVx3qbnkGbmZt4uEfEksjMyvL1g2LqKRogKOdv1q/quVfA=
X-Gm-Gg: AYBFou2sIwDMGcgmRWvRHfW+G0MeStLGE6Pke8Eexm7Ai05f1vIKF7BPWOma86bBxNq
	KhmzpADo7bBW/owpkRVBXympf3SV1SYMN2ygqj/Uta/RfC8Ckzx9DQYM5aBoOklYwF9+VZMHH3Y
	KR0xJkpYhXpIiff6633VkRU6NiMd6u7k19PB/MMCGiUcAqUf93uVJq93prdqlbZtxE9JJHJTkac
	34+PWyUqOj5C4/uIpQlAQvqwoDpyWG5wD/d3B6E798XluF3Kdul0D0mhqzs5KK6GG435TpolXn4
	Wvyt6K8TxjePbPiPhFtZB6l2ZpD3H0t44z3PlRIW4Rbe64IKgrcOlPY2tFVKGNiMoDomyvG+WB/
	vaEmrXkOdaj7pC1vVna+Qjn9O5PgyoTa6V2Zjgr0c6lZ6POdD35TOSGleg1v/l+1uV40WktDgHg
	==
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023295ad.68.1794806878442;
        Sun, 15 Nov 2026 21:27:58 -0800 (PST)
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023115ad.68.1794806877971;
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Date: Mon, 16 Nov 2026 10:57:43 +0530
Message-Id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAE+U+moC/x3M3QpAQBCG4VvRHNvyIcmtSFprMPltp1By7zaHz
 8H7PqTshZWq6CHPp6jsWwDiiNxkt5GN9MGUJmkBoDDHtbZu2d2srU4ye2uQJSU6IEfmKHSH50H
 u/1k37/sBvwa3N2MAAAA=
X-Change-ID: 20261116-pwm_clocks_shikra-13081b11413c
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 2gNT10ewizHUUuAB96j_QgbLfVG7nMqu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX0yuBLDgvkssm
 C5XfnzjgEzyR4Cqdpy+/mj2MMPQjQGVXZ86WK1ayrkH7KXZMb5/D/FRx6T9/DlA+9Hab938nNEE
 +/L9ozZZMJJfevCKbPHPBADsXHyZWJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX4XWrjhgj7BrF
 lztXZ5O+S4nc6MZBHUykri04iLu2XoB1RmxxhWVAOID23K0exEjcglPVRJTGXwE9KoUyMzwoxjs
 I2pIcyhA1lsd7izsYEyYBSACWazQAeGYbKr+pjcmAG/a/lGs9/5tsOPeDb6GpEI4i6Po9mMc0n0
 eR64kHEcPLxW3Y6BahTQTcr9S/bz5aCXjQEKi/CYpUjgvRDiKqKxNX+3gbWcR4747lADUCq+TRF
 zTEXKNa0qQhITT5yDOerqWce6dOt+1u8CAka/UfJlCF5MHzDVrf7tQLTVe9Her73sQrG2Rt1OLo
 /n1QwYAJ8kcO0RgW9DVJqdHobK8qjj3CYZ1WsBkjjRxhKgVOoDrBByAN6pDX4IMEFhJ/eCrCwGs
 mpqxzypxqVmSg3HoXz4X/b+XCBvopZk73Bm+ekJD8KLSMG5Du93CekGFWm0JVPL3l6XfdrOfgmc
 +qXVbDFwGw7dpI9JMwg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa945f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=P8prvrSLuabxu7ghDDQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 2gNT10ewizHUUuAB96j_QgbLfVG7nMqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

The PWM controller on Qualcomm Shikra SoCs is fed by the GCC PWM XO512
clock, which derives its rate from a programmable divider sitting
between the TCXO and the PWM core output. Model that divider as a
dedicated source clock so the full TCXO -> divider -> PWM output path
is described and the PWM core rate can be configured at runtime.

Add the clock-ID binding and the gcc-shikra divider clock implementing
the source, with the existing PWM output branch reparented onto it.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: add Shikra PWM XO512 source clock
      clk: qcom: gcc-shikra: add PWM XO512 source clock

 drivers/clk/qcom/gcc-shikra.c               | 21 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h |  1 +
 2 files changed, 22 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_clocks_shikra-13081b11413c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

