Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FB3DA7E3
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177119; cv=none; b=M46bg3ZadoZhIsOz7fUhgwr+5B5njEk9rguvUHEaAoEpsGoIwFL98OWNTxc4UxBWzov/8YH75Sf1oJcRqq12jelEvPX44cm8zm0cWWKHKkz2+meFsFeI8VYFHP9vHlyXnaHhwc8WiVrwfIfcVXypnSYioPDDBE31Tw4ATf+T38w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177119; c=relaxed/simple;
	bh=vi9Z7DDnlPuv1RFkNv8Q03tknP68sabA7c8NaYEkQAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkAmDV9Yz992+epJi0q1NJ27mUcRI9zQD/WdPasqWMMBNDgilPigdzGphTskXzvOWKNxV8IUKHNIU7VNY4hmv3Edxh+tkFdYrXQGW8+ONh0qCZkOLubzsSsp20IgU+LLBh9hZ/AgoJVuZi+1qJHpevP0kG12IS3G5TtJQjCRYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glrECA6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzeYxzwk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glrECA6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzeYxzwk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBLn263553
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gP74agXukYi9qHLu6WD4fAQMqsUwCru4GBxwuYtEPHI=; b=glrECA6a5vYUP9/z
	enhcyA0vT8Fvcpo0cwU0gFPcYolBh9Q1kjECplI2bN5jDZELveqWfU6Rukyh0xwC
	AY7PWNkTRn9AMVwzBby5clbTcfkEVlIqKOeqdDvz/U5SS6pzt/l9JCovUSpj60rU
	NyKSLlJSOyX27igfgzADk4bzQ4kU8mPZ971jxK8nQ4ZjAHuJt1kPqdoNEmIfTnio
	qgPdnlKq+MaH/O50EvHNjXAAHB/V9j0Hjh8r8DJzM+bojwIBh9PQ8PkKrbX0lNoj
	PC0bU62wHRZ36LJZjeocCA9nJ1MKdjr28Ey8Is0Yv8iwuV4ahMqFsmpbjPgsDMDD
	1nQQLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu4m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:25:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91550f68e7cso185530585a.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177116; x=1781781916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gP74agXukYi9qHLu6WD4fAQMqsUwCru4GBxwuYtEPHI=;
        b=HzeYxzwkHP6UVg7ZDUZSsA3GCmjBaO3AM3Ukbg4vzD7vLwcqM+LY3zUEmNofsz16kZ
         lvSgNktk+fCqHPSoTRSx0aYs7U6jRLF2l7Ff6FHURX5mg9HYzD3fRLovzw46lKXZrQjg
         0J1CJtKsEnKLKzC6O/2yZUxkN7Swy7UmonEX60mjAUP5JH2AmrvU8+G2yu4LOWLD5RuY
         534AuKxT0lsRabB5DKKMqe3LGvx9kLEFM0D02NSvuqTIOGzbWoZdz+PMtfML76f3qy9Q
         K+Gcd49VaftXBsuabJUBXuV6RdpjoA1CXoYVSje/obu9/E7kKyHHrznNaugpHo16KFPu
         is8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177116; x=1781781916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP74agXukYi9qHLu6WD4fAQMqsUwCru4GBxwuYtEPHI=;
        b=VIioeY9m7fvxEqXv+lb88S2fNh0ivV6PorOT1OO/+vSKMrrmm12e5/A9mMj64Z7STl
         shdJE037319H1mwGddjMe6RPkWDQ9oAHtTO+PBc/0kCYqfKmSgjdG7RqJ1VWCkY0NuYv
         6QVRg7AvbPcpX8WpXamQyhPywBuI25XA2Reh/1rKHp5OShLQKWyme9AefZ0UipOS8/kD
         SFzFoz5CUq6mPCsuxRsr4CQbjXtt5ao5YHAHdV9NAfNpyOrzketl0Ke6RuiecoewTzeB
         CPslyVJ3mXRiBsDgUgCBYBEKYJVKaA174BzIKGOIFOEdzEjgjwLLPlC5/0nOY91RcL7b
         IU7A==
X-Forwarded-Encrypted: i=1; AFNElJ8UlT6ePxb5Qngq/xa0Y34VWBNExILMUatHn1KVKN7/1VcgIaGLZd8fL9/xSdDYwMHV1vVO50UDI5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUlICJK6+zw8tu+FitkwidhDUynXcXAfURy/9S/Gd//9KOl1Mp
	LoYM81jK+6TZffqNpJRqmwgiwqfcCc0upGT3zPYbX11Ay6JPjy4rWG3Sveaf2nUSIf21lE8DVdI
	DOCNlRrd2fbijv0etbfwhMSugFgYFxzvJJ07ILV/c/hbyC+zyP3nU2Z6u1rRfAVQ=
