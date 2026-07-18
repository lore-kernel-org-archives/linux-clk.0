Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A53537CC
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379897; cv=none; b=Xjx8zjvPUfUtoYiQE4UP86CZnhd3JGPMB4Aj5K47guyw5fVOhVbhbUBxx21znWcDME+2TTtGcDEc/2adRsVU8SHtc71ScApqNHnrQOJB736KZQ7OKWNsJ/kIF0EN+pDgcRwTuCg9le/CGRn9JuB09qzC1OBQh/jrBexMdlEU09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379897; c=relaxed/simple;
	bh=Cr6Mg3P0Q+kOQ6fcmKRjfVQfbXVt+8eGxgKUyr2ddME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEkDvWK02Cs6UQIYTY3He0Ie7gA+Y8mdt5taJ8cP4qsZy2OEtm96eXzSst2Ok/liOPOYK7qou7BRDEsg1kzRWRzISDj4nUBaEdfuV+toJ4gwFpdIBJPq1jiUo+7ztvw6qRt3T97TyPqiRH5751Y8xhlf07ircSzuMoiVdPf2fc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlVn+a7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNCp+qIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlVn+a7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNCp+qIR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAIb5g341646
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 13:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jN072AWICsPoUEzDlNVZ41tT8WbbOTfcjl4RUJ04GkI=; b=YlVn+a7RGjZw07YW
	shYoPw5E8AYcg+6MhvsJkn1EUPIDoDamg4ve7Z9bxy2Z5eqJUnEzHdan6So1Gzgy
	Q4/3g84Pma6FRn2xusvTwHpICACcTjvoXUG2r8/1dePuqfdRBM7tuPYoNOetCHeL
	2J07cUVxaP/vcOD3teX2YVBrNVwFltwTuMvVI5+lbMLYkxoojeOAGotd5F51Ag95
	v0RNDhohN7jFvEn4mibiTEbc3bLaEEfSoS1kj8ivb1pXXj7negaNFgA7cqVlvkW8
	LOV+8O9EF+Fn9SPXXZ6AyiKvHvSAL+X5ImypekPF87Lb51+7ci8JbR9NG1Nvi3Iy
	2NzKvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngse2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 13:04:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso690706a91.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379894; x=1784984694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN072AWICsPoUEzDlNVZ41tT8WbbOTfcjl4RUJ04GkI=;
        b=hNCp+qIRzo4dhLiyfgAIDv+SgdIRUglXjAEB9u6vkyho+/ktXtzlNjGj4C7BHgIo6v
         ULBtgjnWdyRmYDFFVZ/vXzNQszdXptKH3T2iLQWRw+b83TIftzyHX/Pe26N2lh0M7Qkd
         kybLbrkSbBrqzcTVuWSmpX6rMkBCvJz6DF+QEi/oDUhMpqgJNh21p9VO+c1HFZ4MiZx1
         TySe5Eiunj4ABUPWiGY9/fpGDDcIHDcYWQdmcpf16y/IJIx8U7iu5UJGUGndh8DRPh65
         fzd8rUDJxwcPy+Wp6zYZWxRdt0gI4dTd6F95+5u/7JATdm1AB1u0cBgO0/6dEojZg6qz
         aaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379894; x=1784984694;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN072AWICsPoUEzDlNVZ41tT8WbbOTfcjl4RUJ04GkI=;
        b=BW6iNQwbP0hf9EyZpCibNSpsZ2MauyRByA+1HFV78SUOSucNaF2YD/73QwErEegjhS
         2MPbEgO8YfrhsTcVCTXONFT7aBcwwPZd9BcRpwuwkmAivgK3L891JY9SiO3We2hlc/2v
         wOCzK259hrTjcvUyjXSEvTcj02TXxoicymGO23O6hUYZ+BJdPzgEuVTr1xuCYVxf5CcB
         h+BNAX9hlYwrIMfdYJEcK0UGUhPCV/WQ1DnzPxa+7Zrhc8bBM75eEO4P6Z5kemfQsZR2
         0DWq76DMUmUzR0jNUaCpqQJ1i2VtkGr5S2xmtNkd8Pubsntf5k6XFIwc8gBjrsa+hFHh
         Zujg==
