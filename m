Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CCF3EB81E
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322626; cv=none; b=Kp7nmG5cqFx/o9FbcSaTyvmo30jfuWkMdL404HuV+zLUY3/ttnPJk492TM0dpNqP7sQIzWNtfRjfy4+DAAJH/pYGLFw0cn2ElxgvDsrvCkcBafTLA10jdffIr14etp7ENUCtSDTQutt07Hwq714V9yKerkad5OL5G0fD6AF5DVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322626; c=relaxed/simple;
	bh=+FbqNQiPP1ue45VHFOQzbpOfAIBaspppfSJIDn8MjvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N/kuXZzW3F5QnjCaIcqUdBPETwBFTObJDswuQghZDS6auKzbNqgB00afdj4pj7DkKgeFhZ1AMg0D6GYmGEZVH66OCNaqg0lO+tnPbmKZl8e7436jSH8GcUGNJGPAFUjJxm4RfIXRLwl/AglzLZhQ1Fp/7gOSn5smJikaad85C8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9vIV5Vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdEYRg85; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9vIV5Vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdEYRg85"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cUI3470523
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 07:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDeEbNyNCk/FdFbnFlOXQ3KGhP0Zs8lX1We1CLbz3gA=; b=J9vIV5VxmE+QqO5R
	ALD2ikVuO0t0GLhjwUxLEqwU8B+QsctlZc33sgSzYVApWNt/DGibq0WoihhOAPd/
	EZ6G42FE3hsWHy0mX3464OvDzUUOJDPhkmxzle3jS7Yg2m/ByZE27U4WRFLfiTw9
	F7oU0pAhkkS80F4HbUsBAKzK77Zc4qlSmHBUHZ05cv1ChATBKSaf/mj3gLdja+l5
	GOQumch/XaBMllKWsqTEH9bBuKjy3Me8nTGsTnS7ODGl1NriX8b814gwS9jHpPv0
	0CysJuJDbCkpwa9WOijsmGoi9sT5XNlDMntNIaNbT+4bkQjXcKPE4MZ6MqJX0LOk
	oOol1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemw4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 07:23:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe2607511so4052929a12.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322618; x=1783927418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDeEbNyNCk/FdFbnFlOXQ3KGhP0Zs8lX1We1CLbz3gA=;
        b=XdEYRg85Ky/Ijf2foibpHo0Iig/wLEIjuEfKTYA4ezCnfxddTfjk0q0escHe1oFEOa
         7+Rbw7uFfy7szDIUjPiBn5tcn9WklLQr0xsZvPxNLTg2rkHzKkW4+fT5nwOowNAOvc+W
         LFMm01W8IZMoL6ajF1aQ22Mvk7/PHvkaREVVs/bEmBT7S/SNwqJc1LtetEPHEb/DSEDW
         zlgwpVqe/Fhms6sGgI6Y2LJMGIF5Md/cqb/CfX6gTiB0HSUBu5DApP8grEyc+Qs1YFjA
         hKn1dnkYqU2Jbads3Ok9q3oi6mOu4p2SfJ7M8O24+hemz9p4AVDvVC/RlASGnEj6h5ix
         wOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322618; x=1783927418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDeEbNyNCk/FdFbnFlOXQ3KGhP0Zs8lX1We1CLbz3gA=;
        b=daYScyoh5sHw6JWyc3I496XsuJpejEHlTin1aW0E8LJ0wxezD6n/vUsFINuVWcOOaA
         kVx6AdJguQuVI2JB+mlj33x7gDCf4LqyAGWdSOUsu/4FS24RN8kkeGwU3oOqvMGGeSiF
         rd1RzDpDWq84h1nTUbN9jKv48Xu6YH/Z9EK5zXlpZgntm3P+VwydV++iS1Dwb5Wzpyeh
         mK2vvRthyB+fk1Rc2MSzp4g/y41ck5KeXcnLReJYNdE1MeNozX280Z8dvmysTeWw3q5b
         R+lYTw6WRKVRO2cDFB3jW9+0g5EVNYgBbBrIfSIBGr6FS3wm2XJIBHYq418zDsuKIVIy
         4jlg==
