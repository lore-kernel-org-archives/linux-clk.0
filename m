Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09076490C0E
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246515; cv=none; b=caSvyJvCGOR2r4RgkFG319ng25dd+elS4k/ODs5hFqUdZ9pnNtJGPLEiFu7UBp52BElR+HUxQWiHPxzVC0iV3cQJ4K9KkH6ZvFeAIoP9Jf/TRNKKvlIJftVwcPEQbOGV04nqMDzMknOkLRl608/4y/itrFGrRHYUaGcMj1XTaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246515; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N01JkEmBBjQz2Ort172ccQojF2WtiJgeArpIkr24HHihiDJWHfkT3lQzCU45/JOb8P3pT23YRDR0s9Ahj9mTj3R+Wq7x2mwhTZYyWMzUiQajgHiu1WfErSQwyKyGtBbwGIoaCQs/yFvxgVasLuEG6WuUzWBHjxDFY7umyotIuYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEKdpoW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvZ3gRu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEKdpoW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvZ3gRu+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PmaC1644189
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=lEKdpoW9vCClAz2b
	B3Yz6DO0a/O/JO7iW1yhBnIQ/DDxcF4fiyEsfJz5z+mRSFOg5YAb+4I2eIizJf2k
	HfZIeKCuGrGbaQENAlO0bjWhIJK2Fas53eOIhSxQ7XmCTXJpYwVxXHwRC8OTMHNq
	lshxMQ7PlHjMrF9Rn5RIG/tM29wH9+sr2DIPWvtBhaGDCwQ4NbnelNXArrva1iZN
	fzV1Kr3zkH40Z1X02mYV2ilKj0EZJbcNzYTCylxdV5aV6aTLJv0UOWTA2Vl/QSo0
	DWHsZ96DgE4DxchhBcjWt/1CNhExajm+EVvbyneMIx3kpBoOnCnywhyqnYhRDHZO
	kR9bJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb44t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso133396885a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246509; x=1790851309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=XvZ3gRu+BRy9a84HFgqAqoCjIDPuqZCOst1QSCxuB6pMDojBrRwaQ4j3Jlt23b+YE4
         1SqcVsXD7tt3v7ZzjvzYNRVGJVunmdrtuMOH9iZIYds25WO2l+O8kRUELmIomFgh9h0o
         9QAmijm/fL4yWLuVXa11b8aH/4/DMMg+10YaSYXTfJ7qQVVM2RM3+QfVVyultxswM9D1
         FOAtitzznu4Vx9mesIVMxpiveE8xcsvod2ZbYxmZ/qGXj65RAQtQI6wT9KPG29EeiOfy
         VGX/CQ9XGqy3b8fKl1YG6diHNQEEe4AvGqCVQY+qXInkSz+XBPI4vLzSaBBBnS85gvka
         Ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246509; x=1790851309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=bHPRoaWGX3xfahnVXfB0fsdlCmEZgTtyj2JxS4niUAy2t23ujGjUJLBkBJJ1hu5N1z
         sZO3f6N7DAWoFbMS8Gi4EKrj1xiQJxJoeWrmhsah7GDwcK5F0cE2khSZW16pPyBi45iy
         W4NFWpqmgsgPFGrmb/ijtCJxrD2CADUhNBAEXEtrNdv78I2R1qQt73mUfJXUEUx/75X3
         N388uz7KALJVbGuh0GCaEyYSol04ZQNSgi5yHs9H0CyBypuL8gq8gMLfE5NPDrAPssdo
         q5Zhj83eF1jzTwq6zf+9yWMv7J0I+cRN5MOQC9isj3So3preC0YvuZiW9OPps8DveTeD
         kssQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxyQ/a0Wi6kmv8JiJBP9bnpsNMhgaCtCUFR7/wJ9q3ZUW2ZhJ847DGO5PWewPhU5Wc8aRevNBlBfU=@vger.kernel.org
X-Gm-Message-State: AFuF++nB5UoEI3J5uEkcJlsXYA0xUqqcSOu8DIT6Dnup/ir2dXWg4HRj
	OvnTMCdQknRorJ8S+Gl2K7RocUnGVsyNLJQ2h5eJOsDdRcGlmpoDRLAjPYwQ3MfgVESL2Q9dO8s
	Rfz6/S2zfX8IUb9atwMh7FlCwOgVKvB9TQnbklqZCFAPyPdVApMVqyMVWQkqUnEQ=
