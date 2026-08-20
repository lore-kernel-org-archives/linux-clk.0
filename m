Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067740244D
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221037; cv=none; b=dRQAqJkGa8K5TrBSX/cqN01XLpjyls4O4jmrqx88D9YhfQ6ydhEG4ocYAJUj5ryB9pm/1BqSQrL4sa6lKcbJNy/gZm9xk1k68+JRVwOeWzBrpKNxksRopKGWSBN8enAK3LO92unDiq9oM0EOlVRUd06q5KTK2/2AOUupzHqbWFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221037; c=relaxed/simple;
	bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEReI7uE7i0kB91rPsVkuI/8iLBUnmz1z8CZoeBjZhpBiXB2704QofqfFSRXGT53cOWcTvjhRYiG9VWEbGF6EtEHAgX3pAKafXGuWbXzQKpDqHERbIuBZ8ZlJowKCGFkuD5KP/rewWzbHWzzH3qnPhXd4PK1/YubVmeItFmISUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d24KRiQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZItTCpzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d24KRiQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZItTCpzk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K4b2Jf490815
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=; b=d24KRiQTBx5m1AXx
	F+fSdMI3CQNc4A7h0xU4MdnSYkgxB5qkf/0Rq0WnFulPuNkk7/RV/qQuINshd70p
	5NUSQ13xHiKQ0CY9AztD7YVI+Qxm1jsk64OV0T+kqPsapzmTHp9LwENBAihu2dx/
	GVExUF+UL8JmLr41X4uxWpEqvRrjqBFpwmgYV8eFZ3mSxN/w3HOx1CV3WZPEYkkA
	dU77CbbNVtqSCe6m2EGGBXUU1QWPERobLGn+cGilU5QVdaXTVkWgg4kx7Q51MAq9
	VHmZlH9Hzipti+oeHBfRyJuK19uT8BhEoqUbMrqufy/vWKva1btUT7ZAAo7641Uj
	39AsCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervme8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:17:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2929423a91.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221022; x=1787825822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=ZItTCpzkGWdW4QqiJjFdDSf3nsLww0oL8A4TNrCsz7WhiEs/65Frt1Q2/zTaHVfWa5
         fPTIvbWQXbtSokBcdGFQowLROsjAAdm36v4RvzwSoVAvBqbl17VQe7G+BH/GEDG6f4Ir
         QV0gtp7E7LxZy7gBzJu+lH7EhkLLBIvzHf/lZEdBA7fLP+19hSK/Qp8iP7Fdbjq2QUel
         NO3ygvTsvZ/RSNDbymoPp7z87lwVbHKWJZlP3jB2eBQqsHK/x6F7N9EzbgA1jZ6P3/q4
         MKB9JmysH9nIK5FCTPIwZn3FtvHHw0TMDfqGpPNdLjMVSYtSd735ujSREF00odJCeaku
         HdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221022; x=1787825822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=pJixKvZWKYZGs+LohfPaOGatzATFSGMxEfsa+5+Y0L4ny5Y3e4uYroNWfK/5RTinmz
         F+HFMfbeorUISyMEm2q/Duyl/h81lR/aIU5Ue0Q8XD/uuw15CGiribKKx0DtWANI0KBz
         QraSkKfxNV19PJEOgpUD807+kirqOWmrBZfjJ8bG/BehpWMnCOXwMSRTW7VFsC2GJ9y7
         OaQ4esb5I16fCe+na3i2B/9mDRlYeyIwFFHv0Lj301MaubdYsKfmUNMWL2wKjoAwqB/s
         6v0kwVJaNtE5AZKPTAvAdQBXUi/0LK++fcg2pKlASdCHq4Fx1Tic56+n6V7vC5g8CqWl
         7Zew==
X-Forwarded-Encrypted: i=1; AHgh+Ros4kq8WHaoO2LvD+Z1QRfTopLPwHFwrTZk+0IrTHczjEW58dT0dyUF0wAJdTbrVk0sAGxGzKCMfHA=@vger.kernel.org
X-Gm-Message-State: AFuF++m1XlxxWwWlTqRxvV0eM9aN38uBiCIFeDMm0aJjNgzGZ3GRiHlF
	iVn+DL6mGWFyZwRyg1JzoX0KZwKXoT87/FkcijdWAkPReMyj93N0EJcZgcgA+hgwe/riz+yFY/r
	D6wSRSc42Grp/3WSi4ksCy0lQzbHOlQYYL8LeozaUK7q5jggqTXCk98nMJdyqKsecy0mh9opOI1
	Xc
