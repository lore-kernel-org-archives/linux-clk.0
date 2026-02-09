Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D89277017
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600756; cv=none; b=A24gFRH9WsjzhOrLJFJaIXMmP25c/vj2xzl2DFp7m8BHcHhOtSgydeR8VylYOq6gwC99JNXaauLes5ZnJJRDWDW2uDvnKUK8DewlbB1g4xHOCN8D5+w1DtE2f7ivFQNb/dUKyWv7kV95K5MhiBoVM0okhmUhm/OEJZjuLep49io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600756; c=relaxed/simple;
	bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAUtjcY8eBPrjdRDTS2LX3vjZgGTYxKbtHCGyifXkwIw+eAhVyCbt1x7GnAOgdZU4KlX0fHFrJLiQQNB8MPy+Edi/M4u4dhoneGkFn04hV3HKkS5GlAN3gZQyJD+cc6htbZ1DMin/EkwUmRP/7u37HtTm0wQsh2ci4NhcSNyAYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2CWsiYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuVkpwnm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2CWsiYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuVkpwnm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618MhElc2425262
	for <linux-clk@vger.kernel.org>; Mon, 9 Feb 2026 01:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=; b=O2CWsiYLh/58+NEY
	v41k9bVGGqDUgmjk1HJeAnKwdNV/deHPhFakOJYzfoCkOvM+vbFCqQqnXXELdIHp
	HU6MnFVf0MO7YYezdZUY2TIb9nk/+F1LQbbwtJQOZzTbtHgjhzRWDXRhknzS00lW
	lawXyNjyiMd7Iwg8Vj+/WwyGtbqDe1ogytb9O11Hxiq1Fx4qQX1u8iPIkFtJI728
	ytqcH2XuosBXv2Uh8NymS4hLkqwvQ/V4KKeysSq20QBgSGawvLGJY2iLMuVOOQ1K
	TKgfT2x1HD8AFluv/TpBVNUyW93M/jp8AYEQsTgAEt82GWWuPsVZs9y3cNNFhL/F
	YlmXlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb538rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 01:32:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5296c7e57so1013580185a.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 17:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600754; x=1771205554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=FuVkpwnmsZKJoCsBtFFI9tMu3wjLkWMfzfgxPcin3mUIcXQyVjKXUdg6LAg0puuUTS
         4ulCNc8WkPg5Y1VmkVGXY+BdYlDHBdAee8yxOJhQwJ/BZR705FAuB1M4DNYk79++7jy+
         v6EBKh9wpCf6Eevcb7FAwDOJJcmuTyX2u+EyZIJsNEGj4765WBvy+afGP2hTJKKbtuM+
         yq2CCSbwAZyFX4IB1Nrk/AfpFkTX3vqA0Om6pL+If3V/VabHOypHNVbJTVrIpej/7gYe
         HPK0sTeUOEc8LfsIICk7/djRtaxLoLJfrbgw/czmhzxwARreW2mK+DtMauJKhlR/heaC
         LX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600754; x=1771205554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=oQ6MKEo4c63j+B2kh1ArdeWARSfpJQhc/TOU/uoX6E0P5eXZy6D/slZG7o339mXbiA
         XJXTj0W9Bpw5K2BLy+Wtuq7t61T9o9zejc06tsuDQNVt4upGhnchn7cNUgFJ1cL6T3Eg
         anmUYpuc7xWmlyoLrABlkRlHGgR+81VASROSdGWTxZ5F4TGBE10vJ1Lr1uUY5oU83te6
         tEuMOUx5pIL4OfBKIijm1CFxwJeBWGj1YJ3PzED49nduNOCbY87wUib6xPZjAOA9vuwe
         RwrcZEii5tKmvdmPb+kuek2I4IbqFfH85kuAe1mdY9or0kq/ocF97uJIyq1eKs804Lk3
         OJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi2kW7Vp80uDonEENGlZnJbdV02DhPnpjCrJ9A+cqjPmmc2lRMwT8urVzo67bv3XAdcQpPUTBv/A4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgPaQmD0eneXHnEOM2cABSOPv8fdUVjr0gUT4WY7Edm4AtXPd
	JDtaSSDEo2Eb0NnJd3RZJWEQ9qzOWGrUykO2y5BYBepdEzk1jexFqrotdreEWkk54hEvSgMLirR
	OsOvutRKwbIQ5uP3ElsT3SxAaLzLDc5mnFxgeakYITZRJKPa2JwQrOPPUW78Vgn8=
