Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D23EFFDB
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413744; cv=none; b=CtB97S/h+tVCEoPz+p90Io7LdMcWN/unRltVkHscuGH+oIVs1A4qFwc5+1kRV74L5yBlUfoQ4Awyt44VXpgp1c7waY0e/apboI4EZfVcOAzY31UY7gJ3u1++bpvIcTexcoXpgr60unZesnKzhwwZEAh8DPa/QfvCzKV49FJc+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413744; c=relaxed/simple;
	bh=drZJ3ZgjFEHArF7GLWJVFaud3uQEkhUjrL574rDJUu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYaNLlvCmt8bOUb3RLSDamBjcQK9Plo4pIVzgB36HhwkbAb/T9ekiuhw7o//X955IEPpHpSXsPPcGLJukhstFCC0BHNhceC25jLaDIfhNKqXQCrb8e2TAqUBvMqXBS2wq6MLIm50seNRQc5mcfvckN5FeIKrUOUzSbrayvUoOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa6s6VUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtZEeYws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa6s6VUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtZEeYws"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652E9LHw1639570
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 15:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5Co9A3aIvLKh8iqOJ6Aa43KQiBGm8s3d3/lC8D60dQ=; b=fa6s6VUVVZL/lsV+
	uv7GROZem/vzaoqVCdtTQHOE3AqIhIfM2N/KcQIV7K6scsasOI0OP8xO4zy/rs4n
	5ifvg7y3X047+yYmUCpohCtKxsL82NBwjInDcg3VAytayIqhnsN7+x8iypSrKIIl
	XKRBUYyXBlmiZIe6YK9IQq9Ad4+Pyb943RwFaX4X5l3r+8+fQ/9EBK0/7BiqBI9i
	n1S2uK3omqWBer8zS857AEj7z5LMKbkty80n8JNm4apcvAB0SVjKJgy/G7RAPPge
	56+PLHLtHojdygi55+pDmdIEzWiM8I1dgIZ2ntkBYA9sTrLLe+daSPWLp6zRyOoP
	g1hQpg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1chuc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 15:22:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso3511029a12.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413741; x=1781018541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5Co9A3aIvLKh8iqOJ6Aa43KQiBGm8s3d3/lC8D60dQ=;
        b=QtZEeYws0jJqBpy432Og6lH7CsudYr9v8Eh2wxh3enXll9TuGhZ1JoQd7VtaxAJbvW
         98WHluLaTiuwC7VZwPmSGJnKvFf7lMEhEG8SdEW098JqKn2igiECyhq1SK7YZrOr0Ape
         IEd1U9Dkm0b8NsYHJwmVKWdmQIyMZKElD04gQT0t0+R0CDwMz/swrwp8SCBHtVVRzhYd
         QWqb6/kCgkO4AyblrWFC4PEGarDCuRJhvdqZryEOOpbMN1Z9Tfd9jTP653nFX8eu/UYB
         lEpktSp+LzTgMmOOfLTOTa5iQz7wdhvaf1Gl2HQVIHBzWqM2jciT23BiSL+DQ6T374aP
         U/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413741; x=1781018541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5Co9A3aIvLKh8iqOJ6Aa43KQiBGm8s3d3/lC8D60dQ=;
        b=JAqYjwDzDQ5fM6xn42sqvKqpVvH75yVNLzRcEf6PQ7IAi1sAPSpgaZN+410IEDuW+u
         okTDtZeukWdsiNsPpZeGzE1v62JG38pQvNFTEoyVcFfCqbEktDrgVN+xtmXMnqeiNlsM
         OIvp3L9lxq2cJrI4KKqunc3dXliz+RlzmWcRw02jZCLr5UoznLmNYDHp/kMyCcNhU2w3
         KmhpI5SYt+IIbIfD9aVnNlTrp95nvTiWUYdfMF7b6nxMzGfr3gstN/OWqtZy/lPS7OzF
         xdpVl1AwiNOc5nfElWOP+kgriG/yVdHVv3QYg9UamKiY2nWs+EYvMGV4nEhCcADoJemd
         X50w==
X-Forwarded-Encrypted: i=1; AFNElJ9EkWo+PKPrgKLlwhoPNkvgqEBEQCxnZSLAr2wvvgK5dpiL04EiYOHGDOcEJ8ldlk5wBWUHfCbIXI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCu4+c/VnkJ02g8DKXFwtlSab7QQgrsk43JuRU5r129rWzNU6i
	Ea8OTcAhsqGAgsvsPx9Pt+b9Owzuwj+I83SQDTTnjk6DI0T/Yb0UpCFWFFtwoFgAmhg/UmP7EPM
	79KFlw/7tMzfuR1/B+QUbykxbzgwWqwqujh7O/8eSNR2cLipLDdqkZjWsJ+75nqw=
