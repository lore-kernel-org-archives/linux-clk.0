Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FC43FD06
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769584; cv=none; b=hlge2Zm09adfdqRx9P2/H638EgHTLv3+4EaH+sl7cZm19CO26bqzd0OLTkcfqLwfa3w6SZJQ7kPLx2k/wi635XOYmH8IAsiDW2GpK+/FDa6TeqTTCZ/IOkFb7ROzw654qoz3i/j4YB3p3vGL8PmwAE1VY5pn84qPRk8RizcFjtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769584; c=relaxed/simple;
	bh=WRsRiucV2U720V3z0WbxA1CeS1n7DYpjh9vQrUnbRJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NyHYOI20h/Tg7lNiHcJNx5G2t1al9wx4qIihy2zOrZ4vHw+wt5oKsxLgpwkK9r1BV0LsLCzAo3MuPiSRQuT9S/gGwP76ASsh4ds2ivgSMI+6lwmfbLXZhWSRwya6ofTDoG9nMmpirbAzwkTzs5PqXeMilUXBC3nvjNDxJJCSZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am1B1pGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPcaf5o3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am1B1pGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPcaf5o3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Y3N2724190
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 08:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ibxb+Q3FfqwugpDb3vLbkt
	1RoFpIRGq+fnKvNs5nEBE=; b=am1B1pGKdXwVUKUXROqOLPUUjKk/HOjxYG/WVs
	goVRRTEmsffg/L/+IaLpV8rnCcnIUvkZPLpP70hUHxuEHD3bc/GlPOsV91rT5+Jq
	OQ8MzhKmRW6o9iiawFRyES7xk1ycE7Uii2i8uknSgOXg7k6IUg0eWgtL+eNC4DV3
	1uP71l3K/UkDmBkwy2oriErFKYFb5PkTOJgkrgiqK2za0qf1JwL88CwA7n/zwwTL
	AUyKl2E/0lK4dk7udEnMPQlhz8RyJ+vV/a6n1+blETauPtOfBftlqVKqfFLDcSWy
	3Epp/6i6w55cwrPBmnKYE7THSZHoCXCtPvR9NFAm5DreeaZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksppc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 08:26:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so2682155a12.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769581; x=1789374381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=MPcaf5o3JY7cz5H4rzIyQm5Qzcr1iC2VW+95OhaP6Cpuj7v+wVlxO++tzFK4H2/0uy
         jHB57M72OHFUYwzSSB5R/RRgF0/wSFRX7OJrYLPlCUl7nwsrc9g3AFcBLbjhulsLssCM
         Aw0GyP6LJgk0i4geqtTZpqJYJKab098SexKtJXgJHZkOGxlJnHBlDOsJj4+hpOOnRTHt
         8f2KyNFBDw1B6wDeKRfsluEwR8Ppswa+Nixji6fX26Ba4ao1uu5/ZqFiiQ6eAg3XFNCx
         ZgJPDZlRMm1p77REOsNxb0c6HbljLqP8Ph2N3MxTFUfvIPzgQclLT+cthcmbs7QV1BUg
         t8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769581; x=1789374381;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=fxHtC3l0/djioRbBnP7svPsKiKwz6eqptgvjMESWer4JSFEPa0DVmbFw48wO5uHbj4
         fnGSSOGWNhDA8X2/swiA2HIWcasTWsNa5aLIMIzQ6DO0qSyF9peftueUth1/JEsZ1/W1
         lk7J9S8+NnBjfn+S6S4t+bDw5+ErWgdOSsK+ne7i6/LArWurkvNflhzBwHl7O9aF04ri
         JGJKul97px9459h1vKgyk4VXHHVqfokUGThwEN+wECDrhi325zuAJnRrFYBL2aYtbtWH
         6wpBjyQeRXD28tVNl35xjWWpDh9kjPRdx6k3nLX1eoXOLKQWJglb2lFYQmfhcdzl2o9B
         wA0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqp5H8RzeHNJyt78rTppIYz01iIo7POkq33TMoOaNPyDQYNHcpg+vlAvaIwLrpGzhluUk3mgptUY0=@vger.kernel.org
