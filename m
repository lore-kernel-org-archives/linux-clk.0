Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2A9hrcK"
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC411D41
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 12:22:14 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507962561adso186578e87.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 12:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700684533; x=1701289333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBmHXv1LFLt1CUldNSms0b65giZwYaTIfaDf3i1BEjc=;
        b=f2A9hrcKziz4DmQj8LJNwJ3Fu0UjjLWJ0lgtiHC2bVfisJR6yT8f1iFAeiUuOTt2KK
         06bQfzJHXe6HI/UhLM3W2VeAF65eFKDxfXjqlUxfpgpXxMSs0/iLOw0m+/1O2zJl9i8C
         MVnw/EAk2j67Ogo20Ook/qME373Wevc41ZMxvzNGLJgkzmaIl17sDcx3yvnb7aWDIvPY
         ksemWt/7C5kVYkRjcP3+aiVFbNMZUXy+mVumjRsurxnDrs1svufQ1JUkP5eTcTA0ggKz
         03yx6pFzU6ZuIrLDzu2SqKO2Q29y+w6VQCvLxCpLVJso+Y73TghE/egUr1Aa4eKJOuUL
         np5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700684533; x=1701289333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBmHXv1LFLt1CUldNSms0b65giZwYaTIfaDf3i1BEjc=;
        b=qTgrn+UhdbQ1J3lXBI8gbLOezNvR8l6YuEnnE84JkF7wVlzDDSbr/8Phmd/vKSFUTT
         Z30ZzDl2hsFb4MuCtOOZ5mQfcbQu3dNk4oNw2znROX00TvAzS3J9ry9U+SbHbRpt/Cll
         5cAnne20yEXx2CXzY48bLLWflKRYSS9PvopFuycCQhhLg2kwM6PfqHBv+g343pv3/Sb7
         b95bxmgbkJTvbJpIbS1PWnr4oGsj5ufJgu7HvzjxcAqw3BVUyjmSX2JjW0YAIC1VmPw6
         B0T60PXa/HLUg2P4i8TWmnHbpVTDCoAK9moxevXI3nWta89gRdac6Fwgbiv1An7guOof
         5BWQ==
X-Gm-Message-State: AOJu0YwYGQ1K8reHEf/LdgveFV+4LIGNBAlL4qH0zodDp64YL99xFaCD
	qA+W5hCn2pC8Yfcbu/YJoIoUSA==
X-Google-Smtp-Source: AGHT+IHGxTrXXz1SuL83vrF7iMrR32b3rAoIFAEJa+OZPMHpiDYsFrzbO0DTAdeo8G60yK8xL1j5+A==
X-Received: by 2002:a05:6512:4020:b0:507:a0d7:bd19 with SMTP id br32-20020a056512402000b00507a0d7bd19mr1298557lfb.13.1700684532935;
        Wed, 22 Nov 2023 12:22:12 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d24-20020a056512369800b005091314185asm1952576lfs.285.2023.11.22.12.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:22:12 -0800 (PST)
Message-ID: <8cece5d7-0fcb-4366-be72-6494842b7c41@linaro.org>
Date: Wed, 22 Nov 2023 21:22:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: ipq5332: add support for the
 NSSCC
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-8-a7ff61beab72@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121-ipq5332-nsscc-v2-8-a7ff61beab72@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 15:30, Kathiravan Thirumoorthy wrote:
> Describe the NSS clock controller node and it's relevant external
> clocks.
> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
> Changes in V2:
> 	- Update the node names with proper suffix
> ---
>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 42e2e48b2bc3..5cbe72f03869 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -15,6 +15,18 @@ / {
>   	#size-cells = <2>;
>   
>   	clocks {
> +		cmn_pll_nss_200m_clk: cmn-pll-nss-200m-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <200000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		cmn_pll_nss_300m_clk: cmn-pll-nss-300m-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <300000000>;
> +			#clock-cells = <0>;
> +		};
> +
>   		sleep_clk: sleep-clk {
>   			compatible = "fixed-clock";
>   			#clock-cells = <0>;
> @@ -473,6 +485,22 @@ frame@b128000 {
>   				status = "disabled";
>   			};
>   		};
> +
> +		nsscc: clock-controller@39b00000{
> +			compatible = "qcom,ipq5332-nsscc";
> +			reg = <0x39b00000 0x80000>;
> +			clocks = <&cmn_pll_nss_200m_clk>,
> +				 <&cmn_pll_nss_300m_clk>,
> +				 <&gcc GPLL0_OUT_AUX>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&xo_board>;
> +			#clock-cells = <0x1>;
> +			#reset-cells = <0x1>;
0x1 -> 1, it's a number and not a register

Konrad
