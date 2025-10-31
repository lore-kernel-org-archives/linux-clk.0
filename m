Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46153330B1B
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902491; cv=none; b=gNSlGsbnwRcGDeD827y9lXe6v0RCCJP4HoN1BDKENTvN8PZBwhHYx3TwEsGXrzZ79T5yI/ErGcMKMQ4lZCGXb1efVV4eghvlydsPur+70bRBGf766Q+P9gynqFQ/l4Z7r/a1qJjrg0YSazrYTJApNOdTMPNdcT+xRGANoIMUhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902491; c=relaxed/simple;
	bh=w8yfOd60KDdKJreuFqthqsd4fR7/UZE2/5nBgUt6onQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eg2x/do+bUqIrjCGMXpY+LYyaIW9bizxk8ysiVkXMEJoQtU6qyDJyKS787S9wpVfjp+XZt1Te8I0bZfnDjyJ9jjrvIK7Ixn8kmd/IzRW9JLcbzaU/xn6e4Z9PBep8Btk9QfY9M1mHBYsgksPSq38Yl5pjiijRtesZV6z93fA958=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOWi6KF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sdvu7OWO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOWi6KF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sdvu7OWO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8iKE3872588
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 09:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gAPrC5tF4vPjEpXPBO+URBh6gx1S2+j2eTdd5IbfCM=; b=eOWi6KF1gNtTSuYt
	DmYPGZ4NdfZ1wmCWN1MdjC9u/96ET7d3GSgO5A48EQyJT0xiuHJgoCfF3YlK2z6K
	0qBqUReETVN7U3lwt0MMul6+CApYb5wbWsVGkEJmNwtA+r2YqWj60u9BqHk2oxd9
	Ds6xElCR8XGK3qiNPIbuk7lGCbeGxWIHdoMFWx7561j1JGi8x+5KmCWzdve7dDYb
	BbyFXq66M7bn0UtWIWdMnu45mwcn4tc34FmvWSQE44os1du1JKVLrSMhoFybqyS1
	VHLeH+g43gZjqteDHcbHC0Hq7dzr11ZHN63JAchU4ywtHvnFWZ8xdCyiNzu5s02D
	jEuKiQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn1m1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 09:21:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bd2dececeso7028546d6.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761902487; x=1762507287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gAPrC5tF4vPjEpXPBO+URBh6gx1S2+j2eTdd5IbfCM=;
        b=Sdvu7OWOEBUOh6sEkV+23PEZoRiA0PXC4Rj+48h+qFVrjLN04KhwgCL5CZGwPPFE8D
         kFsw/gUrGa1vFDxbbIQllFhT+rijZyg72pCjf7kiyVTQnAgjc0lgywP58Z+qCYVKLSAA
         W+8hcaLErczgqpJ/vP4zODSoJ8Jp62mLk/ZApfAlngTIa2FeTHLN8V8qVre54X46V/57
         ZBRQ8ITH590gk166jmTelDo+ENHGlZyTxSfqC8Li/GLiClfK+gRn2bKItn97xoYisJBr
         DgtwKz0SMw72ohLcr+GaLNKfGzQCjOyxYuVPasWGDzIemDR1R17nHCOa/p2mLQF1Ym/q
         5Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761902487; x=1762507287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gAPrC5tF4vPjEpXPBO+URBh6gx1S2+j2eTdd5IbfCM=;
        b=OyOXEc9GFUfmWedhmdHFk+LzZLNJCySEv3P58sPMF8f9SUXVlnUvkMQg7/0DzrcZ/o
         SVpE+ee1AhxADO+t48oNHRAsZhlnwN+mq4pzRmZpxNxBzzlFl3pTqXR4rqikLJVv4qA1
         rr1XBy5uM+kqz+IHbuLrWbnVruKfZvoJ0S3mBLORQVuscLn+Y1Tn4/gHrRMTekd52P2P
         xwvNbzgi6G4j7oEN4tqVf403E+9x+iP0UM8eKiNAZenVuB1Umx9zRZoUpZK/jmQsc1oZ
         uk6EWoCqYjJ+CQttj8gBzceOFcCv7b6c9tFDykkeEw7NiF7B/rvDPjl9jrMC2qRJV3kL
         EV7w==
