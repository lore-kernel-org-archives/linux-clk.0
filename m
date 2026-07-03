Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354A38A71F
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062572; cv=none; b=ZMQezVSq4Zl4UvBi32Nx1gG6nxh5fojQXOtyUzMcTViTpT9mnG496s70pYl9qncAAUtsyeYDastcw+/DSfej29VxhRGgHcb1eyYE+GbIbMnuVLFiT7sQM3XWiTJjN66WsGSQw2b4i5CcdNTxT/WI0hz/gdb+/BYnQsFgo4yN0uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062572; c=relaxed/simple;
	bh=g68P9A+dHxeL+ip9hbd/hg7B855lI6NTTBSWmJGzM5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qd9+Qw7ZCgTiFWt/3H0sQYoLJJfIrdBrkjh8hbkT4OXOUQ66ql+jA1Rf34aXSVWF5jmIYTLtghz22ayvEjamdNC3ZQp3Ax2tPQC6I2DWCWVTRTQ+yVH9JlEAWqDwzO1sGIIgSBWOKfGGVbkfsnivjKnwHf1Rwgmzg+uR8Z4l3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7WEMdh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfgCORDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7WEMdh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfgCORDQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZj83136094
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=; b=m7WEMdh71Psqfl5n
	7u3F9JF0IqWCcTOWexl6N0VvRfy5oMrOvc/BXkcpiHesjCL4ScP/VvOT+UlU3En6
	awFbxrql5gP2jK+D1nmlz49QZ4/l6UwYMeU5/cO3NbZOD0X7xH/69k6IcrBHZ/Bh
	8IlbLmIOXwy8cY19TnzkI7tecD/acGItQG6quWhy+q9jAdOzjolN0VOBxeENHrp7
	98rvlNpETm6rqijSe/TOfkS5RsUKTANtNzT5UDlua9bkBZNEOYcpGx7U9qCOBoXx
	bVqNiua1i39nlJsiNcT6TlmAG8TQdgqMyio4Eq4dA4JfVmxgFes4EVoxM0fr7EDl
	v8dyWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b59404-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:09:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efc8d8e897so781586d6.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062568; x=1783667368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=;
        b=KfgCORDQHktzNq4L1ngDUajDOA8mc4bkKDoSAo9W0R8OU/BCL+B3QqCSLnp1ZBAyIw
         8FN/uyTXRZCND9aw5BIpxkle5U8bi4iJAt/69bFvsYRcSGVYPdDH7zdu5d8SrfyVi5hD
         D7cJRbjjiR7KKQojEaaKo5FlyKvO7XNJ19pvV+tA7eVZYDsIKu0qi5mn2Wa/zT6qD4N3
         XRS5yAIZoyOwFjGfGwFzteSe8VnqvaaaIFuWOs2T0a+7EAIo74ctwNrRK+hyO9kE8twk
         vUuK1GmZ0c+wKKBdpJhkuDTJcVA2GNlNkhZPx0WFznvVEg8pNzo8kguHU8nhBCn7MvsY
         xjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062568; x=1783667368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=;
        b=fJ5UyR9LoCvKWrVclbybs5G6Py6enJnpGYdH5/tmNmChgJj9S9wvSiZnxVASjrPAw/
         ZP2FjWMSS/Qkcc3casReTeSbFAyhjKLTS1vQW7I9G8+q39nJaZRsMYSV3+OQUihbx0/N
         YRC3DGN8zcMVCOPwvyKUTk9c0vHd5kizsOYMZz6DFigDC9JHjtIwF4/zC8PWJsJ8PU5/
         YQiLeBnooQWPgOIpNY5ghw8oIVdzOTliQVzJATPWmDRO3AZ3RqCEDTG3rSTUxlDSFE3I
         m4OUp+zQlDOBdMHhnRPsdpViAhV1QTvtonqfK3YXwbgOZNYvu5Lhju6WwcHLRflWiNB1
         lxNA==
