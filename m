Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075627FD49
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917315; cv=none; b=HOT9033zz7g/7qjVrsvOShXaS7GkfWGwD1CevtOLPxyOGoTa+R/KbKHxVBYxxiupx712frKQbBgm8ItifFPl749a5RtQ3/3hFKYjST1xJH2PbajLPhzfp4wFQoFOS79uPQX+1QaJFCpOTKxn5xfOWw0p8n79RlVYNpfcfCw3D4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917315; c=relaxed/simple;
	bh=NuyQAHxJ7FVYTy8chsueku004pgRLlFSwmWyBpbn+Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7znffxwBh6wG2IxwQqBkVZtvMrhuZqmR6L8qLKlVcxXlCG0rZkQEybE1Z469TigQ6ewKHF4Wa875j+Zl+kfN7eqvUfCwwYaVymwnsCMKEqTpw+l6VH4ZN2rgLw5zHloj+bjtDTC0js0YgbVCw8VwAwI5lY3uwezsTbchQT/c8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyk+194t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXRPcA0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyk+194t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXRPcA0v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGtq1X4013639
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTkBt3+uyjXrQqC62M4i2BlypS4CIigIokuIjFRzDvY=; b=dyk+194tnB1nRJix
	bm8GhYsQwCh3JE5SKQ/HjCVKS6XMeiUz3/8Ztt9hyevhXOaTaK61vTwqJKw+thaT
	kYi2k4NA7Z5bp9OffQsOt/ObkO0jhBBVEWKGeUVYPOUDo7bgR5n4spP97NPhKZAz
	MGR5es9CH8G5KeriFB3YX63s2o0sMhvmtJEJrOKy46ML0cbJvj2wNwCPDDOLfbIL
	Jt4k5Z8WTiDpWDSjN87kmmPy42J7MXiB9JHC9byY3YjuL2UDWjvQNhzTAw63xrJo
	4h2JaNBnTH20HTLTna8ey9riiIUIAvcvNkvO3456XcdC+0e8eji/xOQaawGZlbt3
	y6arxg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regtqn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so3920964eec.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917312; x=1775522112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTkBt3+uyjXrQqC62M4i2BlypS4CIigIokuIjFRzDvY=;
        b=fXRPcA0vnvliNXGj4JeoSkFl2UI/3LSrH3xnxxgBqCpAynv2tM9yl7O3ZxYqSHxdIs
         eVPoBy59D5RrM7MAEj7fMM3BKfSpBIvjwrtilrnBv3TeUEorP/V6x0vdXQX3mJrvywwn
         tkpYQAC2LnpqVrKMISsD5vGQQRhB2GZbgwBZRVEecah3l78MDoa6hzBfJswDhLUg21sT
         U6gU53tircY3nS0pwhHeUKg4n9Z4RbDzHrf5Fsoy++LiZvdyQMLlrs2WJS2BjQRCmIOf
         s/sHAa2SF7knYvU+94qHoQaG+ZAITb+gvHZTEfSdN+krr2t2jWNSiwXUGnGbr54Pu8Cf
         e2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917312; x=1775522112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTkBt3+uyjXrQqC62M4i2BlypS4CIigIokuIjFRzDvY=;
        b=htSegMM8ALeyiGicb3nM5IcXvpm1gDlDxpvzsMArZ8xbeKSUp+yhrmLD20WAvLWv0d
         Rq46N9fnP/iDmd0h+Kfz0CLa9VZrq4slVa3Vr9WRDVGwIfiraAe24TKj9vHAhBJkmSbN
         hmXdQ4gvZCkL3yqY+2R4Rm79FRrWbQ41Yjz8z/3QLlEBZOWFLotGQcnsZQ6QyaXYi3Tz
         l+QT8C3Nm2DQk5UaXfI8jv1MS8HZlqwu6wImSw6SE/cAEDIVTsWpAI+LxRi6LGnJ1dHG
         wmPp9QeKbSNWx+U5hxOu+pwQWTrZbKLPVSuR1NP4dmcmUOh8BnzH1OEi2laoDXRCpJHh
         lAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaQLRuxHPpKsae+1RvjBEm8ifeKTuemJiP6nfOJL/zi3vj0v8n5h61FEaZj0vOzCq07TZEaqX7uIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NksgnT/ZKwhMgkBOe17hPOu2WL5KDv9xXebs5U0POEHKspuS
	5rm2fX8aSCUe49/LG7gAJwuYetOd3rFLCd6BVVtxF5ToECnrLNyGoZDeFOzhMvv19Czt4H+B1tW
	0RWciS5FS1Nf97eAB9Y0nLqlKN7jVgIRkV40TQu3IHyPEkf+LTIkY9lZe/5sdGok=
