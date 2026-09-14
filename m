Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188964908CF
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390205; cv=none; b=C67juAwBxklPuXNUMqv29i49oYElbCSG2UiNq38oVkNx7QFxE+kJOKKYgBAVmYMKOYFxdlpXSUwVWm+C72eJDXwC97X2InrObR/h6OBK1Xdx5GrUEMy2rLagPF8d0mrcThpGWq1y75w3CnRUEaRf5TB6rEd8G2B8Cpfy09Z7iFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390205; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAgh7EaEKW7X8wXJVrnR01SDhcymoHPhYIOa/5bY6FD5N/DKnGtlJWQo+51InNZ60cHBuz+AZLAU29Gy6NGdlqlFpdeKFgFFvFap/zbtd5tSCpUyUNCofXigZQyX5rdvwDUK5Oev6uOgI61nYM+CD4v6Dz+1Ud7AdoOZFAd+EXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0Ocopqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1+qBJnq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Ocopqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1+qBJnq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFdg406580
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=o0OcopqinWuPjMCu
	PSIDgVyD2b7/zp7XO3eRDHHtmAqGk7yZlJP+YgLwPBUVGCFXKk+aVYobqdYcOrHx
	Tqkq8mq9lDS/3JpUowWpxkBd9X5uWnKuLUuH7triqusXwd6q1J8saecHeoFT+c3r
	rGZk1l1vXp430mA5uoSUkt1oEEiIiwrICz3aWA+v8N1fcI3qogooz1cG6hCq7JHB
	nq8M25BG3ZoiLG4VRJuU0ZbTSHCwVwqUFRboFZVfx5Of+5Tpsvd9v7G45ch1wv+R
	DeSCugRq4Yee/2YD14ADXeELQ9E65iF0LISlDkoiKkKtrA2/vKaNkF0Wdc3lD/xe
	hdfFfw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79630cb8723so183046137.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390202; x=1789995002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=I1+qBJnqWDyROPv19OfVzunUjW8XCBLKPhzOcOFKNJTbUABf6pynIEf8OgiUNlKODD
         CtSobUXgNiTUC714fJPIyui0iKX1TZj9Ws5FpLi+r+CUNOKw9yzUUIW+gzmogcAg8LP7
         gUGvxYBOsnfgEpeIsCzJN618+A01hKy2BOSjJcoetlhjcBcdxoKdMcXbk3MLY6/6Paol
         B/voeSAyiInZBpHS2HrA14FuWgS4Z2w6ITU4fhz/k5q0ZD/79CDttWsDjM0GZ6blOpg4
         xghjoM+AAiCFHODbq/OGEIgfAemL6lOBKYr401I4JruUf1w6ktOtVZxtTRXgm3S+QWtY
         RKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390202; x=1789995002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=ePMIhp/P9syQfYwbg+Y263vaLzt2wvwx6wZeIz3qhQtGnvpdxB8ETzmVAk/7q/f13w
         5mdM5bUggNhBSp8lPKehDS6VYmgpovvdkYruy97L6DhstaomgXYoIuo5Imz/MOSZ/kY7
         Zuw3HPmbYepBo869kGnEl9JJAbFDz8OfiPW7Z8avIqOzZmyBrJVQtFWU37dU/ZerupDL
         iXm5QzaacmpbPogrXRRrIjUgg0L4Ps6wjofth/jgzTG4KlBYSFoDYVApJOh+B01ZyFbm
         edrVwyfnK4TWmql04Qj4Hg18WLgtSi6D3h5VHy7UUHPXLT8kSzPBqTs2x6YeBul7xral
         it/w==
X-Forwarded-Encrypted: i=1; AKwUvBy4MxusoA+8FwluoUMt1A0+BNMogZ7gNW/d0ZszM8oKA1kB3ljWSxY9pKzSxVyhcZsyARdW2+MnK38=@vger.kernel.org
X-Gm-Message-State: AFuF++n2yZPAzD83GNA1jc08h5uIJPsjw3Z5ctyVdPktfNUwA6oK8SCH
	c0KOHKkLlmhc97sTn/v4dVAe9P4yCdS6hMgsQsC5q4sg9bOBe6CcXuW1Mriy/nBquOPRECN/GOJ
	5wWrNnSWwsj1OW0vfBgRxUJSg/lQOTqTmjmQuKYei4Oo8MAM0NkQgloCmGrWriWs=
