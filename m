Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80F25A2A7
	for <linux-clk@vger.kernel.org>; Mon,  5 May 2025 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451371; cv=none; b=t9qpdB4q5bOAwBRMTHRsnViMjsZK/T9GFw0LL67CHqbFEitvjRBKdE1XilwNNUra4iMPx7H7FWvOy4t+Uxh9Q+gYdGPLX/6MazwqynEo43ggyYzgGwET6uzARqsG/v/QpdIHiq+mVvoN2su04WEsmDMCht/Q09ucSQ7SuvYxVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451371; c=relaxed/simple;
	bh=6b6UvFMmR5hwpyVwUTZJ+FnF2O3Be9wTrs/DC2KR41g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoSqC1YiMU0ejYA1Q58WADARXYSoz0mbBKlIeKXXF+IPgXKR8rSzRdaBGKuiFS+y6LnYglS58cbbHwSsYXHt/dYuFRQaby+VEzqM14ZnKoM6nJeDVxXYzC2/kF0Kd5AxopLFVdUjwqdzoTn3y8+EF+1qf75/+75HXxGjr/RQMZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4LYVcqN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4LYVcqN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Bh0xY017719
	for <linux-clk@vger.kernel.org>; Mon, 5 May 2025 13:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipfJB44vaRrzzYNTr2RsUlxdMWhli5auraPTR3Cgev4=; b=Z4LYVcqNuIgKiZuC
	gpqHd1nOQkIWqdsTCdDD/SRC6CD9vxFK8GqqyRxpK/1cAngXBYt9yP4y7PIgXc19
	hF1Ldglx+Z/jdO2/LB2crwfHJw4x5e529cpCTdBfOZekjg71Pw6NT1WrK7OmKtaH
	6DklgYiPkci+Uh9MExRHI0K4DQ85vUWKuLdyhkFSmnZ+KFeKo1nmNcM28pbXUvo2
	WUH45GXdRZeGPGD2hYYmXLVEpCRbRB+NpVs3lHvWHMcV5w++CTAEgeymmcJ9x7ZN
	vvPNUzvrw7svlrwBCOCsXG5lc1MXBVpXsRYtpFKWgJWN13j9t2z+lyp6g6C6MIKP
	2YDaZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9c3uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 13:22:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae537a9d6so10643081cf.3
        for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 06:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746451367; x=1747056167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfJB44vaRrzzYNTr2RsUlxdMWhli5auraPTR3Cgev4=;
        b=U8aUEC80s72RWkpwGZC+37bCrDf0vJZJhzyYRbZrlTZY9vtgxhV9LcuW2mJCvjJk9T
         hL9fF3Or5wgh4ejB160mW8/IB8ztimy7JEBNkdqkil/nHGR+ztWR4++DXbqh+VKFF6k0
         8Nu7DTlDg3cEPVe3OJCI5JSGnxXXGwFkZ41MBexPJQZiLBzyn9chr2WnItnSj0XOoOP3
         p156uAVBfm+Y3tvhcL87ZUqkFMYSBXGO8n20YQX7TrDI2aR6hn7yG+c5JPRWOBpabYbi
         PsaYSF/SEdZVy+cMtElC4YCaDWqBPTsIQByCI2M8Vd+yESpMstCqfsRSXSr8H5wIOfiU
         FbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXneyF+3LAQUDJnBn80buNeQPd+Ehok+EcOgOUtdS5d6l+RK2d6CkerN4OC//TRclRXhz4wT+xr1qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1AJMIDVoao6z6+SeiJBjsnPODvlcOoLTsiNA3rK3CDoVnc9CO
	qV9pZVbKtlcTvzOYGxjK1w8hazdm+rBSCwRspX6aQSklRNUSKYfOHBtxfaVnXe//wEK++NZtCD0
	irQKgL87IlMosEJhw6p6Q9mxSKoJHACE05XG7T7MGNsZQko3fyQ4AklaqYNE=
