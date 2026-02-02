Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B5E3557EE
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026620; cv=none; b=KyI5EAc5MhiB83Wj/qU544rPwXuck7VZUJ58Wvy6xV/9ht5PaDY+yofG2AsbnpRwoKtZ9lJBhmBCsNZRFdAVxqTPZru7FAM77FhZnemEYkqXY6nltLX/oCJqB0jEitsUGd3yWc/uRGP4wzeTD+DDxFaDLCXrD7pDLVz22EAWHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026620; c=relaxed/simple;
	bh=6MYOYdYMyCKrY+q5X+P534qD7KPIhMkmL6RSMY4gi9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zq3nV9W5t4MvrqV8H22NEQxxN2enXviCJlRjhauWTTFAF7sSh4TsYx7jNw2u1eITgLdMjRJGt8OUCJFo9ZX19OqdZt2PDpG/WNWkR+lfbhnekBFILm9dag6uuTlD0PnqfCHHflUHYxUh27Wn0y6gMA3XNEXXlscxK2nI53Xwsos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1m/l1hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SC6a3JFF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1m/l1hN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SC6a3JFF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61287PgE2342806
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HAVl79FNGlIAUtprackUJ1sai7oBy7Ct1ZWYx+SBpQ=; b=U1m/l1hNzPZo56Yz
	GGGpqzouAxR6PfAIa5JUv1nsKSzB//lGpDmz/1LiyDhnECeZ5ZmDoB06KAgFI1E0
	fvEnHrWqL40QdlXJehjm99A8MyZV2+zB/mI2CRWtxtDP8UmsLf6KT526mYztg1nT
	vAuYGZAC39LR2/eSyrLVbGPQBvZXlxv3+HbW0P+YB1HJr3DlI+R2P0fEZbh6VsLj
	sNM8AXk8uMiu+MFtaSz15zgPxGojRmcHrfjaC2xyCpgJMKzNbNhxgArnU+4OPGui
	YOSOVgGclh6EsnNd7FFgejMlg0yjzmjewUt8n1iHK5zzfA7J8mJQSihopDUVyTH4
	0t4ouA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard505m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:03:37 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6499e0f9356so748577d50.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026617; x=1770631417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1HAVl79FNGlIAUtprackUJ1sai7oBy7Ct1ZWYx+SBpQ=;
        b=SC6a3JFF30g1/J/wrOn5QetpfQktA7XOch2gh8oM7jCz4SZBbHoYP2FO7i1PJ/AKL1
         mpxmo9J2dBLhaikOqSz/LCBcVzdzAS+bAuywe2WpD4aPuPNEzqkJ3FE0RobtBRiL5CTm
         2uAaLpChLF6bQJw0YSaIAKofCl/smiIJYnwSvemKQynamWiAsaPzq0KBFzmy9qMTV0ie
         XYuH2Db4t9Uo6ekzwvByv2F+1dh6bgG+DVP8ebFX3Vdql1rr5jRROY21rvxdu//1eIIW
         Dm7EbaLpXaAoCAmW563sCw4DkLtG23XiTr4QIuPV7lc0DKxX+oyE1w1sJOoJJnzKxyvI
         pLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026617; x=1770631417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HAVl79FNGlIAUtprackUJ1sai7oBy7Ct1ZWYx+SBpQ=;
        b=DtRgBy+1pAzJ5iBgD740Q4inWK5sSk0Wtn/6XxUKD9CJGKVHib6IOJ+bsT29jMinR3
         lfK5QkvlSiFDYxzAvVjk6BNkEmni39WY6DiNB7NgsmswnoaB89xkmuPeIZMnKGuwi3o8
         yRwQJpYLsWgMBuBEwtHnergnCoQO03WVMwOVto7WF4GVz98fvkYWaego2r9IiGjrrw+v
         b/T0XSDaH8S8LI4z1kLtYgzdmd2smZgn9dTUH6XDT+cBSm5YGkmpQDXdqwviGyQljJPg
         3LWu7pVRJXj+HE4ozc1/yrSvS4hORImBUhQmBblGX6NqGwxrN2woqeiTCjt3CM1JNR2Z
         nQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBkbv4AHnpWX+i9xdy163BcKzJX+ukMQMK/NX36CH0cVBSkY8XqITSsYvonLOglS/SjPWn0POOPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVdYIDp4aGJvWPwmfMnqrXhc5QQkzhFuUX+cWGt9FwUXdQJ/r
	szwhbGSqPECd3JGuhaSftov55G+fmvK3ox8HfOGk8vuVD5jNnxtGdp2aFGPY0GW/FvMZEELS2NS
	vi97mrBemwQb27TQw9GxyjvnOuWlVoPMxPuZ13bMvH3BDJLD5wHw2fwkseFaDGYk=
