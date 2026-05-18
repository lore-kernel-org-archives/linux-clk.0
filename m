Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B259481244
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112327; cv=none; b=MoYHLeFcVd4c0rIHbFwzXzRs8l19QMW/WisNiUrrH1pzToKjNvrAqye5hKJjId0M4xNKv2r2SC9ikSNpZcrUSHuvM83RCxrsZiSxhTInAsDdd1vYWokWn2OlIidGGUiDNvnnAEfgNtcZ7hzjfXvrxIRXOtoy/V3hi7a6q1DEAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112327; c=relaxed/simple;
	bh=FXhGhOfVmiifdinaXiHti/cDAtje9UjLdnb0z0rownw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duLyQYbSjfV0bXPq7CLN2W14NOaJippSni1RzehjdN9xMeR5z1s8V8ILbsBvmeOhcU12qT5sUoIumBjqFlsxr9ADB5g8/ZkN0PQtAEP+OFfIGSx5BXqAku4xbzHkdclMso3DGndXocLocv4yyxUjmYidLE8JDJNGcGXXOa2HUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcos2jyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g10XehZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcos2jyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g10XehZf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAmOmE2685062
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 13:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=; b=Zcos2jyuQgUkjOle
	EY3dTgsDMJNrQrNrgTvJ3MlLq5lTRgvxO5QZbxZHmXtH0srRs6cSAEjvE5sGEYnR
	+cepdzwWfybZI3ffxBoXqly/IZA6SEkM81HqIwKYuQDAlwCsrDclVrsv/qdyy24p
	pbbg9W5ZUIMH9mITfuSJovmP4pJc82cFoxXIUGSaxPHYHcFyOSqmBy78SKInICrH
	4SjsTFn0d2ECxvCMMnO5g2L5/o+5fs3K0WJM4ifxV6Gc2Rre1YhAPS2PEn5cmIlp
	uvpcs50hYs4uNSabCNCLB/JT62Q9xT7TXu4BfI1n4SkIUO9rsoQVKPM98IhuyVoZ
	jyTA7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbt244-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 13:52:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb0b93e90so7576021cf.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112324; x=1779717124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=;
        b=g10XehZfCNW2jypL1KNwtjEzQv/CVXpusEYGFrtS2Le5iMIfgWGt9qp1j4j06BJDe0
         W/pzixhJ/G6emM2zVjJit6W0EsaZzPChMenCeRLPpFxks0RJayC/8r+IrYIDoPUpYaE3
         yA2l4cesYYxRW6zZdiJmFRIY+HFtHHSJDttTwGs1/mgGO15w1qO0QQ/qDhJnh+8WK9tH
         zz6acmboj8kgyfdjB0wXtkkloDyTJSlnUF6nZ1UVwloYvxLBh0cJ6SLsr0INRO6EsteO
         /6MJQAn9jccj5y82UzX7btQpeDTdgeRW3ZjhyPt58qWEfcG9TiYQDALuKp4M4a2rkdqp
         ofDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112324; x=1779717124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=;
        b=D1Zuo25K8esXS7jTzoG25G3NO0w5Tc1OKId0h448bkdPqO5VMFht96djIfwKE7SFGr
         YZPU1aY2Ljt1ll6tS/GqDWiuSGayBQOsosPKpwo7H7UELrIoUmPax6NiUDkLM5gPJ7Y4
         Flrj8xioiyVcC32NAs39+/KbjYTAdc28DpJv7L5jxZNHqgtxqGRGyRwpo1TJ/T40DMHJ
         55kkwaxEcy8/Kz5nFoJh6kpBO5y1YAZ7Q9sX676GB0IWWNq8eTz18FCZSv2eOfBj2MJU
         bwGgSQ1KQfVqae/5jqmJumSx12ciw4aH9W54ijf1atK/IA+ZqGveCNkCCFlPanY7sCur
         8J4A==
