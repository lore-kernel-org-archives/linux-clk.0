Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032028;
	b=Yw4m1LNouU7fn+MCiFh6UoF3/aUqVMfi1iChMCEvxh4tDJvoT9DOUvA6HGh+HtkI8knK
	 EVBEju++QjwYGOK+2/nwWOwZwFF42/OU5IeZyPj4CpjxEj9CHDtJ9J5gf8EiGS6/SzK6N
	 OWy/2Rgmp7XGo5sKNW0BsvZ6So1VFZF4GbJbd5AfNk8OfGGxrByFwJHyJyW7MhfyuXTtJ
	 5zyFslKTQHrFIaOO9gRyl+He6WwQo3rWegq15DGnhWjclxijrDf0TP7fD3Cd9uPNNDsnu
	 RrUuYKZDUJ44aKsatwEZqd4NjGU15HgT4iCdwcruja2Go/WoZE91cSJG+LyS00lgvyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7E7JheVB5mT4ZewanQJ+BiHMZ6J0mXX3JGLrjFPrttY=;
	b=j/MSYfGDIFN4Cnp36cG8Q/uIHV5WyBQr1ZZZd98X8iA7vsTfBELRgY2R+h6odfuCU0qv
	 4F5QJPPk6BNtf5W+Pzxz0/Ed0UF5VeyjekmUU9BPkBjnhkw/VCR6HjwzYCAk5YsZTP/uA
	 g/cSMV6Hrhp3BR4qK2t5Nq6qXQEqJoeHTgAkaENGghTvsuI08sv9Y1atU79E4XKc7GPka
	 FS2Ohxtf00sBMHt4BAjK6twTLir/CN37AwR42Ne8xncyLBtaua4MBiT28W/njvdNoO18e
	 J9uO2MOgF8hTCCXs3depZgRp67lYetUH4XB91otAQ4g3RCLOJPHMdPuFXcPtvYCB1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcZ+5k16;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GtrO9k4j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5FC606A31F
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 16:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5FC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcZ+5k16;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GtrO9k4j
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvdPq465843
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 16:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7E7JheVB5mT4ZewanQJ+BiHM
	Z6J0mXX3JGLrjFPrttY=; b=pcZ+5k16Iq9hysPAjv3DOUSq7txNAigQ+lOp49To
	9u3s4JTZCPFbYvSgOeuLHFKdPyNFpq2dLPA08PqFuhhO0+s5iElMG+j3QpyU/Q/0
	+YS2Bd7MJ3oz8fOoZY7dBpKotXiBe844JSTSxCtU51hnwx+6y6b095tX/I3TaG0l
	Vr+giR2L+gzcpPPbpX4wDWPxPM550AvEOkmpoQsG0F3pyl6fCe9ZjWAgHUkJ+boC
	UQDlvn3Y/Oy3+PgrvkR8wtC8XgWIU9p20Wqs6ZgfT9ijHQNoxv7Oewg5Xp8FZFms
	peb3ptiTwB5SR5BG+z3zOQfjb8UDtpcgf2sxHKBog5DybA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpub03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 16:27:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so12673085a.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 09:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032026; x=1793636826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7E7JheVB5mT4ZewanQJ+BiHMZ6J0mXX3JGLrjFPrttY=;
        b=GtrO9k4jDvhRQWD68Pj7BwygSdgOeohVA/zscJ3C/35C3jdBZ3LJpdSfwYE1OgXLaR
         2Qjy3asFgTu+W1AQVBtPjnsDucdizqgnuHGyKFjJpjCUjBHWKaEr8zh6gQXmyjHNMSTs
         8qwAddOKrIZDn6F5i7bsomibWy2gVpe220/Sju2ea12upzOdU6WkKhyxoqxINDWmHvVq
         d3eWeKmx9B0HD5do6cst/oBXFnFaWXOhnZewAC6/PPyy1PGSQt928CwfNhs8c5fLaQQo
         23799JuV+Y+IJQj4SgH7gr9Orbl/t0YhZBTOAix2St/UdWHKWbOUXlNLWpTrZnm+b0Pf
         qOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032026; x=1793636826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7E7JheVB5mT4ZewanQJ+BiHMZ6J0mXX3JGLrjFPrttY=;
        b=ukITR6Tzz5/+GMZmty39P0P54vFyzz3uFYWXNtbaUkjOsj5wwWBlnBEqZ61BrVx9FJ
         wFu/ycLOhLu0U3LifJFD1FBhXcICM5gxYgHeL4I9Os/X/mB+1cziJjAFpAU7ampg5FyR
         UToSrvZBMYJiwIBx9SOS/BU3inskafsB3wXJ41CEJ9t5UCu7Y9ofMW87CIRerp2unjJH
         wPMA5Uay+C0NRITCZ1HpQjwWEfUGq7Iuar+DBmlWhjTsTleLz206Df4vQ/m0Zm4daV+c
         X+785oVluGDtM1pcuXZe+fr1Dyxg8D2/SvFNqQht7fVirD6MllEW1Z9oMk3FnEkqGzHe
         6esw==
