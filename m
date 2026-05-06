Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858504968E2
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086295; cv=none; b=CCZWUjFY/AFdCcOaY6cSXyl/ScvlQ0haZ1S7ASnG2fiyEse43Oq7egwTiYn4K0DYfwtqL75vRPcKvmet5c3miLlnxgoYjA1C1BXqGnXgFfjjhiNyyODPssrGI1XL25PdorFipsTj1KSkU1wZOJ4MPx7tKYxOdzsoKavSwfpTHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086295; c=relaxed/simple;
	bh=9nb2DIEgS9/ifsDNV/nljVe+IP9/uJNJciMsi2kStis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NHZsl3yurjD68CjrO9N1khRab3Rpi1FMyw1qyBVVjGEDQ9MMrXwxTadOqJ/QC9cL0yih/cFg3b4DOZeiz1L98k45t8MyhurvrtfuKMbZzGuVLgBOVR8ENGqP2Bb66wwlYs8wDDxHgGPsEXSoYWfR9o0geNLFCvMlvZHo2I09Ndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLbcff8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqmwqOCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLbcff8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqmwqOCU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DsNls2428163
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=; b=TLbcff8b87ai4LlF
	ZukXEO8Z6sCEquzkQMnBtEcTaKLO0CA1SmqiCqF2G+8QpLAqSvLbsHPQHu9sA8m6
	aEZWT5jIVSVmTErptCwFr9BRloUzTW1Ku2yILEVCITTCMEXsq3Lq+rdxoz+oMIBN
	aZGbh9svErduaDVCfR6dmtOMDweI2bIbjDNsmhAfdwfeta78vh4kWidvE7lNv9Tf
	YUQW1aYcMYK58zEpwesYGnGSSbsSTP8HmZmik6ucagp/KgXIznUlmBg4H5+tsCp5
	1qss52avi3ooMP7vHpFfU5eGnpeq4qZe39VAxKaPkdi4PVArEv4W3du9xVXXCMR8
	fWL1rA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph23ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:32 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1270dcd11c1so13522563c88.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086291; x=1778691091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=;
        b=IqmwqOCUFIWakoyPWvCMc2gNVqkGvDXmKDetLAWE+ZOp91ZrS6yFOkYKB86dBGnH7b
         MmTCeC/cLlTy26cp6VCDs1H2T8haIL87hV1PMBLVcpG+CEhrfuOKGI13KyEB15cpOuuV
         qfXzuuzU33ME7LNjdTySBT5DXhlHYnCJwgZWfy0YFsAwQzR0X7K0yeNLUHv6ORUih6Nn
         6+3zM8Mw3H25Qu85qG+OszxtW5B6yyPMhlzw5X43NRh1Wx/1vFC0xJBgiIhxINkV+iXC
         maUMbjTjkaJqS8OirjcyBZ7sthBgJGsDrigBIoPzKU0v2ckjSkbxI3C91BcYSGdvyh6W
         pa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086291; x=1778691091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=;
        b=P3ixqfPm1o0RQ9UPIBwb2TSrf8CSAuV9zVbLcVsUKWL3c9g6Vx5kgV7CxSvzOa1RJ8
         mPF5oHd/pZg4BWGLsGcoIGNrVvak5RRdSHLOK8yCtBhouURoD+AA2oLcfzwg/fG2mpjT
         /wELdS0KCJgn/KAEMGWRswaW+JzplwvkJXrJYjKhxY+eF6dq24szAuj8oQ/7ASEl5nd3
         zrwmVO2fGBtaz40a8Z+KNdo6v9H1xaz7oveudDFZzdAtANLlqD1VYAYjHHNYQt7BoKVz
         yxdvjtjPCK//4PNIpozSkaPe6cQEFOGxpg6QEZim2kxY1ZK+4YjBljRYTClN9P15MvmG
         sNgA==
