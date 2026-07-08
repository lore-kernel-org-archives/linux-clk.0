Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D9438FE3
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509487; cv=none; b=sDMng9CiIVFzfOV0izPMiwEpUdqUYtlhqre/HV8vNzCTU6yl+2D1a4LCz+2MbX0huF8JjNl9dgaMdfx4LhpBNX+bpjMFvprVPI+Leywj/3i3giGzb7exieyNxu8JJYi9wutEj/HN98MPJopn8fCIKcP2L4MIkdJUUT2ariCX8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509487; c=relaxed/simple;
	bh=VSqoLTkrdsdlpLEX58B2cgHXvT+EULR7iyBVMlx56JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hte9C8Jba6RN8tM9Impu9xheKiEMI2WUobkUL8wDzCkfjEGanB9LAanoEvC1caOMIlc4WqiSeq3bdHixMXEzXNHvSPZvSL9/y+32cmmcAsVfC6naKOFYdhBi/J0J7oRgwcVM/Mj9w7Xf6/9mvp2sP0ww5GUt5YeDgiouXFDq0CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oa6LuAmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2YitDI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oa6LuAmU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2YitDI7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889ExP2007705
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 11:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=; b=Oa6LuAmUQsC6WFEB
	RfLonfZyVZFtWtHoQE0KeS6ThFp5BpyhHzpQ366ygWM8wHC3zymwH82hGApdMvxs
	RK4nbPkgiy3Qy8o7qKp+fkG3bn5ZfRzRPfl/27moFOc3Sg0hoRY42A1YEBcbOdMV
	QDzYvsithFGWXhYZ0CV3Xlh/9bYR6qnAu/Nt0rrnwUV9XFS7PLPupqnqSVG/bhtC
	xNktRxkdyWSPsMyQIMQFCvrJ0IZf9j89NFWX+TkjVo0tfO0S4MAawlpq1I0tCkP4
	8FKuKNNbrdcEUIt8s9shnfElyrV55lN6eBuSVnWd9hybqE4MLHWPEEOAHHR9Sv5U
	cMvVzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u1352v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:18:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1218064a91.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509480; x=1784114280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=;
        b=b2YitDI7eJhpqOQOZc9b+XqPJU7pksi5UowOXyGaxeaAKIOqz1eiZBj+ykf/DxPJNj
         fJPc9cdanapA+/yVVAezNy0kh+G0tEoq1x7If8vz+oIYVcecoHJs6vJ/X7XsE+/vIZL5
         mI/7wClgbH+4wqi4DqpCxLwWoZgWuvLJJrOdsRxsqvxPrns7Yj/C3C8+VGHKsyY4BsYU
         1PV1+Vo7lwE2oWeoVcurtmIAyaNnllSudU9beTCZdyiZlUpv6mPKbbQYgmyO+FyRr/We
         9yinmLfkIHqRg5HJlzHdn1nQE9TdeVUR5oZrcZlC80T93R3INcsSeA/68wifduXnFxrb
         EfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509480; x=1784114280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=;
        b=P3cLCIZf178XQekwRtO9cyFwpNtIbvGK50TKZJ5/cOQyiv1cHhmbopg7xA1/Kscd2A
         XLyMHZAQ2z3BG9dY9nDVnVQHcT09i9quVTBPPlKskdzux8gBFfaJP96aaKLFnCpbfG6p
         1hwGZM3dpHN9Cz8vtGCsTZih5QsiV9p3WsEUarl9MyU15uESjhrvtk9yuknVUbYHwspE
         +oHP6eufTn+PsTtS9yhPR6+xuLPul1IeJ2ExQSZaEvlsa2HWftvvE9TARC2agBz+VoyT
         XyCDbIxCZP9t/UAdekp6FF31L7QgT0JsRCr8hYmS3kQGvgWVAQ7c5o5aAsIFo7vPvoGO
         pvoA==
