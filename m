Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E5F3A9612
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270123; cv=none; b=YTbB9tqehFzTxJUL+W/LcpSRxJ1kezFr1MZIgKcxviW6tlixKqoHEHfX8vZq97OqdNXOegIuDBz8hbUd26ACfTicxClE7jL8nZYBJqiVh6Sc9IdLkMaCtYJvqBJroALNSSEItVJeyGYrhlhh/fo4PN6WI3KYtjzArsvlVc3LJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270123; c=relaxed/simple;
	bh=HTzxOQsvTQhUcCsxUraREo05f25pj2NDhVCuGHnuvkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzdo1Tz7MGnB0eT+RoAMe3J2nuKAk8kZTQzEhQo8dlbmEnu3f1GFSiPF2k+I+qNzz8PITuaIo9NcYABrySVyfqXtCL2F4gdRZg4ETgH9wIOyCtw3HOzdv5RD/r8xaZVxRLFkf/vI//o6vw09vxn7wBIPNy1kCjQ6czO8EjizLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXPS1eGo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZ6FGW1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXPS1eGo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZ6FGW1G"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2Oh3468342
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKWVOUQr7ioQ6UdvqDDLYUbJfFa0b5Q7RuTgQz4rvh4=; b=iXPS1eGokewEZR4x
	nN/ISNkXcy5A8hR658g/ebyR6TnMm/IQaN9vGoXZn6DZcjRbnMOUYhe6sDHsDVhW
	kBw/FedVkzd0ktE8q4WcjUuozWKQkPoHZYCN1UZhqJrAd7cR2amGxP5mWaw2cENr
	eJueqolaAbPBa+AaUTl/QhNmAt3dBRreCSEx2w87nDr2k6jSIXKFniC32QUr2YDj
	x1G2+QMgVonIM0enWAR673Wa+hoJczIUpFwuLpwEeCyxVYYJ7FJYTYWaL7SS4grx
	v93gjZB9aemC8cfnDnavQFdWP8mS9m/3Y9YW+dE0l94RHbRreiwygaP1Ix2dtsrU
	q/0nAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh0mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:48:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2d5e61f6so26543791cf.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270121; x=1774874921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKWVOUQr7ioQ6UdvqDDLYUbJfFa0b5Q7RuTgQz4rvh4=;
        b=hZ6FGW1G/A8QWmmkDJHGQLpM5qCbVjPeV8m6DuCgK/bliGnTF78yfRLJrsBNlEE9x1
         dI2Ao6MKg2byJWnbaDIRfi7DKbRXz/d43ceFyOe/Hlan0vZLWJiSTOe73q9ufnkG4aEG
         3WGkCokREn6m8tAIfAcfyQsi18rOYadmfggttHekNm27CF43XwROzPBon71KJ9ugGqvO
         vby7FWU9xYrDrUUBTU7CI6UbiQqb7Bjrx6KkTuhQAT4btbbYTxZtgA13GRqLem00ioyz
         42ea66aNIHCwmZT6mQ8ebuIkqsWTNgc8iLFhqMDHSAgBYvohghbXsYMv6P6kKiSCKHQY
         nU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270121; x=1774874921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKWVOUQr7ioQ6UdvqDDLYUbJfFa0b5Q7RuTgQz4rvh4=;
        b=X+23ISJalrUcb1bzqu5S1BYR27mHNp/x9/IArpOSgG2cejPH9O1jmIGcjz/60ywlKp
         Xq4X0ekcNF1p4Fb8eUvzZtrYCSYM96IanjP4B+rfhKI4pRVqYvNyunhWpzrbqErwWAkU
         H7yZR1MJluNFGlid0FzOEhpB7yQuJryKy+rCIV0N9FL2Mhcl88FLmlnBIg5BTVU3XCbE
         2VeTTWwVFNXGOiF0lEklkw6fG2mHJ4c1XgNEywEg8lfEGm0DEQy17CIoMqYqk/i8QTVV
         vhGgC8ZrwYMv3GEnLPlIQKR8a0KuPSZ7kgd0d5Z9ZrGmLibrARHMkWuBLTTEJHlBu77i
         5S0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuE308SVcxR5vbCSdi7VbQN3R4I6iVEtM2ty3JoHE4zbSLGrKryAarJnON1LDLAge7O061HnB/HmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8G3JeY9NaObRY4powmBeQuh1XW/JQTD+6em81VhzUYxG4euKb
	zPdpoNp62hqIuR0yUdiEz6K9aE6hLORR19NngmaneeTz1AkBNrBIxND3HIRadV8X8s0v7oMRA/g
	fs+wzls0aCi/8adfqcxHutTJtvRY4WBHjWoxonJ0ja7JGsEfKvz7ZDZlnxqlb+h4=
