Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014241;
	b=hQ6ufOEaUJ50Ofr+iJvGTAQUhjTVN5Lyzm6QIRvfP3DZ3mxoV8dmQjuoYzsKrouS6DCa
	 zGpMRh7IyoJKjI9J/NVj8/v8QvGAsDAsmHwPQBzUqJ6RrXt+jZfOxCHSvxoKL+a8Pqnl+
	 vWjRVFovP4Fzma2Yrmyh9tm8RdPJTghXHHZSIpKDmNpScqc0s+skrO+6DcOQtic+jmOLi
	 jf8ikFd4LCBN9M1ienHaOpaddvC0BbJGbf9VbBzRM6EGLymC3IDNyWPfK/UEqeigoWKAD
	 F9t5QLcV29zkcoihmOOAdlvK0mfSfC7wKvXLV/kQqda5NcDEcgWkyzyYzrGn7xhxBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=5NpTD0/WM/lKqAhy81lXb7ZMKxYlG2iXedNrqMJo0OuVd/Hk9sKpl1pOaXyhJRT/L3kl
	 Aqbe1rjGoYZkAeol7RtQaoWI/QkX+pnhfpZDFM3Dk0U7EJ3Y8AoqUh/nLVorovMXJ5qHw
	 AY4aHTJQZDSuD6/zluRo5kruyeSsbzExWrWsZzpobv7wH1qLiZMNLAX9Npm5MwZ3hVXay
	 g2xWqCbfccudSXBEFcjgkJ3rHXBqP2LnvVEMzKliyStvwvH10QiIM2Yy9bIiIEn4SgD9z
	 1II00s51UTOZMDulwgX7kcJKGaq8SNwzwyqRrfM5y7kBwokeNSnq6gHunRi8PCk6CmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Er5q/cEM";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6760A2618
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE6760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er5q/cEM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspIL4131387
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=kBVrqT7Do5kCKYQp
	Xr+mV8eG5A3PRn+t4jCykyOpI0aLy4kRLbT0eqYs5BGCTiFp0xi3RPAbywuU16Ec
	2GnRgzxKf2FQmmuMnzcza3axbUK9txw3KndVGyWSmvpoZ/eieS3gVwNhMeMTHlsx
	QiuJB7g2a8wqCqxuIiaKb+eclt7TDVPZYpEwkJv9CqrxNAzLh15CtS+X1kFcWmjt
	F1wlTRFtS0TQ/ejC14KuhLzbQNBnhaC0nBKuXBANScduph/+ABnNR8+2IOfBWJCQ
	A4Cosar1pPM5lxpHB78mEY9dHyg+/VN4ISyIyYZBd0aV+9T429kVr349GayZhym6
	LzHW2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q07ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd8b7226694so1305587a12.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014240; x=1793619040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=Er5q/cEMyrgqm5X0qomciiFvgj3JIJgsNldZiROfmYERMz2EhXuggcT4AXyFNRcLIC
         dwYG7nnS8U6GoNfejUUt75C+ZYd8FqKFG+F3Dky2OFP2C62C3z4eRU9D05BanlveX8Vr
         Kj4z1pFLHjKmwwZHNTw+TCyuhAdOEBwNsUuuwr+XoPfcyPWZbP+XzCLbrpLMsNvhofPu
         YAkNq+dLBXGYepBe9xWmS7laMiyxBcZ54bMg2Ugh2Wj1reGmZYb9oYNjWwTSIb6eOGw2
         6uUjrYrmgmME+kHJeGN4pyfazRvFyxHJu2v6nlnRIJR1iyzXLXrjBC/mIZcyiIfENf/l
         lhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014240; x=1793619040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=YUTALarpHhQyifNiHVYnp+M8YHRSrbiAb08FNbD9i06SbFVWo4Vb0OYMJu6d8JRAlj
         YlzQnXk/1MrNOQ4ZNZ+69//x0l8+eCOUOAEIWu33UqwvWyjoeVLlfRWZG0QOI2mB8pSb
         sJ63Hzki9AWFfsjfaW5hSXOFgRXjc/LwBjjLp1eR9LVpSEI36Y69+EisWVR5G0L1Cr6m
         /fIT0ZRUZv1mD2qq6GixSVxYeFAOGwCuX8sosjbGqJ/aLtxasnhEbEPujxZkKeLf3ooG
         fVVlgqq4k6ivyBmX9plH05K+2gbeyI94smC4rIuksp3IjkRpi2fig1EIz5Q5DfoEX1Jh
         N2Ww==
