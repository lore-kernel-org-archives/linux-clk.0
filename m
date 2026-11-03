Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699238;
	b=zr8ESCBLiY6pAWVd3Yf0bolKmjk5xfS3TdvqYDFGWIWm3T6JyPET+Zobkbm2I9Bl3dkr
	 pwjufWX1Jte1tg8q0gSfKYEcwVQI+IQ147VD0UN8Fak/+ZB5gHzHKbgM/1Cv825iFqgPE
	 qksPZryvIlFFGC0WMlhRww4oz+XS0llrbMR6ZtfjC0bcoTup9RD9BWDMCxaaGnj29fFEj
	 PIbznA3a5QiGeIoVzeYs0YfJi9HPitddHqYa7Ot0fBFT0KWk2iFeZo4fh2toslBgy8O2Z
	 oSuPifHe0ZquASoNKYiFk9pBmia7ee1eV+hI6lawbk715t95l3lO1eWP6UPuy7U1wXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
	b=vOJQp1gkXAUUuzHqal3K39r48cKz/qggIJZo1xto7Z4scH/tQ+lO2oYvtvrG9ClHbEav
	 5cmcEdFqvPF0GW2QWdaaXZBouUs9fiGuOITVLA6y272tuQYHHjHFo5MLRHcoO6BD3XNTE
	 2mLEFi7asm43l35rsa86AQS5v6QWJ1ey5Xl6hEkrQDiqmXQ9U3eXbfirr21vzE9Z4SyLF
	 7JEh4nnEZgUPLeBjvjFgv0KVWLuSdbdneYRJmmiqodOAWojCd4/yeywt8/9nJ+Jnt9POw
	 pluB6nqg9C3MB3eOI5N6kdehfPo4ROeGnlH0bdlvJCll623OXJK7vDrFePmydJ63muA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnNNbhwT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jONS5vnE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974F606D82F
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 09:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E974F606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnNNbhwT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jONS5vnE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39QdOC1141745
	for <linux-clk@vger.kernel.org>; Tue, 3 Nov 2026 09:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0n0HkzJNtdQjaMLzn2VLaF
	HeZeyP5LsybYLDB5MJ+Gw=; b=GnNNbhwTN83iXiav3DX1K5/quVWHfT4D2wx1kf
	Uh1ZktXs2MF1/xeuTrRQVXzlht+LfOY7OZyYFctJCaD3j5AbGentLrNqYKWrfJF0
	Lu5ZUxIu5DOLd4KIN59UeUOVum+scx9YYyT+SuP0ad5ekY/mzqKO14wfdO6mbRwl
	Gz7n9wNDtOaxat16zS+UJhzlxQE4mY/BYi9UlgWSFDoOPS1cKUF3/5cDXVC2VRVA
	Cylv0lzMsNOVo/Q9KgUu8sJIuY8p2TsNGE4H/v4BDPFIcj+MrmHQ+Jz6OBetgrBR
	16TjekVmnGMX5CB+TRKZctpw0124hRzCB/CFzYdLRYMxiFTA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycscd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:47:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso429386137.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699236; x=1794304036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
        b=jONS5vnEp9hUF1cE56MVN33U/Q6k+9zuYs5++dT4IKO7X0w9n9hl+TGTrJi8Mn3nar
         YsnPMhCMqB1jhye4sqjLLH32Uc+G3pmOOtvAihiGo3XP/gifCFIhGpkotYuq3/CDA61A
         hPqogvLMvnhc//LkIhH9Os2zh8+IsjvTbQmo4chvypvd0GXcJ2Cv9flFPO2PPwUrR4Gt
         4wf9ZRiIlY2ccF20CF4oq23atQyipZkoY70Uaw3xYzMP/7wY7YWIB6vYXzw8s610KTa5
         J1qidPgV7bgaOAQZLOYuOa8/xaXBNZF1zX6UIupBTTRz8qRfS4Qosy5B7I+c3dKF+nc/
         aylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699236; x=1794304036;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
        b=mCQWXRQsOjuFB/tbE2wxdmjL45EbqhjAtpow3Na5TZtVgWX9liugupC0CoWeQbFjCC
         BjVwzeZLNlsBxONMMAHKdXlRQssUuxvZN4Hc7Goc13k/ZFu3gB/M7zVM8cHLNPc1o/AS
         2r1pQInDdP0O9FPoanAQY2fGy/CSqM08mZjtkkbRizrWirKuhK/wBEbeAmUSoW0HcJeG
         Zpt9ZDv6HMqeVgh/re2ThqSSQXzSW6f1Nj5hetdeLK5k6X0BRUBS4sHbS0vShD7jQwMI
         wnVX3BhSTZz8aTdNJcfFDvRNuyRti+OMEFJ2GBZ8NnTc07r78jYj9u302ePiRPE4schL
         OZrw==