X-Gm-Gg: AZuq6aIRIb16UHhj7jj1D6RUYn21fYRrjN4rauVBHyi8LSndpvwKd8XL4ChGO7hoqq7
	IQL025Mex/+OyKVFuhTVYIO2fuDUcrFHDggiuFyAQFsFbLRXLtkmc69PWBA31IV5STkGGK4dRwj
	mPpE/wsuSFCSJMXiAyPnmqhOeUwoNFqawOawbY9hfGjvqeyXL5LCTHhDXRunzbsBhS53iofC2NY
	zHoL4+dFLyNk0HLjkObp3bI9xTUFjH9U/gD6xcGMVUwfh2w0FNR6DnYMkzRWJE6i3W0GzOEzudb
	vOKozS5WBsHjKQKnN8HeAGu6WKeNM6jRVJvoZpjUFzQdqXITtJIwr1Ik4EW6hshZpW9P9nnKHuI
	+M+7hsQ+NMpTTzHcbtCmhrnHSOVKHBhT3mZJXmsPn2EpUALevUHm8imoe7enNj2/iLiI=
X-Received: by 2002:a05:690c:fce:b0:794:d80f:d029 with SMTP id 00721157ae682-794d80feb51mr14857407b3.7.1770026617346;
        Mon, 02 Feb 2026 02:03:37 -0800 (PST)
X-Received: by 2002:a05:690c:fce:b0:794:d80f:d029 with SMTP id 00721157ae682-794d80feb51mr14857207b3.7.1770026616951;
        Mon, 02 Feb 2026 02:03:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86deesm853407766b.3.2026.02.02.02.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:03:35 -0800 (PST)
Message-ID: <b06767db-e3ce-4f68-8111-70cb6e152975@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:03:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8250: add MX power domain to
 the video CC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-6-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-6-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX9kOwrUpW+xQF
 4dLeK/ZkjJf7h0vFB9xnruO85uPFDtARfVqOJZ7srx+orgspUGIeWby7uIFzhNa0uqw1CWnaoFw
 YfZs0rnqSKOeakUqFsQDJB5znTksq6ni0ucM92nHl5zesWQPR9EngmE0xahnhNPfBuvNcQ7BTiQ
 y9j8L2rcsBnHNSGXgsgtxq3akGQGLOPdyADfqlOeF5eKsm3E/gdJfzAnxBH40RzBq78N5+yXAOM
 hA4lVvEpRdv9uOugkHQc9THab4T25pxeTXhOIpzzB1WmZTEccCX8ZgInSg97ZBXdf3ZGhI95ZHr
 Gvf2UFVSWK8eqDinYprUG/OK+1y4I3OkZoEhKhuidmur+C2jRZpqMEWZ0B//WY4t2SZ61SzAIBt
 U4f5g07/r2pqoUBhdaK9lgDianIwOUyaDMLQF8PgsV6KGWN/p5MIyjdBGbyKDPFNA0EN+7JYNBD
 Snko6f+PlwJsdkzONlQ==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=69807679 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qsDWvSvgGUoFJVTE-XUA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: t868rtr8BryyoZCpIz5i-jabcimeQhLt
X-Proofpoint-GUID: t868rtr8BryyoZCpIz5i-jabcimeQhLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> To configure the video PLLs and enable the video GDSCs on SM8250,
> platform, the MX rail must be ON along with MMCX. Update the videocc
> device node to include the MX power domain.
> 
> Fixes: 5b9ec225d4ed ("arm64: dts: qcom: sm8250: Add videocc DT node")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
