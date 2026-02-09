Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6132A285060
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600759; cv=none; b=HgQmLY/585YWD63Ky+CQKhUCCaG0vS4VZqG9Yyu5xps3jJkcv7O83xSrdfYpxHGSFNRnpvEOMNSbqLXEeYpCHv2v5qCXAf28sBFTXpLwuPeINg082RzU408UGbcJUCeSZbnPaABp0RDw9FM8vghTGBTb+9cGN+p0kN5QGE6TnDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600759; c=relaxed/simple;
	bh=h25ZBfASMsW19qNVMheDiw3xoIbeq4Li9u2pU4b/Roc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BlhssAvrHBQNzJlcuYNTeGYq9k+XIN1fgudS0vUySNsIG6tPHDiGHthq1klogQdSZ71aAHwyAUUYTKqGWDBz3TtlYEps/3k+zD9jU/M9SrgtK1QK6PuuISPLxlE2P/0Ew5t+3MDHPM5XON5oT0x/n9qyFTrToyyKX+yl7rajMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIjwj72A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy2Micwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIjwj72A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy2Micwg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Mtmst1716549
	for <linux-clk@vger.kernel.org>; Mon, 9 Feb 2026 01:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOV6wa0NpJIqPIMLpFjeBC8CWBIElaVmu+G/psZIY1w=; b=XIjwj72A3ZgeZPij
	5QSCx9z2UNrBUjI6NS5xwM3Jm47aKPwbYuENS70DsHE+WUhbY+DnLfRNsLOqI2lE
	UAWjhqjyv1D2Q93ZKbUwkBhOpLv4ymgRCv4CuSlqwB6oqkj/ls3k7H/8DhKkZZw1
	kK0BiIB+tGrHq2o2F+fpXTDgzzawczepfUAaHmMYl6zz8bNyMUi466on/WRJdDp9
	v4qnbaY7Kbsx4nhrPN0qIcjygYmL050z9zghhAiRAn+T4K0nTcQ6ali5Ywuku7mk
	lfvtU74DtRS00k+hAj8g3GGPUXIG5Ik3SWQTVyMFvYzSl8aJGspZ85BtmcCClEsK
	1tj3DQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xccu79k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 01:32:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f84e69b6so47395386d6.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 17:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600758; x=1771205558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOV6wa0NpJIqPIMLpFjeBC8CWBIElaVmu+G/psZIY1w=;
        b=Uy2MicwgM5dJ+5QxpYJUWDQm2LhpVVet/6TfabVhKrIqadP4p00rx9hu3Y6DTHrDTN
         hul/kCbXmR/5wsMEcUvr3T2BGJ1CzVZ7KlQJRJQfIo1V4cfkhSgCQsCOiAaKB8tnbMji
         Po+Kb+LqhNVXh5miy9pMivQjOpapEwWjDjfNybaO/bzSxXtJRRtXsmDOVO/4h5K5kyOR
         2NOXLA3l9eDepC0ydxUPxSUEX7r1w6ujIXk8O1bKC11dXyylEBgDfjY2IbgjXCx/NLxu
         wanSANiJWGgsfm8De0kQdEmRZDuQmUT6d8Jz+SlkviZLnWGQNXz0qlHxUWq9JGUcNEpf
         RZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600758; x=1771205558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOV6wa0NpJIqPIMLpFjeBC8CWBIElaVmu+G/psZIY1w=;
        b=wuHye0NGpxs8IODL+ukBY6mexDrP1HLWutuK957CYGHF0GsCWjdRnGaQUpclDxSo/d
         YWtSTkheTkBHvZFaV8Hdwd75dq0wCyitt0/mA6UqN2isgnE2Fd/PvRY/7cT25Yp5beXI
         KWyv7/iF7jZf/gdLkWOMfImRKrXSaxSGuoIO0C0b+0CPL/hTTlTkU+2cEcKHvRoO4hif
         6NW3qQtkQGJfH5dPt8OKbiiDsR5FsieJSypNnLM4pjK2JqK3tXxJuZUnL5GPGBWLa8fZ
         U/8XYCKSiRtnEu2LdJOH/vdnJJFTUIfnLxtqiEcxWHqkFDBGIBLMqk5e5Q8mIODzb2Ij
         14Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVY8jlg/xD3rXEdM8B0/opsbwciVBD/+vJUsEPyFqa3pf8KRPq+wn9cetxiPYEyc/QR5gxR+sf44GU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QZxdCna3biP5e76nCARRsJAWNHFpq18EhS3+JPUFS2gsjiRF
	BLXmXnj1RZeJmfX49vIA8YXcWYCBOMmNiSA0EX2XOHpYKEho67tYmdR8mEEd2Y/+MOwpkLK5tA9
	Dajpo1Q5HeJg7PKPbnHuep9Uo9vv9Lqz1f9GDPdRKVTzMYgMREyOHKO1JS3Ov4dk=
