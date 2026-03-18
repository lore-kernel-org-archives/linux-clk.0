Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99ED3BF680
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832142; cv=none; b=dIVYkVXVs6eyiC+Pq23b9PJpj8+YXg/7ScknbE2ifE4qwh05k9FMwdfjp4zD1jtgK/1FLTAQZDjiLAp5M34NxksKhcJxRkpZ2LRSSq3ZhJq6QZ66pUzAQK7XRkHdZZgKaMSYVBN/m+UZHlXJ/OM14fZGEeJSRkE3tESfaiYR48k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832142; c=relaxed/simple;
	bh=7vmfmVTf1sjmsQtQiKvutgOgGxTZ7kdgXKEyXYC7s4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZyYjo6Yb4qmuotCaucZt++S29iT3OsH9pAXtN8AgW4cJ/eiRoT72u77N7J4Qj+t5W9qaDtSElAZofrfARZu74rF2wBaicdKNNV3UaLTOrjQX5kMhg6YlhEGYMNGW35Bftcz7QUulwsZA8QigoswlBDqApBrak1Idw92fwM+Eb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIbYs81e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUz0jzs+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIbYs81e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUz0jzs+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi4LP008780
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=; b=mIbYs81ep9WbbYOQ
	BapTIaBpEriJEWLwOZA3uIVP3HQYcHf3MkPRDl4rN+Exk8zf8Cc4I6bnKp6pb8ZX
	U5cafXU8ZLCz4aRjq+tm9GH1FqbPVpvmtheFaM1biNipilrrVuhSP17kOSUCM1pf
	n4Pwr88Y6HvJQhe92viMenlX6zmIyEuJDqfwQUMKZNP0LPK48eWsRXN33dwvIgQ0
	+CeSPgx4MiDWxnGK3Jz2j/BC5CIjj0FxxDNA1eJQHETYqoK4mAHPypyfyo71X9KU
	/dwSf7hXtCWtbi9Ic732YTwiU8AKPVGbbBOkFsCJ1JgEuYuUcxt1iQgJkRAitR1w
	nO0yzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj502s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094ba09affso6175101cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832139; x=1774436939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
        b=GUz0jzs+OJgG4GTVtb3LZ33vg6A34uVk5UOSMEsHKjOuS+xBin8SpCVEhZlJqEV+yl
         RBetkaoWw3FDF8Lis4ZMqE7kqoqOg0aXYwfsQsZNiDr2yQFjdv1rFcuEBJYR20LTF09E
         aG3F18r3BNUU1LfxUzNKgOfezgWpYfkWjydh63V2tOAtDpA2leptIaOVw8pI2Y6dTvHT
         ckUEx3DRmZLWRnxoeFGiabnyI9YxdGm6rkxzX6yFS/7NQWCIxsKLbDD4h8j+wQm634aN
         Z2YSdWVy8/KQaob9sk4koxkv3fDi+M2+7ESMcrOkQX5yGpFOyiI3EZlUmZqbRGv5d40H
         mxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832139; x=1774436939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
        b=lZ+47Eghf4r0DvyiVd04XF8XU8eZwOF2BvfrPyOe5g1qauFjuoVrNtsiCQXXLuYgGK
         ZvUTM4nxhKdgZKY5aTOffFxoAtHA5d4oXTGNu1CNNQIvOAD2ixzfQH9/Dn5QqvPMq00H
         20jwt0gDpwUcu/9+nt7IJEqaODDbt3gFVGvFXvKYbLdFngrFBI7by+wmvo4Vt0X8uhlX
         wn+LCljv3pyIrymn2AAUUJBfc3+I7A5oLv55rPgVeNL7FZskNFS7o4Qk0jzt7HiS8T9l
         ohSuayZJFfXUyDW46eJGPPPv5PKmfc6J162vBAJ3YFFDalDBQbiR8oFG+xH9JUd2Pd3t
         S41g==
X-Forwarded-Encrypted: i=1; AJvYcCX0KX7Al8WMwmX4xT/Lzrjnje5mEwDpatIt3R2GBIWTFHWdDAmCr9c1UA+jXAXrxMOiScc8/hPsg0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/WTEbw3Y0MHRYjy/ce9s1vV2VzMNZ0gUCom9aRlsmLgYTWb+
	iFZfex3ZiLrOF6JpEsdcRP3ytiQvTM4wOoQftgbgkLkbCBxtF/WG1DabElHreAZ/wBO8K9SgmZO
	4o+wmR+2k0gBALqUFUMAmPQmyMsqgO4zbbb8gmOdtjuAYChgDXMMCBm0xaJFizJc=
