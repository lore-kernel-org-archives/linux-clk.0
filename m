Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64035A92D
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880839; cv=none; b=CzCpM+CaMF/P64MmdkwX9BjTCTpSKktGw+WoZ4JdMoOdvi1wuRNIL/CiN5AjbOiT2guizLAbrRzOnvIi4S3GrWwg2U/IRkyxcD+ePbXKIPUoCdxf0uVi5rwEVc0jQMhsWDwaB3pZRMnteUACZp2P/Uw8lRQO7cUI/FO3sd3xKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880839; c=relaxed/simple;
	bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jz6rfi1bNq+QWOVz2eGHtnDz1sWKwDl4aB+MMVL1spjk/BsvtCzxFUm5SBNE+wZvDSLPWS6C3nyIOe/AczWrhaGg8FafC6Xftm4vU93gPCrQd4i4qeipJ6gml11ItkpT79RWEsnhSIhPs6WsD+2Iiy2KsVWSb8RIer76uz0gE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2XtvVoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFGeuDdp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2XtvVoV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFGeuDdp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VBWm3t1220891
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=; b=N2XtvVoVvKtMGc7i
	P+w7xdZ33E3C/9tG02ncwqqO54NVvgQpQmcKtFt0hUXOcDShut4s7P9ZMNPhlaLK
	A4Z/QUg8u3lZHzvx8XVtW9kSWCmlPO55KLARzGvNwP59xNccnvJmnjC07kmKMLRN
	TE2sWwL+t1GtqWpYfOwCKytBcFtqChpOyvW62uTsr/bOzyZS0zhEZN6pUgMVadeu
	gOIOpw24yULbwloHhzGvklAtmh9yOL53fsc/ChsSegHhfd7If4o0PrvNSO1I/UaX
	Bcp9lK2v+/lxLuwVjK+utr6dN/4l9M+c/2r1ZwDLaorteBnJ4jvgI9NdQakeE0Kr
	NMYl+w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awns683-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f648b3f60so11408279241.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880835; x=1770485635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=cFGeuDdppsrreMYF9r8GKZfiZjZmpwNrUxQ8Tme8X+TjCD1NJq6Zx/pyUZx6zYbwoi
         WRytFZE61saLHLs/HSpzrUgnV5fqThGUuy46dIhY1/Qn/LoZ1qOoxuw3oHDN6ddJ892K
         b6YDlCPjrKQEvz6B+yXWRjtMMXpoHEg0k7+l+1CFv4qGYoYn+8fV7HIzmxjuZFRtKwl6
         gv5lzTjhQDGAQtYWM0zmDA/3DrfLURSK52V3IIqO3D8giSr3gafjl+2WBOU2zvdSNz+H
         Ke3QNmhIOw2NxCF+jVNoAZu+b/Az2X5Dlv5f2TAM5l+YHD5lPnb4+INwzM6X095IkafX
         0f/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880835; x=1770485635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=H1GBK9Kfl7IvPPFywBpuRwJIb9RYHjgSWZCSUa0etm87wWIlXO7aA+qzydTL7s2SF/
         C9PAwG3ohgvo51UjN0F26TB1+trnP3XX5/Xuf/V5/pLGBvyRs7Ys+WLpVH2B9ugiceKn
         SELPOLewKmoM79t83He8PlqPpbM7q6YS2OULdgs1Nc4A4VL9f7nOCmeop5m9jyGN4nlc
         yxMwS8fcZyKjPRV4kFiq72+321F22hidP3x7Ns0revUH8EhcT/7BdbZ1k5CofY8/LxKl
         9CSuiP1IzwGq+Dd9mZzSM2jpsGUOutoucjEImQivT/x3ptcNSK1t3dGnHUfzINXq0vwc
         0LMg==
X-Forwarded-Encrypted: i=1; AJvYcCVHnpQcAE/UNIlVnWS20YtkmjwzpwgQ6cJD58j3y6J5F263OysRKrSH0YVtwaJJRt8umN5lk2/Me3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMnaQHzGatHiVGsoaLg6z8A3egLFssy6ECCrSeC25BwMI47bS
	d6253TvGNc5gy83U6QZFmqAsMoEm/W9pcbeCww94wB1JOvVywYUoDP6chW0XkM4SfqK2+jNCs5+
	2Rana+kpH+S+vqjF9liTcsw++63UKnb417GvYAV58ee4RgIOlxIoWepADFiniTAE=
