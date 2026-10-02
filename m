Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3749C4CC
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970293; cv=none; b=UNtqRF87bF8+3j810KRHWyJyAa/uIaVzEDqwL4mH5BBi1k8+yQ1kyxPOKXGI4c3SViSI3orF8ZJzGRYMr535L0bAvLIxij6KqpPzF3MsGogf4jnqRKgToSdIkurPBNzhrIibTSrkvj6GVoMjVuv/tIVwvRm9gmPMe/CKGx7ESRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970293; c=relaxed/simple;
	bh=L7Tyy9efQHGLlCDc8jRrhwb1lQWE6N58RL1qXGIOElg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8DGJPwAva1JJIsE+2kKhHj7lbvcnn/tML1fEa/H2tL/KRa8XGdiY2R8UvwADgoY6p4n41rz84lu8bPaxpX/rFD83vbGvr4ytRvUmK6xyIpvyspCxy1Fgtb4UIESmEb5FO42iwfIdAhOqWEQQPl20G13gppLr3ZtFmJZS36YaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4cqpzJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMTCcVBv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4cqpzJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMTCcVBv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H5ws31277964
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 19:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J32YgxFLTOq
	eInF4VnyIQBigrPxSypBHrP5/gix5Huo=; b=g4cqpzJjiD72Rok03WOV+u+AJDp
	jEeX7QPnuemuLqhSI1G4XGna1CF6cvm2alMxw41PNQb5euECcKFs8aPx1PM572cY
	+wPWFPG1/F9UFy86+feFacSgKbeTvup/pCJUoWRmz0OpkDarFB3mPRgWai/m4mn4
	+ydnA2Jy33Xv6ITRP6z5CgLplB1dYZ57UGL08kkyQHLgM4TDA0CuMQ8T60haDcb9
	0xQBxHJ6ijkygSMKHIKeA5wzRs3CvXU37u2AiXM2z273m0hsJNgxgT58Od4A1JR0
	0/TvHvtrA1WqU8rF15repSIH4rVYMoPaZ/5ggfyFYPfmItxazbuq0Rf7ifA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdhed4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 19:44:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91955da65a2so3576126d6.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970291; x=1791575091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J32YgxFLTOqeInF4VnyIQBigrPxSypBHrP5/gix5Huo=;
        b=UMTCcVBv+tTj2Iue9xS1gFMi0J5C+rZb7QtVjpgjSsjqB6Quxk2G1dFIhTDHJuu3NB
         EhN6gTKVLQxkZXd8ypbnYik3/Ld+dKj+UaXezU5b7JZQCwZi43gb7WxmbSABILeRM05q
         gYOnE37rL988BdtCdzq/mimrYy1jtOsPwxuODCjb8ZEnF0sC55UW18Uolp4l0WoyFVZd
         65nCicmqDUqB5S9OcLRz0/wN7pDBcHGXzPYhSUobjn0k9QPCsnk5wKwCcoziCNK3Orsj
         NpNfEYCmitTyuel2znl2vYR2U3JxSTLOlPzSjfk02nCd/R4AiRlXUGzUzutzk450jzXv
         RCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970291; x=1791575091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J32YgxFLTOqeInF4VnyIQBigrPxSypBHrP5/gix5Huo=;
        b=TC7Jp7Zx0lI4z4W1AVTTsMjviK2xUi6wa905/pqHml7WJu1UaDj1DL1+ayK96MBDwF
         bCi7poSBasKX0tlAiyb1bilqto5pGqkfy1SBOGmCpmUfyYYfKOlsknVtUvpbHoKXkwn7
         YFViJvtPorFvXEASWwG/zMIaf0B6pZFN41M6LoYDCnq0KYKNDWh2fowaA9Mw7lmBwrw9
         ou5ULHdeg4WfP3J1hf8FtybwLfbAQLKz6TdU8gsqrqKchwjjQEh2hyC/EU4+TlTpjjqn
         QfsUhPMj7cNdr+70hkMJblFyoaMb17sarafIK7InhfhrhlQ5+lvddFUim5rN544pTSLw
         gYPw==