X-Forwarded-Encrypted: i=1; AFNElJ/sj/Iv0MJFysdE1WTKp0LHeS1ka9haNSUOYhQCCy6aldGGey1XCFVJM0ZhVfBvwEqe6GUo3cKGWos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfhWihTigisdJslOwiCknAxCjcFgXA9Ml1RJNhPsko8lkb5Oto
	IWmaPyt6gYhfqP5H6VTYPJvF3u3RVo0OZYnOpjKjaWDMJNszCen5sUGXv54hq2L51TKK7FiLMhN
	ySPrk7IztsM/Evucr5X3lS8y0t9n8jknm86W2sfod84bGa7XJJipFxPo8rmWmCGE=
X-Gm-Gg: AfdE7ck9o41C0tNq8YrmOKxFZCDltxUBIBw2dmGwj6ll+X7vT5099IwvH0+oG1VPLKe
	MQ/hiQ+BIGWy2AQ0T9POj/1JQaCpsgtHuqHQJyM2ZYg/mQwMDYxe/ESyUrqG7g1Fyr1eJTds2a3
	36tY1P/ZC1DA5A1FqU9Rz4v8seVn2rZJZ1NRQ+19O0zt8EpmVEBmsl5HvtKKuICqJfMrMjZS1xn
	EzMsZLvS759G1Jxg6+p+/RMajfSteesDImmw2v4gOmz467Pq4bRbmuh3L/NzrA/+THRSlXuziw3
	3d9VZiykbUSw7bsFF+Zkospz51tpwUMghcKudtH7IEfUJZNq7auYK+ox2mvgZ0u2RcGECNePvob
	oxsR5jaeInwco13SF9Fo9yB2jO2qrabaoYeU=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr96521651cf.5.1783062568247;
        Fri, 03 Jul 2026 00:09:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr96521421cf.5.1783062567659;
        Fri, 03 Jul 2026 00:09:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290794sm236901566b.38.2026.07.03.00.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:09:26 -0700 (PDT)
Message-ID: <d35dcc4c-7155-49c5-9283-a66174deadac@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:09:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX7Ha83mr4mx6j
 JjPMCQWRIKx87Y1sFopJ81UxQYZjwlmoANYzSPMGk52Eh8ZjG9Rr6z9Q4KVj58tTtzTdmmePd2a
 NGwSGZ9AO2f/ihzVtAGPgh9OhAwIESk=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a476029 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aS16L__B_HUEhUwf3xkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: D2os0htGTj3feuEXZngCVjLUiAzK5kIN
X-Proofpoint-GUID: D2os0htGTj3feuEXZngCVjLUiAzK5kIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfXwJ3zh2DilR/R
 2JTGymMhDAZ+Jgv800V60PABGPp9pwoDwZ4fZ99nQ4vgzC65rxyjfyu521/KhhGUh0NNNMxOdeb
 ohFsGtY+4fO/XdkgF4AsaLjLgWXfwMWLcxaAqNdRvJ7/oiHBrCWYSaUl1JB+N10Vsu4ghYWtdK/
 XWbq86Ni10+xotWEpUq7ucVQcObvfm/+3chrtlzGqCrYaHgf6S04SC+uatJzfPert81zI0rQB0S
 BIc3OrZrQDjpUgQUGGixHxFdr8VD4GpOjsB9ADiEw89uFDfqyWxVZzCkX1fn5skxPoeIBeD0Div
 1tIzZHG9CX+aU3PGYU/T3y3RwiJNZ0WIBWKmLULRPa0x6hJzO7FJcMBepgQ3lQuiaaKX/5UtyDU
 NfhrZOd86fDU4RCHKTZDsh5nopN4sP3kKlewjYWxKphBnWdbx1oQnwHyg2NQ8m7JOxcNH9W6RQJ
 Jl8/HSc9sBfpFxf6ryQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030066

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with CX rail.
> This is to ensure the genpd performance state votes on GDSC the to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: a2b32096709d ("arm64: dts: qcom: qcm2290: Add display nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

