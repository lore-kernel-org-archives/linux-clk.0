Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29249B215
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988604; cv=none; b=T9zno8mQuZZyUfWTAlpwd+EtYQL/eN6AeMYORItufCN0ylKNCOuhdO5rkuRlXVxYHCptIIZOQT1mjTuE/bnFDrWfeC5UESQUjPBsQGKm0EtmvXoI8YcMSlSYo9Fk64FIYNLMIO8985dz0MWYjY+yC0s0YeQALhxATnNUXgIWxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988604; c=relaxed/simple;
	bh=vcKFUlMHhzb4aWhwKFgdD+usZHVbdciqtOJ1LMttT9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAkJ4hbS0zTFVdOyPDMLx3t1SOTBQKLdvxYEjoijJa222fSMTMrojiZMkt9r1hvsj/YIu24v1tTm8AOMQKdIipTLWkewdhDkgCZ/X3gKKw/OkDiNehG09W1YxHiAFsyG7fQuq2YvtJVsvPg2+BZ4HCg8cag6wMaE0PU/EnONyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGrn/8JY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgEv+Ipa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGrn/8JY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgEv+Ipa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBLvDY2516033
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=; b=MGrn/8JY+3+qM2Gp
	T6czweznP6UkfQEiIZ2PHZWPsTiKPScMY/h53E2AuZVqUsuJOGuqwfL1bMO+1pP9
	YFzowEAcrVf1+p8KfYLhe41CFdR6Ff2wM3daFNRx6dEIQEYDLpqsmQm3eEF5V/lX
	8R3GwYVoe3AopBWl3i7U8DlBhRHL4zPjiwdzwG4J9MC11QmFFFi6hmKBoujoMaBL
	idQcLCjzHKVmHErLw46/7mLBWXvurW0puBpr2S85j0ot7F3ZFONo5wJBx8pHUMlB
	ymTWbND1uofE73G4gm4Unk5Lmy4eWD/oh9XZQz2xFOwLWFhw48VfElZMVGukx6XI
	rUSbaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470a17c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea15d721so48764985a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988601; x=1792593401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=NgEv+IpasRED2O6Gu/wto8IJGjaCDmHLpKaHIWjJYIt1Uwx4MYkR1QETqb5RjP4rVL
         zJINPf9CNU3nMF/BCA8enR1V4NMHu8T5z3AgxcyPLXW/lvb4GC+iO8D+g7KlRKn3FnI5
         gNbA6B7yssaMo32xZDWpTVRcqdMCW/x3LEivmWVFsfhhTUmwvy0TjJ/OR6BrsWhz0ZmH
         BJmXwNzFCB3J7Pmz9U4atanD7S4/jLCfD4gn2kP7f35sn6nCC7I4r5rPSpRdUxqo8ysj
         VzURZlpVZf4Fq4w81tN8bh6BGA5+yEjlxPWfvOCWf46o8bYxAGJCN3bhj5mEebf2D4G9
         GHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988601; x=1792593401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=VQ8N7mJDDz2Z/FGrY18HXAGGm6R4hKTv5oqy+UDx2GYizHsHBF19R1Q35jlhR6UEkt
         v5fGy1exi/a89tmlDUBX1hqjrywGSwJTNBpMc+PSb5tx/yQCgBP1zny+6Jang7YVc+Tq
         nw1IU3WLEJAOO/+ZxSSPM8VnvgmGENS8yvJxz+n1oa5DxLmMmoKx5INiZl5sAeouEJ21
         hHV7XUXbaDyKb3RVcmhneKWz69JS2uniw2nIoSnX5sJ9EcqNe8qnOZnJev8nADZA2Y2X
         NSWA/4bGIL5LDkOvXUi/h3Nu59i+fxwofkYrw/mnhrnKLlZM2/MCg/gUQ7gV9/ZIbIBS
         yJcw==
X-Forwarded-Encrypted: i=1; AKwUvByqQurMq/tVdTnM4rPCrXyr+3CJrRzdyZ07+I0Q6lQoQhSOSAFvOVLFIXIMnS9+MeUg+0hRFc7kLeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl7Ok/5owwp2Z66+J7J4hEx8azb76vNMdyR2Zw9amtB/v1Z3Yj
	InB7k48kVE/O3GAsPd9t7ovpotJW1HiEZJkMLrk95yCnatbnYh2HwSQn3nKn8sO/usdvc+VMOVt
	0+vzlA/EgH567eNyhKmq3Hofa3x7q8/TUXtKT8u0Maeb7mlGsEpMpzBhWfAJD6gE=