X-Forwarded-Encrypted: i=1; AKwUvBzmhfuQyXM8jmzRCXY4oXmMvz0S6rt+729x+0HbV2dHdqtAY0F6fx1obOUDKt90lAJUN5qjkq3p4RI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKHjeMoLGUBgt0vgGdZyimRs1TxBhwJsrxnOcLh82mWQm+QVmy
	sY+enKo3AhVxiApJSvhfYrRnEeHBdioKR/unvhAWT0+OrFXJbwmjujovYtvnG0C+scypoFOd6TH
	3WKsx2Z6apGQ0p5MnTMhUQuFg/zF9qvs0/ZiRcFoz2wo4+YkiYapGbppTF3qY82w=
X-Gm-Gg: AYBFou226/bzA+IB1Gpi2CYDitVXcbxB+JrKOlJopkjI/QPLWRKnnRp66vpDWPORHKS
	tq8/owI78U7y7OGsMh3HCc7JtMaMLl+8ZA5fnhn0jw5dNtHo89Uvwi2hnB/BmpJhZbCZ2/9wb2L
	HvueMwJEHfEOvYN2H05hiQqQzvgmuSwr4VB2hmVqRY2EOfJ+mvFhVpDEU2wwCEf3hMmgeYYg/Sm
	K+icHPVhgTNaThj3V6teU/YHJpvUuj2gkOW6OzDcti1Nob431Da4lrLE/jhiS/n++kNIdabz6bU
	wy2vfJPMcnKDlKOEL4c9IHfPVvQw+U6siyTf1SsXkYEpdVdf+dzBaonJwCINLGzWN3Fk0rMQ78g
	J8GNA97eYHPUmtD7F
X-Received: by 2002:a05:620a:1983:b0:93e:c12d:4eca with SMTP id af79cd13be357-943f4c19e2dmr28295585a.42.1793032025602;
        Mon, 26 Oct 2026 09:27:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:93e:c12d:4eca with SMTP id af79cd13be357-943f4c19e2dmr28288685a.42.1793032024967;
        Mon, 26 Oct 2026 09:27:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm17910255f8f.10.2026.10.26.09.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:27:04 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:27:02 +0200
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
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
Message-ID: <yf25xvzeb5gabhb6hp63ssir6g6odvfrtg7vjpej7tfjmi5seu@fr7hwa5omxug>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX5wzGkQbFwUnW
 5OKeEldBkQ0WCI5/RFVRlAHa1NlSNwhYUBdRAcXRzS1WrPwujY4LScfJ0u+hFxMl6LK+w57eIKB
 yzv/ASwcKdBhVwayCJkDiKsSZIV8BrA=
X-Proofpoint-GUID: NGtz_ZOyccR0_eYiMcbSkFIfdMzxyUWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX88YBkMfLVm5c
 8pCYYUVUViszryTLBH98zWtHW32JGuI4b6IAYJYKM+5bgfsppoO9L3JMJCbHebX+mXVcN5CKuci
 +WBiO++JQ5+9X2d8AomePlJdnZXEHzvyYI+Z55wJZ8xMjyjILjQH0mlexDBxCCEWgfnQZR1ASI5
 ljY1KIjyu1p90WInTMF1wQ/ZALYuVdsRwzyQOAc3PhnhuLqX6ETqOqiKbAdA4++wixaOt/wBQ6F
 pbPSU18iJkJPstWLd92V9WOkbmtXFYWJAmNCHS9CXCY2f/+nBeLPRjt9dqQQGh/vMqmwwwSD1ys
 mQHYGhzADrUXg5FVgXXLlomzCS7n+979YIbqtgqpVXip4I1y8K6WRqsU90+0LJtgaul7vEqEBi/
 uGYEl3SP5g/5DJr0duD6RmcFoMIu1IN/Sg3vdojai6pOq8qaw17oY2XcJiHD3jfP0T5OoKyyJb2
 JRJNH3w+Vu20rGXEbeg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf7f5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3ivmLXalSb2FnHeqfEMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NGtz_ZOyccR0_eYiMcbSkFIfdMzxyUWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On 26-10-26 16:59:38, Taniya Das wrote:
> Add the GP M/N clock controller and its pin configuration for QCS615.
> The controller uses the PDM XO4 and AHB clocks from GCC and routes its
> output to gpio29.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 8ed6f2755705c38796698747dfe7bba1afd1859e..c415e782804ca8c9d09670cb8c8cd2353d796b23 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
>  				bias-disable;
>  			};
>  
> +			gp_mn_active: gp-mn-active-state {
> +				pins = "gpio29";
> +				function = "gp_mn";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>  			cam_mclk2_default: cam-mclk2-default-state {
>  				pins = "gpio30";
>  				function = "cam_mclk";
> @@ -4028,6 +4035,20 @@ opp-202000000 {
>  			};
>  		};
>  
> +		gp_mn: clock-controller@88d3000 {
> +			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
> +			reg = <0x0 0x088d3000 0x0 0x1000>;
> +			clocks = <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names = "pdm_clk", "ahb_clk";
> +			#clock-cells = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&gp_mn_active>;

pinctrl-0
pinctrl-names

> +			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates = <19200000>;
> +			status = "disabled";
> +		};
> +
>  		qspi: spi@88df000 {
>  			compatible = "qcom,qcs615-qspi",
>  				     "qcom,qspi-v1";
> 
> -- 
> 2.34.1
> 
