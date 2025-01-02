Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3200D8F66;
	Thu,  2 Jan 2025 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842584; cv=none; b=V9iBB4UprYtws1X8zkgueDpgCHGGBFOVvCW1VoICai8NOOGc7s+rxfkfiuD6gEv4P/tAKV0DBZUSvfo535LbcrCLsqFQ+lPd2bEamB0c4aWLomME8nERThXAm6ekAXXMRoRGW1ocwi2DueEtNH8ESFFp94s8UuNp0NKCsaJUH2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842584; c=relaxed/simple;
	bh=GPD9FWmRI37nv2a7wzx/lQa+UlyPkzsqDMwzppQGxbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGrhOKp9Jy7wzpRoBDFte/EERxk+pg4bY6JTnieDOKHsX4NWcb027LvDih+S9WtUkHuEX5jNJCpEVxlyYsDQK1ip0hltncgCOe2x0OMUwuPD1L0n0qQS3NNglL33DsEXtMcATe67AisRlMKrZrReHbo64WFsvzBamxRf+tv8DFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1FOwkdY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1FOwkdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65904C4CED0;
	Thu,  2 Jan 2025 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842583;
	bh=GPD9FWmRI37nv2a7wzx/lQa+UlyPkzsqDMwzppQGxbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1FOwkdYM+RD/ZWn9cUQfLhVddPNleH8kulhphKLtkwBR/XGX3801H/xaic5hh3/v
	 x9+ZAP4DXggjiPgJrH+n5/QK0RyUcmCjJiopEpkpHXmGm2FhbJP3w9vSXvHx1SHmY3
	 snGXFonMTg6hlRjHWtqjKKCW3I6sV1E5cM8W/wX4wsVqNtQAOtlaANDVzzx0zPJAP1
	 2jcUQIs54zF5H8E1RO8aq1y2d9aMZpWX+1goOUpAlnIvKgq8v+4NqWnEsLLFPDKf6g
	 n5ROAJ3N7q0y+GTyaKb4/7EzqLt7v7JcMS9AqGiOQPk6CVQ4I3NBPAgHwjV3w3710X
	 ExEFkxAqCCApg==
Message-ID: <35351b4f-daee-46f9-8d0e-f3de12869794@kernel.org>
Date: Thu, 2 Jan 2025 19:29:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: clock: xilinx: Update VCU bindings for
 reset GPIO
To: Rohit Visavalia <rohit.visavalia@amd.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102163700.759712-1-rohit.visavalia@amd.com>
 <20250102163700.759712-4-rohit.visavalia@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250102163700.759712-4-rohit.visavalia@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/01/2025 17:37, Rohit Visavalia wrote:
> Updated VCU binding for reset GPIO pin as optional property.

Subject and here: everything is an update. Be specific and drop all
redundant things making this unnecessary long: add reset GPIO

> It is marked as optional as some of the ZynqMP designs are having vcu_reset
> (reset pin of VCU IP) is driven by proc_sys_reset, proc_sys_reset is another

"are having is" looks like two verbs.

I don't get here mainly why SoC has something driven by its own GPIO.
That's unusual pattern.


> PL IP driven by the PS pl_reset. So, here the VCU reset is not driven by
> axi_gpio or PS GPIO so there will be no GPIO entry.

Anyway, this has to be constrained per SoC.

> 
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
>  Documentation/devicetree/bindings/clock/xlnx,vcu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
> index bdb14594c40b..b3061309f8dd 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
> @@ -36,6 +36,11 @@ properties:
>        - const: pll_ref
>        - const: aclk
>  
> +  reset-gpios:
> +    description: Optional GPIO used to reset the VCU, if available. Need use this

Drop redundant parts. Not being part of required defines "optional"
already. Don't repeat the schema but say something which we cannot
deduce from this.

> +      reset gpio when in design 'vcu_resetn' is driven by gpio.
> +    maxItems: 1
> +
>  required:
>    - reg
>    - clocks
> @@ -52,6 +57,7 @@ examples:
>          xlnx_vcu: vcu@a0040000 {
>              compatible = "xlnx,vcu-logicoreip-1.0";
>              reg = <0x0 0xa0040000 0x0 0x1000>;
> +            reset-gpios = <&gpio 0x4e GPIO_ACTIVE_HIGH>;

GPIO numbers are not hex... unless this is not GPIO :/

>              clocks = <&si570_1>, <&clkc 71>;
>              clock-names = "pll_ref", "aclk";
>          };


Best regards,
Krzysztof