X-Forwarded-Encrypted: i=1; AKwUvByE0p75gY4Rul+3mw9Z84qB98zT/q0WNHM4F6RXUgjlli4S8AoFzGJs1hWI8046n/9XKXb0NIECxXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jMMYHrOvHWkNdJyuLYXyp992aKf2nxgSkzXnXi2ZmDhicfvfq
	Ix0LgMVn4yZ96k5Q+adOaNSTCHFewsJexcRRXjr94bEuGwtx00wvA6geCfwyh49RF3yF2brsgm3
	A4ajvSsYONnRpuoYYGvhtUrFRZjkSpCC9PSra3F/2VcmsTjVaCwj4S8cSJgJAiIc=
X-Gm-Gg: AYBFou2wyT5HqNlDS9aQdkKaRZ/MlA1aFEB0KF7VY1AxoglSSDRMUZ32SYt8uB1jtJ0
	ieAP64dkwGbeQxD1w8T41OfRJ/0fXqIBJnLUKoxG/+rjK0iWyqys3UchVhIrnZGbObo2Ak7NFd7
	F+a1ZPnVe6Cglkb0clONPaqNZOFXpQ8UYe0X/El1XkVEaGCpGJmt52iwIEPlaIfGHUHpVcyniHU
	kQ3PuffBCjT6NLs/YXiH3ZMYdWqLX3MPQijwtZ5pI67x+EWggPMf2U/oJr66Y7durwzS5Dq8OhX
	MFKq/kxjZRNvQvC5IDWt+VUc1hI+5HkAU+Q+fC7/En9kpZ+OlRFrBiQ/v9fAPIUxV3icfNWLSmy
	sEpX8lf9kHLxuY9dK8ENtNEicjX2EzsibeApxci+wQPI8oVZPSwVQzlEuNg==
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id ada2fe7eead31-7d0543af600mr4596913137.42.1793699235925;
        Tue, 03 Nov 2026 01:47:15 -0800 (PST)
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id ada2fe7eead31-7d0543af600mr4596907137.42.1793699235236;
        Tue, 03 Nov 2026 01:47:15 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm24018477f8f.49.2026.11.03.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:47:14 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:47:12 +0200
Subject: [PATCH RFT] clk: qcom: clk-alpha-pll: Fix the rate of Zonda PLLs
 with a negative alpha
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
Message-Id: <20261103-clk-qcom-zonda-signed-alpha-v1-1-31559b3b872f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+t6WoC/yXMMQ7CMAxA0atUnrHUpKiKOAAHQGwVg0lMayhJi
 QEhqt6dAOP/w5tBOQsrbKoZMj9FJcUSZlWBHyj2jBJKg61ta0xt0Y8XvPl0xXeKgVCljxyQxmk
 gbBq3bsm44CxBEabMJ3n99A522z0c/lMfxzP7+9eFZfkAEGXSDIQAAAA=
X-Change-ID: 20261102-clk-qcom-zonda-signed-alpha-33846a18d82a
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NGjlwTJr3xwIbJKj95ykRuhiH5GJEDrsyfPMCsr8X3E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6a2gjBxk7B7wjkjrGxO/bK1L4lQ+jBG2DyEZu
 eXrsveEt+KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaumtoAAKCRAbX0TJAJUV
 VnnRD/9lIFtvtsyDSD/kQEokY+dGlPYj2iqAVCVKzzr617qc4qDQOm03wA/LZgfQBbl6+giZ43J
 fCHjSSBjsNN2o9VexxUrGBJzay6vKXgTlKpTCHI6eLhcnCU+Iv3F4PExEi8J1Xfrw6ky2MZHPz7
 K8ioprMG16ZAZU7+GHXlIPwDL7XLbwCrYhFjrQJxIHlTskOIs/E8scQYyO+cT5SF+IHbHV0m4wj
 niQ8ppNimue/p/J3pz5xqSbtOcbFi38p0EMm0YcVxChfrYApaasq8jBO0+yer1MGKBnTs3gms09
 fQw3Hdbw+JUyKrTD1OCA8IhWin5x3wV99xgYX3n/0GX+6n9LhqyYTibrdC9IfyVKhiuCG68AWzF
 53M+m3AB4QJzZT7yWPvKnhPAJ+wWKS06G1gVh4dZTh1bJa8790ZigcIYVRrlh6zfXRqezEDxx0x
 yNljpW4/slcUpB3i4evioPFyZW8vYe0uNyxScnmRf5vZP9ikCchGi6S9azdBoRgTrX1GO1tGxnY
 KAUn5g9D40mTF+SOevLulS0/y6SJQLG9Rw+b6lYsyu3IKganh4aAIeJG70+RWistYFRoPNfeSfC
 btGCmWebNhbPOb3qvM4XJr7/j+M+l581E10K/VbhbBm/rTeC37pbI6RnMnn8KNxDGPryCTAspHc
 UViKTt4mchLGogA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9ada5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HIFZfxgX9pW5VpyTZ0YA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: Wk1BhfBVu8mioB66SptZVbSYnAGGYrzV