X-Forwarded-Encrypted: i=1; AFNElJ8yc/0WECVDV+xNqCe8Hg64gpAFj86LTqxH0/KfJEg4spLDK33hoAQhJW7lWTGKGn3EE1pqf8VeMuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoeCEuduwhpznuV4+Hhp1nSA/JzudUX5rzM/pPVOvc8jxCjiWS
	1Gh+cYSuz2RMq1eOT9KaP7Y2u8csEkwPe3FweXGtAo1sx+fXz72lzPRpm+RdCRm+3ew6K6Hk8mN
	cpHhMfxiM0+MTFPPmZMDfg3spto9cWPoppFJKc4eWdFkSGMZPjKU2nfxrFmP/o3Fa90cwqkk=
X-Gm-Gg: AeBDietP/EDvVNAU9OBu/NYzSKWeBdO18bybGbVfljSFJJ7r3J4jlltcsLlllKgTzra
	FCf17PucWQ1hk7ZWdzdw5yj2c6tSsPRzVHqCRCa3mQewOxPw70qXEHOHf9J1r1tYuech75yefbB
	2S0hvQub7/gYgekxqHjVKJPKdokUWinRDOdnnZ5o0GTC7UAq9E8rnQpwXkTak579tvE4ZrmmK4O
	FZWqDohtrdg7u901Kb1jsKubva7/6o+M3+91DnkHEartFrmKwYRuqrRfWmOahFSlKaJDawVtQil
	kF1y4Jb7zyO7fV2tvTSk/Pm5kVtKyIGT3XNS+6qGJ5DtDWZWHrj0FSDVPyNNXKMVMqhdTWJymof
	lCY1gcmu/+P5P2+eUD0yqSQghiWFcTUvPr0m+GNI7GtWYZ50pni/1hr7ATnydsM3VDwKwc/IjDF
	TeHR+HBjbgR1k=
X-Received: by 2002:a05:7022:fa8:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-1319d14d67dmr2296665c88.29.1778086291220;
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
X-Received: by 2002:a05:7022:fa8:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-1319d14d67dmr2296622c88.29.1778086290651;
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:40 -0700
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-1-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=1375;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=9nb2DIEgS9/ifsDNV/nljVe+IP9/uJNJciMsi2kStis=;
 b=cilCmQQeP71NThlAZoUGUm6R2LgngpsgVb/+EOZgaxEDE+wtaaLqw72LPz7peLPIP2VE/u7I4
 5pCYIaUFnmwCksuaZk0YEKVb0SlvaUqqliGwBGfBQQhlm8xxzvHu1gx
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX4gWa6DejqC72
 Ec2tUOmgzGh/fslEMovI2JeB1gs2HLskt4LWGeyp1tM+63jAokf4tJnHrVNluxBWvvtvGxXB26t
 woIqZkwEHGb+88GW6IXQXV4L9HgPOg+eatbwdguyE7TuMhL3z8VmZc3AVEQGo3BB3EnusOCQaM7
 0mq3b0DO+yFu06Cvt1C/BKMkFqpHdqujLiSrygHdKmHBHfcEwTrt6MzSkr2LsdVjlsgf67A29Ow
 r57PBmcSloWoZqB14gVJ34bP/LNjuSQfoDS936v6Q5AMh5zFPZbT/p0Lema4EKnqhtNityyw+oY
 WELHHHeZ+s5xNACrFPEnMP2C1dtb3OOn+vCJC6dXg2b5xJIeN9DknC/8sQHz1jWRCZDgwez4s0f
 o/UgAEMrsaxvBwdHPmgKtlZKA0VEl5kxGlK9dLJehml2NSrOscXU9Yo6ZsjJUavPMeGA3Knwgyi
 ycy+KoK7ERIKWG0B+QQ==
X-Proofpoint-GUID: ZswAfhdYmxkeRv324iu4FQHQv9gNamfG
X-Proofpoint-ORIG-GUID: ZswAfhdYmxkeRv324iu4FQHQv9gNamfG
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb7194 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Update documentation for the RPMH clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a2c404a57981..d344b3386042 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
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

