Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55289329C60
	for <linux-clk@vger.kernel.org>; Sun,  1 Feb 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942959; cv=none; b=TA/pC0PBboMxPQniFVD+UNWXTLC9raWIuoJA2Prc9vwNBbGaxI5Ot3cPrtgIDmAZtgzwgU03H9wz8XNDXaNd3x2lCJc2zOiUEyLgF6mOBZhyYL9YcRdSmmt99AoYMUz+/3hJZzLC4iIrLUsMRvkE3q3y8Ipv0boir2cxVKed5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942959; c=relaxed/simple;
	bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uyX0haUutkwEKXauTH6dGe05wcmVcWcV67R/Ch5yQWg1F9oF9rdkB4LpbUQ3DdAOrO4QXMKM5lsvCyLr55ex0ZrXNB7Jf+dwnZpu4ij027swLrBVjtgWsY2lqSnCXcevsgsiOhni042kt/ps/LydHrwrNXTQaiqlUGgnRQk8pKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+fSOL8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXonr7KX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+fSOL8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXonr7KX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117YiAF3867928
	for <linux-clk@vger.kernel.org>; Sun, 1 Feb 2026 10:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=; b=J+fSOL8oecJ7htUY
	rnOB6a3qU6Xuj3iE/3SWCU8jRB2OA2RaeKEc8TqCusqzgO6Y4g1WsoNPxvzZ7R/L
	nkIDQJiIgkeNh+b08w7MB6Dnr82x+gNiS9/WAEmiYmJ8BDdNzmKLyIAkTBQlzaA/
	6vh+yuz/0sW2MCaggJbwgzfoA99kboaLhAmXwtxGsE39MOGQursySv8NHmstUf5O
	HG/DjjJrL+W1EHj/iRe/Bu4x0h49lsGDxATGmUP6GZdaUioNNU25OqlQnIlclQNC
	k9XATVdbJZUX+u+LRaFibeloS6u/sOO+R7tqtzMyyY2jFiv16Sq6GuH5akEON13z
	gpCfnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2jfck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 10:49:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ae763d03so374837285a.3
        for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942955; x=1770547755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=LXonr7KXMKu6OjLrpKR9QKi1L5El0DwbLeoVB9wkez+a1rAahvb9Zc9vem85VhoTi6
         sSRFGwPhku/Hry1htGNrTKQa31j8M1mthvB2MT3r8BxQBpWl4JwJq3xszHCgydcG2Gka
         TVgFQRJ2k7icKAiMa5gr2aufnaMYb6dBL0sQkgnXLVk6wwOoBmbOJVs9nNZj6Of+DKho
         gAAUc68Gk6I7B/HLFZzVMiBdG/vmtBgPrB8azncs/PSoLTW48VX7PXMvf124pbsSY1nZ
         rQzAT47pe/0We2H9mhSooOjmX2kN/6NcFdcQR2dk8JqndoMDunzuC/w0TTHqan80tmRY
         wvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942955; x=1770547755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=l+MsN4xMxykU3nbWhztf2lU9j79+Kj8Rnlo72wc/LN8WjkQeP4IymeG6S7tY5uvWYA
         8K5tnPErHxU02Bd3DKulmJE/aNI9siUtmjywQ0pg0SWMCNTmGMVLhYpuQE9NZQTuS9PV
         qAM0R4TpY4y7chwrpBGeGB9OBFGXi3hAs3RAdJJPzQfX7mJwx5/JCdwpgJ4TrlfvYdG0
         3x+W1qF2MyqLcfmk+6nv36HHOABn3xWK+BpotLJYZg5w2auweqJ9kgNOB4vXv6cRP98/
         H/tImBDT2Xhry830p/i3YBalboTGeljR5cqwFOks13g8KAEkTOSF1psm3reKE5V1EOgF
         +2qA==
X-Forwarded-Encrypted: i=1; AJvYcCWjCw7v94nWymSWo4zcgdo6AYBfT3u7S7tgRHtXanZhs138YHoxws0plxcNDCWqtTa3hoNR+gME3kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmKjH0TY6/omp1E+syF75+/xKIjAihmEGn1IM8DoTcZ/1rKo7K
	Jn4l2ubmfFULxEHvsvurEtMa+v+FeG7nHTsYeFZJQTMXyK6C1RqLSwnaQy9f8T+4nMs4fdKZYJC
	7HiycT2Yz1/MSoIxGrh56uIz2b6sOd3RaoWxIgiRMBNioCz75ZXGW0rXNiGbJJfI=
