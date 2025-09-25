Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8883274B5C
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758775739; cv=none; b=gMSIhgwmVTkYFKEd1W3Zcip8a2gxkn5t4HJD4pvDgz3ivKuZXl5WBikjrR+44qXaYzvGx2hnDBDfgjy0DgsSjRFaKGRLF7NpI6Cm48Opp1c+StiyXwfzMpNW1YoNGr24XvvJQ9Ur/9eBuYI3BkI/85SoN9ktmv/grFZ1ZLNu3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758775739; c=relaxed/simple;
	bh=s9FpdGOs8PnBwkz48+q+M2ShltlanLs7DUrxUEIDWIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0Q9XkIw3yj9OpHt5MnVx+Og+MW6gaOAMEt1pIJqo5q2Us1JSbbKm916N3QrqLss5gFn4zMGnZcA+pEj9b7hIHBjrfoH3KmLQxFTzSeQ1g/XAEsuCA3iMbhM9fOOA28FRv6C7HY3iSCuz9Kk8f+X4QnH3JThePVyKnuaCbvcv1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Syk9qAre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Syk9qAre"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0OQSo025079
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 04:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LU6IeO1zXtpAmB/Z0x5SiX+9EHhyKCQGpK7EzCxiG0=; b=Syk9qAreokVlRZKo
	f7SjZ90/wbmBegbK475fhrZj1xu1iSzzmRMwHeECsRXm9vTryOSsxm8IdUB8+ch0
	rX+fk5OcxoqXlGAW+T0i450T4fE4bU9pTEtZG9NJzhfu8IdsFoxOmkRwTbBglp/t
	los4DfwvKdK0vP7hftLGeT1ifr8riiANeSradJalQX0kGhd57F71CZre8Bl+dwwH
	A1UxZ+hdv4uQQ9Nyqait8AG+Skq7eGt/3MctSsD4KK5L6ebj/xbqCaSiGMCiqQu7
	+6XbOVv8qwV65aTCH3WdkGd1IefRGa3miTHp3kYW83AqtDNMMod6Ewjqlx1RvzZg
	ktOjDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyey3tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 04:48:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso498840a91.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 21:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758775736; x=1759380536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LU6IeO1zXtpAmB/Z0x5SiX+9EHhyKCQGpK7EzCxiG0=;
        b=S4sLQ1whflp6cXJePPVdT7AT27zJwa50frtCDTCMBl9a9OMRN8Fae0BdDj7aCu9jgM
         pfnfbXxRrXgIGuopOh9Ee9bK1XePnOUQbNdNLdiuFsKtUmohtMsGQehHabVz6rNpUxxX
         BGu0A0jRJtGhnxGzPozD01QQ3Kr6y7J0y2TO3rywiq1Ozi6jcRYTAZjCe1+pKG7hyDrp
         J6jnUXN8esDrLlbI4ahs1XrPpUsxRlT8NbZYcXWp1gWkYz3TNZPz/ZYLH+SK1wolIvmb
         4lwAYBZgUeme9RdeEn/MZL9S0SwTWNZlQGimeQO7fbsMGtT1TV02RmlWReCK1sNjxpql
         4+ow==
X-Forwarded-Encrypted: i=1; AJvYcCUGLAvsmG1w2Qi5kNd3iPzHz/ozxZvPWVQtGBvXjXzCTRmwIsW722y4WWj6NwgKNOHPwWw+r7lELPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMhiWl3Kn3kSbUd/wwUESz0RFr671okPSGSBHgufqkwzQOOuy
	+C9c1u2woUx/WEKpYpHmWbBnFP/okSQozQcCIcaO2P2FKGx7nmyYSLPopTd1xDaVWOPrJAusAQi
	ZBCabHYZpxJ2q/GW59XjoVFrbON+9r+u+udFY9dohxEL95WwqLF7yyY+TQbKzaJA=
