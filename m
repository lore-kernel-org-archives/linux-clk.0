Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460E346E74
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179283; cv=none; b=ohVVbiwlNNEVCR5HNRYS6QGaARrOXRIU1K+4TlGw2YVhuQbNjxsL87Jj5EPotexBcEqOhMfHM4LKqU/wVmN30ru9uC2RTHWD5RNYMx/3ODCDPKlqdSQWyG7PBHmKkhWI+CcUMlnS+w3bztxV2/r2xn6UDkPnTQWJcRMuRjYko/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179283; c=relaxed/simple;
	bh=ZuORJUwObW4xsJ3tOALrr+k1fWB6IrmjHQghqBGQaX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBK3WhfJCaOHezCCtC9BJ559GR+gYaKcnIWks4/VrlXuN6leu26IWLuqNfD8xItR87nFIgqfSZu0k0sDLvdC7DzluYwiRvfU3iKTZx3cByKOSqwuQ83TZzwsPj42O3OVRh+/L0rbQNmUUCVSrb23afKGZG8s6XnwQW/munbIyCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b349vkCa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWVEdo0S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b349vkCa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWVEdo0S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xqXh214488
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWw+kISfaCKMJ00gi3+UDgnwGcjsx6JkuhheMmrnEHk=; b=b349vkCaQ+T69C61
	fvku+6kjZGg/6X9mbesNYd8zfW38uL3MsDYDemvVotM312CgJwCcdbj/A4+jHsZ3
	q9jjz5VQSkwZMF13AURYw74XiixJZNp98iIJk63k0eZ0o9ofJD7iGTHDvNcja52V
	XbK9+WUC6nhFZAxObntrVTQZ1Ym/Qr3HKT+5xeYRbOOaDFROc0C7PMvrsiWYfsKo
	QLa9akGSpD8F1YmJeOHwi7uX4w/8O63TApqJQAewuUnSxjmXQ5g0uPZx/QdWKx3O
	/X1rpWeDJ0cBbZTpKcRSGhfOiQa5CvDkHA7ZtMsRMxdlSpc/No0wS7gkzbwrD7gx
	xrN57w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skaws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:01:21 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6027a5761so2646334a34.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179281; x=1781784081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWw+kISfaCKMJ00gi3+UDgnwGcjsx6JkuhheMmrnEHk=;
        b=YWVEdo0SvWoWn6l0ACNTYjQBz+K3mTQSSgi8pYM+GHK8HurcvvlgzlFlzMCVYMuikC
         CF/r+uCJDI0XhkWFXyXNtMWe+wppI6QS6Kgyu/qoZZ1dCZ/OAa70eT0NYa4eQIrqhbgQ
         GEYQgZ3oLVM1nTZ8mDWorncV5GRqGH83r3SEprpigPfO7d5l/kbGTwMkFdQsp9FwdSzN
         DhVchGn+h7Ot4E16fHw/8NMVgcF2Cws2MZCzYVp0+SL3tnlyTLNK1cYh7P6FLQOITuOC
         /09D99LapysrNH7WJI1PvhbhUoBEcTtZhNxnYhXrGlKekipT7EXVh3FPkWae7OEE2cUn
         RtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179281; x=1781784081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWw+kISfaCKMJ00gi3+UDgnwGcjsx6JkuhheMmrnEHk=;
        b=WYtGcYOJD7YHWtyEufRTy4IuyWg/1ID7KvZkD4gpXmNllSSnPmY75UTPO9/CBJcAW2
         G5iEOe+ddHjLTyQMSOzuGF5UQA00Cpzbjk6bzCBKCnhnlJlELhGgZsB01Smj4tby4rzH
         UXUOqENR9SB/5+87bDq0j5uuh9Sx+oFpEYZzmeNYQLejBKUr98Jdmy0AjvMowutgQ1v/
         VQnuEpx67cMRklNrZ0LIqP4MRP75cIzhgzbxLc0E56iyJFnoOof/5EE08X/a0roKW59Q
         IwGHt+2NRCTv4wvwCqMTF4lr9aMeGPtufdfcoQmDjnBvZHgI80uN+KAoKcsX/suIwYqx
         0pgw==
