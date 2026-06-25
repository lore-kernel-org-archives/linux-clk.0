Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB23DFC8F
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389969; cv=none; b=BRxkVtjFVVDxRyKyI9G3Mejjp17SzasBtckei+jHx94tORFM/UhDNfm7TUm0q+qGN3arvgi4uvODk58LUY1nlTTQ6rbrjozdEge2isXaBlx2CQQy1ae6MUZqXXyK0fDm2dZkh+yB6MVak27yTRYXPCQ0njUh1HGIJeZbfRUT6LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389969; c=relaxed/simple;
	bh=Mz8OpHT1duaXDpyujl4q+fOZ5QNzT5vnTX8I3Qr+vi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Je+SoC847EGWFP56R2+6b5sl9TW0EbN/IrZ3LDL+ucc7ZumtoeuJTsbSNlZ01oWFCInaCqhFhOh6dKaYH68gnDnSlmhKyVk7wM/ZLei87BQPEQMK7BAs+RbxUNA7d4F6ZTyRg+//IXEcVEDqTHuf2L+G4grTs4wXljGCDKdEn4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnQVGdaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NibFjbqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnQVGdaE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NibFjbqV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kJJJ1948759
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5HypoovyYvP0zHEoJJ3u328Zashj4UEqpuWiF8wzV4=; b=gnQVGdaENlFp0652
	Bgn/j+CWF23qfJ9vOSjoas7QvhupePAGN4cdpKqBQgT/sNzs2V36Ps6tAhLoeBxv
	JBU6xcqjSbtTMB1gfxxW/f7ALypk5vzzwGncsxbNBdPy+SwKjBuO/pJRBFubbi93
	lUAhEvfWPkitlOMz5IAkl1/qVLu2bNfTqI2y5VLzCy9puGisBXfFYyU8aoYklkTK
	lZrKW4rbLOMeBBVh2GR8zO8eiJik6b4K51wleks+qDIUo3jqg0IbIOM+R1iiNBUK
	HqXkz96Ws/92AcZeX0jU7NiR8bShdO/aiSCu3RZfoYcSIFsPbS8gbJsQDyOH93H6
	ePAxlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8s8k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:19:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915732517cdso12288185a.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 05:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389965; x=1782994765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5HypoovyYvP0zHEoJJ3u328Zashj4UEqpuWiF8wzV4=;
        b=NibFjbqVYt65OuQLWstVv6KYzu2+yCQvCeso2UCItY7vDKeU2EYhbTrD/bgH3sDLIG
         jkoqZcy9qaAsiNWitjhSzmLoki297FMTi7kmj/fYKaMpmzEGK+NFnoBp6/3c/4/EC2RT
         RPmveFnyrRgafM3gtyC5fs4g2TMNbm6w6e7D5yVRStzzbNA2Eksid6+4f0yd8pgwhPbA
         OAD4Noeq+yBUJSayRm7owQ7bgrcf/wkSv2KW1WJ1/BBF78GrL8OBTAbU9nadgfSSf+qE
         yysAsqG5dqWAODtbEDqnRMx/MpAqGTssJOpbQXtq8W+eG+Ut2R2vcXizh08vhyeOLhq8
         0Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389965; x=1782994765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5HypoovyYvP0zHEoJJ3u328Zashj4UEqpuWiF8wzV4=;
        b=qaV3x+ySmg1q3dyoHXLevoKe1I/uhUCaMoMP0KTu/P0IXsdoRsBZsoYMIq3dGrW3TN
         9ENECAApr5nokwgK1Xyrc0tzHZwcqq/bXnL7b/gtibnOXr27Bh+nbJ7Bx948CNgsbmS8
         qF2kSu9R4Sfz0mvoW/wMbk0djscB/aSvI2BAs+69eK2CLH5Ky8HDeUr3RQIl6Tsid+1s
         JzofclT/eaU5W8nmvIqrInCxn41pboKOCU3+Z3ydgIEY8Zk9caQHg6dyvaA2K5aY+otm
         /dvYXWnIC/nP+2lxaz9GU6b1OdZPyTZLdO63OpuyJRzK2kEM98YvY1nHdjyrmxHELHpM
         DrAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GNb1KiSd9YxW/b2IB9VdmgxMQxwdik52Ph5uTAmUw5hBaSEAk35zb8AYS5LAcElJ4rHEAlvs0RXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHHHrlalrYXEi/n+4XmOZ53tQf7wP5ybW4nhmJZeS4EWPIP5BG
	eOhLqW7dUCGbDmESSkOoO2tI4NGr9HCFwGxFT6AlbBAxC+bz4V42r8+ZcyV/azcU673U345HT12
	Z0IWN+gMUiI/WNXa2OOxmBxqn63xhiO2JVHBCVoBPkopf6NAZBHenthf2chACknk=
X-Gm-Gg: AfdE7clAhbPeXSLrow76gXu0gWNf8SbJXapmDYJhNG6V/NwngiLfLaMXP3Y92Vt9z+h
	M0QZc2GJVwmnJwBDnLG/IeJSy6tW81PKQokHqNOLnuXxqLN5IJTWN0k644Y2lB4wdSkIKMvIoiY
	nTYrAUFfQg3/qps9dxPUyAuOwBanD+bkbM8TpMlVVtGPVS7N3eXHzyEmemJeVCDlMnpcoitARMk
	oZI9MZ5QG9LnDEZQ4pSUq8aUSQjlXn/cNRqjU+Qz7rRYg+xBmf5s9/uKGFgtzB7E12KSQCzxP6F
	A4zYHVQy3InfsB0W5MAn9YaLVM9/604nIhRl2WlmXCLLLXP1IerbNIiMWzNjJB2CpcNWGLlM1vg
	gmYfAqIrMAu/itNF9O7OxK2yfJdFZKBHtPUE=
