Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590043786B
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010337; cv=none; b=dGOt3YDeSeA05p8v++UIIGFBMhVw21fXixdENcxiJDIn6ZR26JMHQqeJ5G/XJ/QMdeRa6cP1hz5OWGFyVvNB/1HI95POwMY7M9ITRHRK0FSgETh6Hnjywy7mhTnaDU5IsgfOUhGEe9ORJWC270b0Hjac9aFvQB4GJnGFwC8CbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010337; c=relaxed/simple;
	bh=YnnEPpfnUPa5Y9StJluJxI90r1PmLRRMqN1/9yvH/ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0RADD6RbL0G71OdhEaWaa+e/sqLNhz6hTqG9yxgBhNTJuQjyw4E3pQkoEshcfq0mtw9kI6lrQ9H0yUEKenKm3xlo8JZj24QaNdLTTxyGTVIyHFHarxPWr5H8t0QFt41LT3pftiGn25h1XSsEOYJnPuyLXDj2ETjg02CoyGB0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmwramH2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITLrXJA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmwramH2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITLrXJA4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nmAP865795
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=; b=KmwramH2AQ7tLxSZ
	Jj7I0GUOgipYTvaRdwNWV8APeDGz+UhXcLhK4EstQekIMjncFVmLRSzqsH/XZJFi
	jQsNSYe+tWcHK152OLTeoJyhMAS9LQpu/3SEFwhgFja5iY1yHZJpiesG3cS1NilW
	CTT16uublfNjyoRXaBHcKe5mzQr53tkwsZ47y4ZWgmieoTZ4aXWYOtuJi4Ogz8OJ
	KydxY0QVSDopT2yxptE9xg356iOC/0Lk8dxALtUHSPYXukVPfGiGyEmHTTQpyZcN
	FxdGLsCTWKYMTegRsBIbsy2mkgBAj+0oci65dYJnn7nSBo7nCmOk9539vKRvfnKs
	KvijJQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bhy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 09:58:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so3548556b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010333; x=1786615133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=;
        b=ITLrXJA4RJhO+zdEmVuSShwPZqtEeNY5aaA1oFc5DlmhmExyBV19b1INqm5vy+x0fI
         uOfjBqP0LgSFO2uLYYSiBGsAwYXErZpw8+YDbYzPT8NCu4RvJR/hdrr45AAGE8/WERjK
         kvJF2GNVZO6Pjrbi9qyJHK4Ed8Jbt+DYKQ6p3/IwWaRJXa2L0RwnZ59lEAvMjoVAycGU
         7rN0ep9e23bWxmAcoUm866YjbdUiLWYipnANtJJMZR3gcf+AsGw8W92DCFXDe/MfQE3Q
         8gUjRhJCO7B53RiHWPXscMUlQ6WlH9jgqUptgrsdU75TqXs8iC1nN4rgV8HNOMUVClaK
         aGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010333; x=1786615133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=;
        b=Ach8iIQX72KDgHkC9iMXjnjVjEylYkkK1SkbbwP5ve3GRHGFmQjV0C87TQHqX6nt38
         lyJEV4836wotOXhd9t3Q0WRqy0CWyXPgwSgtaBtO+rji2NHd5F0AqLCKs+t/Jj8azcyK
         YXaQwm1IpO2WtIHUrkfXUWKe5EB5hpOJhQw9Wf0lxUcy+BZSFKY8zghr2w1hurW8rHK9
         6OvQr2aVU92dg8xSlocpr9OPylgbQC4MBIw1JlGz55QsbOC1e6yrpYxLxAvN9+CzWl8U
         OrdrYA0jxB8x0AZObo43Wz1Lzs4kJ5w+GRnTA2Yqpv9FUxcd0866wL15l7MN2f1P2Zsi
         NeOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpq/Bk4noMa5fC3YNzt6QV/pjjGVCizwwZ7FcOycqniMCETWVbJfvkLkoZbUMfwSYvjhs4S20XekKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQi3XFQFw4urpnxhxVD5dP8xIlOOuh7pVagsIhgQTfDHI+Fbq0
	zjGGxWEX56u/VwLppe5rVMnGLj82jgGoUYjyij/5H8Egp9D2AnPewPcn7g+8oHMuVtvhWRoDXRe
	pLKYrx33EUdmTirkQptRoQJNu0J/T7mgEfbBW8Z6F6MAOX/3tCFYdn1Tr1cwki1U=
