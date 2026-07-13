Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97D43B4B5
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954468; cv=none; b=jJUrCmnBdU646VtTJSe9T7PXdgEzyoWPJG0DASjFNddNn+8A4mBsq2QZMw9LVOxMcL25Y6VIdQCNLcfLgNC9360aduwjxIKCx31tHf4N/Pl3H/lrjmKXeZf1dAQQtVZbUJWZawgm+oCw40tb9I2LC2LVo5gr6P1v28OMdWVDa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954468; c=relaxed/simple;
	bh=H2fkpda4QTDXLjTbUXq9Hwo6C3IDYqfckLGQqzPvBUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R42YrWqQWCn1IoAump9iDxjP/XchYVGSznPdkDgChpGcrbTKylzNhO4kJcPlzzv7Ko2/R9Bnnk8mqH7wrAZMRvrMwyZV88eqCf4t+k9f5wsEEu6p3t1Sn1+Ac/eFeyRrHRc/z9PZcLpy6qEYuu7ZnOJ0zy+VKAD505q5mzAQaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHHUK5eS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPfBPxUg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHHUK5eS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPfBPxUg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDeK81299381
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=VHHUK5eSgjv53HjU
	FauSiO0Uf2cBnKOfqOfwfHQgCnafmqrF4uslpK1sB7OhyIESBcobZ2TeAYfx4l/t
	VKa5r2k6o4vYHbSl5ziExVOXRHvD6Viij7dJF/3hvBSwWhMG6XkMssmi06inMcLS
	fLP7q2SJNzh9ztW0GdAS1529q+/vLa+SiNHrQsfEjCfZBRMGAjZrXF/J+Urpb2ET
	j+6Ak22NMK7B4LGwcoQ3SEWZ46UkztdrQpbVWVETHXGP8u8DKvhgBRMALQZKnY3t
	HZSoVs3veJny0VL+sdYpUNH8b2SBGaFlFgdSlAJTsYacM/aCpIEXCyBAKL/hTp36
	hmqiXw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3h77v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:54:19 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a17dafd042so3719207eaf.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954459; x=1784559259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=LPfBPxUgMyES6rQfPiIwrFatQK2CR+t7aMW3DkBE416G0CaiMoCNcImp7jAwUEUrT9
         dJJaS0RvvdMe6ShLrWfmogU199VgVVFU2RFJJZblCE7BZhYUWh0O3vNGIk4X9UQDHejj
         j5vzhTzTuw0nUBZ1cQMKB0vCQVa6igx0Xm9gm+Z9peq9PtFZFppdeXMl7coK7JVU71rp
         njcb4JZUKHTXbQClCOuyV7NK91BpzCwdmLDolQD/cfXWNGO01XrniE4K8VACpfRb0r4K
         ZvxptGXkz3e6ANGVenWohbEz/5JpDtzuSA8T7nByJGWvh/AngOQb1HYYNQnlVSkC0DCs
         0CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954459; x=1784559259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=GJptuuIr70fMwZfFxde9Mv78d9p+/dltCck3OAHi2Yx86wPMvlzRbR7qVq1JVIYqjG
         n93yJsic8H00FK5nm5mKdDA0xIWY6/VKGl3MD6xIM1eoJteg+aRjonvlJoSFytmO8cZR
         5QKPYhtyCZ+3SwN+xwL2FJVY3vORTtXWmgkKKey8KohfKR+LKvpbo3gsIH2xUly93iq8
         RysTTipWfktWTXp1F9U1ku4vGHPidwfe90z58i6urHyirMoFtAk/22Dwga8MZYkF2LK/
         sphSLs71AoFdiw5DEqN5P5BQpMICLF+nlCaCAcK5vEq5yF48Xbi3vMjnS1uDfd6Ro7CY
         wLjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G8TLqbBaGZy7KIoc8SNEyaasPVp4oj/1q3A9KDWFwGW4uW+NlYND0HHicpYMg0l7wpRAmE4IOpTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JhfLfHqgbsBSIf3NqJpP69yXbE+iT9xywBileP98Xvp9uMrz
	2Z74p8JRaMFr4iDTDUwURdNSIviBPcoHls4/WQUYuZdtmT6JSPqVAPzYE85HP8AXU+1sVRnOqDR
	L/M6+4Ayh7WsIppbQ1H9GOXG7tMovHdbfdiajGmMIoOOfr1abgUFydSC6yL+gHRE=
X-Gm-Gg: AfdE7cneDaxilpi5mxmeLLYogd0cJ8/idFR4woj1UVtk6xIJYVKkisKvpnq7mais7/H
	iwRhH+n7gFHTxwlmQe/SFpOPKGxYNRjmMiBMmdJ0H4V1CxxUFaNwVnQ9FUs2AVn0q9DEmeF/MdS
	zVU5AQIxuVkf9r8OYYmm6jIsXaKZ7cnBJLKmtZXFo6Sefvj0Cwmx/FqJHsdjZmWZUd7zFLXnZ5Q
	qhd38IWacoCNzvVbHR3BYR6URUxu0i+MYc+WkTdNrVo7LxSErUYINzsY6hwYjluVklquuimcvxp
	WbFayXJhwcdwMumqmPToymIho4JS2lzjkIv4FmJUNvxYNUvBGcwwOQqP5PN85E7racUaNt8oGFM
	ppaIrXTlALnpIQ7rcBoFwrYxa8iUm1ldYIPk=
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633441eaf.58.1783954459172;
        Mon, 13 Jul 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:a05:6820:a08:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a39a8348e6mr5633426eaf.58.1783954458738;
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:41 +0530
Subject: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: -K9oo6CDeKcrawWoJg059OXD4Y5FgecP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXw2xFoiBJuPYS
 Lt0P86EbeqPDZoxslWItXbPzpzqsvrOLxexE50f25Q/waaPeYmzT41ssWZb3ERgpe/AE5ct0ubb
 wY59xVpYK3MynJSXSVXrYWSeq/IrtCk=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54fc1b cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX461Er0mlwXqm
 xxFCFR+T7r7GgNhYxFi5oVFAdjdXfHpKPJhpjJIGgUCNZowwYx6Q8/Q+13EyKRi+0F//NJdpAQk
 whgGy93y4De1dw8QeyIJgvA6r3DZTMFGZ3M1HOfz/ASXAta5iYQAUeGGGkyotNLbf94ufRuQVTG
 aDXOTM3poiZOxU0KTjoWUpKkNRy4j8KL99HnWFiu6rgBrhsNjxd79gDR1qcaBShcVxDYeWFJN/7
 yCcrSIwo+XcP3JDjjkBzzlz2XjV75vpeUy8PVp5PZ9bYgLoHXFFM/r3lxG7zNldLwHnQzHQRKE1
 E7pWPErGw1rMrWHe83TJgrM9NwJ9waRQHWO0mjux2cU5F91oMUPnASCBw4wzuYcm2HaqparlKFn
 F9dqFbOBB7QlwARkjXnKr9IGSpEKBw0m7n85Oy/tQA4M3jZiAl1T7cDDDcpBXD1aC8dH1A37nvd
 Y7rNlahuHYEGYM7m3LQ==
X-Proofpoint-GUID: -K9oo6CDeKcrawWoJg059OXD4Y5FgecP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