X-Gm-Gg: ASbGncvLGoIuxaCkhX5ZgZXDKqCWUobuyEqdhQC+m5rHbE84QhhU2/3mdn9nWPCJDfD
	9lcHavFfDJQ3vRKT8xRwUWXEEMQOgd7dClmA6+KY5VqR0+tG4F3V0ov6/IYJNQLTTZS/5Nt9b2i
	43u3O3hyoONRI1Mk2T9nuN8Y6uNk5MQdb0nxrp5LytDrN3o3+Wo+yjMYwvvTKaV/jT+4kXBU2LZ
	Ygyl2avBXW/aOhXzggLy3TdJ3DMt+HqwK8ch+Upgnasl0G1aubw+TtNEZcJD14HZ9LGssg46l6Z
	eTPySXYAmOWv0HH0ecNfCybUoL9bpS6fdaG/BAFnpoaXs+S/qUS5rIq9DMQb0CofVL4=
X-Received: by 2002:a17:90b:38ce:b0:327:83e1:5bf with SMTP id 98e67ed59e1d1-3342a2da541mr1678277a91.28.1758775736015;
        Wed, 24 Sep 2025 21:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVWgEtqOn5boD43PWaFWdVBdM9sKcuzskhvCnQ25tJGjyIKpXs4nP0mBgSM4AQTvBtl8bvJA==
X-Received: by 2002:a17:90b:38ce:b0:327:83e1:5bf with SMTP id 98e67ed59e1d1-3342a2da541mr1678246a91.28.1758775735495;
        Wed, 24 Sep 2025 21:48:55 -0700 (PDT)
Received: from [10.217.216.93] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53c9862sm899243a12.14.2025.09.24.21.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 21:48:55 -0700 (PDT)
Message-ID: <f255d360-64b2-4880-a069-81c73095577f@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 10:18:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the halt check flags for pipe
 clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
 <9455818f-3f6f-4985-8389-fccc7852b569@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9455818f-3f6f-4985-8389-fccc7852b569@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YQ74hWXjjg53BjaXZYqE4nDxMcEo5lAI
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4c9b8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=muTqSOK3q4JbPMG3l9AA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX3I84qTK+xTup
 KiVeG9QEoJSei8NnTFlyr7cf9MFRSMf0KOR7PFCwTgdQaHwp6U1lupUV1faYU+MUnV4ufcJEOMS
 ftBkbDvHQooO6ucwxu1tL++fCRMRyUJAHmadw63aW21vKGM+EAmSgP8bCZ8v0115s+TLGjmDF5C
 T25fMCl3IcWoLkFTkXFlxWQuk4AZawOGNsdAW0JhdZn0BIbihhxnvMsroYKfataq54vy9Ts8t3l
 4rMITa/yqve5vaL6Of8dHRrS6nWwbB8sxx1ebE4LaJXGfL7Wi8X0MEXWaYBKLmbroNys/IKF/cx
 rqIS8clvSNeFOm6pTJ4ReoL8O39izqIhHov+FnkoCznIK8GB41kRyta7B1mSG0pHFyb+x6kvxxv
 KrRqIavO
X-Proofpoint-ORIG-GUID: YQ74hWXjjg53BjaXZYqE4nDxMcEo5lAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004



On 9/24/2025 2:55 PM, Konrad Dybcio wrote:
> On 9/24/25 9:17 AM, Taniya Das wrote:
>> The pipe clocks for PCIE and USB are externally sourced and the should
>> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
>> to disable polling for these clocks.
> 
> "This helps avoid xxx is stuck at 'off' warnings, which are benign,
> since all consumers of the PHYs must initialize a given instance before
> performing any operations"
> 

Thanks Konrad, will update the commit message.

>>
>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> The patch subject must say 'gcc-glymur: instead of just 'gcc:'

Missed the SoC name.

> 
> Otherwise LGTM, I've been carrying a similar fix on x1e, as it
> (obviously) turned out to be necessary for the usecase
> 
> With that fixed:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
Thanks,
Taniya Das

