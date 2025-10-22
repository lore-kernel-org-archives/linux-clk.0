Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A00340D9E
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146389; cv=none; b=PZ5s7PvanR1QxwqjqBpUq9Nn/3vXZqtMlT/1DRZfEXw+LH4z6vKx3SyMsvd3iWHo36Ula4EESuI7OQTty5H/BAO/17iiZvJb/uAoKGacuosQ2JUQQjLSxVTn16wiYzkQIZEXekye8m8SjalM9cBOEuChYRT6DdOMsqKT8wDbwoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146389; c=relaxed/simple;
	bh=AOPCbuZwYDb6Dpjxmn73PLplRI5HptZK9i3IrS9xvQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jl0Gfzq27rKIV+ewjKh6Cve3KWE3Bn0j32rCWVAWqzI4tGxt8IuwgiS7Fyog0s3jp9YXS2nQVydH7RKKmjPpcELtmEMC2w9wn9/xEgph+FGdX4o4Al66j+buV8VkpB2IzaFW4Gkff/m3xerYTYg/mWXCUyc6zV+IIXwrpsHoXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXr42Zhy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXr42Zhy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MEdnJD012568
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFJjV6ZS3dp82z3JjMux6bhTskobUNBVC36CDY6FPjw=; b=jXr42ZhyNhaVEDqc
	fV/59OWVO3iy1FJlmO04R7rOE1No/5fJWFuVd3Jk1c1gaNpLD3giL+96Tdy+rCu7
	M3EcFYR03VzPyqGGST3ck+gfanRm+wkXYtBjrUAwZ3SFtHQnfgubDtDJx/m5KDOc
	oxJlQZFmIzeYmjNzGcEDqeJge9Vh29dEZwxIHuxZ1YhGPtOL1QPzuOUtVusTMpi4
	+9cd4y7HOi2xuxGRK/ZH6FUvTpvc7wwQLrLf4DQqWZdNoEGM8VsY6unURVUqvMSD
	nrv3FQMtNHOhmU7VLMmoeUQj69RtsFK7Ajrpl+tMvhek3m3zcaLeFW2/m0tJ+7Xt
	S6fkcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0jywn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 15:19:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e890deecf6so2010201cf.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 08:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146386; x=1761751186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFJjV6ZS3dp82z3JjMux6bhTskobUNBVC36CDY6FPjw=;
        b=LLmfjkghG7p5FIM7bo7Wq3XR7m9JJBVruKUwWGZMcAGSWOT4tXax/+ucmaOBWUFqbx
         k87z3pdkAJtUWEuxobzpGAmyUSgFj2dIgeSIaaUuscxo0Zp4BUr5cIgH3247n8rfPEys
         rPxuc2GuwgORLn17rINj5R4ddedIzLa8Mf8Mvx/zvctC/MHdtye9QUoGvskbXlOxrNSy
         E0E1WgPs+CW4wrUrysFbBUITMS+VXGjfC61lrX3si/9gCLnYn6oosVIDgXNKGpoaZxGD
         wD9WSxV24H53WK/0ZGCEfBpWmEW3sCn3XQ8fMGcf29Zzm0yeXAl0tYNhIHp5IWmecoJs
         eSDA==
X-Forwarded-Encrypted: i=1; AJvYcCWqN45vj7Uj/jdoXfHKq+In3w5ie08wKHgpNI/hiZVQOkMbmGeZjPAQc0NmVRq3yCno15oVDaApyX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCQTqXCWp70k5AW8d78VTc9N7U9PNBOZAGbFtj1VxUTsDRg3a
	yDTQtHB/2M92JZ06ERXFRWF5eAZIEAhQdPUrso8JwSM5IKKHzofttMAbbgHfT20bHPMoOsIND87
	Id+x6XuGQo9mZaThEjBPSVYXfoSka0SopppS2YC0rkOiCIPPZKq6eEut97Iy5lWU=
