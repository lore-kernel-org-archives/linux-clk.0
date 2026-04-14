Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112F3D5640
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162846; cv=none; b=BqOz5Jf7J7woNcRIqcnV72Mf2ZcHzM08pjHzB3zi+j+7dk6kZDvDaaJzPCyy8+gxXtmX2iGzsxwD/vPPygpDBd2k/S+/ZQL5xaweMQdUjGBjkxZ+INV/3u5Hsyd2qAVbF+lQFK0z8mauy34SK7t2bYU9eMje23a0tnUh4B5LAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162846; c=relaxed/simple;
	bh=6xVop/Vp6aPMRmYhd/BDDjugJx7MJYQ7ilDbOya3PP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duP8E7Pw5wus0gLWmGCyCmyNADH30LEIuPJ02IW4IBqwLFoe4UycPDpqXqkOda7dQo8WkzlbIVc2F1A+CzVTwCjt93GgzGYbAaj9Myy6ORB4KenVQlXomtF3+oeC2xO+HVzPu4S+oAx64ugGQb8vqDAUyc57/tBoTqcAaE0fYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5s6uWQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz2Yw2xd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5s6uWQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz2Yw2xd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6kM3Q281295
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=; b=O5s6uWQ7H9Rt3a1O
	QOdLyVN2ZIocXVY9FUdfMmx5g961XMXl1pBHe1dPIC9+mM1KhgPctWyTg4z2xwx4
	q55Gy7EDbMxUqD/u1uIZU8sK5bMRcAgzCrd02Z4YnFTqQeZtHis+BFkHoHRxGTAp
	Zuxw7nGW17W7d+ILneU3Gfcn6uSxMbiEVIw5EwqR3mmj5/yaGdV4qXSSuu4FhXNT
	XrrcxlECKmfLtgBtZz7Rd7QtKzLlfeMPtobhAWiWD8FyhzBs/s+snq+irKjuPP0c
	YB3xyxbXXVtGy59vsElhtjgjGpHQiIS/ijL4+Xr7W9eJL5Qb3kxSjAHTtAgIWFtH
	xZdtYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vja0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 10:33:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50dec198720so8131881cf.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162836; x=1776767636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=cz2Yw2xdo5vN/WCav8zwcFyvRVX7h9fMcelD6+S5Y4OG33/wBCwJL/F275/4abhmlT
         4RXYM75usKqpr/JBQpyM/y7R+iIhk4N7XIwKEb451HEV6Neay/d6rVkNzztwyRSHXd28
         IP/I9yY24/orqadhYFfIODcInb3VFG7uEwYQaER3Fa8cA+klxk/g/Ffvz1jETEt3cWCF
         EhEW/w2zfOL78K27NxV4p21GIEzyDbVPQm6pvpTxZhMMIuMkZUYCDSAn88I30Zn5oQFt
         xSaOdYdRVu3ByLi5+wpRLTEczb9a2MvB7TBPLrH64aR3qN/KwlhOwD5Fe4iLTsLYqyR5
         Lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162836; x=1776767636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=VSfIMq1TX7j1IZ8Sjc4W94I2784qdwEKRdqs7xQq/uWUUWwGcE3UHAsWPOpKKCUxct
         uzzN/r4Ywr62THJ+hXKZ5qjyF+rpByDR3arXhP55+bHuqWEB2FxxJrGUs8CLFgmgMANZ
         9h/R2Sn5RKrQv4ka0cRPQvoF+wyw0waFI/fL61oBOUtmFwImMEvszEqRTukCG2I5SgbU
         cOOL7TyHp9fdO2q6F/YIMZ7eu27cvYPvISMST5MXz7uz3YXzHa9Yu92ME9ctBFvvF91C
         u6NDOSI4V3Crz7AYFuXATcVv9vy8fVVyhceSsX4vfKcqLEaiYwWI4/tlxzMlGXUGnuyh
         XEdg==
