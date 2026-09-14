Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C28049219A
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390208; cv=none; b=Q11eITnkx97PtTwZhRIzgc8/eYUCbpIrsp19wCsTZpSVvVVA1apdcda9wWxNBRllaHvwyEdOYOqanBzAZ3dl3w4mpUrzRiyZ1P5rRuEbBCfTJy0WA4OELf36y9RYZH2zuI5KTTUC4D2SIUbDFrxIT0CmJ6wRcklrrMEIvYNUzKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390208; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq1WqE3p7vuiqc1gzPBuzBjRtg9J4BBqw2q+hwf3JqLXTUAwfzG09gyqXXwe/7zyH22OH9hOaKzIhqlCctK1pnM4Hy8u2VERdAfavAcY6O1Pz4C38QNH4//gCiAF1IEyWSrk9TOOzHE0ZD2f9GuskiuKb0GAnzC1zUBG+ERCQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4XcYK9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zg3F07ts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4XcYK9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zg3F07ts"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5xl3291478
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=m4XcYK9xP3ukjTFm
	POMa+hreh4kyn9JcRvfNfLgC4DxXBkgYTmCOtHXhCG8TbRPFxoAe04xqVBP09sd/
	8PpN+nzhVpxHUBb8+6k+H7CDfDYRYbLpRnMK0ja1c4Q3X/hZmpUzSfBw50rp5ZZ5
	/nDVbaHSy/OVBkPTRV+YwG0n17i10/APk+PxwSWhpwWSHZx3jSDq7+3+8yvgLeKM
	wA+dehsK+1degMzwCMVUU2cyn5fpp+aHTxSUhcNvJSIElaUCak7DhwLGqsAPvDHh
	EBtM0Y839F58MNuCjhZ2BowhyP0cD/R+xSTeQFFlZY0z78bbFNE8LV1aJvnJTJNy
	TJj+jw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8npu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso434335241.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390205; x=1789995005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=Zg3F07ts96IRWvGoHuDNh+em8EnE6RMMWr8WRo+/omjgqdFAYmOhFNXP6MzW/28QVa
         4yAG+CVp39LuUHXXrqqdRfooEirRAQ1jkeAmeFQOiNXlXcugCgzeugnf6Xy/+w5Eofkz
         xW4JOt/Swj3S/0FA0c0E76mm8AeIn/LN12ChDVmZYbt6XUUL7B3Be1W5u/tCL6VpTALo
         414sotKN34lHXI1ZEQqCdbH0FiLVi9wxLzaJ0FvcFGW3lYI+zNqYiwQwMSl3ha88ZhDE
         HPZQ3mKLGyjx/Xc6eSOii1vNZd8OsCZnxgfdkRF+ChW3g/e5gB5AW7smQPBG//VzHgDq
         jV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390205; x=1789995005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=UVaH6bJDHu9EFXu/sc/J2XNLSl8xslYvjZ+L33FpVW39h3+gN5vRIWob7+DAAhSVLK
         3nktOJwInKzoatCNQFbj2VU6ovKzmz69P9Qnz2yGTfDQsX1sqz2CU7S7m0oOVKOc13Zv
         MFOGEPr8NuUdj7SIZuUl3TPlL3UpaB+YVmI5V54/Ms8LfkX1OTYcJNjwfGIS5ttYw0dp
         NBs4Jd7H/l2mHeaS1DFuO3yONar9HygTH8SgLDMrSGVAooe+Qpm8EB5fy/80QY2DqchE
         7njRRlc1/IGxOU1mI5flJApFVMTpO58WULJKJ6dyYudg7vJHCUWKfKm1VTZ9J4Mw/b2Z
         2hig==
X-Forwarded-Encrypted: i=1; AKwUvBwF2tPZZxa+bywisS9+r1pufP4HELyo90tBvIFJ28pIo+i350h+nXmrICtHQo0jYL4ObYLgSZoXP6c=@vger.kernel.org
X-Gm-Message-State: AFuF++nwVIk7kOOj21IwxnZc17L2UVLWVhj25Rqd8/gnZPOzhnoCJcHB
	f2MY5Od2MLrdpcjjVaBoqRbSUSsVL7R4wJQX6zoW4yqOzIHPUa1E9Zs912X3nJBlwuZrwcxoDzP
	gyWcyKbFbvS2IP2nCdq6CYtnc/upmQTfodphYRKign4MxrKo6CL3N1sTGqC4tFiA=
