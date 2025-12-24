Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97193325716
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575395; cv=none; b=naKVGi4Gq4QSwDPdhG8ohCQXmhMucojMZUWcx2hm9gUZoo4dC8hpx4vDSBj7bcbKPArQpM9a5rK9f/c43nq9lkv4AnXmkvvsGOMhdnlJixbJXxf4a8uaYWIWMXoX+qEoC+EUdptziKu8eOfLBZs0opHbtbt6jd/5R2UQugge/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575395; c=relaxed/simple;
	bh=Zm/akP2QMYfOMOAkSkGQtyJ/nfOBKsn+htnYZWu96fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyE/FJoiVprJYED6YGCK9RAAAU3L/AAuifxSjuDLT1RWWr0LH4KXaKZoG+TukgI9fhgUTMM30lzTvqqJcLlo8Fr1uBz0LMuiU5bWFZXdXWL7lvfT9BCBQfHqhiq9ior+OoJoCKLF7/wem3L709OWyLBxZMwvwpQW3v/gXK7ouK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eceo8x04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNhSRy/v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eceo8x04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNhSRy/v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO26WDP461408
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xp2tokjBR5/
	Ds73KOGXAHseytVAv33DVwCazGSdH11g=; b=Eceo8x04+wEgqH14ZRRiu6jCEZq
	e/kFcvBE51KJ2cHtOcavlYtkqWmNbPVmI3SPZfH/IvxU6HFH00tYmJCvLmqobqGI
	bXWQ4E+lGRq19rqK7jXfp/3CP8E/QFZNXf2gTp6O4RWjEcnaPMoYFn5zkQ5O+HRf
	Z2GKpQJc2GLlHHT1kDljyUBxJa3Q4G9fjHqFd0yWi+ZIMDAW9JTE5lLb40DPDSOi
	9wR2zBBetxO/T4tDY4u5qlNIzHv3FuWUuxUfXbdykkWsMl56nMNlmXQek3AwDLbf
	sKheU1aE3N9pWRXF4JJrr7d1in4H6n78awW3STV/qSoZB/QX5LU5ofQVf+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu1r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:23:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee16731ceaso113794491cf.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575388; x=1767180188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp2tokjBR5/Ds73KOGXAHseytVAv33DVwCazGSdH11g=;
        b=BNhSRy/vZ5K3RcbMtEvw6k+/6Mcoekdx+wA8/YVuVqNN4JTpJ9GeXjZzkSbcCYCGd1
         ZvJ6ovyC1B/2gJ4rlGmmxyW0xb7Pz9TGnxYJyvkRstSZ5+TfplJBwy+j1ghgvL04mDRF
         zvbhWjWO/u922eHgcoSGkFastr5MLMZp7CmU7umpzgM7Mgexpk/H7EeMwWfHg1M+04Ig
         4EryapGF8Vva5aO40b4srnyM8siSXNEoZNdwU1Unob4NcJAAxCrk3pbeMXnnUz03MxAm
         qxVF5FFwheh0VLFM7VSkaCevmsaK8IKQPPSWy5W/NSw2xg4DSEp8lxlA0MpL8U9HWicp
         sDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575388; x=1767180188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xp2tokjBR5/Ds73KOGXAHseytVAv33DVwCazGSdH11g=;
        b=rGlMQ02f+SQSHC5LmdGhGofEZgvJ97B53Fjhzl6NAzWQZL1b+xS77JFhROfmoWtC7D
         Kv7UniHyHDEvCV5Y3A4kSoJVNlTTOmYd8NvvDmbqyy5Jei12GfnQKoXOfUS5tpKU5xGJ
         KwHrulrNKM9jWptSxvbKPxDIsRFIdG7+6MQufS2IUxg7DAMUkhnJ4bmBPR0ccdf6VQpH
         6BD5BSgP/ExBvzkFE3Ikd3HXWB7UrpEjOoseWXNKW6BbKdj09Qarj2KP+CehglGpsAaG
         ATKse0xtIQEUjzLY7rZ2h9/irqv4P/aGN0wXIzK+xjS4yPOj8OTeRs3NYrUL8gn0Jg/r
         gNQw==
X-Forwarded-Encrypted: i=1; AJvYcCWWkD4gdzW547daMtgIrOAbSRXIO9ZDtTJoFb+Y55MUitQKllPM0iRKljsylIo4u/T9YrjJY7PrxI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqqnmEuP3ymxIDrjl1fbSvJP5DiCk9wQaMVo2mg8IUHkhtQwh0
	Z5+MIXdxgRt+Y+6YwpJwUAi3N8qwrhkshESrSvP/9Y4ZGjG303ljajczMScJ826OpOLQBqbXTZp
	uhnWOaBmheaRTqTyqvNOje+xwJCsXxhkwAHnsdt1Y8ttd5+untDwIawhPZ53TuDA=
