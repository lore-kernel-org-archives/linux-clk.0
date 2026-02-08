Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0359387353
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 23:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594945; cv=none; b=rVin9HZdXNkjhR5f3KgM/ZpURpSYz76ACp7aqRG1oZZMPLwx/4Y3NRmDgtymeRZ0rTQU2kfCwVXG+fnQyjXAono4es1JSe4G7qDqQ8cLoQcE+WoZFIG6tOdWuMsUXfea0akGMqMUeNbek722XFsiWaNlvYdO/e3XxmWdP8FAMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594945; c=relaxed/simple;
	bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFgxwoqPT7GqZdBdJQx/5pVi+j2yHlE6ypc1D7oiq6wm2greBuDe8t9EOWiEOWqeJ/Bvmu4tutm7gK0aprmxQfivk+fYq+844H5o3IPMKgn/VaL3okUEsoraCT/t/OrwKsvMXDzK02qdtvJGKTYkehQWjd3VsUtsRNvo/QgKPuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh4O9ZGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2bfcsYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh4O9ZGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2bfcsYe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618MGDEt2970480
	for <linux-clk@vger.kernel.org>; Sun, 8 Feb 2026 23:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=; b=Xh4O9ZGChasx2CjC
	0RYOzst6y3P7Km1mhTbVgbQRJD6DTErQ62rwQHRHq1w0vRr2D9vQihIs4eeaNRI6
	GEtYka3jY63BcIuXajeVuQW5XhXE7BZ9AjLuJKrrZVA8CFk9Ljmqg9ii9q4Fd8Ll
	wYrfjFw37gdTmd5TnsLwMMg83CmC/U8dpu6YoOqjqn7PNG4qDXMGob2zhJtW2Jhm
	AyrR52KqHb2KTUzlCdE3UyW7lk6XkG2gQv+ta7HqxzP9R3OZ0kQhhlpd+f4vETB3
	WRmXnixlKDshxmpNPJgxHzfkZvwCMY3b9UMyr1s5g4IUyUgFAyI+jPKzPHyPjLMU
	1W42kA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g659ekk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 23:55:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so1461229985a.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594943; x=1771199743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=c2bfcsYe3j1WgzG4zwjClNrvuOF14s2GD+s1XuzVRp+kcm/LcaeN6uwyBTMkPVZhOB
         +i3VW3o2pAiHvEe0NglVFrHPk3d0n8pPUhV57tDzaL8eAvHU9qDB7O+hcOcuBsWdrxM9
         JuUzowzQWYsOXIUZU8mE7Cn4fALFlRPNK2Bc4a/DuGO0FU66Nt99ch41yCEALOBqVtln
         7pGumqe6/3sZ9hWxTQAWl568rX0PGS4TdH1LI8vFTuhyilLAYN7Lk4p6+u1ZXiJquerF
         ixR4mksHJETjz7LBYaEMktgX7aRBElyfTUbHoFBFn7jyR0Qn8lSzQ3byj2BQEJ6VgAj2
         D9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594943; x=1771199743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=ifENC7D+9IYlQTx2PXajQES+D6taxMOSMO8Lg+AvJKKQkGzKrPlHeW1rQXB86fV5oo
         FAJz8Tg+WZ+rPwTdlGIGrJXhj6dc4sOkLqEpd9jj5L86dbtlw8xhqSJP22CUy9f7c1D7
         JzncEn/i+mPXF31x4kE5i/lkMHOiy6j2JwtmYK9BvPtZ84XIH4huP0qPxe1Ubo/ebyue
         3uIzpq1MkHbmbvbnClO2vNhMVk8NdvnPzXywOpXN8zyRGCSVFnaGEeYvXA04/1U6S30F
         UHTX5DPwG/+QunKONZVo8u6ELfvKNjXYjxB3tWLJS62656l5lZiQor4E77Z0B0cWbGtu
         EZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBqhw3/4SEziVQE7zU4B+ginaEajdt1zMdmkITaeHfiM4VQDb5ogUSCR9v1k0a3Nm9IfkN+1IBq4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBocqoee/qsv3mO9xp+e+Pi3osvLurGu4z4baURIuydbvdUVfi
	9Li2epZfCFU6oaLyqDzDEzGb6MHgF+PgZrTAu59iwWfo0rWMD8+bYxoAjfkMdoajE/X40k+IQ+J
	KyTDz6wdNXx1HUBeGVZV/D5P+v3HfswGX0zK0PFDSX73WASjBT2J//2n4hQ0Me4Q=
