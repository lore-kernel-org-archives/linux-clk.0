Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500400;
	b=oh+nArBDaybAtQ3UlKBjxGN94stxU1iA+jsygexRLWQp3c/u8eYyjldkv3ldaTICpGBe
	 aUm3bpdj0HrRrYftGlBgH6jJtUbtT9bZ88UAZy1PCf5kwXX7+fj8FhuPf5DMfSEcI3zfx
	 ie2aPLRHmPsBETmf9KSXcEhyK8tk4KXX8fNBfag+UQ6PRuxa6hOsT2fcNfhtiywn+6eGF
	 J4NCVBNlzO9D/lrrCfVwQ1ppQVp54W4iDi+zQRHC3gzBfUDChL87OCT5jQRvIknZrFNjD
	 SNQrefYVq4kleUQ/fxHXZGDf1p4CLV8Ia6yiy09BfbTYuu3V2cwtZl6CtDwposPD94A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=;
	b=eOd8PfosDTHjrV3oRokmExn4coao9rELki7hg1/4T+KddgS6XTx4z8o5dnRJRvcYr7D+
	 CXfABZdbLUnJ7x+aOThGZY8uQpQL+P0Vv7NA+qbBn47X+qMG5mI31U7xFzRlzW9JZj/Pq
	 Y9Ql2msIITAmg+WitV8AVqGfeFfDi0ZUIcvmlXtRvk4CLMZ8nyZX0Svsq8u/vJZjlHaSq
	 c8w/nMvdkdjf+Mn0KHXy02t6mbYtlmMarkkm2JTPq5ZX8dTtlRsqCcxYMk7L1WPqtMfpY
	 yZWb2Kc03FNQGfCrydmuUn1pa9HciDU6jzqOg1O8XCmngJIH5VO+nkcuLLpQgSySQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWMIS5Zw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EB1q4tBD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09047606A31A
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09047606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWMIS5Zw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EB1q4tBD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxXJU1293275
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=; b=KWMIS5ZwvKpMuQy6
	B/Hq5J4jh2srTIJZj1rWvqt6giAfvYSZW79kkcplGj3Pb5uX2s5BYuT4w7satKnZ
	qIt/RY86cpQpFZub+nFCKRuvtD7ezEKT3pq2bTFv3IAjx7AcgTrEd4XYceMIKDkX
	nHPISHFqcS8+mXt7tdiJpCJT1XsOvmTdubjRYr93W5fa+h8s8Ho4GOyVvcg7O/yk
	l0Qcu/9VFpIYN5mHoIjLNIsmW+QyaJHV3u4x9veuaRxSdNtJ25LM19vjeBFMGrP+
	nbOBnFcWcJArZUCkmeGcJyHiq67CeywfbBCxc3K4kX+iCmw8jXG0p2VssBP68s92
	fnn7zw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:46:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead2112f11so23445e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500398; x=1793105198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=;
        b=EB1q4tBD1HROKieSRH9n0lXMHmHUXTHXcqox7NujofddDur3IW/vzXZuHNmPjUsVUg
         Cpnp7/MwVUATG2r127SlusUVMKR+dd/elIruKnrYSaGP2Xj1jQd5WQzEJeC5ixka+3Q2
         vndWjGaVLck7ayTxyPfBLRb66j21HgZiAHmqpyA0jWRd15l4Uwu1RgDsSn3Cvya/o8bN
         eNCJfIH+4vsrbWj1dBPRjfFtA58DYJyxCEpDYw08mCSmFVPHXS/5iFmQWdJeoUQVxLj8
         1qc4xAkKRcCZzASj5JLAL+a3z0cxVfRKsmyN5LC/IcK7ln1C6M5YNaHr0zg/1lBNyOuc
         tUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500398; x=1793105198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=;
        b=Ypae0mn2mIWul6gXHBA+vFxXu8JQ70Ymje1mMlR8QYO6by5hdEQWTz7T6LM5S98Xc6
         P7w062S1wH0nJtdD5OpB5prfDolRfx7vZfdvQI/YsSMixwk3p2thSUvL45hk6cNQxRD2
         qv9kRoD3dkltTcBbQxD7ilFfVT36x/SH2Gg4fCeGlZnVbwBd5j9U1om/foNc2+C4j5Mj
         drUHvOHodG71pQes3fVpqS/wnaBy8So5pYHmRWf6HmaUmEyDyDHjeHEqlVuzX6Yh9KYF
         CCtdXVu+tTkcKhPJ/yvkgcRPbG12hZuJ4yGwkzwEY7jKpj4Mgxb0jImYgA73OaJbgSy2
         BWSg==
