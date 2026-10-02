Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211449B5AE
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970298; cv=none; b=QOmyJFHOp6ifSZj+lzsvPw8I3p4VjI/4zW10MJSlEYzcLg1JVBj/hddi9SyNQQVxJvdZlsgna1LH4ZYRjNOLMsua78YxbavVhUA4W0MQpAGNXKIqXIN6ppiX/Ar4K/DAYENIjs1EJtaw1qfjzIk5VgJ56R0nU0OkLYtWOjT14qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970298; c=relaxed/simple;
	bh=m8Wj8IlJfxl/EXgWl7NbfBEc9ZIDALWBiNEWVbi1Ge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY7w+xl2kdvhQxykCWdpwdG7dE3GTezRWLDYGw8oJgLu6aEpZtxEhoei4KaN++gfFS0kxQiEImXo89LzvfO56zN7DZtQ5aUSLEsoImT/jOTWCnPOIJajYP+YvUtXnrrTXwE+UVnICLxNXBOwbAi8dH2656iBNBgWGUNFpQf37xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlZZkxyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPW0OeA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlZZkxyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPW0OeA4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H5vZN3057671
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 19:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQ52WWB9Hex
	EMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=; b=QlZZkxyduIXjC4S3dqAhHARPYcR
	4CcwwhNxQzyw5ngwky/h0j9BSy5uEjlYb1n0VoPAixqk+OEcEWLRcujtUJVIctYo
	TL6h0WgFsUo8Rh4gxwQFldhqis6xTIUMXuIPr/aQQYlcPrPKTdSMni7B9W//8LK6
	Vphwo5OmeAUFq4Zuw/LwUJINhZVsdP89Zc8LycWrssICC6sP+jFDMOUj5FZTcIPn
	Yo43s6MOOK32s9iwfqMXEWTUnuapL+OMpJPbguTT5euoPcPz2ObX/qg3Oq7cwqPn
	Jdcu/Eje/W4YBZIoPC5lMaEAmOnPVWBUAncEaolTc8+eyf05jBRa/hsc78Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp33u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 19:44:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso1435410585a.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970295; x=1791575095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ52WWB9HexEMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=;
        b=CPW0OeA4Mxt0716egBduuFgPhJ8FwwCFJHTCK/dHqeuKhwXc3H7AtcjhlMQpG1aj4+
         OKilMEyn3Hgkb0+W5RIlrdsV/ngDOkhZDHTS+JNHLScN07a2jqa1lovxovKzrmKgvpoM
         Pto3ZYEGVL4GDw/tGKOaLWPkp7KqSfHNoOMt1gS9iyDbH9o2mZxAyMmajcfClSY7BwXk
         y/7/aFOZhfYQ6dCxMMmbSVDOYz7lKirFA4A3yTPlqtRVvfd3pL0qvJrGlvNm/wWmL0P0
         oWq5O27rB3wzZKMAKsztc0CmF4579/gmACVCgnfa/ObQMDm22X3Y6lS8h37D96Ed052w
         7s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970295; x=1791575095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ52WWB9HexEMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=;
        b=QV+sDlSCev3kLfTA6zeUnbMuhHo3ZW4rVmamG9mEb74t0YqVULm9tALe/MvEXERZfy
         4IGFtRBO0j3dsQe7PA/6gn5VhadI+I5azNegR9AzgTyf/jc7obQ6Z252ZLPsP0dacmaE
         WkIlkcqxHij78xSL39JxCMM/xS5ACeZ8BFq6Ruxmfd1WLrBwumCnjW+KQjQTui45ZVqj
         fYzeVaW9Eqfil/hfbeqtitdZZpIT5Fuup5lgcpTLIXLpLbM617cRQ7K0bbQ892LG9kUV
         ekH8NU6nR/8S5ZHCAiukLdPzEItZNPr/yCeA/Rs2yCRYEMDzDMno07dd11gpqDoovVnJ
         NV+g==
