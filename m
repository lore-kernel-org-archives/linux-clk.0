Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124527;
	b=u6lSMBeXgq5uSYoONQMGbSX0CGwDGqjemkXCdX7INfx9Zqc6RvV/Ff+x+ArswDqjItd1
	 7+yReLzUPuJJY5irTizDBG2N48bCYWjyHbgn9b+VxR9cFxKxvkp0jK9V5jqDQKLadTNM2
	 2KwoEKkDq91iuOFddkYFEMhkaZGjQLAc8iFFI0yS6mkPjzR+fdbNPsyv17VltYo05mMtb
	 vDD0xldcLdwFL40uhik2++lG4YlvdRP/CPariKSNdQVJjlhghgHACoMdwj4u/lnoh2P7y
	 oKA4N1Qos+q4yx41WrkFSwc+L6CTQTspdc2hFHhCGVqddvnxIltfoh6M2R2pI33P9Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
	b=QgwCl3ut26ki7PPEk5ZKJtvknVw8/r5A/A+2cnhTTzbnE7msRjXzVP+G2je2UhlbAA41
	 DyRh6/yDNUXCmwh1EjtyD4yPqMwiFrX2qbUUtQ36Z9qjskIFhe3WG/aCjbrUlfR6/bf69
	 jEOye2mSdAz0lkrb9acd6KgFD0ZxV0ngl5I8DUFnEJDtcIrZzN1jvAiz9lWpGVf8Pgy17
	 SmS8i+eoXf/jSBFmjDQ0F20LI5PNzcdjtuP9xZAWd9Peygc2vSXdO6hbsJBcBgFDifIQS
	 mRZlGxrSzOZitfVFbGmF23rOHfldHF8m2tBXSta8migU2mNM9w9y4829yQw8B4I3Dvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DE606A321
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH07QM1743326
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=; b=MWq9MGrGHekRKODJ
	mzxuqkcgIkzutQUFtO3uw3hWZy5Utu+wADC90/n5qK5ydh7iQczljCYwGVwzZrQr
	G7FCLT4Y/vZqiPWOMlB9hGxwZ/ih8jB5j7TFU5k0jICg9yYtPnu3LJ2kspGQpev4
	wd2TYiWNfzVzDwXVeLySY3QA66DgjtED9tfcETTqZB3BvIBVGYkJ3bVyVhfnAY3+
	/v5BUymfcTvBHzaOG/Bf2daRDB8Mp+AICLxreyvKhtMjBn9H02YCxNYhvUWBCTpM
	6vU2ypOXNazANZ+ZDrBeTA4o0arhOnQyzxZu8khpjLNCw/VqQIoQZ5m6zLOFFiYQ
	sak3hw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99j7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:08:45 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so292176c88.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124525; x=1793729325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=D5ItdqCOtKE0ryGGQAT3M20htsDuAKVnmOZvodn1iCbY97UkNVtAzmwZrM8oFH9Rx7
         j8Ei17sr2u4wqEmdYgmg1sG1fy0uAqYwApD/0bZIVCApu0nwJCEPxyUy6p+M6ZpBoBi8
         /UNpWq2yjUNm385lGdh78ZylSO/6QENpSOodCprdnlUrtyEzfFXfqma/NpA+A5hwqgEA
         DTIGDUHvC9GW+XIShjVGi3yV//H6B+KSKoy7DxFmTyysb3epOc/i5PWud0+++NWfc0nj
         FmgHHFopEumuYLJ5NNuCHsw2C9rlzahSuZ6VRHtClgmXHTTLc4XNDCrERKhkS+C2AmAw
         qTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124525; x=1793729325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=uUoevmUjeKotdO0o9qQCTc+4+qUfq+Jx9n4WnHS4mobtM5gAm8Be+zvIx+Cuck5JEA
         3jwEypQR/De/O029mPu8+RhvdAKzmRLSmlY1tDf4xvfu/MkEi4GJmos9LnYYHXJkESqG
         gKs1bQ9WDYUDHFr0FTHbX1WOWqCMX5BeVwmGoGJ4gGtFcQAsKNoSBu7ljMC49g4iO9n0
         rkueKzn896ahwYxfd3o6l46Jp2Hlz+AtXzBJHDjE6R5nTSbTgtAmEyFnRxfjjHNkUdyF
         DP73cpsknb6uWeohs66eHqSQfMZhGSzKaWFx8Oym4aCXItIDDol9ZzHPL3pOebmrtewK
         737g==
