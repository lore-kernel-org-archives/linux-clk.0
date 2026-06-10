Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3640B36B
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098357; cv=none; b=jaS2R1fEhkiza3cUYc5SH0WKDTLLSohfrAUWyq+csy0Saoza1Iw1UXzQTLPqkSCO45etsJAVJmGv5hQ51xEffjeB7pNSJ79hfT/8mtO0i0kLf0+QAIihTbfSwu1AEpyCr1ppXccvESqtnulxzowJwL+hWRjcLVS7RpBMmtZ6VVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098357; c=relaxed/simple;
	bh=4ShRACg6pRN5f5U0yeS94DPp+wGyACls53laAsdrDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juOKuoVSoPdHUKkP4oSOm6pKFpo2HA1NEVSbv/+20GKn9K6Bg1KAISvkgUTRHNvzg6nDAlRfRzMiO8ypzqME7K5q5/jYRjb8rMPd8/12KkgApTE8Btwneii+nQOr26dAfS8elNdYIGGnniXkPX2khVOFzRgQYUmyoILfLcAaVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY3CKTHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3HptgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cY3CKTHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3HptgX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgXk1138079
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=; b=cY3CKTHVDUsuNxMW
	xD3jRyPDlpXYqlgbyOpYd9Jw9o0n7Pvq0krnlEjoAConV+NVYvaHCjs1xME5bgVh
	Sh2ll16mn1UJhkr+OluS2yZB9pV9vF1Hej23hxtqi10cb0EBsueK3siMlGohNaCI
	OKckJn10HXBmeB2Ag5DqjsErHUOaTc/SzIoHS0Uac1CAl+fyLDH/b0pAOKbLeHio
	9svv7gyglZMwFTia27oWyEzdKND03MGBby7Fr3t/3Mxi8Z+qgGG8ALTWO8jGRdCX
	C5d3sPFadfTCllpd7fEKoFv/z/aUnK+MDNoKmG6lNTGyvQuERj8LQTegoYZn9RNQ
	gzdlPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jmma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9160006de85so8732885a.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098347; x=1781703147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=hx3HptgXPpXEu2ptRsb48y+KzGt3AKeDG1HD7EoFqSstKs1lWOIRtj2j7+PhDrvkCQ
         D4Gw0CuiS6c9P84c+Va2eQIOyylk2Xnk0MYxlUXlLZAJJ3yr3Hs7jbqFbCRTO2TRjm/R
         M6KdmqEmBWDmlsulmqGKW47rcczpabf1A5qukLU8mGDdk+5W2TfxqcvTsva13ug+Z5Ir
         s8U1CSZimW6hljLek9f1fsVqWe0LClIll0HGpEnMcTs724rMacEpqr66mYo5+ntt8CVJ
         Blr5vuedZdacxP0bHOM01uUNGZgPT0u4ruUFcjDsPEsIITgTyEVz1PXFGvuotdkAa5S9
         y0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098347; x=1781703147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=I77PHUpp1Pcq6ow3i1YbQO+PtLaqA8H6D+j4KbTAv/49P0MIXgMezV3P14DeyOtwI4
         lBVMJB3YbHYGyTjEg8ViDu5RSWUM+7vY6/FV03hWi7Zk5sIqqlm3wQ4sS36YEArr7Nji
         p6SSiXtgnPdbGUWWGSnOWuzTVX3ZSSEerLMGN+GV0uS9I2XfesUDkfdYVPwV4yoVf6W/
         zHrXDMZueGwcCtQwj8jDV0hT0/Wuw6/4KbARljAOPF+mkoiiWxNeII0HOm8Ux0+ozVYu
         phGjMYsnTdrlKyQ5aZiaPeZP3Ayex6EPagg8yPIbSadbBmtcPJyVXz6R/AamHCzRFa0N
         d5aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9frFyAYhOBLA0Vy3N4zVsBP7s8TX67EcEcc5v3Axh/r09WFZDNTjNlGzcqr9xRW0281e9chzKFEqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YysMjExMc4N3hbPS17kkJ6pVg8w77iS4GXVQsilB9snNuVPXsZE
	BtZ10jr9y5E0TBi4eEdKuptvgx96HQEuiOTNIaz7A9PlO/72m+EtTyPrSFbuVpgDs/8lBq35uIO
	fPbQOdryHge7D6lZT0hA+D12A4OOs68N/1g6o8xQy5B5kP4L3NTjxUc4Wxn1FaaE=
X-Gm-Gg: Acq92OFG0QmNOZgOnN9avYiM+d83H3XXZXSN5hwYKebnx1jZDKe45pttyx6AqNpzx1c
	j4OCuz0rBGmeX2nk4PkrNoUDQPzHLmd4EugLzorYuoNlKaJo13OEd7kqb+JyGRfx6UoNfA3uu7U
	YdDomk4D6e3VeazZzGGfrqv8IiUsNFH05cCMUC1mGnjeIrIL6s0gShaVs6COxFkqlPs8JM91wdz
	BM6crpjnrOR/p8FdkPyXHoSvRXlfJPrakCta1I7Z9LL8bxmiXlBUK6DCC1hV48dvz7VJ7k57g5P
	Ifd6xRsioV/A/eclNsIh7FNlF3jwmFN+w0z4vaKZVW1MBWfsCqJgdo1MR+mn4ASeAlH17jwO8Ko
	KTIqtFpqKrI57isE5y30ixVAvyb/+M/aQx+KOpTbRVUHefFyOgPAtDFz1
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570904585a.5.1781098347409;
        Wed, 10 Jun 2026 06:32:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570899585a.5.1781098346827;
        Wed, 10 Jun 2026 06:32:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm5335664e87.25.2026.06.10.06.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:32:25 -0700 (PDT)
Message-ID: <4cd6248a-04e0-4056-b72e-00b860624dae@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29676c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sFjf4MH_f5z_4b8YUgcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX+ZgvkDnQfptU
 NJgyDQHwiv7DqmU9Hj9rCUg57zFd165cef+ys9gif65RZrMb/tgYp3Vhou67oXM3H+FQC1pOjoZ
 oK9xrONzgjvgM3QiYGXa0tk1FdFryyKv3v+SjMQ70ecaaBQg6AsVVjXvALBjLFTnPqcFYVwZ/P7
 uIj/0ZqjmHI38D6AJb1fzDEwl82WAcwZXHTjO22tZG2gHgIGKuP2LDJNG7x+qSE72wDiP3qkJsD
 vvi0PJSosj7lptOE7wFP0KfSspB44OWc90Q2QXiqFH7f5OFswgU0Xubtr9CtEHRYPxAypo+ZBE4
 eK4tQUlFUpRdTXOp7rbgoxOnY9TC6QJtpwT3MtyLi3/5pyCnJgVrMaiglAw5E3jHGSdL5dcHVdk
 Jr+vPNUfcfJPKdtmTGKX2WYqhb7KM6Y8l6u6G8IQIpu24357oRp2JDvnoZKYvz4mkl1kVBj5uHa
 5qITRVYbKeN3QfIrWtw==
X-Proofpoint-ORIG-GUID: c3aEp__hiYBCbQS8SAHXQ_VcdTeKHexb
X-Proofpoint-GUID: c3aEp__hiYBCbQS8SAHXQ_VcdTeKHexb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> Allow Venus core GDSCs to have their control passed to hardware, so they
> can be powered on by Venus firmware.

"and explicitly state that the vcodec clocks' halt bit should be
checked"

// even though it already happens by virtue of:
#define BRANCH_HALT                     0 /* pol: 1 = halt */

and C partial struct initialization rules setting uninitialized fields
to 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
