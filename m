Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3AC4BC023
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580109; cv=none; b=kiB1EuHvl4Ao9TMC/CGCL6JKZdconyxfYjtSMqiGdkmZiiCJOAkTnn+fcvBeEIUQjLwrMfbI8ECMIix9EWxBKhBHdunVwx66r4GUT6oU1u+mkOfE0CU1eFJW1/ip++Kyv0iAdcuQ2wtZt0pX4tN3HZ/ipiEJDa9UN4+ESTf3ZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580109; c=relaxed/simple;
	bh=M4MGfksm2KJNKz2SopLwjPKXAvHbsbcD2AS/jpfC2rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxA0Dxw76kxWqaj9VGrTYHOtlXMCwukIm8+UnrrnTPNbtenqRrtjKvbYa0Rsi+EfOhAbOgsyCbgOG+zCcZGKcGCiv6527/XW2skRzqAh5NvX/uWKiEH1dr63tv6tB4HQ1aOKaDIp/CCzpNZo069lAQVxnu+QX4D/GxRFJ8kqtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kR7zxMTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S71nK84u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kR7zxMTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S71nK84u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5R16P2995966
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=; b=kR7zxMTPFYJQouA3
	p4DGnZeq2/EBw6uokAjZBrAa5nUZ6Mi3Kv3DQrbc59yc7W7qZ4HZ+xZTVUMxsk1B
	oEoyy+azEPCOx78k/Yp2Nmoq30gk4JODkltXyltyrjUBQc1KYMvX1Jn0vcIj0dBu
	YG0FcxAIskVG4+AFcERwbuBaHJquZZZHCjBy00e001lhkdi8S2Exg+fDXqsG4mOu
	NdI5ySOTUP8Y5lImAiYmg950I/HDfab+vSkp7YeTe987hItDG5goSgJ59DrHM04k
	sKW/eiufLRj1UKFwNsXbpVUt2hG76jfY2FZSPgCKA15m9NI9/MZh4UHzQvI8dv3Q
	QrriaA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0tn00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 10:01:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631337cbe45so236678137.1
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778580106; x=1779184906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=S71nK84uxIthK45lfq2uYXeWbKd0tbFtDvgDLJR/NmwyQE0mZbW3zZ/QcVAbx8/GE1
         Z6A0hQyzos05az/8KbGEy9DAbdUWcjeWMk5bmyUzD8+trvZEZMlhdmseSu2bu3G2jovc
         oWmnBCmVxhffgpgqbnlMyTSR46oQYvEHYKbQkiW7JexbvgaqBWk8Gen95+HxYizmTna+
         oGFbQCFCOyFlPeaM5tRQMVNZekLiL37WPlS2LAvmR4YtUdtwlZH0bTH8OlBTI2QOmh52
         IOjqeYL35So39JKOec15xzKwwxvTmpLD9giJEaGcfnmKiNL2MLXGDHk/3RaSONXbQhQd
         A5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580106; x=1779184906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=CBcaM+YFizyVhqRS3/IP7Pu/Y6PGeOF01M7JiijziwHhS9w8mwOKxWpFUpWYKoaDSP
         tQ4jDlLl97N/GSW+iBZj8avb2z/UOVudgkgwCcpNpO2/+fgAVynn/jYl/lYiLDBsA+9Z
         NZNL7+pDtZWzb9cPp5Q7dCuGgFVgYpq+59S1SWSHTxteY0ttGCDftgHMCl56TnbO0VQl
         Dt3EVPS7EdZ6EvAHdn6PO+ElYOib8/RPGinSC65I+YiDrWNGQKvA+hla9Kd/j5VmOj2P
         vqfi3VoMQgRFLHPtAOv9R/tibIPzc5pc7sZ588Td7JRyDzTNRDUj+vReUqQxb0PP2qvd
         QzcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gkAW7NBvJVYQzjsgcC9/B+oFOERnavGykn10knSr9DJ3Sg8E0fu5KC9E+36OHW4gdF3aCsXzVVXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZj140+qCFy41SByYicggJaBkYYAt/4Oj7xlu3qEDU4Q+Cvk1
	vobx4EGMeZX+afX0tiDTxAv9TuCMipnCgeW1LzhiL7ivvaZfQL2dAUejCVHhQ/AZi7iyL4rrzes
	bxIJFSwmQ1HrSlmQQafGXAcCxrLPgs0JDyjPV06a8AeSmrEGUMCe2RZhyLlwJYNg=
