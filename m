Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD94412BF2
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572571; cv=none; b=d/dO3Hqg5BSSAuEOrCIfaRrruTY4Pc6CgbQNQkyBJeCWqKaCIFPdb12BTCsHNsnGg7qQmZyFmfExh5MQWDY5VxQoJVf0VjOAsSLPEGWZQy5N1gjSdOqMaESKGZ35Y4C/wiCxh52NCxcoccxEfnYDMpqcam9G4EBdJ4KF5V+0L+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572571; c=relaxed/simple;
	bh=7qPJx0L9ZJ8IejD/1N0QGo/uon+hk6wPWX6yn1joseg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/4V4PPaZizVH1zcRd06ekM9BGboqNDwIxZDXiGdEwFGNZYUCnm4k+ZiVtIa6BaLX1fd0Y/dqBBtYLKwX9du7cv6AcsL6Y5JY0GSg1dIVfzOQFH4PlCnBKKrUu9JMmkgRRwbRooetPQmqT5vrBtjH1QhyDmKTUw+cH25phOP3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQrGtPkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwBiSnMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQrGtPkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwBiSnMK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMPwG2743036
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=; b=XQrGtPkLyb/1B/ej
	Lnj6mIFbSH7kDy5BenjWDn0eVEM3YAy5zfXQUDYIgy6Dlall59nNyHg0sC2GN7R0
	SIGZMIBdzqHdp/MHWBNfMcscar2qngmaxcYmj436NCMIvbIUGxE4qLaiAXYGks7H
	MGt2YzUOdLW942Rc3hYhzzxR7f62AYs0YA5+FukTirDGSF9PRBOmKE9hWBUysEFa
	vcF2jPn6VH1tGcow7oVG4qs5taG8LwvLJ5H8Ngk8JF/+R9ToZObnASlHgPa1TijF
	BlbyexpIjVZOH2gORca5pkRY3h38JUTlTJOgeb2a7/ky1GDNiC3tk5rgZET1gOkq
	EOYlBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0x0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4f6ac06aso63241711cf.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572568; x=1788177368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=;
        b=UwBiSnMKl8ife00fXV1B9rfAQMmTr5tGJqxEVOc7nYE5wzrLiIa0S0YHTPsvvRf1kN
         zOgy5VHmn1y68lgRgzFkU3u+v/W32rjFb5R2lEHIbMAEsmxDcfdeUA69AI0s8tMwqg07
         zYwckEkW6a6pU5o31Z/cggRU2YZZKWVpftUV62pzp8Y4rqL7RYgB0JbJR9MGefTuMx1G
         xKpDWfx8+GsWEkexJwTAUScv5bNgKlgtLbM8rpPAoGw9X0FOx4yaUG78ogY3F4xLwAnu
         r1arW4VNUJTTWExiivABo+dPAgEmzmaHZ2BD+THDW6rXq/kVOLWTpajiqaeFW/XdaVqc
         s1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572568; x=1788177368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=;
        b=Qth1KBiffE3w+dgdUzX2pKjpsVa2uGwI0xyTTEZA4Bmvo7if38Uob7xqg+yXBtppF5
         es0DrihTb2uvEEe3rcyQa7rR2L3086+bptnyqGfF7DCpBikFYkMpq541TfBqrs0bszIw
         hbyeHXHEmSpTr5FPwiPEDe40zP2fuSajKZjY6EXGkNC2ORP1u9T9RgBz2HudNkT74Ai4
         W2M087mYvAe9HYJse/daVwKj2YG8bnm/tMXKTzbSAgn/nLL3l0M4KuLSrnjcBgi9t0+p
         5A+lAPu1kdMeQdgYDb04AyM/5YIEXNc2vSSjCpMjJpcPTh88HR7oJiMG8/jRYhNTP8Hi
         9+fw==
X-Forwarded-Encrypted: i=1; AHgh+RrryJXvuc3mMbECQXkJxfJemlJ4Hn1X3T4LG4+jbfFD2FmY4E6jBZXPZvc6I6QTXcv4FFPJO+kynZo=@vger.kernel.org
X-Gm-Message-State: AFuF++mM2Fm84DWvfXgwj5Opqcy/ejshenFGGNvBTMkFmms1EAfFqxY9
	NB2NYu9TTlapS9L9StrTYmoXuzMqJB1WhrhSRVYmqIrRRPpQd/nyQBFC5s7A5E0rFKHpVFrRlTT
	XlXwodWZK7ZGO4K5ruR+WMfV5CTW6W5IJ7cNdBUjfDB+Cd1jXM5TvIvVJbVkP/P8=