X-Gm-Gg: AYBFou3QfD/5BzR/z0yzyoOGNsgEZ+xc8Wu5slUIDMf1tGDD4rLGwHxYKkaXKZNn94o
	w7qP/LVMG4GGqGTL0WbAzDJl0crE9CJR2w0hHL0rfwhVPu7LYd2Gem+7zQy2cu8a5fTvE+onxTz
	Yao5+Z5/gLJaK5P3zFKWxl2rmGlIB5V6IOPj4a8pbpgRUWBztpELzuL290mXtOZc171hLZfJtMn
	L2M5PoHL4jn1AhDT3IuojvJgbvpIRKFAf+Q+Zlp8A0r9nIVW/JuzayDVwFYf+WLaMLdiNeI24zu
	Km8YrYRcn1EVe0v/+9g/1uRQf8zqhEGIdbpAXjfaBfOPAh0LCVGfmT1fZFfNkebRffrD8Lkvgsp
	Q4rLsfofG
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211749385a.10.1790246508902;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211744485a.10.1790246508331;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:52 +0300
Subject: [PATCH v5 36/42] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-36-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP39F7GB+7c8svmghc71rS5Uda+C8iSb7wcby
 e/IIeQU4z+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/QAKCRAbX0TJAJUV
 VrcjD/0Y3Rk5vSg3xycnz8a6iJJCEZWCGxMEGk/RwIXgAtYDv9cS59ip/5zUBB/7Z6Rk4ep1cK8
 662UaUCwF48lNf9kNNra1Iwe/COHkekEGX336WRCY4HHC9Z7EekiS64v+TOc2NJFAQvdfN8ux2t
 97jzej2jsq4vURhfG/5h7nTtmzV7ialMG3Rgxc7G4xb+xGSeNTsyXZuRpaKdb7J7tFqJW1aVRUz
 pZHdCwviRIJe957hSAZGNpvs65LLLFiCxVytzSP0r23e45I7us9rEjW2DiLO7hAw4bA9Xk7II07
 fMD7HyJjOjuEWPPXyUzP11PxKssfOO+k7rMsKIiyV5VovzAH69TNw0r3DvsNc417WDVaU62TqMI
 mQAGYE++WJP2geA3DN/B0GIdCwnO3KbhLiB4isx4/HUiLIrREDAPTy4CiN8qudZF1vuraTOPo2/
 V9o5B60rXtO+9/fUANw7KLVi0t+a01bA5Rhf2sogiUMfZXt7A9jau8pKutlMrR9qYUwAtkux0dz
 bY4QzEpgPXbT/lswyRijn4yOs9BKw1GlK74mpPjV5I56OV4H+OQ8K3NZLKJwosCnlDqpeHAP7DC
 3vLwaNwrBzLO416OXpjk5KbYFk8OVbBrYWmsUDvGlLU08pXwN3CIBAUhA4Ce0jq+15JjcMgTs7P
 jU/YTGzHlNL4XdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2aqyYHowJNnF
 yzlry3Itflw4Iv0+XlUt+9zYBvrfTRZYKyYKqzBbnWGeAWh5ClkDih8/Ougjx7M8kV6aSp8OB10
 hOVGjaR0/fGkbkDrfb3ocTnU7MZsCcl3LFQ6Sr8739aFNU4N4MJsTQDsD0zHGjYmCdhWWsmspZN
 lV1jX+4ssCsh9D+Xz2Nhvfo+3Aus5KgS8gtJCa/APsh63XAmFWPxy592MAHqyxQvrWPDwL+oOZC
 hRY91YWbSDNrAWXVHnUxI6wIKmFCCfJLyog33OHt8JtcNL0qKa2d9sHMpdOG50v+s9V2rqoxEXf
 y/Q7NOQdVFw2F8T4sE5V3o2C7BHMSyZ4e9ZwMqHzzXrHIyHYAZ8sncpTQJq5RuZl22erzd+qoGr
 LRttUXxxn+wm1C3YlN7jTsE7Y27stbG+czJ6wRk+4nVOHMLRoUcU84eWME+ovsqXert0/o9vWde
 mhsCyuyvXbqBi7Gp9PA==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe6d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXycaKbKfeI8QR
 nQxTXPGMMg7BqTMe18CP73ZUJjsrLITNTmLLJVWSiDnd2mQZ3JGzS3/9BH5QYxIkPs/5FslBHH9
 q2TLDutCK8Q4qu5PuKBRFDC6okFvXzo=
X-Proofpoint-GUID: 1EMwI3aiuICiPyXxpBszbElE7nbHHOm6
X-Proofpoint-ORIG-GUID: 1EMwI3aiuICiPyXxpBszbElE7nbHHOm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

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

