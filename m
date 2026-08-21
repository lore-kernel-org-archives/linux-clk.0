Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C383C1F45
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787292703; cv=none; b=LFAvZo2+IW7GMKMhFwsdb3VRvaCZOEEtUlzmsxnt6y+wk2b866Velm20fd66myuGnRrHJLFzgC0YVsC6lFTC9fE6CU17LKnt2xoFvWUtonCuwT8crishDJtmNc/vXLSRgIek7PIPW00bO/jGFNwXDHNeR3XB6G5XRy/yd+Gpekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787292703; c=relaxed/simple;
	bh=kLr0vARLTpq65lo020vh/TNqtfLp2agTDmW+SDSzwX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bg7vXleGNzm7HAqKip4m5ptADERi/lKCdHRlxmoUycsRJVLypvBq7eFt3MfyEoFUn8SC5/SWT31eWaoKtr/DrPdqGpi0QGoqqo5JG2vFTb+I1yuk9ahQ6CjiDue/eYjVjzFmehitHOabP4P3CASdV+pxDS72g9Z8T3jfBQTXihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+UWrlq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJbFnDk+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+UWrlq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJbFnDk+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5Tjgs1027452
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 06:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRv/spH0JqyW0Df9p+TiNbSu34WNexvywdPblNsXOiw=; b=h+UWrlq+2t705s9V
	HoPRfVgYyzbLribaB1U4PZh6Fq8RLHU95KHl3ynwCHsTbLvhaXU/m/3bruqDh+DX
	bXq0N9wz8k9XtTZ83sKdcTrOB2OACy7M2SlIApU6xwkPR5QX5ntfalcmrVv13VQB
	M9qtand49sxYPmbjpRi1vtMB7cVsOY/KqQZ+jI3ZYWlwetw5nnXrXy4vLM1NA+Qw
	MvpaVbHgvPVEAXia1jaJ5rIs7s/R6Nl6gz7vLXFsNQLCW1N4tzJyZQkYTPcGOfy0
	it2wHnmOz4roE/2m6UK9k0GmzQavP0FzeMWvzlCgjXQfjgX4qvVAlVQnXf5kkrXD
	QqR9iA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d068thb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 06:11:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1079124a91.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 23:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787292701; x=1787897501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRv/spH0JqyW0Df9p+TiNbSu34WNexvywdPblNsXOiw=;
        b=MJbFnDk+THqJGFkSY6UYOiQNL1BiEah8Evi4j4N+2PKzqXdqjNwo21sXyUcUI+Yg1L
         HGYqfsxmvyF0HlbTg9snFwSeDZVqic7fU+617bIphZr/592VvjLC1kSgWTUbZzl1WUap
         MAZo0X+nXWRlLW3XnrWfhe5o+TdQ4pLR6qlbMnr//byr0zHEznhQ+vxhMfX7J62a2nwd
         jDkuAoQWvyehW255RqK3rRvbWutXE8OEWM5GvmxbyCfCL8CDJlpZiva2O1lD/2Gyk++d
         dg2MmOIpDg1ntcA55PbG69sWRxPw8RAiID/aYZPqIx/CSM9+I669mtcQfe8lpvugpo4e
         MN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787292701; x=1787897501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRv/spH0JqyW0Df9p+TiNbSu34WNexvywdPblNsXOiw=;
        b=VBs8XD16v8fNVMnxQXZ9OGYhwgV6ZvQq4Jc4CyJZNWN5v7va0hC9+zn/cewEzEafgD
         WJ/Y2s9nMT1AgspBjli0526hDgBwEWKDl+rZgABjlKlNknsMhUvSdmxI4A+ZOPsSUh0z
         KOGZuxWawKxYPu8ikIkALQZfOMYhZxh3umAm+0z2SPdE8sBUzbLnskVQdThbIlb3/lXs
         mp7H8pRMwM8QKamJr40jz1MQfugKF9cjn4vK+xZxVHEk0FQk1ugfpeUj7tXqYbWvLsKm
         Ypmga1neqUgdo//tNAjizr0wEHaGyqx/Lhr6qV1hk5Kzj9Grn4csRhYZiH6F1xf7FiRX
         xFOw==
X-Forwarded-Encrypted: i=1; AHgh+RqYevURTZZqnDURPG6Ozbk/xDiHNrhUNHHPKt/YUoYOfPMQpqYJnDm0jIMGCxzQz0EcN3v/EWwKuUY=@vger.kernel.org
X-Gm-Message-State: AFuF++nKhO1zM4Wh0dpgVytP87R5uqBTnxJmbQzxAQcoA3pKUUB1zi4x
	YEyHPUExm+p3wNrbPDphMChi30ucWlCC3MH+eZlK2VMd4SqJFm5JX/04vh4QRUP6D/x7g5u11K0
	NXw+q6qn/J8glc0M4FVbIWWZEP+oHsNZHjQRTTgN9J2H52V+WRs3/1YEeLxT+qYc=
