Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483913D9DBD
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176607; cv=none; b=TJgugelLI39X7EkUHrf4JH2mOmmfck1UH/hff6FuVmJ4lnJhpaSqjpaVFlFRQDUZhoLNayaK2TbWOxaPMCIm0R2Mot1Vq91uLgdrAST4RYybaE3w+qhmft7n+TgKbrLsx+giKijl1vYbToVGolz7oI+r8xLyoMJZsstzOHg2A18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176607; c=relaxed/simple;
	bh=jisglxMDGeqtIx9ICqQRVctPhRxrvVjbOhHljvb5nXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqJQk43ZwcNd9iQcomhkUTiyJB3M9kmqgUo/lA5Kd9Y6L050pGM4leRl0wq44JMXOajJrS8ZZcFjdXFVBZHqBVNjnVCz6KYZZ6xSS4/m+mfXnN2CRnqF4t0SGd36ahYEmHnvrHRTbJUSrC84AIA0fdXxUxv9tqULGmSd8BucaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuNWqQaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0aYQI+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuNWqQaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0aYQI+x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBt18G3505295
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLvdqakjvhjZspo80osPg3QWx7e/vaJVprphVoJc/zc=; b=cuNWqQaZ/3VSN4zt
	w5CqmpH93jbEC2l9n3Ca5OLx82e/EuAxShtJ1HU5/0kbccas2rSgAlQa6a2Vx8V4
	stn57V8bC23VudyMs2cuM/5dDq3eF+DpiD38gggqI2W3qT4ASQw1WY1lQUnG+7dT
	tIbGapBdjOBArcXki865hsmXyRc6uu4d8GW4rAd46yRqMVYKJDOHqLlvBMowuI4I
	/OGqO7VZi+rJm2aIE4eM9VwhhdGAMwfrHN4GHf3Y9tfgeLxJ8mUI/Y9duOkBggAy
	cwADcq9M1s6L0LBDzzH7HBjc8ukxYu80HnmrwfsdQ4l4DEM6oQz1Pfq3dFEJrrFw
	5CI0yw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870k3e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:23:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9542ca218d4so325882241.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176604; x=1776781404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLvdqakjvhjZspo80osPg3QWx7e/vaJVprphVoJc/zc=;
        b=M0aYQI+xXiE6qp92syAz6/F2U/7cDzEKK9IjpG+ntabjS5cmgmhn+J/kEonB28KrIq
         zNDjLoqWHg95dY8zHEU947AnI14cS/0DYbrkeTicmBv7VOuvwQXYCIGh/ovarl4+45M4
         seV/P9qGN6b6jHo6z4yzRyrU92T+ju18jSRT9B3yEcfxuS0vz4HWweYI07FX+UeTEqmJ
         p55Qcys8gPOhZhhUeau9jOqLMLwX1colQJHWxsKgMOYeFUItA+R8ym5QC/dUpQZRiI79
         at9pmVbmIf1aDVXz8ePOllcm1zAZXKpDVqbXknNxVtsdb5bZX2+jZXYAh6oAkaaLVOsD
         61nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176604; x=1776781404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLvdqakjvhjZspo80osPg3QWx7e/vaJVprphVoJc/zc=;
        b=FdwUrQ/5w1601HdjbrqxvUkHimD9uRknkFPJQcD+DI8KVnBCKJZaElbzakpwURWYNc
         F1puFMX/lHOr8YFCuoXtsB73XZ5w1Rj51O+rKhcal2tCKE3yPmiVVIkXQUywW43ta5Zy
         EDE6QN4mS2/+p3p+Ftd79DKZcJVzqM8Mm2A+sUtOHxHIPM5b5uiceqYPlZx7LtJXQLM1
         9Ol95PTekhh1jx7V18zD0JHjG3wWzCpooOYAa2nAjbJUJIbG98QwawlQS19IBmHP1qrY
         BJFoh3I1sYuRT53lmXRNoSw1ZTLArvjj3/l23CZZdUw2Uj/jf5a8zkoy1y+X+H0ABMFV
         WWjw==
X-Forwarded-Encrypted: i=1; AFNElJ9tUKNaebvny/mNcwYRrtlnInoH2w6oKwFarVKnDxk2HrZFmWsxl4LpNvNANSBF8l+ae8DcfIJlbVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzya49bHOD1rX54zyBswjGJxqY/2TqyOXe4KSEQ7kIJlTRMzI+5
	tRdbiMAZDXEpKmnIh/76toY/yNAKu28kDQNnFEMzJoS2mSMpyd9qf7RHUEqHZ7rUOCXesZpPRBD
	iN6lMNiPZPE6fGrs2BteyTwyFMYT2/8rsPL9jila6NDcbptVXjQpUrUOURzN9j+s=