X-Gm-Gg: AZuq6aKSjSvxboJyza0SrLrn7kHvT0p240JIyIPDFHwcqNTwZreDwMkJh3cvdhL+fYG
	X7+RLw/gbMeQ1fsL+MkyFO1FBLqM+61YzJWD3oGZRFAkj5kdTtF721CzlH1+Rs5qdmq8PsIl2Ta
	HJPPJsnDpn/vuCRdI0Iu7kDDFoz1/x+6kYerZrov8PsgDHYr/60GqLmMwEf1X8wgDSQ9yMUPJ0V
	dwqz1S6lnVp/joCN0SOAgj+ZPdtGvJeHHsoBdtHBAnhGMWV8oIPcK76INKqz8Awn6XgHXHbj8Cq
	4pmEx6ZEO0V6IFlBSZcfuuPcnUR57SvCau/L+1T1sFaZ5ETgM6Xw2Fsuzl8mutMyq1RrsAgCZco
	JqWW3UXfXzPTQfyTqAajsJe2xp1a+AERac5w7WvHwVZwGD/XD7C57xpWPXqWg80uIe7cJY2oolF
	k/f+WMngV7Gbn8Nh9Q239Hous=
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr1330269585a.67.1770594943208;
        Sun, 08 Feb 2026 15:55:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr1330266785a.67.1770594942807;
        Sun, 08 Feb 2026 15:55:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 01:55:36 +0200
Subject: [PATCH v4 2/5] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v4-2-9662a0471d82@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2anUpXzmn7N58fYTL98WSLiU76G8XPBCyuO6Yk2cRu43
 8u3TazsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEnmxg/6d9Q9dXSKLAq269
 j/WDSItTa6cbM3u/bzjTGT51ibEOw/bTYjH37YUyj6zwquNbat3ny7q1P8NKkV/g1wQjJjkmaUa
 psOg1d1cYK/tdM/nM9bTKQtFt+wLuN6f//v/aLsZ2RKqOPea8bMqeL9ahLvGWwcfLy754m3dveO
 lzbj37t/7mpBu+T34skan9LhjiaaDGW/Qu+cqCna9Ujkls2dx9Paj07j/WLRP+X79S8Pr6/ZOuo
 RNs5KoSHqZZsbPcsJn8UTFTyLrdN1I799fj/IaWJK5DM17fmP43R53tkdnOZ2110jMWznRXfDOD
 ZaOaeVqMq3JrYuD0Q9G2LA/XdnDy/2ufmLBpp7fGA4dcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6989227f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: U1QCWO3ZSqCLb8wDLpZdzV-FmwI_akgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNiBTYWx0ZWRfX/PA1bSYbYAui
 8XU+u0HQc5zVYaEY5Orrkt6eaYkvqEI7VlOl3PJxP5APkMOdw5e983TOBMH7H4jDJbpk1mFjwv7
 agkSiRR9i1ircGCeAK6/4rwPWjzEg7ky/FVmaKoWwkUnJPbJDPO6PegHDSfzkTgzrhcFnmCHSZM
 VeJRK/UoQyrVbP0hjGkOV548sdfo7I49PrZ9nrQqyh7qIxzFVeKOydh1iixipky4YkGAKnnr+ak
 rKKQ3vEWW6YPJX1EHpG/dlOBEq9ttcld/7PLMVIxtI5uRPw5SCMtvHiR4LQsgs04newFfR5WglE
 DjqWp44cTXaga0BOTBxPQeqVdgG7Jz5+ZLNiFhEVmBiz6i2gC2P7evjy6kbdXYQE/Mtssw4JSDo
 jOIeKE5kxG8nCfAiRp7OajzGi8DvV+AdpRwnQPZz5PLp26ZUz/BbEA50H9Wx/1o9bt5GAZxva3u
 p9Kt6D7LIoLykQLEAjg==
X-Proofpoint-GUID: U1QCWO3ZSqCLb8wDLpZdzV-FmwI_akgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080206

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

