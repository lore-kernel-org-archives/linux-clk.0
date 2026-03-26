Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E6929A32D;
	Thu, 26 Mar 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532999; cv=none; b=simChH78HnYT9q1J7fPyKfXtW3OE62c9IL+IuXi9U8ocTxhgyJCzM31VGvxrOzk/5snMEXCncQ9bp6JPWydJvGaWxHRhDS+YGUwj/BRrjE9AdY86KcRKKLWAhl3vYdvZiLWFdWvmbFfyifrb0gEczsqnD2bvRsm7ry9IsxRl38w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532999; c=relaxed/simple;
	bh=x+fkM6vu5h7RY1/dOIAEf+g4E+vu6Ey+LIqxNEADWHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwfbc8gUuje3Yfwe/pjUVl+o9d/SkfnBjV/42BTFrje4vmXNWREEVfqoRnp5C77eRk7cwsMz+iPaDBQjs2FDTEwQDlGgns/QNHqPoCbaYjTHa0J1cKGwwAutOsxzyLvvK6UeIfMMMZAZjp4kUwmVEebdSGRLAwMNFQMdkkGwoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrHV1CTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrHV1CTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9DEC116C6;
	Thu, 26 Mar 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532998;
	bh=x+fkM6vu5h7RY1/dOIAEf+g4E+vu6Ey+LIqxNEADWHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KrHV1CTnkTzSlumk1EEyxUu+GRLJnu+FL95+kGj/yh0MC3EMjWf1+XB/HMzf7I9RG
	 Y5D+K7uO0JZjV9+bzASroCdyKyz7PCY4wswtiFu6dkiFSK82pDcBfEgjypEOMOeQbJ
	 Mxp9Y21UXiA+i+PZ3If+3QesNlg8JehOOToMmJy5nJtF6HdPsIMN/ceZxEsFZCVbS6
	 JW/km02lHPcd2mkBylT3szbC87lg93oei+pnpgOYNqV9/Wt3ihE5GCp2NjN6hARF2/
	 yHdlaMH/n1o05XSd/zkmB/NivUVf7sxLWscU01YiPA4GV5oMuK7KudVWZFDEfopcCD
	 RMhH+8494LkJA==
Message-ID: <b7a4f719-b605-4d26-a5ef-9ef2ba8d07ec@kernel.org>
Date: Thu, 26 Mar 2026 14:49:54 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <8e7d0c53-aa23-4514-81a5-335a76bb0c45@kernel.org>
 <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2026 14:39, Vyacheslav Yurkov wrote:
> On 26.03.2026 11:08, Krzysztof Kozlowski wrote:
> 
>>>
>>> DTS example:
>>>     clock_guard: clock_controller_guard {
>>>       compatible = "clock-controller-guard";
>>>       #clock-cells = <1>;
>>>       clocks = <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;
>>>       clock-names = "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
>>>       gpios = <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIVE_HIGH>;
>>>       gpio-names = "gpio-input0", "gpio-input1";
>>>       clock-output-names = "clkctrl-guard";
>>>     };
>>>
>>>     custom_device {
>>>       compatible = "...";
>>>       ...
>>>       #clock-cells = <1>;
>>>       clocks = <&clock_guard 0>;
>>>       clock-names = "clock-guard";
>>>     };
>>
>> So a pure SW construct? Device has specific clock inputs but you do not
>> model them and instead replace with one fake-guard-input.
>>
>> I don't see how this represents the hardware at all.
>>
>> Maybe some diagrams would help, assuming we still talk about hardware.
>>
>> Best regards,
>> Krzysztof
> 
> Techincally that's correct, it's a software construct. If this is not a 
> right place to submit such a helper driver, I'd appreciate a hint what 
> subsystem is the right one.
> 
> I was not sure how to provide a diagram in the mailing list, so I posted 
> in on Github https://github.com/OSS-Keepers/clock-controller-guard/issues/1

Diagram of hardware. We talk here about hardware.

> 
> It is a driver which models dependencies for other drivers. These are 
> soft or "indirect" dependencies, because we cannot access the FPGA 
> unless the FPGA_PLL_locked, and GPIO is telling us we are good to go.

DT is not for drivers. It's not about subsystem, but concept. DT
describes hardware.

Certain generic bindings which solve real and common hardware problems
are accepted, but so far I miss what hardware problem are you solving here.

Best regards,
Krzysztof