X-Forwarded-Encrypted: i=1; AHgh+RphDVQAqNS2YttVDg2hC6FI5se/Yz2JPa6ZynLQDumOgHEdL19dTQIZajA9y8/+sReshvRsZnO2Ib4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhmgTbOqXPC/oTieT4xxfjKQN8oURsriXW46YgYLssM8N26iK
	xfVP9EDhy2zgGxp3rDsCsnKe4P1p/FyrBWkHdRI++0SRr3BRNzMt/kCd/V/2gUWS7GU42NuDfnE
	dA6aT0r9lx+WFt1OMA9Dx9tdEB72ut8mLGX05NUnWNO4KgyZ7hyPiKVeUkQGhLik=
X-Gm-Gg: AfdE7cn/vLJyDvI5JyXSCvT/VBy2Hm28dsCjH7xOeIQHkTszfpLEoKd8uW2yKt4q+Hd
	hNKQ/ciOU12T5O2w0AHN57U1WsA2QWFIq44LFp7wEiwN6Dqi4beCTanYi1W28en3kDSI0rgYdCq
	lbVwIIpYMBPfdZLVx5EFAiZm1Tid+WELbxONlbo5AEf5vpfk/vB/2kZH9BZ2uhygKN/1/OY4mqz
	vEcTzNMsIOak2GwxThz6q7X+jXpfbjncaVlIEs3cYW/9XQvogW5XRJnzXHtFc2WK1lPilPoEBYf
	oJWox5oA9F/tW981WVrTAdqPySD6X7HCagnbKraVu4s1F58lrA0MRzzJQhfcCXxCC2o6tjVlZaf
	tcwASgEI/RjF/UxsoJcy2bADbLW7Fi9f1Ni6iz0Y=
X-Received: by 2002:a05:6300:49:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c03e4a38c8mr9692784637.38.1783322618405;
        Mon, 06 Jul 2026 00:23:38 -0700 (PDT)
X-Received: by 2002:a05:6300:49:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c03e4a38c8mr9692751637.38.1783322617968;
        Mon, 06 Jul 2026 00:23:37 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm5369288a12.27.2026.07.06.00.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:23:37 -0700 (PDT)
Message-ID: <eab88289-3450-44e0-9ece-7c667dd92ada@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:53:33 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX7zdMvOytjNlF
 slJZ8gN4bcKnHwPcHoRlyd3jpkBo8YGNKe9sCipf38OZj4GK9fX1HYFNxQJDMBHdyN5j+IERifa
 hruzS2mOEq4tugi9TXHk3UHx5CkEoS8=
X-Proofpoint-GUID: S8GOJjJQQQfG471xB5PF-zlVB6ggzbk2
X-Proofpoint-ORIG-GUID: S8GOJjJQQQfG471xB5PF-zlVB6ggzbk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX6g70Mc/FdcP6
 Dw97j7/TPC9V8DWMA+T9AZhuEFhu96WCkeUU4PUvOKHlvQCJ8aUgokLRxuy3BQfI+ndxD9HmZNC
 qZG74uHZHG/FF6jcOt6RmrfCM/rZSSB+stR3A42fXkHzpqnxkUhUGqK5R32fw1kIulnib0FUqs2
 dIZt/XqPSb7rQqZfpBRNyPPR++MlduB7LKigdwPyjV8kOpI+gTgs6bST7RSo9kDGdwKAXR1a9cq
 yboTbgYpxdnQpqsBTJPal6O2qApmPBC+Q4AIwdaNopcphv3sPpB/QFkVKB5ixh9d5kXpAvRqDIp
 fLTNj90JmSjt7QCSjVZkAwF+n2qc/vlgEpdzYUIiWEOB2wBX/B462950+yY8IGvwQNA9uNJzn92
 mLivBQv0PEm9OMiFcoCMSgbx17PLA96P7RQvV4BoXwBFakKNZ1TWswd2hfGkGvO6WPSXub7KlMT
 Oxp11Bot8mLEZ0jKxQg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b57fb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Txh_R78aUR7e7X_yDP4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060072



On 7/5/2026 10:48 PM, Krzysztof Kozlowski wrote:
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-x1p42100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