X-Gm-Gg: AYBFou0E9I3wryPtVT/7GUJpXll/PjwaaMiynqeuDrZzGVR/ywwDaWua4Yja9Gl2qF4
	gkY8yIY+2y3PZrt1/+FU61tJnLo/DQMTIwJzLN7h8mg6B4sDJf2hdSFPzz6SLvdujwNwYFrzRpF
	CfWHeAMjFcy7NhaYhG9bMVmEET1LArNm7pIGRfesZ9CiI+MUK13MkQiqjILQ82z27E71zwSsqyK
	QVxECmAz5ZtX4IjaLDZxwGS8reCelYg5iLLcuzvoYgW9SU8KONnWgIwEuXHahNMU/plwj3UYgiv
	a/4l0W84FyUVteKNIhSxy6NauWs/c0ZRwDhjfU+/tlujJ/fxnAc2u6/+jP4WvOGMugiLpCWeoh2
	5abpmlRha
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191179137.9.1789390202058;
        Mon, 14 Sep 2026 05:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191142137.9.1789390201576;
        Mon, 14 Sep 2026 05:50:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:44 +0300
Subject: [PATCH v4 45/52] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-45-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z3elpHIph3aGwtkFU2GPTI5uNMv30x5e8kO
 tcNu6SoVHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9wAKCRAbX0TJAJUV
 VsekD/0RYUseKEoxSiROvcS17R6+RML8qwyeFu/EBlf+XFSbnb5a2MBYUoM0jcufqy8ISBnSZjf
 ObcwCz7F2BGq7NzmbJicvfNMI6dC0dCgncYoXuSe75ZOqxGv1H5hhKVNrveHet1IryTD3PsxuNa
 eBsGIX8WmZmxoXKIgvtzDAmUHPazCGN5j1qMyXINXzLH0/6SOAYp4DNQyM56Y+bKmBzLoFd8WC7
 26h6ilRJ994+GZ3Iw1q0HT2DHLZGp3c//9Mwwvc5OK5akMgIx0S+bTySTK7Hj9Fxkkit6/UXS5/
 IC4gY1LDqrGMhJ3i1jAue4TQjk2k0eByXsKo7Qk9X8oX5/AQyeq9Wv+bTPR/vdowrbkR8E0gH09
 M9V44gq1r8UwhiHNmvqzxjF7LfCeCJCcM9Uj3wtdwEze3VVr64ATmJO0fRzk3vs86gGsK6vAN93
 XmIJBPc2p+NFbJSDr9UxlJ1OfOfaPKWOXaYQ8LghyKbWCCLBQJ0DNv+D/PZfT2tDsla7wHFaJIu
 9REmeHQhHsFBROV1vNsqeQj475p0H4iY5lZkIlYLp4y032fIR8KNukhTdxe9dJ+p/2GaZJCtcOT
 f0vzXv3Z9v8qwyrbv1w7Ei/OdoABWY6sWQAfErNNDDgP2gw9AFq8ojV5+B7vSJllQMKg+8ALS9S
 CCz0BRW4imGoi5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LxQyjbhKakrn0NuxKZTv2UHkQHCzBFmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX1GcJaCphyPPY
 Je0adgBmSMEhmH/Ude5yMfo5OGSRlhgHPMibIMbQlPW9LUW+koDOnJv8SoAR1BlWA8hxLMCmKwE
 sqZN6vMhcIoOBF2Li4yGBzjPO6qol8n/L8NZTThlytw7xt5SSUEdpA1PRdSQ8wUhlTlS12NIMNn
 /1MvnfM5Jf+MztC+MCFPkMXIluXZmH0+dnzWKw/hBpLvNsiC9jE8yD6Wpv9OL0p+GjPPULkMZ5N
 Z+HXJwNTWzUen3yjU1x7x/KTD7GzWv1x1q/8fisyuDP499yMa9kw0BIP6dUit1ka4QlNWLuvyrh
 wtYFMgCsJkj8QTF5tSaP5stUF+lPXLNZ5L9femDu5lajLbEtQx17u0rXlKiED0H7/yLtz7/1CRn
 8qjj7TESOQEbsGUDzMdXtDbsfIZipjM9bMfRaO1/ZpsaSwkej/wbXp6yVJw9BkPlMDjhvspK/Vm
 kvT1YCHOwGXl7IN41Sg==
X-Proofpoint-GUID: LxQyjbhKakrn0NuxKZTv2UHkQHCzBFmP
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed7a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6cw67r8649+5
 JXizaXTAWHy28623Cfd1huO0VvgZmKeUjkDEW4j7EF9Lq+FbFWS8oF4I0W7ujrnGgVtL/lpEvtk
 iblYj7sjubES8JrpiXUjXSCYlNETHxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

