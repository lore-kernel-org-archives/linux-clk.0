Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767484AA1D4
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048547; cv=none; b=tQmluRMhDt1SO8SIB9Ki2KNwmwMx6VSUDW5xY/r43zk0X6rsUxZn0C8UC2JXuJaO6CwPK61EyDMbjFPEDhaBsYA+1x6FtnGCd0P7gfAo4t2ePdpQ1L67H0xw61Eiv/o3iyzue6QjPYLJwIdV+sQpNUKb4SbhuFEGJuk813qy8ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048547; c=relaxed/simple;
	bh=/wSh3zJmkx6TtnnckwzhBMdBXjxjl8xQdGNCsjICl+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RH6AQHQhOCUYHwtePKU0AbFpH8rbLE6CUAnDsoBGyOeKmW+irGmmR6utaXS6czkWpJu26+/YfaFCR9dm+hjQu+z5YnVW+p+QENXQicnyingHx4VW6/eyXqWANuDByDOWG0ZtF3K9v7O7XbwRj5F7SETTT6CEJD8iYdr2L92I0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2ruZgF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck8rdLfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2ruZgF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck8rdLfu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7ANuh2121592
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=; b=K2ruZgF8J3jtYrUE
	17ObGhOSjwoqNxY0Yc2lqTcT/po7C09qq2p71Ngob6oZfVfXv8foF/tYbeJCwV66
	8ktL1L2KQ4Fy8NRbBjRgVVESMl/4yqr77X8EKp5x2oRt7/c5abPbmTRfo1fkUQFx
	ZYVp76OR4KP4WjzcRWLrKssiKjT8+n2YROgH5NU3Dt/MAWgr4agHSPUGf50RFs38
	uEr2aY1vQmaaukYknt6OqNeW2ivQMeqMV7Eq+He61Q+gYL0IvqrPv1FSViyu7JRR
	mBfv4QlZlKUimDrjzpcFjLu7zQYPLSe8vRv93OV3f0+rXue3pLDNqCTMW/mOdIKQ
	R+6Pkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1d94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso1944136a91.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048534; x=1792653334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=Ck8rdLfuQmvBCBqr5jy+9Uz4eoDWwrAAsRYwuCykHSZxgeFauis4BmLxZu1iq+VCRr
         n5mVKJ0mHO47I5KdAOfCHGZRYcm1AxH1cXYq2ioGU27lyG1DNkW3NIjpTsRIHeJD4l6U
         48UtPrgJTo0U92QWVv7w3oyaAKhtTZAiKi+lx5RRToE8KmjCB8x2gJGbe1RDtlRSkhx3
         5nT51stlY+NfAaedyRHrV4JJ/GH/aTUGZDjLDhyPr6RtLFEIUKk3KS/rFKs03+Wa6Db+
         r4dr87lo92ys/oJPCwRi53VaAu9Nz5OHFwJuiF/c2QRH+GvqOIfIul7P6g9499xhjIq6
         DYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048534; x=1792653334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=vUuSwy5+VcTDvW2fwPbw6lr8jk6D+sdgX2S/SFVMwfLRd8mDoMzIDJ83TdnJDB9uSb
         YnZ4hzeGfBBxe/JnfaxCMYNIVrx9NmnYgM3PnnnGSg8OkxTu127Gw0Poi4rFY+c3N+Ce
         PACekZ+xFy9Fa0GtemRr+oJvzrsoKCebDbS92/xC0pXmFLx6Bos+79DoXV4HYjtUDX2J
         NngwMUE4C3nPQG6G7X7j5Rcyt686+dELXgRGMj63kNAAgg/+0DCKdy0Vf12Tkh9h7rbk
         meHiFvUufGh9wWgUK8RoerpRfxf3Me8i7rB/LS6gWtuSVrH1PSyhezHRAi+Asj/PMXfa
         1RUA==
X-Forwarded-Encrypted: i=1; AKwUvBxBM2vrsW+H+Sh5ttmwwyzhLSQXbebtGK3Km/Grgh5RTO0uP/o/itT86Sg1iJUlTE7MpBSzL+QTYCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR3KkIm6wsIA1QLBLPDc8rNyClBpia9ugX3PTZLDHLWnM7chjM
	yTr8Tvc7zRmgmybrzo1CLq3ehSKPEjqo8OZR0j8gXAuby+IW0ZJ1Gvrws9J7BfaTUzQh8ClcG7n
	+4LwT6Q78ALH8nWBLys/BNbpFWaxAfyvocwQvvOXXkMJwyrXYnjW65Vl9LgioN0o=
