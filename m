Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A73F6C56
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099449; cv=none; b=V0RiCuEKlYXvYXbmR7fKuSLI6W/23vQENdsddbIPbaWYkYs0vwUyMJFO2jfDDROhwhX6oVwSLdv6WFOsiP/hsdnQ0wpkdGCM5pGFbcbjXpGKfsi9VYIXLhtGlo4UuuWd2MyVLyuE7SGWAXtlHEFOYVDMNM6zjdwx8bhxf06sTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099449; c=relaxed/simple;
	bh=mWCuAY02eBmCof7KV7ZxTm4W5InDHX5elgSJCSI8Csg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKg2ANgcZm3j1/I1tR1lbaXFJspMzl4Iq7OTD8ysUeX+JEVA+ZzBoK1yZRnwKMcUudydvb0HVXnZjR7vEY5TJq0zzfMOOROHqyvE7E4OeoTEBjtXF+4bRGz53Vpx46HnnCOcHIpN7LTFSC6n1cLSuXTpc/xW/z7+5AZQdq9vTXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdC7YVX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq1Ny/vE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdC7YVX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xq1Ny/vE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC0RZ1606467
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8t/WuqNQBXyFZ5QFH6E6pOb42vMVFxFhkMg8VXQC3I=; b=XdC7YVX6AKiqfIEX
	b/U6Q0poN6ZzC/9rRq3Infs8lYF6L4GZL4gTFB5xJXjPjSmDmp1ef1ayEStsho6y
	ZjACBiY/3oisZtWt9jSVGVbyYnjmFnxSIBs/HmYylOHmpbfSHZ1ZDPZMYyQIW/Su
	TXVnqg28IWVibZkLDWeyj7j6NkrQxDRxhevtM6jXbVFRge9yTQ3CB1y64bwbbop6
	ALByKMUbUSPkN+oIaz6/vFTJfQwXbQ6VBzolMY81tvvNFyj/earz+GJKQ573Vn3n
	72nwKLTPS1tt696rLFjEeetLspNM4xT2VDqA0sFWghH5sSv+7yqI4AZjs8Q+ZbOq
	E1DxWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10aa2qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:50:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso12193361cf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099446; x=1781704246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8t/WuqNQBXyFZ5QFH6E6pOb42vMVFxFhkMg8VXQC3I=;
        b=Xq1Ny/vEpSsLC3WNwwj/ThjCgLn7XLdybwf2PF/KVjVc8qbtojNhIKLL2jlYfUzpPM
         DpTvAeBYV6X3jKlNBGewhnLIdgYhzXPP/PSGCxfOnBgtVcKZwvzlJaeNupZhSnF7EBNX
         i51zHB60MRe5kpKUOWysPULIjmxDItPmXnkTmDY7rz3aav4RZ9gkA9qTXJEpcXfLL84O
         RbhXWlaeA2+HgPqQ9NtjkwjR3S0/hj18wmcgDhXhdGzujDKpjnIvOFH/FAmOaHBkoEQl
         XtAxeE4vyvazKAYH0p/UwA1tNIA3of4KAmIlvZQP5vNtsqjsAj5Yi5RoZXJ6A+KMF3C4
         tv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099446; x=1781704246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8t/WuqNQBXyFZ5QFH6E6pOb42vMVFxFhkMg8VXQC3I=;
        b=qh1odW/WS02QCiyisNNv8WR3DpieQ3nlR/Y+dR9tz5b/krGXRWMwkfgK4Eos7NlM4o
         aC+9fsIDQCYeZVqq1e3MbToxbphkmOjHYd7WIapLXY7jbXYe4v4bZeirjmEr+YqXId+3
         2NiLQa+KIp3B6k3iaHh1bOOySl1TBwF1BY6dSxQkQQ33stIyi5TVzqeZCaedwJyCFHqx
         baEVyjzSSDgctkUH14ZeyIZaPhGjDhjdC2byReY8am3Fchd6nlTb3jnLlPsUMnVhyeyB
         Bz0KlfFdzlkN2UXRknv1vJlU44JXS3cItOTFr9+ErDSHx2h5Ymfga3dzrlG065L56vTE
         r0ew==
