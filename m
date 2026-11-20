Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171477;
	b=xG5tnhSBX8nyx6JoZE3F9u7akpybI93tYhw8WkapbhX6HsaTc9XKcJsBHV0kC1JfvOtN
	 glbxFJUKNmlgZ9LL9deGhyqKTOFAy1RkAOmDygnEdTgqDE7L4MPg1dSTX+NIhPUgcbvlE
	 9hnaD0L5BrbUtIfCRwY1OTkjFDbjmgxzZjUYJwlmY1FHm9jDe6gDkPxf5hTpUnoUJOqMK
	 of8gN3xNQPRhorvwlhHk5vWsD6sCJVqBLekVf6recXc5RD5VR6zOOhGXoBNGxpQba9Lj2
	 YZFFll6ygBX7o3wQbPcTpd78/2ulPyzez4Txx4aumqtCbxqgLEQjfvtnHqH9v54n7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
	b=CbxJBRIKLiETpYzu4Z17t8S/OYW1Y3XJ7NfCFwMHmRkl+cE98OEVoWcKzLLYdA1Biwpx
	 bsIs/7uLZOCeINFN8m2Q9O54UaoHi7TNYdI5teLQT/WO7UJBlhlOMtNfV++zut701UcsC
	 T+vpLWFBQ47XqngfCE31HzLqgLvZ1MTbJF+rFAiElwZUaB8wDh+hYsFD8gzWq8lr22TuX
	 U5/aEL0qeEOHrsVWV6N2ojCMfB5Iu1apRZ6xqSZ3xEEMBlby6z5twQGxYGDA+AJAtdNaF
	 nudKxnFD5JxpWDKKlHRgNzNepGZownqksRFjXWtcOaaHWjnHtVE8blzNC6Mvsn3XDqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpLfO9iz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f7/7KSgQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38DE60A2601
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38DE60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpLfO9iz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7/7KSgQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esRI2019464
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CFNJfb0rms2y88yh6JoAtH
	T/4DKUKg5BrlVVksMmBdA=; b=BpLfO9izJdyIyPqhsPAUWIK0SMQQAiM6dFNDVU
	NqapiWQDW3feJH7UmC9fe467YOHGgwWqLYn+3iQsYBeiXCXhQYbSfARDuZvp1Aag
	PQ+Ef7AQDNASE9n0ld5uSBMSthVgCPpmChNXogYKy2rbxwWXizlGQxOWoYgHMkJI
	VHXf5VDGrzuoud3HFWNGZv1WfH+kFMCeUbEpkHmG2OLtK4Szr1L6TJsdKj/tpSBB
	INB3oQXjYtpcZV8/brKZpYYbVaREKC9pM0ME6/xXOJNWkoF/DHtKmGwn4ZtYyA6y
	Gj2n+IMOVruoA2JmSzs7Oe+DvwzhC6kQhZBXqSFeAihfhJJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9c64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so1252081eec.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171475; x=1795776275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
        b=f7/7KSgQE/WBCZ2U7ES/+F090NTi5Vj/H8DAj9IBdfL2bsWGFjAfpK56Gp5bG67QMP
         dQaOSME1KirGzzAeRxPpBT8c6Tk7aqkwwL/I4XpiJNrRri0lgp/58zMbiZny7mxBpmcA
         UG4EUlCPLneaAcu9yyZhT8JvuWGTcQ47PkfbsmCWtbEiGx4mYSnnwrCXnlGemxIr/QU5
         xDNmXfsxE8OapfZfFrHJqOZQg2xavB32F0GRisIfNyjGya3lrojb7dVkVvgfeAKMj4Qm
         V2UJ/RnuZLN18p5EwAm12lpMHd+B+F52ip/fycta3WEJ36nO0Yk2I0D9zxYPEyZmQefi
         /yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171475; x=1795776275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CFNJfb0rms2y88yh6JoAtHT/4DKUKg5BrlVVksMmBdA=;
        b=dNKq6oEZ2/7pW/TPm/DJ31Q+OjpWgC30m7LMEvI2a6Ny+8DpG1ykWVsLs0up+LWcbW
         78LRD7nJrYpw4xXZ3d+WyT6h6n5gB7i63ptDXvYD/iF0b52qH+S7DImpjomMQx0MdezN
         IBarPWSzMXoOlgDlqJqIrLFQDtP09ymkbjciwCEsaPMVHuR5upK/W/PHAaaJnILF8p6e
         IWlBDVc6mhRTWnAzXiHT6vMBq/M48ZKKwqRDYGjNBO7Z6aCfbcVQ/lJgmapZb1iG6T0j
         Wxm/B0Tt4noBLyPXTs0zdc8slzbBhZfCr8ku5dTBWmZFfpk4ywhgNm4fTP0EP1nG7Otc
         kXug==
X-Forwarded-Encrypted: i=1; AL+hErF/6OlQuxYKOp1LohXHsKhLlE80NQdCKAFF3YAXtfe+uiN5tPm6p1E7MT9fpTZ/poeUPyaPx1Rtxh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rD/lg+7W1zc2BDqTfBHLYikb71yOhctV821Mf76GW9aC4Ox/o
	pLatWd67XkCGP19g1cQ1ijo9SFJySYtHxJs2yPBPvrxjNnozY1lMkDw7baC3liJOvhafTE0i7m6
	d9HTSu+c2/FXBU1lyO15oEjWi2SIJUWrkSErYGGN4AvQCLwpgjsY4Oj1ysk8aj5o=
