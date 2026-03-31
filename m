Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DC3A4F22
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951834; cv=none; b=a2dC/Ti1ffwxMcmvcdGb+t23gTbLLMYKlv39O0/cdFyyv6uOwH+MsSDWCarrxojiHgXbVVDhRnQslRTTN0udqz5OuOIoDEO3x+OPaD/bSMG/nx3kuHFbA1K/tsJ8BRiNwI2hETnpVUGPy3qwvBk/TiVtDK132llE4JNSqdlSgQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951834; c=relaxed/simple;
	bh=6xORAGlWnQ4RaG76LpJ7Jd0JYS05i5nw4QKy2voh05g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kVaInlMGZnW9gjBjrNeioo0dsj2hPxu2n8GbtkLzJtIq/3xpy/8WFVhfuMpqJ+tD3cuM3oT83eiXZ+VVM6qE4rCR24bUcfT6k87FXO+bs47rVAkcp9JSmy0NIItj33346kAOEA1c3LoPbOFvMBeSUY2j4Ri7W9JdmBPMdQGumf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvG+2Bob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+pbuP3F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvG+2Bob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+pbuP3F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8BgHW430862
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=; b=pvG+2BobqzBs0TOi
	aYw1IjEyVY0cM3/yP62t3d/lGzz5EFXojW6zGq/5YmszC80MMcWoOUSioxfD5dHt
	Q+ELIZEJhW++jEtY/uK7d9HYYVwmtKGvbSjiEu5WDLUuiZIRVWkbHYB7PYbNHdQf
	vhnai5uso2JMOmOV1vm/Zb8sh3QbMS+pInOdztpj34dH5Sg+wf6tLfIAsvGvCxke
	vu+2+142yDkoRA4cbkid3zrA9QhRz+z3ccrzDBf7/lC/j+0FgWWFUVqr9sPIPnxj
	aPFTruBp61q6y29mj1/qObXpWUMx1kYpEX9HFfcXVa2dj3cL4b/NtB8Bk78JopGX
	/w2wNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhwdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d1a5661ff1so58451085a.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951831; x=1775556631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
        b=M+pbuP3FbTUDGk3NVqj1v/nzTE3qN3v8n+MjWTBGGWklA754nKMAAstN+I6dSEFq3j
         LVi3HVvqrzZB8rzsE5IFepcFYOkaJoteAkdIb0EJNgQJkYJbEsLL0GltUZFrwiBOtE0U
         F76IBmUIE6M1NMVfBhGV6OnOPf6XD72TXLFwx44VcQkssR5m+G0I/ISvcIxB64pAEnzA
         8/Q3uAH6HL37pzSQKfL4o+1vf7tAWoKo68D+7tSkoAin0FOiU9QXYqb9NQahbAQx4mO0
         ORrDB0VpJL3BeckjdoSZDA0tO4ENSo5ul22iR+Z+n8j4EajEGMbWxEAeWDbXLCga19hI
         rykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951831; x=1775556631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
        b=Ut1uaUM8e80gCsHvmt44k0zSJLNinMeoPbMuEzurs4dqK9GSpIHYpFR2WbHsHVvnva
         BdpwwXvEk/HSpOwKgYgB6dJDM1JaF8FlmXl4aWcOyuc8QCwXCyfIVXBKWQAUhAYMwnZp
         41JNeatKM6bUbRiGS5rdBUPAU8EmDvVbTMDkGk1p+pmQkNJBHlCs1hOVdvanmJBqmVpb
         AjOvAE6zVB6xQ9nimMcQJUW56a0BrtQ8Ys6RCdLeK1tRlEQbV8LG+YDVB8WApmfgYXmG
         2k5OCFHfpu4WPa+TaxG0cYQ0RFeGFBGRKtwYo4Wgy1lYLj0WmsSihWTPUvy368VMdfhY
         diIw==
