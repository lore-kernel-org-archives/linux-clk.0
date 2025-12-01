Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD3312835
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764595252; cv=none; b=b2DiJLHF8bvqbdYiLyHfu6AORslcEp/w30gkPstizrm6IlSJeoVt3cDmdf27DoatRzpWeHIIb1/2hUc7PvUIrgt3KwFnjjL9pzjx1aUM7hAA8pGs/fM36toiiutw4PcK9W1aGikikHsFLvWOOSaijBeV4dxPsLEKMHBo8qFuFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764595252; c=relaxed/simple;
	bh=n7jAILhICgNy4OCuW7Ylj92utthZIYSo5Z8pEC/WSWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEO9DbeCIlX7VZgZWEWvysX85T/OK/y3Swy14hOR/hJnmcWO6kBHUgIDFuID77REvPz3wjikxTrhj985Wr9DH7+RDYqezvZRIke1+B2CAiC5w1sKwPlT2Ey+xlKhl9Bn7wIIOvhNz0iYDdDDfdTnVHZHpj7axFeIAmVRtL5sFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwEwruD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehhMUU3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwEwruD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehhMUU3S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B6cwh399065
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 13:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=; b=bwEwruD/t1+yGKKt
	3ZHxIuHSVeOF5ji03VlJy6Jw3cWxIytOR1+f+gz2Rl40FHq8w5XzH7KNMq/MC9Bg
	/1bgWW573qIlr3SIweCbbMyPaAdVHxEXVOUe3YJK/APZflOqcGsrngL5jMSeEcld
	f4tYxij89hShYJcvNNlTEfwnEm+pDdaUdHdr8PX2ex/y2VJwbiUUGHmEka9miSIr
	IgJZA5E3euiz8yCDeKcWroSn2xjafc/TAy/xlZ6T3zQOsvG2sX6FmzARY338LTYq
	Cw0UoTU6zQC44Nm2zLsAYmCzYSKSBmJ9D4Jg/MVi7YSPv57hzCeZo9kRWHYOnAIY
	zs2hUg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug0bqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:20:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfa98d915aso377327137.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764595248; x=1765200048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
        b=ehhMUU3SQo+as2N1RV2kF3JNVGI0G7NADY2V+0J/fln3h9BqWNSnLoUDtH/dNNEPlJ
         8Akwp7sbPOXvT5EoX6S1CUhNnHLUAM4fOJpntFZkOaQ8oZMGl8whpuSsP6pCIC+bqFCM
         VHl+bNJU44RfnUdWICBq9siuxu9KIcw2JnwBbm4cs2eye+bX4D0A31Cp4MLkUsYYxoHx
         mzfky5NFHUjYy+DFaCoyd+p3YOf2CH8GoxovoQGIu+UVbkF9dTEGe2eaDtwUARzrUriv
         cYIfmcISUKIXl4r3BjWFOpn/uSqYw7zg88muBa6CTDLYQjn5daBhyaWkh5GaQmFk/o5V
         +4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764595248; x=1765200048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
        b=c2tIGLurBanr9+OQ5ZBXHZdvncU3cP8xQHHSxh+gC4x+LgfKmr/RDYREZbuGFSf1/B
         Vk3TtPdgjsqc/9TaKm3nxZLxCvaZ5w5BO2pySg0L2VUJHid1oGErbf0iG+xdBK/6fAJl
         F0+ow3EFZ1Vy5MygnR3r4fHHvqpSlLSedJ4jBqX6x+pP8ts7fVK5+3o1+r/q3X3tAyZb
         a78tI5AC+yBnvZ4+jBkUHbeSpWOxkBkNodXAOZcSJKzFCQsYH8J6xfmyMJSiQvfNMlIX
         1Dc6KSAF+6BUxRl6zkZGw9ozwHS2AZ708k4Ontfu0K4oYlMjH/wuA5M8uMx62iiBOeRu
         kAcA==
X-Forwarded-Encrypted: i=1; AJvYcCWsoF9K00El+dW7u/3DT5gxFqpmPmavfW29dnGAzduBctcX8FA5/mpaCHjOjFKdcFlFovE1OvoGV9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNjUidyNtfVCkFwnBqR19dCuF0bpiLnYKk9QUs0NJxkquUrbf
	m12ne341nhn+5WyvdTKqip3lqb+G/H5xz7bp8ptxpcogSQCGonJ60iGftrie9k4i7XUBoe3iy92
	9iUt8FOsB//MipgUMssP1DjxSEOdklradsG3Y9OwdvwBw129i7Nlmq3anWVNSz/k=