X-Received: by 2002:a05:620a:4693:b0:926:e8e6:3c28 with SMTP id af79cd13be357-9293e3bc2famr201293385a.7.1782389964894;
        Thu, 25 Jun 2026 05:19:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:926:e8e6:3c28 with SMTP id af79cd13be357-9293e3bc2famr201288485a.7.1782389964264;
        Thu, 25 Jun 2026 05:19:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05f9csm171615166b.31.2026.06.25.05.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:19:23 -0700 (PDT)
Message-ID: <b790c13d-0a4e-48c9-b8e1-743481c5e6b6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
 <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
 <aj0TQuaPWmSlLwIw@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aj0TQuaPWmSlLwIw@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX1uqnfpe+IvLe
 TXdHLAavXpWu7HYTeKlbhr9mIC0Lx1YqA8jpJg45Fk7KsdbKTlxF+OsRysme/Au/rCZfIsAywiJ
 s+rz4uSBIn/JhXLAJ3nB0EodGO6Uvow=
X-Proofpoint-GUID: IlNpRN6F-YKhhctywK--kIZOaAVsvA3C
X-Proofpoint-ORIG-GUID: IlNpRN6F-YKhhctywK--kIZOaAVsvA3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX3SIffEYOcE2m
 1W3ziIc5s+T5xw3OT4fctZeaB5QwtugLwvwr19F6xpM9HjyiHoxX0tNjjimdsqIzZ2l1GnugZfd
 U2ZzQTh3nDZ3yA6vbY6gP0bEI91U7lTTwat+6N8Q8ahnhcvOwceReBKhXuvCNY2VI1QG2NLgERx
 arTPcBIF56MGAG5a7N9k3xV290jWlNW9EKECz0B2wV7ZhHhyGss5XswtmfAlLtvniyGUW38s9KE
 sKa5x5BAT2Z9FXSv3Eo8x+MjV/4BQFbXi2M23DdYGS6qDwlgPWYICWxQoJSrmaIy6RYlZlAZuh4
 meF0XMXNvCVVYxJZNLKheFFTIeNQ1YhHwphSKgO5Eb2ew0v+sgZ3yBAmLISk8JvtHIbTn8EBRxH
 bIBLCV/7oCRQBdL/SIKflAeuNQrpTOn5fuxXhtecWo11OIvXLh01Cdo54Y6yiqj5dH+k25yVbFg
 zlyyCOR21AplA957KPQ==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d1ccd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gxl3bz0cAAAA:8 a=20KFwNOVAAAA:8 a=_b-nc2vJREEiSiBs9swA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250106

On 6/25/26 1:38 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Thu, Jun 25, 2026 at 11:44:12AM +0200, Konrad Dybcio wrote:
>> On 6/16/26 11:09 PM, Brian Masney wrote:
>>> Several qcom clk providers currently have a sync_state helper set to
>>> icc_sync_state(). With an upcoming change to the clk framework, if
>>> sync_state is not defined for the device, then the clk framework sets it
>>> to clk_sync_state().
>>>
>>> Clk providers that require their own sync_state will need to call the
>>> framework level clk_sync_state(). Let's introduce a new common helper
>>> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
>>>
>>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>>  drivers/clk/qcom/common.c | 9 +++++++++
>>>  drivers/clk/qcom/common.h | 1 +
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index eec369d2173b..31382c49c948 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -3,12 +3,14 @@
>>>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>>>   */
>>>  
>>> +#include <linux/clk.h>
>>>  #include <linux/export.h>
>>>  #include <linux/module.h>
>>>  #include <linux/regmap.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/clk-provider.h>
>>>  #include <linux/interconnect-clk.h>
>>> +#include <linux/interconnect-provider.h>
>>>  #include <linux/pm_runtime.h>
>>>  #include <linux/reset-controller.h>
>>>  #include <linux/of.h>
>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>>  }
>>>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>>  
>>> +void qcom_cc_sync_state(struct device *dev)
>>> +{
>>> +	icc_sync_state(dev);
>>
>> As mentioned before, we really need to test for (qcom_cc_desc)->icc_hws
>> here
>>
>> If icc_sync_state() is called without an interconnect provider
>> being registered, the framework state gets messed up:
>>
>> --- drivers/interconnect/core.c
>> void icc_sync_state(struct device *dev)
>> {
>> 	struct icc_provider *p;
>> 	struct icc_node *n;
>> 	static int count; // function-static variable
>>
>> 	count++; // called for every clock controller in this revision
>>
>> 	if (count < providers_count) // kaboom
>> 		return;
>>
>> 	// actual sync_state never happens anymore
>>
>> Presumably one would pass this through drvdata, but be careful as
>> some drivers use it for other purposes today
> 
> My next version of this series that I haven't posted yet allows chaining
> the sync_state callbacks at the driver core level. It doesn't require
> any of the QC clk driver changes, and will allow us to play nicely with
> the pmdomain subsystem, and any others the move to sync_state in the
> future.
> 
> I think I see the confusion between us the last few rounds of review. In
> this series, I added qcom_cc_sync_state() and converted 6 drivers over to
> use it. (I excluded clk-cbf-8996.c since it is separate.) Only the 6
> drivers today that called icc_sync_state() now call qcom_cc_sync_state() ->
> icc_sync_state(). So from my vantage point it is the same overall
> functionality.
> 
> I didn't look at this from the perspective of qcom_cc_sync_state() would
> be common infrastructure, and a newly added driver in the future that may
> not interact with the ICC framework may use this. Is this correct?

Aaah right, my mistake. I assumed that adding that binding
qcom_cc_sync_state to all qcom clock drivers was the next step.

Konrad