X-Gm-Gg: ASbGncuK8+EvqPGE8VHA++67ZgusGqnAPI/+5gW2CvYdrADLHIq6KStjohdU3euwV/N
	93tH/ZCtk8NJa4JakmMeBk0lk0D76Z8/Qtc9rOsb5CX8jZIRauWdhvuvl589d2D5yJqEIwCW8LM
	gRiGR+Azd4NRldbtdDxb3dcN016KjpkH3x1J8t3cAwfxVRuRRRxkxSwxOcIh0nbk2uZv+CtUkuA
	9imYd5wAgUHb/xgaIkn+4AmBi+BSC/F0NF0HL0BjC8ksQz4PdCPEbkCnWnJQnVPfJ+bEMl6vH2w
	wVeDEKoz+GvT0n+rSvth+5Qe/7k3JA7O214hk3EFgGX6rlg4WADBAhfiGH1afrMm0L0+0E34YMj
	KaI7f4smjlUN2RkXT9bF27TipEptNx/HBTx5XatguXKA+56+DoOt+U4m1
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr62265091cf.4.1761146385877;
        Wed, 22 Oct 2025 08:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKXvCIbB2pLB6SjAv7Ty58xdlLb8zP8xTswFS1vxWoJjM0mXPHI55XPzjSk0aLd8Oz/JxG/A==
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr62264671cf.4.1761146385272;
        Wed, 22 Oct 2025 08:19:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab5553sm12255949a12.16.2025.10.22.08.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:19:44 -0700 (PDT)
Message-ID: <f859d423-32b9-4aa1-8468-c2e9ef006669@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
 <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
 <qanawqrk6izypwmmuvezzff37k66ptv2vlbdwxs62dqx7igop4@wzkz76376jli>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qanawqrk6izypwmmuvezzff37k66ptv2vlbdwxs62dqx7igop4@wzkz76376jli>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX5W9tVlTm93TQ
 zrlxOFooLf6/eHdzMAB1mqvNfuFi6h00o4UnG9GcvqorLb6hzZyho3OJr+VoDSZEGh1C+jnaArR
 K3/8zIFFyKZhdYCJStOYACn8y7i545mArAr5GAmM1730fUFrdWz3JLOENntUmkNnSsD3wz1pyEN
 uqTgP3n2nIQWYi9UhEk1wCaM+sJymUHekfRACzoMGpqJltH/zk0OXkxXvY7sUpWOY23yu+5/+SO
 n5K5TPztQHsNqeXCr6KdaJVsj5nftuCJ6EdNe7HRcW5J6Dtg4SaCZS+oQ1B7MJGgy3F9OHNAb3e
 zz+XWXEOkUPRSarTAzUN6bLBUgUkxS9N+x9XRHvdzo05BkuGuRO6K3tdnZdTjHdXLppsmvBDihe
 69qoiKhbDtdbm4eNKya5xSlHA2lALw==
X-Proofpoint-ORIG-GUID: 9QWuxg0Cxo_vdD1fdtpNjr4OtkqK9yNs
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8f612 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=3hiQA3MbAuwmldFtFxQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 9QWuxg0Cxo_vdD1fdtpNjr4OtkqK9yNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/22/25 5:09 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 01:19:16PM +0200, Konrad Dybcio wrote:
>> On 10/21/25 8:08 PM, Luca Weiss wrote:
>>> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
>>> parameters that are provided in the vendor driver. Instead the upstream
>>> configuration should provide the final user_ctl value that is written to
>>> the USER_CTL register.
>>
>> This is perhaps wishful thinking due to potential complexity, but maybe
>> we could add some sanity checks to make sure that putting things in
>> unused fields doesn't happen
> 
> Should we just drop those fields and always write the register value?

They're used in other_kind_of_alpha_pll_configure.. and we have a lot
of drivers using either of these approaches, so converting that and
not breaking anything sounds a little difficult

Konrad