X-Forwarded-Encrypted: i=1; AJvYcCXzXbPJVRx6/Q8VxxyecK5ln6ZFXaLC56qB+AIdNr6Y+s1/da1suOG/c4uHW+btr7PeGfnVyuTjc+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvz1Q8KGH4HQRyJp1V4sfEXh81MJiSgy4/OyCMt7YCQMCiNnw
	lQ5DpzyZEe3JStp62T/4Jo1sPRh31wLsh4g7K7Ro5i97WDBFwLUHEuChPnsCiKM+NmVkbTkCezo
	GMF5GNQJLJ1aUJocu8x2/BpVz2Spc4IwonOOlizO8dhp03mCS8ou6A7KHZHu2OxM=
X-Gm-Gg: ATEYQzzaYsm4qTT3y1v3zyOagkULPF8VTozr3LYa+LZR977AOFVeS9a5Xs1yjrrx2Ta
	Tmror/j88KDn+tCnpoz9hKDqPYbedylEbv4320eyF5tJ5jXUz2HjhTQUMxYmVQrLLxR9i9G0jcq
	X93fqMFEgtA5nZH4zAaWAsfnZ9mGo791eJFfu1qQGZ/HWZS3NrC89svp6g8rDI72W0yPQLYcufv
	pC0sP47UiURtpi20eSTZDgIzIynshrjwewC0JrwECkDqBJwDfCaLBE5fbuPLZgCCfDCHUKdG8wv
	vAeGbSpsjWxn87pBU4ssW4KIJOXRd6hNC0M2D5za4ftxR0m8xVCRYdjbTkDkSGZHolEctaPNzk5
	Zzd5y4WP/hoC1zY+PnmdoDM1pEulspnpxB+IteKn8NgKZmRzBZczC7I0oqknRX3yzaKO34vCWMr
	t61hY=
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr1476137785a.8.1774951831223;
        Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr1476134685a.8.1774951830813;
        Tue, 31 Mar 2026 03:10:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7276304fsm3447998a12.2.2026.03.31.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:10:29 -0700 (PDT)
Message-ID: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:10:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb9d97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fArkNfqvCtmK_1YDpdcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX3k4ngnuVtdAL
 hnpLKunx+aE4n4BJyK2wI7xHWFT+EUs6wl8tPWEENe77eBfI7solqcvglTUWdod5TJAiW3qKx7M
 k5HyYhtm7kyysG77K6YbmfnO4z7A9wPite5J1Nc+BANtP62RzvG2XpfAJGKYvIqt7JI0bm49FPQ
 IQ8ttMwiYjyLDCm4NAUVVQdVS7Miuqxui+6/WJ75PrpC38lqoG+YOZiNDmigVajZqj1dxwuFDw1
 YQielp236yY91H2/qlZhK0obaTGWIU9ECgIBgr1CDEp3kA3in4OG9+wo1xScYeuqM2jl8hcJuUP
 /pGo1Nxx9pcmLeM/kAFlVit1D2zb9+yJr0TvBwQEgSuT20iwlwyEm4kRvjskiu6PeVCh2Zm3/eL
 r3EGGLw6tZybp9mjslxdtTPt39ZaNou86m2k5KvHKqOb4ib6w8dHwHhTFHd/egLRcg5L0nf6PJv
 I14Ka0NsoBaivFgF13g==
X-Proofpoint-GUID: cAa4nfDamjh4GNBkk4hagrl8eXGJmtwb
X-Proofpoint-ORIG-GUID: cAa4nfDamjh4GNBkk4hagrl8eXGJmtwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310097

On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 11:33, Konrad Dybcio wrote:
>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>> and is not modified: neither by the driver defining it nor by common.c
>>> code using it.
>>>
>>> Make it const for code safety and code readability.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>  	size_t num_icc_hws;
>>>  	unsigned int icc_first_node_id;
>>>  	bool use_rpm;
>>> -	struct qcom_cc_driver_data *driver_data;
>>> +	const struct qcom_cc_driver_data *driver_data;
>>
>> This can be a const ptr to const data, even
> 
> None of other elements in 'qcom_cc_desc' is const pointer, even though
> they also could. If doing this change, let's make it consistent - so
> shall all of them be const?

I thought about it, but then it turns out that videocc-sm8550.c has:

video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs

So we'd have to duplicate the entire struct

Konrad