X-Gm-Gg: AeBDies0xE2TcUZsiBo5IuWNuKSRmUNqGYR9QP7GddOqRbsFA53Q8xEaZFqc5K7sXpy
	3DkwRcwOU4I8Q/LLchMFYo7SvUUwxyCCJYsvejNHNyi1aG0u1sI2UEW84c7WyUN/hdcrdcQ0t/Q
	7se00Gzr4wzpPxIZuF8IHtM8WFzi/WG5+0rp2eroWjUaXpwg0ExKcMARLtYyf7ZLjUFQTAzP8/P
	TwuEnyHXYvSsSX+ZHjffH4m6FP3RANpjv+nw/GUeuznxdW3tEUjXWLeaMRxa8wzYQ4OKgMJ8dJv
	eeQe8Vq1wRd8BAIQHEGcNaUwHIhLtRgLPNsYhiK2fg4y38jb/OBBxLTPm9Yc+TaIo9ExUdJZD/N
	HeAy8SnPqXWe/c79HnHTrTPZQ0+JST74GW7zMnYNeWdaNDmZHuMvHaLfSsNQUoOgns4h6KA32FN
	PTuWe18AAuSOVUuw==
X-Received: by 2002:a05:6122:25db:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-56f3bd2bb38mr2929644e0c.3.1776176604307;
        Tue, 14 Apr 2026 07:23:24 -0700 (PDT)
X-Received: by 2002:a05:6122:25db:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-56f3bd2bb38mr2929614e0c.3.1776176603819;
        Tue, 14 Apr 2026 07:23:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm3272004a12.10.2026.04.14.07.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:23:22 -0700 (PDT)
Message-ID: <4f335d60-1cae-4027-9e87-b1212e01772e@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:23:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
 <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
 <404ca234-1bab-4094-b7dc-c4d0b072d929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <404ca234-1bab-4094-b7dc-c4d0b072d929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNSBTYWx0ZWRfX1Z6I+1w+Pc4k
 dnjeKMVrNBiYSeJQZBfg7gFygVZpGHJ+tjySMUo2ws1gkY7GkvLVO3ewjmji04WkbTzqOYWkBcy
 WdN8upHQG6na7v7EWt/cMSupVYM38wiMzuZprfn0CAPyb6u3gQkGw6qznGlzfyyysDnWPMUbd6l
 /jdxwrVs94Fd1GqBgrY1TdhOkZaGdu9hUVa/SzrB2lu9CU5B1X8SfsjpaFVsEZVFZv8xe73WF5r
 bTyyxW+bF7p6TMazR1BgXW1fwIFXXO7qZjM9+TT7qsoVOri+CW1zqA0j/W+2ttnVvqAV/xxV6rY
 Q7UNw/PvDgTU9sWa+1knQlMFLglAZohCS4CIP5LY/w1onw/Sr28wAFQJUxDuyI86jBMMmqp/IOB
 PWT27gDOGbLI5BEP+a8Vfl194QlYCew/nIrgxkyo5sviuEsOSzbqzg3OLPZreugrK4lAAg9MbHi
 VCkpl7f752XJbN3g1Lw==
X-Proofpoint-ORIG-GUID: 2NkELidvP1_J8BOs44RQGNGfIEwpzhZd
X-Proofpoint-GUID: 2NkELidvP1_J8BOs44RQGNGfIEwpzhZd
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de4ddd cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LiNkUCdodsQKAq62uNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140135

On 4/8/26 9:26 AM, Taniya Das wrote:
> 
> 
> On 4/7/2026 4:26 PM, Konrad Dybcio wrote:
>>> @@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>>  	return ret;
>>>  }
>>>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>>> +
>>> +/*
>>> + * GX GDSC is a special power domain. Normally, its disable sequence
>>> + * is managed by the GMU firmware, and high level OS must not attempt
>> nit: "and high level OS must not attempt" -> "and the OS must not attempt"
>>
> 
> Sure, will update in the next patch.
> 
>>
>>> + * to disable it. The only exception is during GMU recovery, where the
>>> + * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
>>> + * disable GX GDSC in hardware.
>>> + */
>>> +int gdsc_gx_disable(struct generic_pm_domain *domain)
>>> +{
>>> +	struct gdsc *sc = domain_to_gdsc(domain);
>>> +
>>> +	if (domain->synced_poweroff)
>>> +		return gdsc_disable(domain);
>> Can we use this version to replace gdsc_gx_do_nothing_enable() too?
> 
> No, Konrad, the enable should be always a no-op in every scenario.
> synced_poweroff can't be used to handle enable of GDSC.

You're right, I completely glanced over the fact that one is an enable
function and the other's a disable..

Konrad