X-Gm-Gg: AZuq6aJ1X4lGGG0fsBvA62AERKos5rN8YP8SbjmsNFOIjxc2t2ts+TT2li0MIkEa/Lc
	OZacQttbTkChNnpXac5biEQZ0TeGBzaLd77bpW+8H5FPDbx6KC8ygzOAfBtWZC5MYeAClUvKWdv
	v3VAC+UV22xPxJFu2OZR2Pv4sNc15+m+vPJVhPIXhGasmaeAbgArylSq3paPBEnOU0rm7oo8QN6
	OyEQz5c9iY9qLqrKRWkMVrzHbdXT0NxHycZK2ryadVT1sgMbTh3ydj6WNMsB4YmZYAbN9MxVMyW
	msL06U6LD1SNDB7KZWuZc1xn3KPGSbkR2hgf6U+9pW3POs5pVki9iiffENzS1N1OG5A01NF2UKQ
	kTvUTFT1IlmGBH5cR/3SwAasJD/L5u8Oc3/V3eMl5zMUrOIWA8qzNX973s9fjuFHtUu8HYiX8iL
	MR/uAv5PZrd4wGd/4gsPBxdQQ=
X-Received: by 2002:a05:620a:2906:b0:8c6:a85a:5204 with SMTP id af79cd13be357-8c9eb364f83mr1127876185a.88.1769942955070;
        Sun, 01 Feb 2026 02:49:15 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c6:a85a:5204 with SMTP id af79cd13be357-8c9eb364f83mr1127872885a.88.1769942954578;
        Sun, 01 Feb 2026 02:49:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:48:59 +0200
Subject: [PATCH v2 2/8] pmdomain: de-constify fields struct
 dev_pm_domain_attach_data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-2-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+kyu/4kaubF+LUVuH4Re7eRBOaxduY4IJPt
 cXB0D862a2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpAAKCRCLPIo+Aiko
 1aRuB/9WBlRYvHMHWuVOGRyjcbOrZio4cJ42F43gS/VLCY0xeqGW/Mca12KWFPezXuLAppc+RUn
 Ku4AIG1IbCuKx3vVrZz24t619lL3DXZLWKNWR4O+bgiYys3B3BZiwpQ6UdAHcz4EVEQAO4l6Xxz
 qIM5qoSfNUCS9mex4aqDiUgyOW4KpIAMyTAsVyeaE7/2xDrvmJW+cPCkDKFMdp5RputgCBc+qBh
 7VWcqxKMpJ0cc8eiGwHznJ/eFVz9f9YGZ1OLRwNN2SHdJ3Ah1dMWCWo/ij/o0f1qimYu7/XwE+/
 DuAPT+2YNHGocojIFbyT6n67q06WMtGWPpqD/NHN8Z9B83Ph
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hG1gDp9IbRt67gAnrKA6hceIKwCRvfDx
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=697f2fac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0MtQHd9Mo8yxAPGUVWwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hG1gDp9IbRt67gAnrKA6hceIKwCRvfDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX91R0ctf2AVWA
 lod6IljuBxecn/sFCmIXOOlZy7xmcRp6Wi3nO/9tWCM8D170FRvqqshivuZi3uprViCCjHWkSzO
 8Sy4tp4Aathjjh4gMDoHT2cYXQ+y/g8bd403PJlQ5/eASLp5nFJXmBlOsmnEeKXK2MLFPF9lFp1
 D1VJrJ7y9Fh2J46XsJtf+Cnn3lUbSVUmJlHyT2tot+LjkYVfPUEMMhb8oeMNeAuke1rIiacJdlm
 JAo9QkOCDxYwcsk2j2okj629w9OKRJW/tM+li5gB9ezUD66OLuNCCGg0nRnk7+WQa/aZl0WEnqh
 oNePps136EuZETpcLVIZkq9UXkMzWuWR4MieKbQLc/7cKRVqngNJo8CmfgXXKRjrzjmVMNJt9Wh
 ZfBxDVPuLuks94SnjsvaqDIg7roKDMz7mPwsdpq1GGK1h8jGmRDjXUSAX6G6zxn0wtFQFZKpqUy
 Sv4PH37WAdSwYIEdeGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602010094

It doesn't really make sense to keep u32 fields to be marked as const.
Having the const fields prevents their modification in the driver.
Instead the whole struct can be defined as const (if it is constant).

Fixes: 161e16a5e50a ("PM: domains: Add helper functions to attach/detach multiple PM domains")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/pm_domain.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f6f6d494f728..b299dc0128d6 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -49,8 +49,8 @@
 
 struct dev_pm_domain_attach_data {
 	const char * const *pd_names;
-	const u32 num_pd_names;
-	const u32 pd_flags;
+	u32 num_pd_names;
+	u32 pd_flags;
 };
 
 struct dev_pm_domain_list {

-- 
2.47.3

