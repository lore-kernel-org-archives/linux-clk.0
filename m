Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA236414DDB
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220566; cv=none; b=c4a37ZGiH4z6el+vwp/A9g+XmcS+NRT4HGzBGfjTryMxlrbabaciWNyXNKOS51VGZ2sE5zeuoobro97KX/6nPOpb6sOyxI7EDyI9taKYSVP7Fj8EKn4uCzwd1uhg4n73oEW3xMcbVAjPFdhDujH72q3XmmkFrfGnXSR56NmfDSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220566; c=relaxed/simple;
	bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aed8mpyTH22NyrB1hTVMgUf+MclTSGfljAW6cKvbmRlhP+5jX9tmMsu+B0yk1ghG0NXIdzPeWNVNLZFnE1AwnDVyWamX0R7kds6TpcPtQZK4Bi3dBC6De65iNz44bBp3wXPrE1NdQo7NV5xqeI7HasZ4qNt2YJd9EX25yukl6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dA0RfeMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqiZokUJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dA0RfeMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqiZokUJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eXwr2161054
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=; b=dA0RfeMBtnbVJrsn
	enZJto7m5Dxj1g+dMurI7XWBMSt31+A5dbuDobUumeZZ1yvJXoJ+PJKhEp8efH/D
	RwSb0cpSt60yOXcfKSD9Nk0vT1FeYH9VQzkL59wbSMvhwu82b71nTwfiUFoO726S
	XgPZ+A4M9oRZrRztLKrq9vHQEhbHD5Mk/c4gbym+g43X6GemUYkRDnwxLIFK1a/o
	WaBa2a2jqGlFMYg9RumHEq7VFi5Bp199uESxCGgpuOBPeHW6kWdLWe6yyv25CxoO
	oDJKSZ2IUfp7MSvx3hSP7vbpLQHVX23+Tp0gEjFPFlg7iaF4S9TfoHMLS0/NlVQb
	F+S1wQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so85447585a.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220554; x=1787825354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=kqiZokUJsG2ilNMcGucGt2n9/iEZ2Q5h9DWwzZKkZwELj90TsYZVhaEEkNT1WSBytz
         mS4V5A3Z0ox6Zpp7+UKJOw95esbsyUvSXCCk/Dq6wfK6dc/jWq4GjR7OS0Y0gUkfmIza
         rjUFmxoyCFEJYKYDjmYlEnMDPQGndhdUjARTxG7ZRFIy8bKWbxrH9pb682MyGEVFw5vF
         A31I94W8tco5LvKgttFkEHLQOWR0fxryFWGOsd7Au/FAFhvChzoY2ntDJuRflV2obmrd
         OaC8rnIur0xyV/Bdj11ZZAAI/kPJ37eOMN2K+hcQQWEVWihc0BNZfpLGfIxhw8GcRmTe
         L+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220554; x=1787825354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MFImhktjIDfH4XVqhzB3W8/xB4A7L0ZxSbTD6AR0IE=;
        b=cSRQlTmBPDPq51LDQ2PL1WNtpl8hLhQcgbRwkyGRSKwtFBNAmNPKzu0HOcwzk20oCf
         /OahvV//nvYeOU7o8jdM+RcgwWGQeN5PpTrwtw6bBco310P+7XIoGeDbGo+q1OfgROFa
         PT0/uBO7FOnw1NQQ8dc98vP1vyP3Jky52AxInNtdLfQYQ/8z8EQkd6zEZC+C8LsGL4nN
         /2F6Oq8DXzdZUQEJDBuHidqHFCnq0OEFZyRZNvdKYfaaZUHjuZQGLSE+G+8TmUAQM2OB
         sxqWttn29rd+F6QQAKCPJdAbr+oh/B8FooPxUZ+Fqb9xo9Aj/g/JeaQPDP5qLm7VBQrH
         MdvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW247+X6dIv+vVszkQ+h2FfXjwSLODdPjWR+vruUCueNHdmpADcy5S2hvE8ySOFxZ4tahSU7jUqI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv9aT0IWGfBb7sE7KwkyYfJtEK9r0TSgR2YuurcBihjYbiqtNd
	nPgwroozavHGrV4vg4zMQWciZ/kA/Pwf0sIHuuICv5+gs/5A8AsZwo4KGY7NuzYTtq+Am8CW5+F
	JShnbaq/xVLYRnMehurEuRgB0PRhSfl1BlR7x+YONUtTuoenek+K3S2klzcUJ6Yk=
