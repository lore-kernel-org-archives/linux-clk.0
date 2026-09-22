Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C3D49F133
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103921; cv=none; b=oG74I9myQ97UHrRDMyHTtUF/39BLNfQLgOkCBsZ8HIPykyPVOIdpEZNFj8OmijLticOkiupOFKhiUVBVSei0Pe0jEBv8jLkUduP0WgGliGrAdSIbYbODIz6UqtT85gpZ23phZu/TInA67JxB5kd2V592ZcuGs6bd9uIwpkFU3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103921; c=relaxed/simple;
	bh=Rx3vJs80Db4VF/9M751X88Qb+a1HALVjZDFximEAPW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2vX4S+rHjg8uxM6zhYYOMbzI3B6SZK8ghWAt0mgjHIf9ZkPOqqP7MVuL5t4+B2kUT1kyWdn/Rom3NZ6phglfSaIed8wtZUCDHsCbkM9uGjpuaLVINVa3gVTgzsPVSbwjIDHqGlfQVbz/TOHYXyZO8UfIHX57HZ2cO75a4hJCAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUJuFMrP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNuJmi6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUJuFMrP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNuJmi6B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72w52033272
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 19:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ivyrd9+tpvNNomTacj79thI+x6GEdKA0UpWcM4T1+dY=; b=KUJuFMrPz6OZimEq
	AFoq2cpHWCRARNK215an/kRLrOznsCiyhIzJs4DvnDXHxZRPKOp9BDSP4CxcOeBr
	+4rmry467fpWMzBNmtawt3aOvZDJevZMDK05GdYhIv8mMpFI3YZZXmyAldJwntrM
	5aM8PZSumStPSUn0S842xcvZJRh6VDX3gikW9J7GSjrxYuS2wM/5A1A58lndZO2a
	LKUAF80cpJD3Mgy/XV5+e9GAPgAs5Ee24+WRT+dQe2q/c6fC2FlN6G2w36qoPlG9
	wMc0SZRbFQSYERgO4p0o7gOiLQCh+P7E3jzsjxjn8ZaA11zevUo2ezYq5VoH6Sn/
	9/db0Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0dxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 19:05:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7915a83539fso129601137.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790103918; x=1790708718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ivyrd9+tpvNNomTacj79thI+x6GEdKA0UpWcM4T1+dY=;
        b=cNuJmi6B4JY9fOKqc4K3Ih8BeB+sDYDFcIqmmV+6DsASxb2W+hS3VSq6R3bhE5Q5RJ
         q+xR2GTW7+b27WXl17Ojkpa5+97mPklRhoyoxfJTUzx8z/EejcV2Tab4jkM3dlkrWGzj
         vN6JSVUIXWrN7ZZA64ECjrA5M1qigY93CzRVgMEG6VnICOB7kcqd/2mQPsXvCAHvnb7k
         VA+zR0/gn4QfE2jua0YqDNHWBQ5LytN4zI+VVBH5U7m9t6Fs9OvNG6VwVZt3acyh3V80
         S4bJIt4eCPQyj8CoqMBBP5Y2yApfHDT/w/X/PLE2tZsWXXVrrE0NbjfO+JsEL5MOJHul
         3wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103918; x=1790708718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ivyrd9+tpvNNomTacj79thI+x6GEdKA0UpWcM4T1+dY=;
        b=RrtvhZMsL7e4V1UYylAnbbBosgszhQN78Sb+Hw1hgwZHjfq3DDuQf4PSu/ykVeIiDB
         dC8pwfEBKfWM2fAmya8mmNaC5CZCDKkjBEz/VsjhEVEKLeaVmI8YkNMJT/6Be8mBGnwa
         MvizdR4BGF2uzqJd5014geTuPTNh4jW+fkdsNEFKvqf0U4tLBhgfOmymA1hAkXBso8zL
         SSyilDIigfhIhwRjC9WqX7pwqLKWIgLeVILkIqEwV1Xk+vjJku2ImK1RxXRebOQ2C03T
         uj61ATHW4uDZJ5VVYPhcTdQ4Q0qyI5Uts5EpMRICfRxvZM2gZbnZIzKFzrSI15HWC+Lk
         +dyg==
X-Forwarded-Encrypted: i=1; AKwUvBxNwpwOEWmcS7jz3mY0o7UqD5Do3eqg3Ae/iGavpxIDoD3h698VH8jDpGBs9mOl+A4jDT+aP4P8dYY=@vger.kernel.org
X-Gm-Message-State: AFuF++mFyJH6utjMSxW31cQAaQ2b8+u2hsH+LvYxl8is7WVIf5u7R6tK
	jlZHhWTu3NRskTPiMIkdCRHzowFtEs+MplyfWpRvbUZYJPs9lZ13kT3ArEG6pVe4huEoT/4otSg
	gEf7h9JMW594Eguxp/hLmcjlwwPlL0zY+gGuEQB4RGP5KBX6iCkpKtj6H/P5/xJI=
