Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527031;
	b=V32g2wvzi0TzeLqzyWV2T4R+2gwlSFddH512+RCOs1hw6wNhePvBnjbgbcelp3oZm2i6
	 qd8vOboMR84Yyok+roC6rvvFlTsR/vVNlw7DgJkUg6WUHBDv3e3Qh5Ym1kRpa4hXvAb6T
	 vM3h4gNtjmex0iG0nJ6370R9Q6U3fGTfpmY0IsTuVDEhmBUCFQGfY6OfO/I5L9eqZv0Tg
	 w3bHsZ3YsFy3Y5vJ73XqvwCmIMWLSjxkSthMbn0aLsOSWlFsF59Jq76fB4sTXbMc51/jY
	 1TWruuCMZKV75LxsatZ5WbKt0wxJndO1KPtxK4CquBU/FFDS2jlWtxw539BxLu1IwgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
	b=WZB6VvGzXQEoC6piG4J0LyJJp8WZKLh9WBhZeICGd7LqUaXzkGZEGjNLATZs12sUqedI
	 LvvG/TghaaYTCEqqaPL7vjKJ7m6V7bnOHSYLF/DxC3dsjCaR9apn38ZUhTy+XoYGGWndE
	 zgB5Zh1AhLkFbiOJIHwhsqUL0zBCWxnBsXVXUx5liLRv6zIqhrjgorF0yK5Wzpxqxp92P
	 OsPCEY5mksN+0CwTc3L3CT84PGiEI5GGoRT/r6XCxENj1CauI99Mda6lrD2iHkO2u1DR8
	 EMjUqp9OQ1wGfhvz+lofGO8d+II6ENKExXb+zYT0uzEp+A/L2bIKUk1bmf2YE4l/0dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es++B80a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpSpjJOe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BD606A32C
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 017BD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es++B80a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpSpjJOe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuibX1291480
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=; b=Es++B80agng9b4xK
	ONkCQxh9pzsx+/pQab8RJwmpKobkSUCgzn1sIKMLspxYqdeT3xQMAsqSj3Ka/BWx
	JOXvxtkCPF63QvyuOTVGhvHWzAgqVK2MX2xak8Zq2VCw6P3N13AoBi0eDVsdGpyz
	mCI6QVNHPKpCzCuk9e0HhY4Y8hwzmLC9JKR+xJL3z1Oz1kWAGevHTT/rJO48fMs1
	9GTxrn+pHirk/9szYcloPhmWwKIxQtL8ihT0GNV8zMr+zlZ7M34bPnzxXwFlDOU7
	3unv2BsoGKxBhB81xpzOwC03sxkbAIbtkk33dk0hKsQeg0N5Y9UGAWpedK/YF/cz
	zK/QUg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbyhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b39978cb4dso11885407b3.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527028; x=1796131828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
        b=dpSpjJOey0Z+wQUUVdfGa/Vyqhj9YxfodK83Dh/xqFTi+f7Q5IYufwM/fBHLA5rgAU
         JDb6cGWVJuE81OYyunvOYH1CrjcAJgpTALRmpNDfgl1DmVSR41WEikS6EqF2tP16o9Vt
         T07ha9xSc8HHWqZrXYhCZRKDrEwQCRVqjbVGxb1nASXov5ag2re9ax+MxwqOOddI2x6E
         SB+X7wRT1rq+HJCT05T5WTH1X6N/rDCHLosWqQIShgWf4h2vPy1QOQLOwM6aKEVG7xHF
         VYB7rRSKRVQ2dR5LbB92QjQ0c5RehrxCkBG4WXzVJkbzOpNEzSawXxIy4Fa5XMruCrTq
         tLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527028; x=1796131828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
        b=WgTZRBN/NCB3LRVn55RsyGunwuk3g4jXe4SsFkxVjeWIQZtr8O5XF6rVtu6WFv7Sxg
         FIv+SKdYM/QYGMYuvjgnozMnVf0FwCqhyQ6LNCm7wmnfrNOFu7iYB607xsPA0dKOwt/k
         jr65EaCwNGPSChZmNw4oonzuyjoD5pzauT6NlTzUktjcR4ZfQQMIrj/juc/DfF4al3b+
         /c8RsPK/NB2FMR6LULjTb8bXtIgpNtxz5nWWSgiEJ79QzjYVEz1Tk6i9VWCtGADt9Xpt
         2QFeqTWL4ut0VhIujybN4XcXvKRoQ/7xExbeaQ+ZQ3tOq5ZShamyG2gQ2PGSFTeqhYAT
         QC1Q==
X-Forwarded-Encrypted: i=1; AL+hErFHa4wRKH5PxdCECSvPJ0vXLyzTHsAJPWbly8490FWjrTRWD9CvjXXzsB2GfxkFnXeY8Nzn18X9z1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9IWMSovYuO35QsuJfm1oMZBoTStLL6ccGcddvtAZZkn/BS/DT
	sbqMHKVYAte60xABViEC6s5BkFlqQT6hnee4Lh/F0rAPerZdubGnLiACjkrFTv4J4F6pWJdrfDK
	5SDVfRqfvUqnNrnyWNzDU4ixIOMp8GK/3bjKpwC8iOnMqICnHGOxTiWG+ysvm2EA=
