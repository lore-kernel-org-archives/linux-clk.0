Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4839023D
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273367; cv=none; b=UPWAsXTdlhf6fuK2C3R37iyBWvH3plCkgcQTgtjLjdr2SNj7oql8tkJLQ3Nl0F75wCgaVEmmYLv3lmgSa7G/l6Iu83pneXl3XG6yHx2gR9b31wGqYdPT7y4Bff45YcAbiqeUCnWQ72sVuQs1xCLO6QMclH10+35DPn+qKaWXS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273367; c=relaxed/simple;
	bh=ORZJohmK5TJwKjIgcSQwFdPYkt1hqJn+bhGVxAAdAq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIOoL7aTsUWdjViuTKmTIhF8+1io4PAeCrxyULQpeJU8Troq3o34AK/ogUgCSg88jVoikHNVqZqQPxH7t/vOLomJY7qQdEnC/XbrO7kNSDMAT4vFu/OMpp9nKNVeFBovuF58bTyHW78+o/pylyGG1lJrdC42Q61QBpJ6QiRWDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ3GIHZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeEZb0R5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ3GIHZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeEZb0R5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QLF6lH1454631
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 07:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=; b=aQ3GIHZcs17YKb0u
	U0eBA69BeL6R4GoA+CulkE3V7ta5fG3HI1aNc5Jd5Z685bIG8i20AmgM54sXpfzj
	5E4FmxnF+T/cmt1FyJZSiOFZc5/cMOuUXCheUFV3rhLOsvZwijWfeQoXhduJIimJ
	Y9OpQzg4+vg4TJRz+TNQhFb71wKN7HXP8Vov+7ql8FcrWIMdcriPKKvpU1AGatmI
	7Immk7Oy38ZIe41ZjfyRrJjUurUhTO3kuvwTwwYf878G51otJf3I33LBak2KjutJ
	gKzwqgYE2Zd3/dXXOaCW9RlONq2H1gfHNd4Xe0a5IasPXteKohaGNPpnBlJXcjuk
	UuYs6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2vthn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 07:02:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so103103605ad.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273365; x=1777878165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=;
        b=YeEZb0R5ZZ4VtXlVX+oK4dMN72Kmm7uVv7we+5q+G0+CEPvnQS20jwMTCK+b8XjTNN
         yqJ2C+G3MI6t0PvpHoySalZZb1qd5t9Sdc4Xa0P4pBTYmh7rgTHCk0LN2wEFcV9S5h+u
         nd8FoNC5qqrUAJYG7W3g6wZSkGK1pduXQtiG27gGAhiJRmgmy44iouQjz3tPTxyhnHy3
         ohQooAfoX4AxrpRyu7Rp9eh8PxOImXwp+KQZYYKI84zF/QHwggLITzM4XFdjSIK5dA39
         02zTkVr6g/B+F6fBY2FbX8PktuzocnzArUwOuPrHI8XJTet3pvy3xvAOblBh05npv8YV
         ECZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273365; x=1777878165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=;
        b=kqr9Tz0B53fSSRxFVQ5rOuTebURQFteigag9Wa3Pn/OOiq4rKDIXMnebST1iBoj6xT
         /BQQ+uZt7zyHSPiYEDLRbXF846z6uTPziz1YDEgJXUmlC9oxqw1F6/v5+wTZGRUNEuhO
         CQQpueIpX1lBhQWTC6MzHnSbTNKdHv5uAckHRMKSkh1sGSJ9FlCIOerzvAIpIi67JI73
         /47kku335jmJUDQUmsIaa5EdC8RqTjIm6M3AkM5COxpt959qoSYlacbqaL7tN1QG6BRq
         yH9Dt9l5jVNopzfcPs7V4U7EF/QpgnDveoXh/wad/bGKqBr0KRYRespU7CgOy9OOzzCs
         wM5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ncbvQePaaiXINfIQ9D6DZcRQMs0U6EozJ1uA+VL6Wa96sz9CPh/cIDzmO4dslYCWW3xTkaoueqbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6jQwpsJxs9Ls5ENZh1c3y2melHR6nOBb5EiWa42UbsS2Vv6q
	7u9EcMDRvWqHyAZ4adYNY2CjszbWQNygjhde2x3f33Ea1kpKQQGOcgqJqKlpTZkE8TX9RqKtRGk
	cAg999F4yZcxdCqSNUKzNXd6lLzLmzNIFi00ozocqgyB3+sHNIm3fiwcn4xlYXwY=
X-Gm-Gg: AeBDiet6jUEFGNv4BatB9oivrRCA3MI6Cpd7nxnVvmEsc1lSVnSYKFZd7cjYY3/oXuO
	d5oNu3IFR6DguMfZTMjnbAsmmb8jI62aZnl4t9TraId3O7ufjq89yfpOqStp2/7gPbMuWpepuJ3
	cUkHabt5xuqneWr1onGCwciMstXg/f+gR4NbEPQuutb17xaX4YMWX2BB93ozxrIaVYrvNOQIa6N
	rJofErZkMVzoyfZuQmjG8lLaHSytaIcxfmBUVbOlcs6EqR3i9wOkaOxB9FTmdVHvLxU1b34YC19
	OcNHWXITOhGHTb6q1E2yLvBcttATYdIzWdb3ahxfqObfBwmeOl/GqcBNd/3eKvhUaf336JrOyPO
	ZwHtWyRCVO07jiU5DDJd//6vCGgzOPNIGQOUxSsR4QvFl7ZyUqwuCEzJX+lMQ
X-Received: by 2002:a05:6a20:3d85:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a08d8a3841mr48577489637.38.1777273364996;
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d85:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a08d8a3841mr48577432637.38.1777273364492;
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f94204ac8sm30251203b3a.0.2026.04.27.00.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
Message-ID: <d71b1267-11f0-47fe-955e-b1183a00df0e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: camcc-glymur: Add camera clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MsiRvDeJ7Nbnyp-akfQAml-F9cBJjobP
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ef0a15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_NJzdD1rvWRe6gqTKVsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: MsiRvDeJ7Nbnyp-akfQAml-F9cBJjobP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX8e24FhLrlYsm
 vC4t99yDnG50d2oGTYVt12JMCz52sRvygHkHqLcMwC155MXDb+wBS5G+PvLMYHCyX9u2HEDaSEc
 hJzWXCgC5+HTTiA09XvzjcDRRYi9nZM4KLk66bvCvDSQFXpLpVIPzYHBHyPITta7+IgsW7tiksT
 jITx9utBfv9KCi4JAY+H8o6gSwRQjwEu8ZBx9VN68Odiwaz5mTybW7ukn80pvqX1G5uA+lI0Grr
 34t98Ek/gPkKVu1lqGiGPWlj5y2I0E5MQ5vZ4dgZpzhcGn+MLpos6CAw0PIPtJjnBSeSkuTSgNY
 VFGqoAxAZeqb8M6Sb//vZxrWcuEOE8w3wSE+GOVr1PmCgo2egoQjD9Fwo/so5BlS3iHrc33nsqm
 vqvQhNOYjboEOBI/eF5pWznUYOanUnlKgHvNJkBb8qQ4xT58sh4kgixsREdVLnDLjPctuku0irF
 og2cME5ENtgIOMt/b5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073



On 4/2/2026 11:45 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   10 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-glymur.c | 2280 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2291 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..b8306c89ae89867a8f72e02a3c64bfb47bd672f0 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,16 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

