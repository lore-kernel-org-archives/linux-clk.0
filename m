Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B50411FA6
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693521; cv=none; b=cn1FV+baIvZtOfjbsUfU7A9n/v7VrVTBy6tY8IC1ZyC3FmBjoMUdDTfZPZs6S0v5BRpwCzbyFFUUBUhMeYkeidKVjLFnbJPMuB2nW4HVSCCOeEXRGf95UqSMt36ljKiyPJUMdAZjHM6xkMwAcaKWyB73wMjvEw4gRgFUqSz3/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693521; c=relaxed/simple;
	bh=43VP93M2bCuUQt4J5zmUp5pqSrHi4cXLggSwgWzuaiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PX+GzP+9HpepUeeXOCr2mpp36m3zUzOzXfiUH8IYag4pRqpQ3f3bsfQBL7Rqj6hC6ggnb+GEZ4Sj1h4Ef5iiTM/GPpcf3GqWGVEn6SyjG/MTWYdU1H3JlW0G8AGvTp+p2tvoD6b8EVL0Ibu0fM7S4Dd7S6BrykGmP2C6UOUWS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Edlwjcgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfS3aFxQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Edlwjcgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfS3aFxQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fkbA736489
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Re82H9AabKnC5fSLI6YMte6BlqAQaCg3tkq8ao0UmjA=; b=Edlwjcghl7ohqAmZ
	SIgVvj1wkl4cozP0PfranZPJAploNGnv5EtekAnUxrfRHfqSIGfuIUXr6nUQEGLl
	rADfxu2iKI5A6StpNrXyMdQOcNnTnA/y7jepk2PbOKPrMUgADAprBooDFh80c+42
	Rjg7qKY5V/+/3PcZ6H41EMnd6leB2bxP00n6KTdh9hc+OeL49P6Q9qsNarGiwctY
	UcAwhDlVUDaj3xzQvANq2/KL6XdHZ0++9pH8L/nloCiJHRJr+BNRbFbsBZJSuixP
	b5xjBo3dqWpJuA1u6QN5EL+SR2yJlb7I61jdgKCpnY6m7kxFnFhsZPMEAOOmHvC5
	cLqlzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f303q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:45:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1587057a91.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693506; x=1787298306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Re82H9AabKnC5fSLI6YMte6BlqAQaCg3tkq8ao0UmjA=;
        b=QfS3aFxQvSy1JGV8Pwn43dB8LxwL95Gv0h5kxCu2NDAhPQjydjKv/yMg+Lc0F1mxor
         G5qhU8hN/zcKuNUPNqXQ4c8a3I7yJC984Ax5iakcTLroaGt1ttGgmT+OZHIqckOgwbjD
         wC1uBIA+3WHzL0QoPhXlPRTtddZ+7gJRKDij6Ur3aj3plHC60YAEv2D0mTUBHY84jApL
         WQtQ8HYQlSYgObxEuZzovN2/8NSijY1taXJcJN0n7+Imexggi2y395Qh/pcVU79jLyJX
         gvSPsgcCoR5PP8Oii7AfxuPBZvsWEBrU+B2Imumfal7MLsqhhAT8jAxCmQicUkV7Ao1D
         X89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693506; x=1787298306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Re82H9AabKnC5fSLI6YMte6BlqAQaCg3tkq8ao0UmjA=;
        b=qsLRYpSbCrGrU1wIWf6+0p8rZ6vglVEoYiD9h0V5zTXzIIxCWaPnsn0hBFE2j7Bbb1
         JZr25cy1CB2aXn0vINoRMjZY9v3Aw9iouMbTVCRugED/vsCYwBD5kpS3K/Xf+lg+jefm
         66UDCoEwaN5bCMoQVA3cDN7ZPWbE8xTxI1v4PbXilK6q7rkvotIsCeL8N3cLUAb6TfAN
         pAhC49Z+UZ+bDfVG9m/HHSe05avWn8+0hWVGuFGLBNfzuKWZO75xMfcjtd8F7/jlfCxz
         HgyWoNZnOyNJcW2LvVMhpd9h/t4kHMaGZ2oddYwr1PFr+4iWWvpbLWxBa5PTabVBjXZX
         t/FA==
X-Forwarded-Encrypted: i=1; AHgh+RpVDPntXKEd1f0AcqLUAKFRi+V8DdJvWehkLvPdoKAwDcyLYo99k/BdXiSYw1EwrxJYfDhJ+0eDB+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyIaKfTcQGpZMkFFPWfFdKcI9euUoRHlqurAa2BXkpVSTkqOd
	LIwXrefaBJ8Hj98dlBLQpphZXBTI8X4s3afEryOpMfUvlOxzxhmJX1PX6Zb5XFkyEBqi0DI+5uF
	bp6/O0ERovWWh8IL9aFVgUq/vRmhparmDyav4pn3HAbLpwjmNowE9eF1i25pQ53U=
