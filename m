Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7CD2C3257
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595582; cv=none; b=uBjq05Y0LHRxkVpfEOX0tBz0pwq34loBiH5MVi0Xhj+nAobObvPF4DAfG0dwDxPOLtTIuIryWIHFjFTDoZtxTkuaKPRZa6RVIWUZWoM9ox4juJiyxYC07M1Hgo7jI6YxL0Ein8Ca+o8glY4Cj32FyjfpTHB5efncnut9AYi1UFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595582; c=relaxed/simple;
	bh=s3ipkqWrYloiY//B43MM5t7dDkSX2rAhVY755/tu40g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADQU6WMtfRqVko68DKSsufwL6BevKVsjYPCV9ryTB5MDn6NsR+/KjTsMGWQpYz4+d2lTZJKPLBuC17XznmHlEhEbcI8II5xWE62Phr6v7j968vsVuZqapzOo2QZDkZBogvcy85iebx9g+WN4plGP87Qf1nbpd1cE6VyyGZBXxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOz1JCWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqh36VP8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOz1JCWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqh36VP8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91oPb3879033
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Uz/Cv/+GN0OvWnXwysjrpZjnSpYYyBV9CqUZwYRucg=; b=kOz1JCWBgzkf69GQ
	dZWaBpLr9Gs8M+MK2NU7J/zVcfVpNas1lkv4FS1KnlfmDR/BMYCRZ0DCcJllQVO6
	f3R2yfHOslNYaLnGmKIWpRHxaHLLEh0j4kU/HPZOu/uHmpLHukv5lkbMpGTN9Y1s
	8IZdKtFFv9w2+0U+5F9B/yvvLWpmstm4Kk1BBqD1uUsHK30NJM0XXjceYZZq0gK5
	GXP4peUdEMXnIfaXXTXqfxPR0Bk/vURiGpOgVSZWzigIkPIfIPWxL8r917qoV8t2
	ySMKT4eJIPfS3+r8FzPQ6pz+d0taGWubTxW7ecj7AMP0/rj7fc5pRSLjl+/52ZjL
	ITN1oQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv10wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:19:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888ae5976aso25743176d6.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769595579; x=1770200379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Uz/Cv/+GN0OvWnXwysjrpZjnSpYYyBV9CqUZwYRucg=;
        b=Sqh36VP8SGTHseMg0u22YSWAPDm4vNcHNB8G5zOsvDX21DLQQbZXuNQN2WlIijhtDi
         /NuMvsWu/4vdFSaV2fnFEvjuIBGjwcuciK+TclEKqwQEzrDDj3uLjGevG2en13zUDyVq
         3RWsd12a+cqwySrUYLOP4XSCjInZfA9vCKpV9iuaq1Odoo6iCKfuZj/S01UUzJuXO2ae
         9YXyexw0ugAqL8xh9m3GFofz9VIIhAdwe0U/h0wmEMgoPbgGG8sitsHDJNH5dHQl2Cqb
         b5YC38aUBgGxWDC4d8TPKj1WwYK1TFCYZN64+ngrMqzsB10HN8BHup3EW9aY1RAWRpDT
         Luuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769595579; x=1770200379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Uz/Cv/+GN0OvWnXwysjrpZjnSpYYyBV9CqUZwYRucg=;
        b=r5ZeUY8UwJV+xO43f6JFZbCMfNfuujNMMf2oDHcDSg/aeGqlVujAfN1QAyIPvirXbp
         0JCuJftzr0N7rbbfEB8rzYyF7h68+hDmv8UJ4oi9IdTVXQhYoiS1fPFXcUYugUJYXfc/
         +ei0QU5MmdCosaWNBy9Vf23M/ddeBo0cevYeiGcGiCugWVawZjlh5QF9sHbRI1lr8b2k
         Vmo/xZQecMY0jrbgsjRdYyH16eZEe5MZX/f0tz1X7z63/LXkupC8cwe5P0TIn/mJgp3O
         nkeODfhbgJmCuC9BbIHslblT1NOI2bqQRrvVZtpPgRq5jvxLHDpCFhMvR3GI+tdILAoI
         n0WA==
X-Forwarded-Encrypted: i=1; AJvYcCWxYlemmgqMLesRjn3Y+1HPBkASq7gJic3Slaea5pY/Rb10t1uWkWAJtAHJ6yM4XiVa7RJyAoznnTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYHZswOgFiKNaabcDjawthDCKXdWQkHovWp7XWEU80isxzrOa
	YEdrkxBID8WfchPwlDL0E6aOsb2Zct5D9DcIx3r0MR0r33juyGwwXH1tE8o/xGw+QLaQgK7SIo0
	QuvoRmHlVKC2g3M4DxGQWcYlOaXG6+wV/VyBHTJ9sunWmBmB5PdBjN3ZoACJkHDk=
