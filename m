Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233187;
	b=D75PdR/WMgg0iFpEHBhAQ4+dCEsE0YpabQUCP5WXSFmEi1bGyuQvuddrf5WTbG8lwE+o
	 z46660hGecmE2N0e9GeEl6XsJpsEvBSvIREil2rJaxkMLgUwEo2h/vVszx3UMeKB/bmK+
	 a/zDwP/9XvLnRkC/UlYshBVUfu+CPQmrvfaPU6HgRKNCX4uzE9n1mo7ym42NsTdf+Vv82
	 06ai9K08tjL9/d4y1vH0tHmXzZFa+tXVS11KV1Ngr5g3BLM8BObey2F/bDUVhB9TJ0u42
	 SWyUihJvYjh5uQm8md8/4G7Wyz8Ze4GkkjrodJevH01UjwMT6scYxYALxvFMM+9lCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
	b=X1haUMGgaUKo1XySX3JkFg6WkpI9L0HOxeozMkRjTlf5IcwaiD4llDK8uwqo/I982Iw9
	 pL6lfkEDd3rz7igy/wBIrjsyXsNzPXJAnShwQYPdSbSX8JZoXwVtUHlIfVtrza3+4wlMz
	 JqvhKtu2y0vMwY7gIxkg9XbSQXs67nbaUKVxdefn+wligxXcz1GM1EsqkkMGkhIkidxC9
	 nj23GH2SHpiQ2Y5dVnMIlcYkGTntuQdGxpPoIU21pEmjJQjeA9ygjg4vtPCWq8S5BFrMM
	 cnLY5lwPjMzEPWlMXfBTodAhjBVLazip6bCMxSBl6p5MIw6vQ5OhooF08OECWubpZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A2606A326
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF4OD334843
	for <linux-clk@vger.kernel.org>; Mon, 9 Nov 2026 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=; b=pk+5LGwYMAfOSXFA
	lecrTQTHD6VN3Lmy8W3ERVHogoxBAZJ1A1qTiGq8rGTwbGZHTJOM4gK/hVZMng2d
	/hLXksJJ2FQIwT50rDlyW9JkjHHr4FSthKCkNi0D1VwcshthvB4zcuwz2Fhz/gx+
	e6ca0MF62VNUL2A2gQhezg4RDfbM4YB5VkkEep9oALmlUBbKHlXGSf5oyOAfa3xb
	wPeMyTqKsdm7KX/AjraZ5/LRui/0jHWtnn2CPteSmveQe0+AtdnsrQgWJ8JUeYo2
	55ITnY5cWnOe0EOQVCvtYsTzOkQYIcokK+cIOs/3lo/bI9Gn1OOzFaAWIJRmXESw
	kZHkVw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58gd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 14:06:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2f843bacdso18395137.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233185; x=1794837985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=JPdOO1fQ255VZVDrnKHesNUXl0eflubl9d0pDkGDLqlddilLDRxFRU9aq7FH6kR8rF
         H9DepIE0Kpo2s/8rbWea4e8F28QsdV+lfXm9HeYiVE2d88lNZi29JUBEcGraWhoRYr9A
         zEA3SeSZfhQzbDt5eC/UxKoXNSATL3bUKVLHIwZaG6gLY4YLnxRsY5k+ANLksymrWEoy
         qXEhmog2nmrhoOHknplkVQ2NVVn/2llyFTU/3C/9yaKmrf3+/WIoJ0qAuLHR2lz7ws/Z
         cQREcUZr6mE5F0UOd7YFdd7c6aggvzpmM8UkuDCQEeCF5Z+GMS8PPHA/ca+v7DxzcTyD
         2zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233185; x=1794837985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=FnWAyJUbLMrawdYgZuIgZD/wclc9EaiPX1rZlWqqoYJkatQedeyt7UWu4vb1hNDWjq
         aiwkBbvv1Mk9HDu2/M6vnXJXNhG+2WhcOVk4yeeyulAQUNnvzLvr7kI7w2IhzewBQ5Cv
         zOwgOHBXBm46m7X09LdW0ZMoTDV0aBiY7kwRmRGvaatVkfANA8oVCyvD5+Zn0zAJn98f
         qxgZ28sUSEXaeDvK0SisaczLRvfd+kF1/3YhiT2LQCOdcrF8EGRuCrA1XO0F9Nr6jKfm
         UQnNukKoO0ufIVp/cfciZtx1fCHK9hBJfhg0s65fslBbZHm1DSHdvkE+cXh3KXQqMIdJ
         g4lw==
X-Forwarded-Encrypted: i=1; AL+hErF3Kn1+4O9L1cF+gPBSmECEjRTqSCoFbQES2uHOFcTCUQRaPPY2qdY/RS7weo7fD4uKtOl+O8tnH2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z85GN92NPsG+keyNSKj5oxCsr+ElUck6A6N4q2V74vhcjmnkBFC
	84U8H7l/mbfZ9oM68LYLvQHmSR5PkNz6aWCglqWQEbg9pcl5bzJWtLrWcs55sn8dma26YJQrMog
	wKKuCC5jTslAwevZkdBThUUjEWgtt2WfvP14jBm73lrWqctRfGDBxpn/0mzrq/MY=
