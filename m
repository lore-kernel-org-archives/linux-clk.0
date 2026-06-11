Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A583EC2E1
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179283; cv=none; b=ESjAIrN8ypXbTZHgZ7UO1OJmUXoAF/eQI1VHx2r+/rXKFQjYhgKX0zu9gsrF6AXvvSDyOQzxTmQUEu9LdEDZmd/TJZ66IEXS9tbUs3COCheBEuaeeSADcBpPHmKIUMbO8HkRooGLcz5gFHgPiYRA36gJetWeDeYQpgJGqt1s/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179283; c=relaxed/simple;
	bh=UUASRU8qrMq5bxc7X2jqPLe9p6S7lopRBLYFDQYVE/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOGPb8V9ghH4lBu3EQmpRdLJwZCIau7nnjnJajNiWOLTKVWNPFk6T0QrlhnveCtKygxOIQKtK2m5G45EaLKcZQLdKHpEDJIK9H8CS73+EvbKwa6QSJDdQxzUiiarN4RyBGe1CVmKeXR3Fv0M+NZ93Phz8hiI+w2gNsxxlOrmZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAZtb8EZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPortWrJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAZtb8EZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPortWrJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBRU263553
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=; b=ZAZtb8EZN4eZib+p
	As4Cey2lWAM+Iy3vS/dONwDJD7n0caQU8TEFUHv7/9YVYcGvsscXJIzbPua2FjP4
	rErT0VqMybbitS4M2MbbOfLVgSB5ZxaSxBk6TA1TpdobJu+HvPbFsAb3XUoRPGJN
	4s3MeqrW4R7dJKkZ8ldXc5cETqZhu5ZpdfWE8RopmtjQca8qFEVYmEZe1JNbIMDg
	W9ccewyewbk5ePVwSQ0HGnmaS4G/i000be6LvQRSBgSc5stsfq5MRqlGyBsMr29K
	7atVHXcTo4iamh1xyrKwbgMuutwl0O3qxFCPYZK1OrRrfEgAxJqS8R2fmQFnC5fF
	dLsTow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu8hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:01:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178a632a12so21343561cf.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179281; x=1781784081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=;
        b=kPortWrJ07jSej55rid/4HulSKWL9beqb+Gy/4BBdtYWj1b6/SFsb52a00wHbpGHdg
         PRfRW2hVk4XKYu1KyVhr5vaCr6diNww84ucdCB2e00qO69SpbMSkk41voNAjDrHP1/aR
         qRonL38TFxlaIfDw2dl04Gm5OAeoTdsMdjVI/Z/n/TpNBwhVQrJSnOhSNHHSkHN0ETo4
         C6wNoBI1ZgQTao9KP9isUGtoRU0vwazbIpES1fRd02Bl241l+Yx8liFjQRCAI6yi18nQ
         PylvaWfkW4VhVHXc8csAfmBmT6QaeT+MME4foAk6J/kYDWB7iwTIiPQ8Zt11yS7M23eX
         za8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179281; x=1781784081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=;
        b=o/mjcKzhdrfa11wjwYxBCJqrZZW8+ll3oo6jquBCFrwUe8Sh/dBAmpl3YqF5a+Ze+V
         2g81duzL2xNRAs4lxiYbedzDxx9cYmOx6lxHieTHvIbjtB/kjW1fbDG5WbtPSSUk8qxE
         /cfBUWGHeuNRIYv7FQyuAVPO7IiuRB3nW0hpkpmlcIJbl36xrv2y4It9kzpO0uTBYRkh
         OZyGFv9evejVua29lCdZpzJvWKLpURQKekVtGhInb8TtW9QqgKEwV1MiLl0fiwTHNYu9
         94J228ppwLnONZ0XAiN/4unKIueAF+nXW+dhb9ZjQNvdMZoBFG9HdAhCBvcVcvQG5plu
         U5cA==
