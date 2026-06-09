Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABB2367F2E
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019173; cv=none; b=sfluswJw+QXjdVhra1aIebIPJMH1T1CD5IfXeIa49TloNE+AQ9P1bI2tFYWQlm1r9Z71vRsg1dZTbj1pukPvHilJExaR75+yh7k6uJ9Qt411b+yAC6VHzlbS8kYqF7NqLWJ9ey582hGYEO9yOM0LWcvd2f6oQbqY0DSdgKKF/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019173; c=relaxed/simple;
	bh=YtkDqGD6pTPYNLs03sWSOZZV3ZbqbTsOJL3wyJ53BuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PasJZHbnuD9s9Ols1we05Juor+PZuvzl3V0Lk/TNDrN8RNaKbB83+6ekx5EQc6v98KvMnlx4+DGR/X3A7oc3Z9NuWKQFur1ME4hGtsvz4kE9QbPDywOp5827CcDZJW2VCOWecbGl27o4QnrGcGD1dHd6cSBQxhAm6SqO/1EvuVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InrtumcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCkQu6uu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InrtumcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCkQu6uu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaWH2694056
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=; b=InrtumcNAlNEzsq4
	i/jTth7Oreg9fzEbrh478SimQ0wa3xzH0O3TQ+z0qcQ+SY81u8ThnNqJH8pfxdvy
	tSuGdvLIKtvyX79AKEcG7rwxfN3xlo7UAZ1ZWnk2Lgl6sbHnhN9WiPzIf9hO80CM
	qJnpO3XA4A8MF8KmLTPebaaRA2ZaSuLBo5tIklD/XT4QwUqRJ9XWCGo10emzb+8J
	j2XTbI6QZz145F/BHhlQn1oA9rSSfkYzK72IitSvOhaWQtUZ5jVI25Jt58yBi1RB
	3KK7o7XMfNvxHOHvTTjtVt+StECF0khBZ5NLJBMuRK7OLayuvB2NEEMlipMwr8X1
	pD8dVw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1s9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:32:51 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e748b9a930so2204945a34.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019171; x=1781623971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=;
        b=UCkQu6uunas/yWAjIlxG7swE/4Mb5tw4PtjLyLJYziuvpuw4go1sNW/FjdGA2LKvv/
         LjJSu2++j2zoIRxHxbWP/6RL3SVBwuj5DyWWRIzkNgUTR0nAUlHW42YzpYpBjxupF7dI
         5wHJajntJZLBVr0cvV9OpeS8czjOS8Y0j8FxBMxcIkX/2ZR56ASlsCbA4bavw6hn3PX4
         Km0hSusefx1mLyY7o6wxhPQgCDaI4jLfJ+PiRStLa6swoykPI6juVS9GKHfr0aaIaN+l
         aGtmqgcRJmhCPNtUW36F232k4KUYCJ0sKEdyAKShbKC3buGDqGtNX5ryI3Hpay63Jg5r
         cOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019171; x=1781623971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=;
        b=ZoEc8T0j2lua+dVGJKRrowiWNRljAR0OwPKla4WtE80CxOvh2FVkkRYXDUG1Fub5C9
         JgzBJsl9ecKgrc+0tphRxFDjQ+xroodPQTtg0c/LDMGDvO9OfXgse7UVnlPdfaztU0kZ
         iJSgeaBYpzq99jF0yq7XF2D3zcrINrbY85t7SyClTHH9V/KBGwQeAxcOhWXUDYE6rKVu
         8dhj4vtqzMztL0XMPAByxWaqm5gZNksirY9deZN8dYmNiEDEcAxM3xgzTAJWyLQJ5EFy
         mw+Lt/absl8MfH1LmtAmDNsob020IaP/lOaBl0GaErsQq9kSKEhlEZKgAZ81bEtk9Vyr
         cIJw==
X-Forwarded-Encrypted: i=1; AFNElJ9t5omw6cKnq0nkroJpommPHLtSkziyM4pcVnHIkTtxCcJoWg24Ubtv8hJfD86+F73m+7Pwb0OQeO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yYJhSn/x5b8M9f6lG0g3r0jCq+qfWG3QMj3Qk7tttnfVXVju
	160w1x7kpzzIAOKTWEeJXDx9P2xjc3hk9+8wsKxvZGSg15eKP9pZqp6/20kuedbkF3vo2fVhyrh
	sz+UJCVsAV0IcDRsLW7D0xqR1Q1PZcuF7zerqLINGd9npGQT5aaoAxTHnipsCq8FEe2XW/WM=