X-Forwarded-Encrypted: i=1; AKwUvByvMISCfEypA9FdZW4/rl9ta7dz75xWq3TCuHBw2QgBmd/HolOE/FLBWAS1XSptFdFOa4q5VsJxXQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ6AolJrUO/tZtsAcJpXsNANWDRinz0MQMzsOLPgrRP7JLQXxa
	eO3LhoSQXZtiZ/qKEuucRl9vGW/2jkWSRgeoJHbEBfztsalNnFu80PJPG/HusG91sLyABUQMjhG
	wfUuEUPgFjZYgJVfa8pbR/qwGXVu6+GcJMIizaCx7KPoCHDrYjYEQjKe4nXxGpeRCA0+yUys=
X-Gm-Gg: AYBFou0CroA9qNe0IJi/QU3KzwCprZgOBy8WLbN+DU0tSMKr59s416eJ+jEyIHErTF0
	AYYiAUOQgzBPzgQTsHA700HtV5qMMlSk0RUgkRtHUgnpl/JEu2buC4NND2CEpc4c4qHzZ7d73Kv
	IwOSz3cmR84QcbMozKCccUzaMkt6RLXwsVEbuN02DNFBIvGutCX1Bov7GjZz7t3e4rsSluZn89W
	KrEXhaMBqpfhF0KEqBW+aYh768bRvNAZodJB1CWtfmkz5sSehNiS0Oc476aHl7tTuxvzxW71ZRS
	lttge8F7lUZLbuUNpwW0r3K7s3ySCPz2ZsAzlgKBCCMgaII9UDFvvShSMyYEnT0IesjLKi550jM
	p3Cb0O2jsdoHzSaABvcI10g==
X-Received: by 2002:a05:6102:509f:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7cc36929107mr1800638137.2.1792500398209;
        Tue, 20 Oct 2026 05:46:38 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7cc36929107mr1800634137.2.1792500397661;
        Tue, 20 Oct 2026 05:46:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4806sm475795366b.44.2026.10.20.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:46:36 -0700 (PDT)
Message-ID: <72b98e95-29b2-4c8e-8afb-986abcd1367e@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:46:33 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
 <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
 <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
 <66d48e1f-7bab-42f3-84db-ce794f2a2a89@oss.qualcomm.com>
 <4ae83db6-768d-447e-b177-3ef5206267f9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ae83db6-768d-447e-b177-3ef5206267f9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cXqjWBR7yCaXAk6ZOW2JMTSxeY-93fyd
X-Proofpoint-ORIG-GUID: cXqjWBR7yCaXAk6ZOW2JMTSxeY-93fyd
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad762af cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=k2Pudi_VgRJteF2nVXcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX6DOoYQYgFnPw
 ohD7Hu69dKHTz/gKTl7r9AmRNUXEpy4UN75j8LRVWRY7aFr69ZskUvJrEInqzoIeoMN8e4C7m49
 NlMbMcgtkFCB+polaRPQcO7+UJRgveP/TLuIPL3TzqSqEGZpA07NUIZ+nz3SoQz8L1uqdWEgttX
 0bvr9ohjOjk/OhsgPscYzJOcYmXtQ6W8GAwEAMGcVtMfCp16Iw02i7V7dV0vaUV6CmAOtETxiE3
 0XW1K7qNUliqAKya4jQpIyx1Dc3o5JmSE00pUs5VBMr0n8Bk91FTXwNMTtg6id+OH6zlId2MKlq
 E0K/I8Zkiw4UTFPL4pa5LJ4Ishx8xYClLpoX0WRS2MOzzLBxrcJAKU+QIIq6lwvwLrQSZDx+7ed
 KXM7aM8osSWfYemZrfjnoGAhXcZF4Qyt9roxtsqipHH2U+6VF1m5ClsrdQ+1HRxE8wdY3RWT4NF
 scWULVb1yAEZDEzvnRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX7mA1kgmav5L3
 b+8rwoG9V2+IfILTGqxrTk/Yqabq9Bl5JTby0woLMXSXeaEr6YR4/6cHr5vYfhRcCmA1XRNFwZI
 Lz4g+C8kckC3L57t2lW65zXjKr9i6vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200050

On 10/3/26 9:50 PM, Gabor Juhos wrote:
> 2026. 10. 01. 18:15 keltezéssel, Konrad Dybcio írta:
>> On 9/24/26 1:33 PM, Gabor Juhos wrote:
>>> Hi Konrad,
>>>
>>> 2026. 09. 23. 15:32 keltezéssel, Konrad Dybcio írta:
>>>> On 9/18/26 11:27 AM, Gabor Juhos wrote:
>>>>> On IPQ5018, the APCS core clock feeds the CPUs. It can use
>>>>> different clocks as its parent, but during system boot it
>>>>> utilizes GPLL0.

[...]

> Maybe this helps to understand the problem.

Yes, it's much clearer now. I think the right solution here could
be to make .sync_state hold off any non-transient disables until
sync_state has completed.

But we're still working on getting any sort of sync_state in the
clk framework:

https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Konrad
