Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B145199C
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085620; cv=none; b=fMwGCtK8aw0tG6nRKzSlzHRWfHW9r2b+0NhpQL25C0tNRVs+AeYiZr6fWJnF6EcrnYATww7MI/VK4g7xMSkVfrH/MTetFwFfEG8YYkM59/10Wcj2Ik5b9Dw1YuRoBsTLz5+qrgrUROM3YhdcfmmFGrlf6QZPlE8jUV+rg633MtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085620; c=relaxed/simple;
	bh=fCMrPmPUNafBvO10YWswU3IRQXLhDtGia0biGdyfMJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9XqelIEq/tKrKIPC9xwZss5ZsYybD4fLngo75wNBIFmNOZBX7aC0jTNJqzTxrr66Tmy9amlFvkPDE/DnWvol6G+wRj2RlbwIRcq2t6FM6RESa59+cyPL+3Kzdf0wO6aZj4AYi2JlNpMyL4494xOoALwiTSU4hrUwNeh6nlptds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akm7XDEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax4nnx2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akm7XDEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax4nnx2v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gssl3533965
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=; b=akm7XDEWRLSa+I5W
	rccKD/uFljuXmfh0Vppull39C3+f75bCfTWxLiK8TQu8R0Ks3GGdlAz2aFh2U6P/
	QeVTyawYXQ0z1EjZp+jwrahHNiHZSPJ0VQSs3PYotPfZaD5niDMzylvx/yHHaJ2w
	AoQQoJ0SqHa1UDZ8EcM/9JtomuU8G5OxkEFIamfU1cKo4xo4sWowgh1qFY5QkTkV
	RBo2wgFgyDrDFNxUWe1SHj0/evKGRO1GuvapgZD+MM7lQWxguG3q4TiaJ7pJRf41
	UcTtf7LZxT9q9qZWpPRxFnXYUL0WkqZFma2xwdxYH6s7UIUWmdVmahQfhkco9ryM
	4JbSYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ftrk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484b9fb055so6869350b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085616; x=1786690416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=;
        b=Ax4nnx2vf99HNx9pzKd/m7Qe7JkNvPo05TQNTDvYqahoVO+Xc00OiB6XulscXoTT1v
         P93c/h1t/W1MDmp9TkL5R7yBgKlOxUoIHURLz9uswzKsqtbBIrXwWYi88Nr858qka47T
         uZrTAynaE4wur5/eIDOhsROic9B5b+C94umLSAS+bbPHECYJJXxlle2NE/g2RJeyIs/r
         cdXONgTMWeKtl1MEbXV4P4o6iZcMJIhy6pyoV/DreBQXBoJNcGukP7EfmDS9UD3xejto
         y2b0RKEJxBH9vUI44Bw35k0n8J2nOwafH414JiI+BRHNmUZCoh0raqt4Vd4en5yaIsvc
         0mFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085616; x=1786690416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEf2DkYlwBhwbK9/Hz1rs3k+ZWcCvcZ6YxQGzJOUpfo=;
        b=SP3nIcEWobCMAMwIVsm30ER03hluzmlX9PPifFGS6gs0PZlfkpqfF8bMqt3CCg8cT/
         8r/J/lxZcXE2JUp5yndOIFzjO3rxFe8yDY2rHI8Gos5Adj3m/Hb52s5iuqF/N/y1gy0B
         JS/8cWshE3B/RGG3tPKyeHLUwVrZ1pTOWhm7x3G72w+y7cyKmNnWMqxq4n5lvr/CU3gt
         BXTJY/lCJ0WN4IjSTyPXzLgZxvHDpp//UyvezEMiEu9AIYib2v/pMrcJEeeQ/BppRutu
         RCoJEqnb+SQL0xNHFVzEbgs67dQr6KpxcZEkpWBAZY2I9aYcXLutJ29fsUjQknvtIIeU
         u/bw==
