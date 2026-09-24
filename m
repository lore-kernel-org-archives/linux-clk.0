Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25298497B85
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246525; cv=none; b=DiKGFCCMSReDuCwbrU7kK/r00PEcOGR0PglUgqMQD2IvFZhsJKTwxMIz6/3ZkrD6XMk1Ys2zm5Z7jfRxAdNXkta+Wrd8QIvz5NixtICC0Cb55u0Up1PMA5CHW3ZEuyNtdac845tfcqWqU8hS6uIZ1DlU82KAzC6EUIq4cGo74nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246525; c=relaxed/simple;
	bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAUnUMTZ0BwSFQzAiLPSx3uNV+dHE+QnTR00YXEMv02/6/k7ex3YQW5qlLqcZgMCDOsaXAAv1sgzruZhuIOcwvS0110ikio0BZ1mH15iWhTj1Y7rSQ+zYEsVeR5LtElpiq0VT3274vNU93cWGmK59Qo81lSb97iV1RtBsV5zmpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqURI278; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnpqbqNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqURI278";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnpqbqNl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3Jcu2483612
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=; b=JqURI278bv/0uBT9
	p59UyQFKziy9ZMF7XbQjTr7hTnfbJLzDD7VQsI+W8hdmP4Fl5fao4t+rX7fS4n2O
	zrRWEuwXCxMT7pEFcCex1zLI3HBJt+f5kxcrit9nsjIg5WSdCRLSY0x0nnmsu2gM
	n4HSxij9cL+VL7Wj5M5WjWPx10XRyLjALVgUjbm3TwqUF8yUDVqV2mdv2ASegDFz
	Aaoz/Q48zAGWQ7tCtYuNOM6sq9T2sf2qzDPqrdIWUHhH/Yv0/r8VjqHZKMxiHVLz
	9mfW7CNQdz39ewV0HJA47t8xENs271WLK1hl8LrKyiGd+0Ykaaqi4k659xyzBWoP
	7OWi8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso370212785a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246521; x=1790851321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=WnpqbqNlamKLxbHJ3DDNe+U991r5B4Afd9OXDCwBsk1X2tO+nQv3zSlkQbe6dpJI1f
         W/jkmc6USkwiwUYAHVmubfYrEYTWElITE55JydXiT+3deaAzaunoiIRo7j6nIW79NnZC
         b9uhs+GX5UQXAUBXQpoWPTuIeCw9tm+WM6KVxXl17i094PAoUE+sZMMoywo6hIxi8Rib
         BjtOg2s1cn2DeiE6bnapWaRZQkqtkfDjMy6Bstk7eB6WF0DqfCYJICami7KJGZWlHiua
         VIzzDQgcf6rzNOrBCqvd6U+QVaOabP8u2mjxCd3nYVIR5mxPb3I3F5pJm48WEXa4QC2b
         0BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246521; x=1790851321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=XYt3dbD2FqMk9Ph5jZ/cP37NlqhS1jSWUFAKo0KP7hT0EHsgRvUoX9fvEnANgbKJKA
         uc2vgvj6CqJTu2St2nXB/9ZTceCisKY3MLQbayOVBARsSWhKuPp7fKWg483DpaS83ZuT
         ZdC9RnxAsgCNtCu469jOutlWKrZgr6fbqi/WOt0JooDXvEvDDC6PLjM2sHtH7QlSJvPV
         Zh0gHWTQ3+hl6nZlft40qiP0o24ncKMt1nOnDABvaJMO1gAMI3PtMLOPJg64S9yA1aKJ
         eUBNpWX5vPjD9vNxx4snW9ptCpJJfSIOH06494UjQSKeQ08YAoHVKiDDvDcOLATLZfan
         SLyg==
X-Forwarded-Encrypted: i=1; AKwUvBw2H/5TtBJUtwvQdjS3Glzs+l+GDv3TXCzQfj89xwHhc3CD9h922hfW3izJlrI6kC//OEKJoHU1BWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mrHuTQP+L4XdsK3WuqUK1M5+uXLrYElMZOx0AUB/gkoE57QTab
	XDsQjYqo6GWth2l6dVYoYWzsKHzYgA8HmDz/e68y/65oLvFwJkkeQROwjmtmc1sgpB2DmMFSZvb
	9FUsWbqIdq/nGiq0TI/CTnMDBHu9nGcjm5wcsZAkGwAiyPV3h8e5c+wJCOsK8ZRk=
