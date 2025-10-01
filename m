Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F0021FF35
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310524; cv=none; b=qsba+XpptC8DS3H3i+TkMf45R/5ElkbZjstr+WfK49/sm/Abg6qwepF6QDDKgYzfhtiJjY3qrvOQYP8QAoEktyAUo/d6/G31nvBX/0K6pU9bfu0N5/mvq3Sjp0JTlj+duhPoLvWP8YDs9FqxUVbJgpgY7te8ScPhfvGupjLejPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310524; c=relaxed/simple;
	bh=IdRnIcS6QKGTsIaT5QjTI0wJOvHQNm5+p8Y5bF8BEoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVrLZNcGEenHjxcYTDytWQA3nc9TtwIjufmRc96gxXzKKN2Vk2YLd7PIA+XZaotYAUOIwW6YpEK/tLZy0BrnQCRX1KpPdUwiZS0THEhm283eP6UI+40tL1evU3Q7SVv1L5jYGGZlIo2ZDdUytTV3KH1aE3wktXcMhV/B06rHenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9tK689E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9tK689E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919B4xp025066
	for <linux-clk@vger.kernel.org>; Wed, 1 Oct 2025 09:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz0VTKMOPpfUrE/UuDLPx/DiTF0z+t2Cca+4t9M7as0=; b=X9tK689E1sWeCYU7
	Oa48+v8p49Tl/xCE/8gLhfDuvtfkhHGw5/7fqIUOQmpMIu12hLGHd6z/A6UQcppP
	KrVztvZW2MjG59ZuIaNM6P2rHAbv9QJCad5UadMheGQaBzOyTu/fwuEXScSSbPxV
	HX4C50+9eP3b2gaSkdOc2xv5OmS3fa0P5bYFZom51c6DqA62XTricJlP7kJTpqfi
	FpLtzQJGwueoEI8PzjfpWliFjeim73bXQfIGqMG64Byt+nIpcOVo7UrxZmcmj8Ah
	/mdl0UaYM/djE/0SL95megroMtjIOhsyWPg2igRBtoHvhCuixSVtvm724Huph9Sz
	AriOiA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n4ddy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 09:22:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dd729008d7so6611771cf.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 02:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759310521; x=1759915321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hz0VTKMOPpfUrE/UuDLPx/DiTF0z+t2Cca+4t9M7as0=;
        b=tg4YbfZTw3Cz6b6+o4K7jvPWBWWBwc+P13QGDfZZLQA0lDLe5vKMv1ns5QIbvkctIS
         s7+ogoAOFR4pa9AZ+n7qoMXAp/QgWtG20Whj5KduW0S7GWzPbsWqqygl7z12FIQFHXRq
         l7XcCmJ36gok9blplbyMJSsytQphpCfWv+sX5A+IeJ2wVk6HP871z+YbxWZU/972fmX0
         AjUE33hRO7qflrICInARQxMggHqANwSydrsrCo2Mjb+yv7ycoKl296Z7qOsooQ/OtxEr
         3obwEFSQWfGwZ5meFXnLJDdsuMqd4NS5/4xI97sX4HaAd0hrcx87vM1oTneysZmZBFab
         +Vqg==
X-Forwarded-Encrypted: i=1; AJvYcCXn8epPfq7qKpT0+5Iw06A62iij8M5Zi4gEZDWJf+VrZ+SV5j7lfHr/4Qgc2KKvgdwi/If6lIyrZ34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQnkLmKCkESJkoP5ttXkR/FTMXBEzVmzXDMNz/8EUT6lCZpyO
	16gjYbqQ+8EjpOzmlji0cYeKSVDqz4ah9AcUDCVFCDxb0FxUXBOU7BR9Z+PQu4+R8HRkPmkz1+0
	1FmdXuqiaCzEFro1sQHLdGFMRunYr9d1y6AW3lNuk2+v89KuYRXt2BXa2umqVQ3Q=
X-Gm-Gg: ASbGnct9dpLHcfNX/Yn8Gw0zibX8rtorUFQNmiqQOG+Un//9euP/6U6fB/5jpTeJ95N
	LrJwL7rCRVo9tIXxTLdAHXhvA2LokPOVT0a6t/45gTexL5jg5onbhXs0+d7V0spuAKgUogDSNXw
	qU9AM3dkolXwAZ+dgF5w0jzO4Ze65ykBm8hHxIeTkspSt5hgZZ27JOfO8wYxiUdQK6kcULNJcRM
	Kf9q08ruxomrsPiw+zPjqVBibaZea6LRcdEDVjmCEAIAz/l6875hxf3uZvA3deZEtekYFFWty99
	pV4Oevc9Ny+snlfBhkAgkYJ34QSyvzKxaalc1SmSKLlhJFtoi3T4yLgP+5MNr+JXOO9DorpS5v+
	UNtkrzc8CzqOqYrMhNxC2sXqWo0s=
X-Received: by 2002:ac8:5d11:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e41e91e3cbmr21974691cf.11.1759310520616;
        Wed, 01 Oct 2025 02:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4I5AplJOR96MzKDzS82JAqomgQQ5+85uACxZXIqYc74cYo+UMLycwKcE3vq/qFToNbOcKEw==
X-Received: by 2002:ac8:5d11:0:b0:4dd:3948:3380 with SMTP id d75a77b69052e-4e41e91e3cbmr21974551cf.11.1759310520172;
        Wed, 01 Oct 2025 02:22:00 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f575aa299sm573251966b.50.2025.10.01.02.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:21:59 -0700 (PDT)
Message-ID: <c8803f7b-74ee-4722-93fa-24538d5bfdc2@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: glymur: Fix the sec and tert phy pipe clock
 halt check
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-v1-1-55e323cc98cf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-v1-1-55e323cc98cf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RA4PNH2vmc6Ta0gv5bEAVWAMn67EGPFT
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dcf2b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=6KCzCHlq8YoJfQJeh5QA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RA4PNH2vmc6Ta0gv5bEAVWAMn67EGPFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXwCWq7Dp6ZXbm
 OMUCqjghyFL9MXQoVGhirImOeO9QzcaZ1IiaAezDRkmdfqAwAvQ6LauL8IOZZ0MMXTe4JYkz+Kg
 7yg7aV+Fp91bW29k6Tutcj7fBqx31woW1ZauIAUxf0SK6FxQgI3dqxCem4nldQx5ewzDuvERvCS
 9JOMFUrhch1IIZtOCPpwaJG/78bMh6Ozc2Ot/PmmecsNUud0mkWWq0obUeX7jd/Dmut7alTdddf
 IAI48x3nE7x7syreg1QExMrP7irdD3K9nbtWgb8eGLd1op3mmuP1aMPQE1VAFL/7thldlIeqEmC
 cATZ1o9KVfktxUt1vPyDxdeW17EcHu7vRRRxaoh86mRe8TRp1SlE5GEVpqC2jSoCVQ5lHDzWT+L
 E5tu3Hxs/CYyQm7RgIeGuXy5EaLC1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On 9/28/25 3:14 PM, Abel Vesa wrote:
> On Glymur platform, halt checking on gcc_usb3_sec_phy_pipe_clk and
> gcc_usb3_tert_phy_pipe_clk on enable reports them as being stuck as off,
> but since the gcc_usb3_prim_phy_pipe_clk clock halt check flag is marked
> as delay, means it probably it should be the same for sec and tert as
> well. So replace the voted flag with the delay one for these two clocks.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Taniya updates all three to _SKIP in:

https://lore.kernel.org/linux-arm-msm/20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com/

among other fixes

Konrad
