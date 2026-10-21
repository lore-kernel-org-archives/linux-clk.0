Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582924;
	b=Zx9NMdrLntGdbYs9jEDQCwyiosZ8EX4zJ9aqbqZbQclqs4Ypn9iqDc1KoqUtCcPuUrYd
	 TE9xRsaARVxzTl/doxqYDmBKj7DL/0Rt+eQG7jK6oG+Kg2MfS/DDkWWlv719NeIk+Po+b
	 G561Ky7oNch6cjm0tFVwvk/05llEwl5V1X1b56At8u7THfnCaSVuQMHGHIvTOpMnJvd3Q
	 Sv4pO4EZRmq+nfD5H6j9Jq3Nfve4br5+HK8Atlc0uw6FmA+fiZ7qQ6VDjuIY1pvRSD++7
	 RxLMU6UVzungYbqzl5YZ/WxpesEbNgBoFd7OuNtF966juhnpAk/wA9o9VjUfkaPvbcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
	b=mwKVoX0szhUI3KsjPt70qX6OoCgfEGT1xf4eENWERxAhI8J+hris9m9UoK81bCMLElrn
	 LNn/WSw6986a4y1yZtWcNmyKB6odDQUd745xgZuUKfuk7EUASLiXSOS5dncN4I64226M1
	 Fl2HAI+TlbYSoF+fEQLUykKd2M41EhdQGq2VffhwMlnmREUL7aYZEl22SiBEfOrHTlyKZ
	 GoZPNCrtir4vlakB0r+vtG1RwfH+8l456N73thoI5M3618zoPxD6z1varZ5Q4mnbbtKku
	 9pVSbKwWDl9i4cPLw3zCYw691/7bDhQsIfms06WWqlpytOyUsiComGZTbHpGaWBN1pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=joPVtpmc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECP0PHPc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E50606A320
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 11:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E50606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=joPVtpmc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECP0PHPc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg3lx977318
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 11:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=; b=joPVtpmcy6TSTeqI
	10ffHdh59BK/YbVVENvKPlpJnItmiJTO2fyZYv2k9oRSlyT/MBiVBtdHPSndH1AG
	eOqsjayQiY9hB6GNCrj4nGSaH79wmUmcLBBmPH0MOPmY9SmDmkbjolupkoBwMWib
	LG7oDXNYqdIV4XjMXNkHV5ZXHkYNghYGoXVGw56ss+iz2uCOZhTQGI3TBUG6tf9V
	+pIWORd8+mqE1QqkWC4lGKPQxTMMP6YP60Xp/pwQ98RrJqTji74sBnWkBpqgfJ5n
	u+OpHYfFe8BtEv/M/81M8HTk6izGHeqya3dbivIyrKSUI/PM1PCzoxMJVIT9A/x1
	4b0vnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02x62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 11:42:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so11892785a.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582921; x=1793187721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
        b=ECP0PHPc844KKyVjZ56bHksR+R7DT47g9F6SDsnJhEJxZIfT+Qay7YUD1dKk+TkFP5
         VdXGvBg5fLeB1M9JT5t40QW5wH9rU6f80nY9KjY9CA+ZH+kJkAifAQQoz4tDI1Hz53jq
         s39mh9VQlNJpI8XUiL522Ud8+ArJf7m+KcwAOf/ikjjGy7R+DBZoPgJG8t0AQGfLApHU
         pVVctNo0PVfMsDxnGazU9rTXhVX0CEqs6V0x1MTXUYXQ1T0xjjYYvRnXtlNGYUeQfl68
         2E2DRRYCN2D57Uv8SY0qazr6eHat46M1x/z2QTG20Sk4y6K6g+2+StAXPTiu823dBMGU
         ztcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582921; x=1793187721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
        b=k2IoONuJPMD9sG3oSnhO2CUIuh8ijAzbdqgHIqie5hsCKMDHsERMZcdXbdiL35PGgP
         vj9g5x5/gwqpRIBCbIOkgGgyygGreWUIVZ+hUYnz0bswLMts6N7n/ImxzDaNGJvlrVu+
         zeKka4FNnOicx8hwoLGekXcVNbnZrpEKe+S+zQHR5mHIhw8QJ68JZPoxttm6Ep3uIjSF
         6vSZm1N2t6ehtngHWgAP4HPe0lB4mMNKRMbYTo/zWI4HHrdWdHDzcsDnXNzL8hkNrcK9
         bR0MKhasfCZfU4qvfzny7oypt/vg0hv5NnN3k3Vv+mhPak75MNyZdGUHSvF9vviCmt3Q
         kn2A==