X-Gm-Gg: ASbGncuEMt0YxH4YmuRVG3MHPY6DDYs9Hc56Jo9+I75iytvfQz7Mq4dXy6H6L/Cfl80
	9A7DLieUJuXokwSx01gGSYy7fK6lnt+N648BVNFQ5V+aNAtJgR2VM7A6Uba26VJ6Pcarcacb4BF
	bkVvNz4Qau3neiSYt1EYEF7zrUkeQl77Ht2I18fNIHuy5z5rSkGQWO/17pFSzbSMEVwrMOjO6wY
	x2jYdVDa1WyCo3M/qdI9ieF40Qnk8cs6G735lmBVf4h0AZOHQ4Rlaj/TjzL1/u3FZ6SY8QSXM10
	RypV5zntuoE/QaM0OSCqexM3HyUcdBJvzFfrfsU8pdOvKroFFg1P7s8cel0qDpwgKfaDE2xaSSz
	fQvpS5OHo7bPfmoWA+pJA1yYET3nNY0kbIzZGDR6UYz+fvUGms0AlyhB/jiuyQwjk9n4=
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr7907304137.1.1764595248353;
        Mon, 01 Dec 2025 05:20:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJer9mBVBtbELIfrNvmv1HkEBNnwK7vOpXOPYANlc3/9Cr+1NOG/fhoTmkAz9sJEK87Be98Q==
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr7907275137.1.1764595247937;
        Mon, 01 Dec 2025 05:20:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm13571646a12.20.2025.12.01.05.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:20:46 -0800 (PST)
Message-ID: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:20:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOSBTYWx0ZWRfX3ibu/AjRrnZN
 EgP1B91vf32OSU4jqmecJkWzfjr+hl/v8CmUL30BYYUXll0IuVGbLOuznmbgqeVl6QoteWoScTz
 ocx79Li8XnsHrV55pR1v3tOps9DjoyKSx20TdC2HEzl/pcUiNemW9J2jR9yisZacOin0aeRn+7w
 z6l1VCJnuIycYPxrXSXPa7pyqZ18hfsLH6pM3imtf56zekXOJG7YHpwhigMoNUrtXHtQ6eSKOby
 P8qOuQivyfJ1vxMuEROunAX/VoRqFUkKtUYXTcTaHBMDLmDo2nKE+NVi7Hz60Y/YiXcoI4Bc+42
 zD2H958QegWdrcf3wjd4hUWlyY/OWsSFfj6WQ+4AVW1UFb9rzznFuVKNr39/gn7RPtjri6YhUDs
 uk3Ka7F6pLje1gHIafMSGnKVfRo2/g==
X-Proofpoint-GUID: fSzrRDoa0AjTH2es6FiJUSw0su7JbLiu
X-Proofpoint-ORIG-GUID: fSzrRDoa0AjTH2es6FiJUSw0su7JbLiu
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692d9630 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yXmZhl0dwuD8hoocJaoA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010109

On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>> Support the clock controller driver for Kaanapali to enable display SW to
>> be able to control the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---

[...]

>> +/* 257.142858 MHz Configuration */
> 
> This is a bit strange frequency for the boot config.

The frequency map lists this odd cookie as the lowest predefined config,
perhaps it was pulled from there.

More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
effort to use the m/n/d registers, instead relying on the PLL to re-clock
for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).

257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.

Taniya, we've seen something like this in camera too. Is there a reason
the frequency is being set this way?

Konrad

> 
>> +static const struct alpha_pll_config disp_cc_pll0_config = {
>> +	.l = 0xd,
>> +	.cal_l = 0x48,
>> +	.alpha = 0x6492,
>> +	.config_ctl_val = 0x25c400e7,
>> +	.config_ctl_hi_val = 0x0a8062e0,
>> +	.config_ctl_hi1_val = 0xf51dea20,
>> +	.user_ctl_val = 0x00000008,
>> +	.user_ctl_hi_val = 0x00000002,
>> +};
>> +
> 