X-Forwarded-Encrypted: i=1; AKwUvByqljnagmG3PzQ4V9DhrmgJgzqbjvbE58bTbSUZ72z9K3v/py0tzoNj+8kONZFuKGF3DUWHzr95E6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNMYwLgsNC6ZB8PCUq86vPu9JDDttqWz/3GEDLKW27mwX7HjWH
	hUn8xCHGcTSxOh0jB7ChztYlMTozS2iko0kpPPjVnmNKJl8ITyEnrc4wXsqrvyuxA2pmJJrwigc
	XnWT+6z9YxAGnKU1MjmMAU9lyDjTMM5/75McKVISUSAvThuJCfl0E8H7DXFlKIBo=
X-Gm-Gg: AYBFou3bCVzcRz1p8v94i2Ty+0EFkVQRpCWmcwK+zYgCQHoqLHmwARD996C6507Z0RI
	z/2mf4gsfCNSiqqe70ru5ZsMjxOYIg9ZUKwvdiv4tzKE68Boc+LvRmVx3e9R9VzZCOnRfeE8x4R
	YL2UpRPWNBf07ll8OllGkv9R+0+B3qj7PdLZyKwUppXmyuY7ZusScxATmJB01EeiMg8qzixSCnE
	FbFU4b5HP5wzDMeIHj6slVU2IXrBYAej6um/DwVMrtxIPIrTZML3GIh0I8sP19LyWIHy1lYIHzp
	hcB1dlgsBof120nlN6i6IQ/nQHnSys1qnSqtmG+nYlmG5K1QOAXsQ5niEg73FUuf42sLcVA0a7g
	15scQYTfANZjkOMt7VmQ9jvw=
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970108a91.48.1793014239278;
        Mon, 26 Oct 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970084a91.48.1793014238806;
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:33 +0530
Subject: [PATCH v2 07/12] pinctrl: qcom: sc7280: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-7-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3NgMv4KLIOvs
 O9OLAXhQpzcU9CnRsmSqjDjKOwWqTdZpTgaFjxSjvkgyJiJr23nKKduGUn4Y3kxzuR4DT29ZXBh
 Ujl2CLCEt2d8kemZvq3vFvIekfEuSf4=
X-Proofpoint-ORIG-GUID: 7sOQhymseLtKRSEhkTv0Q-dTGA-HBo-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXyXwpgUxUO49i
 7oW9FHn7ukYDI1vllUWkIon1/J3zHw+EGS99aFJcDSHvH2gf849qqaWJFieyNrRGBLTmEpwFTm9
 OdRBVObMfVg+M4ACLzPAHdIZ2aIoE+aBqBICTUfF9EMEqEve7pBsEU44CWOrz8zq/uT49B24aRa
 avEkydK9RCnHFVIOhFwGqEhpwpItpZ1wyqdNzaVZjH5DgYf/0TT2S3oFWu6WfHdDxVA7WnBxyNU
 R+Cwj8Iqgrl191fewRMml1Up520B//gCkd99IovIalJNW97N5prg7bslE63HaQKfYKRI3pg2EyC
 UqDXhef9X6jt7n+sTGE+od4n5frEixGqGFzmAmJ9rLQfavk8PnDFCGxGatfKmPyxolBqvvuC/nI
 hVWI4GmSTqZDvL9T2E7idCZ0k97pRXm2lgYhOrZlylQ8IQFUx1rOx6uDCBQ5/JkwlAKh7O9vRkK
 oQUDOHln8lN6M5E/Rgg==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf39e0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 7sOQhymseLtKRSEhkTv0Q-dTGA-HBo-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio60 of SC7280. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

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