X-Forwarded-Encrypted: i=1; AFNElJ9JJwYm+q5aCdLLvNx1SSr4uhZh42o5xbSFwbTpF57CKV1GzjpSwcv4Yp6NYdJJxJCWrGGBwSG3aFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrBUwsZ5rzYiJE69aSbvGDF08Fwr1jiH9qwE08z5F6KZ4n5DD
	CI3UBEySYWbMw5DQO+F8KwIwDlss4DcXcW3xBWMeLQNkR2xlrxY9f3JU2UGwClj2UOntuMwSzJS
	QZeZWtYrHn29X/0jjLyu35ZKkIr1zgGPPbiBupgZ9v3k//6lbbBBc2VUOQZG6j68=
X-Gm-Gg: Acq92OEtZFpUSlwFZu+Mq1geHU5omJNk/afBagHYj2cul+ckTM/2LTOulf73EIlouWv
	VUJWXiDXx9C73F9kUx+9JXPiRuSjoFM9Ipwhl2UBbZ1ENXQYFCTKF+NkVcLSNtnNr5E17odz3vu
	V2efFi1icN6sYQCvlOPCsqWBPW8NQ9LYd8Z2a7L+SVybM5l+6KYs28UvilYTZJ63AkCClb9qMdh
	RH46eoPn+KCeweox+GxoX9VIdIwAzEbbIgQpkY4e5LrQ1wLB+WKa9wYJDlOtuR2CRu+hn/YsTGy
	a6+LktMah1WNDydO4FNUmwJxaCCrA5GKYtS7/+DFQjOVdE8GGCBbgo5WEGIkMIoWvd9HfqiwxE6
	mYKZenKgv/0rLHYQpXvB+ja8JiNv3j+fNhHG79UFw6RrtwjYPEA8Tbk93tOZcE4yJcfYj14wFZx
	5k7HA=
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr167894291cf.5.1779112324257;
        Mon, 18 May 2026 06:52:04 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr167893831cf.5.1779112323677;
        Mon, 18 May 2026 06:52:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec7c4sm584341966b.40.2026.05.18.06.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:52:02 -0700 (PDT)
Message-ID: <72203cb2-b010-4468-be71-8be4af570acb@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: nord: negcc: add support for the USB2
 PHY reset
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
 <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MSq-M5DugzyMLx_xp2VsY-S8DasAiUJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfX3fUccVqTQdhr
 CLVy7mC2Xna9JcQUoBCE+0O3dX1eD/iN3OWmNsilAecLXvgtu/6Qn1esV84Mz2qrrsFRdRV2dJC
 ix2WcgUSE4RVKXkNTRwzKH/PIWgHlwge7nPbvF9hRbNzx8WQ40X3KrxzooeU0U278bn0oKE7n7P
 c9nLN4Jg6iGut/PRP6XdLsd8FSMMDNcXsE15LoDuRwhyB5Qtzr3flo/M2F7YPejzcuAq9IbzZAb
 x/UVyntMBEJs14x2bsEVXdsSpruQ/ROQg65A2uCgi+7LNSIKkXTp6DXSb6k1ftI4HPf1mwUr/Zy
 zXkr5AIi5xbC2XtUu4E+GHCTm5Jj8yIy3pjI0YmFM7BJVMehW6Q7vUP5/UTwoEejsC9NvOWGZ3j
 OGnJZmTPDPeV6DEqiriiXfXxcEoh0nHFVmHVJUwo0LvDec+Mu4NEkuOQgqWND/gRNyKmmshPhRI
 fD3GfmLHSrqbap9p0VQ==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b1985 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YZby4nD4H5Fmm8mScNEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: MSq-M5DugzyMLx_xp2VsY-S8DasAiUJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180136

On 5/18/26 12:34 PM, Bartosz Golaszewski wrote:
> Expose the USB2 PHY reset in order to enable adding the USB nodes in DTS
> for Nord.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
