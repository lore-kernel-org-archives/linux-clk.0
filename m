Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6EA3101D2
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594754; cv=none; b=ZHuF6Sg4kyJDZaJYRzGyGBpRtecDmDAyJapyVqUiQEcL6CJm3jGaf+nwWkm5PA1LL2NStl+D918POA3gpRWZkSj8vNlYMvRo6Woy+bHrcfWfIpdQfZTZF4rMvjpT6m840cBhtli7wdtrwELoir6bTwCfRckxLz2ENFb09mDpZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594754; c=relaxed/simple;
	bh=qZT99A4wGvygQo/mbpD9bqNrj3QS2VTse6d5hqYvHDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMX1K/gLmR3pKN01doodWa11VNji1V0qmqFViV1lCQmkY/MTlIUCAxHDa7fF0PmBCks9Ow8ScsjcW1w9dbwz4HmUERJSg+BFCyZUygBUxiLL6Gb/y1pBWsjdJosvpHYKXUnz6c3VlAPRxvGIgRAwADGA/fbchExv0ouxn0yWL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAYc4YUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq+45n4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAYc4YUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq+45n4B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18euY62725198
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 13:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMHOAXmr3YmGIq7eETPhJdWo+t2yPZRgpbTAHeL+27U=; b=hAYc4YUgF/bj3x6U
	hj+ilkCdw2PWkCSWt7b6gk99b47qrHZaaUJ3FKLpmsAM1e4rP1Z+8lMx1YM0f6Cn
	BmnvnNVgs9/LpWVJir6z22WU8FEaW5V8Is9xNS1RXcYgJe6pszxuX7MicWm+1FeO
	RIJcO0U653OYaYYMZCprfHv/jXQD9w1BeBKzLaNmJIDV66zeDXXK5lVAUEP2+kwj
	dPOmMQdzygov++pE6zTTK6exAXrmp1wu47UXlLKUK8jrt1fs68fkqMMlgpNgeDtd
	FMMEbyF32LsW0+hMd53GZ461rF0u90h1UzbgNKMtukKiq0EMPuN2zBgO+rTMaSgi
	r/DgjQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvt2ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:12:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-937294e4697so21080241.2
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 05:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594751; x=1765199551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMHOAXmr3YmGIq7eETPhJdWo+t2yPZRgpbTAHeL+27U=;
        b=Dq+45n4B9ZKCP+F6C9Uf8HTWe2kMdkMdF+s88ZOj9qdymPhudlgtx6LPtlwVR93bLA
         yFp7fNKjJPZliGGI/DUuXsZO67B3qko9SwRPIWb4kLC4+0Dvbhsu8BzEDk7BFLkFuZvA
         /rjyn+KmvRXrZRHMzA6xcpShO/RMLK7vl2uHV/AN/73NDX/942xS0hMDW383yVC9EkOT
         K765KSCjjP1XEb1ZQqYnqZPhWHqqG0vLEluz5inZS1Gaop5rlrwb6jmG+uiTZhtFRl8w
         Uht+0q5fzrg3/JsfIEhUfd1nEO+pxzI8uHpW2rOR2hJHVXAOtoH1CFv788AhJAZsxy68
         89vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594751; x=1765199551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMHOAXmr3YmGIq7eETPhJdWo+t2yPZRgpbTAHeL+27U=;
        b=dyHUw0td5KkeIMVSnRvPIPq9HvUflcZrwe8sGmNwxXTxxR4lc2+4gz/7gxYiS8c+Uy
         TQTPNDYkHSDN9wmMyQVt5kqADiLNek3qnk5oXX+/480iQraAP3rp/n4JpG51nM2i6oda
         NwsNX0Fvwg3CSUGLHxaQDqUxtdhe4Tshdi8P2rE9ncCz3vaQLR6BSgpyWYJsELjHh6xY
         UBfBS+TGj3MtgpZ9m4SdDrFeFxjJ5b7dvWP0whk7QiqsTWTiaymEvYYMooTEhMNfz0hh
         5RdpbOKmFuAuvmN857R23WLoPJnDQplOFAw1HkVnY+4M5D3FkPxN/sULi9+ZpK8Lk0hr
         hlOg==