X-Forwarded-Encrypted: i=1; AHgh+RowKPgdbIHmtc0Yy8OPLlZ5LgzfNLcklBL7JFQ9iaxkxea2Z9Lce9wCkuPb7DHwB4fWSAb9w7YbSis=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxxE19sAx/b3fikBAe7v4mHvB/rkaVnI7rRfmOdUzXUSQoEej
	lnY5GYg9D0y3w09WZK7Zcl2O8YfUFrGgHIt2cdYP9irGStTHmlVz54LCKkKUuz3pXf9Zu3H0EXO
	5Pc6un2hwP1bmq2X4kRNOg0cQIXRH6wD426OEU7919kvtN0dyJxUPTNikGDQTOdE=
X-Gm-Gg: AR+sD12JOBMqDxZK0LqypdUyPitJ3BnHa3uK7edlT/OgeMBDnvPbUHc9zwhl5JsmmST
	gzlbxlgSbUPr3+rCVvQWEaqGkjROOx2ZkLECjWr6++YI5rbX+Y4sewSbp+r4JXMDVbidM1x1j33
	3L477X50uoKDSKfrdkkzsQ2wslk1sBHUwxFfF/upKE2Q8qN3PuJtnX9mBkbK8kaXTCDQNqHrYqA
	PC4BUo++jVRk35t7HA3697KjwqfXU4v8+nG5vy5/q3jdAKjJ0NxQ9NjdUy/9AGivOwhi4k6Fz2r
	iRvXoMwQQw+EE4t0gas3iIGo9Y4kT4bKzbeNHJSfWYrR9Ah7quiL/rfG5wltTMZcgsnS1UZ0aqz
	G48Ftdc2q8ECe5snBPx35CnhSDr0DdX03T8QRfsNeLrw=
X-Received: by 2002:a05:6a00:14c1:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84f5df75147mr1601400b3a.9.1786085616381;
        Thu, 06 Aug 2026 23:53:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c1:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84f5df75147mr1601352b3a.9.1786085615882;
        Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:16 -0700
Subject: [PATCH v2 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-12-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fCMrPmPUNafBvO10YWswU3IRQXLhDtGia0biGdyfMJ8=;
 b=zPJlTejwSlIiks/S9GRhED1Pg5YBRxh98sLwAUScXZ53SPlbxLbxUTMzkOZwvLodCgXwbG4G6
 anQKjPEKjnBAlDnIFqihtVPf7C1hRVHjV5hWa31Mv84wgfUqvHvn8pA
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX9oIOj48UeCQj
 zBrfM+ipWro8Wq6NMtWE+ACruyIOK/MXn3vuTvV/U64AGrqgYe2zKg6Jh+9K9u+OKtss4nND33p
 exUq39dUpUYxNlh3/Bw2qWvKmYfx+4vHBZrSAbF8zOewo5DOQ/oeuYNi3Dk+POhOlZ5iXhdh34A
 Mbt7PhqPW11dXfg+jb6eK97nsplgYSIaOSHwjqUolB3i0T3SVoEUkgrXBXPywXmyotTFwnaZzQ5
 9PgTsifIiKF0/1GpdQueYQxLk+mbc43YuqJ/Yi+OtN9eJ2e1FPRr3CLHnN35V5JuXTPiS6LRBtS
 PfapGbI5f36E5OBGHOSvYIM/p34URjWtHeDVRqU/6A+t/ilBGcR7nUE9CJkyNoi9JdF7bD9ONL+
 E6UTOM/BGgnfAXgr0RADGl1/knjWfsqi69nPMbWsgN0n/N55WEY9qLuqZpTgwZODPAQfA32UJIt
 LGxUXKTHId8c7cLVRbA==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a7580f1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: eQ1YPW3w0ukqlYQnjMqTQPjwsgjiBijg
X-Proofpoint-GUID: eQ1YPW3w0ukqlYQnjMqTQPjwsgjiBijg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX3lxE71a/rX/5
 AE9NWcjjIPVqSNrv7xqJD2Ud5tRoJBPpIFFHUaIBJ2KIAo56i0AjM+q7lEWQkiMU42v5pOqRA3h
 fWlhpT+V5RbHDl2vlCbl5/++hmEY4hA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 7025bdd9036e..8f6b37041132 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