X-Gm-Gg: AY/fxX4YwXNYVIsOJUjaNBqQukZ8NlXRp6mqM6YhKUclWre6v6oBnDE08jM8DTpam+m
	yQYyQrrgJkq4/xXUX9dn3oSxBUe4+fyKkIECemCb9Yq7kmkf8R7qcS+crvNyWjyyznLw/3IKcs3
	3W7Bq/R4Q5X3IKtpKG7LjeK6A8WPylQwH7V2hMQeh1Fat4su/BZVZekM+wsmMRhxKJVWan01w6u
	RR8Yoa/zIb0HgxoepQ67RJhm8HAuxON/g7Gai2mdfDgWmPRhn30e/kvu+RWRtUmNIbNYLqK668/
	s5d1inupwS5O1R1L+Lc97ZBlopmXpWJyCPHxQuyQpYk52Ma1jggUiONxnoXXPFp1zROMXYKIf0T
	atc/wRC68Go2pUqrycdUC6ODYRma8L+pV/b8iWYBhVBgKez7pcX8AsKt2NbSYLAdFDWyJuQ==
X-Received: by 2002:a05:622a:38a:b0:4ef:c655:2ff8 with SMTP id d75a77b69052e-4f4abdc8e86mr271359431cf.84.1766575388604;
        Wed, 24 Dec 2025 03:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAZhNzCPpbfuRHFo8kCt1dyLtfpeiUSe0nyZim0y1do2RmBCdzbKh+s0OebDSicTEYJhzrLA==
X-Received: by 2002:a05:622a:38a:b0:4ef:c655:2ff8 with SMTP id d75a77b69052e-4f4abdc8e86mr271359151cf.84.1766575388241;
        Wed, 24 Dec 2025 03:23:08 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm16864955a12.34.2025.12.24.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:23:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on Kaanapali
Date: Wed, 24 Dec 2025 12:22:59 +0100
Message-ID: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zm/akP2QMYfOMOAkSkGQtyJ/nfOBKsn+htnYZWu96fM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80SjPg4tj6o/bu7kxY0Wdlcf5Id919mddZAi
 Yi+Ks2FtnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNEgAKCRDBN2bmhouD
 1zkJD/9H9e/tL4UTdew5TkS4zbc6mRFbtc/gFv+HjerfcoOGnfSn/std6VPIK/I6zytjYljsgrM
 aCH5ACGCrVGh9qNNyO+7sEVVcf66xocoPmh1yKYz0RIdahhyPO9eNuUVUyxYfFuuh2dbd8jpheR
 BoqAe1iIzFWo7Jh9b2G61O86crk0jBilJSEfx3xHRYht7mvr/O9RT7R2Uo0AHllMELX4Ldy9m/Y
 RuQ5xv0sC0WIwC5uiOlt9I287Ti6tBzUrDTYiEVzLrbpQc77jF65FkDlfzLE5NnzeoOeJDDpjlS
 ZsD6S9drUG3tMBTBRbzFzGEIOo9VF77TTdspkNDlksfrWXmWhQknTAZxF2gusRiJ/00tkTsloga
 R+VO0VXYTPWNvJcrm7EornfMkUGAgAchWfRIuCkrBQbApC5MbJ3wHiFtTkUiqijl5rw+t0fB8vF
 0/gC63vhsroBya4KV24npR/KFngcdLVNnGTrCcTAD9ZszTUnZugk5oi9WWS7lHUJX7N7jLKr818
 97obrW6pmyNYIMQ18rZMwPEzcWtahHFiscdgZ3prDiK+rf4nE8MYkMtMzjtasgJjEoVQz8qt+Mb
 m71pwUsp7KfCf1unXWS0/7n7VyHJkVtRTB340LG+hpPALnIq15grVBhvZMDwNNelzbnztmY1ti6 TyTwgUlMZ6VZycw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZjHBKGf1XLrJak2ELvUHuZYJNLefQqkx
X-Proofpoint-ORIG-GUID: ZjHBKGf1XLrJak2ELvUHuZYJNLefQqkx
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bcd1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JRV-5dCbPcj-iadUDKQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX9Ym3l9Pg184Q
 L+xW0E7LL9TWCSJEKnpwljAG1DhoYVWpIcHlFTEXmlk60dFryqknpKxHx6PodjxxuBaSgJH61bG
 opsAZAwIyMunPpBfoOWOvuahoD7t1/4bckBEQyEWTgTMggL5Bis0k0jyPT/IzWLp9xpkPZhubPP
 s/ezSs0qbsg9bkShaA+X6yA0zdw/rSoW8sOcsjN5WtHHnSdKD7vAyek1oNYcIklZLxT8hRw+i9w
 uCLEVtfJ2fxeoSAr5eQxXhsuJVkeJP8GJCNr3EBMCP49bWKoEdqD1X+tfccxx08qhyL0rumPdsc
 v6z/RgC9276q+kmWDh4M2wp5s1n6C+1+dPstti96pgJRu91KVX+3fGravNl9t1oZowYt3VisRdh
 hLh6rAlkBg7HsftDXyyst1/QSTPXk5QRzVGgWUXOTqPzUL/zG4s6p+413rcEuXbfkLFvW743vOC
 7n2OZ9PPslYWx4qH7nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098

[RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
initialized, as reported by W=1 clang warning:

  clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
  clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]

Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 10e84ada48ee..547729b1a8ee 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -929,8 +929,8 @@ static struct clk_hw *kaanapali_rpmh_clocks[] = {
 	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
 	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
-	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0_ao.hw,
-	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
-- 
2.51.0

