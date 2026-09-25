Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCB3D9DC1
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326019; cv=none; b=Afoue3jNR3hZQWyIqDRWb1b67po1EJxIvfsPPxx/qbFfq6/5sq4MLp72g/bDRLN2oVCkIe29UIjYDCIsCBBWeqH1Rtzg0nVhyuIEOoU48aR7Dg4nTCyoSUrt3ccXwWQtdvyECUi0aEMniT/DHY1S3UfNpWfPMXuwtJu/UjLshbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326019; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxAg0BRnuG810uw+BM8no3WacI3lf3/afA6F/RjUdwmjtmf85rL4zkZGsDL6UN2jx3U1Unf6Zlyp+ZV5M1509IccVzb1uXj3OT4TI+u/g7GPwxLQognr6plevHb2klerKTpwPZ5Sxy6ACfqkarmg//5r7p/nM2/kFODb5EGZyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFHOJl2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDeAik7X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFHOJl2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDeAik7X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YU0R039587
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=PFHOJl2V/odJamvHBpH1T7DAnCR
	njI9P+boHnY4U97nX0M8nvxKn0adteUOFi6vj4/8grFJAK0nuGbV/fPwJ9AJbUBI
	fQ7teuc1H2mFSEaWZEr8Grzy4VlUbJ8fvZWSeMTArv4lJRnFB7hcfpNTxsNrbAQq
	PSCtqxuvpKeNfzdB8p4FHalUsYMdwKzlI20ruUtxEiL7nM17qACakzHJfyl1eXoJ
	Vsk1rvGPWttafIU3ZoTha3/Vrfh8JrloMpkFqHJKmTGqVUP66g8hRdSSUk5stayR
	kw0bt137xQo/HL16SXVDb4KTJvIMpLNBWOheYCEUjl+24faORc/T1U76Tzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4653xcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so103669785a.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326010; x=1790930810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=SDeAik7XQ6aBAGo4w4wldCYpvKPp9u2ALEZ8vBMT2BjnoNfsT055aPvpY5ddRWyfjL
         J9I3J2ZGbY5XaKrQTPieUgr0U7GTvtqgkbGnbRp5+XDeofa81Txfuu0XWgqim4e+p8wE
         lhd7uHQtadsGRjlWz35wwcWRI/+6kPNPMArDbD17kr/2PnuG2FgIcr23c8EnMXhtYeU3
         YOC1E1WXvl0OjkyWVNe/82GyZ/1vO2mZSoo3Yj/EL0p2I5vuawEPWm8933ujTyJcJic6
         SL/5f9yQCVa7/qJNMrNWcWdpjy0IFJHajw/UxkPaHuJJb/R97S6izclrngnAwA2Y1ZDh
         YKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326010; x=1790930810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=d3s4aNankOS72wFCy5DkanrjxdurpMHd8ls0Z/ItTM2oL1wWupPU9HGs+G9Y85a81I
         ZrK0rF+ygiG5F/jBscqNEXZrMmDOitKGoL7lQ9ejO/DFDcEF4/sKRgT5oVsF8E0Ve5NI
         1eHsBC4SPxoYwXH439Lmxs7rcqn4Sf2hoM7ZounMXsxG4KvUGN+bl6zngPxMyO5Z+tOA
         tf3jQexBzO5kKNBjquUkOM8fJOCyN86FIQExivCfXuvZDbF7BSy3AG9sUvErLYclfONi
         h0K2XYUFVsB9tV9mqYDtutzQ3ZNM0BzeDvO3uvlbBTeQ7DDEQKnc8qANX3rF6/+rjZJA
         0yGg==
X-Forwarded-Encrypted: i=1; AKwUvBwJwBOVLD90/98TS8qwZ+BCairrjrs8EOSTx61eXtkmO4K2yHY11no7PVCySmrKgAGynQC3Y8Enrhw=@vger.kernel.org
X-Gm-Message-State: AFuF++mP6pcaVXJPPyXNlQqICTxtkIQ5DlJ6v+RwoKA9lz4CLW/aSZHK
	ouWOJNPn0iZbTmXjNu9mOkCBPuBMEwVNtyNiiqOkd1P1bo4HYGpNjkkY6Ee8HAkMkzc5d2Mpf44
	5Aptk+zdmgflDqBj6KYI8iTwU0Scw9z+pf50WazzvOwI0jEkS4TpLiHjTw2Lhk7c=
X-Gm-Gg: AYBFou0goCEumkU9R2chZIxBN7QnAJ0oXC3AU1k7ulNm3yrJo14X1b9ycL2fps9ln1I
	BbMjM5C6a92zH7Vy+qmx9tIOHef6GGZs2bozeXeeLjwzmvwOXgB8BRf9vwFlrxx2kR2vehJKlBr
	EOBrwrLFYkxs+Xy/bq1uBzI3tGwb19ICyWASPUZrdPjbIvC1d+FmsKg3KNiWzIlpkIVThJr3OCy
	SnvW5zfCz7GDuZ/69kAqawN3pOa0JIsAdo21PwNFWaLylb+nk8QDUHLD0bn+lPIg5NwUhLLgD8E
	ofvqHyvQCG+9duyQDgtEvugZYGdvy12Q66ng9ezSYx8srKKlG8GNbo9wmrLh9snDDKiXV2rHW9L
	yGA3hj0Z/6R+v
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320421285a.61.1790326009878;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320418385a.61.1790326009352;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:33 +0100
Message-ID: <20260925084635.112399-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab634fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Mk8flyueb5pbPqpvaCsORPmoYIxDSGFx
X-Proofpoint-GUID: Mk8flyueb5pbPqpvaCsORPmoYIxDSGFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX0ivrCRSz8Jc5
 sFSpq2r1yWSlXwFI0bN1XQdiaChau5Ve3/eaTH8yZGAtUQ1PjktFjxzxwdoyhqjCiq+QEUaUe8e
 s4zfv22QJ10HgRwPxZLGScOg4rb+rFTeXs1oK41vztdKdd1P4twpwjFRU0nrejLn17/VOMRlaam
 gyc3ItCWBTAALp5HkjuA2OnJxc2KSc7HSYQS8thFy/o4ZzD6n1Y4X34wSXbcSeDiOp1UN6qjoJq
 viMujmrhz9l5wf1RrjEiAkoUNMletcgOw7np86DV9hgHWTookRJoiuDPHnV/Mqcb9hmB/9zxCLV
 ruxgbAH9f5Mr/dKHRRKMaWiC43toQ6zAqe3YmLkNZaF0+dK+t7L1kDvZkzB72OvbhN0yO+jDpZc
 S+oBh8C0vpifNHzGva8MF6wgoK4HU5GApVHhXrHCJSD69HTmeX+IOuufMnfBb3JfXdMTxReEBaz
 KzwcMQFX8QyjKiZcB3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX7fheYf3yp91D
 cdextUOC+rYxHfoh66eIgDUZmp4hSixkwu0sOslgeQKcF5JLRsAb00uvqkeYdBGk5Pt6wOAdiT4
 JGzCSA8AFBrvg5ZdOnHKVQiR7UKfNbI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