X-Forwarded-Encrypted: i=1; AHgh+RrK9/E4jjylj/kpD1Chym0b/Jv/tfVZMMq3y2OeJ6bVwBG752Nez88zy4u6yMwC9HOVK3DogHn1FyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9tI21dnCOWsppiBuz+UvKf6m5wWri2mdiMWeuHz9BZbbI5Zo
	KSXAD3CYJGrzqqeXmlTbsQnmXJkqf6rtJ1K9MiucAeuK7xCcaHusiL2k4Rxh6aAw8Axekl4Fw/F
	wPtkfxiT7UHUu6odULGssvlt1MQN+CJq9zmUUrRE2AeVxf06xm10JyRFmRWacxXNvzaXzKCs=
X-Gm-Gg: AfdE7cnIvdW0D5xosNnj7+PnNW4NomiXlq6vcvg4e7uAxM5dGVy/ikbDl8taOVmGZ2P
	FEfxLXW5YGLcD/+FfFaOwvixGu5sL1gEUwCO0jUlUW88dbG42Yi93NuxCjj3OK0zQDX7GQLOKVO
	f9n+0khHGg965U7eJquJ1UFiMsjmUWqUMYrxPpykXm7mRVCLByyUzCdjSznaONopWx9i8C5MX/U
	+GiFpawwwnrMXwMt1RBbb3r23G9zxki7c91tbevowr3jAsqpR9P7J5v+1kDk+pRwsRn+24Exl1g
	8oocZCYoSJ0W482GJ6rfX1NX3WMPriEkOg3tlybb8vpr7BzCUSln8vnHJ+48W6aWNyZTgrEN3FL
	6n8To5t6UibRtvvtHR1jv7WPIomrVhz5GT51xWPg=
X-Received: by 2002:a17:90b:3e46:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-3894279a828mr2030943a91.40.1783509480470;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3e46:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-3894279a828mr2030902a91.40.1783509480045;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fccb2sm2576438a91.4.2026.07.08.04.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
Message-ID: <07cb0617-efcc-4828-a590-407e4d3702bf@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:47:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
 <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MPGJul0tKeLEgW18jkEn9D1AprqSivvH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwOSBTYWx0ZWRfX28uvDX9MFEAf
 g7Jpdyqo5dFTMosNwdZ9V0g1pPFqG2d8ZRp+sU0nZQl6g5UnxUWFUZKq2Ly3a8De++wyg2BQM0r
 /4tegqQERtuTOqb1Cj4YwmHlBq0qvB0=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e31e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hnoEmpZtci1S8sv95UQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: MPGJul0tKeLEgW18jkEn9D1AprqSivvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwOSBTYWx0ZWRfX46p1sWBCWwri
 fZTUfie4pLjvcrqo+ra7igVTwG3+AR8lmgOn0dhxC3E/yCT6+Zc50ZZf4hZDEZwaVW3FxqzdRSe
 A7Du2u1qZiOUTmgiRG699BF/psaFyssgYfQwuaxhz2X0MCjigkLBSX6o7RCk/8ha0M60hjHRBDk
 YI14u2LcdonTtVzOQVLiU4pdLQKIcl3Cwl4erOcf3FvAWfrTXoOpaGffxT5cMh3tqbh4Z2paVT3
 JyS1Wh4ec6cilP3Vw52Dh0i/QtqIXGxDBsLgg1kslcY0JWiOemav+0B12GWcl/UEq6t+6pbhtkz
 58GQTplBaYCfHKA28nwXWIzSRbOgXXiN0QwolruroGzuidcYIa/FVEBpwwYBmTfhQWc0rYRa6Mr
 qFMAd6GxLRaxWltFdF1d2FMHxXHdHtg4zJUsNevwhyyixawmP3cxE73QVy0Rpck+BV9z/1i69KZ
 Rf0cMxg7HVKU/iwZGxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080109



On 03-07-2026 12:43 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
>> the critical clocks handling and PLL configurations from probe to the
>> driver_data to align with the latest convention.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>>   	.config = &disp_cc_qcm2290_regmap_config,
>>   	.clks = disp_cc_qcm2290_clocks,
>> @@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>>   	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
>>   	.resets = disp_cc_qcm2290_resets,
>>   	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
>> +	.driver_data = &disp_cc_qcm2290_driver_data,
>>   };
> 
> Now that this clock controller takes a power domain, this needs use_rpm
> = true, or there will be a permanent 'enable' vote
> 

Sure, will add use_rpm = true as a separate patch in next series.

Thanks,
Imran
