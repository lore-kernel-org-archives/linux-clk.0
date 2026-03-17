Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30539363C74
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768553; cv=none; b=lqKOnBVZi1TSytP0sxZChUezBgF+whe3/XF2hx1Q/JwWhrIQufq09+hOH222NoGi7d94XJ7h+0YOHks/jRstRpfmefHbU4y8TKQnbsXgYEk42X3NmjV/HOGq3MEGz9ONIPJ2BWxG5dDjOZ17vfI3cmEbkqomMG6MpZQ77PoUIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768553; c=relaxed/simple;
	bh=GAKCFy2OkiKG7jpWJ/XJktQv9SAhQII1ABVEufIwzOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcJB/Pcwerzn++q7Iakb/oGjHrervgDKuJF0/5el2eP50dX/tv14oGXVJZ5ne9EMpdMCEDtGlHbCbmLqQZozehACyAdTCDa/GExro/cfbzWwxzQHJuVHpyd8eA2ipU6xmddlJHuERSXXKqn+lgJ6xig4bnVUnUaMPxyNbkUdHGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdvK5O8r; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdvK5O8r"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso68806435e9.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773768550; x=1774373350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HY9BNi0SB5U83gy+SRIh1ay4mmvnJ8DxaHKR7xUwkfM=;
        b=gdvK5O8r42PNDfDku/MX5Sha8NGmBDu+QKqs07OwjWBFNc9/TE5KGT1Z36AjEI8L47
         RLqjxfEWLSLMpwAhMw4SDFVyfY467iWwQeRHY1/vo4WwaPZkeO5AfxxNJ8d33bqMyV/v
         wGYv/V8qIcam/5MUKT5o7SE/PSIXxzwCwptaJoaDeYpFdGury+tFzLzH+1pvgYhn7Snp
         81c4ZFoxRPXTeGGkAHJk9MZYgayvSbQtw8odV+RnRgAaGHKeUZBk8msUSL3HJTm35apv
         b2/bWsS5S+v9zuFRKkSBXrt4s+56DYGEYODmwSZ4+1jr5gjo/FtV3dDoWQ5WdEXrZ7Ut
         E/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768550; x=1774373350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY9BNi0SB5U83gy+SRIh1ay4mmvnJ8DxaHKR7xUwkfM=;
        b=s6lcXnLKQg+mljWEUZ00VogaJaC4xwzQV4P8qzY/wbcgrG+tVJJI1mUkC4BemjB/hM
         arLLVYHAe1OGgPIHO1tzu3qRGb/SWUIr91j/nccEYDK7vG4SD0s9FvlBuFHce6TUS+O5
         bWaxslFCmnKy6gI30YD9e3NtxhHzw3k5muVihaL2qlp1PW5roaGOhTC770vUVBttEuTc
         iqLAH7NojXUFekX7Dioo8dkS7KUCfJvEaUlgrBvDC264QsairSsSmcMGye+ToegK4RAF
         9l2kxEQkvWharA0BadBOstYgHgjKh8r28Ycp7On7xDXfPF+ci7ETgK0DIHndGTggIG8+
         15YA==
X-Forwarded-Encrypted: i=1; AJvYcCVKq+uNN1fyC76/13NMDfm9j0J6TajcMNTn+CBFBB3dC56j3uJhLa0JmKDnKgOSuhH5ab8lqzWWCV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTkbAOdlFPXluPvc5QTxMLkxx8VW/36amrvAW4W7Qo7X5Jc4s
	WrxgBVQPxYylovW/G22vpqO/Cl5v0FySDMJRPTQ1QH4qDLmWxf6SdB+X89cxm5hHXRs=
X-Gm-Gg: ATEYQzwWR+KlxuWRqiU17rmoB8+1YGj+phQEa3GUsttcr28zASbx3CwT9Am/JYAfmva
	0iUDsy2enmaDFR+4LeL2SFI3Ou52Bn14MZ9FV7K651Qc0YI+pYTaRMluR8AmvV+eWfkzMUUvkhL
	W5J/3ojeksLz/x2KoGEM9nb7d8NTYMHCi7aULHvL0//SD+XcFvtOxSw/X1Rn7+g+JU1oHyZFmLT
	fZG5nwBDdJZUjDs4MKf96icYmBMzTC86I5VdPutxUyK6gw7agL5etJ+iQh5R5ObrEqTZtezeQf+
	c88yIRG8cABu/BbjYIL0Q+X7Lz3ZvPD4I+k6aoZon1TQUyWyZ+3SnOzLOmzrgftcRlf2DRNFnIl
	A6CpTbvCE/xsC7JDL0tcNTXJz50FH8OCayCguuzCjH8VmNXRle34iQxXMYHhzgirPqqI/gW2ql/
	yxSbreU77MefQ96lgM3CEYhlYJza4r1ERrUkzpTL1bBtef/o9u5y8Z/lSGekQhHOXBHCXf1DMXO
	JonsHk=
X-Received: by 2002:a05:600c:4f0c:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-486f4208becmr8101705e9.0.1773768550459;
        Tue, 17 Mar 2026 10:29:10 -0700 (PDT)
Received: from [192.168.0.100] (188-141-32-125.dynamic.upc.ie. [188.141.32.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f443b77esm4890005e9.15.2026.03.17.10.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 10:29:09 -0700 (PDT)
Message-ID: <85fc368a-c765-487e-bd9a-c5dd0376fca8@linaro.org>
Date: Tue, 17 Mar 2026 17:29:20 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
 <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
 <2eef8129-8cec-4ef3-9bb1-22e78b004905@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2eef8129-8cec-4ef3-9bb1-22e78b004905@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2026 16:29, Krzysztof Kozlowski wrote:
>> To my mind that fits the criteria you've set of !depends on parent.
> OK, understood, although I have doubts though, because you have also
> interconnects and iommus only in the parent.
> 
> Regardless of that, even if this fits simple-mfd there is simply no
> benefits of doing that way and your driver should just populate children.

Right so this is a precursor to what I'd like to do with ICP/BPS and IPE 
which will define iommus within themselves.

Not quite ready for RFC yet but:

https://github.com/0xB0D/linux/blob/qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots%2Bstats/arch/arm64/boot/dts/qcom/hamoa.dtsi#L5676

Then again if I'm understanding you here, you aren't opposed to 
sub-nodes its the simple-mfd you're skeptical about.

There's nothing stopping us doing platform_register_device() from inside 
of camss to launch these devices ..

---
bod