X-Gm-Gg: ATEYQzz5HiJlcHQJAiBcjAEUFqfn6SijhCWtj2YL1rlAdL7cQw+Qakt8AR2gQ4ruuPt
	Ot9ejRxaVf1K9bevuupHoV/GGmKWFPNVKUXoRCps3M4C52tumv7MtnGnf6Q4g4QK0CL7uK3YtW2
	Yd3ikiJmabf6lN/eDD/B7GTr1zhmJtRq7jj4FKRO7SfP0najkP0CdAl8V98pcg3M7u6BlNxv66+
	GvAVys5CPL2IBhyQC7pzt5Oqm/9+zOkmcRSmg5hAk60GR1Er9TBpFAvc09AXePc5BZ8GfBLHT9+
	ko+LiR0LTnGmxvaJz8ARVg8ltZPZqDvTgTCIbM3bSqvaNz2EEAsCZfq4fpy8+RcG3R3QZZY6CXt
	stE49cEGiIl+AneruzUcC0xc2CHEGLkzvPvEKHTDAMH4C60hCqGtx15F6Rn5A7+yzP3WTwM8Rqi
	BSeog=
X-Received: by 2002:a05:622a:248:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50b374f73cdmr145336681cf.4.1774270120759;
        Mon, 23 Mar 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:622a:248:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50b374f73cdmr145334321cf.4.1774270120113;
        Mon, 23 Mar 2026 05:48:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984bfdb2f1sm312588866b.19.2026.03.23.05.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:48:39 -0700 (PDT)
Message-ID: <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:48:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Brian Masney <bmasney@redhat.com>, Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        White Lewis <liu224806@gmail.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abRBT4niX2CB9XVR@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dnbouHgYoguVazalK2mpsGX0aHXnafAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfX3GDed6DWHBvd
 zFvDxJAOFoZmw1EBxIBLrdWnDoyeck9ebTXiWS0+u2ioglcMVv9fEyZnB7kAgxIPLjHaZ1ehsar
 n9QZbYcb08v6zk8uJh007dDgl+wzaGY3DDaijuU3knWC1Wtykh9dVX51XM6HQvBEECkui8Fayl9
 Nu0z8BmnHhHptaJK56X8aHx5epdquuX9n+DEuDmGU+ygDuuf56ZILaHg3T1474fILcpzBzrYrpL
 H9fyLWXGs6wALa+ukSHr3X+OII+wQgcZNU/ql/1PAd9FySMofTdOcLuHdOXgNOeTXfsV4eze8Jl
 liR9gkbdhgkWlTKjltboGmYraf/DGTOCebxXOXMWNnxByn+tP5vHFCi9nfF2OXJsMj0du7+fU7h
 Jrw8jTyWEkI9gyGmkmeKpRAIr5ztVUFtg8zdm1P0eJ83Qgmw1XDn5GDQtbLZ/HlvNuQX4TAD/0K
 /gpn9GaHVTL2l/WbllA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c136a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=fZrft0mfdvsrj_7f_QgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: dnbouHgYoguVazalK2mpsGX0aHXnafAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099

On 3/13/26 5:54 PM, Brian Masney wrote:
> Hi Qualcomm Folks,
> 
> On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
>> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
>>> On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
>>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
>>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:

[...]

> Ignore my previous patch set. In my v6 that I just posted, I updated
> clk-divider.c to support the new v2 clk negotiation logic. The
> clk_regmap_div_ops uses this driver, so you shouldn't have to make any
> code changes.
> 
> Anyways, would someone from Qualcomm be willing to test this? The
> procedure is fairly simple:

Unfortunately, I don't think it's easy to get your hands on a 8280
device with DSI.. maybe Pengyu could test that on his tablet/laptop.

Konrad
