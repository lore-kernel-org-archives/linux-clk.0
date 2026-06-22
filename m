Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141127603C
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124541; cv=none; b=nAagDtZc7t7ZU/XfOHRWWxYLt+lQOC/kq1NYByuwroKP8Ri/1+AePTtVtTkaPAgKxBzZZ2ucuiGPikmQs86jpEjJLFldLvyGg8H0hgW+92Lf4eanwsgJA1rax49puYMm9yhrA4p+VadOlf9K8gyiVS5dKMsN7+5Pj2Wt/8y9L+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124541; c=relaxed/simple;
	bh=ybDbDgEQCbGWYNmT77Qma+WdCRNJi0V6KPZ3tEaEJbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAnVgIyCJ2ivv9yzbX7zc91QsGwsWfPWtDwCLv54XUkGMeyuF++CTYrlhIlM8IT3WKYH+TSOkO0TgME1qF9Vp9gCgIc+y+KRiwfSS5Ld0565zHMXPIWvmxKdzvicQHYPLsj/VH9i9/HKu9lcpQogoY6FTNOt8UgD5bibDSH83SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLd6LJM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0e0v+fD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLd6LJM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0e0v+fD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAQJ10328641
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 10:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz5cN6jsiGUIDg9U9pmEbpCmOQJeHcDs24G2sv2VOWQ=; b=oLd6LJM3VldlGuv6
	d8+AcPSPM05BCJCXWdUSrOj4HMxM+PDx6LLKmsjBygdd+zbKpFLaoQpgQSCfBRfr
	GTUTKvY7leVtifj4Jb9pSetTqXqPaaaWC1eWcJIFd2u+5aKMUBU5gXRst5COtamj
	ARTC8zvolVkLqi+lrdxJtdk3dsjnwfIlJYHTxA6yQlITkxbCxIXo43d4Whtopj3G
	Y3BwNh+in/bDdrS1dYBMg1NScYHIzKxkWfDVC8v/0sAaiDzX11iSq8hCdLpBh0Kb
	MkahxDYlNdMWS2846ZYezemeBdP95AIX112BZIQwROHwLxJxf7skoHQ7Xo3hkKKN
	z+oexQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0r13h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 10:35:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc31c51e92so9634556d6.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782124537; x=1782729337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wz5cN6jsiGUIDg9U9pmEbpCmOQJeHcDs24G2sv2VOWQ=;
        b=b0e0v+fDBDSx5xA5QwLf63Jr2d/QVdyb1JWIxoJZkP8a71CH/rvTHwCKLZmiYOHFwN
         7omQElRfG5nF3KO7GpkYjXGqfSpIvhWlH/d+HFdPSdVtPWpynSWqot3MpvOnbdxYHHqU
         sax/+vGcZgv/eAJAz9Pm0FVaOBTETZfsUxrRKa7FeUsjD2ir5doFoTQuGOnYVRWVFWhq
         XVz+apkQ+CEe0MoH2RtaoGWmnTtmSIbr4AGPFRMpSuKFsMtFBQf8DkYlF7RK4UMRdJE+
         FisnBd7E1NzFVRJRtJEo7wQaiOB4CATOLBDRoWHXr/jeU/h/0Fw4mzGPYk/HRqXcRVKc
         GOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124537; x=1782729337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz5cN6jsiGUIDg9U9pmEbpCmOQJeHcDs24G2sv2VOWQ=;
        b=GWMopT0FDMP4xWBLdw3RV/3iuwAoJsJod2N0rz/6zl1fcDrVgMymUJWx0YenwRb1XW
         //sLlPpWcfeI72361MGviMYCYeGsu7iZcImpmUKv60rQkLAdt53uKmWWUlQBkxug+6lp
         K3FcmtQ1X8KBVrG24b4F3jg2oKsgsLPEVcKOelUbiqQ6HFRpEhlRy7uh66mw0wR765s+
         ZZn+wVSkiFDb85ulVlZC7KWTn/sMQK6Wh7muDUSzmVNOtc1hcIz2RJfAoULVBibuTzMP
         DEPeBjRw3LRzfI0rM8XxYNVhyWCNbhVIOByRuTi3t8L8QFdDvW6HDdOFO8oDio1AbA1M
         zaqA==