X-Gm-Gg: Acq92OFTMWoRBf9NmWTsnZok/WdSTVGOsH22c3PpS3GBjo0gSMGghtAZBuP6+exZKZx
	A4TS1GaXLcO49xkHaTs37G3bPPUzdGavJOt0dexXsj8egdgHwaxMW+/RpuXpYp9lP/fnmLcEd3n
	sHXEz9K5WOZPLFqmz2lv5HMacKIyREXR1A7GqGfn/7IS25aIEeftm/GE1SGrgKjW34XSeXgehDV
	uNESNvoh2RTQNnXprQuHLi24uXBYCenCoY/BxiJZqDLesZznjkg46CvSoFfLg8P4Ptb1mz6Ds5r
	XA8J2pD3Xe3YwvCkW3gHJ3ew+ZmmklK5oWKpd3TXyarH7p2ITlb5HLqs/vg/6CMPG/P87LdEPAr
	qmv1HNV3IkP1jsBTi4+eBX3vMyvxBYwCKw59zeQoDocqSwC56fqguqAzH
X-Received: by 2002:a05:6830:34a9:b0:7e6:f362:eadb with SMTP id 46e09a7af769-7e70c686601mr13282231a34.9.1781019170804;
        Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
X-Received: by 2002:a05:6830:34a9:b0:7e6:f362:eadb with SMTP id 46e09a7af769-7e70c686601mr13282184a34.9.1781019170359;
        Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:36 +0200
Subject: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YtkDqGD6pTPYNLs03sWSOZZV3ZbqbTsOJL3wyJ53BuE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIW7zC+FYxgJVwNs9HQTPPnHHlpOlHCcmh6h
 WNNd/OayxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFgAKCRDBN2bmhouD
 1+LPD/4qIVn545TDv/HkING9KBTX4lrvRehwV6UWHWi1HzCMZzxx7WKJMwwFYNCt6sszp3/XZHq
 xa6w2ZVHoTs+2YoGIMQnYNhnjvD95dgPoGiYqhP14llzSkg8PabaBiyDQCtbMmipbS33HKHO1bA
 pzciOAqB/YdUAVOCQNRnHdE5B1v3yp+9/k6oc0QflELucB9YgXwx3zvLf4KocSlvjUgd7141g2L
 becStBzYTYnYrcp9s1i2FHVSw6mRSy04X7ZdOcwTvVVga8Hc4G5v1YsHUBrpIAbJM+ufARJuvB0
 VAXKZ0tbTxQgmTQ/lrLyS42DoMbn4wwB1aSf2dQ+e0C2op4JM2Q2Pm83+/QYJWr2b5lo+AZbw4H
 Iszyk8k6eOwaxPwnmOIeyIo4CSdRiT1T+jrlDxDppdj35HslD6k+JnvA49AIABwwzL6SXt6LV7m
 gUr4iV2tIrsblpwfuLYp7Q4yP8VSZXgktGkb5KMUTPT/3zCOP8vwmp5KInAHxMOynFWjoWwuvqn
 kgZjJJSV9vH2oqGvXSi8+IOGCaed65XCSAf4RtgFLUAYM+uJMFDw8dyGc+LuIi+S9fykVyQgktK
 qVnUusVtQbYQ2sh9vaOW4/oemycEz0Eqg4RHiIIUuYrSG1bDKQ2vjFqVV7VypU3C43riXlgy7eX
 gBOnloTVtWRUhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a283223 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZSuaVHzWtUHH4nz7hFsA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: htgu5pScZ0HX1MuyAoVOvAmjFTgkHF8X
X-Proofpoint-GUID: htgu5pScZ0HX1MuyAoVOvAmjFTgkHF8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX1kt7u5KztzYG
 4Q07ba0LGMCoO4uaAWf/07yO8YKrfplQp0sHq+5JTJXjBAYl2D3zw6S+QjYKD4rXCXz0Mv5ThZz
 f9AU3aWWAZ7yg+vmI6ukXVbQiISCieGo/JQZPq5a6JGupwpicg3iV3RwEkNCZS4xu6EWyGTrxvv
 Ez8JbvbxKuYJUoE9h8p3sHJuGVfesCzMfdRwoII8n9qauDkJJ/y806t0aNNVIv3I0cpm5S62sHc
 oarkoBqAdUf8DfPr+fCW7w0uyMZPckA2vMUuspH9dKKumbnEFGKwmpK6o3TWJbep8ZUq4pulUxX
 NF+qnnPdRVJrXx0QnMPR3B5i/0sdP6g4yZU74sfLzJUdTektJN8kx1BibgIUB0844IFOlyWOhq3
 c7DEWsBVIwNpk3esWhFWieuWw9z/e8WbqDoDCWWTZgwBxPzlgcSp1DfOdpTo+bli+yn9kQeXaVh
 0A29ruZxoqQynqGXZdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147

IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
SDX65, which are 32-bit as well.

Do not allow building them for ARM64 to make built kernels smaller and
user choices easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 799de35c5ee8..3b8768d80d89 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -228,6 +228,7 @@ config QCOM_A53PLL
 
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -374,6 +375,7 @@ config IPQ_CMN_PLL
 
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,

-- 
2.53.0

