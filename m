Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032081;
	b=QtZxuYoNtHQjdkLu9rriQAe2Nnd8MZoxcg0gs1cF4DY4lGJdS7qX8j4xLRLw0iKrJ/NP
	 ENEhDIbNniRU2QWd5p/Njdw4xD9IU8TpLNvt9r29bv8L3mJfgBwDU0EEiMMQE1+nxnXgF
	 pkqm+B+h8PpuIuxKZJzqL8RXHs7LdBXitB01RoPxjcCQnC+NxxKY8TZb+tyQADUObi72u
	 ypbhbY5BINwvvTkTobZTm579y9FIGPCKiJKYAHMSG7MUipaLTN2BTn+8ipIw6uefgdVZD
	 DkSyo8kYUQll7UFJa33+JpHmwieDj6MD7+YDfjQUPxTQCwHWZ10CFrCKLKKVGE3nPSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
	b=uiv/iY9TU8aPWKBxrh+mLngJ21M4ZgYMOBHUXjdYEnW+BkrpBdtE9v8+EznXTZQYgRBD
	 0IiNbPDm/rt/HZSAVj52YvgZ3GR7uOt0A83VchhS1+oA+8+W7eXz8+Q8anRsHkKdKzOpZ
	 eT6gChi3vhzsAz2p5TwyaJrupKbZhc4Mctfcb+s4b1vZh6jJXuG8SD5BRnmJ5bRDzCMly
	 r08C1KNE6PRe35fdhLpTrsQYED24/NL8bTT34tU5gcM2X+DGvoYFRcj1FTXp08ZCq8fgD
	 /4PjEET7QRdhpwDH91AGcGXvKt5mpCQyobUpWDBDBwefWxddBG6FwmxV58hUpe/RTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvcr8v8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6gLnBcl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2685606A321
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2685606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvcr8v8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6gLnBcl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw6qt3584353
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgbFgdGwx0LxvaVp9RgzD0rA
	2Eaf0b4Fh1Y0S4eeYow=; b=Icvcr8v8v7hK8qcfYwrBYrcqCMVNXeTz3YpTKEXg
	mdmdJ5SuXbVcw945UvK6fUFy7RYibLBAbrK9JVEJ/fBsyVazlw4CvovBwSBDax5O
	JFmOcSwc4pt41RSCoZg1HvxRc1DExZgWUj6rf7TyerDYnGku69EpU5YAb6BbYBHl
	Unv+vZJOfYr5sPnBUerBWR0/68KBwCeb6iec/tGteUwt+VAQlg36QDA90tpD431j
	t36hoZZwXXNbjJsr+hg9erH4C/+HvLN0VMZSDlXwNuDpKa6TWnICxKknknZ1X29L
	j+yCYLrKXmPub9xBgoI8c581p1fNBGyfyyLZjkwCWEt9cA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddb2s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 16:27:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so12875285a.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032079; x=1793636879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
        b=j6gLnBcla2HE5aRaz6IunowyyoGLQREkoQaaGRXLUmzgEmASZ3EIX9yDjYlRi2aJCt
         iaoPRJnVL8yHvAuXgk2VE1Y9KZ/R4QNFMaqTZhvJocKBhKo5xBHIwJcomERoxFuEKN2m
         sQbXBCWTBalS8JM/Jq+aRBdVt+QW0FKqAQL58tKo1EEfoKgiZ6Tl7HczpZ+KPRxbIgs3
         30pnAnMf3xxN6N1xIP557rsB0zrICK3iGqSioMzighwpAppjobXnb5Lu6ktIaInE7cmx
         xjjLt6JznYJ3mKKl7B6WbQch4NDP7DI44wRwuU7p0EQcjv9TIlTvnNCyddQBpuJlG74W
         2N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032079; x=1793636879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
        b=yo8WbeBIK/J2ey3etXMynn4fd1zr1XA9fRwcysK6AYJcMJfLaVEi286PdDyeFVPg/p
         MYxGvbaQdKdzRXmB4nprTjnCxl4FCHy0P17qDCnbmsX5w3P/E4MFuQ/vD3t3E5V1TrTf
         4qqaqx5cNNKCzP7UCq/7a2dg1mzVbcfs0Z03kUd4kebS3AV9B3Q3/1xfU520EXBR1Ek4
         ZbUddGcJQphMoeuVGKp0Bif3cmoke8nhiryfWTZkxHZNJhLt3lrQYNWA1dNkccjqilie
         /X9H1KyJ1yhurEIRh8WfmJjEOB3fJtmw7Iq5SmeXcLSutn3efCALqRLY1osKvSuBXQDW
         6kSA==
X-Forwarded-Encrypted: i=1; AKwUvBz1VcpdA5Y81BYVrRjILMxgUpmYRT/ivCZNZkCeizbS9OGAwtW2RRlH9LwefF8Sfe08y/xLc8f7knM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/iDS2/E++Ncf6Id/lvFNrnRncxVrxe/195HzNYReQYQpcG5CR
	540iTeatgSpEq9wjJiXmP5y/k/nn/1nL1J3exuG6MJeSbne1xoCosyxde1/hdE2SB9kDmzEAli6
	ALUFWoQ4dO2UmKGW7s8Ji91LDmDNiHIH+EFWcNp/EGlgIaO1KiN0nU6zZFbJUZ0Y=