X-Gm-Gg: AYBFou0QSHLdC6UoAb4vgLfp2DeFSDwvfFGtM5L6p8W+hu76RyHq9UJ28/NVqlTSlOA
	8yZe4Bq5hkhHxdteTvfjNDcpp6F2vwXigB0xm12puJ+9zSUxBT3hobtNqqxsz24fg9z8DfK8S3a
	XenmL+/nqEqlnnJseREsuY/iPfomamhNfRrnZ/m5uVaja0Rpc4ZQs0sK9YgMimaATeN2CQ2exbU
	HjxuSUfeN8lhfpCw8cMZ/5aLHyMj/kbecw9sO2IvIcbFB7GMmaSjcdDvEI0EBmxPqkX2y1EpSMC
	QQ9V4cyQRIiShbKoBGiYxPlN51M50yafVZj+3wC6yKXq1LSwuj70hfy9FrdZKJCWM2Dg6ohJwRL
	yBde2fcMa0tYZI8ICGMXghSGVV20=
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430168a91.5.1792048534157;
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430141a91.5.1792048533687;
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Message-ID: <a944b2e1-3985-452a-bcc6-8b16969a7392@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX9sNv15fG3HhP
 YNcqAEXB6yTE20Wu5zdwpto84QUdDXyFgOEUCOvUXcKf9Dq9KEbq/i7kbdQ1jatc1zelw8Qw5lR
 lhswKR3z7C49U6cpWZ1jLUnZNlG6vQgz3+BGfiEOJbD1fl1U/uTsCFwuD9bXE6q59eJJ/pXkYDf
 lsPMv6TyBNryrTV+y8w9LCq0bKQz+249yi5mOtsUXTvQUQsTxuP6/ILHnvIJv2pJW0rYg3FrREe
 dHwwyPhNcg3LgNy+sTlZ2aLkFhFQ7fbTQH8yzBVr/kYKn9yjM8o17A/cFfAB5GP4nuyWSVrZrUG
 /OpZho8AUVifs3n+RDXNVxyv8XVaJou7nc7crWz7KM+hRXlC/+khcq8sPSpWkf5udCpGj8LhPlh
 Q36TXPGERCOzGGV+YVOOKwTiKqFVGW3vN8ly9BoMgzFiVcb3E1O+yV94zvgiqziEnlmn4NYRe1N
 T+wclddbBmwm3Nkd8FA==
X-Proofpoint-GUID: _Cqnv9sCK3ylBhancDVQPD47HbNhfWXD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX8JDDWq6i/cPf
 cWKNfjmf+hHwsRHL9lP62fzOqZRM/PGZJSCfTmiHoDj5M+tuGkHDdRSRH/a2+bXThcD0wMts+w3
 5SoHY9xImGZ/p9Xp/sJGsOAs+00BDQ4=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad07d97 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PM9MLdjoRCq9o7e-zGMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _Cqnv9sCK3ylBhancDVQPD47HbNhfWXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 6:55 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
>> +  clock-output-names:
>> +    maxItems: 1
> 
> This should be deferred to the driver

Sure.

> 
>> +
>> +  pinctrl-0:
>> +    description: Pin configuration for the GP_MN output in the active state.
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: active
> 
> I think these 2 are always allowed/defined

Sure, will remove them.

>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Likewise, we could simply set_rate on the GCC clock which is the
> parent of this one, via something like CLK_SET_RATE_PARENT


The GCC clock could be either at 19.2MHz, 9.6MHz, 6.4MHz, or
4.8MHz(consumer/customer use case dependent) and the output clock at
GP_MND can be a range of frequencies(which are not fixed).

    assigned-clock-rates
            |
            v
     bi_tcxo (19.2 MHz)
            |
            v
          CDIV (1, 2, 3, 4)
            |
            |
            v
      gcc_pdm_xo4_clk (CBC)
            |
 	    +----> 19.2 MHz
            +----> 9.6  MHz
            +----> 6.4  MHz
            +----> 4.8  MHz
            |
            v
         PDM GP_MND (Variable frequency range)

I missed one patch where I didn't add the CLK_SET_RATE_PARENT on the
gcc_pdm_xo4_clk and CDIV(additional) modelling.

-- 
Thanks,
Taniya Das

