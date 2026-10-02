Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D174F4CF4
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961466; cv=none; b=IeoFc2yiQJW6OVXxbUq2+tOUkIXe0LfS0v9wPr+IEXLE1dzmc446RpbdubUqAl8WfxDgWBH5pETGlA9S+q6TGikqek3Kmvz3cbdxZx138qnZO/YC3ypJQ2zH+ySasYyUOyJIIysS95so4f4K7hSKhs8u4UlcFwfIWfNV97phg/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961466; c=relaxed/simple;
	bh=cOSITwGmcb3cfSGmr/b7iRLqk+4E6R+342jJ/eURH24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLVWZzsbevL/Ejvpt8DP4FpopVvtidFfZfsAbVNH3ekYqfFboxBdbkIIJtQ7iRMNQc0g5atKitOLgrLQJ9FMO7jl4zCqkCPfx+i9LFa666/3qNOUumqxQLrv/VTSQiK1/JHDnjOcn2zx24CzrLJNLB5qDiJqF1l3wpsmapfVIFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeyvJ7f7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV8lZjPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeyvJ7f7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV8lZjPD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H63Cn2099755
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 17:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=; b=LeyvJ7f7HWN0nxoi
	VfuPp1B5rlbqdq0LoaDpuDaHbvUmBwfq89IPBS2DFQcDK+/C9PtFDDVmmac/Duri
	0wa5FzkmB6Hn0nBNXJn4LG8NSalOejtpKKEGrT0Rd/tSMSzNBRbjug/DwoO3dPcW
	wscWeTJoKLsXpsxn+hG/79IfDoE5jIm+kk6dQ3dTTxIZq0UHQ3NTSAVaoHQKKp5K
	eVw5OGOqHIKB4b8kZ+wz1koDndZIMKVLGgO2IKLhxO7z0kJ0uFJ5oQJdommxer8h
	BUYdX3Zggpq7d6+GeMLDejLZ+D5H66nCqbP7TYNRSVkOyVGpNJk87kEnW3LDmLDZ
	EUcFug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfudb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 17:17:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a70af6c365so252172a91.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961451; x=1791566251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=LV8lZjPDUH4R9zCngxT4HGLA4h/IKEWaViP0atC5rsrLAILyddGjiPPvCjcTsQ7YHM
         RUAT3y+WJIHe5lZlCOhbQnApQYd23ztqM0ms4ePZSlqnaAz1WatbCJgz6apSjVrxmU/b
         9jTJt0lFl8xawzzUumFEjwQqo5iJKhcQkPILWMZhH2ltFS2/bFFbFfhM1lOfMtteEc6S
         2wywYIVgkksKbgnWU8lGw6OLwLPeSKg4IuDceYuVUsYVQRnTfso+dEPhQkOenD7Uv4p7
         v+MLlzuKBTXJRrEGNvs/DMbP6DGhA3N+KolgVA9FIwF10o3S3QtcnU2tFq4V+NFFvkFr
         xoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961451; x=1791566251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=E2TRUi6mZI3RJQC5qHmhHNYNmBmyeW+ld2AIZmH5Ogv2Gt5qmOgND/iCCKYy2qh6DB
         PoxBMsFOFC+anle+mgldC9a2Mu47KD3L2/qh5F5ZX2YqDq1kvVJfpMq4tC+5eEjrvYHL
         hdg3lBdmIqLto9h5r1Sr2zXRruCx3VHOnVT3o/EhbkdwbfDx8Fh7n2grhIXYFjz0BLji
         HYobFhgZ4PK/MtwBAc2MjByELnAodqk3NR5M9oENQrWAKHHs5DthjaMQ9KnglQMEkYB9
         flDmQU55TfWMNVg4cY2/vzwhCHWfWGVaK6mWiLce0Y+Vnl6fnVm9lfCmd9fM8xKL6r/I
         +Z4w==
X-Forwarded-Encrypted: i=1; AKwUvBy4LyHTlRiuVoJW66U3CWI4uj3XZTrx/4aNbeCBfy9s9UE4CZYTW1NoHW33lH9okO8/uN0xsqPWFWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLajh+h+ma7wiI6zP+wYoVLWB/FFmSx8TbS1oGQF5aBxYAE1eST
	y11tlC18wp2hbZsL+itI2Vx7xzuc3obSickMiIaW4k12fhFNFCNb7Pj2Dr+ig+f1HhJ0bxsTQDa
	y7dTTJNwJT74hgUhtQpL1NwLeeexzWIk34fwZ9WiXgFL4EqRM8gNn+/BD+C82iG8zEAXqNqM=
X-Gm-Gg: AYBFou1sQsjEf8oEkAUFVt17jmnXRGkyOz/+KPaaBWyZ67epnn5xTqvNzRwLmwwvgKW
	Q/L9J6Wqb+ix6SMdImn6hp8ydCAwawuxVINCCnM30he17GvP1fXRr2K2ZQpofKZe8j4PevsNZWH
	r8Ia0/3pqq7ZWQQoTnRdvWxpqNe78Io2csZIrmewfd2xcrYKC5e3auUqX5++XKEUgl/2xb7ZEPH
	fx8y5AVaPvdG33U0+dlOqpnGTgEWsFPeSGc8dRQVWaK8gAkEwRthzeT7xQVTZWuZK9oec/ip8RV
	Obfwi6BhUePIo/RpTRw8zB6/4JlzXIcgvxOBIc2GpFGgh686eJ/nFHeuAZBZvh52qospeJ/cLlC
	VKLACnGzOXGFgDswGkhCNJEd5T5nk
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133198a91.49.1790961451450;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133178a91.49.1790961451018;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm5295357a91.10.2026.10.02.10.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:17:30 -0700 (PDT)
Message-ID: <c5af97b8-a595-4531-aa68-6c5e6187b3ed@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:47:20 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6HyeU8LzDIxeIfo9CletUIf884JGUi6G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfXziWvrd3iwO29
 GpSkwKf73PNuNhatDW2sW0R0u1p+PrkhDe/uFUrDMnjOa6A6BKtngiZQM1gh3VX+4MtBe17btk0
 xcEDxh2HJ0PZYUKviRNe1RFytWPkz7s=
X-Proofpoint-ORIG-GUID: 6HyeU8LzDIxeIfo9CletUIf884JGUi6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX3yTR//cYqWma
 snnWi7lAOGguoOEriQxfJXeY4ukdhSkHPft07hYR/x/FPz2di+V1lq9qo85fPkE4x6Ok/cgsFrj
 XV30U+23KsdBkac45+2WP4WQy6GYfXurLdZwp+81oWOC7mJ/cn6c5oT+kTWcx1H/UHMKTEdSZO8
 fFpmKJ00wLbAiNhwbbaDqSjj8k51TDmqSMTZ9tebPHmyG946AyD9mN3eOEW9KHA+yGSlkNKc8Wn
 S7kfb1Hd3vkNRZPDlH+AGOKdTroB0VdJsAivWmo0B7uvz3hpcH2g808IS24X/2Ar2aJVSvCJ8jD
 MScS2lO7bH7GlZCbBlmTfImDslbPJNUcdSdDoZtBnJJME6kLyx45QO9F8Wusd372pmH//bcmzpF
 294WrwdM2xThVqOjyXgEZ1b3Ynfo+5mhe57JNpilMuvLt+Htvlek3SqFXDL6hCDXFID29VvO4wK
 ORyZUiM2RNGS3JL0nCA==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abfe72d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020068



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

