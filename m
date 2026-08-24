Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2603BBA0B
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567328; cv=none; b=TfkcV2Vq+vU50qLGoXBu4zqR25GEG6ogsuTVwi9ieecsPJh52t2JWhZofHHriiKia5VOCBIkHZ8FRJKrNZqYEAihwakiLi2gY6NEE9sgjmJVG9hg0nmld3+ff+KTlajfw9Z/O/Xt7F/EVPF9XU5UkNMIK7cY080pcmegSrJewDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567328; c=relaxed/simple;
	bh=cQNEedbxhZxQA9QhQ8skEQfjbIFeN6itefZmSkoNAeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suBPe2v1Ezfn/SAkw+OzvpWVZEOouVB9U39JGmrDQ/qi556rXd7h32Dl8rj62YWX4OEdfZFNUC+KTptjUwbIbZ2waDCZaf7b3cAC0Fah7XWgLGPgw8LcsZXoAD8k9SomfjwRWcjnwKgCAm/bI8CWIX+tnG6z1X1PAkz9tMN9uRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgaTiU6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMmOzoIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgaTiU6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMmOzoIo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9WOjP2036004
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 10:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DYeT7XwZo/hXjCYLb7YEX6nbxqATU8NYdWiDrrlDU4=; b=XgaTiU6eUJb96Nz5
	zXm50DE5aC4Bv6Fbichd/wKBFBWvqwlBgnnFxd8+BBI0Q9JUzeFROvwUyao9bFtu
	Fl9YJ/8znenICpNXQyFQRqlVcXyMAx0/YsqozeftQz3MayK9Obahzr0RxpISTIKL
	T4PIParBNtKVEwfOkWzu3Hm+h3AXb9YgV1cZrb5uzA/76qNhVmSHkzinE1Rt65B0
	vFwUjf1a1kdfdDguLuWjIYlbwxy2O4LZ/2jfz55h0uzPnNeTimfTw6FAWbD0/ImO
	t/olay4rTxxh9QkKiBEtELEz9ngP7ssabTyVVY215tqEN8CLOwJoQExHdjxLbS3B
	B3Nfwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsg6t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 10:28:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4681638a91.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 03:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787567325; x=1788172125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DYeT7XwZo/hXjCYLb7YEX6nbxqATU8NYdWiDrrlDU4=;
        b=kMmOzoIo46sxM/2RH6561KR+HTq7/970LMk1lIcOaccV5V3cm0wldfom17XYy9UQZn
         Nh6sJLDi0rO/zdYB70a04Zu+gIuIFCsYCYs/EIq1w1ZeAQh6UV88wduVApMP88FC0zJ5
         2X3Kw0qkXEP6VBR6FE5OrbBgWRRhN0X6RJV3KyYW/ehU9aLQIiZ6XM4m10ETAWRBGxWv
         JMcilUMqirDG3sMOg2kEU2VDQ+xKset/pUR0hjdNAAjSnrA43++nKd9iqrPP6ahKSW/f
         R83N2zcGOgGJsjiS8Mz+Q1qYR6HLT8rPHq4xwBwFoN4/+h8C0eiCK/Iu1mmNkTv5NmFT
         z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567325; x=1788172125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DYeT7XwZo/hXjCYLb7YEX6nbxqATU8NYdWiDrrlDU4=;
        b=WXEuuPUImvAian0mR2A+dYWkZ4LaQVj6cgEcHG5HYifquqr8yH0p/Cm8b/yBdTFYG5
         UpH+a4wo2u1DtPv+xMOXrmDvQfhVOPKfIJrhuR1QH1f1INrUU3HiARXIkM/TVRQ9wArX
         p8dLKzQGGUMymbF87Tyd9bMi+si1Li7ntgpfAXFvGrKKKI09LqXOOpoT5Doq2NdR+47P
         o7Are4VpR7qqkMYJ234hnAFb77P8En+x7F7h40rnBeojCXKHNbocUwiDydCyL9DoNyTe
         6/aZyWovihioEh5xZhsTRpmZ9JKRjiBfuCFGqalAVXMD2B8VTDZt3GaJeWLeEHQNoSFC
         jenA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2P7ALa5a0WoAnHQ9dMrGIiUkLkbGokEM480BCElTep8brlz/2KHMVK+Sfp0w4qNHCoFu9QL4mhxs=@vger.kernel.org
X-Gm-Message-State: AFuF++kiljIb85pj583nkh5niliMB0dmDT0AAA9+lX5HuJGaeML+M8BA
	+jzerBdaWKtmY+hEqzR/aSisGSf2FoeYCXPd1jA4yUyVl2UHm0oCFa5r/KnOppsMm8siQNL0Xo8
	2+lM2X+3eC1P4Kb6jh/WdwPNG4xkHoGTWn+1pJ/z5xzcZ0FbJ/EgUCwptHvmS4+U=
