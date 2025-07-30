Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CFF507
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753864711; cv=none; b=NQl4od5DZBF4weuirnKOkSvBGoDETgfRGCk01pOSX0Zs4gi8gzdm6XAfl/5wunk8QnafoiPxwf+9FLqi/lHOscAA9h+nGlESN+3qob5G5qzQMG63GJ8AV+vRx84bFY6jW/0U6740wBEJGiMts+db1YYohhf5miXTn7t0s+sbsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753864711; c=relaxed/simple;
	bh=Q6l3IpqKbOqB7OSeobIhjRaEzAZYWHwA59c2iSf50F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5flxi6PcX4s6BR371vpuTWZKxFjL5e6jQiiE7AjaLrYdpaAziHcOJzr2KBaf4P1aQxbBnbcyeAUafIYobTZkMPko+laJuRRoXbRoLP0qdaUlyg01i5XnA8JFDDsKmZl3oG2xngwO9K2Rrst9iJzHIA93Ffkl6jpwAe5ZeKeKWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeCycuwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeCycuwz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6kPLJ017601
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iI/nNXs+f9KkWZ1yxsWzsQrCvk0IJuyKWclGYTpMJOM=; b=HeCycuwz3XWsPdv8
	Akbyi5AOL1FtXNcdQTs1bdp0TEP5J7OJ6tyxBOlHhZwSrbD8GuAQwc8n9+BACdGZ
	fMaULoIxcbDVH+tRz9uIcT5bDCJ9hEInhxDUQEBh0FRqA1mOohlKiJSIMEMm0lst
	uKJ1ODSrcKBKHUaHvq18x0EnwLKYvRCS9Wz9+upoPN8isvAeRcxGj0FqXah5SB8a
	gvLu9NXezJEdFDirAYU6nuP8j/PRrudLFyXsgxEfVOqt+WututFRi1MmUmA1BERK
	gwIbvdzLNfeee06RtunxhsIsSvM5WvdE2RF+ndcNx5GhAk4aB1RHRFfc5gpMts+Q
	5ylz6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ajy03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 08:38:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e34ba64a9fso46882785a.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 01:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753864707; x=1754469507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI/nNXs+f9KkWZ1yxsWzsQrCvk0IJuyKWclGYTpMJOM=;
        b=GrYnShxxwb8D/Z/M6ebTlkplHZALcUI0yi//QN13Lfb9vBmBbTpiY2FnASjqRVciOO
         WMe1/snW+/BotZCFmfJWZWXv0Rzz8yJa3aHR1S685p3IjqI0mI/JuFxrqeF+Qy+V06sp
         kZuaZoA/mNNK4sEf4lQdgNkpiDFaqkDVqjmfVrk4lS7138RPD+KxU/1UbV1W6Y7Kypcm
         OkUtGtiVvQTMtEqmh3G0sThamYEh3uG9AkV7rXJavExqnZELVpkxQ/X72sCbQwuHSkMZ
         onhguovg9oJBoop51/P4o6HeDQzFXbQKarxB/oXHjYuKzTqEVLoBkI2z/QIAm0C1kZDG
         GnYw==
X-Forwarded-Encrypted: i=1; AJvYcCVYb2ahsU8hrRqeYLWfS2LeuOusCZqKDlZzlFnyhDtAxW70w4S8ZBnaa1Z0GzJw46slxvTQzIIR3kM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVHOk0IP+Oc4H2cUrTDXjrpykXLqEOgnFImKwhsbxt0kcsj/Q
	fcRk8U+CvK2XJCp8xdP9vAqPca9bPku1jgy2+osUpZRGZzJ0N8lCjJ0IRPCiVG/8/3Hcbo965gd
	e9hh+0rMxrKO2+cC0SOW+KXdX/zCywiwkgoVo6Y7UcgwZTkji/EV69AlMxwcwNBs=
