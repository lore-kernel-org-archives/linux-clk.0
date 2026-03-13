Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82642390227
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398734; cv=none; b=XYzNTjz/cAI4r2SmWiHNlILSdfHy0AIqn1A8cI8+8HTueDU62TajJatun4rK00RcURFEDDvV+eQSMTswr40GzkHdBQ7ismd2YJaUY0zHxgilPF0kCRlWhq8gLS0aQ7lncyNVclPpw8LIOD+81uVTJpyV1hvRRqF4ffmwM1cbxWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398734; c=relaxed/simple;
	bh=Q4wE2D/Z/Ep+mMePquJMAr1ovxZ6c+4Ub9tu0h8wEuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/HfFTmulecCmWrVdf5K+t/Vgno0LzhglQuy2elBbRKZUE27Xrj3TBQn1gE88pFWpAx7DJ9mbgJqWsnQW8nPG6+sMJoXH6XvoJ+ksP0ufNDOQIjz60ucO2HfUDpwsO5JkJniM2Ev8nwL6sxVZtgKkYjRO/JLMx/k48caMcUznMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkt+qF9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBewJpXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkt+qF9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBewJpXo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iViB2262758
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=; b=Pkt+qF9DchPUJZLX
	up0hHaSz3nVPz1xxowc7KtOhJXJ3K+bW0aKaU4wn8sEqa0l8vDGgU8u9GunZuFP4
	HYaOtKH8OKumJBCZfyMPJ2/1r1xdxDMqQq81GKZ7LsgIX+F2XiNcYhAD4Vr7Ud77
	gP/Y025cirroUnfixHVW2SYa2nyaH3uBUM9p6NsUfJ9bSqWqU/K2ilZrW+4tm08E
	p/aq1ODxs603Mw0O5f+mevah5tFdWRa42S6kQGJNB3UC7N+uPJZExbUvLvAW3zJc
	r9ywk99FvlCT9pXgZVrBUQdOHuXKukg3L7trVHvmi4WB0xjxGkucy5VUlbMZ5+EJ
	o4KmzA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rn21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:45:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f6011df3so14544526d6.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398726; x=1774003526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=jBewJpXoGvZ33zlCVcJuQq57+lgKF/HLrQS2tgQxjjsMbHTXGAkA0lMYuSiv7p2H+0
         mSZB/jqg8BVte4y+ApcC82geg1+sQk+eX9mbkj4XInG6/f3FPS+1zdMngoKoxlgJWrDM
         kXfp3FIHfq9jDPkQJYY8p7X36JEFz8VHEWJitMoUo90EqIf1pgaRs4ikJiPasSCjpfOi
         M6LVSfM+rfHJYrtGG5En/aK/kKvXxyNqmfeoYyfc6e/OkQB3rLTw5QhPu10ccHFcSr3m
         jTYAD65Eo1TPc4DYgsn6t/yWBo40M7j7URW1UG09Ka1WfzUT38g6W97iqA8zucXFCHfS
         x4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398726; x=1774003526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=GzD9/KflZD/PR4f/zdSrYSmNP8hBV57W1sutWHtNelVEaHlR9AV3swSEwAlqUAPEtj
         Voj/MSp7sMXQZNi8SQPO7X3xO7trZ1S8tl2J9YaIdQcyMDnlJny786hWmdf+isfMugYq
         rFD4Hy2f6kPwF5G+YlsqI8uLFQNQwLgy1GZA+94g/XBDd/V48BrBixlGi7MayQhLqcq+
         CbDAzl07zGYYA9rqEeTS7wZD7pFC6Lzha4kUVqwnZP1FBfe78sAE5pCf0nxGC+tw42FL
         hNnUZI7z5sY1uQ+BPcLmlND8L/uJZvwo499ByAscV02fWZUoAUkFimaylqtxwmqSPo5h
         4o6A==
