Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDD168BD;
	Tue,  9 Dec 2025 06:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765260110; cv=none; b=LuYwZ4yXgr5PnupFih4NrlPCceBQqNTmhfBomqosSYjDWZ5wY0E2biAqWr0pJkxP7gEtRB7vIuWThNI6jX41cqtIuGz0RcPSeu6q5DY/2ZRnxDAyifRwNptakqss+036ny6wVUl+W1Ptp76sgt9hSv63FnllCl6m2ttRMF/ZNNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765260110; c=relaxed/simple;
	bh=HdtPK6iYrRFuq2CVhFJGFpGIYHyWnTZQI8p7EvGykcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rz6vckMmhweAxJ2pgO92cE4GbN6qer9ZZ29ZBAWlv6F1nlpbiy52lypDojfKJo47TYAL2eKtJaVLS9WIeNeMHd69lqP2AM/53GkusXvs9s06f/av95XoAy4K8TwgfmXjbHQp4gLk+qkaxaoa8PJI98BZXpLIkmDqRrrk0x5zrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFcNpqQN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFcNpqQN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE53C4CEF5;
	Tue,  9 Dec 2025 06:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765260109;
	bh=HdtPK6iYrRFuq2CVhFJGFpGIYHyWnTZQI8p7EvGykcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TFcNpqQNRaA8+CIpFtE+dr0meXUL9MCdFSLzg0h04s0hMzM8JajU2tZNXPFbJIjwB
	 fVBXHLz5VlcYeKC5KKPR4Td/Kv9g5AZ4TH66E2/04tLwPBrvn0Tu6Un3lcDDt3eHyv
	 98O1wp/XkN41OdQGapaofNzcFC9Do/zIrMNO2o0JAPmyCTLlGAM+TbXSMyZbFXcHjA
	 miw9GLscxpWPhcRz99KMSwagdy3J1etxKwYgszAbGl3Aj3JXs/h/5LKOcUIfXi072h
	 l3/7ZRsPvc6dxb2e4rx9uBVVNkts+9qGWQomumkjLcfs/3xQnYq0dvp3yC7jUTQTYA
	 m6apX/krIJhEQ==
Message-ID: <4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org>
Date: Tue, 9 Dec 2025 07:01:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
 <20251204053635.1234150-3-jian.hu@amlogic.com>
 <20251208-independent-warping-macaw-74a169@quoll>
 <dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/12/2025 09:40, Jian Hu wrote:
> Hi, Krzysztof
> 
> 
> Thans for your review.
> 
> On 12/8/2025 2:17 PM, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
>>> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>   include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>>>   1 file changed, 47 insertions(+)
>>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
>>>
>> Where is any binding doc for this? Why is this a separate patch?
> 
> 
> The ARM SCMI device tree binding specification is located at 
> ./Documentation/devicetree/bindings/firmware/arm,scmi.yaml.

Then git grep for the file name - there is no such compatible. Are you
sure you follow writing bindings doc?

Think how are you going to use these values. You will have phandle, yes?
To some controller, yes? Which one?

> 
> Certain secure clocks on the T7 rely on the ARM SCMI driver stack, which 
> is officially supported by ARM.
> 
> The kernel-side SCMI client implementation resides in 
> ./drivers/firmware/arm_scmi/.
> 
> To enable ARM SCMI on T7, three components are needed:
> 
> - Kernel-side definition of ARM SCMI clock indices (this patch addresses 
> this component);
> - SCMI server implementation in the ARM Trusted Firmware (ATF) running 
> at Exception Level 3 (EL3), which has been integrated into the bootloader;
> - Device Tree Source (DTS) configuration for ARM SCMI clock nodes (the 
> DTS changes will be submitted after the T7 clock driver patches are 
> merged upstream).

So silently you keep the users hidden? No, I want to see the users.


Best regards,
Krzysztof