X-Gm-Gg: AYBFou27P6Mziyj+nq0+YA6FyVWgoHdphsDpxRtZ3/ivUUnoZ9lZDkfHC8QcP6nAUGj
	WZpPwbGKIzHiEnwJWKcwdJw9Eb9Fhn1sx1HZ1QlFMEBXgCMGj9TnKdXGqNCMbOPjfFR9lIsuQFo
	yIXtSCl0hQweH5RC1jw9jnX3gG4JeAq0qbcR4/I9lwUMBzs/DczEjSkBfMACt1+CfoTYwepUWQF
	v5YE0jl5ZYKz9FiXA9I3DksXfVa1pm8DSJW8R9X2FIF/Lx93p65uDY58RPzvQl2Rm1+hI3j6qHJ
	H9uTS14ekzKs9FW5dIl5PhUfgfu/ppSMuTgNg8qoB+4FcZkS1Ta+Ry7RN0Jp8CPAJyWyKQmaLnB
	Oo8NkPzEjgW+wCUpA
X-Received: by 2002:a05:620a:27d5:b0:943:2746:3c4a with SMTP id af79cd13be357-943f4a05fb2mr32407985a.5.1793032078947;
        Mon, 26 Oct 2026 09:27:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:943:2746:3c4a with SMTP id af79cd13be357-943f4a05fb2mr32399785a.5.1793032078257;
        Mon, 26 Oct 2026 09:27:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm18160539f8f.24.2026.10.26.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:27:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:27:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
Message-ID: <oxkqlvbjnlji4zyx7frurfjzf2ryfkbjjirwkewtp5trj7q5nf@pg6pogt5z6pi>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: S5YuE0U8bEwZCUroohHGl54fXdL8gl4Y
X-Proofpoint-GUID: S5YuE0U8bEwZCUroohHGl54fXdL8gl4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXxZob3Opsi1hp
 5GX2awZQMxjCb8DDqVLtRr2bWEP3Oa4azgcfBV9gdq/UAVBMEHmFSD3mg01KceP57DkMxQzaRla
 DNYiOo5LEM/AskV92pan95EBa+lTHUGSeKaGezgQT6LM0rcRtvMIsRBitCz4lWNFlYyaZIi5iRp
 lAWkzCgcBmz/T06UKt44cc/UsIYNkWqSS6jlEfx5Dze1e3VFWSXFVA6Y2XcZmDnW88ZmNrGfqrC
 FN+tQbjEyUkJhLtIjm+RnhQfLRWB45uajI6pMIJACh933aYWeLPqtJEaj4pTRKtT7bpk56JrixX
 OSL8id7fkbAiJDCnWllEJWV4stooXUkPKmXNSVfc9BJOTFFJ8Z13d2Ai5z+twPmxOwe8MvN3L/+
 GSqzDm55DnbBnRdn3Pl5e6Cn2WSojDO9umsx7UrCi4Sgn4iPVvr/A++yM7PhsA0N+mm3MGE80kG
 H5XT6IbgrvocAisiIvQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf7f8f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oTvOlQyMf-P45GjRKUkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXwUv2D+PUnefl
 1amWac9IZaGvcsod5HowGnrLYgu/0TxDcwfxup5XM4+4gfHwSmMv1Cs5INUmf12jYyhwxtcmU6L
 8BIsyBli5C1suaRExf1J0C/c15HdHTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On 26-10-26 16:59:37, Taniya Das wrote:
> Add the GP M/N clock controller and its pin configuration for SC7280.
> The controller uses the PDM XO4 and AHB clocks from GCC and routes its
> output to gpio60.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d2719775b8f5c6a8cef138a93292721..de27a051ee3b0e9046ff97b8e6fe0164985d7b17 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4442,6 +4442,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
>  
> +		gp_mn: clock-controller@88d3000 {
> +			compatible = "qcom,sc7280-gp-mnd";
> +			reg = <0x0 0x088d3000 0x0 0x1000>;
> +			clocks = <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names = "pdm_clk", "ahb_clk";
> +			#clock-cells = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&gp_mn_active>;

pinctrl-0
pinctrl-names

Same for all other patches.

> +			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates = <4800000>;
> +			status = "disabled";
> +		};
> +
>  		qspi: spi@88dc000 {
>  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
>  			reg = <0 0x088dc000 0 0x1000>;
> @@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
>  				function = "mi2s0_sck";
>  			};
>  
> +			gp_mn_active: gp-mn-active-state {
> +				pins = "gpio60";
> +				function = "gp_mn";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>  			mi2s0_data0: mi2s0-data0-state {
>  				pins = "gpio98";
>  				function = "mi2s0_data0";
> 
> -- 
> 2.34.1
> 
