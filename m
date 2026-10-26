Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014227;
	b=4jRI8/od1CGNzQYjTtfau1dzArFLLEE6t6YK2MNzp5Dd66XBHX9lefRspb9wv6sI88/E
	 um5agzmTzR03v3sBi2kwmzlcWWVJ8+FGP+JjQ6WNG0jVx8vvoXwgE/NAfY9W2O91E5LUz
	 EAW34CySUuEJV0Zfrhb/6tCNMn7pvZdE2tIqrBaAsS/Sv4ShWOHH9XC2K0sdWHIbjtTTB
	 tlhqzR0Vx+XoOQxoEhh8e9oufituWnFq/NfxoSqAIOdJBgkkyJldw/s69IiHAtl+KXUu5
	 ISivewweXtwAOQmjwAp6avaqw4uS/Dy11t+rtWTy1NKq+WbEuL0hu1eOy1X2GOpVrlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
	b=s7WFuvkx9wpz0g4wTQhXzGpzTIraoRdSBVpEmxHr453sGusobnd1ksM92jMPZw9cxSDS
	 LFMKwy6mSgIEUNE99fl7uuOwDtuUfqkIRLuzJd5YaBNM/m2cFKrIGH2GaeZfGZ3sDUxOl
	 bneLicE39OBpFPPqp8KK2IBHMigooA+2hKhRRb34uAbhXAS/RaqWlAqvIjWzxeITYTJa6
	 jVMZFHYaCPpfgQs2/MuAFlcrAde3W94Xj6Bf7hY1Zs9TEuG3Hbzb1ESHnogqGpBbYuNoz
	 /rTE27JY75x52nvNeDAA14HkF023+IEfV4m6MrbTMjMRUE+PiFcCHmN7q++1OVGWQYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3h9M8bN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+kgutvj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221E60A2616
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9221E60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3h9M8bN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+kgutvj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNKH2542001
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=; b=o3h9M8bNlWiM2sHT
	yMHVFZfz9+A2H56i90OElQKT7rXlSywlIZOK945W6NTvY/wxqxZW1g/S3fc18STh
	FN0O0tTgTfHqs8bYteDZqzxiH1QIB57my9uDSNLLUz1zX5twUfA3dA832TiADhlZ
	fk5tMAZmPJ7s1csIao3F+JgbwUgF3JRqFImX95uPHcOfu5sCFMvhFpY3bLRlzDyJ
	3oW1WTpn6voaV95CESMR4YNtw5jhjg2oQJjU0K2O90jNBBsEZ6QK1k/jNg8Vu/1K
	PYJlwHXK8nAYuONG5PtMzYEc9xBydvzzhbeOYauKpM+k6RP7OL9XoBGiBSE8VffQ
	IEl9qg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda7rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2897762a91.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014225; x=1793619025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=X+kgutvjeWstrz3xdKP+4lUxQ2VkTjJtveTMDuddCZ8BR3zaBjh6HjSzOy80hJYYiG
         mesgjlDZVkEtKCiAkIgtjKAe1Dhx2v8ShhKE3W7CbkWt07Q+csnQ5vtvg8N1iIG+NOEx
         E5D5rfO0k/AWdIdjlAjtBG2VhcyvaPTlggNUeNH2mCG4sgvOA4Act1WBp/YUqY/585lV
         qKYQbPCHUZ0euBNhrli9Mc3h3uqmqNlCY67uFnenJGazi3uVDI46kWy6FM0PpinVN+LY
         DlAXQu3UoaPDTlc3IRvdxOTPAKZSm6q0MPvyzwm//RtiWPZsyFP7R31sBk9MePIGfhgg
         Nqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014225; x=1793619025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=Oz3cfghUuyFp6OS3rHsqdreq47KimPQX7wy86unxKh0Yuc0DwJuJNPlM9fKSHSt1wR
         3S/jXid6fmYMqIPhJEn877h4D/hxIDorroXEXgFWUA9vJDL20h+N63RTMqr9GrSm4AmH
         q+6FHCEBF+CzuVXAB9YqosO5jDvqq/U6/qe8zq6P5r439Xrr7YDHdx5Vi8Ucibcg6/7m
         mg/b/CQTqeQJbt9cIg/qcY1DzIpdYpN0p5JlxeeSXuAlGAA1Z3vyAAZQEzm95xOyNcKX
         /kL2/QQhmEEHyegYhhdzjl2tRuYFcC2smqcPgtusoIPQH6GDTYFogOMyCEk3ZfY6yVHN
         IS4w==