X-Gm-Gg: AR+sD11ubIyRtqbV/t10zf3hC3ERm2uXkX0jQl4YRw4qrHmJE8NTOv33z9VKjFjtxy7
	oWsqA9TWKUNGSpXgaY1UXdipjnRKAv5gc2JSw/az1Hs3XLcqIEn5CtJWBFEAfRV7RW0ajSXl25B
	gWZaZ+XbuR0+8zOgh4xmw4CubC+HyC8YMzpNJQeGM3aNWXjKx77x+YXIUF5fcjoOdZ9oiiNVA4i
	saa1HDnXWFsGa3geQi7pTgV65dhcesEov3nIuEK0JypSG1Gq7n5taqOp+YlQaGwDa0BFQK8r0+F
	LStJpcC+GKLcUKgc2Z0mDvui5FUPOKRg3LF7ADJ8wdNpL7HyBKtpNYh0U/5ZdUplh/qo4mBXX49
	AKOaJh7e/
X-Received: by 2002:a05:622a:989:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52df59b1033mr256263851cf.31.1787572568243;
        Mon, 24 Aug 2026 04:56:08 -0700 (PDT)
X-Received: by 2002:a05:622a:989:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52df59b1033mr256262991cf.31.1787572567689;
        Mon, 24 Aug 2026 04:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:15 +0300
Subject: [PATCH v3 28/47] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-28-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7qPJx0L9ZJ8IejD/1N0QGo/uon+hk6wPWX6yn1joseg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDwVvYy6gwuqmzwEKypVSiqIQtO4/Fnxqg5X
 pEg60ZT5waJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww8AAKCRAbX0TJAJUV
 VqFID/4uBw7fl54V1epuuCQ9n1YQ2zOuUSnHrjfLz95NrG4/wO477aOIY0zpZ2BcwGnpk2dGe46
 kRoHi1/2hT9i+RhrxuEK7/dd07i1Gd3eTGbOmKn7TEljpOr9mDJlUfHmLkUSAB/xLbffcrAMiKV
 +ZK2ryyYRgbpu3XxDLq+jYXD5iH6Be0NVzo5LLMZTsd53/qPZ8bk2JI7OS9qkw2vOYnh0eTHoCj
 JzecYkekztBwurrKYh1IuFDSwBTqy5x0EbLHmPdukrqLbhTfZciRZLxV70Rf8rXdQ0hXR/CBZJE
 ASOy8ih2cYgSWfgcJzPnRlBfOHG3hbFq0Eksj6WdNbCuJRwoNv2EQO+qVP/w+Jtv7xW7Yoosc4t
 4RLbqfBC7vG9A0gSLOsteBNjJ5UWiIFx9RQw9a4WAgkQG6Ip5iFeJY0vH7lQQWdRcZWPmpM2MPX
 DuPGutKU3dOWnljr5U/exGbpZgxrosZRhnZnbt/+GfbmuZhA4ErY08s+lraAwllXqc4XKcK63AC
 dbaT/+ovTZYYH517B8gXmTQY1/WeJUCs8Fb+N5ECd5t7Rge5yQrW5aGH5QVLz4B7sCOpon3YxCq
 yprJJ/8MuVI7lXbX39Z9DYmhMmvAy6SeaadeOCOT9klW7JbpiSOV6GNXWA2+Bb43wUU+kK5h22W
 frtd/+EYI+N7ekg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0LrFYGNaGbOm
 RzR+Q8tzxazyYM4Wfv4yE2XRFBW7j/tEIhmH5q7ydripycW/eP5nbUMi+VjnpkFj+hvvsxj7yoR
 VzhWq4NbrkyJvALGoST7QEKxHHe/Ku41hCPrIMqP8+qq+ynExhUyrQ961jNPxBShdQCd72GXEg3
 JNZebLsxbQ1zXc6R+9mgI3F02sjYkfGTwriZ5eMlVm4lv4dQcuLw7cfeeE/YmLiwBSfbOZpiPvl
 EdiGSf0rc5AKLv3tsLiBTufgJPoIPb4VIoZfgQcZrFtMJbhN2EMBMDqv6Y5WpnN8HykiSbHRKfu
 aWOG86xqazMc3UMegGjMIHM+4C+U01uizz/IjqsDeiTYBDZ9aOZRLoaEWHUzKIDTeelvDwjNV74
 /C45Pj1SJoJKik7AZF1QJ0LfeR2SRTuHpzyKNbSCZbfiqIhj+rDE2VvbrQPGVBf0Yy1A+BPllbZ
 nKPkXOlFlhmanNnH3jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX15KoLMb7Ml8Z
 +YeF9QBCHu6wZaCg05zla3IwoOz9wwpUyOPCU8sMpD5HYhdHCaS3BvivTJ0y03pePsrxJukCk5A
 D9sCpRA/FrbPQxOI4L/duvR1ite2xPk=
X-Proofpoint-GUID: JWBVujI64yKwbkJlnc6O3EHeZCT6sDgG
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c3158 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JWBVujI64yKwbkJlnc6O3EHeZCT6sDgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