X-Gm-Gg: AZFdTZe6S2I5eUdFve6Zrgul59XvAs/9qCXwwOyawWmtPqJfFYuJHkY0nIE/hKb88mu
	6xkVpETj0qxerW/gQ+piDTW4E9OtrGuryQtUEH7piwzG7MwjIEQzvjZQ7tN5AeW9mNngOccGhhT
	JtwxsY5SRY3njPZHdwL6H4/LLPGequ6mb7FEcULfxNzY4d+N0uTQN/SsIlLmGHP5Y48wMIvJseg
	AbehwODx56Tw2Kyj4TB9o7WS8M1KPMh1Vui6UwHjuiXSg9dWSts7lecS7adyPKUTVxDmczOqrCk
	GvZxuDRcZuJhK3LF6Tch+Qjp+XwJVXm6ttilToSs2gsSxU2IaOQ80J831HlCW9rWDWqdgxQkbRW
	ks80nFFuatTcHh3Oe5VfyE6uykOSTAgf/ZuSFe6aTUp4Uf0wQN75BiGanTRmnueT65d32g+6H
X-Received: by 2002:a05:7301:182b:b0:383:b90a:3535 with SMTP id 5a478bee46e88-38570c2ff43mr2119395eec.24.1795171475164;
        Fri, 20 Nov 2026 02:44:35 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:383:b90a:3535 with SMTP id 5a478bee46e88-38570c2ff43mr2119366eec.24.1795171474618;
        Fri, 20 Nov 2026 02:44:34 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:34 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Fri, 20 Nov 2026 16:14:19 +0530
Message-Id: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIMkAGsC/33NwQqDMAyA4VeRnldpUqe4095jDKltp4VpXaOyI
 b77qqcdZJfAH8iXhZENzhK7JAsLdnbkfB9DnhKmW9U3ljsTm6HAHEAUvNG6cqirkXRF0zD4MPI
 8U0qe0cgaDIuXQ7AP997V2z1262j04bM/mWHb/vdm4IJnUhqBZYGmsFdPlL4m9dS+69I42MbO+
 ENBeUxhpIyuS1CiFgLkAbWu6xdRSclWCAEAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002493 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX9M/eG0hz5mUt
 tIrseTd7D58ap6T5r449QTRgUP17jcy4GMxT6rxpdH+t/xLa/Xr5oNYjPDjkH9XVF599Q83MBvb
 ERMQ04DR8eGJpQMt8g8zKPtOromhgtI=
X-Proofpoint-ORIG-GUID: cmDFBS7JAZYjswDITNUL_FVTDojqBdnT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX48WzCYDGJS2f
 QQ9C5jon3FWLE8z3+KpPRNG12MgNFYZfY+gK7L2zo+90zBiT57LycbP7/owNnpN4581Bar2f6Aq
 Ids6piQJHg3oKUniNgecIL69J4IewoGsQy9o1dhtnyWAQtXQNTDWftLPlOZYyq5kaNg4cAyAxA+
 64ZKaEGgAb/ZvkXD20l4ZurptPwXGhhsTS2XB44GDWC3Vu79GBF9xuqNivXCWSTKKqlukQ0P9YP
 2UKh4hsdjzA7CdktqFItPTtH1GvHDVFwuCqJflrES/aYd987IDMKcxxGjlaGbuQ+oxh2VOlIczL
 DG6kCN+D4I0W/3giFBNQFQKewD4cT2c3vKQ7i77XP4VSJ4Q3DohW5C3L6M0Bd6CDnmTJcWXOfaA
 XrB0PHnjVs/523iSL5Co1nJFN0kKty67ofEcqS5xFflWOvEH11JxWLYtasJYmiYQqjjO44wNsYY
 N3aNpLfaHJGx6E2yvKQ==
X-Proofpoint-GUID: cmDFBS7JAZYjswDITNUL_FVTDojqBdnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Changes in v3:
- Collect review tags; no functional changes. Picked up the Reviewed-by
  from Abel Vesa and Jagadeesh Kona on the driver patch, and the Acked-by
  from Krzysztof Kozlowski on the dt-bindings patch.
- Link to v2: https://lore.kernel.org/r/20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com

Changes in v2:
- Drop the se_gcc_cnoc_i2c_slave_clk_src and se_gcc_i2c_slave_xo_clk_src
  RCGs; the se_gcc_i2c_slave_ahb_clk and se_gcc_i2c_slave_xo_clk branches
  are now leaf clocks with no RCG parent.
- Drop the corresponding SE_GCC_CNOC_I2C_SLAVE_CLK_SRC and
  SE_GCC_I2C_SLAVE_XO_CLK_SRC binding IDs and renumber the remaining IDs.
- Link to v1: https://lore.kernel.org/r/20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 135 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |   9 ++
 2 files changed, 144 insertions(+)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