X-Forwarded-Encrypted: i=1; AKwUvBw/H6jILPv0c7vtZXFKbpmyR6VpXKz05TgC6QrQcMEnnexN+Op8glhruyzhGaUoO6V3Hlfbp5Mt6QI=@vger.kernel.org
X-Gm-Message-State: AFuF++n6haVHLMWhtQv9Qtcj0veEuhLdTfP1bAKEOWjj5tsIDBQc3B8J
	a+QoptVw/caXPTjDHftSMhQWDEA8xcADfrMnXMhVw8/YoWJIdXlj6/E2aDjlktXHtlLFg2ON4g5
	Yj4yj57meNsTO/KAMM1rI8FkLYUALs5MmBil1w6+woGkzg7kMHCTdQF+ps8p6Mac=
X-Gm-Gg: AYBFou14a0lr9Blj8KtMEvOsGnWz7eG4YUM4I7ULM/XPvNroamnkJF9anBMGTW4njzs
	YDOl/+HpjAlDAXWffcw2MWUPi3ihzclfGRjUgGHoHcKjeyyg3wDy7sCODyR+lGhQ058uqqR1gRm
	LQZTnhkk2U5v4ZYMOqISvNgIgtufhoW+se7UbUvHIK7FYglkFvNToQvc/K2HprsXbZzX6OwwBdw
	os92Bf8W5PVUYPC3DRhkhUWcdAhGtank/PKkmrzr2YlWRKivPi1NuXOUceRA25z/esqYoY1XloY
	dM3h1u6Htk1LvH5AUXuf3IPcPot+SQgL5OHdlx686HrZWXUMQfcsprgJ5mioGnIgUR/9PXT8e3o
	SuKk6AjmZfOPO
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr82721085a.30.1790970290768;
        Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr82716185a.30.1790970290257;
        Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller for Glymur
Date: Fri,  2 Oct 2026 20:44:33 +0100
Message-ID: <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX8uVkqdKAojFA
 49+LFEWapCZQM7KUMRhwbMd3BLPvcETOfQxEmLVgJryW7wwTjj5jkLfy+rDmDKxBWu845tLvue6
 SvTiUQYFOws5BjIfjuydwM1SOAEIqCY=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac009b3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=uR8O5Y6ZOet9NXHzM84A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: K3R9GVZuwuzWx11eeniCPKE-vtWuD-IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX5nfM4/cBouIw
 rK4bnrImruc2olmeh1KVEg4wrWaU+NTNRafOmJjofgSpTTrZAebOoet0KbCRS1XQj/lZzS3Qy04
 ztihpIB18ejHj8Ttk/ARf9pNBCgBfIMeskagcG/mZi8tcrrkl0pgPY+MRXp93KPDZ/pTus9BO7K
 /pg2vFUvuX69vRHIZz03TRp+Gh6lZQypPJLOH9qjLPHoJU3OaLyU6g2zCD9Qzqgz0YrYp8eOT4N
 jQXImcVp5HVGK6AaDKDIyQh4gqNe39JoD62q0x8tfVLnJgee1Qt8muaPJnr1Ncj/GEvaKQmrxGo
 zr5fQ8FXXJwh+8VZi2K2tjYZyCooqfMZMtV7hcDyosi/iw4RI3KLgdXDXEg3aTDWgZNK1B37vr+
 QV90rmgNGouUlSidXf7UuvIjn2JL3T9mIShJAihICfSAKu7WOE1fHXUEAU5PywQtc/kYpXY2Qxg
 rrS9ABqJO9Hqyd4vfdQ==
X-Proofpoint-GUID: K3R9GVZuwuzWx11eeniCPKE-vtWuD-IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
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