X-Gm-Gg: AZuq6aJ76bjg80D2gEmsHJUjA43PpxnVGNKvc4nGVqsSBChgq7Q/UpBkcyStGXTWQeq
	EWKw2/PjsX0bnvyiiM6Fb1ynnI7CPq0pJS8GgWg5K3TL5eba0zgwToqEWvsJX3TJN6yefvhrFhr
	6Iw2u5NQqc9lyrmjTkZAvTtiAdM9RXjFoKR8GacJ4bx9MMt44PNIvaHXZeREBxC4Ps1OKRpuGQl
	BGd2jALok5OIIjNFYaxaVm0nVXlqoMmlKsguOUZ4uCX7QFH7FUkqbi13B7sVP8J7GQG7JqVKrrn
	bpgRmmg7jJpjUur6aJj34+j0H4rjunOwGcJQD9YKe7SqgY0zg7sCYpwDj2ERq9PC/j0Qu/CO42H
	prYr0snun/Vhv5cBi8xFjdKlJNYIaUJVCygfolmic430GonnFtWUb7KEdm11UIieH3e2c01W9Qp
	9uzpMz8A3zj2TBNK0vrt1sAJI=
X-Received: by 2002:a05:620a:404f:b0:8c7:16fb:ed49 with SMTP id af79cd13be357-8caf15f3e50mr1186187985a.63.1770600757725;
        Sun, 08 Feb 2026 17:32:37 -0800 (PST)
X-Received: by 2002:a05:620a:404f:b0:8c7:16fb:ed49 with SMTP id af79cd13be357-8caf15f3e50mr1186185585a.63.1770600757329;
        Sun, 08 Feb 2026 17:32:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:18 +0200
Subject: [PATCH v5 3/5] media: venus: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-3-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4385;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h25ZBfASMsW19qNVMheDiw3xoIbeq4Li9u2pU4b/Roc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTklmAx4aZ2hlK7p2wOyGerBVlPrI0SiVfGEO
 7cUw5QIjY6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JQAKCRCLPIo+Aiko
 1Q9nCACOblW1NvYRHXqqvwC14SrQf5Kb7IGBossoELCys2fKWgsAl3DJDi7Z9zKDZUlH5vDHevR
 LMnLpvhMOirfswsvXNcuDIm7cdzIm47YQLcciw7hJgZszidIPh6d972AyYIT5C6XKUkz2euf/OD
 axOKY4C1IUU5uhgokT6Hqbcnkg7x5e18XHh37fWzlWZMVZzm3YZRuqqkCz8rzd/Sqi+p8BNy/q3
 H4SxGxDKbY3AfZ/2SsN9k/p83rWWcX2TmX/Y/laUoghZ2LbERDy87yx2Wpgt4r9uUbAJAzgxM5E
 rny/sTaPrPK4ePk3jE8JBHLmpeeZ3KPC4/zafK1hMnftWBDh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfXzHmPFDyw/72Q
 wP2ySTDm7l83eSoiuHRNwLpkZB94Fg/p2IOZIZqi51odaFooq69QW+hFH8d5TNrJgcCwECysOaQ
 J3QlAYWmPd4IXyVVHWAyHiJV7bz6qjPnSgd3DErDT6LYCSPJPnSVTuzkOfogCGSd/6x3dIXvH7w
 EGpjFWqD4ifSdpv9RqZgq2fXOoCY0sKZ1QKrSYLpniad8YNSlsYEeaD/4HeTbVS2E+S1iigVcFM
 If2r8ZU1f/5mQ6sgBZ+wlHBgd0Zeg6bNWWdHKaVn402BAHsiK4HFKH0gFv4dhp+B/FfVLSxzsyj
 qg0SFne+YtQ7XJzDyo+Hboc1feBJBf9ltcupOGMrEdFMW32D1jtUH74txU8vUyHWxc9oVf7brem
 tcS3kD8ttGwu61eanZWqPZyvsKb/PN5dSMaEZ3505fnji0HoV0A5G2QirtBUnGrwxl62/Kw3QEm
 UFWN8KuASa/QHdyVzEw==
X-Proofpoint-GUID: XRZMEKe5fO8Lr1_hXynZcT2wrb1vvIPN
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=69893936 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xbrBj4A6o8sUajtV048A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XRZMEKe5fO8Lr1_hXynZcT2wrb1vvIPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090011

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL is powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibility with the
existing DTs, which define only the MX domain.

Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c       | 7 ++++++-
 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 8 +++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 646dae3407b4..cad2df84ce60 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -882,6 +882,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -933,6 +934,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
@@ -992,7 +994,8 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_clks_num = 1,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
-	.opp_pmdomain = (const char *[]) { "mx" },
+	.opp_pmdomain = (const char *[]) { "mx", "mmcx" },
+	.opp_pmdomain_num = 2,
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
@@ -1054,6 +1057,7 @@ static const struct venus_resources sc7280_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2_1,
@@ -1102,6 +1106,7 @@ static const struct venus_resources qcm2290_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50_LITE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c7acacaa53b8..62ab747291b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,7 @@ struct venus_resources {
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
+	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..14a4e8311a64 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -887,7 +887,7 @@ static int vcodec_domains_get(struct venus_core *core)
 	};
 	struct dev_pm_domain_attach_data opp_pd_data = {
 		.pd_names = res->opp_pmdomain,
-		.num_pd_names = 1,
+		.num_pd_names = res->opp_pmdomain_num,
 		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
@@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
 
 	/* Attach the power domain for setting performance state */
 	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
+		opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3