X-Gm-Gg: AR+sD109cCwWKugBVye0EMcQcc/EXThE4mjjhhL62VD0enml0OdBdrhiCBvPqfp0E2b
	lH86h9uzpn9CDpq89N+YRRQjJNyxUzFdpxzDvAiv1BXavdy6S1QSa8CY03ae/WRK0Tc6if9HG9G
	TaS3e7LO0CaXApfr8FhWbQq+ljWDLq+lt449IlA6oBC1JHBzHI0RuuVL5Prc53Z6S93IZnH2Fsf
	fVzVG3b4n2l/tU4opDKALpe5uMwuqw/U/PSjrzyVYIyWgmxS/iqmbNpOczdBrlZ6MjkgopjOopA
	Vk5yBuIeXz8ZFYeEuc9DqjACoWxWXjxqdNNuDVlZITK71cdFVwe3kDBC6s0k3p3OtdZ8awgV01c
	bBBNTy4gM/LBC4oOL1GoWjBB+/qOH
X-Received: by 2002:a05:6a00:1f12:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-84f2e0e1b58mr16151713b3a.34.1786010333113;
        Thu, 06 Aug 2026 02:58:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f12:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-84f2e0e1b58mr16151677b3a.34.1786010332755;
        Thu, 06 Aug 2026 02:58:52 -0700 (PDT)
Received: from [10.217.217.131] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e75sm1068934b3a.2.2026.08.06.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:58:52 -0700 (PDT)
Message-ID: <53fcdfb0-2bad-46ed-a4a5-519a1495cfda@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:28:44 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
 <20260805142646.GA795123-robh@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260805142646.GA795123-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZR8xYkaKDJ2jB3HOFRzF_riomJjJDSbt
X-Proofpoint-ORIG-GUID: ZR8xYkaKDJ2jB3HOFRzF_riomJjJDSbt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX5D6Ij6zNv3vi
 NxKIVMGRrFouU4g5yxtMdM01qwoWtFhP3Pm4gU4ROKEmDd31MEXA5hzZlyVqGw4WrWW/XIdY8kH
 LK2SAnot4KTbK5oiJUvgItmTJRmmIPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX8WgjsmaDiEkJ
 pJsUzH1iBPU33DExRccHdVnpVKlMsPfJch3Li7xCGnoJypjPjApbiVm/x2WWMmdmMjLqOAcONS0
 wQRNqlspqwIN1Z7ySCymzXX11lQVjCDse5zOZs+Ujj1WCpD9E/7nLNQQ08IEb6DfGYYaPfQw2PD
 7AMO16LoLiWb58UdCJF3BHVvd8Gq73oixrmBUImAJMEKTqCdek3A0ATktGb/10FRl5Jhy5QeHRr
 WcCqKSUqxn3i7ak9PlCG5KkTIyqIuCsuXHe45MqGttCVe/cyBi9ZD2mXbt4wXg1aZRpV+9uQmev
 lFK19XWK+r22CwbC6KHPMH/rD2V5sJgHNyVVMh4YufrofijZS+NOmPNvzUfuJKL42Khr3ycN3He
 IVmMJvEOhJ/M/3zEwvVQm5nQiohfoM+6TdNlXyLHgaVemyr21h3axmqawOx+mJreWclOegziasL
 lDp7W8B2OeB4opy+3SA==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a745add cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=h0B1KYQZdrYX5eXDyKoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060076



On 8/5/2026 7:56 PM, Rob Herring wrote:
> On Tue, Aug 04, 2026 at 11:20:19PM +0530, Taniya Das wrote:
>> Eliza camera clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza camera and camera BIST clock
>> controller to the existing Milos camcc binding and add the
>> dt-bindings header for Eliza.
>>
>> The camera clock controller provides power domains, so 'power-domain-cells'
> 
> You mean '#power-domain-cells'?

Yeah Rob, I mean #power-domain-cells. I will update the commit text as well.

> 
>> must be present in the device tree node. Add this to required properties
>> to enforce it in the binding schema.
> 
> The sashiko report seems valid to me. Should cambistmclkcc be a power 
> domain provider?
> 

cambistmclkcc is a clock controller similar to camcc, I have tried to
reuse the same bindings. I will add a constraint to take care of the
comments from 'sashiko'.

-- 
Thanks,
Taniya Das