X-Forwarded-Encrypted: i=1; AKwUvByHHyT0PeRxEuQxPTc85Y3lxQ8JYUt2mMHRQOcVgkMzddb4aTTBx7zbaTvzF6GeQ80onvozdABPh70=@vger.kernel.org
X-Gm-Message-State: AFuF++kiTNbU79Lb3laTOB6toZB/2ntoRu3ly159g33Q4AB0g7XsE2um
	bjvbEV/QxC1vg8Ia7IK9tGzwlIkXFU/1tOxpkMfReUxMzrE5icKEUeYoNoe6xUvrXNANgCY/t6R
	H/7PE7+X098f8Ux4KMU7XnHLqgd6TcSUr6V+OQEhXbsS5VlqJC8O4VwYlANaXSDM=
X-Gm-Gg: AYBFou0KNWbHghr+ZlJBOnIs5ElkT7o5vd9Mpd92lA8Aaya6K9wybsoNONDAcSr08B+
	llkaWYM2IjwNbk7klqom0yGkyV4hp9ao9ZSxurPDLJq8MnU4cACeEG38aVeHa05ZCqXJPSic8Ed
	9XnIyJxeXVagOo24ckKsZ4dmLc138mJZELQ42KsAirXWsC0DCnTKsA1CviDaFirVlAvW7UGpaIy
	mB+GaP2AF0J7qU3AOWJDWEKqICPasjiGwCLpBqLnmSMAk3DYwzZIQpV7iN6ECzkj4TGWjOHJ2TX
	9Dn8MkNzCOGKgRrV5acNaH4fG3QiUYa0hZc1yypa2PCGbQJ8YiOCJmlaA146cuCoDUU4aylMP5w
	cYNVJLU4cadM6
X-Received: by 2002:a05:620a:4006:b0:93c:7948:6e84 with SMTP id af79cd13be357-93e5109951emr82363585a.52.1790970289622;
        Fri, 02 Oct 2026 12:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:93c:7948:6e84 with SMTP id af79cd13be357-93e5109951emr82354385a.52.1790970288805;
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: Add LPASS AUDIOCC reset controller for Glymur
Date: Fri,  2 Oct 2026 20:44:32 +0100
Message-ID: <20261002194436.1275056-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac009b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qBRHqzP4RUhryo61pfbPnN5ahURGKH-U
X-Proofpoint-ORIG-GUID: qBRHqzP4RUhryo61pfbPnN5ahURGKH-U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX2QEMGLNIht/q
 5aB54qecv3pPn7fGQJd3+5qoqTuQ4VGvqqjuR3aj/Z2ocbk0OwJJghN1JGdx8L2B4PlwtwZ1gnX
 dsXA7QfMoKk/nBK6HHrZDKle6Zitz/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX8DSi82YLqocE
 OSrlRd9sQWjUKWqQSkMuB2X7xuBd+GutjkHXUEdoS/xuDBcEK6/bpgga+vG5m030Wxrsy3jEMhv
 vpZjif1F0X7JNNz3g4ImMAZFBAD1FZovsQigXYhUFZQDJuG/uEHb6G8Mp0VJ8akmGUuZo0QwcLc
 D036xEhxAOALdFH3ZCBjwDLGj6YtsSlNKB2IGvGT+xtbugwjQDT35sWTUWRALr2hb1fkRsmXEb1
 +9dianRkpib2a722T5iVtjaUTIzb8pqFJDP6R8iyGJxvSSBgRxlX5MnMtMuv5PBgtutzeZCGDFx
 lisFXGXyFVJpA8AUvg7GvCp8RK44wFlOctXg2eZdxt4Zwjxa+9WPUHLl2NApIsablqjEIR0ppND
 rjLzGSWmSyPS5vVX7V75jhsPvgoU2fF/19s5gVgXNVbi8PFOwhzqJ6NVqztrJbZd27gIWYWccV/
 OMpNq95oBKm//jdY0QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