X-Gm-Gg: Acq92OHWC1uNdJXZmq8HH0m1XIoqjZkB5zN+3bdFN2xqf3rcjcuAc39VB6ptHWIVjgg
	fhlyrXbCYTW5pjfG/PEOgdh/svKs6mxf9wBHZJijMiNCUWl7ieTgK2dSkPC/MlVuLJemgJgjF8a
	hR1T27Di+Kvyas9XBZPwe2kZKVKJPKq4UqSnVqi6BQZ+xlxB3NO1DjvOS3jTjaokBb/ed3srx9A
	5rJUz1Nwvn/DyMayJo65oilnCotxv/mURpTnTDBBVcmL4z9LZbbIux33612s/q3/dB2FKus71DA
	ZZKx5eBhsnjOWFFRy9tfR+h5LVxraTc/f8Kwzdp5brodtVvpjgRT8Uee41zEumUDKd1bcGtQf0T
	ifs1T9eFZNxxkBYV1Cs7ffN+gzJzeuVLzhwFxBLFcm+ypULq4+tC2MId9
X-Received: by 2002:a17:902:cec4:b0:2c0:fa4e:91f5 with SMTP id d9443c01a7336-2c0fa4e936emr71096565ad.15.1780413740362;
        Tue, 02 Jun 2026 08:22:20 -0700 (PDT)
X-Received: by 2002:a17:902:cec4:b0:2c0:fa4e:91f5 with SMTP id d9443c01a7336-2c0fa4e936emr71096195ad.15.1780413739767;
        Tue, 02 Jun 2026 08:22:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:51 +0530
Subject: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 5Kz1sWeuBmnSWO6kQ6qXCifMRViYFbUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX9BSPew/9pWpe
 TodzUQq816/kwQTUNJZckjiCQngF3LAKrIxGFC3EgjhZhqen9nY6+Vy3oT5RSSiYDJ4aSTVwRGN
 AF0ZWmrBBAeiZcCMgCLeI2TIUwpFa9nACAwt9lRdxUlhRoFQOYz6ZwamhUmM8BB+46vi+CAXJME
 m09bMdOGKyIp0Yg4xct9uWew+tFaOS8AmPylZmN1nJ/BhPUWL6trJ0SPkmQ16qchNTvV4HbiqVt
 NE2QcSfjcWv5nYxBihDK3gwW25ODhECgPW4vSbyvJBpn7R6WQwCi6cH8bGJK7EYX7wqYRWW1ALS
 kt0zBn6SKZvYfwKDdIj5SmCY9bHBUBBy57NBDMW44w9REOfXGqknO5YhesiW4LOzKmEnpkmAqi7
 lF9LuWviNWez3e/vxWCb6heV8NzR1lK5gl82if9FCUtmHAwg2gr50TQNJCx7TnSQD4eBx1A41+b
 2tywwbXLmwmg888oiLw==
X-Proofpoint-GUID: 5Kz1sWeuBmnSWO6kQ6qXCifMRViYFbUw
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1ef52d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BWecY5n4_7i4tiiDEVoA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020148

Add the gp_mn pin mux function to the TLMM pin controllers for the
QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
divider clock output on a dedicated GPIO pin, allowing the clock signal
to be routed externally.

- QCS8300: gpio32
- SA8775P: gpio35
- SC7280:  gpio60

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 9 ++++++++-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sc7280.c  | 8 +++++++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 852cd36df6d5fc6d0aece7d57f8f59fe48c0cfee..1430abd9258989bdbd8a12249196bbf4e9bbbde3 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -429,6 +429,7 @@ enum qcs8300_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -656,6 +657,10 @@ static const char *const gcc_gp5_groups[] = {
 	"gpio76", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio32",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio106", "gpio107", "gpio108", "gpio109",
 };
@@ -960,6 +965,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1067,7 +1073,8 @@ static const struct msm_pingroup qcs8300_groups[] = {
 	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
 			tgu_ch3, _, _, _, _, _, _),
 	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
-	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, gp_mn, _, _, _, _,
+			_, _),
 	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index e9a510d3583f5c392acb833be4ce67c6b421cd48..2c29743cca7a259b5a41e73de347c536d373a01e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -486,6 +486,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -834,6 +835,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1236,6 +1241,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1367,7 +1373,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1