X-Gm-Gg: Acq92OHsJVsq4IbuQ2nYIS57b386AXhMfNQNYN680ieS+9jS7LRPNjx/Y4FXg0fS/t1
	ziUtyYWcb0LaQqwbsa4yDcMbZkaaO+x/amkBqcfKj8CgTR8ePa8w9dZdxmJeEy3Q8VN0aDUBFM4
	//8z2+a3O2XoRQ0a1P50++J6xikahJ51p6Hndv7gMC2H8eRv9F8yXM0vRExuGq9IhpPX6RU7WDg
	Aja5/OFKv54xwbnJsf+bzwg87Wm5QyZnsCFx8yIN08UHI3dh5Z0sODo6ralz9Cr3otC22TXQ9tz
	lS5pStjEFLtPxmy7toZIeY3G3c7/T2e/YUnFcD3bmqKHjyUySgoKeq6G3oQ3xcT+9PBqcLmj30A
	cnQ4WSvToAsxp/3tDF7XIb9lOlN1Chy51u8ONAlNgqhXsXV7fVxX+9rYgoJiAWebt5AKZ5QfhYe
	I0Be4=
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781359e0c.1.1778580105619;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781318e0c.1.1778580105090;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc57c12799sm492515666b.47.2026.05.12.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:01:44 -0700 (PDT)
Message-ID: <08d1fd7a-c782-4d8b-85ee-1b46868db343@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
 <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02fa8a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=alOFDL0nBBd-F9mXlB8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: CS40kS_hA2U-43NP3u_F2a5kBlIrGHtK
X-Proofpoint-ORIG-GUID: CS40kS_hA2U-43NP3u_F2a5kBlIrGHtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwMSBTYWx0ZWRfX369VKBEoWaOR
 8qONmFLrewBGAaVIPAaZ7VkIzPw09B8PqDjXshp+NZkn0fgv4Jt5VvwmgWIfMC9QsxXZ0wDvGKF
 n58HxzifWj5BuBmkXQ8tl0TqO9e9XoYSvP5zXIq/7hPTy5ZchzpNGg9gELCT8dEjxiOZ+v3k51P
 GZp7gPn+EIoPkusFz/9BpADdkIx0X5mmS6KDdJzR/kJgISeQz4MF7qam4+Iv8jwLM2yS3QdR8+B
 Mdkjp6JBsN7AHT6K09njCME6yLsee/FtAk/shfjo9L6hpPUhqQQ4X9gHIISzrLEScQviRINH5RC
 qhDkukoqiFsAnN7Qx9suIYKlW4BlEG6bYXseIW7LkJP6ueQ5dQRhV8u8fr/cfLGwyc5PCAHA4p4
 fmcr9lXyRQDGq0CKNORF9tkFCLhTQ6jtma5lpQfzU7wiUVIK0DD69oIurI4hHLf10LIWzH0eqc9
 6QhdnfjJxk5h+PiwZwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120101

On 5/10/26 11:47 AM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to pass their control to hardware.
> 
> Venus core clock cannot be enabled if Venus core GDSCs are switched off.

The downstream device tree suggests the reverse - the venus_coreN GDSCs
refer to venus0_coreN_vcodec0_clk (and venus_gdsc lists
clk_gcc_venus0_axi_clk and clk_gcc_venus0_vcodec0_clk)

> But since they are set to be hardware controlled, they can be switched
> off at any moment. Vote for the Venus core clock to enable it later when
> GDSCs get turned on.

I understand these words but I can't see how they reflect the change

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 45193b3d714b..420997b00ae0 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  	.halt_reg = 0x4c02c,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c02c,
>  		.enable_mask = BIT(0),
> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>  	.halt_reg = 0x4c034,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c034,
>  		.enable_mask = BIT(0),
> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>  	.pd = {
>  		.name = "venus_core0",
>  	},
> +	.flags = HW_CTRL,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>  	.pd = {
>  		.name = "venus_core1",
>  	},
> +	.flags = HW_CTRL,

This should be HW_CTRL_TRIGGER, paired with a change to call
dev_pm_genpd_set_hwmode() in the driver - this currently only happens
in vcodec_control_v4().

Konrad