X-Forwarded-Encrypted: i=1; AJvYcCUVD2AEHv1mwvohlB69J4Qa6KeXDK/G1wQA/Orf+kHX6FnHlCR7hy2NEJDGpmFXifCjXkzq7C69VcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDlQvN+xWjJ6hg8hcJzXV8JLvJx5hl/AHnmJG4Q4eEzalArs/
	h0yBvHHZI+jRvn+ilRFnGwfUt8Q0TnLo29WmwdoYbTwGvNg8vd7SQFG74rA1gSRfYnK/UwwodMA
	JTv/1AndXh92fLhx8bvRTKhBqucKaxPLrD9eg8pmwvr2qztRJJmNrmvGHu3ln9yQ=
X-Gm-Gg: ATEYQzws0rIc/KO2uXEKI1PBbFbxUEbv2pJnHQnj+yp1DTbT8l+koUan8qeU2oepDKQ
	8Qbjq9ugQoh8F2zhNR6LU/brK0bm5xAik/KrPBdR0SkYXAJ3OKyDRMRkCNhOlluL8vMUuTNrFGj
	3oOgR+wJTi0KJnh8PeMfm1q5rYcbdov3zvUj49GzOGbCeedbmq8h3KfiLKGIL6JrYTpPNmg5sKU
	ANUy1P4JQnilxji3nDHMhlzpj8ARUxwgadHibXBQmoQOqx4T3u17WvtxLD9LrWN0sO49VV9vZ7a
	XMO3JxFjnIOe5SsaF8JpCXgnf+YHb2Tz2CuuFJOJv/KtYpu16cIZm+Uqm8tiIpcD1P/3h9lIdb9
	emd9a3WzhPXSOLWKnOVdujiWHHn1BDYxUqwYymSk0KH8l/bD0fyIC+4X83XK9VKOwKDC3SrwHV0
	TtuVg=
X-Received: by 2002:a05:6214:4e14:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89a81f51a27mr30450916d6.4.1773398726427;
        Fri, 13 Mar 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:a05:6214:4e14:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89a81f51a27mr30450826d6.4.1773398726051;
        Fri, 13 Mar 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b7722sm36376966b.66.2026.03.13.03.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:45:25 -0700 (PDT)
Message-ID: <15d3483c-c593-4fbf-bcae-778cd960b458@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:45:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] clk: qcom: gcc-sc8180x: Refactor to use
 qcom_cc_driver_data
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-7-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1F7V68uQs4N91y8wSu-YuD2RlXgIyX_H
X-Proofpoint-GUID: 1F7V68uQs4N91y8wSu-YuD2RlXgIyX_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfX7w6MEmVyM21n
 W//VFI7C+fGr/dS328Fnb4Kc30Jwxn/M7eaFtgUQMadAcZ9scudWCFqsV8cA45e+d0hE3JBQvPG
 KWJJq5mShKAXmVmok86uJxl1X1QZM7y9fY/b6DVSICOrT54Htr8dgSg8PJQjPkC7vd+AnkJvY+9
 wPqJkbTga01lvwveqKi9pIggQW1f6/lyMfdpLHs+0ysL+X/A3vSleS3vFCrmLD+DEwfY/BuwJFV
 5BGoJ5bfShJeaPFGZBerrykn3QuiwsLE91K98K3tep6Q/RiLT2s6BtypWX9VGRC3IuZUpdk/YRF
 ef/6/TsYxFpV5yP1KRJLsZ3ARdpE3IhLJsylXVXPPqTRsFU+GY+87d4lzDBIb92h+/dQ7SmQQXQ
 f7mxSXBPp8TDXJ0jH2DP3J16/4XjXPIaafdCW9D6a3vSg4RY5Hg2ndRr1jX2mLkbSO7TnUZpIgV
 q4i54TgB6UODpY9aO5A==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3eac7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ma-uBWqLQOsuroI5m_MA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084

On 3/12/26 12:12 PM, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