X-Forwarded-Encrypted: i=1; AJvYcCWMw4zdw98qRWO13oP/fo95SjWEGC2Psu1Lii+iKabPdxwC28r/2oxztIK2pYqTgKmErwNw4pJ70hY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/evnY1bK6IQVQNtGOItV+q8DKgG6NRJFIAZ9kPV60hrpzq0P
	qqlffI416Es5YJYcTm9osMLIySoGwv8bC4uPC/H9wQPf9icLXRtdII2ZE1XSacnApSSXVblTIkQ
	2kmDaVNsBOalg8mhKrvwMw6I9/mc/By2ZwwjcbG57emS6W3QzImxVPp3XVS4ayg0=
X-Gm-Gg: ASbGncvES/fumL/l8d4B/V0IsTzCz4u0mfm41ZY1nwsKK6nMBd1Hy5v1V4Qghw3LXvj
	1KNqOMxE3qN81fJlGQzHOMnxXEo70kCCeeS1hVXCyEl9SlIxVmb7kb7STCgTb0vLmMUSIDgrGUu
	aDjm92C16hhtGGRjmUJpwpbJ8hXcDE36IMZNrt7eYlAKdUI6vWVZ03KYV+wY4d2+Yz89mT1BGWF
	Ril7hu40w3qvbAqZULJXOy3f38cAZuWbAJpkodA7OoScZHlbTtMQEAlp/1hyy33co2nZq/E5qgW
	I2O0alOt5rx4CL1u7EZqBSwV5S/iFd5OPlldXE9f5CUR/C4xridDrIN5AzxEb1VCXw7UOlF11qE
	dQaSoNEgDobBL9mTKHZre4oWJ6hLK+ZMjGoHnUYYuBrpcuyTxUwKrO8Tf
X-Received: by 2002:a05:6214:2aa2:b0:880:1eb1:fdfb with SMTP id 6a1803df08f44-8802ec2ef50mr21081176d6.0.1761902487464;
        Fri, 31 Oct 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNUAdNYmumEqNj+QhWtcRqw7r8QN5GKfMaLwnY2Fp+tH9FpwHXyXjINbqWk1YR3C2goLdtzw==
X-Received: by 2002:a05:6214:2aa2:b0:880:1eb1:fdfb with SMTP id 6a1803df08f44-8802ec2ef50mr21081026d6.0.1761902486985;
        Fri, 31 Oct 2025 02:21:26 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438b05sm1120434a12.27.2025.10.31.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:21:26 -0700 (PDT)
Message-ID: <25579815-5727-41e8-a858-5cddcc2897b7@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:21:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] SDM630/660: Add missing MDSS reset
To: Alexey@web.codeaurora.org, Minnekhanov@web.codeaurora.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=69047f98 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=Gbw9aFdXAAAA:8
 a=QdJS1fbVFv8XyC4bU-YA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=pioyyrs4ZptJ924tMmac:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: RgX6xFmhVKF96_xg-60RJaCKz7zU0xVm
X-Proofpoint-GUID: RgX6xFmhVKF96_xg-60RJaCKz7zU0xVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4NCBTYWx0ZWRfX5auYZ0Iq4ViN
 vfd/iqAVIu4dm//nT0qUU9tplYgpq6lfJktlViax+Ylmltnp17JQ+mxKCOFCuhXdAgPZjQCthnW
 2nTwfhCEPQXvdlvyLULcJd0xXrD+yyJaXHxoQb+81O2+3UuNSRnKT0FLOMdJBR2tFZVNmSOwo/p
 teP9k1uCf1vca8DjHbhqVksh0BNPKfsy0BsfSWISM9xwl9yhpvyCd75nHWY0C+bOeXFKjF70iI1
 i5bKbdaHOnoR4ySy7rAI736pQ2ZoOSG87W5vyxFERSnVK3obWJ2E2FzridLaRLpfj6LTHFZJyNd
 fcT1Urz1bCzvp4xfVbPAawoPzYa0vRIcoUMrIDpl4cqKYLQaX+OgfNDm3onWmxJU+Jae8fwKNBp
 JMldLNnTEnj7nhyMRRV/FIsF5rTh7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310084

On 10/31/25 3:27 AM, Alexey@web.codeaurora.org wrote:
> Since kernel 6.17 display stack needs to reset the hardware properly to
> ensure that we don't run into issues with the hardware configured by the
> bootloader. MDSS reset is necessary to have working display when the
> bootloader has already initialized it for the boot splash screen.
> 
> Signed-off-by: Alexey Minnekhanov <<alexeymin@postmarketos.org>>

You git identity has two less/greater than symbols

Also.. thunderbird argues there's two of you:


Alexey@web.codeaurora.org
Minnekhanov@web.codeaurora.org

plus.. I thought codeaurora was long dead!?

My DNS certainly doesn't know about web.codeaurora.org specifically

Konrad
