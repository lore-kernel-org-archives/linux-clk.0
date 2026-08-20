Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0C415B94
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220570; cv=none; b=GZtHfEUYBXqCnLO1cjRqyqSmAsvOskdpU+hQhJlaBaXVMaUwcXyzvhr/0f6hOh4rsPPgGjjrL3z+VVYUmjp3p4SunucgM8Xpq8s7DI7YfsXkmEaelvYQQLxRw4JExdL5ukL29pqPaYo2totBUlXGjLSlBKltGP3wJWMLbJ89spY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220570; c=relaxed/simple;
	bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSRBGTTgQwFfTCRn1D5KYi7asLfuO+2Nj83OcBuTTDH0EK4P0hdqLv7PWDh38RVCnmjm5thoVTlq8Oy1EOtQ7gYtmS4+GumDphmItb64FU/6ha19AQg1XEHh8QbcumT1qcM+NanXnDHq3/zydjmjcptugn1RCwFuB4iQKgz3K6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BK2+B54d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH7R8S8Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BK2+B54d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH7R8S8Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eXn82161066
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=; b=BK2+B54dvupZZsTT
	BYixDRurolDUTEq1z+b7IJScAlAkzpJvBmC1TNs5025MuI6fCYeft4D8srZlxYSl
	8cB+eVYGRQ121XaMBNqafdKeDVdzDUmHfvU4AFwRqwEJZa8ViLEAFEUfJMojmFAn
	KbC97grjfqD82AReLwBaSwCNgJn8DSj3oJbeLZA2jxQrxRReUuFPmT/l6MI2qDw6
	6/jDtrzXLwuUibAzCQEHAuktvEI+3wIeM0aiz2fJzN5bTcBagO3HQ1umtrAdfxme
	ngLaJcLnMZhQsy+ZRoUczrvIdoWBq2Dtqtidn0iiCi53J97K3YHBITYWFmOE6iMB
	ft8AqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936cadb0e8bso172792685a.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220557; x=1787825357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=hH7R8S8QQlyDmQnvGASgvQQJmmNWa2y3fa1LlZMXw1ewPUbNAVkkuCNCqlU26gPoiv
         ArpFxCvjUvTa1/nyvBDB+UcnrfAb8Pp25DI9NTJTgeklONNteBI8HSqdi4xn/JWmaDjm
         x9I1XoSYczFNvtsD+99pWRuPK4wfbBK+pKLZZVvmXTZewDotWMK7yRKlqfpsdXYPfUBL
         5Bz/JmipR401wP03iC5W955OryPc4O9HafBtqFtC/ueJDAdsdyPXhNcZ9ZCOlO1ZPGO+
         fKx0YhZkav6hUCimLpPKmRHUAfexVkZ6WsyFqouSBY0QfTAfUgomkIFEpHNlYzkXdHM9
         M65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220557; x=1787825357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=dD9lsiwm7BgGt+v+CSlvivzg52MYq8rCQwi34qNbusGahvMqdO+RvVKqu00CL2osOe
         w1coMYbT1L38Au/FgIDd4iyk9aFhLhsPUBPJp160++As7JzEJNZYdBmsd6vLmRZ6Trwu
         lU7PNASqCwM53aPBU6IV82D6Htg3zGqop/Ljscd5uZawNd38pfSsX898SJrHhnJHF2C+
         YHrzo8HplEugTFtKwuqC8kM4Ta7K26SnCh75806RyKllLkKLRdCJhUcNtrLkYTjvocBz
         2y/tfcYddsj/K7KbdzUjbOCNt8Zr/VkQUrBXpBTp1CNHrSkoxOb99JUHPgSWFiX1n81T
         rA4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq2FXRz0XC64vmLA6bEJsJUUwYVGFc0viQbo97as/h8jN/C0CL4sqejYfFVjXmop+XMfN3ILYhUlAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4re1khW6pq4tI8KEOrRoUn3hh3E+iFreLKgKXg7rYoHFQmtDf
	O2XMo+CwsZCT7cfgkCJmygNbLw1ced56EKD1S2RRfwM5WQuxt9vY5+jWnjaCKUtN3u2LIPmveN+
	rXzoGKwp/aezxWJa6lNAD2I67iwWQbU/PdBiwPoiIL60a1+r4p6ngXqknvu9NdSc=