X-Gm-Gg: AZuq6aInQOvgZRs5Ecj0o5B3orIZ4wcLyNtWJoh1E4n2CUTD55m2RcdcEksNVEY9Wvl
	hAjmJLkUfTAPHS1iWvZ5Nm1QD6zOcafEEpMpRU531hVu3YWlAa3ynOOgWUvCNzDmjqmv540xekO
	hRnURmRuvvBxFHkp74NIfxAgCXJm6gJtHoMvva6QxFlPwEj6Cdkxs1NPyeU8Gv6uO+eyUeidNVJ
	7mUdCdLwEAb1E+7lLxIKEuYIFZOl0FMH2mcTcGlkxh3lFu2+NYIMCSXDFZtHaB6Cr5xITpaQcfI
	sUKIUSdDbRS9aD3r/m62uESx3VK3RtUBlqrZeiWVVdCXoaA+gTsXZOpDhNn5VYc9JnwxgvIvIoi
	Mi11ymueF6dSmmSSS2KlNdZW4sgLD/LbSzmgIY6jdMRyiwAxrIcWT6mJPAT9YzlUPHTU=
X-Received: by 2002:a05:620a:462a:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c714c21c96mr100190785a.10.1769595578623;
        Wed, 28 Jan 2026 02:19:38 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c714c21c96mr100189485a.10.1769595578086;
        Wed, 28 Jan 2026 02:19:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm108088366b.46.2026.01.28.02.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:19:37 -0800 (PST)
Message-ID: <9566365e-3330-4130-a073-8b58089b5f07@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:19:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Update compatible for videocc and
 camcc nodes on purwa
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ByvpZV4FKFI8YIlkw5LK5kcNC_EJYr3R
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979e2bb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0fB7KJRU0MCZpBymCQIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NCBTYWx0ZWRfX8QPj2ZH9ZPq9
 attkX+3NgKxc3eM6wVp680+3fKv1SRutjwsIMpeNTXN1qJ7z7CFe9qLsOZ5CWWUuYHQOwrclKS+
 yUW2qF354oaC1Z9rASctDxb6WVajvq8jYK1nnd2m5LYZOA9kSU6DMwcmylYCbplZgRXZ52Q5sLn
 bvWP45JP+E/EzyklfJN78dX3/N0yW3yvy075TK0FA0Ro8GCsPpW+MQqtGCUGvyFsETqm7voSuC3
 MAATLjH1KfgTf1kpfGcDRTdwIY7IJ5S0scqkXfVs2zil8TGkh54qtOYvitdGnoHJWoh3CgkUGSF
 Ajyf9TxDD4eu42owfGn3CbWPxge4gkvdeNnNZM84Dbs4qt9Xrim1tptorf41LF6wkTYJGIEPiDu
 9j0xtNOlG8kzih/LIWTdbgdI2IND4Iafp2k/HtyCExOX3Q59Ne4jbsk9k5aqHidM8P1rFb4W/SU
 I2MNCh3CMuVEZ5jeH5g==
X-Proofpoint-ORIG-GUID: ByvpZV4FKFI8YIlkw5LK5kcNC_EJYr3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280084

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> Update the compatible for videocc and camcc nodes to match with their
> respective purwa(X1P42100) specific drivers.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
> index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..63599ba0a4f488d8f40f3e4d849645a8fa9ebf59 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -6,6 +6,8 @@
>  /* X1P42100 is heavily based on hamoa, with some meaningful differences */
>  #include "hamoa.dtsi"
>  
> +#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
> +
>  /delete-node/ &bwmon_cluster0;
>  /delete-node/ &cluster_pd2;
>  /delete-node/ &cpu_map_cluster2;
> @@ -22,10 +24,18 @@
>  /delete-node/ &pcie3_phy;
>  /delete-node/ &thermal_zones;
>  
> +&camcc {
> +	compatible = "qcom,x1p42100-camcc";
> +};

Squash with patch(n-1) please

> +
>  &gcc {
>  	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>  };
>  
> +&videocc {
> +	compatible = "qcom,x1p42100-videocc";
> +};

This should be a 'fixes' commit, as since Commit a8a5ea012471
("arm64: dts: qcom: x1e80100: Add videocc") Purwa has been ""happily""
running the wrong driver

Konrad