X-Forwarded-Encrypted: i=1; AKwUvBxP7S/PsM3dLnrm0/UqX6KDWmTCMyOiQGiIamO+ym90n1EM3pfUm47wwgR/M8CxgVUwlcuv8L3ioyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1ZdUauYxS9CmNE6LysWpmgsvTKpjfCmVrJq+RUg8Y6/QQEfsO
	GnqKkj6y6m6CkIUxKc1jKYDrQRY1EmS2eoqwYoIqhUUd5VDbHjzPJA4UCWokxoAtAej8KAeOrS3
	APcLfT+of2anXV9HrRbSj+n5IQiGqzz+eWvZsifTJZPejykh6M/0PtaG4O2dUsbc=
X-Gm-Gg: AYBFou0qTPl0AJdWRgMarCtarDDZksnoHPFNaaSBHpAvdKQTTunOeP3cAg+r5twSiDH
	Z//rPqNabwvdJhMFJdwP0Gqj5lPaXDF2gDEaDodoDRDVfRwX1E932KZVVqm6N7G4G/2kgwDAMKD
	OBAKVfB/+wg3EkYfyPvJYsSB4E7JF3lmAFh8drZPy132LCsGZcYyw2ltz5FqNTVzdCylprsXpAw
	mERPt9F7FeaxHZyRaHoj5r3YFNhQg5Fh9iBdMsEQ5fCjmUYYwyuOa1K48rivQnq0nEIPRzsbBDO
	QMt6Uh6AuXEk+EExYE2YUswtoV5MmiCorOHCmAK16BrYxFTF1Mf58VTXLqZk2g7ji71/0gZH+3P
	LsezmtDQRt0iZwckY2qNz7Q==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr474751485a.6.1792582921383;
        Wed, 21 Oct 2026 04:42:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr474745685a.6.1792582920907;
        Wed, 21 Oct 2026 04:42:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5b763sm69095666b.2.2026.10.21.04.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:41:59 -0700 (PDT)
Message-ID: <1fa61e39-1ef4-42b0-aa9e-ca7dab94c336@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:41:57 +0200
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
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
 <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8a50a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i7A_KPRCft12q0410FAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX2yxblsObyG7I
 //Y/pQcgsxEhjwKioKdL6VlMiXYf5m5ouBWx0rNkoZtrjiAtOtz3cD54tdZYs3owvQUzDegb+5K
 lsvk10dIQEBWS1oxfZR6ljcmhv3Yj0ZKWFZ0XHpuJAhqpjfbEGKW/y+mHtxmcKUENuzFKi4TqtQ
 SwFM4WoVFWrUXmGWAvE5Y7LQid4RULKdE3N9xYdPg9SvUhURJUnGRjJnWoOUtg5s5EL7/oWXmf+
 ZNP0RAxIGKrKCYpL5zWPy8kaGxK5lAEPicVBRNKgU/r1srw7dLg6sDwhn6irN+JYvAWsft1xIAo
 X40we7/nGHJW7YvD/tbcnELm4yzCm+vr1IHbg/QLVpKkAKl5Pd/3qRe5uuQZ/APddT0sqRzNt/A
 eZZLBsCrvThZBnMjL2L/kz8J8efvDJCwa4ComrXSl7OQpJhnHgVAPFL8xmZzoNZi06aLVwAPTEf
 Cjrx8tMqU5VU6OUGIOA==
X-Proofpoint-ORIG-GUID: 8I24cMNagDX4zEaiBN-xIO9GkU1r5Ue7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX6t273XeT0MA2
 n10W/FPDcvUqCfjMwXWrkhMUUpuP59g8jVsI4YOCmSWstKtSn96M/GWk0IOb8t5kTa9C9FUHBiw
 +ySOz3FYQBXvpohBZRu0735YfEG7Fno=
X-Proofpoint-GUID: 8I24cMNagDX4zEaiBN-xIO9GkU1r5Ue7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046

On 9/24/26 11:32 AM, Imran Shaik wrote:
> 
> 
> On 21-09-2026 02:23 pm, Konrad Dybcio wrote:
>> On 9/16/26 1:05 PM, Imran Shaik wrote:
>>>
>>>
>>> On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
>>>> On 9/10/26 3:44 PM, Imran Shaik wrote:
>>>>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>>>>> every clock, keeping them non-zero until a consumer takes over. If there
>>>>> is no consumer, those clocks will remain active in the idle scenario as
>>>>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>>>>
>>>>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>>>>> keeping other targets unaffected.
>>>>>
>>>>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Are you booting with clk_ignore_unused?
>>>>
>>>
>>> No Konrad, clk_ignore_unused is not present.
>>>
>>> Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
>>> during handoff. If no consumer takes over, those votes remain active,
>>> keeping the resource ON in idle and preventing XO shutdown.
>>
>> I re-read this and yeah you're right
>>
>> Is the handoff functionality necessary at all for non-icc clocks?
> 
> Actually, if any consumers surviving on these proxy votes on other
> targets as of today, removing the handoff logic could impact boot-up as
> well. Hence, introduced the skip_clk_handoff flag to maintain backward
> compatibility on other targets.

So is that a "no"?

Konrad