X-Gm-Gg: AR+sD122OZgy/IRPER9HLb5lBmANnlSMoqm3kcXYmdI1BhZbDFjj2hVmZ4ZPFFUNn5M
	xjz1TlXDcCkmy4/10sw9pdG3RqYM374kV2fWyG5AXeYX6VEKcr+OHAFAFpKlEPv/b9ngxpGjh9N
	CmJFZiFFbBvm8ZDOmb21q4LFRweWbu8fXY+pb0GMy8qakG0ovYrrWzWo5pYAeBSSfeatAJRvjBM
	N272the7bt/PPbg9mnn7dRigcQ8jpMI3j5YVj8H/lqzkOUwhektt0elgXq/uY25/REytcvzNslA
	Kt5L6xVWvCQ3z7v+Xogt5iRmS7r27Uf+VbIO4+YJDxEw3Fa6VRadQU6LNRNtt1gZjxp9+1Hazb5
	+gWwC5927
X-Received: by 2002:a05:620a:2a07:b0:92e:e559:fe6b with SMTP id af79cd13be357-9371e2cfecamr1031512585a.7.1787220557430;
        Thu, 20 Aug 2026 03:09:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:92e:e559:fe6b with SMTP id af79cd13be357-9371e2cfecamr1031506385a.7.1787220556774;
        Thu, 20 Aug 2026 03:09:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:17 +0300
Subject: [PATCH v2 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-14-e67ea30d8b7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIVLpYIxSBIEuiQp9TZbk0CXTvDRPRG8Tp3r
 TXPxnGOyV6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSFQAKCRAbX0TJAJUV
 VkvFD/0TrOKu2iYWL7PYb0LWC5qqnL0zbc3LUhTHUOl2ycftlYj/mKiPgpRclzjs1DxdLMwfiIR
 DskXa+uqg0zl26mSPkVK79VD/mds09ihlRFKGwpsysfPWIn/GhzktOu9wprZ+IxJyaLmeOqQiLn
 GfSkhLaPlb6QaWu7fgBcxSBOu50MW0y7lJSelNYMM/FObIqiv0BvpuValrG/wwCEMticcUe9lxI
 7aQv4e8e9I3kDul50cxDiEX0smLhDbG/ubrFmkXahwbCNFk2cXX4mMyu8jTPBzDnrFa+zXPi+Lk
 R0o3aBeBSPTjx8VsWdFIRlbq57o77Di3GKqu4YGZIW9vi98+oAXPA16MIePDW5exuEwC5QyhzkV
 E6NnwhabQg2WlXtbc70qXl4QfIjUqiwD2+FAzMUteBufvfZooEbvYf3BkCUNVxFHZXLVJVP6uPm
 stp+D5p0svW8TgzEWj+ppfkiiRBcCVmotad+r4EXR+CwIq40D8dfgJdB7eB7OUoi3Fvx1ciCF+H
 4YgP30zvrAmt9WXtv11kCyh7xWoAi4lpTPXD/ZfxpO5iTn7QowQbXTCziq+CZ6riCQbM0TY1EIK
 NpKRzPfuhWNdfYS8EGGK1ets7y6FrO5aP+EIvddgwhUiTB+2LVJqy/pgLyC1eqCCatycSu/JY03
 dJjmTYFe+1bvckw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX4Y9+dSX4Kldu
 rNzomx+294tofhGs9FBuvSuw/H3rZT9BvyKH/d5ooc3W6HgtHykXzp84g/9o8rnu8sbv0k5LlKe
 DLpSR6KJkNThzluS4xbKbv9m8TwEoT8lNt6VZnem/hYs/D3svf9G6Joqqwo8ZlLb1nzMosTVRxd
 ndtEQT8i4DgC8ZbHQXyht7sYn9HxEMCS1ZylW0YI04I/jXleUSRSKF9VbiHsXbD+iGE1w77LOWz
 gpNKERFu2AlxVO6Ak8+2iTRXlZ+NbOvBC7ZqQT1XGmLxmb1cht01ApbKQKP7Zx0i29gW5m2MMR0
 BqtZZ1MR1bsf+lrDKt9DSWlommq41nTmWXYeK/RLFyK6q07a7jVHkZIWSd9+DzLsFd5Atk++nrU
 KMJ9FWe4zYrmvY6GVdmk3UdlEXuIvo2Z6BgZGhHPM3b7KzMIWDQmnkQeT0K+9Ysjr+fywAbXC0L
 aAksdVf12YeY6Zqzy4A==
X-Proofpoint-ORIG-GUID: Hk_zJecsSQoz5u1_wdba6urL0JrpKbsT
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d24e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX01mb/Ks0zOHE
 FLNN857f3TQ6nj2n9wuOw6qGzgNAgU+4Asmb6AQSYjHKOwEd/OCzzims2xiTsUYL9I3jh2vyiKm
 FnHYLmSgKsWK7Z7oexBPJSwwLe7Fc3k=
X-Proofpoint-GUID: Hk_zJecsSQoz5u1_wdba6urL0JrpKbsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

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
index dd738d13df8e..cda18d4dc6a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -676,6 +676,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

