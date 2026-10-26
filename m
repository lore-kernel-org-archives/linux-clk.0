Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014234;
	b=ZZls9ESkAUy1cJ+Qu/w1waRvkCKDa0Bma9zLse2iRlmKKZrsfJB5TUdSt9iCdQ7FJtsU
	 6Gwx6iclky4zdfHa9PyGlZtrDmCbqyHgB3jdguhoV3dlp604sY5e0COO2j6IBkP9XHNl6
	 4o124NLjc7UOJxDiV/WcptsMmyn8rQfQYUGpXJc3rgyX4GsOi9yKk6DehwC8rrceYVB/F
	 Y/gZNCOH59zjxrHcf4qNAFiBHQD7hykaOhLUfHBSyW+/4BAdudMSSgAh83OO3u0LBBbHc
	 NgCHV6BTrJ17slriKaMWX95N5p1jM1qAfdgNDEfTTrqvL82j2aoYObYIaStPs2x2GGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
	b=BhZ1c5dQoM/jOe1EtVmRfT0ZszwV4r6MxE/VKKwLh8Rc7iZt61j2dfVy4YzcPZ6TfbcI
	 14bwUecHpgB2qgN5OGaMOsDb0ALhUP+B8MZUayyJDbgSx9FHBdKdJe7TLpNDekf1XzNyc
	 km3f+nnSjAd4d/ZC1UvikdU+CJ/idTbXNPWp+D5uHZJwLEivofB+0GZybdDNttVii+LfN
	 fcjsWQGTR6Y7dzCr1xYTrvtMn65PPmzbH0mKGH3pzKMunLlyE/ZTV5SQzj/l2EW5plQZs
	 Bao9MiCyT/vWC3H44lReDnrcwhk0x7oYmgvfvOmgfbtLR7CbQZnHrTq2FX5NwIzaOcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EO+mXk5L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMMY87jC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53C560A262C
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53C560A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EO+mXk5L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMMY87jC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIqN3085615
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=; b=EO+mXk5Lz5FLLXjX
	HVQdlKor98Xebdy9/kOV6qz8DgTUBXZmn4uDnosnBovS/QGTQDn7+01mQrUwMYVU
	nt4yRXVLhs44W2ekxGeFWV3ovCC5OFKmdrCpbNgvXJDPzijk9YuE2FBL9B6HJLMN
	jEKLANIe9K35jVivIBkodPUYAZMJE3PfNkE5lH5LWSv+mDa5iaGOSC8euIKMlsDo
	08wnXCgypjjHy4p9Tg6jocXM9ncIUOMsw1oh80v4rOPyq8rRqlcYnu1We39dMa79
	XOQUxBYs2LOE8V4McV0PNIpyy0SYvMlGxNMHtlkVtUsDiEiKrer9jwX/qo9XSrD2
	3vFkGw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2749771a91.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014232; x=1793619032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=eMMY87jCrNtgkM3/WaR4sxm1TzM1UnWyPzRmMj6CSelRF3vZkGehBCohBpXEjFF8Sv
         YSd3wpXjXyYv3tVyS67w1DQ/k+Tjb51tbWVXIoz0dV5NMRgntxvXJWuvRVW+4gLjLcD5
         JW9P8h9Hd/FFC1qB2a8P4/2RFlSRGjz6MWU5nqFWsjrrIiXRvlXr8kbG3gyKV4sTx2km
         UNsOsOqQvGQxcR8W2ZTwkAddT24jY7DZRB9Mzbxr93P8xXLp04x3dS4jCrv7NMeEs9L1
         gWsWUqXNGOvqy6dW2Kpokth9L1TpNfmDXLxdZRU9uXHzGUjw9DdfzmswGL8qbQ3sUQJR
         ZiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014232; x=1793619032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=MRrWfXLYHtiWkDA9Cur+O4+XEpKKPwmmHMWDOUckELGaXtagrMJ1nxkflMNdxg6lFd
         pP/r2AHugh1zfLXleX/Ys9LXTOnPbbOxZ7dRjnSnwc95niqjF5GAps0s4jUZge4h7iG3
         COAjrs1TuKPAKeBx9Cm3XHrv2yFN0BuiWIWjj5iZYMRu4C7aDGj+wQk913XG3+4iHDh4
         eqNCDr2p9QQ/y4QTvMN056yIMZgjM/I5jM8ye1KDI/+Aynog/qRnc3nGwxnr+0VqzJXt
         vVEFpD5ot+6Md8dXqrK0602FjqOCWtOeCMdIWWHAIrMbj+O/CgiUE9hFPipAphbEloAU
         DJuQ==