X-Gm-Gg: AR+sD11yqtDv+ajBFo9KxP0RkxIE5JqS6mLYYSmMrP/xwrcsM57BW7cAxUqbOXcnyHV
	9vERZe3G1XSN3i/aXWQqyaggKiughAAGvHwgy5SgKIt6XWrq5r7ODAL9Y5kLukhR09geq/rHbhA
	CRrwwbMgfWZkjxPW+BqN69mcjIvS8cXff3d/cQHwZ2ZYvkUo6H3G5P/1u8dZmesND6B5/5Lpjl/
	jpe5QvOvEU/rQyDsp6oSnXxVKUDEpTLv6Uu6mfI+Qq8TX7c2nB5DiIyGgl43uwOysBfnan+aTPT
	NjHov2r1P51RwHmtih8HNywp7LkymoUgeXKASFu5oqlUhd/5ov9t2hkJWh50/AbYXZVf2cm3Jhq
	y0aThPDU9jReG6Rw3cGY1R64FSm2l886oB++IiO6WskgJAWVexxc7VCBKL9jhOMvP//c61g5Sg1
	Cad3JpmWihQ+iT8b+APqo=
X-Received: by 2002:a17:90b:4cc4:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-3933b927a55mr4432357a91.18.1786693505557;
        Fri, 14 Aug 2026 00:45:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc4:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-3933b927a55mr4432281a91.18.1786693505033;
        Fri, 14 Aug 2026 00:45:05 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339b2c1b1sm1061663a91.0.2026.08.14.00.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:45:04 -0700 (PDT)
Message-ID: <ca6818ee-82ce-4cb5-be6f-055372cc00d4@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:14:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-14-5e0ede4a0c72@oss.qualcomm.com>
 <20260813-audacious-cockatoo-of-brotherhood-098c9d@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260813-audacious-cockatoo-of-brotherhood-098c9d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7ec782 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7zRd6dj2QFuN70SSHgAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: BqHXAn3aRoC8Thp5o8mT-LAyK8Gr5ozL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX7KntPU+Or6t+
 lbjlzm0NvKzlksILfdEkvgqHulwx4Fw1OHy/wm5UEWN5dDia43/iW5BfzixBhCl/dED9JBOxnlI
 otZwAvkbrZzq9MhKv5uGz6uhwmxGeOtvnSO9pcNsgR5W4pYUZs6rkkT3TuwghdicAzKHjTOoJ7c
 bma8ft+cX6DRF+mUpSDF9pr06iYd0olf6Bo3cWxWgAmNf2i5MA2zKDfFIkjeTzwMOqsc4SeKzmZ
 PAibOp417Uzy0BJAVCisHCIPdYyfdxzx89v3g7Qr2VJILAi9zZqVzCzp1EP7akFQ53Bb91bSFxC
 Dz44EN1RqbH6RyX6h+c3ylI/GvyjzfAlw3WowrEqf9r20Rg/WV4sAI58FoOy8VtNMVI8d78fopZ
 V6uSNEHphKRxN4d3kHmjqb4wSp5y1lQIduBJQr2tjp46Nkiwp/AKUdatQfA6ZqmBSDvc50pznPE
 zvGDt03uHY20yc6wXMw==
X-Proofpoint-ORIG-GUID: BqHXAn3aRoC8Thp5o8mT-LAyK8Gr5ozL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXzKB8izXagOIM
 9Hn3hLcK5SV0FGhY4a+BU0tFb310NTVvx5Oe38PrS8+NGGPVDVDb+GXnSdjyPNLKnsbH50M9T3T
 UWNKGCva1cVmQlLIw9REC0I9PQRj/tU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/13/2026 3:12 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:57:13PM +0530, Hardeep Sharma wrote:
>> Document the Qualcomm Kuno IDP board and allow the legacy qcom,msm-id
>> and qcom,board-id properties for the qcom,kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index c7c9a9279684..f87ff5d923f8 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -174,6 +174,11 @@ properties:
>>                 - qcom,kaanapali-qrd
>>             - const: qcom,kaanapali
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,kuno-idp
>> +          - const: qcom,kuno
>> +
>>         - items:
>>             - enum:
>>                 - qcom,mahua-crd
>> @@ -1322,6 +1327,7 @@ allOf:
>>                 - qcom,apq8026
>>                 - qcom,apq8094
>>                 - qcom,apq8096
>> +              - qcom,kuno
> No, this list cannot grow.
>
> What you miss is to update qcom-soc.yaml
>
> Best regards,
> Krzysztof

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