X-Gm-Gg: AYBFou0I64qUqZ2vcpoqejorDhJvxilu4FUnG/6K2pzeNIQ0DVZ2mwRhIcuBOMi7SAH
	0z3S7bXjgrHutikfiHfwxpPtFPGkKs8ujKcwdD+Gpw7UEl5Qop/NfzWf9HsKebEzX4/1eOpdjqS
	NOKoGrOfWcQsN6lLQgeGCCP3Yre52EyseOy2nrHxtUVsT7cTOKR7PoF0/YbUWKAKGzEyVpt9rJf
	5sTyOBxACvebLkDhQxzoqADlXeMSrnaeypsdnp+f9AvcUQQP1cZ+oikvW3cMaR637VIUQxT+EJh
	PnLuzqnzfpR7IVUv5OECG0QVQYX87ddWbVYF24y4OZQKEXlcjwUggvrj1bE82F0MG7j2fRP/iak
	cdQqrn/75Lo2hNq8T3kGB8Mxjzmgqo8RO6AS6SnPI/0hAdYhc8Kb2oJ+xvWhtB7Y7/RTxhw==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947698137.3.1794233184563;
        Mon, 09 Nov 2026 06:06:24 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947543137.3.1794233183505;
        Mon, 09 Nov 2026 06:06:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721c8a9cbsm1525983a12.0.2026.11.09.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:06:22 -0800 (PST)
Message-ID: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:06:18 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CCD7LOSA60i1Lp3QfwqGXGouzJG-yFr9
X-Proofpoint-GUID: CCD7LOSA60i1Lp3QfwqGXGouzJG-yFr9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX3PKfoF0pjL4M
 BAh5Vh3Y3JptTWdjPFumuPiLWIhIJPHVuwwy+LM+pkH9fTfjAQQNwEeKiVKR4fKwCRh4cnPHm89
 hpUVzK6WFhR6V5I8DcTlBAD7OAuVueY=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1d361 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tDZyZ9LLp4Dxownb6IEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX2k+8MlJFDq+6
 KjvArsXCowJa/3J0cECK2B/VEgj1U+OuoXUtG2b4IaS+YUOm4W4UfLn2/yr49TJovXu9U4kPSCA
 ayJIiUCvMaTCkUvHDZRkYmmqXn+Chu+9fyZIWB1ljGuQ6nMvLH35syCJuivlJHhHxDM5C0fn327
 bVCy8jiZKUBwta2Yop8ymzljmeg8Nr0lhC/YWvvYGfruDLeebhyMiqw781FWXKIBHjVA1kZ7KUB
 auEk+cxiG0vHP3Q1zy8TJS2m8ooCCwDxC/Ei5Ym8K2FJlQpOqkY88+EMaH1SEuY77qR4JtMXocI
 QhwPEecSsBjL6mWBX24cXRYMopsOf58K/1Eepxc6sGDzJCp5O4YXmacUm08fu4Ix5qnHlt3mpkF
 xEcDK0/bL511IM0Y5rXPxjMlKoXUyqSzRxbVP2fz23puHPJ5HNVtSDTGQcOXXVxwQnMpl7Fv8jp
 YjwfsXJy2PixMTHwjew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> On 10/23/26 12:35 PM, Jerome Brunet wrote:
>>> Preparing a clock protects its current requirements, not the resources
>>> needed while changing its rate or parent. A transition can temporarily
>>> use both parents or access an unprepared clock, and a parent rate change
>>> can cause other clocks to be programmed too. Raising resources one clock
>>> at a time leaves those operations exposed to insufficient power.
>>>
>>> Failures make this worse: hardware may already have changed when the
>>> operation returns an error. A matching cached rate is then not proof
>>> that resource reconciliation finished. Retaining a temporary enable
>>> reference without a corresponding prepare reference also breaks a
>>> consumer's normal disable/unprepare sequence after a failed reparent.
>>>
>>> Make CCF acquire the affected tree's and parent paths' resources before
>>> notifiers or programming, and reconcile them only when the walk stops.
>>> Keep fault recovery independent of rate shortcuts and subsequent
>>> consumer reference-count changes. Require explicit recovery of an
>>> ancestor's uncertain parent selection rather than reporting success
>>> from a descendant request.
>>
>> I don't think all this is necessary to address the problem described
>> here and in the cover letter.
>>
>> IMO a new provider API is the wrong layer. The framework already has
>> the hook a provider needs: the rate change notifiers. What the core
>> should do instead is fix those notifiers, which do have a few issues.
>> You are fixing one in patch 1. Another fix, about setting the parent,
>> was sent recently:
>>
>> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
>>
>> You want to act on some changes before anything is programmed. PRE
>> notifiers are the right tool for this. The user of this change in
>> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
>> it, ABORT drops it.
>>
>> Also, what is acquired here follows the requested clock. When an
>> ancestor switches parent, the chain of its new parent is not acquired,
>> although it feeds the whole subtree after the switch.
>>
>> With notifiers, the parent fault state is not needed either. As it is,
>> it blocks every request on or below the clock until the same switch is
>> retried.
>>
>> Could you tell me what you need from this approach that cannot be done
>> with (fixed) notifiers?
> 
> I'm a little worried about the ordering there, since some device
> drivers may also be registering listeners in parallel, so we don't
> get a clean split of what PRE means ("has power for sure " or "may
> not have power")

Do you have any thoughts on this? I'd like to proceed with this
series in one way or another.

Konrad