X-Gm-Gg: AYBFou0gOfzk2oLxc5idOwxq/gWP7iN7k6t42ZkPKKOabiwZKIHk29HcFp7Wr4YXom1
	dw1tYlHQkFhQtc+6SFi24iO/nB2TOfO3TnfTdS2Am8bGkGjgJ6vyiHjjCkqfDlByLQSCKJE2Dgl
	WVHaTuRAmDpjLQiVZyP7xkHtP1KOL+YZBcvuBf3IevHN4IEXr/0DYrcg548Kyg1tZsFDtVTBg6c
	F/Q9r2tEc03APWy2ezPGI+lG9AiiO5UzgOiIL/pQVb2jxsXcrU25Cktzb+R2goslXZnK3+pjY6I
	AmPwFnJWjSFyc4tuGPGDv3Rb1D9953Dli9XYLlygInCr43b/vbQRJdyJp3j6A0XCMkp7B6RWWmz
	KbFWYYsvx
X-Received: by 2002:a05:620a:4150:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93c363fbec3mr221543885a.53.1790246520951;
        Thu, 24 Sep 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93c363fbec3mr221538385a.53.1790246520281;
        Thu, 24 Sep 2026 03:42:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:57 +0300
Subject: [PATCH v5 41/42] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-41-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4B70YCj+GEb+sbfFfcdVeUcqszN8HuMKxxu
 0yOJbqeEnKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AQAKCRAbX0TJAJUV
 VrnFD/0fKWKKs6Gd4KZiW39ygsxEMondlD6DHPk584actBuROJe0aPaX5qXnFmd0TqR7L7I34oD
 IJeE2tNyse+AcZxucaAXW/IJGXA+yT9qoOD8vV+x+Ikfx7uVyWw0JAlVQY+xj5VDLpvlYIOJbz1
 7No9+ntqAJ9cldmBw3ON2xyu4BigYwScZo+XhtPMntWp1wA9gfFFLgT6oJa8QRwTr+XsWBPUXUZ
 hYe4LDQO/cQSN7xtm7u29v3fzZV9J7FKpkY7KNrJIJrJJXdn+XBW3DBZgKUa0MRcJbNJ0/Tn6Lh
 w1CFG40cZ0lLPZV1M8oNyQdfKW9yOcETl3NoQ7t4JL1uyvjBKrfWaWyzNIhKljQ87Z7YDQHhdKg
 FLMcFHfJR63sfNE+DSf7L3uHcsEIIfMPOURXXMatvtqPxF6I9EFvPGp0eKVUQ7RWOMS6m1oeRSz
 st/BjYDdBB7jG1nmy0MucP3a8wYPjGdMowcuubFQrjKGYXXhzyKaqF0JcEixUnGo+KpxuzPsLZJ
 AfPEYeuzUqfhVP7AZYYgvn+zB9nIWi2ksxrWwBRTT6WOaQeajcxsTsKdyMI4Okk71NBj33nRYvQ
 6G7DGItf+rlhiURJTapVAHcxDr8lXWUcupQ1cNDd81Lv6xdhppWMJs53idskvaO3ovSjXXbqRKt
 OR5kl+ZeyHLt6Qw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX04EwwdaR5JOT
 PHPTzixRobySyoG45mWh5OYyQg7eKbPjrq9Lfw0a3+BWenZmzgqNQtWf+1HZpkEVaP0Uu38paOY
 BJ3s+Lv48uH+txBu77lzMK8lqal/KvGYkBT1H3At05/l9J9TbIvacgonNQv5N0LuHmjcfwIs3Rx
 tuoZ6hNcNGe0nwjq5I7krMfp+Z3HcJg/NRIiDnouv575swKXQZzUt3ysb+/kbfc5gNW1ZnOYlAS
 DGmMk1WyZv/dcYQzNaymhQWi2iuK2uSOK6veYXMHnhUPUNAj4t4BsE5lo9dbyNBVhD3ZiOYk7Cj
 rvuvys6YP2fFdYbHHHNaqyNv1dZRrgzyQdWh/Sqx4o0pAPN2yPPbpi+xqEqI30GHhE0TpjqhFmf
 2FfUDhFXoQ1IiJnJZtcHzwWhczCk9lliiTxGoTBIQJOhriF5GsWNwTPaPD7M3wLq+ilroazKjhG
 IiBnkvhXUQ+4j1LMN1g==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe79 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7dlMlxFkcyNh
 57E7fLdxf+MZxo941vUkT8o3jnKoQo9KFMFBXGol7CeqOWbl8qK6sixbrd/wiQiIQydkZucGnp1
 xNQYeEHNl/i0QdwSitSxvCKDaHbof74=
X-Proofpoint-ORIG-GUID: L15K_YljZ6K7dlN9b-FXkv20xyZtu19l
X-Proofpoint-GUID: L15K_YljZ6K7dlN9b-FXkv20xyZtu19l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..b9e943afc510 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -677,6 +677,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

