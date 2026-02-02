Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348542DF126
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026560; cv=none; b=Zdy71hN+q0uey5/UfIYz1T8iPIGw+dNLJivqEEtRq+CRMgVZuwnejkqnzjsLKh/qn28vNJ5h1tcDaiANtkS/W3JqHpTsA2uWkRq5FP0jPuAVGzxDT50i+7aL8BeJsHoxI7IXhjGFnfHIfYcDyE3hIffMHhwXp72dCIm30AxSTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026560; c=relaxed/simple;
	bh=JDSeexC0+JEFNCPV/nFoAtVuXSlVMpI6OdGFK/M9k6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFZkkZsIit79MIRlPRSssTR0OInVcqQL40Ca4zbBlJ7+brIcsGAb6XG5rmg70+Uw1auA7WtXsXxPTs3BINYSB7uPmeKL1hu1HJau8kuOO1lmvze802T1MmyQceqCnc9WBKREvC2Ux6lFNuNg7yrfT/PwNLkn7XrgqZ4CkuVvkFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G93WKS+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RelfcC7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G93WKS+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RelfcC7/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127wMLG733449
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=; b=G93WKS+AhHzdPX1h
	z3wSHCpza4u4nh5QC9t9MYGDXmNpzeM5weAn/OFUK4H3V5tY+YemhR/u+yxEJB+3
	AE5hc8QSiJLHu1T8Augtvt6kAnkBkN1F3WafhhJ0W1JSpNCshs2ifiIqROdeci+w
	ut8N75TQ0zvBDOB5q3PPZjuklNMW7hamV8FwNslmuDEfyNuC/llZn7GzE2j4ng15
	1HOit32Mf7BW8eSE+CnN0DXFCCAru4qeZJsVjABhvciolM9sGVZWeww1CVNOM5hy
	QL03uzyZC02tDlaehPzUkNEyZau+vAk0ypLGgno1aIMvrIagwPgA8zmfLWGXUl9Z
	mQb2YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17vxf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:02:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso69185185a.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026555; x=1770631355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=;
        b=RelfcC7/uNfcNbB0mQGG/KoTcKCOpdbUfFtSlkMlqDIBV4VHqt5R4lmpttq8PNz9P1
         T3WIPDeRhLnUvuZ22W4qa6GqbZ0rUbDJMXs1cwDQ/sBiP1b+BcSJ3J7+8stwR55F9FD5
         y8Ekt1UNyDx36CglR5TOyClUJu5XJ6CYry0FMzk5RamkBvrLYtW0FkDHQeP8ugX0/hJB
         8T8UtRBkj2C25Bkv+V4/ICxBpeT76JC+YPB+C4BMH0hwKir7S/+izgnH9cLp4uAf4TVY
         mokOAjLpr7J7Aepln3wl76zrCLlEeXk9qjLicuqH86ZeJ1m9RZEa8PqhjFV8XpXNAUNr
         f1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026555; x=1770631355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=;
        b=m5r9a09J6S6TIR/hsamO77BXBaig4pnqfsgWkXQQPe8whBhSH3aqI+dRgf4sh5fBG0
         /HqETyT02wPVRQ6JYXOrMT7KkZVV9rXZptjR3X6AownNwGWw8N5fMTJl5cOsPexlF6Ck
         /WqnteJbweqNTR1Wd39RzHwskhBJ2C6FUzQnl/7/ghXyubutnwT1lPBrNszZuO4VfVY6
         bREA6xYVrUxTPX5CjzL8MyJ5hyozYdVGUUyKOjKoAKp0ul3mqWoTsa8lCek+3LVXgZ7T
         HvyeK1Y6xYnPa8SjNGlmfjvBFUc+eZL6gNWPHrR5N8fDCh5er5zKF2E8qzJYuPj8kx7p
         hzZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvyNEtqDSsUvUOdEgHtNwWUweugDBDXaDZ30xTDK4Db7Gnhd7a3mql4Y5he0lJFOu84j6mc2KmllQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTY2lUu/YspzpPXfwtb2PKwACbs8Qi1YdUDUwuao2BDJC7xv9
	wyBsJthrpx5cv84tE5rRuGDjsk0u6pmSRi5aktrzJsfH5w1PrG6uyR3zQmYuea26Ic5t1ZIfC4W
	ZC/zNaICI/ZGKio+/KwsK/r/MoIUm8VrudWZngFcG6UhnVmXDNO6/ClChDiuBO04=
X-Gm-Gg: AZuq6aIjBveROgQp+naP0SHpkhCsJsgx7kDzkNZcFbP+UiFJnhVbQ4NtrpGDSgTLkCi
	L1z0rd9o7+RcewXWLAoC7WWMZ+txQbshNcr3B/eXdTiqk7ofjkzoGP+lkGpfmitQvNA3asMkVb9
	YkwIMFhnAXURD+nihE3qX0E+RNU3L2sF20QwCWHFz2xi43eJvAgC78cNLDc+L/VTm4pAVP5dOqL
	/RJrxP/9tvNyqX6ZLznwDXdVFLeuQEPaSw6d2NoVEz9sddlbBvziO17UPynmK53B9v7WdtoG2lf
	+z25vo/ZX0xIbr8Gb7YC9JkHPM+JYQh4YEILbZ18txYYVUN40oWaw0ZRnMXQkcM32E8rUM1NF0y
	E4GpSvjBNg0CntXYgJg5d9FwjIubgj13SNZWBhRSM92Oe7o7liz+DQGmJZZgL8NU9+WE=
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr1033782185a.0.1770026555480;
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr1033779985a.0.1770026555002;
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c500bsm837501866b.54.2026.02.02.02.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:02:34 -0800 (PST)
Message-ID: <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:02:30 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=6980763c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v07b0KzaqYqj_yNn1HoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BkwCPnXEccoB05JlTnCScSnPBM4cU7kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXyUSsmyvzohFW
 oo/IRPgfHUSmF3Huh9B9meOoXhGNsKIex0fpvFIL4AFfOhCLrDZR6wzI0kZwqvku99MeohQf/I3
 VbFzdnoUUUou+mPgKbzHUuiWAjZkOQpSZxDf5OBnJjsNZQqsw5XhqZQQGBlbUaxYLp3X8ppoEFb
 GrXJpS6xcpW4kUsTInHWRSO7DtzwkuRf6xtFTqx5dVdLG+yZ50zK5pcEkAHpmOiQNhUzR0rBaZ/
 lE042h4mCIdxnuqlOX4Ri8zrQBRy9/gukmuDdcRqv/kfQr56KhgjDPocHvuYqboQQRlKjnjZLTk
 +0Cx8a0vNB7PmTw/rARdVhWuFSMge0HsCMyi+bvUYX3gbIZzUkPDgf4i/E9II3ps3YjFkqeaRHj
 9xIOeonilXq90sI9P2Xr8z7dknfjGx9zhtNIFBJSiYtHMkKl/2mjBy3dNnR8ufrU/n7N3kTh7nt
 epqcKdhio6FIiRUJZxg==
X-Proofpoint-GUID: BkwCPnXEccoB05JlTnCScSnPBM4cU7kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibitility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
>  
>  	/* Attach the power domain for setting performance state */
>  	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	/* backwards compatibility for incomplete ABI SM8250 */

"eeeh", I'd rather error out since it can't guarantee to have its
power fully on

Konrad

> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
> +		opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 