X-Forwarded-Encrypted: i=1; AFNElJ9VdwGAGK+C3n/7D6nt3oqsA+ecdvKRFGARMilpRS53zRHEzGxzCKKyxwlV6senysFafmmqn10t2dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeQeLhDlkd4GT7jfVuIDM/VmIGDHYGJliUGIYcnuvk0wxMQPM/
	KogMnEb0t68Pz2KO9CXTl0mR1kdPwal3JPod1uawZugCAHY3U//fElxf/W1elIGW2dFpLPAD4eO
	T+ncB7uYuVg4hcJn7IgFcfLqZaLo80y2jG+8ls0WOQqczeUWQUx2wPeZapg6CqR4=
X-Gm-Gg: Acq92OFlPp3KrE/hBDuy4uyCsHaSf8OaBB7VwOxdJu4eIljXlX52MtK5sm/0iXqDwTU
	5yLPx9Rr2ycYnfYwMW/41GUJ2gJ6RFoayReQMr5rTTfh38Q+cJPd6sq+zve55jjOG7kTv+u6yiB
	OEDjiepjg5a2jMu4+gX1p1spDIIKmnZpvmtDWReV0kwQM2+ednaZRr2UfmarLkoMV6McWcs6AhR
	7yVB1yQNLuFdpTPUKFTFg5wjgKAJdph/5NYkGTL3SA5lyNNuIafscT1bae1a0ClKWURSDZ0Q/0h
	GrBnbp0C1RoZtKaqOMN0pDJFPqOkyXj/edMOAgExuX7uxIz/F5F8QuuKwzPwdBtK7gLD/7xuo6T
	I4vOIh7JIDygXWpMhKOzGerm8/3y7svlptCfb+6qiSFmZIBwTQgr9WBLb
X-Received: by 2002:a05:6830:4117:b0:7e6:e0ab:4169 with SMTP id 46e09a7af769-7e77353cef2mr1044288a34.5.1781179280820;
        Thu, 11 Jun 2026 05:01:20 -0700 (PDT)
X-Received: by 2002:a05:6830:4117:b0:7e6:e0ab:4169 with SMTP id 46e09a7af769-7e77353cef2mr1044259a34.5.1781179280316;
        Thu, 11 Jun 2026 05:01:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1607efcsm56772166b.17.2026.06.11.05.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:01:19 -0700 (PDT)
Message-ID: <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
 <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2aa391 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jX1pNWf4xwB8ecKES8UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: qu8aa6RCsGMUZVnypcTmqB5t5856wgkR
X-Proofpoint-GUID: qu8aa6RCsGMUZVnypcTmqB5t5856wgkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfXyMErSXQphcaO
 QtZ3cmktSDfy10Tc5UGOvt310+km5b2VzthDynMv7rHtt3OLo6klSp2JjWLM/fPUEEOjlxOW/h1
 k+lgrMdXw21svZWngGbEH++ZSOH3WqB+xsB51IJeQuZP+Ep+1AmRrbTLdlTBeDfkjGs+HahiWG1
 qiT/jK9/mQieSegx9r22xzDrHCB9ws5KZTWdR1B8c257WnU+GUA/MkL6CiupF4K+lSevZfvyRZC
 ANFdlC8L+v3Zsnc3dpcLAkJ3rF1cDrHERVaN50cR2u8/w+SJNLO7r4z2r0Soe5XKuZuB91cmrDa
 453VW8oQ9qX/pw927k+J2Go8L+Kr68bqhSno8IgyxC57BBW2SUMBA5Xsng6Bhtc+mUCtNExubau
 AfqyYTwPoQRfnJz5sSrfbH88s33+fl1bQ2UWacjCfbtCd4pTKA0KOxa0ZoFn1T9kEez10qI52Ud
 xk84c+yoL9Kq1ndDfYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfXwsTrRercyHNF
 PjgqVIp1PiafVcZqRmUK2XUa1JqfOFZ9y7MeeBVeNekWa01tk6IhtUi8p/5gghoQOXliZ4lVv1m
 +Kqje3aVY0UEF/sMeN4sNcD1wOxR3x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110120

On 5/26/26 9:12 AM, Dmitry Baryshkov wrote:
> On 26/05/2026 09:07, Taniya Das wrote:
>>
>>
>> On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>>>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>>>> registered as standalone GCC branch clocks.
>>>
>>> , otherwise .... what?
>>
>> If registered as normal branch clocks, they may be gated, which
>> breaks access to the EVA clock controller during clock controller probe.
> 
> At least for the gcc_eva_ahb_clk I'd expect platforms actually reference that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk it's fine as it follows other XO clocks, but please add it to the commit message.

+1

Konrad