X-Forwarded-Encrypted: i=1; AHgh+RryetP5wtGwlKNDwYhVMxWHLgMJSAWuO+ez7u4F+pPnP+IytxPVtRYEBgzuRRyWTlPGlOKp5Eg4+7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNT6219HkkCBXitHoutYJDbXL3e4jvX2X12UFoS4eIJoYXyqE
	qOR194z2qZRHEkx6nEEbyQieNkoFwqYyXa78YM7kDhQ6Bpa5SQyaJNKwjrYix+Z12h7n+dWVWxg
	t9zh5R3F/IvF0IrsOZYv4eNm76tcaVb+UUDxrQX+TsSQcaZrL3Z6yVhIp1rd4+ZWGmE56Vo4=
X-Gm-Gg: AfdE7ckdm11ZkLoqcE1I0+PbXRmllcZ7y5u/fQ1bEYKF5jbEjJOSwMgEa/2/t8QP32F
	ajL9h9lmjIPkLnCjEc+mQ8jkdkAF11gRLdTc5ZSSjX9LQHMw/kJpjDr+UeuNLtfMrS8tCd8r31i
	Q1QQilM+tzOmY/uHBn1yZa73flo4TFuUAD8BBlgMvlOLtBKP4sgfHY9hKFUeFgXvmwi2pNweTmZ
	gqdEWgaucYYKufy/w0KUc6TS+L6DVhbMzQcvjPKwtH/98mj+O2hASvRQ5++kW2PtfwF1pleKJJB
	66q+yUcFEJigSd8kgmHZfDu4GeBKv09IKlo5WVnpbNlx6f9v8AER3c1g77FFHDFl0GYHPNG2nOl
	/vtykPetILljbB3V0uszCBxTBRgZXpPeU6Pk=
X-Received: by 2002:a05:6214:6004:b0:8e0:c7de:1a38 with SMTP id 6a1803df08f44-8e0c7ed60eamr62570636d6.4.1782124537635;
        Mon, 22 Jun 2026 03:35:37 -0700 (PDT)
X-Received: by 2002:a05:6214:6004:b0:8e0:c7de:1a38 with SMTP id 6a1803df08f44-8e0c7ed60eamr62570296d6.4.1782124537229;
        Mon, 22 Jun 2026 03:35:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be49b7asm2835424a12.21.2026.06.22.03.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:35:35 -0700 (PDT)
Message-ID: <4d25f656-1372-4ddb-9e52-8f381700abed@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:35:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
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
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
 <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com>
 <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
 <ajRfSbkAYusH5H9H@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajRfSbkAYusH5H9H@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwNCBTYWx0ZWRfXwCuV8POwxJfz
 al6Vafo6mOqvvzbS0y0vtZM9IC3I5Wx1qQJ/f/n9W6GClso8a6paEQciKXtazskr12F1YJGq3Ic
 8rR1GtxbZwTzelwEKSmMAJr8x38VZR4=
X-Proofpoint-GUID: dh82DWkLyStJJQ8733_8YhBYuZL94Bvd
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a390ffa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=ndTenVKbHRbPZtASR5oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwNCBTYWx0ZWRfX5gwVLmDt92bq
 AhXdCj9IOkhy/kuqQGOiv66mMBmcdDacNl2To+gIvL/yXm34pOGGDOrKKQD9vFpfp+5vaLNHv5c
 Y3g8wVdOJOBc/nYIgu8tzl+meE2Gs/JIAnaniWOyq4T4k7SiPFJTHzSFHmCvcERWihHihT+4IL0
 MpdiHopS/heX3SkZUq/vjGFYxwX2eqj18IJW1k5Y7r/boBijrW3n1qrHCUd3kwQysrzb8LaaMW4
 uDkrwf6GVDmaqB5KVBFi+GeiwT8qf0K4bnH0crho7wQtzptkHiPM60oMIgC4eu+hvO8lGpaQLP9
 C2AoQ33ANENiWqVKRkxvU23fPBCzANn90BzSJKQcyMULINBC8/feBghKlXiIUmRCEGnJu73WBHz
 kS7LZ81zO8OLc/BXtBb0KEVV+2YU/H4H4/oblOrK460Su4PGYp/rIMHhzqHfs8bxzd/Zhdwp8kw
 AUWBLuRQvB19zLVETAg==
