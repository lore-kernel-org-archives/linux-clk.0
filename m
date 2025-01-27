Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4CB747F
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990733; cv=none; b=OXmHwaZo2IqnP0VK01nNjkNupEgMPb4DIUwAEOgcC9q5ZwK0ZjVq6k/jfEOEkDM6yC0o+o9sf9XW7gz+oafp1G+3ogm6DijTDcmvFKmFsHPDte8pwY9fEXoSgP7eyDsOkiPBdjxrbj3JrnYUD/I+GJcDDQWq52zFLKDN8+oCi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990733; c=relaxed/simple;
	bh=0/2bJnEnDs8um6XYYODDkPZ2omRK56ST66i1OlyJEKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JW2gyJBGskStPTQfuUAco4EP+lwiV0fUlBLpu30imKCFvyftoON3Ko5U5UikKTrisOyvSdc6bpSgkmiv1YdM2u2VXwD60axrNp/PqKAw4dFD20MiKANPuR1q7Ps7XmMKBslLeg2CN+Ei/E5qmgWlWkuz9P0UhxcwNPQ1qjeVSJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGG265+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGG265+9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RD3VUv019469
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 15:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQpvtI6u3lxTYx1xzlqCxqIm9uDJhDvieISDzIxyB3U=; b=KGG265+9kok1dsaT
	jn6yay7UsmHlM/Z8GeR6dq0lOj8NRdcbVnkCK9FjAgc3tAtygj884BfBU/Y4duZb
	mAXtAxfG1N2FPdjXGLFHUxV4wf1zWn1YDYibnQLOlvw7OayBOOgtyoNDv8dco2mk
	0F7Tmw0NOeJUz7SbgEXcBRbHfGi9GFQ/iNh+MbHy++Ghsr8jKLvRvUBVuqyVuXOV
	uBhYWn7rBrnJSv/tDYBYL27oRJXd7ixngJkN9WnhNZNKuTiWIKxAPLl2CVNmGde/
	evcctEhYbEKA64Y+lA/s5bonhY3+b58n5Vp1TPM6RkwN4gNpSks69TV10fbfc5DV
	VQwpKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eapq88ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 15:12:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e43ed084so90667685a.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 07:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990728; x=1738595528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQpvtI6u3lxTYx1xzlqCxqIm9uDJhDvieISDzIxyB3U=;
        b=VhqcBNCmdkmUVytUw0x7cDoamS62GWa36Q75HSOJh3bkoIEuR1UFqfgm107ofhTIGQ
         HPmWpI9x92oGeBBAVdPtS78YHO2AKLz4qybIY65CU61oZoAhDZO6AiVORFCxAQDIAXbB
         bLijZ2JpC1bCE9c80ab9JXEA1eIjgfkk3pv/T8VC1oo6LlQk94Yr6Slyk7ZZOdd9fP0a
         JtdGa8dXjv5VXigmj8UEHHUp9NHYe3vNQjnN7y5qAqb/ECw/xFR9PeXyzMqxBEB4Uumx
         iJ197W/03EK3G0je9W7eoBwSIDM+7umAIueEt9Q4j6+ztnW6vmO4lWZyVbUPytedjslU
         jwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXyYD5Vw9ZdvjxOJyILCsSERWD9DEm6Jibtd5EFXZ9ijRYZWHD12KWUSxRvZ0A0Q3hINY4apkGTqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiVQbXN0xF/BosYIj/QM4i3Jzw5Zr77fU1c49TIk0lh8pMtVZT
	gsJUKNVq1BpsIZSWUOx6pJvGGsHQn1hav2w7W7pIoNxeiDnbSbCZkFVgRZnojs569dGc4anmYAK
	G1TX4R1n4scgdfEFtjekrRQbG7rXBQ5k1cXzn6KWr1uJ9695TY/poOoWw0w0=
X-Gm-Gg: ASbGnctQEy/awWtWscgu3GNOEiN2yVL55zLapKmh5JDs97LCaQh++gz4QvjIIX3yxiI
	OnR8TJyw8K+8esfh1FIUV93LFhyvzQhUaCLQhezHM9Vq12Y+TWjBpHlQoJz1XCir3GZoX76xquC
	Ez4MTF64wAsDYyhH9L7WSIBSSsHNoPGO9h3tplg4VvAxg2cb0EaOb1B9ygR07USnLesNp2/Pwx+
	i4B9Ik51VK5v9rXVqFYpDudJvsNKJSLudoG4fEt3V1rCA5ped2oQdJp4G3O7pNGVdH8DPUP3Z02
	UrlbdzOeweah8o5YX1/UViI66jsj1d+F0FxhyIHDi+1MjrzoD9cDh4esKpw=
X-Received: by 2002:a05:622a:1b92:b0:467:692b:754f with SMTP id d75a77b69052e-46e12ba7bbcmr222256401cf.13.1737990728542;
        Mon, 27 Jan 2025 07:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAXSyKsvfmhX3h/ssch181jhsbqIKNv4LNE3vkPaU53NS6RVkISKb6uv5OLWtSlIdF4nr7xQ==
X-Received: by 2002:a05:622a:1b92:b0:467:692b:754f with SMTP id d75a77b69052e-46e12ba7bbcmr222256191cf.13.1737990727978;
        Mon, 27 Jan 2025 07:12:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab363sm598975666b.114.2025.01.27.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 07:12:07 -0800 (PST)
Message-ID: <7e118726-b22b-4c7b-9966-07c3b1ff709c@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 16:12:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
To: Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-4-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127093128.2611247-4-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Us9-tpy-Mj1qvxHMlgouAJqZvCYcoW_M
X-Proofpoint-GUID: Us9-tpy-Mj1qvxHMlgouAJqZvCYcoW_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501270121

On 27.01.2025 10:31 AM, Sricharan R wrote:
> From: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> IPQ5424 have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Added support for ipq5424 on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
> 
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 9c198bd4f7e9..4045bc3ce805 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -187,6 +187,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "ti,am62p5", },
>  
>  	{ .compatible = "qcom,ipq5332", },
> +	{ .compatible = "qcom,ipq5424", },
>  	{ .compatible = "qcom,ipq6018", },
>  	{ .compatible = "qcom,ipq8064", },
>  	{ .compatible = "qcom,ipq8074", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 3a8ed723a23e..102f7f1b031c 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -200,6 +200,10 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>  	case QCOM_ID_IPQ9574:
>  		drv->versions = 1 << (unsigned int)(*speedbin);
>  		break;
> +	case QCOM_ID_IPQ5424:
> +	case QCOM_ID_IPQ5404:
> +		drv->versions =  (*speedbin != 0x3b) ? BIT(0) : BIT(1);

Perhaps:

drv->versions =  (*speedbin == 0x3b) ? BIT(1) : BIT(0);

But ultimately both work:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