X-Gm-Gg: ATEYQzztvgWHOUwnLo5D+Pri5EERQoSWSDqiQd7h3v9WXn32l5J0Uil3tvBDnWfVieB
	D02CupwoxVnXOqFxu7ihwX0q/iltmYlMSpvmaZBCzb0HZzzt5YBhVX+iarNplzS3A1fJvCdXsAp
	84m5OOxt0b80x2ZLcMI7bRtBxxrBRqmR1MGNDwb/EmtISt1zqsLoAkKrV67VJNhNtWh7LiZnwpE
	8ZhVpQeY0d2wIp5KInbFQCKwiljUEfP16y+MMBWmKw1i2IHo1bg+uiU4WV0jlxAp+VSR321odq1
	dIXUqh+E9Z6BDqL2d9wATsRlmsWim905N/HBwBKEkk/FpJ8VWDwS2yVzKVmvg8DujcUGoNXoxos
	2IItx8KKAhHMCEBhjbhOmx/SynigCtawD+ApL/uobPs2Z
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id d75a77b69052e-50b1477e302mr36059201cf.15.1773832139147;
        Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id d75a77b69052e-50b1477e302mr36058361cf.15.1773832138604;
        Wed, 18 Mar 2026 04:08:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:44 +0100
Subject: [PATCH 5/5] clk: qcom: eliza: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-5-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7vmfmVTf1sjmsQtQiKvutgOgGxTZ7kdgXKEyXYC7s4g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe+N33ivwaWe6BXKCojvQtemLpM2oysrGfqs
 SGMVzmXDy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvgAKCRDBN2bmhouD
 11E9D/9X0bFqIQ0WUbs/0t6VOpmqg60At5JzdaQHV/nDaIdSLauMo/g8yEnoHKHhSWttJSl543e
 SkftcPjGYwt8d6vaFS7F+Md/n+ElnK7CXvwUOuP5BkZ0CnegvxkLOSrxnwka4gRcQPMZ1o7WZdi
 v4Mu6Z38qPc3DGLA5tLddd1zAUfoefkMNuVGsrIJlD1uRVjiNwlf5mazLxNdcuPmXvJULvRRjMS
 mmqkqjK8LneHUE/lVMo1rhhz7WGvhVgdcPoUnW5LLjnBxW0skHqF2/HvmlR/VHKkWLBwTkr6SWk
 dGVFLOyzV4+BHdVBWWnu51l+KGB1zhyNrb1rbXRtzCavk91zPVuU/aKkYaocvvSWOVBpHmFw0R0
 wOiR12Z5Rg02yFsEaO3Swa6sWu78jXdppkKIqYzkpPmkmKi0dcepVWE+nVReVm10tahEyO4rPoX
 wp6Gko3nWLsYGssJNiplPknAvkmW5xxFacsco4i3Qm0+lraVuPgDgZ2n3y1o+Y84Up/wrpQ122r
 dDj2+SYF8nnjFFRhTzsEHSWUS+gB8SynYItA9vqQdMqVXQxvDI6Yka/Df7hDl6B2xdRjzCBo+rP
 TR++V1c9me6Cjc/awkLQg7iRQFuOF76zqAz+FFFfbL6OI72pWhrV9U/ZpalblFpGp5Lba0c8Bv3
 x9syeqq9RIHeeTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX3LNxwfva81fr
 7wS5ALlEza61RF3rgG5yX9BWTELRBLNzfaShJ/xau8XDo2jJMcBUf4ET3nREI7qNnvBQ4rmurl4
 9XlvfNXxZ0B0xW8n7kHEk91JWJLeXNaO8TRg5k1cA6l0SEa3ezH6h3y+qGXrh6auqpgYIBC1IiK
 iYAjJjAjkCCMCU+3wbioUwmyTm1WEmU/WSYk0tQzROhaDhFQCEjCF3uYT3iLhsxprlDWOGiKBcO
 J0Dv3inUobL6DXsWFJZ/jNJLN49HBy8RSshuNhOPvp/G5lzzAdIXBaqHJ68oO949T7jvgQVTitJ
 VypSFPPm4+mItZe5VEPJbkFr1FI6dim3k/brY2pCcKHXbPHDxXhh3lTaBPat1JaOoHjr9fO41gu
 ZOOvkqi6GxcMHQ/ujtrDfxTCAwkz/Y5krL7kTiBfrTlF/8ANhxcfDqe491BWVTk6vcd84v0ufmv
 6ct6w9wxgZfkbUPTMIg==
X-Proofpoint-ORIG-GUID: 8S6NEPdbZKhm69hADjFT2AWAl1R19p4i
X-Proofpoint-GUID: 8S6NEPdbZKhm69hADjFT2AWAl1R19p4i
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba87cb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2pKPMeBpY-3N91LQmWcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094

Remove unused header includes - drivers do not use any OF API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c    | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index eeec4ebdd5c2..06ee1469badd 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
index ef9b6393f57e..5a47a4c77cb5 100644
--- a/drivers/clk/qcom/tcsrcc-eliza.c
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0

