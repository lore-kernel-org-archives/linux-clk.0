Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F6368964
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971604; cv=none; b=nxBa4eAg+2lfsfZ28ejsXmtgV7n0VDtHQ6rgR7AYf9TAsY+PWZ0WCZ9dPBGT1Kp+RG2lDB2STbz1BOiAxOFq35r0ku63qF+D3DE0WH00aQgwNUK7TMGV2o3Mx7ZaKMDnTRyb7BSrmBEA2uE2p836t8m/fSkhaBNZKZwG8mS9yaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971604; c=relaxed/simple;
	bh=Gw3kKloXHhd5RaAIBqqm6LohQm4BxTM9Pt44ObqDInM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KX7gmHGQcfTza1ZEz9rLMtUdCbhD+zH3jK/YP62TjvU7A8Dsgfp7/rberaLSYECzM7UyhyZ4qAJFMyjA9MBO4/Z4Brr+dyf/PB8rNugcVnIRavfnVub8DCY0d5J53Oggw6Bu/F1+LxlUbPQrV259IbueXtdznquIHcJmVkCa3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN27V5C9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmrA0Z+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AN27V5C9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmrA0Z+F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6aY485241
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cYeD1qFgi7PTbqTpFl3N0zbczvxdHg1te/yk4UXbYQ=; b=AN27V5C9eoTXuW9j
	qoWqnBpOgwgFiedzmEzQToIYx4Vc+8U+TCJn4/prJ+2LneSZwZm1wF7I0ENHApzI
	rioRQhE8gUlDPSrmV13OKaf6bbG3Yo6yYNEOgLNVAqYX2ePn7bxmTpM8BEAMs9XB
	QYm8JbbbS7WeFTkm7AhOUmMn53V+59rZOzAsuOSKK1AtHpsRY2SPYZVrn59fWMGA
	e0O8RaXZaKc6cou93DDdrhoh8pNev18dyhfrWB7dPNothfdZNWssaWi8vEyP+Xbm
	97D9/12qmdX/lDlPjAtSz08ej6kgx8EzFk3pIJ5JV5Ahlrz2wJ9lSDcA+X5xY34Z
	CCo8Gw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j96q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2570857a12.0
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971601; x=1790576401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cYeD1qFgi7PTbqTpFl3N0zbczvxdHg1te/yk4UXbYQ=;
        b=QmrA0Z+F0i7XJZyUTB2p7OPt3raNRA7++3JENpobV3+dW96BmJO8bGcvn6O++MA5by
         KNJ5mqNC4qBbY9S9cw8/XyPsEceZUeyqinBU2ptE5Jwme1GtyZgrev7+fSzaTF+QTQRD
         V617xKppDgWJi00NUvwYbMsVuPrxuk9QicHDp8SZWmPX5c1locaJETEmiTeyeRlbsC15
         2MzmALUdq/MamfagxaZaRk9oZ9o99js8jv8d34M8vrJBYjNOKVhUUI9pthhp4+BV7et6
         PQoRzd+BKcqFWWrMsuMofZBkpGynkAraLytakiClj/WDPNlp18PG7RpThG0DE/Eb41uW
         1GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971601; x=1790576401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cYeD1qFgi7PTbqTpFl3N0zbczvxdHg1te/yk4UXbYQ=;
        b=k5bli86JlaXPsQ4xqtVIQzXg9S3uenLzfcGxT+gNVAKxSEcAq6N+GD7lIVhSUO8YfV
         zSPwellkiugAGZDCT1bwyxnpFWGfrFqW8OUoulRW4M8SmBjHlffI/NxsmAzZjoa1hoja
         gtUIuk9LMwQul13G6Ff9nyGIcstbvGDMtPn+YA0RUPZJaUx+1/v29lkhVK6r3WpniyqR
         ORyW/8HMqs6HzgF53K+JK98wMbcb/00Jit003vuVUzHouV66z4i8Gk6wN2obgNvX30Kh
         KoJEid3S6dczeP3dYBZhE5D1zGgVGRr8e1Lbuqevxa1jrLThgFbZy9eMnY6ZjxojeI6e
         cemw==