X-Gm-Gg: AZFdTZct7WXPR/8CT6loMJkLsOUg5OyP3Ssj0tzzvR9qf0C5kP0uSVfU48S0SLOheJ8
	YkyKgLXhQZvuO82Nf03tWCcd97DY5OJUv6XoAL6gJBHUEKnH2Ipp99WD6/nOnqlSuEx+ftSE3Dq
	qGBVFhuK7uKXlki/vFkXYbfLOjzUe0wmnfLzofq5xukg0lZ8qTXV7XP06t6BEiiYPj+RPkGzvkt
	esD/QJUpMl28OReU8HZIkdH3te4QoeAUthDv+t4PT1xwLngHDmVGmWPiQ3bDSNHcflyy5Jn8ecD
	O7hyjZmpQ0lenKe3BnMi8sksYsrZiPI7xQZX2L9LfezzOt0LNlvD3WaYGosOMx2yo/9JbEBbXvw
	WVS/CO9Rwwgfal+KKDOl+0x17INXNU2qiBcS/fUdZkL64bt1F6YAon0fzlDzvAHPxftGM1RIEpy
	JWm2Qzabo=
X-Received: by 2002:a05:690c:a0cb:b0:8b5:136f:220d with SMTP id 00721157ae682-8b52045f53dmr79114907b3.3.1795527028215;
        Tue, 24 Nov 2026 05:30:28 -0800 (PST)
X-Received: by 2002:a05:690c:a0cb:b0:8b5:136f:220d with SMTP id 00721157ae682-8b52045f53dmr79114357b3.3.1795527026873;
        Tue, 24 Nov 2026 05:30:26 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:30:16 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4 MISC
 resets
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-8280_usb4_clks-v1-1-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=1650;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3V1LwUrzFtkyX8gsvhaGuSuz2iOQm/r4ACIfiK+B1oY=;
 b=NX4lpesLNZvAs+Xf+UDl22Mo5N4iMOBqSM8KmDwtc+vwj2rxivqoMW9H1PGp4Wazl0+hH4Y5N
 cu2kme1L4iWBr1TNvuDcKZjJKHNqn4t70iuWHdKILWG+VCpSI5c7YCF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfXy2Jnm1xE7cec
 0bXn2Iav7wb+i4zDLFE/tppxjcjlhgzW5NI9N3AWiGs0xRM1stve/mK6FBFsu//eIiSsWYkAwHp
 mOXkyZPeQnp+rYcx2uy4xUcQNwxBFvs=
X-Proofpoint-ORIG-GUID: alcXq2hnfIv0U6R_NVvrhzNDV_thXAd3
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059175 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EQwe2IC4Xa6s3jYMUEgA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX5XNtQpAcm2h4
 YObxYvT4SGPdphO2bJXpIL9tx+XWudzGnouIZBYnQeTEqoH8BJ8s096lUWkQ+uiOiiNviaYH+ve
 oM86DMiJT2XKNKsDWdiApA5HubDQlr0voCt/SzKGboVhCFljxeAY7Cs+gZA4XhGqbAQV1JgS2/j
 EqHr+gxTf9s2h5/3XMVkmnE32RszfRjvsOSdmBgMba8YQp7D6MCaL05AVidPVbdcJecF+HXSXYA
 cW11jVcIoPsEmZC8xo3iAu3xIQQcmMXDjsiiuVjHlMO68Yjs/gmtAPFjBSRaiDbjMKVUA3BJMrk
 lVDNLHAtLYkQs/ugIdBu26cjC9aqFmtk+mIvKl8j/7tyzoC/0wMnUA7ktJ5mURn+EqVf82Hm9OS
 UsuQBLJoTQYIEklUls4/v0D7c0Fati4KtAnCNW+JUkjOqWBiux7cje1ZMcdZXWalC6o4CT03/i3
 UyKOw8yyWj7BXwc8owg==
X-Proofpoint-GUID: alcXq2hnfIv0U6R_NVvrhzNDV_thXAd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

Some of the USB4 resets were not initially described.
Add indices for them to allow extending the driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index 8454915917849da3498e4f2fcb551d2730b62f42..649c4d841f3c41b6f9dfbceab3ff74b27fd77485 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -478,6 +478,26 @@
 #define GCC_VIDEO_BCR					76
 #define GCC_VIDEO_AXI0_CLK_ARES				77
 #define GCC_VIDEO_AXI1_CLK_ARES				78
+#define GCC_USB4_MISC_USB4_SYS_BCR			79
+#define GCC_USB4_MISC_RX_CLK_0_BCR			80
+#define GCC_USB4_MISC_RX_CLK_1_BCR			81
+#define GCC_USB4_MISC_USB_PIPE_BCR			82
+#define GCC_USB4_MISC_PCIE_PIPE_BCR			83
+#define GCC_USB4_MISC_TMU_BCR				84
+#define GCC_USB4_MISC_SB_IF_BCR				85
+#define GCC_USB4_MISC_HIA_MSTR_BCR			86
+#define GCC_USB4_MISC_AHB_BCR				87
+#define GCC_USB4_MISC_DP_MAX_PCLK_BCR			88
+#define GCC_USB4_1_MISC_USB4_SYS_BCR			89
+#define GCC_USB4_1_MISC_RX_CLK_0_BCR			90
+#define GCC_USB4_1_MISC_RX_CLK_1_BCR			91
+#define GCC_USB4_1_MISC_USB_PIPE_BCR			92
+#define GCC_USB4_1_MISC_PCIE_PIPE_BCR			93
+#define GCC_USB4_1_MISC_TMU_BCR				94
+#define GCC_USB4_1_MISC_SB_IF_BCR			95
+#define GCC_USB4_1_MISC_HIA_MSTR_BCR			96
+#define GCC_USB4_1_MISC_AHB_BCR				97
+#define GCC_USB4_1_MISC_DP_MAX_PCLK_BCR			98
 
 /* GCC GDSCs */
 #define PCIE_0_TUNNEL_GDSC				0

-- 
2.55.0

