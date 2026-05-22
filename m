Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598AB3A7F46
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440977; cv=none; b=T+5SOFYPMIBywggQJy5rslCoegSc8XvInPysJNSkKaqmQ6i4pEUFHhQU9i9HPMt4a48mj1kZ/4TIFbliPzqT338fOX6Q8dpB0i4oaR892OZFSWEpRDJc++v3TV/KBFdQrz3LzKTkrIDMa7kPfsZtrKkjbJExZG06zTVaMZFbcK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440977; c=relaxed/simple;
	bh=tvjnb+Uet6RnFiJb1YynFAL6Q40GRLj1mRo6yq1TEdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfeiuKrN3AD+vAGsIOUbvVDOHHfHx5aX34dgXw3IZuoQrlKHhoeNsig3BZO5c/2sPkH8vgM1aZMMzXohrmechGPZ/klm4pnRfXeHrLNf8kT9YE7JYGl+CX5JaYthHMVIV/3/aXlegvWwYP+Yq/CkVSPW2eyE/XQRM6bPxe1DYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kt2PDFcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVOH+J9I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kt2PDFcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVOH+J9I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6u9O2779268
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 09:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QE39ajGQ40BKpXOOWM/P7CokESwSbt3jOVzNBooRXFU=; b=Kt2PDFcWVOG+KN9i
	/EDTBKBhXa2iF0r2ZCfF05sTkCyXC3LEu7HfJhosoS4lkqq4tq00j5osv0jFwD4W
	kc5NyHNbe9trU310IH9AP5jVGAPdeyrKqqi4xNJFtTH4oEd8I3SyidER282OmtbA
	orHkfNJ6y3psHYYdkaJrKL1Yn4GNYFc8ATFi0sE1UYT5J+1DTkZ+0Gvw8vDNYwcS
	lVqsYxUQ+0Y68CQaG303nMczNHwe2GBXCx3R+j3/gyLNuSunvqvUtkgvaMtYYaRQ
	b5EtNPly7WX2feSuicLf4/+ttJg7/j2AZS6IDwP0RqVs8j2ITDQGyWAz0TOBz+8K
	Xg/12g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7asy1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 09:09:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36781927b4dso9185402a91.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779440973; x=1780045773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QE39ajGQ40BKpXOOWM/P7CokESwSbt3jOVzNBooRXFU=;
        b=JVOH+J9IJrM+MT9khwiwlNkyvYAaU3OY4ksnfaIYiTpaRxvzmQdmGtVz6REhkyGAEG
         G1Fvhzy8gm9uJvfgz5ZVQzWAV4pSnRUoZKt9x5u710TTR+/dELLC1kIrEITd43KKxQfs
         +WhstFPD4T/sy31F/81QqctPpbYITI8mdZXlbFA7eaaotx5SnB+dth4ZhlNMtGt3eaVH
         uyI6zjduXPOWIGZNEDUjX44dZJ4OZOZUDYyfVqdERHAS/c5jkrZj2cQAYBOg9OZvs4FB
         yJ41uXuW6gGN+yhFHziEXGCpvMmIPfIjbWazBZsgms5sQ9uvp0cKk45qM4cKY5JdqzmJ
         ASGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779440973; x=1780045773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE39ajGQ40BKpXOOWM/P7CokESwSbt3jOVzNBooRXFU=;
        b=CnEDjUbkz43OdXzEEsSSHPmezY/nlA2U3b0WHy9sPt/xwKPOVRBV4noTA2sVXZ2w/H
         bVu6Jp5ZeFVIKyd3zeCRyRP52By+w2YZHsa7Scf6Ym25c4ocDLzJ/6cg2d3nFuljZNnB
         sDV3WXv+ueiSLAmfQDOLjtHQgekrBJhCQ746Gw90lejizmm5CuD1A0fkNNL7H+JtXzoL
         9/bjRkBDJduftJPPPLobO9VIPjSi+0yYlczbFxSFflDLCCGWa4/Fc5u3NuIpDWeTSDsQ
         nlrAs62vnHr4H7ppjHJTx8xjr38UAkfj1qUu9FjRc4SqafjLLxFO19Axx6SnwT4XgAaj
         yKVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XOXVxhTC/5v/xL87DOuJmg/b7fsMH20Tk3SymjecLATjq6tKC5pfJq0ZTHdLHt2ZmeZ9VYfILcaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zvTbYxOPiXYJa/42J0Gj1Ity7PHr8PGG6ET7nYkBffydLmHO
	2qP+HOVzTmyEk7RxGEXC0XsFyJOI4CSUrvizPvUq20vhrg8nQaRrzvhlbx1Gv8IOziS3Duj4hzv
	tzWG1jOjvKzGqqtAlgAanAd+RLD9NN/o49BSBKkdgjMPkkBNCzPSqrIdHu06AreE=