X-Gm-Gg: AR+sD10+FwvPIWefrt4YJyQnDXQcXXBtXHAaAbbpJJ8tfBFK7ReZ72NoRwLN7f+0dqP
	QXnL+LZNTqnUhsC/uoHtH97Ziulir8Ts4HrjG93uMY3A/0cIwbIkvqS3tEjMk8tVUc+7MC3xaQK
	yyAQGorUT6QF543NCLsGpkXB4wVH+r/t6oN+C0vsA9k2oRqAboKjhCg8j4QzaaOcP943RbLK0Be
	ZJmdplQmePQPUCsDlrtZjxGAA7X6sAozBHvL43ylLgV9/flUsvsypI38O430n1I02Q+9PaELwvG
	72Lj6mqY3yaUEa31TDqVyfO+1vfgmz2NZ2GEEZy8bxnmABvfIL2Ujs1GiKMdy3kVBNxh88hcUaK
	QbttKcdoy
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr529163285a.20.1787220554416;
        Thu, 20 Aug 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr529156985a.20.1787220553939;
        Thu, 20 Aug 2026 03:09:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:16 +0300
Subject: [PATCH v2 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-13-e67ea30d8b7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O72z3Ck5q22C30nEVzWv3ic7P116E6V0oAP28uzlETs=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIQs6NKImG163thh0qjRhTNHarWxymi33D/F
 F0ojNVH38uJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSEAAKCRAbX0TJAJUV
 Vi6VD/iHgoBx0QvdBdLofKiSGw8eeWWm1RWZg/gtVedZeX03HAIK4+syXM4IgtAZdxc04oX5Gda
 8asBaxJAKlKnx4tExqcAbzPTfCK57eEPs+i5rEl9P0tccLjuA9+/QXUMQP6CJLVfc5iqnom5gjD
 pfPqHhDHaGtu8ZzoM49DkR2EbQT0fmV8lyKRautCbSMRvl8ZhjskrcK3Jl3JZycIxe4NubQTpky
 HCKbkDXF4BCICJIFWcRI4oE8hoO1DbJc2awsCo5DGioTvxp/4yyte4AYshYlwYFlCJhSzflndJ7
 WhdRUsd85pkCJtwaqTVJUQojSWtKkPlJsQFE2gyA8NpObGP7EtEVJm1+qTxKcN4F4Q+n9J2c7H1
 oMKB/p6JHy66pzrTYGkPyqkvNGXjzvpqKj2wRkvZLwA8Ev94cV+E4WTGFL6pXKJmimO9Hq1qbbM
 Il5Oyc8/w9GUWpgq7bsSRMcB9CRrVnag7MMxjib0dxDwYEewBLx1vWuEUqG1OKZkKqQ8hfK/WoR
 dw+Z07JOjGUZvG1WoYm/o0c85Y7gXpfyzE8fEnSg3eZrw6nViCvu9CiKTXMSzUWkK8OwAtTMClW
 5/0LLy0WM9JmSHIknCBNMJco4nDeugSV/8INCDL40uG1SpNcONXHdfzgPj9eF9RCowsD+YKx/9y
 G9ApheSZb7PxC
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0S16ROLtIgZy
 8IctJWmABDhp6cajm6fXjewLDwqfwC5ThFnaScENtPCZkI3xd4Ld/bikebHHMDUyH+PqVoXRIoZ
 44cHWcoYk2ERT3WcOqsa5uDqaUqm17pjXZA1gGwdrBxQgTKbEBkqMCmCJNMwlUAKPcFZGG5zRUy
 jqvw2vc0ke8RZ7GRu1rS/ym1hBjGdOYY7wnRnwvSAhvj2dVDmE2htp1XBXKDonvCml2fBeKJYN9
 r3wZNE2vm8u5XMmOfu62jHaf0E0roVLRn4fPtAkDRPVtM3aWrrejccCSf2Sqvk8Gfxik3Yc5pF2
 jx7hN36/Ctx7iAfZQjAOSe0c72t/jQhsl/3hSHqqNmj3CwmfQg9MlrhfZlExjyCvm74oRYCmoXO
 YHr3TRXuscfMxH7vj90nF1tEG/e9KJDeQ1i5p1h3x1eG3v+XNUtEI/on8vGhpH9ldtnGhxlJpQY
 cdetetHwQ5bXbfzQ9ew==
X-Proofpoint-ORIG-GUID: 6pVaFfRxc7k_INTvl7aINTimLOSzbu3q
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d24b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX7OexlhSjzoBv
 FaXw+vKITQ0KSBjN6R/xnNTnr4EFrM6bdW1Pafaa0n0NcDg3I4s32AMUAivNwFkoTSNv+uV4zrR
 XBJMtVFV9+OSmCJV+ZGlJtXP/iNsvug=
X-Proofpoint-GUID: 6pVaFfRxc7k_INTvl7aINTimLOSzbu3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..962797c15abf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