X-Gm-Gg: AZuq6aI7eMH0QAOTF2fbv4bOpqE5lVP6WNFKunx+BzCk010qmzxtHfIlls3Rzwib0kV
	jDFz7HjFQLYA+kE/hBZ1P45USu/xNJhLz2tMul4jDZ3Hq70A5TXP5Dq8CdVcMJkKRKrKpxicPUe
	YzSn94J1de5SEWvCfyGHK5kmT5Nu9VoKT+kQlPNn0uZEMmAhaNk4xj5lq2zPKPPUmHhFzYndcZ/
	JU1UflbCeBaHovXQ4jwMMRF1EbeQAYL3gdVfF/FbOfz0shEDcBWnHi1tV0u2K8sFI5zbVndcMjb
	xBf+Xj3+EXVeVEEOju0wEARkJoCcPpiU3SOLHS7x6ibBLydGVXdZeCKBGeBItvMkqstQOJnOlo2
	e/hiKZFrRML0GmglQ2/0U2LZLzMUkKO/REMMvWJhgrDz+wThwaWEjUOqm+i/vvd70gDibPDacrw
	HnE7hZg/tuAtB3t9jEDMw0eDo=
X-Received: by 2002:a05:620a:4553:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8caf1308324mr1279864085a.65.1770600754086;
        Sun, 08 Feb 2026 17:32:34 -0800 (PST)
X-Received: by 2002:a05:620a:4553:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8caf1308324mr1279860885a.65.1770600753615;
        Sun, 08 Feb 2026 17:32:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:17 +0200
Subject: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTklEp1SHYK/tMVtAdeEzitep6eKN1Y6AdIHB
 LoWq/Im6c2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JQAKCRCLPIo+Aiko
 1cY2B/40cnEI4ve3wwu1Wagkpys/40BP9/mRGmvECJ5e8NzY/zJbTTs056nLWUZucUp46/iR/rq
 P+uxvSlrco8sSUpBs6ISCCOLr/zlehSBPF8fCqGoqYkhHocPWLQTr0ehoFMoSYFuA9yjSH4CVmt
 RGt2zvMVVRP3RAyIYIFR6IC+AloYguHbJW/cQmWlEkR4fMu2pR9PGE36lAy5SrkiBdkmUALZX5M
 vVn6Q4b/rccXinbFXw6uitoHmgvgMiB98dVXMi7o4qJIwOU9lQr2DBFMYqrdUrm4muxc1hekb2d
 RrI9c3epVoS0yCug5/7yr04tASuHkv2hivQJI8AV7gFDRwT+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QMBlhwLL c=1 sm=1 tr=0 ts=69893933 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4UZltQTtXyTuHeZZ3HQ5OGPLFaUn05RG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfXyMwClzXQssOB
 yxuX2IvuIRSQVSX0geccRZajqgXhBdvUK/CAELaGTbfjEvHYQvcQpmBuq73pD9xDHVm8++lYkI3
 JjyLQig19bHrBJGLtVsqU0SSLm9+LAogoeweDhg68ABhgrRJW5USAbzL9Ij1Ws6Wy5XnfLsSYie
 ckBLilCkin2N7rZskKIc27O9jh4ivul8pNEZqH0Vch1cySwSqel7YPQj2A7OBCM5CVvqJpJeRJx
 UPhRMD6vhgOc4VjPqJGkuhMsIW5d/qZ0RWv88O29hqfIJC3qWsdM0glF7wKKD6D6kSLPE+nY0uM
 c584BUwZG4wVmclx2EdgEuxNl0c3cu2DXu/w6SAPlzfWvF8uuvoj48ScXIV8HXI7paRb3xQ+S3m
 69FK8h0cYm9Ph5B8zVvfQuSnAUC9HJgq6Z8NnAnoTs8xsrbY9O4pRwgy8RIRT6lcggx0ImbF40s
 EEnEnyh/McWBh0t7opw==
X-Proofpoint-ORIG-GUID: 4UZltQTtXyTuHeZZ3HQ5OGPLFaUn05RG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090011

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL is powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibility with the
existing DTs, which define only the MX domain.

Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
 drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..aa71f7f53ee3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 
 static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 
-static const char * const sm8250_opp_pd_table[] = { "mx" };
+static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
 
 static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_AXI_CLK,  "iface"        },
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7b612ad37e4f..74ec81e3d622 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
 		return ret;
 
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
+		iris_opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
+						 &core->opp_pmdomain_tbl);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3

