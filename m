Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7A40B6EE
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220560; cv=none; b=iuTOWaG/Whn8E/KI/rT6RBOhnl5yxNlJqbEKjXGR7GTa8BNPoMdNoGsE4ZaljeyLPWG0Jl2FiUOvJ9m7HF+KIUOZzC+qZ4T2VQa+M0FDNJGTllOtM33b+lqMXsH+ZBavXfxzC8jb/uXNgen1TrPKHcEEKM7QK8y2ingVjeYCRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220560; c=relaxed/simple;
	bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciW3heN3EMPwOeIKO4rBAKcwvpRgO+uc/fWAr6rtXJXR9PoNBTdxZnWNZ3GxSziMXuZbxq7S2vUVxVZf5+VSeGj8r/LrLbFIjXRaXF1G8E2raR7qc4grjcX/c4ucpwPATFPGIvjySpKeVCYlnuOaCklssnQ7fJsfHwz44wTekmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgU18Si4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgAgjyOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgU18Si4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgAgjyOo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6nAUA3732396
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=; b=cgU18Si44FbuXRnF
	wX/takugC/H5vpLcGEAvhvwIK0hP0IR+NNiyAP+hmEySANRfs/Xsm2hIkcwNe5R5
	is4egN+6ZujsCwLeqReWN77hJNrDG3eFeS3Bhh8I1m2cbEt84+SEWWyA3me+tr1Y
	fTAa5EXhtFXYtemMMNWPaiDLaYrTWHOJlxzBAazYhh6Z26BF27XOK4890Eihtfb/
	/iNrBUsHoPCiBVHBzqR1XkY3iKLzjcWyvcER2PcVYO09Astk2ZgtwnVKYPiE9ad6
	W5IW2cdmtp11oLNVUtdwJGjQU9v5YMiq5gYf1tJbcjS/TyEYcJOAAhxP9nfTYo7b
	bBn26w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88rek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so288427985a.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220549; x=1787825349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=XgAgjyOodSlczgC0kJVRpNqqQa4U79JnHoa8/tChI6OnzFN+tpZYJF4J9IsGzurIp7
         Epv0H8HnSQGt9e62IVJMEnN0aj61XSQ7+OrICb7agisZDZKAMKjRgVfSrP/4kyDWpxGb
         AQPAwml44YlTgR/rDOow60QSQzGgxX/UsEPs1mcfksxxEsAkHESNAhGe7sP5WG5zubvw
         n6Ek34BZWEbEhgcU24cEAHEHLD/VSTOUZBK+61lPPjz5ssIl/w3GwVu5bWLTFPg7WObG
         TDJK7QnQFVBzxj1faXfZLbXG5K2wkCP10i6gMdQf3s1q5c3OxZHqVfAo+guw8/K+07+r
         CtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220549; x=1787825349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=dNZvtdhecNHpQwpSYmR7MOvDz3vdmpfJgoFdCntSIPIps/IQ0YkRRdL2pWUqt2LiD/
         31LlAsM1PjwO2f8NB+E56OPsJVlobNCYdH+9+tRVZHTR5aygzDZCKoSVACQM1Atr0n7/
         eRh0sWshKmvRf+Ir4F9FMDaZCnJ81/OcpYRBrpHJDqyWxgoflAlBTObbj7bXvYEjNCUB
         QbE9DbUKnPuL/L36fhgc8Ubmba/rx5wYnR+ci3PKZHewsGLC1/JjiPu4x3g62/G5R9zf
         y8U0C7Zwq7YfVoKoiQZzKhne5EaliDJmuzhmWEIuvYJizAJ9Ugut7zG1qcRJ8njziFH9
         iFNg==
X-Forwarded-Encrypted: i=1; AHgh+RrDwhf8uKvO4wtEZC8Y4+3JxHAx4m0oKhGLyfFgNmeaxP4WWI/cnouC2ssxHkuD/2Y/DpuqG1sexTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKbMqA/PAHLgq1ZVtaD73a+tFYFl+QCu9tEiQwlr4YAbHxQws
	CxnbZdtZhfecd/wonK27aTTiZB9kwVNl89wfUDUkyVRRUbbx+ztfiqGNsj9CI9hA3xfqGZff3mz
	mbb/0D6yzp9WI419F5ocNobzSsEtT6JGqC7qrEW+QEoRX48qMztPLLN6GKmUs8+g=
