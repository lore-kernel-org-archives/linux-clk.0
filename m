Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655859;
	b=vzHKuVw3yj9hkkzpLhETh7dvHAfOoK4GVLVRNaFu+fYdoRC0Y9M7en1hJAIvIv3EinH7
	 qpO5hKMcBtPm+3NXmynNcpskdkvXNrTlw95wJusxFxH4KG6q2PYUfdL6JinB29JEst/xk
	 +riv38XaKXOQZ5C1wbZay2897mCCS8N9LZ6A/VRBrlJ5EXH5hyCXDNQ1Ucthp4+r80c1O
	 pdYpOAD7yrpSPZgSWE+fdt18ZC8NdTwfvnntiQ4/hgr2OHeTL11wBpZfVhO9CpOVgW6gN
	 yJrZEt1ayWvStm6f46/hfkfwp9OhuAkcM/arZ5qqi3jOIKwhE17cn1cJEW7DY1EiEmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
	b=aKAWHawrnbEbYGUebHapmjaCqWN2gDjjrDY+3jpoipk5sGygbeF9L9dq8OdRUcC4xuUF
	 8JEoLPZnOc3jopPnYyIytumfUUQHeEGIgCGRnDHk6dCx8LOEKtj+Rn41YI18JwVj9nOai
	 yLpinmUTF7nxkUq3YP1usj8aTo+VsXxRrw9lvHaqW6s3A9eJpwnWa6eghX7reXbs5Gywy
	 vFjJ3ogYGKfZaB/Nl3TsHtWQ0OzClXBXsMnBoqv2cb7yhEP15Di+jkwkm3EACuOhlAG0c
	 1aSpoWDPzPPNGPKktaoLaw3kksdKOYUZgFdUoWgmQ8Oi9U2Eb0l9Z50y/sLTCR8thCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPanwcML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lhh1YjOn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B7606A31A
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPanwcML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lhh1YjOn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7054I4110618
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=; b=XPanwcMLU450Nny1
	O39Rxj7Mb+9DMrJ2NOgxIRdOPoAcjE/+Kt0py18B2SJ7+Jz1KwERJV/AEUlk9eqE
	1B/F1FiErLSJx2NY+0dUlwl383iEHHzpmXuCosLdH6xtOJSJlRPVjQt50/lwXiwy
	Byhn27ASflHSvBH4TNJso80dtGyW5P6QEEpI98DFny67Q/eW/re1bg8bT35GVYsc
	xAXEK0LTnxqSPBXC3BiY6usvA9Fdt1sXYwpVDEiGb9mLQK42rggISvvFxKPngCg9
	ciHC8B2IZNpa+8fgijztMhpIenzrd3wabyq9MBdP96D7+LVTiPsvyRGW5xC1PLlH
	V/8p3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahbjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:57:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so36113485a.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655857; x=1793260657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
        b=Lhh1YjOnTO9ZrF5YTTqwhlurBw6ktKR7VWjTcRDjGGSdL4mRRS7iLAtcJFdVDPELcw
         vxbq4/S50QuTeZeoe/WQsVXY1RLcdzdcdl7IjJ5crnvb3ALDJJBd72qDLKUHGPKStBw7
         K9ZW3FRiAVA/g8bcpPDkO/7/D+FcDF1hnyjj3+SESEa5r14vc9tXlZ6bGEAtDLPsN5e5
         Wh+TQxOrX1cmkHsY7KXAGV6y/Bsf912fpWcwT/gw6OWqWbbnSkcSR4ZJy4sRtc8xZ6gg
         equD74pr2A/M3LUlaIlaUsNQoPQaEY1y29TBL0kp3JqaubdJ1o8VK9QWfpP5DTzg5NYG
         q6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655857; x=1793260657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
        b=jd0TR4bMZ6kUIQELnuEnag6xDwkDD/qSVhdTFfrcaD9mLTdY2ZK2dpEL2e3j0jyk/f
         Kn0GT6blYYNhykmTReqVvNiS/MuhUNnJTaN5VaP5J3Bvk0TP9tw5hS+99cpGzEpgkMye
         KiGzUhEeq7WqqUzYmwxBV9x7nnORKbT1A0tmeFVrkNbrreJGfYY1LF7czSeO4EaEZ51j
         KAFvTJNxRDZqOQW0nfONJNuEmy7BKhKuBw9VAeg3O7v5RNpciFrV1gIZw2rLzE+dQYNx
         YsdVQ48zfTYdu3/iHJRZI32FYWdrcJelLPjpNA3lmjpTRgHpOTwtysgp576hC9mVodxm
         WaFg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Ow6x3U9ec5hkIdcpQPnHgUxeqbmi9SKLluUXs/jIwPwfHFoSAllHM39htwlOhrcSrEGQaJPLaWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzJ7fyXr9+NPQysBQSUvBZc4tq4VuKqiiPP480KTqtHWJBQl3g
	f7I97tnUtkbgbBVhw5yJTIu8PI06uDL0TqVtKN7ONlLB7AA3JwhAwdQfLP2nH0Q07DdokgzQEDv
	DcTP3BdXs9Puz5MYt1+cu55R1UJjJfjkX7dpMabALVXu13yS0BrBxlaIwAeGH/Zk=