X-Gm-Gg: AZuq6aLpYYRATToQmVm2TxJFsGf8MRNiyizeUCnLphMhpFxtLaLPNYURHr7UP9GDRKU
	yAGgU8s/1gBxuRe/iIrpIyxw/XMtN2eITgxgij0uELAbvM2NQZ3+bGgFITaR2oQ/KlxdQ9Ur9XY
	JXGn1xUN6xlACUoFjFijvAjqN3jy2ckQsKj8asSwg4B4HeP18hHRMMKE1OfJKO3In+Z9yHGsDnm
	WnhJ6Se37XL0+5R+2aZ3X/iW+2O+uBEhMELs5Z2+rRQpqZSi1mSJQ3y355ts3t4G7AA4ien8d1q
	Vb0n/TNCGYBcf5vcGISPXDia6E5yV5OrpUgHLwhRA7wIwqqc7a6FSNYKPTHMdaJu9v3xuXxgQ/Q
	Bs6yB/IZu0PTikHSG+G1gDJTf6ByIFbxuECcoKni1p2R12jSaCmaIr3b3aVOEsgbiZGJLSaDxkA
	UYaOoRAoFogKPzhFjarYVv278=
X-Received: by 2002:a05:6102:2ac8:b0:5f5:259b:66e1 with SMTP id ada2fe7eead31-5f8cdaa2fc8mr3722614137.3.1769880835588;
        Sat, 31 Jan 2026 09:33:55 -0800 (PST)
X-Received: by 2002:a05:6102:2ac8:b0:5f5:259b:66e1 with SMTP id ada2fe7eead31-5f8cdaa2fc8mr3722605137.3.1769880835147;
        Sat, 31 Jan 2026 09:33:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:44 +0200
Subject: [PATCH 2/8] pmdomain: de-constify fields struct
 dev_pm_domain_attach_data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-2-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+kozKhJSLZXFwUNSKEuTT/hOBSPTm33d2S
 Fku3cGVJ2yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1SpGB/9+OyNZPfI4xAgU5372SEe75MiUrRaQNOjN0AV5lSPjuhkv/F97SIkLrKe8KRSJ77F3TWp
 yUIsOB246en8dBzWgeqSlUgVLg7y76H0oxGP7eqDshW+4kh1jHNvKO1L0YjmQEFmrQ4wf6/cmd3
 RhACkaf71ELUYZ0TmC/Ih8eYIIPtK5COv5vzeJriXSCeYbv0r5VEWzitnpVAX+KZ+nSoVOE6CUE
 p8WgyOflHMMlVQ/hrB9V7zi/Xg2jHwon/CWcrUcjK+spP8lxHKJJv/7nWpSEPNO9xQX7S/4N126
 SVOpQqQ+4SeQC97WJE0WQNMg2w1RMk99rJ/NoMCo+1i11Xsy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697e3d04 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0MtQHd9Mo8yxAPGUVWwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: OLS2T0nDNLCDxcCtRyOPr_bDPLWzwywy
X-Proofpoint-ORIG-GUID: OLS2T0nDNLCDxcCtRyOPr_bDPLWzwywy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX304VxH9W/E5Q
 IJOye6dfLrf5Zz01bUEB70Wm49f3crGNZZkSynu9hHLFqtNSOqw5zsm+JwiOeUtIAnqx9WKu4tt
 1v12FTcujzB2O/JA79hkv1VA9Rk/rO+jTtr/czvM+RSHt5RFort1dYk0omkF9aGwbfzr9+ktX0H
 fuU5HurZbr/nlQOT77VBjHrDKZHdrhyKpjDw6hdyCcn/mMRuJfVJnk0YtoWX7MqvkbfNdMubsAj
 sEP3hO3hZOLMcl0+Gu5Yl1dilSU8WoaDueXr6IZXF/SXLXcqVHTV3hznucLEwxDWWERsoqYrgl1
 peObiPPEOjWgO5aYBZIfRrt/gp5LPxpGGJsGmsFsjUtG13efyMn4+4TDRAucWUI+O2khPqqbZqW
 f6SVGX8qAyaoWPAONIQD3pBQ2r28RwjkOPAjOtJKsu2uZtXFMxIb+QAFOAMihiBQfHkPTvAa47b
 pAlUpPR3e8Ku85ITy0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310147

It doesn't really make sense to keep u32 fields to be marked as const.
Having the const fields prevents their modification in the driver.
Instead the whole struct can be defined as const (if it is constant).

Fixes: 161e16a5e50a ("PM: domains: Add helper functions to attach/detach multiple PM domains")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/pm_domain.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f6f6d494f728..b299dc0128d6 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -49,8 +49,8 @@
 
 struct dev_pm_domain_attach_data {
 	const char * const *pd_names;
-	const u32 num_pd_names;
-	const u32 pd_flags;
+	u32 num_pd_names;
+	u32 pd_flags;
 };
 
 struct dev_pm_domain_list {

-- 
2.47.3