X-Gm-Gg: ASbGncubQm9FCXo1Y8vKE12OsctInhpA7NCO16eRY7F/y6L0aYpHHKq08pty7UJc5Kg
	HzxsuibUY2lqhsz+yJoklaucqco41Aq6IoY+uMclPUIjU/skX4/mtmyiL5Lcj3E+6NyKop0IUkh
	DjI5NYtO4UQsjqN7vgZGbReORV4++cKzf72E2eXgeVMSsBfzCwYQNWRc/DSQaK/rf+TTRLk5OVU
	N5+R5yO2LfaQI7Bt1kZK4LeKtGXzpeAsekYp7/FPFvUKu88Fs7mts6dYOyY20bnyZ9tgGspObTE
	Z38HIqvGMfVnLetXTZUdsoY69igmAPWjUvwGHwwsEOUrZcG2FVOtKCjbJtH9cXRBGVY=
X-Received: by 2002:ac8:5996:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-48c30d83ddcmr76442131cf.2.1746451367443;
        Mon, 05 May 2025 06:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjFC3fECabwesq4x5Fiy2V1yv92KY/9fO0f8AU4OsYx1OHQ7BrNcRSdkmpG2hw9MT3iHS01A==
X-Received: by 2002:ac8:5996:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-48c30d83ddcmr76441901cf.2.1746451367042;
        Mon, 05 May 2025 06:22:47 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ac90sm494506966b.150.2025.05.05.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:22:46 -0700 (PDT)
Message-ID: <1cd1d97f-a6f1-43e6-8451-b9433db93c16@oss.qualcomm.com>
Date: Mon, 5 May 2025 15:22:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>
 <20250502-singing-hypersonic-snail-bef73a@kuoka>
 <cbca1b2f-0608-4bd3-b1fb-7f338d347b5e@quicinc.com>
 <35662ebc-d975-4891-8cbb-1ba3c324f504@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <35662ebc-d975-4891-8cbb-1ba3c324f504@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyOSBTYWx0ZWRfX8pX9VMnhsRiX
 AB0uyBN7X9pJUdGpIjoFNysnR4RoaC1Th+p6a+nk6Qp6VmvfUAUEClYTAMtqALNlRU69s6WC275
 0kAxuRb4IIXA4LVrdyQZT2pLiAWDuNokHZr0vc3wOf6xD2RReUUWpe5RbAbp+DfJZoyNT2qlA2r
 cBxRWH3mj8gQvfvIa+1/4XHF2fBll5w17X414ZIgKr+0aQ/4uZffSrlsQS9p4jfmgA15LOOcsVP
 l8LreGC5DzPgh8oF0ScDuJbwLcAIUeKTYZvmIZM+qLl8k9LFW6MXlydRpCAQflnB8ty4qBcUJkm
 yQsYBkc41ZE+MM4jgTQxc5L5/6AagUxgCkXOQxjRQmKglCvw0EISGtVN0PtgSfu4Z+dclcPfOL8
 va6N0z6JNePF5OA2b5NbkE50cqqql4ZkQFJoFVAVBT/XOK52nBpse75WsqMx5XEyo48YS2b2
X-Proofpoint-ORIG-GUID: WR3ZwNHKhw_l1cIaZqKeNCACmg9Bto4H
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6818bba8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=bJQp2htD3s1xF4Ub2coA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: WR3ZwNHKhw_l1cIaZqKeNCACmg9Bto4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=871 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050129

On 5/5/25 11:46 AM, Krzysztof Kozlowski wrote:
> On 05/05/2025 11:43, Satya Priya Kakitapalli wrote:
>>
>> On 5/2/2025 12:15 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Apr 30, 2025 at 04:08:55PM GMT, Satya Priya Kakitapalli wrote:
>>>> Add all the missing clock bindings for gcc-sc8180x.
>>>>
>>>> Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
>>>> Cc: stable@vger.kernel.org
>>> What sort of bug is being fixed here? This needs to be clearly expressed
>>> in commit msg - bug or observable issue.
>>
>>
>> The multi-media AHB clocks are needed to create HW dependency in the 
>> multimedia CC dt blocks and avoid any issues. They were not defined in 
>> the initial bindings.
>>
>> Sure, I'll add the details in the commit text.
> 
> I don't understand what is the bug here. You just described missing feature.

i.e. this patch is fine, but the fixes tag doesn't apply, as it doesn't
really fix anything on its own

Konrad
