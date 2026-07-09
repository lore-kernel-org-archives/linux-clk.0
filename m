Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDF53F9294
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593911; cv=none; b=k828c7n5YbkDYBIEqNIK5kmNnGu4SeDp3QOWs1HIQY6iWmQh9LSOAQHjnqiF3mi7ZceQ+/niE4Cb3CN948+rdK24OExiLnTlUMAO2ia73jueIKRW1jNQRrsV6hBFmVRvVj+MKXNiQIueYmVvYI1tve//V4+H4jWzlC/np7CE2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593911; c=relaxed/simple;
	bh=QD3manX5WJLWHwklT44Bd7vdgJYfsMpFHVdu5gZjIIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGPHDX7EY/Q6E4AXu/PgjLv1rhm3eAAbAFyJThWZfYvb4Cpvz7B8NZjSOaQ3D0ffkoaxMfq6eEwYYAzjnvyzA8kkgmk3i/VkErTSZpQnBf4zGeCLSTfDRH99Rd3wSbqYOx28hmhF++UrjwdVeTrOKrZ+PiIXAC8VmxypWcSGI/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYS7QpqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeneMEE6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYS7QpqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeneMEE6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ai2nS1361960
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 10:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=; b=SYS7QpqNi0NA1j7q
	9icx9AKADrt8J+HVynauUN4NPfaAvw6XreQSsGDrx3StTaPlQaRUQLUhzMkHICzn
	nja7mE1etjXlot8x+lpWTmxBkRsV+ENUVFFNBXQRwOkXvQdGLgb3UFeH/khMB+Ue
	G6yTQSVBHQuTi8E7SIHjILpIQdSg0YJCn8gLGogaCGPTMKHRl2UnDxzN4aAE10T/
	i+87tdF6gX6MHyfFA9VQUceGWF8r0t+AlKi+kSPqnmqy5skc9NnSNEXuAqaOCmk7
	ynYaymiz22+PWRJvQjQ6FD0gg1SE3CyH9+I6G/hsH1x6NM2ecR3gUe8EnE2kF4cD
	ivamhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhe78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 10:45:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso33434085a.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783593906; x=1784198706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=;
        b=WeneMEE6z2DlNxYeGWMRBQcygnOzgc4JXcCIhNemYy0c5ykymDNPvHm79tOAcx2iGY
         A4vGV9g88HSPh1mDhMpN31x4ISaVIBVXAXJMKJWz5nwrkQxgBB14QC1ejz9sqG5CtbFE
         ZBWuxbrgZ/UtDIDzpDqEtuiEa4lfsinrysDw1Vab8FJ+OH8Xg+c+0Mn/V9bv+nU2e1YY
         VnRDHrCCAu3cc/EwQULoHYncyx4WPWaRq+NrknuqnSMJ6iLeIPqwsSnCOdm08RQG4vNT
         AdVw4h4yjzOlFd3sB102cV7aYLkTAFbtZMh5hzkEblrID0VIho3I7zIm/WqkqEM3Xs4J
         6lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593906; x=1784198706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TukoVQ0gaDRj7ld7E34mbrss1dmlhmyy144jGx/Q9fc=;
        b=ASkZi61AwKcalfXYmyY1vWoXwa23uAbA4Qr4wSS2fnMTJiYbKR53RW869p3Z0c7T3a
         E67J12lfu1aztJFr5T1gJzmiVdsfVGk5zwRLWMfHjV3EP9heDoQV78+hdyfi705av/VQ
         CciiN94vvntuLbPCsjRz2yUzC60EMuNJTUBzIZ1radF1A13JuXHZQqIwtbhl/B4cV2+e
         7OgnVlotRbpryMEOE1tqLbuzER+56vsHQjRnLQyZFo//1bec5ZMfl4wiqaZab+TKn618
         uJwhnPibDC66MYNbLCZUl099loKL7BXcOnN+fYoGRu+P4UlUmKhCARXr+xk7s5bv0cNi
         GTiA==
