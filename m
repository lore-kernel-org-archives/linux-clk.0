Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CAF3B0AF8
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518901; cv=none; b=YgQB4gFbmblMZ5tGLuuIszTF1W3GtYQFep/u6W7yj9nFUSZqW/YqA4mZHJtwEwri7dGQjIzDc80zH9+xuQIgJvkANMCO1DFUJhn1zBzU3vPnj5nMMxSw3CdrMXXy3po2Gz9WjxkA1AXftdJxz/cB3I/mkTGK8oDqiKaTORK4tG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518901; c=relaxed/simple;
	bh=PSzU7MOsYUD4Qy7QhpTSQYID0f1netpe1FImIG4kv5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icbMgI1zciGoWAbVEdbviHGsWkdAPcLm6++BFO/k8wGr0zUNnSRjZbhGr22yPNMxxH9ZxsmZynGMyaspkx3cHiDzZ4DafMYIvP4fatPHbKSJ4sYQhZfFq/lwEqEkLs6VaLGGQ6NrcQBein2oZuweiLbtAEhGbYX1mDjmvxF+dwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=du8Sf7qm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="du8Sf7qm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaf43014d0so5294465ad.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 02:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774518899; x=1775123699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5o9Le9atm4Dc+3pXSi3olgqfG741JnzAoIdgFKRmYM=;
        b=du8Sf7qm083RkdmQGtuv+Ne0VdgG9dgxIweCFy/tfZQd209n9Yg5CwPGqKweFYSevA
         fWFAjggS6lyzZYWW+sbNM27f5lSuxv+9BJDiz9chlIkYgFOpRf0srBDaZfnFboZQVrPF
         c00p/OnuEqRYr7CeL+SOPfHkQX3NVpk3B9189n9hvGebgQaz9HXbW8/3msTkz7nk0sh8
         Mx/MPU/Z8VXQEXo/MjBasO1OfV2BXzoOzvi8bX+yTL4RF4dGvHL93oSnH9gXa2dJAInb
         zXXJvSj6R198xVySeE/Quj8tGXOnDC1BTR4teB20GiMWYzIR0My32CeCG0ymXfAkiUwb
         eoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518899; x=1775123699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5o9Le9atm4Dc+3pXSi3olgqfG741JnzAoIdgFKRmYM=;
        b=Okb7rnBlLm1VV4IphlguVs0SqFgdpekSbN/XEI5ujk7Jq9h1ksv6ADEjj6LtYIdZo2
         cDhHdwrbhdW++lCaLVbGNZ6MNUnnUyyz+ByTQeYiceGhNCpLIDKMZ5IjB1c3mfr6UHkG
         MYWge0XzUhzhKgwsE2neAOJxvoUXMeyG2Sumh0puvdkYPwktLCNFARkcAw6e7lbr8/jm
         Iy3Ibao9t9WAUZ8xOd5od3YMUxP1YNacLq258AplykL81TTozPX++IjXNE7Qioh173hO
         Me5Wxc8BfSt74SAH+4HltO0IcgXFHuQVzmX2MFXm81yNFmBxrpF+UZLhqZvTkFj/I6a4
         FR7g==
X-Forwarded-Encrypted: i=1; AJvYcCVlZzKeEnhWfK9OgHYloReOHV2WZzeI3Q5nP8N3FbmLu21JbGLdcWtokC7Js+iSXUCn1PSiBnsJWHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDDF5CTKDBSriUGhzzzQu8PZ/5dJpPX0w6jLl7tB8zs8Hx15x
	XSD7XVTqKfqf5fb08KEXX12JNtdNbN4cBmcMdFBt8Uan1oZwN8qJWptN
X-Gm-Gg: ATEYQzyQ9cAH/WRba908W1OMM0oi6sYQNFsLKV9Isu/QpJj0wA9yuxGlrIcv662wyfB
	EWbnj9tfEDOgEi98CyznOzdkwIzhpM6gg9c56+V/bs+L7GlYCsteasWsLbAcM7Jq4X3ckkRNlZh
	Xpv26FDx1tHw4LE3DuK5oASFbeQlzso+1gknNwaIOHsPyAagWh/ur8rzK1TvWQ73lu7EgXX3luf
	VxUKoewhQGfNl8k0JKjkjiSmTrVYXaE1w9MXIDITO1Q2zmgfhwkJXtjoj7D3bGM9LoUwGLU7MrP
	ORxtNtKQDdxIm3170mnJAOAjvd/BKhZCjSTYTWlPXW2cRNhLEHejg+/+3ruX8wL1frqCEKaQmQQ
	9fypbM7dHi/rs+2c+yAfyd9dqA/R7GHX6+Fb+QjkEPEFk7/4av+6I4qBHpRg4qz/hKv167oWOQr
	8NVyJaH9mMTlaQAPp4Ayr4v6Swn09hudb0FHmlRZx0rr4XBza0Cg==
X-Received: by 2002:a17:903:3c25:b0:2b0:58a8:5f9b with SMTP id d9443c01a7336-2b0b0b45ffcmr84290365ad.49.1774518899022;
        Thu, 26 Mar 2026 02:54:59 -0700 (PDT)
Received: from [10.55.231.75] ([129.227.3.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm29542245ad.26.2026.03.26.02.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:54:58 -0700 (PDT)
Message-ID: <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
Date: Thu, 26 Mar 2026 10:54:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Conor Dooley <conor@kernel.org>
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
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260323-sanctuary-semantic-432089feb1c7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.03.2026 21:14, Conor Dooley wrote:

> 
> The binding you've got says "GPIOs used to control or guard the clocks",
> which is not what you're saying that is going on in this mail. A more
> suitable description would be "GPIOs used to check the status of the
> clocks".

Agree, the description I provided is not very accurate.

> I want to see an example dts user for this please.

DTS example:
   clock_guard: clock_controller_guard {
     compatible = "clock-controller-guard";
     #clock-cells = <1>;
     clocks = <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;
     clock-names = "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
     gpios = <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIVE_HIGH>;
     gpio-names = "gpio-input0", "gpio-input1";
     clock-output-names = "clkctrl-guard";
   };

   custom_device {
     compatible = "...";
     ...
     #clock-cells = <1>;
     clocks = <&clock_guard 0>;
     clock-names = "clock-guard";
   };

The driver usage exaple:

clk = devm_clk_get(dev, "clock-guard");
if (IS_ERR(clk))
	return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");

ret = clk_prepare_enable(clk);
if (ret) {
	dev_warn(dev, "Clock is not ready, %d\n", ret);
	return -EPROBE_DEFER;
}


> TBH, I don't understand your driver implementation either and why it has
> 
> +static const struct clk_ops clkctrl_guard_ops = {
> 
> +	.enable =	clkctrl_guard_enable,
> +	.disable =	clkctrl_guard_disable,
> +	.prepare =	clkctrl_guard_prepare,
> +	.unprepare =	clkctrl_guard_unprepare,
> +	.is_prepared =	clkctrl_guard_is_prepared,
> 
> any of these 4 implemented when you have no control over the clock.
> I didn't think it was required to call your parent clocks enables in
> your own enable either, thought that was handled by the core recursively
> calling clk_enable() on clk->parent. The one thing I would expect you to
> have implemented ops wise is is_enabled, which you don't have.
> Also no sign of any rate acquisition functions, which I thought were
> mandatory.
> 
> +	.get_parent =	clkctrl_guard_get_parent,
> +};

Good point on .is_enabled, I indeed missed that. As for the rate 
acquisition functions I referred to this table 
https://docs.kernel.org/driver-api/clk.html#id4 , and it see that 
.set_rate is actually optional.