X-Forwarded-Encrypted: i=1; AKwUvByZwCV3ev3WMYlcv7eccjxbLtt1PZIloQ66aD58ApVBUqtwdTc4KneWs5Hg3ImDHDev9k4p5Lfn4PQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSrhLSzDccsJLypX1YWPxTVe68aEDvlatLPXJ9lmG5Aj8pxgx1
	1+0XvUrDCKPIiwmPt5zDRDPAW3vU5QuxiBrzuP+obdTwgsc98/j+N2tqGw/LkOGubjPtj0X/miX
	B1TaycO7ovbhdN2lLnclA23R4l8l+/ZeBTFkYM8g+rZAWGZfCCTZgYdcsbNUGdGc=
X-Gm-Gg: AYBFou3cVBJMP6m5LDm28YXW/k8IeSLvKxitSObrQxivafakm/FCmOuZntVCKEvnBSH
	qVvwGN+QWx/PK+S7miSlBm1hDWV8I3SgvLwQlUIsuPFJyV6t0TVFRuZQx9UHXlzs1V2IzIZmXfd
	oRqsmbBVJ7qzXmM7XrdO6qsG7V+qniUBdSk5SO50g5QsmbDg0gVrj5QssFT4lUzhsIpNDazy4Cx
	s75e8DB6ZdbM9BfEFVwqmT88aPY0YHUbWMu9r8y0osGz5Ef8XsXEo8JIEKSRZyfcLgMVkewL7dT
	WDv4uvkZ/ghOwsemC8L6YRpJ7ExIhDzMP2uz31hPOi/Etoxnd75kp87aHvRttmRX9iUja+rUNvw
	LMMnn2Fyaxry4i9HAa3hBu37Tp+Zws09jtTgM7tS3BPZNb6hcfkVAhawbsWK1eoKVYq21Taawtg
	==
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27668c88.17.1793124524625;
        Tue, 27 Oct 2026 11:08:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27613c88.17.1793124523711;
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:26 +0530
Subject: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
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
Message-Id: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0e8ad cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=crv3FWtqC6gvpUHg9-wA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: X66s2-3TzZ2yqt7lQyharaw_YBFsJW3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXw7BMVdh8OAp6
 zGya2oDUls2B5OxrAc8qzWciz04/zIRidQ39kvwBJd//3+i5GaJRjJblod55kzz3/PpX2MH0YAI
 XSA+HC62e5zjUuUiZVOCWi6Kdto/pWfvA6dz7S2lVIHZtuTTjdimTEj6Gf3DoaqDXAWeFexsFTW
 zmJv+ZL7s3uscdpzKt5JmyKphif66iESSwnd01biU7QkyfFKkWX7yXJRbbUOtQVyEqhvPTBGnsV
 mKnt7VYtlwZ3I3WkjOnyapukUePiyc4N8veAe6qQo9RrGupcVmt2boEpkhFWflMLb4LdhkDw8gI
 GCzdRJXwiG6d5PusN5R/sWa29waXs+eNqV7fBg0gPA28JFemM9fzTUOffrh7zqDRjtEYSwEsYQ0
 aR75uVSxnJxeiNup/verJ9UIg4vjIy5PN6HUZ6fxCPOA/FCYYUVX8GCjWV4G8AbwrmX4G1m4dCI
 loL7sPO8u6eP29fA57Q==
X-Proofpoint-GUID: X66s2-3TzZ2yqt7lQyharaw_YBFsJW3I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX9pXNwnIefm3m
 rxlxTLvRX2IeE0VB2SpeeoIquPYfT0+qEkzZaFT48A8TSD6HziImgITSvid+OOIOwZuLGwzD3fy
 o4WlAfKfI6AqlX7czW19CyDpjxCAsio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

zonda_pll_adjust_l_val() obtains the integer quotient of the requested
rate and parent rate in quotient, but writes the requested rate to L_VAL
when the fractional alpha value requires rounding.  This programs a
nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
parent requires L = 63, but programs L = 1200000001.

Use quotient when calculating the rounded L value.

A GPT-assisted review reported this issue.

Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
Cc: stable@vger.kernel.org
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..9782fb062a58a26daf3e911ad23c5e1d805b0c38 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.34.1

