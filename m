Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4483290C3
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237847; cv=none; b=VClZ3zMYNx4fIjtZtY+BlkWKIYbg5pXYvrhuD0Sr/R9Hjy+59KPUkCwDmPvm7lQMOgthphv26Bsj1ghZwyZQlfpL8cTeJhl762TbFqSGdYBWUjH+DVYjhod92vII9TInOfc82WR+pMnICtmGwu/WMDT8QjkxVJF+rtsZilqbC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237847; c=relaxed/simple;
	bh=t3UEkdbU94HVj5nKi8Cl4Rw7eUN1E66WhXCwZhA9aww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G95bowEzRHW6/He3UydbQjdPq7KYAvnhZE0Yl1W61NF+2LME/3XVPPr6p6ektu7L/3RsDzuyRr6YMUQOzZ+ZNX7oRQL6sAPV6x7fER0mc4yt1YPg41Jboto1TB0fhxWgCBI3FE+wGyUv2+0+mBcl1LOSctaKrT7flH/SxbEbDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCUWnA8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akXmvyBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCUWnA8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akXmvyBv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489KE7F2771025
	for <linux-clk@vger.kernel.org>; Fri, 8 May 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=; b=RCUWnA8A0Dkc3BhJ
	a0N5CzTaw8w/EP0tJAxJlGPPrWwnM/aQuUGHWXAyqqlaS01UKiJje03sOlFv+IJw
	fjmIqqMqYSUIf4GJ+cOb6FZNUgZu7kNQuOi5bpxIuuJaHDt34PN96IyHIA2dS4S5
	l9k0OXs6frvBS5KmMmb88C3q1YNTH/yqIF7y8KrvCrTMERYomiBcD7HXu8lSfRQx
	xb5hNCMLDR4qf4wCa/tO6Rr9lfwFz6UkduS//i/P69dT5q1ZgzzdRrXheIljKTsX
	ylMi3cl1+raD6AvWyjnmNn3OIedqM6X6PKjZVUHxUR529uy7Z015Gdfnrq7Z3ZOf
	qV2G8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kbf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 10:57:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9568c79b893so113292241.1
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 03:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237845; x=1778842645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=akXmvyBvNPID2apr3Vr2cC5tN9wEqlKkrnNLpX4QmHkqXrcfyHnQYNf9TbOPy0qDJE
         J2nk4wIoseN7armGPh4A2yq8YzV9bw9Zga4ygAArZJrACdYjyDnlgA0f7VSHxXGQXRs8
         wf2qS6HU57Avr4fms90ic30Hg9aqkDE9TyDucdzWHbnYdL176uec7iXVJFwZYueU0WxX
         NtczMEwJ78cVponuUhg0rO0OJMRyaKNQ11HVvVrIkydcBEJcYvCcJvvVKX2chyhDLJ2Q
         JpeonsbtKFkFkdePHtrvugqDmEp7xOE8UEwC8tYl6lOyGHAuNEEMi+2vUkH32x0n542Z
         3aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237845; x=1778842645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=gzYP/QXYIJunx/mJy8qkzA2dbuOd3ldWxHW2nX8aIuaGghjorA6OCAJMBUzoEvAkDs
         8x6Mf3RMZrZmMrZch2uRNk5C8v0wK7Sb1om6aj+QikgRRe6FFWPfKV6D6r6ubB3xYL/A
         8JCaqYgelcwuejjbAAyWffZ2cDwm80FdHN3TLjF4SiU1Taqqm5QEK1fWAzFhK3cxYnQ+
         2jOfjfQJmr314oyfNyXqgxVBR2Yd1yLa/0Z/yFZkk3Yz44rKebCnJVqOi2CLdc4jH9ax
         PvOTLcrASYj8+rdSoXtrxtu5oT0Jqp44YgrY/GfACYjk4GcrTMKrJJ0Rdi06wStj+yGy
         a2+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+r6uReozBwM2EgxCOZjB3YgUq88G3AEtt0AHZbDDaaxBgn5Uau+140X7bpF4bDmtOSi0uhlNVOn4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhM6gNIxj7SfKGWyFC1vh793UVDXYFUOLGFsYi9EGPXJmNTsL4
	YLFTMgQMz9bAgLIjd0VDhkH/kdjNHImCJDT/VB9RMJNNaPR8iFbZI5u5smzIQm49FnAwTpdxJgJ
	LP+tsEhpRuZ2USp6eCt1343CUEfby0fdU5A+UBcPZOtRSXsun94uLQs4yyrZe8vM=
X-Gm-Gg: Acq92OEY3aznnvH6ePvuJ+W17l1lnpNHWS4w+HjXj7Uackxhjt3Vt/ON34kpOrMsAsW
	8Yj2Wu8KI0mvjoXtgEh3kWu4pm/6AfpJDmnDVyzSI2r7QTPlQtilnNHRW0sQAjA4m/+EQ9j1zNF
	Su1rjf5STXQeX3zEdEEK3BFNJcGM6ErHSJI7eUF93k6ixi4RsHKgIwp9aD9KEZjmELu7DmCFO38
	RYoTA7C/xk8JYwtwq9Sh+JjFq9IS5EHFJQ5LlH6fMWX8l83heQhZNqjqIBKP2nuFLyhvlC7GGxT
	q/SXC7FPlTeE5FcZ6sWTctvbCh1SHt5zF8EGpkV4egi1Ph8esQuyQf5nOPkXTbYQEValpgObngT
	C0y3UTx59ECmUZ9NAet6wgBENCJUjAJ5x3VidEhjkc/IlxNYtJO9WXIXMnCODThWTW5qLDqUDW1
	p+kd0=
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37445137.0.1778237844550;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37436137.0.1778237844149;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359db2sm65177566b.49.2026.05.08.03.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:57:23 -0700 (PDT)
Message-ID: <faeb57d4-5260-4d62-85c3-de51d6623195@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdc195 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: vEZEiaLdwTkbbs6k0Xrtf9i329klL9mf
X-Proofpoint-ORIG-GUID: vEZEiaLdwTkbbs6k0Xrtf9i329klL9mf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfX2tKHCsyWcM37
 GmVXxwD5O9GRwzJdUft7aBJv1BF93jWNbhGfOz9mavhV2dt/V1aeOLQXpbmIlJTDsUM027r70xU
 jsnrXPFabo1FFZ4KN7efCG7KPs/EpE0gMGe7GF9G7DJXCOpnxqlhxx5MPfxkpxRMsyi9irXM4oe
 lbuzwuMIQ2t06mQo3IhZTwSYF05jPG0w9VxY5NF5/nu5g3TuS/himDm/jCu4u1QIsE94od1bJ95
 aYmu0IVP+y0IN33Tih1wqkClzhxaWXfeUYshlPCzTIrnNvrpAJg7I4PX9ZxNjAVQ8bd77zxdGcw
 gEkgo8bDbw4uks+XdHbHKh0rUh71rnduBdKuIHlnASnhGbx93ZUxDEmf06o5BbMp6QxAbCbpD0e
 n0R9FHeB3LQdNYlWEj4qFeiRV/C2WOODkU2Ba55qk2DqSO+vWBFO9hop+HMPVR0T9EQDFl5dtBo
 4b+SmOvm6Jbms4Fs36g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