X-Gm-Message-State: AFuF++n/PAHiq9O/iziAQYXyrybvACPhiYTsTU+JS3NUEX6EWWj4leOH
	L2gw+V+O0rRZ30bJnIj9rPPJvuqxJNyojyoJ7YzWDw3+Ln7TESM/DXd6TiM6Tyv4A0YkSn/EQ/J
	ToWqfJ3MmmO4SOKJdW5uTlIaSx9LQJczCyIBMRcSwOp+kFQfRaFQw9dT2AEIT2eg=
X-Gm-Gg: AYBFou2jz1a4bkX8ytH+PsCYzgUBoAQLLM/z68NCgf0wo5i5VcDxlo6I8pqgA5bnOHh
	ckO6NMHjwvfP+YcFOr7GVbOFWtSboY1z2rnf0yJ8htg+PfGpLq9W45Y0muTdN+ZgcJS01nurWGz
	pEXmYxfmSMzFVnyq4MXRznmypbVCXVlaJGr4507sdNCBZmXE7/QaOPo/F10h4BENubPc8RZGTKv
	DH8x/4DlWilOS97ag7nhfhRvuA+xcAe1njK+Z9lsU4nzL3Z3ZQhPzOETQq1SxAmYMn8mRLc4aMo
	XSlbvt0RZMjrVuG/p6WC/f3dr+fscD0pwhdZO42xZSzRVK5M9m7rzp2JiAI4fXRiLB84U62LFLx
	9Fcsd+C+jyX7tIt18K7el3N/M
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098449637.4.1788769580630;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098420637.4.1788769580163;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Date: Mon, 07 Sep 2026 13:56:12 +0530
Message-Id: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACR1nmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3bz8opTi+JSCogpdEyA/xTwxOdnCxFAJqKGgKDUtswJsWHRsbS0
 A1/qXEVwAAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX/IS79bgP8pgL
 81HyXWnwXdW5oq/YXEEOeTODICjN/2aFL8PR8QcoD/376iasmc7Sad9KXkzwyQdW9ickf4AMDLo
 +1nmgdvKXY6UrOUoviexqGhuHIaCjr1OdMVY4LhV1uLnkG/1K0gQtMwHhC+kWXIakUyQKAc85rc
 2UbKJSXqXnwrtH4mQx1lidxvEX+vMLWvv+bN9R8vRIWaW0O6vfWOhKewTYRZvHwPrrvft8IzNOo
 CR16coLDmXL7uXe8DbQNi+BSjt+uTcBqLZNDlsUn4HnqtQ+MdgvrBMuTMOoKKh/HUfALU7J+wyU
 vceoS+V3AGr737P+WFoHcWvsYSNM3d7PX7JjNlDY6kbDjWVxC6bOYIxkjvfhwXTXoCY44W5KqVR
 eUf6KtDJyXAa9kdyJI0YwIrry1KBuTiQK6hXTyCQLvtSR8LWxLWzisPFHx4jyIIF+T0zpCGFiKK
 RRSiW4eSkZTwC25Ahsg==
X-Proofpoint-GUID: XXjdWRE1lPpur8oht1m8WKfF2WReA9tE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX8v4Wl9YWNGfw
 2BCVrS0iFYJ2MgGBXlwA7lexevxpu14/553KkUFnWw3NfpvYOwWtRawuSVifkG0wtjrW+nZMiIS
 OrHXwtoGjsMV8NvU+11LFwgWKsjQn6s=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e752d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lgvwsS_33UyABBN7wXAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: XXjdWRE1lPpur8oht1m8WKfF2WReA9tE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070090

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The existing alpha-PLL core derives the ALPHA_VAL width
solely from the register-map layout and can only express 16 or 40 bits,
so the first patch adds an optional per-PLL alpha_width override that,
when set, feeds the recalc_rate/round_rate scaling and the Zonda
set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
lock to and report the correct rate.

The series is organised as follows:

  - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
  - Patch 2 - documents the Nord DPRX clock controller device tree
    bindings.
  - Patch 3 - adds the two DPRX clock controller drivers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  68 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   7 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 436 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 436 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 986 insertions(+), 3 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