X-Gm-Gg: ASbGncsi07dFG9hbs1WmaPCgay9IueHmMfGTJngUTfTJJWSQhAQIR/abUAgrHDRpo0r
	FxbDD1XjyCyHgagxoerfPDqJWK5E0lMIv7JUMTDyaq6Kq8D7s+lXoBJCg6c37lf51GAeUILdgHz
	GOHfV2qfcQ421Fp8fxQSPMzUe+szGFwRVwF13uY9E1RHNEPIgEz/xRRZXzXoSNtyM6cNnWo3fSR
	z5VE16FLekOEnaS+DRmNC42y5a6vFrVlLoIOjVFr0UdU2aMuYLPrO+HzfBnf2IHgYQjtfW6cpCv
	S2VlhqgiG+binicf4ngpXpkJtCRRFoFk8Lr5XPnGBaWKtF78ASjBy20dL1owa//3x6tw16VLmJb
	Bt/woAJv57ucHMqDqfg==
X-Received: by 2002:a05:620a:2892:b0:7e3:328f:61fa with SMTP id af79cd13be357-7e66ef91861mr169463085a.5.1753864707675;
        Wed, 30 Jul 2025 01:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVI2jZ37bBekKEznTg/czn6Oni5IYIGSxIKihzZfZqwE+jSvddcQoWat/7kn9i13M2e0uZOg==
X-Received: by 2002:a05:620a:2892:b0:7e3:328f:61fa with SMTP id af79cd13be357-7e66ef91861mr169462085a.5.1753864707288;
        Wed, 30 Jul 2025 01:38:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61544a81df7sm3370018a12.59.2025.07.30.01.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 01:38:26 -0700 (PDT)
Message-ID: <134a6436-18b1-4b21-aa19-5e7411c1678d@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 10:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250730081316.547796-1-quic_varada@quicinc.com>
 <20250730081316.547796-4-quic_varada@quicinc.com>
 <20250730082852.oxy3tjjtdrykrzne@vireshk-i7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730082852.oxy3tjjtdrykrzne@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KLUYdWm4kdlrfL3jVaPYLOX32pdzrrmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1OSBTYWx0ZWRfX3zTo0vdBG8T/
 6o5t+YDq/BIQPRlTq3VzqjVcGOTfByeX/W1CX5NbInO281/p8rJNCl8XSZ0dIuTQkdCJbCsmgas
 grMPcIZ3b3FmyS1RkAZ7xDYjwI3Z/ylvrYjxPmVWB1UIYAuWouu7xjxcLP6sYD1lPqX8ik0PYMH
 jJpj3YV2ynxc/BoQ0unmQS7bvjBDXp+9bK4vkfSJZIyOh+b0Qg4lQquCPFwbukb7zxz9cIRzig3
 5jZLFTcBzVZvThwMb1AmS/F3vouV/Aw/GEa/cNlLszwN4nxVDzX+5xp28R5iQZUsHyGkrxE8OmB
 nSlFUMNu7LnIlp05f48NcbqcM6XAQ4iqud9WwSBfZtyhWdWBtkTSK1tEeS7ESMQMOlyoVWN+8qz
 qsNnS7sXUTFpjuRGBXSm1TVuNZavZhgFe5jRnP75stxbjI6CEfPEApIi+zfc33m5BlKMPzAN
X-Proofpoint-GUID: KLUYdWm4kdlrfL3jVaPYLOX32pdzrrmG
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6889da04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-57h1Q5dCNsLzJNHLckA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300059

On 7/30/25 10:28 AM, Viresh Kumar wrote:
> On 30-07-25, 13:43, Varadarajan Narayanan wrote:
>> From: Md Sadre Alam <quic_mdalam@quicinc.com>
>>
>> IPQ5424 have different OPPs available for the CPU based on
>> SoC variant. This can be determined through use of an eFuse
>> register present in the silicon.
>>
>> Added support for ipq5424 on nvmem driver which helps to
>> determine OPPs at runtime based on the eFuse register which
>> has the CPU frequency limits. opp-supported-hw dt binding
>> can be used to indicate the available OPPs for each limit.
>>
>> nvmem driver also creates the "cpufreq-dt" platform_device after
>> passing the version matching data to the OPP framework so that the
>> cpufreq-dt handles the actual cpufreq implementation.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> [ Changed '!=' based check to '==' based check ]
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> ---
>> v2: Add Reviewed-by: Konrad
>>     Change speed bin check to == instead of !=
>> --
>>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>>  2 files changed, 6 insertions(+)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Lemme know if you want me to pick this one.

Please go ahead

Konrad
