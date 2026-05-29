Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1F3BCD1C
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046692; cv=none; b=RZ5Qsv6zmVSV554g03cjAvh1I0WPDCjRrZKi5qaqZgn6NaYH9D1+LwiqZRuzvzz+rx6TSv/UOJ01z2Zd4ggJMuyg1uAtTSK+8j78IwGUtSyVpbht9hVjlWUo4J1qHSBgEAFtM77W91yRXVNe2uko/VhD60h7/gBPBs6nioNwwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046692; c=relaxed/simple;
	bh=o4sUJ27v7ooORme6fNzh5GE20SY6LLW/dSjlsVpGr/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imvb6ABz8Nz/UYCzhyLCVSl8fAbHaztmn5zrBe3MzMxXt0u6p2PMUgyw8spTEBf6wesVCy2A69bVlyQn46Hg4PNuXaw2oPK2kwbMqFwQ7tQ7n8Ev6IfHAkKxPmeX9x9HddNOSKWZkDBk8hJDW6IYEKGeYoc1IiVCFAR8c/AT+DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMlQkBu4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOdgMgcM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMlQkBu4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOdgMgcM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7poLJ1495706
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=; b=MMlQkBu47y7y8i4d
	P0U0AgCGNXa5btwDSf7xcZbwiCvFVzGSiU33BXJ3sa1xYJ+nXXdR4hA2EMNaWnbO
	NZISikq+ARksdmF/YGs1FwGbRygVn8fr/mCBvrZeaXuG3GIRJmD9yMy8qbNf220q
	KIlbhm+C5eGeAiTG56Ql0kuu2/cS9yOS8B6OYS/DAYYGd8UHCk+xpWsmnbrw+rA/
	fI76xP1kMAqW2iWud1NE1JbuudQ+oWKTGQhlxiIQEOC6lFI1u5+UAayoKOdxyRZc
	45x09hgMC45GqbFcG/0Gu2cpnqANuWmDG4tFeoQuuu0pxW8F+tiDFGPbckZ+bya+
	atMFEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef0159w5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:24:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso2592613a91.1
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046689; x=1780651489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=;
        b=NOdgMgcM5C3y0Pq8topXUKAOvWyb2Rh9qWsCSRt/Nn+c0urJxQYgCou8qDKpnWqy/N
         fXRyVJcobsLGt9AyrN575ZLZaRksGDNI90G5QR4R6CPiMdNhNuNYt+6caN8PWd71bIlw
         XX1E9ghyShyoO5wXshX4qb8ZL2FDqS0Zh3F+VwjiKs1m4YxjQMDPRe/KOTSoJgOivjUb
         JE2HltOXuPsZqz538VqfMPOvBZXRY3QeOZNc5cyKmgtWC8bv+s+uGxyKzaWqoUS2oZ1t
         Ju8XCszXUu26MJbinMLmH9yvrHIpE9tLqamn6BXmPkPTbRaCuxzKAXWvaTzHidS4o/EH
         NVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046689; x=1780651489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=;
        b=CEm1vXWz671DwzVpnUnz0AVdMiYsspfAfH1WtrfbXWmyeIgaHCDWIuYu9tiKn7EOWV
         nNIvTl4q9ZxU0d0wNAelw3zym9L+7pf1VRFusZRvqG1tZKqUii/r/N8VvBtIsBrr0yhX
         PIs+mIn3hgxb9rtccFSg7qAOUQfwkjj4Pc1/fu6wEZcl21Q3vjH52Ta3QwUN2FEwT4Pa
         1K+xH3N/y0pd+jiEpSStuFY35VGI2Secnq/XKSTvx5A9nDKW+ZdAUIfM26IEWIUo9xKK
         qTbmQM0ivlyEmaJ5z10ggmx8V86/rwka7uz3tt6elxODCTBW9VGI8v/oPrGbcEDi765/
         9PyA==