X-Gm-Gg: AR+sD11Bj7WppgZL5AclmY0EWu1+r/T7ghHgxPEjJQDczui8m1Dwvu6lYYrtxMPB3ru
	FFIs+OG/bvJ+rS1p3kfVqc5OzrT4a76mfeCp3MVM2P7i8QGCQ1E+O4WJZlZ8SxuHqg9ykUeLzSV
	qZTR59MYcdlXsuDlf2OAJ1+G7RT3kVKmr73AzvCZR2ni7TLbK45pXNRSm5RzFaQ1OgWd+wFcKGw
	MOB4iCYIpI3aoQkMEk/4kOBz4wa/nu2MGMCi9iWr33evmMjhSDpZkud+PU10WiFAcsjJVtddFL2
	Qu34Vb2/FRTfnOy0/ip5swW0q6dHobhTD4Wougi2xLjHHF7zsossAYBDLkw146g8FkPA7A80AWO
	bWePkbMX+ZMTvq3Oho4A5luaqCgLwcX3TQeti
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr7663130a91.7.1787292700893;
        Thu, 20 Aug 2026 23:11:40 -0700 (PDT)
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr7663037a91.7.1787292700478;
        Thu, 20 Aug 2026 23:11:40 -0700 (PDT)
Received: from [192.168.31.188] ([152.56.14.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4570aadsm1730049a91.3.2026.08.20.23.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:11:40 -0700 (PDT)
Message-ID: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 11:41:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default and
 CLK_GLYMUR_EVACC duplicate
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0MiBTYWx0ZWRfXwSGgx+fqnQim
 hGDyooUgaTVK+Y1VOPijRJsBzRtm7UilLFezwh2F01ChM6rexI/j12P0Cp8wSI1OB9FCwGH/4+L
 aorYJFS17H8y02+WpQTMrwkNngyhwhpR6fE0uMzpfwSuz1EL/QEg8Y/wDSubTMygGOVlLYMtO8o
 jufSf0jv+/qUhsniLSAMsXo3NV/4oREXaHKzXv16y9Ldv4Jqfh4kQeK1QXzXQ82Ale3wRma897t
 MI24m8g7R6o11z/zZekVgdkO4CnVSp0UTG4RYz1bC9gRHWpHFzfLM75DQqh0cvHLUFG3VbGGNrg
 ZlCR9FMuqe/a9RRKO6q/PGv7KhzgazTgwmuhDD82C+suravU75PtA89kw4jVmxBQTSv7WFCJzsp
 L/c1SBLipSbVJEcC3b5+6ElAzcBIqozFJ4YHOWrNkk7wHsruj0gtARUbKoYYUrvJdO7LiGkZ4UG
 jx5xxqRZ38IKnsF8mrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0MiBTYWx0ZWRfX8gAciOmCtaDE
 A1a6Dtqp+JxJFdrNPBf4g+9Av1OKv8xquuz67vJIbxATBaSzAdB2qz0rGYCyQhd5Q9R5HlYZHRS
 TzyyilIKgdYqtVS8xeJphUQju1gmw6A=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a87ec1d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=UgjVaFD1vmiot8dKuSzQiw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=apnw_9Z6d6vNCn9dD0QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: n14UtUnpKJ_7K8sRjpvQ-uRJVQLjO0Pu
X-Proofpoint-GUID: n14UtUnpKJ_7K8sRjpvQ-uRJVQLjO0Pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210042

On 8/21/2026 10:22 AM, Sivansh Gupta wrote:
> Commit 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> missed adding a defaults for CLK_GLYMUR_GPUCC and created a duplicated
> for CLK_GLYMUR_EVACC instead. The original patch series did't have this
> problem and was introduced during the merge. Fix this by removing the
> duplicate and adding a default for CLK_GLYMUR_GPUCC.
> 
> Fixes: 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e07..7cd3ab277d37 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
>  config CLK_GLYMUR_EVACC
>  	tristate "Glymur EVA Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> -	default m if ARCH_QCOM
>  	select CLK_GLYMUR_GCC
>  	default m if ARCH_QCOM
>  	help
> @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
>  	tristate "Glymur Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
>  	help
>  	  Support for the graphics clock controller on Glymur devices.
>  	  Say Y if you want to support graphics controller devices and