X-Gm-Gg: AR+sD13qssD1BNPc+16LwM9R9M5mCY8lwJf4+Nw6qcOZUDug9NIbB9BdqgCHmA1wzHC
	tp7fBvWG24q4WYERmCe8CWwg+U33U3saqpYYn1ZEUSQ6Y7zWj6nGdsxre/RHJiQIukjY0NxkOBk
	ysTPwP9el+6MdnnRVUC4Ah3Inka6HtF5l3xypGHqIgdTdgbMlurBCECeJ2cFSgwd5DNarX5OqpW
	OOBSbaVHgz9hm/A5aKb2oBA8KwqRasw4mYJvTGYBXnAcPSCItseMqlQ9pvP3s8jBqXLttIyQ+0H
	8EEqlBWHk2LEI3VCIscZ3H5SuHXCWcmuDReW/JnLmb74oFY/c8jmEr3apZShh9YQzF0gVkvM3pL
	HxhW7mKCo
X-Received: by 2002:a17:90b:5102:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-395810caaf4mr9561738a91.14.1787221022331;
        Thu, 20 Aug 2026 03:17:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:92e:8a84:7041 with SMTP id af79cd13be357-9371e204e49mr974226885a.8.1787220543906;
        Thu, 20 Aug 2026 03:09:03 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:13 +0300
Subject: [PATCH v2 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-10-e67ea30d8b7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIC7aOoVhqMKAKNLuRzQ6hQToZB7qHcsAm+S
 5vIYyT7YLaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSAgAKCRAbX0TJAJUV
 Vn+ZD/0edF+jA4FFWsIbwB8znExVCFrPOBpW8EqPhTPsLwEHddD8lwMvnYIfdj5s4FlWNJayh0k
 WMGZmDQ5tYz3HXBE3twNCfSb8cwU0wYBmTA2iDp55miiGzziQU2g26922N2pZsfBi9rjdAhF8xX
 Aam9llXyVPXVZj7VHfmCvJnrVv5kDkZ0EBCWcwyiMC1IcGIbU5i5c7tnrry9h14SFtv/ebcQ+i8
 yU9WceAi+G7d+2WrsEoonayTqUzkg0IeLY9d/F9mr8a2RUEKc8ZDKkCQdKpFJQoyEniZndkh2j+
 UgTNUBr158xzRqphZmlSwa6Wbflz5YZWYL8LmGjZDHVO7S5Ikz30HnABBnN4NRSoJMOwlm7cbtJ
 6ALXNrzSkPmJaX87un+B2GGOrPg0+r8MdTO/eUp06Chgi7BsmxkHqgtsfY4DTq/blv/UzZWleVG
 JxIUhvcKXI+0N0L4h+r6M6bbD3X9Ue4sutlW3w5KJvHD3nFL6KzuBzDOWWX1sLmoZVMm3JRF94G
 FUvIZl4zdG2FAcxA/H05OkzQF1rkYC/O70iB6WGwOOVI1EjV1rWrpbUrfIVF9Gs17SMa7AtNGkM
 HGKz7sCxgshJuSfEgEr8RZuCW5ljv271ZGINgK7haQVIwsV7tTfBedCRSJqwy2PWYayhSg4IQdO
 ytoJBxYLUaLfF3Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: yYreTerIjlS7CRvzjyBvoju9LsIhpA0w
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86d41f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX2q5XeWEran/g
 Y9qZanJ66B9CagGaec0QW+Piuocuy7/RckvIakNx6TnpnRA9TwcaLL3LyBioiOnyRQj5oUtA13E
 5Ub8C/a5NdW/UelkGAhcxmmF8rY5UcsuEeTm/R4gxBOs/Lv6OaPONi8sSHdAgTsX+cE9ukQe/NG
 8OydThzTn2Um0KPevU4RheehP0lW070oGy9wApjZ2U0cokwLdp/7l2sQaFp99RyvYleaS6IJchA
 +xAwhnElr9d53rhWzXFl82edINQb5LXI5NaIT/7vKbAC4PUJUC1JE0Zsi4lnrknK8htqznfrdcZ
 +5Q2ur5HyemqYQoKHeMWQgtmMyNZJYJhkqvRoqlzNTNO4se8jiwiO5E86qPpA86qqVlRnYzue57
 eJx/d7Gykej4KLc+K+7EfI52yOsC7gTeSbQD65DikQIq+qQtP96VClXEJR23TFu2BooTOQvTrhE
 XGRKG2qTYjbTgB1ABBw==
X-Proofpoint-ORIG-GUID: yYreTerIjlS7CRvzjyBvoju9LsIhpA0w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfXxNx8hvs6eV45
 +A8uNjkIWR2YTjPesCAMbH40XSXx9tHqv3tY0Fvbf2AChX2/RwXehseH+1p8c+uBZIZR5H+E/SV
 ND0Xbt/f9tPk7qtIB1jMG617oO83mu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200075

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..84012a407c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