X-Gm-Gg: Acq92OEJRV4/TjPzyi1p2HhJ+0ivA/ZeqlLOHryYy1MOD5EeatPqq/cbKf1rl5j4Jdw
	boXQ2H9nlR+syEiT0QQbZLtZYcs7BNZ4/kWqCuYktiqXk74BrllqGgC0BSna2ExuEMg/KqFiFyI
	pWht3BfK69Uz3w9f/E7AptvNu7CBIhKc7OT2RFEYhrPD9mcer/fZqvPwfPmtY7RI6dV1mvO/G/O
	fCe9/3cXSzqIzB22bRwhlf+61ygvwv0qQoKansj6HdHNVhQAZ+cpum7lCqLPAnGRIkL/XK6n67f
	J2pjsiIAPoKxMccjZ9aHq1tMZ6rzxUz++5V8mRrFcvawEImvx7dH+p+xI6/vNzmfcdglioT8sNc
	MofjCLedOtwdzHMJDTgay2kQo+o2vG7ifYkMwLOkL84HqkOd3
X-Received: by 2002:a17:90b:564f:b0:368:ed92:6f3 with SMTP id 98e67ed59e1d1-36a677ce506mr2573575a91.18.1779440973255;
        Fri, 22 May 2026 02:09:33 -0700 (PDT)
X-Received: by 2002:a17:90b:564f:b0:368:ed92:6f3 with SMTP id 98e67ed59e1d1-36a677ce506mr2573549a91.18.1779440972660;
        Fri, 22 May 2026 02:09:32 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72188499sm717523a91.4.2026.05.22.02.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:09:32 -0700 (PDT)
Message-ID: <143e095c-471b-4cd7-9395-1fa06fa50625@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:39:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
 <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
 <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aSz0Gdk-mno6kBYzs4BJ8lWhXKlxbQqj
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a101d4e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0XXBx609mjK7aBirURsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aSz0Gdk-mno6kBYzs4BJ8lWhXKlxbQqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4OSBTYWx0ZWRfX6GuqCLNo6reK
 X0FPMdJRTCWH/wr8+kn92g5Mm/li5+dKkVp5C6LVZ6HB4bZL/T7CerekLGvVDBM+GB6V7lxuZuD
 kJ1D9mOI9IHq7jukUqAyX7yZzMbjoRYK8fafigDUeIFvQ5dDzU5diYCN9ce4X0kkcd/ncsKcoO2
 GV6smCFdZc9CjmnksKZZYF2IwZ/IPncVxcJxs/IWLwWDPqD8IOjBLgmIB7qbfCfa3KCWymVcscZ
 QOQx8tEP0iHI8PZYq7bziqkv7I+3QPPxpY25GrubzERhAjyVUvV3cU1POqIc7JkNSreZf7eRAx1
 8lIx6NOx8muAT5qCuv9Ae/jP0q18xYpQkkgd2m4WxTaeh+cMN6EbBPSw2Fz2M8dNKp3KtsaYi/3
 fRcC79hFI+O2FA2NPd9Pnf4p9WtkkfAHXLWqFXOIRYUtIC0pDajBLGxZxK9yijLgZPFoGq4scWJ
 s7tLceDs2BOvSvmRNmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220089



On 20-05-2026 09:59 pm, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 09:34:09AM +0530, Imran Shaik wrote:
>>
>>
>> On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
>>> On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
>>>> On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
>>>>>>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
>>>>>>>
>>>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    drivers/clk/qcom/Kconfig         |  10 +
>>>>>>>    drivers/clk/qcom/Makefile        |   1 +
>>>>>>>    drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>>>>>>>    3 files changed, 576 insertions(+)
>>>>>>>
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>
>>>>> After comparing the files...
>>>>>
>>>>> Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
>>>>> clock-indices, but I think it should be fine to use clock-names as a
>>>>> one-off.
>>>>
>>>> Or we can convert it to use indices, since those are stable for agatti
>>>> too - the names would remain in the binding, just unused by the driver
>>>
>>> Either is fine for me.
>>>
>>
>> Hi,
>>
>> In Agatti, apart from the clock-names difference, I see that the AHB/XO
>> clocks are not handled as always-on via the probe and instead rely on pm_clk
> 
> There is no pm_clk handling in Agatti driver.
> 
>> style handling, whereas Shikra follows the newer pattern by marking required
>> CBCRs as critical during probe. I think that attempting to modify this
>> approach into Agatti may introduce unnecessary complexity.
> 
> Well, you can start by explaining what caused the difference and the
> result of those differences.
> 
>>
>> And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and
>> updating this might break the ABI with respect to bindings, and DT.
> 
> You can add Shikra-specific bindings. See how it's handled for other
> dispcc drivers.
> 
>> Given these and considering that Agatti is already stable, keeping the
>> Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of
>> regressions and complexity.
> 
> I think you've provided arguments for merging two drivers. It would
> allow us to modernize Agatti driver and also to make sure that both
> platforms use the well-tested code pattern.
> 

Sure Dmitry, but we would like to proceed with Shikra as-is now since it 
already follows the latest upstream conventions, and will handle Agatti 
modernization as a follow-up series to align and reuse Shikra drivers.

Thanks,
Imran