X-Forwarded-Encrypted: i=1; AHgh+RqqSSW4QN4JRWjRv+iJDX0/xxk3nKTtm84uzR6nNsnF8VZsfg31imQtFsUTKY3n21PNhNNxWtRsNjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyAXxSnQR7+EbNNUIFnAOg+P3ZLUA2Sg3Ahigxf1pPfrwOgeN
	e7B9a4YRdB/lUfQyW2ZOV9Fgone+vdQDYiMfgr4SPMS77ZMIWloOYG0Z2iO46eZcCu7K3mE9T1c
	yx1WY31UB73F9i75WaVrmECla2aZK+nrOg71RMdwlAYh9H+T4a2Tuq5Kx2oGxb2U=
X-Gm-Gg: AfdE7cm7YfXOkOec4BlVHyZrzX5Xd3We39i3yJ4WTHVkk927g712qDduGaSCOB5zLsA
	al5KhzHJgD7+GHkb0jx5DounvdqNAi6BxFBHYlBxrL0EdMcCOjqHN4kjwMS7lhaQSovbN20OKSd
	jBO13rT+kZn7GzwM+FOKnCpicMyGi4N6YOkFcDiaD4Yf0ljPmeFRjeCIAqu56q6wUmqvhML05T2
	3xOGRcnpPU8j+LJTIuPOWIqmP2VWSTZnTxDNvxr8hCZt+9+dZRk1ZKw0wfrKAjVlKNajksn7hZa
	7pEjRtaxZU21Jtx3OVwGZDiwmkz/HyQuoWDGEBYv18k+awgA2Bjt/kY00R8CJbBUt9f2vD6DNYP
	eO/Cpf7eeX+7/tA4TvYEtOeKOp+3pCKEIszM=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr276072185a.0.1783593906117;
        Thu, 09 Jul 2026 03:45:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr276067685a.0.1783593905690;
        Thu, 09 Jul 2026 03:45:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada05d72sm465024266b.53.2026.07.09.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:45:04 -0700 (PDT)
Message-ID: <89a2537b-ed04-4444-aa1d-698b0f998fc8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMyBTYWx0ZWRfXziRLB9Hm8RU2
 j51NsUwcw3Bqa7M4tpu6w++9gAjQKVbbf1m2ACRUfkGFjk+/RXt5UFDC3mdSWBBPm0HdodeCjGx
 jXy6wvE92I1qGV90r2T9HZiuQX1ubIupurkBynY8eQKEHfqYrxLi/R+nLl4Ln3tx2Tcw7CnvfJX
 dxfjL/WzyTHFziI/6QTl6ureHQvXfAUvfti5YOqscRIY+SJtvQ/siatuxcsFu329/hl8GorkyYw
 FYyhAG3HfL4gy/tPQwaGQVWVfIOAL96xxuuJFdaayvE+Wt5Riy/77aaJw+ddC+QhsKnN3FRVHHm
 dRuGjx0Mccpd2OqJHa87mEJT9mqaMolAUgBh9I6vLInECtH80TxtdLs0sIvNDlTIyG6kGyW6QDA
 DTctoWV6T1aGGiSoEx3Gnw7XFxj7Gowyz+FzQg2qCfK61DhC2VRDjBcV7TpYas5NJLyIheK/RD1
 HRucGlVMB8PwZcZ3QNg==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f7bb3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMyBTYWx0ZWRfX/AbDAjALZYri
 e1iE3LqhI4uNox1spMgLa3ZrTxKV4Csz+D3GYd9qNfaPpPPBuU4FjY/RWQk2fjutRLnirZv5vSj
 I+oMZafTCcMhOiHvFgcZFg+rwRU/+74=
X-Proofpoint-ORIG-GUID: ee6NsgqVwm9sWxBNZvA0byI5WHpyzndD
X-Proofpoint-GUID: ee6NsgqVwm9sWxBNZvA0byI5WHpyzndD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090103

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