X-Forwarded-Encrypted: i=1; AKwUvByQDczExPVCbeRJRjc1Kwoh9eJ4urO35Y8G2cbY9iuNZ1KrZjlsoB94NOJLOuXMh4/zfCV54I8pDTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo6pmHh1YWYlxMztzUhGtJwkBNhjF8rJcCmw1c5mIFTpoS00bc
	zKoIrwr/YcHJ1InQoKWMzg1ibWSeOKcDyHwj4hZhSvv+9rKSUPzpFfOqgWGCRstqPpZv8w9AjQ/
	HVuN9MHqiPeizqMiUlLgdT+SAzycXUzfU+xowzivekV1ShIti/VG3763v7+B8mUQ=
X-Gm-Gg: AYBFou1kgB6PlcpWj1SqNt5kjAx+NMcICfwfkFwlVlvonDV+7XUEFh7j6ZNavh4M4pM
	QqHy/w1LPXpC9mE1nvLL+udfufkZvzOif4MIfgmCePVrsPVD17crjXXhIeSWymy1l8XsUXtPieD
	NVaE3Ck1+BDDE+fWNZMim4DYCeoEzHMyXMpBErBdc5E+QMOuVtmQbegCl576fE4wQu+OpRXB1CH
	jBd55kk0ehW+YzW8fnW1cMkhmR11CrvKBh9jgeD4JrUe3a/dSRioYFkaTol4PihadFDH+jZWf8N
	ma4MUlsRfM5dCLhdvHU6MWhEuYnjgsALkdDRM8KkmCqwjtUuVFXp0Ro5qDss3LgavcXR+aI1l8K
	74UykSLaroGbqGK6CCM9E6BY=
X-Received: by 2002:a17:90b:2686:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3adead2e19dmr5437996a91.35.1793014232112;
        Mon, 26 Oct 2026 04:30:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2686:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3adead2e19dmr5437971a91.35.1793014231659;
        Mon, 26 Oct 2026 04:30:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:32 +0530
Subject: [PATCH v2 06/12] pinctrl: qcom: sa8775p: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-6-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9c2l8fA0Jt6C8UWHAzO9aBxpFE2KaPGm
X-Proofpoint-ORIG-GUID: 9c2l8fA0Jt6C8UWHAzO9aBxpFE2KaPGm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2ee2AMaIJSCB
 Idu8YfYgIPo23EqRrmjYOxIxIZ6v5aRvmnA3X7xXg6tp6KtA2dh60x3Qlz79zH70zZ6SZpFqugt
 bb/ZsulXIQIPsLVfI/jAMK2F9uoEyMI=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxrh7R/AMGoe2
 ngH87GO4u/TCOLV/0BBfAWKbBWaGTT9bKG9MDFZ6l3dIcSomZ1D8dQ2n+Bq0g9aZevd3cpIsEvT
 rI/EPhajvnYDr24dmVGplW8yy2UzuSE6/c88OsrZNfUm5xfTQb6jdbGiGkX6EUIbHLeh3YFJ2xw
 +Jv3lcCIzxvCUuX4/iGrXGRvZxaULd8jJFmbQmOkBcNjs1WP89PaOp2lQSwqm0XGj56E28gs5Kx
 b3s2SQyGzPf81hWg8SASlRQMpiaUWMmhYo023nsCU35Rd7GHGya5XfJZo2sK2uZBdYLHh/kywk5
 V6A4+PMlO9VutOkYGe245ml/v9IsVuXrFDW+sJ9vQS7Q6ZJG6kWJJHc+dMO772fRdQJsG+6Yw8C
 tW8yeJUDY2zQOYhb0F2oKrjFVdQyNtA9MARpClRuHuaTOFkz40HvSeyQo4EwqwerbE0CdJUaC+2
 V039lpfC8znOaVu9kqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio35 of SA8775P. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5dbaa50cbff008a2605876eb329496d305735700..d299f47a0bd4ab1a0cd0e553ba50f9ec1e035686 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -480,6 +480,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -828,6 +829,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1230,6 +1235,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1361,7 +1367,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),

-- 
2.34.1