X-Forwarded-Encrypted: i=1; AFNElJ8Me8wKvARLkXjM6STXNmbv2raR8GoyhtEzAtmVF8hiE005b3sQ+bRH3UQJcIiWh5RLIP0g4PcQND0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrgj/qOARjHC0K5+/BKlufUHoW/ujqCbMTwZryBNqJRewboDUN
	vSokgj+JtWTwQezUFvq6fDLPkQFdSfef1HaC3hzpt0VtTK0AA5lKkVpoojlZVyJ7Or6vmmckj0k
	kUhKjBFAynHRJWdyuknuyo2w6GOa9EWrZ2aS3t/dEZIbLf7P94G4zt48noF9xnOU=
X-Gm-Gg: AeBDietlW9fXBWDH9VOLsHWIYqHb2bGEk0hSmchjxk+xX6ZYAp/rE/YfcdW5Pr+yCgZ
	UjSZkr3d+jyx0TgYdKpiheuAjtH6t75YbNDmV0GHYfd0adpJWDWI9ZUUW+/cuvw9vA3HajI0sjW
	5kD6ggqfEuH+zlicN8BRA7HF5M4DdZxQDqwcki5sXLypWf7vFpABsau4YJphYhG3JkaX4Htz6AC
	X4gsI/RyBDoSU17OOGkoQef5dlZm9CMtwxbjg1k4C5nd1SwQEkY5mpwjHfuEtdaRz4B7cQKNwVO
	kY2lglioPoLhIF6VXmnzutfG5qvzWj/sZPjtIm4TyYaK6aI8xobt3uh2mMN6KRWDSLcUo2PSqUG
	2jAg/t1Vcp0/QSHy6BYwQRqLASo88u8JICQv3oVBlv5bS2+xR4QPd7MeBOzIZJhc6XCSd0vUYQH
	wHtj1wJJ+1laCowA==
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534352085a.7.1776162836115;
        Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534351385a.7.1776162835709;
        Tue, 14 Apr 2026 03:33:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6718f52c111sm1018232a12.18.2026.04.14.03.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:33:54 -0700 (PDT)
Message-ID: <462eb5f0-e05e-4cc1-8d6a-6b06e105a517@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cyNdyOVJcicSTMW0OMJtZbe0tGeDBS6I
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de1814 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=ZL2hiuJarSggSDoTJZYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cyNdyOVJcicSTMW0OMJtZbe0tGeDBS6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5OCBTYWx0ZWRfX/z0FOpEV991t
 jqCcFzOy9dw92bnpg75FgrocD44kTtOvtDMOJF/Gnjy3+ZH14sud6WIWE0V+0lk3ZkpJtkzYdTO
 qCgcel24/Wd9/aGD0uO5tXmylGtxgBzrVLzQx2V877STequ9oCewYnoD2sCD8viDfPIaq29ejgn
 sEyOGsCW/sFRZzN/mGuZOhQ+cQt6UOYFG6kKPT17RSOcXJgS6vh0lhN8Otvu4Roub64D8ZCQxTW
 CVa02Di8IavNmOFYo4VnyuY25BiuziomOvIb57qyNwrrQAMxtCd68GuGwocahv6w1PcdvgiXAes
 8A2qyPrwWuYkXfz/rfcq9qiSRBc6GwYYUbbNdwSdyLLp0iAvy676WQ5nBOjSTITO5ZPXzreXURH
 nFjAiibUA+q3WJUy6a6yWbMfRznx3ID2dTy7Jn144S1xaieVEFO2CsE0I6DN7RB6lQPawBXfMKb
 suYgxR1Eax3KsOxigxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140098

On 3/26/26 2:28 AM, Bryan O'Donoghue wrote:
> Use devm_of_platform_populate() to populate subs in the tree.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

If you want the camss probe to fail if any of the PHYs' probe fails,
check the return value

Note that this doesn't necessarily have to be the case and I can see
arguments for both approaches

Konrad