X-Forwarded-Encrypted: i=1; AFNElJ/tym2kUoU2KlQZWphVJbVYu7gRdk5asNLtPgN4tlqbmB6UrpSffzd0bVfF4olIDSg3g4CXU1qhaY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XaYIox6mDpHZn09PNMDLQOiiuFcOzBokqAB11O9KPkT+kq+G
	vlYULzeGu3ndTIg3haiioCzW4XX6MUqyyn1bEHrS+Ruk+gl1fwRnu/TiSGWy0oqPBQ1YJir/Osj
	e3s69RloLM09heL58RgInfHtgqtzDv/lqxXfyc3Pf3bMux4Mii7C8rkFZmjHDHx5aJFUQ7pQ=
X-Gm-Gg: Acq92OGFyr1YmElg7Kt5KIKBjM+aV9jISchOH1rTUuWilGvE5PBbIL4Q+vucMV7LxUQ
	UJjckb7zQzmWTVX7lBaT3FZUji+lzs6SOpuMvkp5obFJ/eMWTvKaRIItpvFtUenz2l+kXNpCl+s
	kCe7uV0+QJdi6295K06ImAoO+k0NURkglg0eWjiW9f/j89KHtNKH1n6412N21YbGTf2az2+tdCZ
	AzhxHYuc1x3juy3pNDTHBDpMvGa6UqkeR7zwLqFTOuoQptvXFGyMyHeaYNv2vQiPs8crNKPsqwy
	h1WeO5oEpLWHL3/eeMHvPv/1dhFnoIe2Y2LMRDWatB1IRxbI5+S8iikT7GvYWyC71iV8C2Srr34
	HHu4XbDashHoZFCdbSX/bVkoLRDM1n+AwWwu8tD2PY5e8qg3HppR8Mwl4
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr23764441cf.3.1781179269286;
        Thu, 11 Jun 2026 05:01:09 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr23747671cf.3.1781179258661;
        Thu, 11 Jun 2026 05:00:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1607ef1sm54532366b.15.2026.06.11.05.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:00:57 -0700 (PDT)
Message-ID: <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2aa392 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HgiURebnQJ4vjG2ds3gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfXwYj7T+YRE6ur
 +kpB1s7F2uod2XNAhpnk2c8oinjVG8QoHNSswqPS09qpllfE7gf9/4kcYvr1TJQCJG+FU06S571
 nnOVVW8yzVX6qDcOkX+sgVQleBDpE6c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfXyd9eIaE45tYl
 ejKfSHGoCIo+yzl/BcEiC75vPTB3vGuiD5+9riLdKsA9337yZgeX0OoqBodLZgIBAGMFPMVX4xo
 hDX1HdVO9R1+Eu3gURfqPxuiZjsGB3df4IpdV0ZpTFDMF4ozd/UZnbjz3qaNbW8IJ1Zyy66DA/U
 DXLtgRS6VNLy3BT7oujI7+bGn7CIADZc4kRCAOv8FfloUwUaYYABxlOwENq2wGQdGyVkeEoMDSl
 6yicISTOwWx0zTMDEHVjSMpCkVfxEJIrdO/X6QQI5HigKGzytoTfFzoPFGqKt3ByQwPd6uQZr8q
 +Ql9/f7xsJgxZyG6qvwTx+DU8C0kRHxvP+5Ml/qGrPGUNPvcoUIptl8SWfftw9HiMRAs1xIk3nl
 W1RJtglnTiaqJLKXyyh6n5vtNPf1J+A6i64nfgYlamXL13wBaaAaVPs2D5fZxGODsJZVlQ14Qzb
 W4bfxLqnaGfw1Sz9yfw==
X-Proofpoint-GUID: jKdMcqhhNXOw32xzdzKvzKEwmfEBrpPj
X-Proofpoint-ORIG-GUID: jKdMcqhhNXOw32xzdzKvzKEwmfEBrpPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110120

On 5/26/26 7:29 AM, Taniya Das wrote:
> Add the device node for the EVA clock controller (evacc) for Qualcomm
> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e9549d126aa50a0dc7a90943a3249..66948808d197bd17ffe65190b472bb845cba0eb8 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
> +#include <dt-bindings/clock/qcom,glymur-evacc.h>
>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> @@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		evacc: clock-controller@abf0000 {
> +			compatible = "qcom,glymur-evacc";
> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_EVA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,

With the XO_A situation resolved:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