X-Gm-Gg: AR+sD10+TSBoAAJRbVYURqWZueSw5146sa6ySajaiWO1JgDKMGIz8pGQWmK4k0nwaC7
	PmtVITJHDvlbpwNP/ufcaV73BJZw4uJD2iZ0jMLLgGA7E6iXdQCZ+PbnnwGwiPlBwGHViqRq5jw
	JtEpsKQx8pFLCv9USHD9s8fKA0eCVqYcKCtwCSepGsVzLCpM/T277ccaJgYIJB/9K1RCBuDLCUD
	7i6CvrZGX1RQLdoN8sd/UN7u1lf1PsheDpDDj0Mb0rv6qrJbjX/Lt5y0hEw3KgkgWGfyCEQV+jX
	J9cGsfl9S95alx9YaSE3x7OvRBRoDp3PW4AEWxjsT0kEQpbH+N8+AQ/MfT+HKM4UGQuvRZKxNYB
	dWPwrWGtqPiUPIyPR4RwZlmrirhwHsymwMGw0ZeXs7Z+KEW9+Ls3VyWhhW2xP2Eyq
X-Received: by 2002:a17:90b:4488:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-395c5114895mr20694340a91.9.1787567325431;
        Mon, 24 Aug 2026 03:28:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4488:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-395c5114895mr20694291a91.9.1787567324829;
        Mon, 24 Aug 2026 03:28:44 -0700 (PDT)
Received: from [10.133.33.64] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af6e88sm9630681a91.9.2026.08.24.03.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:28:44 -0700 (PDT)
Message-ID: <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 18:28:40 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
 <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
 <cd5a25ed-76a3-4f1f-b924-06bb685ff426@oss.qualcomm.com>
 <181944c2-2484-4384-9c91-45cc87f31955@oss.qualcomm.com>
 <8286b42e-0314-477b-ac2e-4b410a97d833@yahoo.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <8286b42e-0314-477b-ac2e-4b410a97d833@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NyBTYWx0ZWRfX9Z7QcUS4HNvn
 nwpp0/tR1ds/2AiSemPWJpOQcO9wB2TxZZ4atIoAMjXavHc+b+JEtvb3KG+eOmupHHU12e+cLrB
 SpXi3EJLwtvRVI/a0wbQLRb9JEq3l10=
X-Proofpoint-ORIG-GUID: A8JXn4vo81npPyZQGoslLn9T9fvckcDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NyBTYWx0ZWRfX09iZsSfLR4vl
 Vo0hZIJs8+qqkOlstzGm+28ehph3+tdYCkZLU13+Z0y2jhOLMKnYlwqT9tFAqMnAF0pb9b+uDC+
 d1I+r3mcvugMsRJhqoDSTnzpX0saMsoB0/aRjLeqgjcuD4hG5c+xC3phktec9QH9ytzqH/dEj6r
 CQdeWpHBgEJnugT8hu4fuQMb3b8Pldqq78LjP0GWwF7h5JyUUM4FwY74kng5Hh8Y6QQQkhEspJq
 //XHA9A9SKOo5EskfiPUq9kytFNrUIF6vaSr6L6lEyp2oc6vNnhr26r5IHgfqv7VFPeLXzWvfHV
 ym/TeS7DI4OBjxeKPrwr/JRsOis+lyzNf4nWrTbDyBzcCoFNkJ5vyLMks/aSMwBHAvVffVCSK7h
 yIUf/+EYd3uDxClwdztlflTT6T/ze63HqMOQDv0Rk14g+YSWrY4TdkRQfr/7fMz0VFCiPJ5r5+j
 fHaKGjGCIY317CIrSlg==
X-Proofpoint-GUID: A8JXn4vo81npPyZQGoslLn9T9fvckcDa
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c1cde cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CjxXgO3LAAAA:8 a=xSVpax0bZLVpcsUhXYAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240087



On 8/22/2026 7:19 PM, Mieczyslaw Nalewaj wrote:
> On Thu, Aug 20, 2026 at 01:39:52PM +0800, Jie Luo wrote:
>> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
>> continue to operate correctly at the fixed rates even when the AHB
>> and SYS clocks are disabled.
> 
> The PLL outputs keep running, but the AHB register interface does not.
> Once autosuspend gates AHB/SYS, any later register access to the CMN
> block hangs the bus. That is the bug we are fixing.

As far as I understand, there is no expectation that the CMN PLL
registers need to be accessed after the CMN PLL driver has finished
loading on IPQ5018.

Could we identify which module is blocked after the CMN PLL driver probe
completes?

> 
>> On IPQ5018, the CMN PLL provides a 50 MHz output clock that is used as
>> the reference clock for the connected Ethernet device.
> 
> Correct, and that consumer is hardwired in silicon — the internal GE
> PHY and uniphy blocks take proxied this clock without any Linux driver
> calling clk_get() on it. Therefore no device link exists to keep the
> provider active, and CCF rightfully gates the bus clocks after probe.

The UNIPHY block is the consumer of this 50 MHz clock. It divides and
gates the 50 MHz clock, then routes it to the connected PHY or switch
on the IPQ5018 platform.

Would you be able to try this approach in your code workspace? Since the
UNIPHY driver is not currently available in the upstream kernel, this
may be a practical way to validate whether keeping the relevant clock
path active through the UNIPHY side resolves the issue.

UNIPHY register offset: 0x74

Bit 1: Clock divider control
0: no divide-by-2
1: divide by 2 enabled

Bit 0: Clock gate control
0: clock disabled
1: clock enabled

> 
> Adding DT consumers would require touching PHY and datapath drivers
> across multiple subsystems just to create artificial clk references.
> That is not a stable material. The v4 driver fix is minimal, correct,
> and self-contained.
> 
> Reviewed-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> 

