Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E2288C96
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048754; cv=none; b=nCUed9RE8NIeZlaFk0cEvKLvlFFlAjph9BxLlF9eZm2wkv2PUg6mUlxfC4R6T0zlZa5MduD65fjcx+KEy87IIUQi0vSYsbEyp0oBoEQaDx1qm6AGaf8mpgnvpJgSl95xZxxsSSTSHaxmbgCBf6LSKmHFnIMhyAKMBMBm5dtU6AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048754; c=relaxed/simple;
	bh=1r0XTOMQGU2xqD/jHwP1HAytUoDOeZBgYrOUJrEQslg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiK+u16e1gG3ecUG3LUlCCisXqroVCSXaOle10rlBaWxITSJKMSDbLPdkrPwmiJKu3HhzEwg3wAQNUCaltRnIcKQor3HNRepKUU6TYI/zyDHSC+m3mZV8zqIXW6euGWaBs1B7rP0PQdTYIwqy+Q7HoFXcKpuc7NNnyxzrkf74iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbIZUxXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qedll7Xj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbIZUxXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qedll7Xj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9v0Zh2104470
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=; b=bbIZUxXQXnDMy3YS
	Bzz6sEk/pcPyBTN7y4Rfw9c8hMEq6WRdDCGi7O/fp3HPRViXBiMHQO90P9I8LQVl
	Y6TzFl00AzomyRLThMNjfhuz6PuPO4CtlX1MhN+mOcZ1WCccDqEcioK3lq/s1RPc
	GeUy2KLMHI5X/iU41RwpQx+daNKJvkj0xNgJTGwpCntrXeKQ5shRf4B6cABn2DdL
	+AyC1+NOSgh8YUDMYhM29ZoRIFUO1HSbv10stFHZiTcjMpYc0EkZEVlMCpFHTrBa
	Xu3raFDD1GFjlCT253Kyo0gRmIONdoeJ/Fe+HWQ3IrrMlT1Hk8h2H3kr3+PjR8dO
	JKjubQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5k8g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:32:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37ca2bf8e39so3892045a91.0
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048751; x=1782653551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=;
        b=Qedll7XjAt5VxInBr+JEWf0YMNslsv+KwP6U+iXxBH2nhr2OGIwWwDex8Y7NTUqSaN
         dxtFqGS+stQAzf6BGO0hikmrvQiGWPZF9VhBRVwrr9AcnGlKNC4ghF90nEwHhmIUhPoP
         3kLO3PiZa/WTZ37tzUa+jotix3/S9zkxs0IpV9f4TlEtnBRcZeTJ97hC2wVq2w1dITUS
         zP4k/itZ0lPjnxHccHa+7GsD4KHHfLe0b8bwW4AfX157UFboPkSOJkrxaFdVArr/BqQx
         w7YfzReIg3ZfZPobxplzvJEJHV/UH7bj9Wdu4/SqNkon6f7XTWqPSWuP9wxO/mQv+6L1
         5KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048751; x=1782653551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=;
        b=dazwbnHHzCHOvc+a1YINtz3bQejvcPy31u9MA3WzhlO3mnZcSJwAlOdeNWUFhOGbYD
         VeLGB0iPn+Aj3tGofimmXd3G6G3VtwaDzikaCwj1ZALWN3eJ3wsUXOZOyhI1WKZ4+bd+
         c0Zar/UNSRy6OGIEPtQKgH720qJmh+cUTXUHwNn3xh0q182cfp4jubOezWF3zSZpnDKu
         JuIbzKY75U+RxCPPvzxOEiCg3L6LGiPweFuIdIKaWlyq8PcAOprxXwCbUyM89y5jRf0I
         SJ6Kjpdio+F8T/eazStlA3t3hdm+4AML69tqbDxz70YklEFWIuMObvAzqa78KENB440A
         R8bg==
