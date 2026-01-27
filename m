Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567CD36D4F1
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542018; cv=none; b=e29RvMk5AB2FGO3LHF5ufvNazFU4Qfmt2i8cCXiwTfsEKC4Xy7bJUkFKBPzusSAPntNNVVStZfr51oKm4i0zt5apnMOllktr+We8hrTc9F23VATml0PPgTQ80vTBCKpYR+tIQZhxZ+4MjVI4u/YvVQ5FIULvG+ZrYEEsrqBZK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542018; c=relaxed/simple;
	bh=Mu/RHqw+ql3i/4FBQatjVweusbMhx918FTz794GaILc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZ6l9kYdFDkzTBGicBxCPG2mBb6/O20ZM2+H3LuxLNomomaS+lcmNNXQUomQb34JItRyyaE3bC+Rxa/ccKZPKQaF/YcM46G3WPLwAukApnGPVP/N7DT0zODUpfhMSippNuLoPJgC+/FBU+IYv2q9WoOcJDTrOUfjWtBOcXc1NOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVjWQJXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9kwlT6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVjWQJXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9kwlT6F"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFMiG8623368
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6jxKvMra7Db1CD3KXCzTW7lxgwW9m7N4FZnaa2KogA=; b=WVjWQJXocvsxY75m
	74ui7MGzG1TFn18XbwU6WnGhjg/CuZ4qSPPr9VAckBITMsPyoBlPuSdZQSl7Ezeq
	bdQz/E/6Z1H8BHzG4ak6w1j54KLCjxN7UaDYtAIp3YnY3yiDKhedA2JJG/79DP4c
	vGxB29HbDiVohBqpWhYvLiNg0562Vd/RNxZz9YCoxqLyEFr+U9nWznig82d78b9F
	YVQhc+pe/qexh/GXlLUvtf0ucx6qIrFkK6egoX/hBclTcMlOJAhwprO4N+Xf14uA
	LvnR5uUwTsCsri37LMFAnn+KiRdhhPMDjfE31ioASVZSWJFj0R3cGiy2zVMCnhyq
	C62ikg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjej91d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a773db3803so53970595ad.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542014; x=1770146814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6jxKvMra7Db1CD3KXCzTW7lxgwW9m7N4FZnaa2KogA=;
        b=F9kwlT6FeuwCWrtbxcltDGo7S53Gl1IXQn/XEwEQaLTbT8cuFx+30XQrEvNTO1h/gw
         b74pjBoVm9izINQe1zpCRWfhriXt6ekl/AvGOrUom20haNnWFmBGnACtrC8j5LXyJ7wV
         PrRLey3sqFBnWxpUnWD+5FgGYvKN9Uw94ojHXEsW3ef2IzgpRbF+/tMXkln5gP9+guZM
         Dqom3QeMrbcd92o6U9NTZA1e2h1fa86iXFmVCMeV7hFKUVYpKFyFhkugvID7mPxJBI2U
         bD55/9pP+z13smR+DCKwqCsqObEInHrrQicvQdbQjQiPRnduTNp9ooMOcpaoXa+8TFKA
         zxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542014; x=1770146814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M6jxKvMra7Db1CD3KXCzTW7lxgwW9m7N4FZnaa2KogA=;
        b=RnOPdURT1t4XxAH3/LPeFO6RXgU2yIlAp7HxASvKYTei8++a9co7cZeMz2qn/lshBV
         e18Sw7tVXWkMJwbtUUTHA50BpxdnmxcIlKtuN1IdpMkmSd6CFs0PtVpTWLwtUmkreh1w
         7VJWSDoBPX8sEz/K7AOTWkI3iN0FFqhUh+pqp23yyESLBCxsy5/+t4KugLlJbsvkE4wV
         3zvjXwh8h6D5TeZM+ZLLNnMJWKYGwLc311M4/r/GX35cLmGhEXsJ2mq5j7pa7tLY+yxs
         tz8ki4s514zjPtlM+N7LAtqYBjICVEY1Jjm2ANO5M9I7FsfsNcEGex49wxH8nCLYRZQ1
         yanQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOLWu/WyFzg6BEyQKWAcyn0A42RmMd008Bu5QPfxm5deiRFW/WG4wR1kqgB8AvSAIm2vpooACJiiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6UQFz4SN0kKayQ7hFjogVeyevUijKqW4XPa5o5l+Hi9jHjSA
	RwRoN5IOnzEGRjzbcJz9baZiCWxBr28f4uDmn/7BvQY4I8QUb24eOyU0jTKwhW4PiFpVot+3OUd
	JigDb4CkgyB/96YDDLQ3tLE2I6bA7GclwICZ7CpYotaoE4mywdRE4xJAnWq+K4FM=