X-Gm-Gg: AYBFou3t7wnQPCfM6Pe0lzyILi8Rowqr1Ix5ztmnqioSx/eV/eFLFSTjXqAbC3aQ3+a
	n0Bec2wkA/xxkSiTnjuYLu5haTIxqOCK4g/mZ3Rrmx9KG6scsg9qe6fRbKeeDe6b/TDcVq86K/R
	AboMibbYkTaBnXJdJ/nxCOImg1VpS0mBg6hor4PPmIXVk39pNuF4GvYkEqdMvYvHHwBkt86yHgP
	Oo/0XWB+1QCkuVhqW8yc2t73REFlX8KnhrCKNugO2Q0dqH4ZKDmMoNyRcAdWQtGDJFlCl1TgqLb
	GXYeequdCDvSdscgBhwlTZa2aZHzVNEbpLkg/1/YpMW4aDYIcpZP2uDvKyw9yerRaiuHR4Gs9MC
	6Jb5uJ2Vh
X-Received: by 2002:a05:6102:5792:b0:782:de7b:eead with SMTP id ada2fe7eead31-79b573e386dmr1120005137.1.1789390204623;
        Mon, 14 Sep 2026 05:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:782:de7b:eead with SMTP id ada2fe7eead31-79b573e386dmr1119964137.1.1789390204121;
        Mon, 14 Sep 2026 05:50:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:45 +0300
Subject: [PATCH v4 46/52] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-46-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z4diOa3IoZkiyf0cmd+cj1rtu79x5zmqTNM
 gJMyy0kJoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+AAKCRAbX0TJAJUV
 VrZrD/9BzSwkSmEv7n2TgG9ugoiSywAjRzsDS+Frozzin9bv6SP0MCeJSqd3Z6Q2PBx/g93HjxQ
 +cPD54HDSFIb/eoilRDkiXCN9F0QKK6Mx/pM6zMccxCaiIPrm46/ftDNaYh+JxF0gmR+rD+ffCZ
 M6HVX3wge/4arOXte5K+tARf3p6uzK64l1DGBDNnOJHaqiDKMUY8T7APXlNAHY5dcBNMS/T5L4P
 MeTDjsCGwzwvP87qIr1PUK4NIB1R8i6ny5ib1BmzDykddY8xCIWmVNyusvifVlLF3RwjCAnOulJ
 vye8ILMlHFK8yuOX8Uaq078gBEBiNBolbqLfFzl83cf4R+ZWDRZB8vdaMvCqbkp28BwbtZigaJN
 8EffCWAE1Q4aS03qBLYrMgHtyLaEiHM6uqc58G0SZGjfYsLNmYvNrVXkcFw5wQ9/VEMcfDdjkpb
 FtSaSJnFS38liimo2oFY0CaHcfeSrnMfOtcWmhp+E0F+lXC4/H1BJgqIbe7/PRtJQZLuet8s45k
 JqWzFlzTiwdNLM/0+S3cxiTObbfWBNtYYOHjiaySAuwVYaysoTga9eXXArOhdc+Mp8eJGFyEphx
 EqKsXrbh95SUdB7OgAjB+0yHCUF8aboB9+xuLjlhkP41hSkWAeWy3IRZegvMM1RruOtrCnvNws9
 xTT3fC8sWPlqliQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed7d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: _RUoNVNbMExlGvvfkajqOTZR2YlASkYC
X-Proofpoint-ORIG-GUID: _RUoNVNbMExlGvvfkajqOTZR2YlASkYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX5ws4qtd+Qn06
 3EMDeFvGFKKsFZzE50RIhPoHGpR7665QxAHXwzOMDmx1U4LVJ4mUoNJ8XF2oM4bc5z0E+ZJQnXS
 8uSc/v68ioGUL9fIjPl0ZbWPPDIOWt/nclukMkfy+hTqbgPddqwqfOAgP4TiiZcKYASbr8IxV4d
 PSv92v3NMudzEvKVzoc2EYj68JTRVLZn8NJ5rasfL6Sm0GdJryNDfIX5aRHcJ/39OW1SiScxN/+
 5OvvK3Jqi3EyXFR2JZljdSUeOn9nGb1OTgQn8Dzo3Y/VYyiAqkELlReWkGU9w7/gzuFLnpBysI8
 +Iu8CONuBOenO3x6akbCFTXIC7LWuOyqjn/EsgzccnEHz9mb+ue0eRvg0z+wnjjij72GA5NUoQa
 nJx7MAy0vst8DPj+Y7d9qqXfpnz3Ud0BwSaTEN6GiAxUnYAu48v/xnObWTaTlCiR3Ki9U3EEMeU
 VC/DLNIQaR2l7FCMe1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXyEIx0TtJBJEb
 uxUn8Ci/PY+ITpVmCDY06Jl+kgxjVIcB/LG98/NBWjtoY69S1UY1cuLwmv14nceK0I3ZYKkXtrO
 4vdNH/oVZXoSjXqFiCOn+zlFpiHj4p4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..a90e4f30d39a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -970,6 +970,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