X-Forwarded-Encrypted: i=1; AHgh+Rrjj1464l6FoUdcUAgnphWctoNMcniIuky/Fo1WcLQEo8WtWi16qxNofYJMpQqHOX9ViosqZkmM26s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/C6ClocBbC6JOaoNxChQBO8+hQLlgShu+c1yqfSGZMK+DDlv
	B9eKgrYdfZSDTZAF0QJWrABTeHVlgFKnLRLZUI2+evU3n8HwCScBnJMDTTGTjfaWkf7cPFXjBQX
	PclV+ahjnqyohnDIWqTMwjFyYdEc6uLl9XA0x+ay775Nb5GjTrL4vo+I/ipb+V80=
X-Gm-Gg: AfdE7cky3bnz9ZcwBiFSTKiU+WbvbDeS1X8gmp7mV+lPPX8j4TOf1awXPXADEpW7VZb
	Y4ex28NMswwl96nkZzMwdZsE8XjdE08eiN4jSMcXJRAEkG2IjdfJ+zBt5QcE1KH2xdlQnk4iPDx
	e9rmF4gHrTkpDDRbfrUR4/7037026H4KAb5EzzZRESbnXr8COvOg7loQeFbwCsZ2lEDwVorP7Rz
	vSJYYko75WeJEKtxWK8CpkgwZitE8Fik4q7pMcLM/eA52gzxLUMgh92ZkITL9sM7hClE1Y6mrLS
	VYvSEmr0ODN8KbaKoS3cebaj6uQIZuau/LIM2AVCkY29q33FS2ANAtsq7lReTOXxcHRKySnNmoG
	q7afeQDcvcM78MZpqotW4Y2Jxn4nemw==
X-Received: by 2002:a17:90b:5606:b0:38e:c79:8112 with SMTP id 98e67ed59e1d1-38e4b41fd74mr6860768a91.5.1784379893587;
        Sat, 18 Jul 2026 06:04:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:38e:c79:8112 with SMTP id 98e67ed59e1d1-38e4b41fd74mr6860691a91.5.1784379892874;
        Sat, 18 Jul 2026 06:04:52 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcccsm19989257eec.4.2026.07.18.06.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 06:04:52 -0700 (PDT)
Message-ID: <454c3fd8-6379-4808-bcbc-ae54534cb295@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:34:32 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
 <627d9c30-5b6f-4634-92ef-5d70d3843102@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <627d9c30-5b6f-4634-92ef-5d70d3843102@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QY2GbyeDMOd7-NqOOFaKwuj9_TZVB2-G
X-Proofpoint-ORIG-GUID: QY2GbyeDMOd7-NqOOFaKwuj9_TZVB2-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzNCBTYWx0ZWRfXz7vvfqXsCe0i
 9viKMQ+DQhtOrcwYD8iFYmPrX/XAUMpI807amW5tOa4EAwq0MPPwfdFwOB6nJCc42sQZp+wD5EX
 jXv/euaVPv8cSuK1CR0KHVgGAF91P2Y+kiLkt9G060+/L4TJlZ1G9sieb3lVmnSLmUlciCYr4aM
 KMHNqpV43pFd4o2GA1Ywd5OeisNHkZnFhFhIhdHkjlI83pKsxUFMuEvmcxtR2p7HNZQZJERcc6P
 3sIKgCktNfawBzRU+noIH7UHkI4uoclWQufsS90Xt1L1qQtaP2cqp5M4lLONEYTFK8x2O5sccS9
 HEOA745qMCvj6ZLLFRIxlUM48kmIsu8xa5k8M5sj4aNU/RnmirM+IIJ+e5hg40qKc7xLOv5ZOah
 A6yfgI7FP378/WIMHoLYSu0XIhrZtFAL24vdH2/xg/2Mp6OIkHr8hcqztnIaif8uyJD1/cda2w5
 RDyMhqHZOgtTSU5fhRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzNCBTYWx0ZWRfX0ooQ8+ht40FL
 RNo967M1Z0zOGeZJmmLP5Wtre3N+T7uZDSDliQAL4GaLWWyyW3EaAazLZb6GPHOsxCayp07GHwz
 lG55Ew1+Qvb+2EYLnNkSVafnzFGfEfI=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5b79f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=1plhUvqAqgq3PYIhvHH4kg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-LE8F9h2gSoCF2HKZX0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180134



On 17-07-2026 02:18 pm, Konrad Dybcio wrote:
> On 7/17/26 6:03 AM, Imran Shaik wrote:
>> Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
>> 25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> It'd be useful to mention that they're necessary for 10M and 100M
> speeds respectively
> 

Sure Konrad, will update the commit text with these details in next version.

Thanks,
Imran

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