X-Gm-Gg: AR+sD12ZuoPx9zpDFjXkfHsva6MqxM+layRVQfM7wh/MV9ReM/b7BicCHfcEXQnJLTU
	Ukj970Ll3B2LFyf1Vdd+aAPCwhsqmhzFbeGdExwiHEpD7iaj5OX/SfwtS5u9vbmZH/FmAYejlnq
	7VVOtLEpgMphTgvd8tYlBRHOObBC2Zbwo6bvQlMOHjW5olrOnFr5dFYVjwY8eaiKnyl6hd1jr3y
	fwMmwj83bOtdTOgP5yZ9mg7RylKiwm7O74IlKGr2g/rKihyhf6j2Mt9qRo9kqv3ELv9I86mlhz8
	qN0tUC83SlcbsbOqIV5tZ5ErmGQm5fkF73KaqWIL4KTkYolJTs3gwzofXEMcowXGnUMW41CysYf
	6p2fidyHh
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr1114431385a.15.1787220549029;
        Thu, 20 Aug 2026 03:09:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr1114425085a.15.1787220548547;
        Thu, 20 Aug 2026 03:09:08 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:14 +0300
Subject: [PATCH v2 11/16] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-11-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIHg6P9On6BUXfl9IwgIFYp7jcFQTA7oyWha
 t3L5Suo0seJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSBwAKCRAbX0TJAJUV
 VnQSEACBkuNGeHqM4plxObBg6va0XSoChtKET7mp3KWHIih8vlts21qAbPkcvSz62MfK7BiMPKx
 JsqoqpCByQjFC7Y1HyiT6iVqlfAzfixKNYH6jNFQWAFO/4gso3uE1nyp4ExOZNSKAGp3i36gTsW
 fqWgcpQz4Ter40sVKMA+vklfvwNbzup8nH8DuO0YkDGh8QtdVjK/dOctFHToo7OLe4vjHTby8KC
 ga6ZHp+6Hfwm1be4PUJJnycTRoVlopEN6uNfwaxfuJGLXIT9t47JliQYPpI+UTij2eeCy0mP7Jp
 2R89KiWvLvcr5a3uzb33zWB4r0ic0VHZIA3on9kEcmXEXkWlt1NjWa7ahi1vK1FcWNL8HUoSTQY
 t9v6xYRI/5R2Q/oZatKeoXaaGusv1p2m34Qv+F9Q0fegMbXsEKKn/kex59dBwcgNB1qck6nncFR
 o+k30ZT6otEyhfBn9ZkYx5pQnUPwpW9pbPcufZ93Co0OVmGvsbMhFRwWIgyxYsLENyLlPS1Lu0I
 eS19YzOGzOXGBq6EgZTRnoSYGAlzcb1lO0W5FVHFzQuUIIX7e3Zc/6Ow9MBLHguHrp6Ua00MErr
 0a0H8fNcwXcpbPq3BFhpqtLlhaDuobCoLMIPCP/WjCwLwSO0hEwWxUf2daOuMr1z/i2wp9rXYT2
 TVVpUug24ZTkUhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXzf9+5eluqY7c
 fxgOsqenDB3mkC7fSIix36gqc+AYRB4TZYCOl+SxFJ/aWjJZEKlTZClf/WSr5/d3CNPVGMi0Zty
 +WNlhXaUvkSM08EAY4H11pt5uNZlXAKgJ/UJJUvmOJ417I4AGSBOLlA3jpzk/hVn6+029GgSbVA
 LXtAqdyJoPxiUxWQf6vYYWMpgDEEwE/XVZIkYPNJ18R0dGMwzV/9rxqmvERv+/GRwY45+Dj+UrV
 Eqlrl2ST93LE7F72P1I1lSAYcthMKy1cHtR4wV8CqLHo9oMaWSfvXfcqx42fXJHc6VlmChkGFpC
 Jt9qD/w6pW6QU5IUUATQKClsItxoWcbuDeD8+9GKKwORacBzxpXUu6rt0tQl1L8YL+7Fg9sPzap
 L2AWtAn+o87NXf2ymZLG+4UVMEqJst+h2p0kWkAR7WzfKLCLAkEtrQjG4Zrcr5rmEX7LafXDFLa
 zMpHeAA3xckPmMEFQ/A==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86d246 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX9XInpN0EDo2p
 BX4h6rCrtucwo+TJFu6z8NDhWhC8K98YzMgvbY6VHMHsOqAeop597B1RcrIluv0/ttAGXvMTdMZ
 N0ftA487UDoeI9SJYUEvctH5FF46BOI=
X-Proofpoint-ORIG-GUID: -BzjOmQ6v6RFagYESXuAwt6vpfhGb34h
X-Proofpoint-GUID: -BzjOmQ6v6RFagYESXuAwt6vpfhGb34h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..176cced72245 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -942,6 +942,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