X-Gm-Gg: AZuq6aLD3ZEB2s/zXMDZSkj/eWVmCshx6ktHXAsNSWkHu3BTOb1bnjT/kGleZIe6AEx
	NOmXAA1r2mtgyMP0xeiTbQNLu8/kesNgyidEHpGUlj7DzoKKeXaREv9w3Bv39UzWzWHKOvCpfqZ
	jgCYnGreyPlWsAm09pKByNWJ4jg/O1qsq61KR5dEuGD5TCKEgI9SK8rTtELFR46MJvZFt+nMKmN
	m46moLm04Q9QLUT+JNkCUIaHGaCcjs4mvCtsfX8FA6zy24ARaVr08n59/ptxQF1RKoSp8bc3Ykn
	gGQCP5XEQz70OB3JOdOkOTYxLCddZZOUVc9PHI1v/BZx8SdwxIpTTWXeU1Nj10jJ1yW/MiHL+1J
	QAoBzZJ+XfzsJ+D8RHtWKd6y/CDjkw58wTXR/uAFL
X-Received: by 2002:a17:903:2c07:b0:29f:1fad:8e50 with SMTP id d9443c01a7336-2a870d58d80mr24368435ad.3.1769542014132;
        Tue, 27 Jan 2026 11:26:54 -0800 (PST)
X-Received: by 2002:a17:903:2c07:b0:29f:1fad:8e50 with SMTP id d9443c01a7336-2a870d58d80mr24368215ad.3.1769542013482;
        Tue, 27 Jan 2026 11:26:53 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:26:53 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:33 +0530
Subject: [PATCH 2/8] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-2-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfXyhYGp8kpTVsN
 GXnil31C0w4GD6bD/U5PAM5NOCmNReOy5k2BoUUIvMwuQRyAcDHr09xlInTxp3AviVpZ/UIOo1J
 gr/WMdpD1CprArIFM8U0jycFXAAqI5iOgv+98oLFXc7vFhwLB6s9AA+DsoUGowGhvN5Ro+6xuDs
 AtNkLK4+cnAw+Zxa8DhjNY6SHw0xGDb+k4qTG/TnwUlI+LnGKnsjg7LFoE+uglMx/B3lTGR+ohZ
 uMRZ8PsGOYXxzaTs+7V6reJCpK/2JcwEZE4HUbneQ5OXk4I2X8dQW6ZbEIOMKTP31Wn5MVoxEfJ
 OMwbCwuZM5hO/iaW/3c8RRWE6dRc99ZoO509AyJwEXqaPMOrjRmHeWzwdr8uQZWZ9sD1QeTvIpf
 e8iFQ0edbLSBE2rmHTjohQiYg09KT5K/d3vfsyEO0ECa1+ygHaM+FqkxQKleIY4Wf/ykrTb/RiC
 0gjGh8z9kxGKXuGqDyw==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6979117f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Hhs3P2VpRmyZLkLmrdaS4TT9cUBctNsv
X-Proofpoint-GUID: Hhs3P2VpRmyZLkLmrdaS4TT9cUBctNsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both
X1E80100 and X1P42100 platforms.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1