X-Gm-Gg: AYBFou0S8wzod0LM7z9pWBqfEsJAeTUqadB6Umi+tlW3GDWHUn6i1tQpQsaazw3pD0c
	8sIZYwec7dUG6NgGh3ovOLhhRQ7NtCdr5sVsF1iZDzXT0TuyLwsPttTSyVqByRuJRYSSKi7qXgB
	E2+4xYR5bglm3GKZ+9bxR75GL6lH/BlclV+YJLWvdDeLL+DAvSRt9dPE9J1Pj3y0HzHKc2bdsSm
	jn7yVCbmdxOyV3Zy8S3adqy+By++VMb8W+/2Vn7VAhjrc7e2kPk3l6x0wxBD/hpYDFDXsVSgF+r
	rqSM0X94MrLKd5HViuxPcMrognwdEgTfCNp27RKwQ+DaaHESnBYccjwBBFIfMBMRUlb/1L09PTv
	O0akZyWoC3BjUC7Q0KSEL/Q==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793495785a.2.1791988600654;
        Wed, 14 Oct 2026 07:36:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793490485a.2.1791988600134;
        Wed, 14 Oct 2026 07:36:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf06e3sm361049766b.33.2026.10.14.07.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:36:38 -0700 (PDT)
Message-ID: <a8bdf3fc-7da9-4017-b61a-5b4f605ae0a4@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
 <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
 <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX2omNUG0Y7HVN
 HyMx9Aa5DF8YdPSNcmKZHjqheZjeNiuApq7yStoMBnn1KT+84dsZRH/efQ4mUYSFfAygisuXGna
 7G7rSxQrT/s3Aw/zpfjJennb5u/V9WC70dRFdUl5/KrjkQsKpXtbSvf7T+6BfGVjOXMnka9rr/C
 HQjZMbDLxCFKn9L2aNXgLC3PF7v2k5spmYsbtO41VQ5joQVc3uQ+WrJdngvbsnY+JSR9DrwcDAF
 FajAalr7ISrLkLMu+rkEo6Qw/Zbuv34WQY8Ho8kFDBhr9Mh9O639VJ8PxaGdDaJnf4INEGw8rXk
 IBtu1icwxETXwmH3c0f6MYntR930igcfLvJOrOR2Re32URIejfgcBSIz7aH54LQV6+MjPXVKXtd
 yDxVWhXGpM9tCtmxrCC9wU8s9KhUtw19aJjWLQzW7Gup06UPJrGBDTLoKmomGMjwYHTJOvJIXus
 MQfffS8mfh5XcA7lzog==
X-Proofpoint-GUID: vvfJptH12r-C69YpJA7pH5OuV8TJkPdX
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf9379 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JPrUV6RX21cUErznEBYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vvfJptH12r-C69YpJA7pH5OuV8TJkPdX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX2N+PTmjOVImi
 rvyGJ5SyOYjMj/0TGvdBadVL+J7ZZl6pNi2BHmPJYkefz6FQPZqZ23sMt3EUqlgcTMtpjDObAwF
 hMklcGec8tpf/LE3eLMyuAUdFfJ3cmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140058

On 10/14/26 4:34 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:20:54PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Clock controller power-domain attachments currently become parents of all
>>>> top-level GDSCs exported by that controller. This conflates resources
>>>> needed to access or operate the controller with actual power-collapse
>>>> hierarchy.
>>>>
>>>> Allow callers of gdsc_register() to suppress parents inferred from the
>>>> controller device and its attached domain list.
>>>
>>> I think, each GDSC has a parent (in the hardware). If we don't represent
>>> it in practice, we likely need to fix that.
>>
>> The next patch allows setting a precise set of parents instead. Perhaps
>> this commit message could be improved.
> 
> Or the commits needs to be squashed / reverted. I really don't think
> that we should have a parent-less GDSC.

FWIW this commit alone is a NOP.

Konrad