X-Forwarded-Encrypted: i=1; AFNElJ80J+q1nJ5RJBruZizDeSeBLfoROgY/y1Od6hPEM95pbBOkR+z5FAGz/OZ4ydBeIOr1pfsgRjzWcdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7blcSAktx82AvKHYMDZHXkHNoJgTPR7eupjVT5h8eTOtlTrf
	Q+BAMDOjSbjaWPBvZyQhHDuQ6R1KzSQokAaPvGLvC/2he7Dn8pkypKejsMJhMMrbo67pqSRlVdq
	hfLPp54tZeujALMFPwZqOuINqxiG7LGwusF5olLr1QkFmhEWUSmJ2B35x1u5e11s=
X-Gm-Gg: Acq92OGtQ+yAOfnFStv+HkPWtuhpPs1ukOgQ/P9FmUeHH8VUrJi0KHQmkqSibBaOagQ
	OpFn+wbqfU4wt7g/A+DIMMOQczH8GA/nCM6lVs48v1U1NMBAhaFgGWlEF9Zgu/9I5yrkjuAKxsp
	0dgxrNYsmJj+c9PAm6CtCdZLbaJbzZOQYRkyJKp9t63YQVhgsdbBX0XBGkIclJ7KPFKiVZ9MfF5
	YDl/xTL2s6iQGqgUK9xfN8YQ0QwsPpNz+XL7DKQcHbwm7q2hmCYTKJCmM6HNDCyM+gYCDR4wxCo
	HPk2c4ls5BTwnEEmPb1w2SPu6Qiv5Wdkf55zCcGE8M/42apVuwehxZeU20BsOXQUXspdnL2Tuea
	nOdA9fUn2VHXCenq7w2Xm/+yWYX6J+5IcPvc2d0ZmoY1zUSZWNmZQn67M
X-Received: by 2002:a05:622a:207:b0:510:144a:636 with SMTP id d75a77b69052e-51795c763d3mr221730161cf.8.1781099446034;
        Wed, 10 Jun 2026 06:50:46 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:510:144a:636 with SMTP id d75a77b69052e-51795c763d3mr221729431cf.8.1781099445388;
        Wed, 10 Jun 2026 06:50:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559eee00sm1208276766b.56.2026.06.10.06.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:50:44 -0700 (PDT)
Message-ID: <488e587d-22fa-4718-a8f0-3d859fee4122@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] clk: qcom: gcc-mdm9607: Drop incorrect
 system_noc_bfdcd_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-8-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-8-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a296bb6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6nsel-XMCCOZ1T56_SoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-ORIG-GUID: 5KtHnfvnCkTXPREK6P4n6sLngQ_OstB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX05gTgbzGwp1X
 osG9BY3e6DGsHqCXBBMWjn7bYNStaEkxIVVuHmHjE1gI06v2iVnKwpA9Ao0yAr83FzFvnDVKQXM
 d3HFLDR1wr8h7KZlVCWKaWntcoFchG0w8UMzIY9rzb7IHRhTRBi5wU+FOi43KTd0567w0T00yE2
 X+cX+6hNsoxQo5sLTP5HJBPLbAZZqpfj9kvmQ2Pitj84F26rkHN/JK4HW0hiSVAjz1ypCpF1AjM
 i3JFCo9fKNvTv5XQMfqu2sgFF8dbFOj4znehWPKTlPyReVV2gf/xeh+omrXNQcPo+pDbpAxBpl1
 /ze4k3yM4nuL3suZNiqZxJ4cFWWmPSAo+cYT4Sz55VNOexai6psZ3pzas2W+PoLUF7MeRs1cTuC
 J52WQbXWOumBkQSrx5xBey0niSsUuAz6weSxaeC+fbfEDURPSg8I52m5p38BPdqqvRriWl7jTe2
 1hRFChe2Vi+b/ZLW27Q==
X-Proofpoint-GUID: 5KtHnfvnCkTXPREK6P4n6sLngQ_OstB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100132

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> This clock does not seem to exist on MDM9607. Reading/writing the registers
> always results in 0.
> 
> Presumably, this definition was mistakenly copied from gcc-msm8916. On
> MSM8916, this root clock is used for multimedia subsystems (camera,
> display, video). MDM9607 has none of that, so this clock was probably
> omitted in the hardware.
> 
> There are no users inside gcc-mdm9607, so we can just drop it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

This one's inexistent indeed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