X-Forwarded-Encrypted: i=1; AFNElJ9AF66zLgXWbCxlye0gl8XgrLKSsFb7O+YmMluMHnhxMZvbwDmRszODthZO8q/n0kdZo768oglJF0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZwS06I9XZHHH8ZbTAA62UODf5ylZPqE4KQ4P8XSnDmRdi0f0
	oYghfrUe8bFZ9A6+p5MxpJt8DnSO74bIXY4PgUt1iER+WmgmUd7Xw4XF2pOIJOwiyOqSIXn7oPe
	yQho66GJ0yPKPKO78S4T/mM8r2vtr/hVsemtrQwzzh6KbbSXLprHNKmkW5Nb2gXI=
X-Gm-Gg: Acq92OEsl8bM7/Fwm3izcj1HdCvbcXgVwRhQeFqBvIVbBG8br4vdrPpTOoZWltgbfPw
	UlCralny+r5oElUYyGalJW7GiLGE5/962ruU76kZA9ZqE3rVK8/UCS3+Kxp7v0HfjJvzAzlOmRT
	d92uyyTjS78JicB2gOfT2hQAme/6/WUA0JQjX6k2lHycD7RnLDshs9S78KAW5ek2tD/VHlCjnjG
	DjBYpxTfQfONDeMcDspRPs5ea+EcJMfQDxNobc7v+w511oBFRzcrXQVuNcrMuD/g+oIkRlkDFlw
	6iMsvs+Za9bQCrQ8O7mkwD550qpZJU1tId+G2D2nUTXBls2yhNoUdvOgXZ0gV9OhRh71zkI55dH
	jnhYEdF59GFodSGLoez2qaUMiJ8Qn9Ro209xy5ACMQSZOgVIw2jk1Y9D7EmZobA==
X-Received: by 2002:a17:90b:2f07:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36bbcac99femr2572481a91.3.1780046688476;
        Fri, 29 May 2026 02:24:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f07:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36bbcac99femr2572446a91.3.1780046687963;
        Fri, 29 May 2026 02:24:47 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0ae339csm1468021a91.12.2026.05.29.02.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:24:47 -0700 (PDT)
Message-ID: <95c74b63-2155-4118-9c99-da483ade3203@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:54:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
 <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: acnFGkOo_9iPIDevMFkw1snZdjjKwacn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfXyLB8OnM1UAWR
 vC+juXxEo8uTx0qdwvlZs6lENfJ5C5q82cYk+In/ae0Oa49s+AapSFQAu1qb+6rGPrT5/j/oOF2
 jIu/Mj6klCIwClROnWhyAn5nTynPbLWH/EPWDtJgZrxhtwn74RAH0KaLZ6SJSvjPv7CraikhE5A
 44UZPouLrF5bjZnfWW658kommIE0GMfcGa49BOFz6l6ymCMr6koeca5LXXy5XnRrRP8UntqTdtR
 VkFOzaa1JBHv/GHeLg036TepDBO7LooFSdPi6j6T8gCPsYF5EJD8y5taFy65Q/dl9aHYHoBcbKA
 0fOXJfzVNOhrulQkd7f5sAJkj6ejJGOGzyz/fk4GxitaJxMlJqN7Gv5SsoI6S479l8Quu1YBRao
 imRLeSpU3MY9ONfPrVjOIougZJ6p5xC1DHI9n6ES12dGv6cJVvU2QUILbiwMMrlPIuPgzfef1nO
 bv0mVMvTpop/TgnO2Vg==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a195b61 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ub0LQIPdQfE24AbRluEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: acnFGkOo_9iPIDevMFkw1snZdjjKwacn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092



On 28-05-2026 07:16 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:06PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
>> hardware block, with minor differences. Drop modelling of critical
>> clocks and keep them enabled at probe time, update the QCM2290 GPUCC
>> driver to align with the latest common qcom_cc_probe() model. Update the
>> GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.
> 
> There are a lot of separate, unrelated changes. Split your patches (not
> only this one) following the 'atomic logical changes' approach.
> 

Sure, will split the patches in next series.

Thanks,
Imran

>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
>>   1 file changed, 74 insertions(+), 100 deletions(-)
>>