X-Gm-Gg: AYBFou2F1YSbF3ef+9XOR8U+/eomtux2bobzl3SDdcaVnXu5FQvYOPZ5KZs6Zbdnzl7
	o7quSy6A36dSg7Fn3XwGi5+VjKJ22z06+hlO3kSR+DmBMI583agozMIWxaciQXfImwlfkPsSA/l
	8xKExrMwBjR/6Qenpf2MoJvIItHyyitYU/4hai/bJ0ZZRsEp98oIkW7V3VqVlqTLaz/5ufr2WZ3
	APjW7/BAuNUlfLJIyVdXBckzsnlMsy+Di4OmHrIP+Hq/8Vxy7gIjr35D6vX83T/2F9WWd4cmq+H
	4B/wQoE/DCbl+tNctT1cOhNDx+yN0OYhtcFNclrvHxqWy5Dmoi4w6vFWy6ZyE4mJxDEp276ihj+
	0JZXaTWcoBYmYPg4HVkqQKw==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr930074285a.2.1792655856902;
        Thu, 22 Oct 2026 00:57:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr930072685a.2.1792655856386;
        Thu, 22 Oct 2026 00:57:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafd6sm1582801a12.7.2026.10.22.00.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:57:35 -0700 (PDT)
Message-ID: <8bd5b87d-b5e9-4594-b3eb-cca14b8b9667@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:57:32 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across
 camera GDSC collapse
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-3-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-3-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXyNtAlsdVKJBl
 cO4rM5hOppM/DeEDjMjgRUYlYTexInYhojksQ+qE//n9jQdmZHY8/H+xyaxn8GhajU75R5zADfw
 LIlIim9Ln87d/75FstLP4NvkADkS8RuJ4oZR3YGi91WC6Oor2RbGeFv01er//Oqu++qVziVU4QY
 /ztMOkbvewvEdkBOesNVaQaPzEFgGh4RUZ5Ir9LgRiUKEmezyzYB0Pv1zExJrvlsJgNKyrLClTq
 AOHCSOgUyuD0i5EDCdBHjc+wyUYnEaU+hT5rkHD8p/jvY364tDSARKAvucD3ZxcsvLDjOdtWd3O
 958Pjb4sylu5w3GDSQ2RahQlpT0dnA0TM+c7fLYJHVagixvkhL1FagkJBvWKfcOzstzCAfXngYQ
 kwt+17zm1sgx2JTUSBE0IWUZahDs19hFc/vzo5qZIBU72C4Yrkmc8rTheWmS16sYSUQpcys8pXK
 a5XKOWS0k6qhsmBM+dA==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c1f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UF2wGm-gxhqBw71OckEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SEYdBnuxD7WW-gTv1OpwzZgjcyQRD-oz
X-Proofpoint-GUID: SEYdBnuxD7WW-gTv1OpwzZgjcyQRD-oz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX9NaBBhp8o7g2
 l4fsobSKMxXqpOGG7//ZQ11cfY5mrH1DnUwHV/CCMurVhFohDR6ZsEOBtX7MHo9tGA+iHlrpH60
 /wkQfMncEeWFsw8AUus9ckQjbkh72WQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> The camera GDSCs are collapsed between camera sessions. Without flop
> retention and with the default clock-disable wait, the IFE GDSC can
> stay stuck off when it is powered up for the next session.
> 
> Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
> and the downstream camera clock controller driver do for these GDSCs.
> 
> Tested on the Nothing Phone (2) (SM8475) by running repeated camera
> sessions.
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