X-Proofpoint-ORIG-GUID: dh82DWkLyStJJQ8733_8YhBYuZL94Bvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220104

On 6/18/26 11:12 PM, Brian Masney wrote:
> Hi Ulf,
> 
> On Wed, Jun 17, 2026 at 05:29:51PM +0200, Ulf Hansson wrote:
>> On Wed, Jun 17, 2026 at 5:02 PM Brian Masney <bmasney@redhat.com> wrote:
>>> On Wed, Jun 17, 2026 at 04:24:05PM +0200, Ulf Hansson wrote:
>>>> On Tue, Jun 16, 2026 at 11:09 PM Brian Masney <bmasney@redhat.com> wrote:
>>>>> @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>>>>>         core->dev = dev;
>>>>>         clk_pm_runtime_init(core);
>>>>>         core->of_node = np;
>>>>> -       if (dev && dev->driver)
>>>>> +       if (dev && dev->driver) {
>>>>>                 core->owner = dev->driver->owner;
>>>>> +
>>>>> +               /*
>>>>> +                * If a clk provider sets their own sync_state, then it needs to
>>>>> +                * also call clk_sync_state(). dev_set_drv_sync_state() won't
>>>>> +                * overwrite the sync_state callback, and this call will fail
>>>>> +                * with -EBUSY.
>>>>> +                */
>>>>> +               dev_set_drv_sync_state(dev, clk_sync_state);
>>>>
>>>> We have cases where a device node represents a provider for multiple
>>>> types of resources, like clocks, power-domains (genpds), resets, etc,
>>>> as in the qcom case, for example.
>>>>
>>>> For power-domain provider drivers (genpd) we also try to assign the
>>>> ->sync_state() callback, see of_genpd_add_provider_simple() and
>>>> of_genpd_add_provider_simple(). This means the above doesn't play well
>>>> with how genpd behaves, so we need to figure out a way to manage these
>>>> cases.
>>>>
>>>> In this regard, we also have of_genpd_sync_state(), which allows a
>>>> genpd provider driver to explicitly call genpd's sync state function,
>>>> if/when needed.
>>>>
>>>> Unfortunately I am not able to suggest a detailed solution for how to
>>>> move this forward at this point, as it requires some more thinking and
>>>> I am heading for some vacation very soon.
>>>
>>> One approach I initially considered was to make it so that we can have a
>>> list of sync_state callbacks that can be added to. I already did some
>>> work on this, but I didn't think it was worth it for just the QC clk
>>> drivers in isolation, but it would address the concern here.
>>
>> Right, maybe that would work.
>>
>> One more thing to somewhat consider, is the problem I have been trying
>> to address for power-domains providers [1]. At least for genpd
>> providers, we need a more fine grained sync state solution, which also
>> must be able to co-exists with other subsystems sync state support. I
>> am not sure if something like this is needed for clocks too?
>>
>> [1]
>> https://lore.kernel.org/all/20260508123910.114273-1-ulf.hansson@linaro.org/
> 
> I am not aware of any clks setup that way but that's not to say they don't
> exist. Stephen, and/or some of the folks from QC would know better.

I'm not sure I'm following, but we do have this bit

qcom_cc_probe()
 -> qcom_cc_really_probe()
    -> gdsc_register()
      -> of_genpd_add_provider_onecell()
        -> dev_set_drv_sync_state()

and this patch calls dev_set_drv_sync_state() again in __clk_register()

Konrad