X-Proofpoint-GUID: Wk1BhfBVu8mioB66SptZVbSYnAGGYrzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX5GYyh9u0jqzk
 RHFU7AEL9eGoi73gLaDh1mySMKoLL0XspPFOO/N3czez6tAnSbzqEUDIKvHSVanarO1DPoCmd1E
 0eVetAUaf5bgOfBCSkd08V2WYsyHs7/cCVN8AujuGTgQjNVkBy+SOIMsamhJHAJawZ5inRdmIWg
 5zKCnqzmjyBegMzyPsAlkRQR7DjNk+zb0qhpnOfd8ZDNPhMeL0WoeH2luZ+Sm+W2DFT/PCacTaQ
 6ff6ohKz73/MSf5ZE60jFDZQwDlOSEuxO1D4wABQa7tVZJGAGjpZc638uM8t4Yo5o7koHcZqeJD
 I6jeT0Id+RVMOom9jTF5SoYlkf7Jv8DQLlGoMPTZii1rcwtpGsQQ7KrVSSRMREcXL/bp4v3wYcr
 9A8v7MT4E9biGyunrdvZwFyH8dZLz4X90vDfWmmHaEUjUeH4+oC9NcfxDDLk+nNxNnKrplcB5Hd
 KqZXObzsqrLj3bedmBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX3ka9YGF9f1O7
 3LyJ1g5yAVV8X14tfMvMTYV2E3Y9JkTptZSn9jOLO4BLuFU1JDf8OnD3l9ORM5CLnucpBu05wTW
 8DRgPqvAmuypTyFSxTJ+A5eQTkRyUoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

The alpha value of the Zonda and Regera PLLs is a signed fraction.
clk_zonda_pll_set_rate() accounts for that by programming L one higher
whenever the alpha value has its MSB set, but both PLL types use
clk_trion_pll_recalc_rate(), which takes the alpha value as unsigned.
For such a configuration, the rate reported to the clock framework, and
so to all the children of the PLL, is higher than the actual one by the
parent rate.

Add a recalc_rate operation for these PLLs that takes the sign of the
alpha value into account.

Fixes: f21b6bfecc27 ("clk: qcom: clk-alpha-pll: add support for zonda pll")
Fixes: 0c31f6a3ab7f ("clk: qcom: clk-alpha-pll: Add support for Regera PLL ops")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-17339f1f-7afb-40a5-96cd-70361917e0f2
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Tested on the X1E80100 CRD, which boots without new warnings, but does
not exercise this change: the registers of gpu_cc_pll0 read as zero
while the GX domain is off, so its rate is reported as 0 either way.

Prepared with help from an LLM-based assistant.
---
 drivers/clk/qcom/clk-alpha-pll.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..59fe8fde81c2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2274,6 +2274,32 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	*l = rate + (u32)(remainder * 2 >= prate);
 }
 
+static unsigned long
+clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, frac, alpha_width = pll_alpha_width(pll);
+
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
+
+	/*
+	 * The alpha value is signed, so with its MSB set, it is a negative
+	 * fraction and L is one more than the integer part of the multiplier.
+	 * See zonda_pll_adjust_l_val().
+	 */
+	if (frac & PLL_ALPHA_MSB) {
+		if (!l)
+			return 0;
+		l--;
+	}
+
+	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
+}
+
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
@@ -2322,7 +2348,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.enable = clk_zonda_pll_enable,
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
+	.recalc_rate = clk_zonda_pll_recalc_rate,
 	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
@@ -2998,7 +3024,7 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.enable = clk_zonda_pll_enable,
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
+	.recalc_rate = clk_zonda_pll_recalc_rate,
 	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261102-clk-qcom-zonda-signed-alpha-33846a18d82a

Best regards,
--  

Abel