X-Forwarded-Encrypted: i=1; AKwUvBwSCFElTZeWgFhgtrCy9sGtVsXj+TqdrCDBPP+H9eHNJN77nMPcnwAxnF9tFq2x8p3bbcmGdcbAuwE=@vger.kernel.org
X-Gm-Message-State: AFuF++kmgsU807GyrQbe3C+MUO7Ky5jbmy0M+XKZogYApIwtiT+yhEMS
	sEDbyPYr3qzpW7eryM+QEXWAE72OKvtt087wvN9WaQB+xITOgvHf5DjpwE1avOOA+lThA10Cw07
	/SRJS7+wcj3STEonWhHx7dQMA/CI2CcRXuRCUQotixY6dMeZkSMmmZtJ8N8J5Tlt04lJzPxY=
X-Gm-Gg: AYBFou0tCLIl07GLNm+R58sul1siqj45LDo+txQQEhtvQKCnQvnKwQBr6XK5fjyQRl9
	vV3TZIeZV8NQyQ6qe7rSesFsXqtpNn3lM8CExTiWzyNENK+QokP5iIvd/WBH/piav2jFFGQJtpQ
	Nb9oKfgR713emClMdaHck+DqavfLbt6ooRqf7HcE9OsZVpk7k1fI5G96H8V0XYLxj8jzDhDqu/l
	P5QNLQmAYNDk3V42Z5jYltBVaEhgemzV+0vcGZKyG11jB5QYoclO2NRqLOZ4VnK9jACFIP0NCa5
	fc689ML7+oFlGzEVsdYysBVoeUgUTezGInXZax9fKgbkxDtYoKDp8cZ7UHX8XaWZBjQytnMsRpC
	LRO9xHFkdh//6Zh4Od+9ApzNhGRHzV7ENFwrXDL9MWOTH/iVUaAZ8/GLIF8vckduyw90Lsq7fiq
	efWsdodBXxXZTmIQA5U73bdvTmTYnrDv62LA==
X-Received: by 2002:a05:6a21:7484:b0:3dd:a9a9:396a with SMTP id adf61e73a8af0-3dda9a93b99mr5596887637.46.1789971600690;
        Sun, 20 Sep 2026 23:20:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:7484:b0:3dd:a9a9:396a with SMTP id adf61e73a8af0-3dda9a93b99mr5596862637.46.1789971600244;
        Sun, 20 Sep 2026 23:20:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:59 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:35 +0530
Subject: [PATCH 02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-2-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab0cc91 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0wqEVkZ9rhxH
 HHA4CJvZnb4T6i2ydRLu0o/LYTqrsHGdBMm+1zfAh+SRnZSuGIP3b2MEr/rmtVjl9UiI4VtWgKq
 a/tacUHSMhwSakVpVUUfe9+k+y94rGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX9gyhCNZ6IINN
 ppuolXpD5ZROg7o2ZwwtubR7FlrK4gZhMcH4kWx+NSLMWRr5suBCOaPir0jU5DdcTjOgBrEe1UN
 SU3Qo+XGYVX17ubawwQrrp5FvLq7SCSJNnluixKBLERXqwYgWkGsymWG3+3wm4+4qxa4bM3ARU5
 LPmgiqtdpUvbpJIF7YBewGTX/USZsYuLLMZdF8eJ81UF7+bBPxxRAwCzhYZHT1qITdxPxQsiSHX
 AamKsEqCeRnAD6Wr94535EnA7cThNiRC5iOYfvYHpKumMK7icxa3+whtEkTnZUDtDYWZOyw+B3Y
 64rhcx5HP8D2Qj/F1QtiF05VFOX2uE//tVatkiQnFtSFzWqw48fSf9rxX1Y61uvZt0RWRTSedeS
 CGDv82qwH2CXePfd40Z/3a0KV8SkQe5pgXViZuICHrgm6qQozEA9ljE2Dm4RS3zZPH8numLat74
 RZ4fNhiyzO2Xf/faT+Q==
X-Proofpoint-ORIG-GUID: 2cBkxSuItoFdLDngxIHGti09kd4q019T
X-Proofpoint-GUID: 2cBkxSuItoFdLDngxIHGti09kd4q019T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5332.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index ecd9ebeed754..4625b447c235 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -1038,6 +1038,7 @@ static struct clk_rcg2 gcc_usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4_OUT_AUX, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