X-Gm-Gg: ATEYQzxH259/WN/c/fSYdXgJO1hu7b+90wmXCy2nsBpx0dTPjsRz3tlJz/kC0AhhP75
	0PWhQerKhdhMr15+vcIIcHFDGz+jY9sB53q4l4t+oSwH3/gaNHSuFfYEeDdLpQzp/79VrSn/fru
	OmTLGu5ulZDS393gdaSuy5NbHkhG/+0Ot1FyAY9t/yZDG4GSO9iqof70SBpvK7EVkjuJA68wtk1
	E3KfbOYPE0r8F3RUogqT9mIBSMKB1Mit1nKxpnK+B35gv4VXozFqz0jOF6Lsv1CO+Iok/rpYPHk
	hyBdc1+snjQuMGHJEZubqnwZgDboDIuTAS44CKrja/tadLQZnBAtq2GIvpnmBl4aHdAl07+RDgN
	nm1bv/zPNiL5OjBCs5jrDr96lnRfoMnPCdhMSTyyPlb9uio6J7g/+nJNA9U6UhcYBhMVi68s7Cv
	FP
X-Received: by 2002:a05:7301:fa0a:b0:2c6:9dbc:c0ac with SMTP id 5a478bee46e88-2c7bae4f8b9mr812756eec.3.1774917312466;
        Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0a:b0:2c6:9dbc:c0ac with SMTP id 5a478bee46e88-2c7bae4f8b9mr812741eec.3.1774917311936;
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:34:56 -0700
Subject: [PATCH 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings
 for Hawi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-1-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=1263;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=NuyQAHxJ7FVYTy8chsueku004pgRLlFSwmWyBpbn+Fw=;
 b=N/dBcboAnyP/dMlu7cGvsNPBsgLxfFaExnmxF0X/GdN4B8cl5833mfMAWvHT8NbrAJ9u8FGXk
 UGg4jG1R7GzBpiADMhrq91nqb11ImIT3clrbb7hSClwPbhKcR09xmRu
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb16c1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX9VnVAWDIFFON
 CUhMmMq6tjmABH/HfjOtRdqNi+hMFizuCFsRg2cHI+MGUerehNuHcY/A0BoKKo+KQSa7XuVJXqI
 QJGE93oBWDsW1/gUyzc7d8YIRGI6K+IZRRwmOWK+kURAEtUl6AX6io1ItriQSKbIVHkFO0MDmih
 IB8c5txTn4xh4BRFRyAVfLIHjNdt5B0GLPvL3duTHCzYMw7B+4d723dvX8H6nOD4FTrGgxrL0js
 7BgUG8Ec6zeIi2JC1E9B3CwRA6gvwMw7ThliQWclkz6NpiE9Ql8rbX6xfXejmeV58X4MnY1L0vR
 XDB1/vrFI0W+xUo4N+PXLi0XFIt7SRWUn4yIuvlmWo9eU3E3AeSQsKHJ4Pwm02p7LV5hZ6gRV+w
 gd9GuoRhj/v2Eb47eonA8/BCAY7oszmD7bvuNWgHd1wgH+g/Omf7XZyr1lEuibV1UUWYai1s2Fw
 joS8CmFQuLPVRMcmxCA==
X-Proofpoint-ORIG-GUID: oMxLm6MnicI1rJ26C_w_ebBb9XykNEd_
X-Proofpoint-GUID: oMxLm6MnicI1rJ26C_w_ebBb9XykNEd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Update documentation for the RPMH clock controller on the Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa46..3d5a4d3cb00f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..2d62d5d0b08d 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_LN_BB_CLK4				27
+#define RPMH_LN_BB_CLK4_A			28
 
 #endif

-- 
2.34.1