X-Forwarded-Encrypted: i=1; AJvYcCURnSHqHpJVgRHK7Y87X3+ecITBhO61blnulXvfyIcWHe+NGZkPcgX6/Ib+z1e0dMISkeSBMzqaa8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8sXyPi5A7FHQSqEA0k+73PLlA7pm46Yb4Y1nqWWtq9sFPL/R+
	9hoWhWv5Q8ivoDY2uw/ELbdHDzEAD+FmJP5Dq6XuIZPVX1SXEIa/gix9abOQh3VYhCdT89udrvq
	JRG/fOeuNLbWOpfJklWl0kPvq4LNIDM5oIyZFwvhAMoyKhQh2Os2kzvLKMxzVLkLI7c1xiB4=
X-Gm-Gg: ASbGncu1aLtx652RGKAfHKVUIksMWpFuZ1bkMwoaGMYDY83NSNGnTO383Mx4APLwWvj
	Beh4sDwUv++e1iFBPlZwGK7kVZ7ImoNa1HL18NIR91dWyRiBMxnznJf0/KjpAr/sR/5sGI5cdeB
	uKkS5rK8exa09yD2xT8/jgRv7WFtxiCoC6rWeOlR3rMn7SEapf3QWDk3RBU57YL7HYvPF9LVNQj
	vt/6e0MZLQZnF23hr28wzUlx1RRxjEDoeVlLZq4fedNLe81eTWdxbH4wVeTKZbD1+ISwU1X6q0V
	QtfuSDyoREhjipCLleNO2DVDVQEE4mYT4AKXofnpf2tR5FgQO5Pj/8w/vmwsZTOktf3qGE85IoM
	+U3EpZ4LBQH2CKgeuLq8T3fOU7r0pTr06Rk7rD7upxnL2LN6mhlWXDM1w6V19qPkZk/8=
X-Received: by 2002:a05:6123:590:10b0:559:5755:f461 with SMTP id 71dfb90a1353d-55e40639171mr287816e0c.3.1764594750624;
        Mon, 01 Dec 2025 05:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpxK0t6iN/wrOGuP/7z+DJWA4RkBD04fhs3p+FuEi2WWZRfG+MzisolUnEIWJCAWxf2Z44zg==
X-Received: by 2002:a05:6123:590:10b0:559:5755:f461 with SMTP id 71dfb90a1353d-55e40639171mr287799e0c.3.1764594750234;
        Mon, 01 Dec 2025 05:12:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea41sm12434761a12.7.2025.12.01.05.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:12:29 -0800 (PST)
Message-ID: <af230b94-b56f-45d1-b8e7-f2b9d396a30b@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:12:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lY_CjfTsXYmO0UVQSbi9gU6vUcE9hSZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNyBTYWx0ZWRfX49/E9T88KENO
 fOjJ9Foff9IKwVQSmefIo9MlbEqROzwuoZcE5k2QCG3jUAIb1wUyjovEpiOeu4Qh6oQPTPn66A3
 H/x14OKBoeCzgEbzCW8Mcm0Ygjh/KSPoYFEGnWXNjX3yikkOA9ZHTv0bui8+4vpXup+T2ss1JpF
 uBfclIHiXUk9UlgBFoGb+AxsddVPjrthjdZldVt0ngUT/1yZ1sLCjy0440G4CHY9zWuxSgXOoTv
 7Yxd54GCjD7mTAkQTGhxMVGWeWsNBi1iOsNfE3TcXN0JaBs4rFqdecUPCedBqirUCiLmC1lkP8N
 hT7jFGaKFBS86O2BzNhKZpZPMLqBp+vIGpCYvjGUyoMw66l1/pvOwootX/KaVoJBJjOSCgi/Kcb
 b4/xeFfyjadZDiGLogqSV788w6Xh8Q==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d943f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q8HXKsudzEDKmgny2zkA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: lY_CjfTsXYmO0UVQSbi9gU6vUcE9hSZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010107

On 11/26/25 10:57 AM, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