X-Forwarded-Encrypted: i=1; AKwUvByWgIfN1fr+4Cz/AyEPITangX1umUclLDEOdRyl8QudT2SNmgzef7+4BVypvf5cbqOq1HH1CLAw4yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJprGWds/RMqqlkZ3IOFt8v1iElgrjC6juyQ96rATmYbBA0La0D
	di7bKQpeLRpMAk7UVAHZempjJWBD7VbmD2bsmT3x6rKiZ+no3tPl+nLPrY86dKsyLe4ksMZYcF6
	+eQgMNQNU4vbAc076QDJorI/jAohRdRc9MJul7WtD70dImp5LABGpNeyeiQOT+e0=
X-Gm-Gg: AYBFou1rn27bweDYFH4OSfWEzDDMEbyqGgCEfElPmnJk0XE0D44ttVEtZ5W+jxHNupW
	HU0lO00FdPGOeDzWb+jXyhjWpoVEYoWzsZ7gM1uIxg9sFxhTbl4UQBErzm23uKrzVgp6i7oin54
	4k8tKWxWXObhwxCk/Q8d+mKm58oll3qCBS1Vel7zRFEdaX23BN6wa/LXLXJllVjtbwA9hc92toz
	VlqLzrFlBa75rweq4n+STUvH4WoEcvxrwi0PxC+O3Ekb7FXNPG+V28X+2YiUYPPa7f5z2tPqCRg
	abUYdzwx+kfC6eopK/kKhcHPY1IMALz119d94TLcHXxn0enuq2o5OLEez2XLPTKi3oSToYrBxWr
	O07v1cU4J8Gd2ieiyKJRH8x8=
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr5476457a91.19.1793014225133;
        Mon, 26 Oct 2026 04:30:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr5476426a91.19.1793014224693;
        Mon, 26 Oct 2026 04:30:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:31 +0530
Subject: [PATCH v2 05/12] pinctrl: qcom: qcs8300: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-5-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Q1k1NN5T8IoPJw4vSCl8yhy_wtwqyLXi
X-Proofpoint-GUID: Q1k1NN5T8IoPJw4vSCl8yhy_wtwqyLXi
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf39d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxcBgjFv8hKqR
 ngT18wWgBdVtl6dKhoELnV+d6tEKeewTJWtkzEkylQaHmDMXnbcX6ag/OnWwbAVkZu3zgLckVgt
 DaO8k4OYnmQn8oeihJ13WehvIay4zk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX5A43wpHgO87y
 FCp6uyXlZt8TtvHsObUYh6S6wcVwdJssNBB1AoZGyIdcP+FsCRM4bMCC4BS4kZ0bb9djwqZh6Nx
 LKvsKhl/oSFsu0lknC4ioKlPA6MvYWqzxgshBp2WaaEYg0Osyct+/+IFW1q6OaSIeQRSsyTgbJS
 yzpjrfmqqq7zQlZbe4xEQZ6OMzTKyYAMJg86OGgvAqEK/QcvQ4OTFl2x1de35et2lPT4y29J/G7
 MIKGoyfmLNEvea9o0N/bduTFOGxhhDJJbUls3ll8JiPt823HXewsQ9OX736cfvCNkKpPOAA0INb
 YKpwrEMpsO06RUpaDZUTV2fTQTJO0mmbPOh3v52l6/af40n7e3j4PCC0M5Pd3U0da+cDFSIuenM
 9+DTHhn0oy0LysBf8i2DUUOsLJlUHLiCGy8epTptlptgJcZhatYJmuQYgNaAg/hNsxhdCTrDlDH
 e2Kl28Mjy4YZE0ogjEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio32 of QCS8300. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index fec86818c51188a0949e268382fb0c5de3f66f1a..349369fcdf18342b27067b91414eacbe378224e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -424,6 +424,7 @@ enum qcs8300_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -651,6 +652,10 @@ static const char *const gcc_gp5_groups[] = {
 	"gpio76", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio32",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio106", "gpio107", "gpio108", "gpio109",
 };
@@ -955,6 +960,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1062,7 +1068,8 @@ static const struct msm_pingroup qcs8300_groups[] = {
 	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
 			tgu_ch3, _, _, _, _, _, _),
 	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
-	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, gp_mn, _, _, _, _,
+			_, _),
 	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

