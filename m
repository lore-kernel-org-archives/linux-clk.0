Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121644CAD7
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841508; cv=none; b=VccFsx5Yk0HDrR2i8qNqOkixIbpSHNQ1vnF1l6HdYE6EetbrjVg/67Aw6repTZiynihoIbd1Pm1bWL+PeqsTWg0U2M/vYyOEXM1ogsXxS+n0R0ZuTiww0UybdaPM5Mla1SazRYcoLSfCHKfmutPz5SkkybIVxBS4P66HR6U7isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841508; c=relaxed/simple;
	bh=ub7Agyk2MN9SFWlFYDcRkZ/1Q0WeVvZGg/cobW/RJVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUjMZjoTP7lkm7voJ3gNZI1T0UQBCxkaGL7WeUCRyj96OmOktPZ3FuZzfckVGsCQfg80sLZzcYMVg4LkTbxZy2OJ4/n4AC9xDSOmNb4bUdb8axEeIKgNb06aH1s3mByLvPKJx+csPBDNL7Lgl4TKmGDPjdjZllQD1WB91QU4eXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zg8KsDCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/BtEWgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zg8KsDCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/BtEWgI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAbCqc3512973
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 10:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=; b=Zg8KsDCHsgc2Ll3p
	u6dhYMciCWG7U55oZdtxE9On9pJ8XS+1sBV2jdXm8C3KX6hMgAjrzIkRnsX2qZ1K
	W9vMVFOv/c66yfnIlpQ1884ZCNp3zSb5+egy724crIhzDalVujg0Bj5ddfI3G5Ql
	W7+MRuVxfDWMy5QmwXS7psVys3ApRSxH0dsc4aNN54ajqVNBAZqEvAlVYvtkP4fz
	uUkZlcKLrGfC/GjhX3ZjXElz0wwoibEDDnbfbaunGZi5iexE0gxoYZhdHdDzmxjn
	tlIsCmhQa5/eRnsv3TMQ0+GsoAePCueB34H6iZp+Vu1Y+lcYebdNE2975ohxT0bd
	P010Ug==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vava7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 10:38:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9589688edfdso235420241.0
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841504; x=1779446304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=;
        b=S/BtEWgIbJ0lYAgf6f8x/9rWLeLy9d18rEfHdfzONfpcEQ7F0a1X02ELfBTHrODLZ1
         UF5MVnfXZ1v8bHQqRs4lgss1cyN/7BBQcJRkPVeVmKLY59LL033Q2DhUOhahjOqI1Qz3
         hDuQcjuokvvsx6AanXgLXufEvW7WACu1e8gMjDGowR0Sa8HJ8w2ApUjF7r4WQEliRFc0
         4vVq/yeMc0v0adeC2xrczo9/ECiWJJITTcWDUqOK7wOoOdF4XT/RxzNqdn+BQVz+hlOx
         YQ2N5kxBJ1/8sX8Nk2mw66ChCE4fT8wooEpdjnqT3WwE3609qRMO1WfTjmLpDTL7HSMH
         g7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841504; x=1779446304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3kAKDqlM10u4dTeLp+aryNvJ1NxB6rqncZZAhk9DDs=;
        b=OhavqdBLPsC3BR1edlCRTeMOXdKgdkXUHTQEFBSWbYjKlal4+3DLNvuCHKZe8jEmo+
         Aiew3gL6lK0/IShcD7EjOFBz23No7bGkdF9B2j5GohDxFdnwq/w26wbkS87jCvQ9CO+f
         hyF7Zlcf5Lmnp59hQU31ZqtPzU8tWRv2XAo++Z2rxT5+ZpRADifHNuGdXd/3p+bnbkue
         YDnmIB43Y1QYok40qEFnIy21nY+rQ6gwNJmuCApCaHtmPnoaa4kflYnaJl7Ga2upVMpa
         9jzDoYFS4u5uAbRqllZC5EJZNQIUufrguDFTG7cITC8TDc8yMrXrFPxIaNuK5LpE0VPe
         w1gQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5kfNq/XeCk+WYNa/wqgb2+dlU9hpiUV9yann91ekRAtM8CovE7K0Gp75oX/3/B+Q8sJsgNW0uVis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JehFSXp7CcHYctKhlDS2z9vI7jWjQbgHTjk6+QQEz7LorYV1
	/2FHQOCfhLaj7WcvQTzXcwhuQ0y/LJX54QZqRonTELtNyOAsdBmXR3YVjTCd+oPoRIrTkGad6PR
	3ZYeV2yFQn7+7D4XPMU5lJR2LWTJsxljSTKHoBbOo3DOUNdga52DThUBUj44k624=
