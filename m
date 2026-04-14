Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5145A396D1F
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177785; cv=none; b=MhuXijMf4TQAcB4Gqy3lloRwALQ4p9uDRQFc4HTiej5woNEdVMSu8PQSfm8VDskukOtyzwsFSstJbrnoBS21RQdxRzl3s5mMPYItW3AWkVktN1aSzXodrIYD3QQA5Tkjl8lw8uxcIuXECRyXL2Lv9qQCZgWbuW7TYOXGtHxca/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177785; c=relaxed/simple;
	bh=LNjvW+h2jdKLluyul8fqI8lMeQFzuK655oXnqkx4wcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBnYINz6YyyJ6NAXSn59NQ6qIYLNGTllbXEXvEtwrnjOps5qALnJsKpYr6yccnMgwiZhSv6IaSDt1HlLsajF42IG5n2VuAVe8JLSRUoruoRd8MV/ljswOaSFr5mt+d8s1AOWzgi6cBUxMTwRGiC+9n3w6ez6vv0Z9fPDF625rl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifvB9RoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfUidlRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifvB9RoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfUidlRk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBjoUj3505276
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPVV3v4VLtmByB3vAduvUEcC5XOVjKu7FaDLbHcwqQ4=; b=ifvB9RoRSHnIMU2I
	rK5FhIddHMU8buBnI91l/ls9FQjwVZvt0op5f2EGCvjkB2AHX6khDJimGZYHcCk4
	GyaV3fKHa5awMMj0Hqk67g3rjA4D5IugE6jDfBOTPqBJqcAeFLeM8jbjMdEf4dzz
	/A6/HMKtmU+WoJjhuJsyv6zP0QW7hA0iLEu8CL7iKuChZjy80zgdICMYhppDi/Z+
	RBNanF8gczNpB6C2GJS8uiGfmBxid64eIIfQ7CoCRq4vrMlSzsG+aH+ThRQ/aYUu
	xuMFEIKEr1a5049FGkyUdlGoiZ4aXiFZEehgx3YJBz6qJ985iW5gvoWCgOz7Qe87
	Umkh4w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870k5uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:43:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca5b32b89so9092116d6.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776177782; x=1776782582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPVV3v4VLtmByB3vAduvUEcC5XOVjKu7FaDLbHcwqQ4=;
        b=CfUidlRk2M5tYJxRbRZxJV743YXNV6hsJ5+STNlKRwC+ePr/4e+iO6Xfj79WR+ChUv
         yTeT45gKLmQQW7jDinNKxO7poW0ce4N2UMHDqzRFLiNBGIVYbLWjOh3kLO1u8uaz/5ti
         cml3qnSdb3b296yT8/Tze8KMw7cQg26UVn0Qd1Ggh7mhRNI6vB69Umgc3Cz/3/DOO6Ru
         bl7+t1T31qnLAilSjFlo7RuiMPC8aH/7/8fIDly74HhA1xRvsxGz5w0fZBAhGnEnOL5v
         b/AY5mZ4EcByYBvIa0Iug9EpyEziyJPhHSAyC3dxC+Bl3HRkDXs8GU24/01FL0kfWjLw
         vxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177782; x=1776782582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPVV3v4VLtmByB3vAduvUEcC5XOVjKu7FaDLbHcwqQ4=;
        b=Mm0wcXJtZ9xqRlSerEu/sCqXMXEbJaELqBuNm4hgrR/u5NvxLxAy3NgsPG1JeBPAGE
         usyee74cUpLSDf35tiAchXdFVCuLq0fBktlVRnHe/jjg24qkTCcma21RnX8wPb/YefCB
         dXK97BM/7osb+aRVnSwE5XB8vwxnM8Sm9IjaUl4nOIIzQW4IWjX6XlZCursN7rQ/UxlA
         oQEKC3qJvYMni1ku+XzdvxmpyE0lhhJx9qb9TgUA0g5Ca6D6nsDJAjwGnUk9PttGvyHC
         pZ3CpCHJ6IxljwDMOxe4vc29sIui282zjk7pFNJHYqjjEWrxzehpN4e/WwuHOF9JTgPX
         lQfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+5m7Z0he8Bd32Jl06FF5u+U+7zz3Hyi8D13GPFpCCtey8AQFDJOiEduF9V4C/qnbyKdEYfsepYLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQoxaya5RC4sd9zbD7pI7tYPFpn2xA72fSeCHS7KvxrCIVxgle
	L1/mTcvXI/sxNfw0+EoBgs2jyh9qxfs7ER+fP3Ui0Vh2qls9XOCvw2Mmr9uFNWiFuXxdoC4fCoM
	uOdHTla15o00XFbvqqP/6V5lXJXIpTCI7+TkpAYo60/il9dXVofum2IcmEnRMExE=