X-Forwarded-Encrypted: i=1; AHgh+RpRxgMQnPMMVdst8AFmqktqzeNgyfDRqBV1bDCwuCG4tK/pBO8j+aZvBzoUp79yjkjsXv6pYkugey0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4EN5EglGcobBg17Q2uZILHpN+bkwfLyCoxEvixJDlVcHoMQS
	tme8YHeSIcs/WsQR2O3ce/Bn6yxxPcUCb4ZFOrvFAg0AKuR/eQvDU66gKg9G++L8BD1dBDqAdpX
	dNz0Vq9o1F9qUxy9io5KtDcGGmfW0PjdBBIg6Mi/1rsNU1eNqGeectbpumpi00QI=
X-Gm-Gg: AfdE7ckgVBae5qHLSyT8/PKYm8fV4VlDDhQSZTaNse3ex3j33BPZ7o4csJCH5g6i2xl
	Lq+xb82KdM0ADFd5GJAgvAJx9NyahV9RiKPe5EAHv7lJsmzbAS69jMw+kYXxM4CC5g8qK98LXqZ
	I+/utA9eOhmK16VSmut9tBpFmxFTDKw8DZmRg9AQdCYpr4h7XQDLzXk/2AwVR3t9iAeDEHnOZfM
	NofGcsYJn4DhssuooV9vK4fyvjlns+Dn7OK9vrM5tG7LUSHjaxchC7lmI8Vwe+Fz/p2Z4HKbkKU
	/LhNWdCkGPtF1CLlBjfobUC4SA2uFTn9wLAUPT7vDMqzbvMhFw+E5gm2bLaZbj/w8jWCTxn51Cv
	PPI1YVwyQ+aThFPmgKxoV/zF1VL0gBwzg/PS43W4K
X-Received: by 2002:a17:90b:2d8f:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37d15e8df93mr11895186a91.18.1782048751316;
        Sun, 21 Jun 2026 06:32:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8f:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37d15e8df93mr11895160a91.18.1782048750919;
        Sun, 21 Jun 2026 06:32:30 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1536a6ffsm7658954a91.4.2026.06.21.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:30 -0700 (PDT)
Message-ID: <20c9f6d4-0c94-4ef9-b931-7c835131da3c@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:02:23 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
 <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX+uY1Uz5o9asj
 BigF9RH06g5ORiWbBjMz6yHVqvYqSIpHGbpc65IX/1MVyEK7Mgl/QiThnAKfmj41ha1V3YgEJ+R
 FLuyoOc2fXnh3u6BdxeODGkdNqSpUwdNMXvpKi9LbOc5ziMOB5hneL/bcw0GcP20XalOj+CBtFl
 5LrLTuVjRxVPEfufQ0HIbPaVKdri+0vjFoHqLnhY76sASLqNepD0jh41A28rUzVBrotnwP7Zfzj
 K74WS+obgdlHhnxZ8s1+pmkODGOr5emimfi5kQgwQnAmwFI3MPFk48HpaEYii+0h9KzTqkhHmjS
 gtfNEU+qayRx5fqW2HD976Kne5M58nV+LAjqOXf4rkevm33iidao3619nwkvVeDJ4GaxxzlKd0T
 0DJcEdqLZBtaLTNP7aSH7qk1lChXYNuYjHZlNCXm4HMxmGKiOyOJRlNDY/0TFsIsPrAePKyovMt
 UBTu13MjFVEF8IG1DwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX9lAfXrmoT/Nj
 1EhHLEHzcJsB1DGOa6kTzYP1zWQtz31s279wJY1nY5rbHm/w2FRpH58f2qtz12mXxA8/PT0x6jd
 0Ekk2WT2xmFhmwLTOawkdesG7wrrb2A=
X-Proofpoint-ORIG-GUID: nH19pCrPJ2TQyt548OpMFESX0RAjCdIh
X-Proofpoint-GUID: nH19pCrPJ2TQyt548OpMFESX0RAjCdIh
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a37e7f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uBvOtI65r_ZeAi5v0UAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 10-06-2026 07:30 pm, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
>> The RCG's clk src has to be parked at XO while disabling as per the
>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> This RCG isn't marked as "safe" downstream, was it overlooked there
> too?
> 

Apologies for the late reply.

In Shikra downstream it is marked as "safe" properly, but in Agatti 
seems it is overlooked.

> In any case, this needs a Fixes tag
> 

Sure, will add the Fixes tag in the next series.

Thanks,
Imran