X-Gm-Gg: Acq92OHjQpQuKEq75JVo/plYbklb0kTaqrj+Pcyvy9gHim/ky0J0r8M/LYN9UOG6YTZ
	sA4GKIOzXpYkc7rHhVAjLeOi77wxghA+8Agdbs8Mqealu+AWMnlI36kfzbB7gAGqxkUbk7WvlJ8
	BO/1WMD9ceaz+bge/uOutCAk/L6QUTI5/MWn7asOCla7y/OiO1gsndtOBzTY+JlBvMRpLcNUf/q
	YKa14W7T2UvBD31xqILOx3z9ITXArPwAeNS970jeYil7c0KyBNQ6mjojHKKTHK5qub8mqV7MDNY
	wWUTMxobWmzAGFKw+pK8LS1cpi03+UqLARkF5cm63XNIStS4rJy/a6EYfR0AQBcphVhoeyJ3w1p
	NDqbKTuuNliKQCTPvI4+RnOejYdx9UUMT9gK/A7xF8OTnTDqpEy1eoI9Gv4MNnfJR3eX2cD+32b
	ltNbw=
X-Received: by 2002:a05:6102:a1c:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-63a3a377335mr440982137.0.1778841504165;
        Fri, 15 May 2026 03:38:24 -0700 (PDT)
X-Received: by 2002:a05:6102:a1c:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-63a3a377335mr440970137.0.1778841503703;
        Fri, 15 May 2026 03:38:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f1dsm210306866b.31.2026.05.15.03.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:38:22 -0700 (PDT)
Message-ID: <f95fb4f1-e763-4ac6-9cfc-e3af1e14df40@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:38:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
 <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNyBTYWx0ZWRfX0lLCeZUpa1wC
 tKEZHFs019qkX48TyjDtt7rIaiVza0x2DopWAX945PWrcRKtbU/bKxqCA0VtUdsG6AysnrCHwKv
 gc3CSvc5tJPSk5jrqLeO2L9GDlar0M1l9mvsXmFcCgNw0jlbK/6YWm0Hn9tcYR1d0Y6wwmUu+i7
 vLVrNoAnhhrk0r5Xq6Bt9Tf24RoVP1Vp/iFCDdL5fUvlSFqit2dGhh1duLbHX0EAhIwpAuiLAbm
 Mr12FVlNyCNZGOU5heT5FkjFGjD30rrLMZANLqcym2ghwYefDULMJWVve3ObOgwcKn2Cd7Pzjdg
 iOVWpXMCk93DvdJTAqQoafUVg47Ni8G8b0yfnq9ZyXEkt1rkTTavHGN2vKrtG0EK/mmHaMq8A+N
 eEHvYCbs6Fk8ubodL6NoXSPqLZfquemhqTS4UcBbVwoQkh+mjsCpsRFAjMiDuSUBLcCFEsSc6Be
 AqzOhHD/a6ZJaP1Fwmw==
X-Proofpoint-GUID: fZiz4_OsbnldJFkbjX7UHUorZfqQgDzt
X-Proofpoint-ORIG-GUID: fZiz4_OsbnldJFkbjX7UHUorZfqQgDzt
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06f7a0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150107

On 5/8/26 6:51 AM, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