X-Gm-Gg: AeBDieux6EY/eJvCqApRaj+MvRCThSuuB9zXIcmvxYWvIgSS3/y9WgEGB9I/9gxU6Ko
	2mxKRggxI2KDZVLNwknEtkrasHKi8c8dYe4SwveQZU9HQazPsrviFAw7jH2avO26TmsvWKdOMm1
	WK3bwcFwbCUPPlqJ8lTk8tU0DdE2ky7m2iLmulevxjbVDv+qcGBJrjlJhUrEXJDkg7ACNe8Qb66
	/jI0QCnX8fBWVCD5iFJdglqQ89DhAIlWbulM/XEpRx4BcXeSBdehf26EDJtkhAaYJzhHa9vujHJ
	X/sDFSDQJfYVpJULBgKrFk7pI85hjN8zHg9d1tIaSro8Oef7zdpHsdGh0R67+QTwewt+zcJsMTv
	HWRtsHaZ9UyO5eopTAeEWDMbHXpI4k8LgLpY9DfPzRkd86e0L7PiBOVsy9BHX+r/+2YePJ9BVUo
	O2A5N0FOP8ewpRtA==
X-Received: by 2002:ad4:5cae:0:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8aca797bff7mr104569126d6.2.1776177782515;
        Tue, 14 Apr 2026 07:43:02 -0700 (PDT)
X-Received: by 2002:ad4:5cae:0:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8aca797bff7mr104568256d6.2.1776177781912;
        Tue, 14 Apr 2026 07:43:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c54d5sm413465566b.41.2026.04.14.07.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:43:01 -0700 (PDT)
Message-ID: <8d7baebc-db38-403e-b724-d4b214b5a51a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
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
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
 <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
 <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzOCBTYWx0ZWRfXwkhMW3U+vRd5
 BmjdWctI6gwujTw9zcQDEr7tkYOC7BR6anPC5lygAy99popj0ceNwRjKhdh12o6AZbw/v0YNeX+
 3oap38AyLUOYn1Vne8OOJpC8gEKkZEkDNdct5TlEW3lyi9VghYnoqXd1KupPryOBMB79EDVM2tV
 jYEiWlOf0XNt+KFzKJA//UOe656AUWfI1N0hgZB4Izlq/Ef543QZbyQVipyKmnrCbtTXy2qqiKj
 ZDFbq+zWHvyJvFOG+dnZPRY9VthUbyirtZaqHRZvSzi1MDK9XV7Gys1eBLfAsxjNPE89EsdOAhD
 eUJvtEO9mR5UjG1+C4wRxCba1yXhZSge0BCU+DRO4x74WAbNnR0vnxsDHCZkto81FD/XfABtF/Q
 FRnibfNsihUPwh5dQmzp67WGe3MBjbA5HfRYK8R9vYaugJRL8yXil5f1BSLoI6l9oVyYJ7U5ryI
 3kibDH2nPzjLqDyj4vw==
X-Proofpoint-ORIG-GUID: EP2n2Z6NKVCV-KoanTifUwURhS9BJyg-
X-Proofpoint-GUID: EP2n2Z6NKVCV-KoanTifUwURhS9BJyg-
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de5277 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sSUgItNeZYVuX0SKOHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140138

On 4/8/26 9:26 AM, Taniya Das wrote:
> 
> 
> On 4/7/2026 4:28 PM, Konrad Dybcio wrote:
>> On 4/7/26 11:30 AM, Taniya Das wrote:
>>> When the clock controller is probed with 'use_rpm' enabled, the
>>> runtime PM reference is currently released using pm_runtime_put(),
>>> which may return before the runtime suspend has completed. This
>>> can leave the power domain transition in progress while the probe
>>> path continues or returns.
>>>
>>> Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
>>> completes synchronously during probe, guaranteeing the device is
>>> fully runtime‑suspended before returning.
>>
>> It's not immediately obvious why that's an issue, is there an
>> observable problem when the transition doesn't complete in time?
>>
>> Konrad
> 
> 
> Calling pm_runtime_disable() immediately after pm_runtime_put() prevents
> the runtime suspend from completing, leaving the clock controller active
> and the HW rails in the ON state.

Please mention that you want to do it on a clock controller device
registered through this function, because currently it doesn't seem
to have a functional impact on the existing paths

Konrad