X-Gm-Gg: Acq92OE+jQ0H/NZhTiov2Ifn8yiuKps0nv8VIUHNNtL/6nJN7jy5DAn4H+CVVj2WMgK
	yoIhxrySimFpqC4QPfbJe0bN1MUFs+rzpUweX3DbXD0ge2q6DtIJCDnrIo3Hd7nNUFdHSOuyvaw
	CMojXafzPGLEPk22x5d/q/1UjSo7WGgDKw3soH/HTHeQ9wFHUBWWQpGeXF+Ix0B8BPcuKucxzhC
	UAo/kxykymO/tyDQf6IzLQu6bWt0tLtS0BtG5WFExM/mJ3gBP+Bp0JDalmetWI9RWFYq6nK567l
	81OQ8jf4T/tsPMWGD/+v6CKErmKvkEBzvt2l4Z/Rfq7eWQ0jyAKqntSb/6xObx5nImJnoD8rYIM
	LwQH5BQI+stBIH4qiZ7Dmy8IOx1z2LHpU5pvajH4d75Y7/+RGcF7obo0F
X-Received: by 2002:a05:622a:1e92:b0:517:6a56:accf with SMTP id d75a77b69052e-517edd186e8mr22626521cf.1.1781177116056;
        Thu, 11 Jun 2026 04:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:517:6a56:accf with SMTP id d75a77b69052e-517edd186e8mr22626081cf.1.1781177115326;
        Thu, 11 Jun 2026 04:25:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6915a637180sm6949847a12.26.2026.06.11.04.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:25:13 -0700 (PDT)
Message-ID: <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a9b1d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nQDTg_FwCyLU4XyDx0YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfX4NSrAuYyvW6E
 fMlGVd4eSUoVIxucG6qtzJJ4BOtlBl5vCkCCE2lThBeQQ/U9RHArgV/etmPsgSJklWWegiUqYaN
 o0Gsr6Ki0jh5RBfpcARp+DRV2+F3DB8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfXxbbgHC0Eby7B
 TkFryi3EYijxVWCkgHabmxX7iJx85NBIp1W0LsAYb9tcr5blRrQBu7OM4/6mBuFszZxAspAO28j
 Kb5ldAhT7khNBft5wjpRvXw5N6IYu+3bpCUjt5tE+ZTrSFv/GV9fyYyEXmTbAaRv2KuWycHN4nP
 s4ZCrCl/UGHjJ/2q1AfxT+MCD0jhzGfFeGHcuQeUVshf73xP+7+BZhpzsqX9k3lShsBJg35d4HJ
 z2plQ6o2ZsiB++3DMn/ETLV8yKd6GsHMDOmCdUB3eD4n/SdslCYyFS3zlGLDE9+1Bw1bqNavzQP
 921PFwwZHsWt2lvic8iD3jJdUpNh2VgTjyf1JAfn0q3I7GMG1RgQbKnCay1cwRfTIjitQUqeYPV
 jKNQYNZVO8MFUJQdYFY+mY096c7uSiLUSkdyNYXhos9Ri54AZ6kumntr2RzumV+hCAPOcm/1Rxb
 1NZCV2DVQe9SaK9Z2iw==
X-Proofpoint-GUID: NHvyBs147ND3yWhpqDFM0MGTuk9j0bIe
X-Proofpoint-ORIG-GUID: NHvyBs147ND3yWhpqDFM0MGTuk9j0bIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110114

On 6/5/26 1:26 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
> Shikra SoC. The CQM variant requires both clock and reset support, while
> the CQS variant requires only reset support. Update the respective device
> tree variants to enable and override the node as per variant requirements.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,10 @@ chosen {
>  	};
>  };
>  
> +&audiocorecc {
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -23,6 +23,11 @@ chosen {
>  	};
>  };
>  
> +&audiocorecc {
> +	compatible = "qcom,shikra-cqs-audiocorecc";
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>  #include <dt-bindings/clock/qcom,shikra-gcc.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> @@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-cqm-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>,

This is called AUDIO_CORE_CC where seemingly all the clocks live

> +			      <0x0 0x0a0b4000 0x0 0x1000>;

and this is called AUDIO_CORE_CSR where seemingly all the resets live

so it would make sense to split them

Konrad
