Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155B209F3B
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150954; cv=none; b=l3Fj9FlhKSUoloL+EZDM7pvTijywN/T3gldphXin8acurWdezhZ8jBcYykKbQdgfmJewKJW/gjFPHA8Gv0sJokx/DAs7aMkEP/nydeG4bYz9UykJ7EahzNMv1NUfOy1x0vHb6GPmscrFX41x0sHje+e/zH0yrYdnqXKmRsZweGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150954; c=relaxed/simple;
	bh=lV9lMTRE+rP1GquD6QBJiIY+TgHJs5KZUV4RhHhEU/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dW1TjVa7A9Fdr46Rpwk6Btz+gd1z19IfRRNlTvHjZRk5CyzdpcIC3kegw5FZykug/ALH9ZbifLKwKzEZTUglkMqzZM/1w/zwGu1abnMkcvpLQBS8Fgbl1/zUveMVL1jiOwDVhPEWp7/lzXHSkT42iSCLPxYRNYF5rEe89p0pr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLNzZeHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLNzZeHa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28XqU2022919
	for <linux-clk@vger.kernel.org>; Mon, 2 Dec 2024 14:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmeCm5aFHseUzMvIfpcFK6WQhteQllJVpw+JfUL/Cq8=; b=gLNzZeHaaPvRCpkB
	MPwOZODo9pA9Fkx4Lpamj1wVPhSUQs9r/p+Dt9KxKSLHH7UC1xrL/Tw3Nc8hMTjd
	AJtfc0LTply28tozixQyIDuxnVu+ELWZb1DrHpKCaWjQnMKWIFKzUM0AHs4C8vvb
	cDl+HR8SPcca6kw107EoCbpmoxiX6Yzn1GhcPTacxegdJZZhXW1QW2oz1B/mSRhm
	ETDG95Q9Pr9qr96Uf6Ra5G1gN4cjHLN9ps6P/uVswRbm6wibWLMX131Q/X5FR1rm
	hlQ4VWHlqlqFh8YIgn55wGWKrUuN2Z5VKdk9sWj/nLV3AsdXSqQtlaYKa1PMEL28
	23Z7gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gd60x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 14:49:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b66a3c352bso15168985a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 06:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150951; x=1733755751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmeCm5aFHseUzMvIfpcFK6WQhteQllJVpw+JfUL/Cq8=;
        b=inhlP5yU72+zSfa7mPsCmDOMMuY58XvxK8eU40MlSKy+JoMaqZ6IOfg7bWHvH+Fj8k
         NsEnebgRjurdDPluYlvBcGF/hdCKaTg3Gv3yy+OcMdxglJG8/Jom/v2onD93KORinfhI
         lq+MxWMafalKoPdmL6AJmo3ncigvoSgRxcd6UpoWAgzpnN6wBWv5+5T4WMXiMReZ/j8H
         S+EwVKbm2Tj6kg/YnoYujeqBqn0bEXODJfTTH+7kFJxhJhck5QtPHH01zjAL6BfH47ss
         XLvcjAchJM0NBBaaUGM2Z3hsEPTAWifXXoldA7vmzNJy1b30gkaNxMCoA52aDW9oPs+F
         Qzgw==
X-Forwarded-Encrypted: i=1; AJvYcCXc7XMti2AqdMqApzOERbmpn6LTS562Ylby3wWhILUuGIGxZZLB5J5ud96qThhseP2+M1pe4Chbhew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjh0Xksig36NdTlN8079BRznngALPzgtPvX9rP2TC3/hfU2pEZ
	7X1kwoH5YEe/ueAFoeNluE6UbJw0sF6kJxJ3dLdoQdZf0hGIRVatcmaYl9p/fvu1g5ByHY3e0bs
	PxVAQS4ZtfuGOEcDuM1oN9NGM0s8x2YccIgctJYvxn1AF9hCClYQBs8MVkvQ=
X-Gm-Gg: ASbGncsgYImoYyBJR/URUl4/tYD347OTz8BgXgcwfkJbA6uxOfmgs68hKD+37/Drw+S
	9n7mf1DuYlcTBCrzxor/cYV3XN3xOw+DRd0w+K2sStnB164Lb17hLCNiWkGXzeNACHjTT31EKby
	Xa4oOEZ4UihoS4GlyVPkZkTnNkuV9GZFY/VbO90nI9JXgsNo3DDeVBaZgXFYSolV1ewYGdEQpE1
	LRVXD5klPbnsKnCcqxf8uGjouRNAthmDGEqkqN5p8il+1a1ccFwh7KaIh9XsB4mbxJlok+GqbYD
	qUJjqepxJrvFIbBh0YNZgoRKZIPasAo=
X-Received: by 2002:a05:622a:19a3:b0:458:21b2:4905 with SMTP id d75a77b69052e-466b3697eb0mr170854661cf.15.1733150951017;
        Mon, 02 Dec 2024 06:49:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY/b2Xr5JSD6hv2ERHwLqk3dGl+X1CZfzk8QAzncEpwURPmtvtEf2h1Zi+fW0WrnFt+XNHrw==
X-Received: by 2002:a05:622a:19a3:b0:458:21b2:4905 with SMTP id d75a77b69052e-466b3697eb0mr170854451cf.15.1733150950482;
        Mon, 02 Dec 2024 06:49:10 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a3fsm518659266b.119.2024.12.02.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:49:10 -0800 (PST)
Message-ID: <891bdd31-6b5b-4b6c-9c63-eb0b3d1389e4@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:49:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts
 flags
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
 <172375444790.1011236.4126358525646189263.b4-ty@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <172375444790.1011236.4126358525646189263.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RxG_0FOz87GcRfPak17ECXlDQZF5VKYx
X-Proofpoint-ORIG-GUID: RxG_0FOz87GcRfPak17ECXlDQZF5VKYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=794 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020126

On 15.08.2024 10:40 PM, Bjorn Andersson wrote:
> 
> On Thu, 01 Aug 2024 13:21:07 +0300, Abel Vesa wrote:
>> Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
>> configuration on machine suspend. Currently, the QMP combo PHY driver
>> doesn't reinitialise the HW on resume. Under such conditions, the USB
>> SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
>> RET_ON. This is in line with USB 2 PHY GDSC config.

Your commit text suggests adding simple system pm ops which
essentially re-run phy_init would fix the issue as well.

The docs say the PHY can retain state even throughout a CX
collapse, so this seems like a band-aid over a small cut.

Konrad