X-Gm-Gg: AYBFou130mbz/t2qzx2T5hHiRBFBAXpPjmlzTCJ6ejhHJye0PWp57LaTrxp7C48qiAY
	dWlxMY6M8Eczubf2DDKG0ORF2npVgXLe2CiCR4coSPegGIrc4VdsGJgj+vKu6uJb6Pzbyxp9BcU
	PwTFUFrb4jCRvUjXaEUvWcOXiQolsSoF9b4ip3akr8TXXNTjograHUI27+15nE6r3hyx/gmaYNj
	1QeLDiG1WcPX2Ca2Da8FZtyyJDvnfGIDWzEbPRaTTawwmP0zCuzzdPedpPNJJYjIksFUqvSvqtI
	A45lpAKRtiyIXe+fbqJCWo5FhXB0xQUpDxORI7Fq0TT1ZhzOc5lyXBPiVKwwEI4G582ULewvASc
	qgKGU10dN4NIj1I4GiY3Wb/gydx0eMjKfZXNlhZUnASSPqg3lLf+raW9K9DgHTD1Qm/oBcP+2dd
	kj
X-Received: by 2002:a05:6102:80a6:b0:7a7:19aa:8a87 with SMTP id ada2fe7eead31-7ac1d4eac82mr350773137.34.1790103917977;
        Tue, 22 Sep 2026 12:05:17 -0700 (PDT)
X-Received: by 2002:a05:6102:80a6:b0:7a7:19aa:8a87 with SMTP id ada2fe7eead31-7ac1d4eac82mr350719137.34.1790103917504;
        Tue, 22 Sep 2026 12:05:17 -0700 (PDT)
Received: from [10.188.38.210] (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3a62f505fd2sm1258671fa.17.2026.09.22.12.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:05:16 -0700 (PDT)
Message-ID: <bc795351-dcbf-492a-814f-2cb1d009f6bc@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:05:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        linux-clk@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260922185449.51A221F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260922185449.51A221F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MCBTYWx0ZWRfXxxBIpJNX4FRB
 e557tten+oW2l7jOdDj0EFf/TfZCx8lsR34lqTLOkbOVFDP6jLR+kgaMDpnC774lwju2LavEQyV
 S+CyR6WJjp5nrpnjThPZs/JNwM4Mc+nFLwQvGiBYLs3tqZfD/1+YM9gsScTGDTZo9ZTGRCwcWDp
 Gf5Kbck+VN/FGU4q5DeRnFhqKR7wvQNWY0I4xkIRNcY85y3B/KP28FvallbDswLFwArwFhnjjPx
 gdAtg15vxbwcA3+B5IqhHxdzNsjx/MMOE+M0KrGcxI+f+jRWZkDGb195POo6XXTUARrpt1OjMVq
 oOh+uoo2oBDv2mUy2E4Ju5krnFbAx+KBdEsouOoiOX3FvqEIz7W3nRDyAOwWI8IR+kJkuMueEmC
 PRNEbjwmWwGkfyxk2DqH8J8vIof3i3FPH9Ze4yagmq3C/Z94dU3II6S/JxMwEoaCia6dDU2hbJ7
 wo7vF5q+6RfWvxagLcA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2d16f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A6BDbR3q_nxYMsy3TRMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: NyO1Sx7m2sOSp4JI_KqWYxDwOyRV4yrm
X-Proofpoint-GUID: NyO1Sx7m2sOSp4JI_KqWYxDwOyRV4yrm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MCBTYWx0ZWRfX1luHxy9fECee
 pZEaUgDjQ+TYV9ivn+fWd18vu1isc0kRA+setHeqGC40RXzje242ddQiAJj6I2rzCExSJSiOMii
 cuffgCF2dsdtFPG9N8Eeue56tlHWwtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220280

On 9/22/26 7:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: incorrect `#clock-cells` requirement for reset-only provider
This binding is for  clock controller which also has reset controls

Its pretty much inline with what is done with other lpass audiocc bindings.


--srini
> --
> 
> commit 347d3aed7b27ab7cf248e5a7c46279253cf08e0e
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
> 
> This commit introduces device tree bindings for the LPASS audio clock and
> reset controller on Glymur. It defines the compatible string and required
> properties for the device node.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
>> new file mode 100644
>> index 0000000000000..c047c0174a93d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
> [ ... ]
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-lpassaudiocc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
> 
> [Severity: Low]
> Since the commit message specifies that the audio clock controller only
> provides reset support when it is under the control of Q6DSP, and zero
> clocks are exported to Linux, should '#clock-cells' be required here?
> 
> Making '#clock-cells' a required property forces device tree authors to
> include an unused, dummy property that incorrectly models the hardware's
> capabilities just to pass DT schema validation. Similar reset-only clock
> controller bindings (e.g., qcom,sm6115-lpasscc.yaml) correctly omit the
> '#clock-cells' property entirely.
> 
>> +  - '#reset-cells'
> 

