Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9651443E9CF;
	Fri, 27 Feb 2026 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206526; cv=none; b=j9sDyJElbiEQTaIDs4NmaYZjP3odE0y/WtMqBYuIHfVGL7V9C+c14lbAMGM65NEYibsCf4MXzPgeqKnC8mM1qydF1nPVroSvIh4s1gNr3SHSeb/PR+53akDr2BzaG4wq7/eIxr02Xl//Qf+asraEBeFuK2nVwiLog+zy042d0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206526; c=relaxed/simple;
	bh=2wm97TyyZjI/SrmKi1/wNI1HD8jHbl9Gjn52e3rRCIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pi7rPGzphg+DFoDbJ02zQxJsGmwHgyRTnOoxyj9Vk1n7b1XuNX+LPYbk/IQXHhrP43CQLlVj5/EBOa+XNEuSw2KxcYPwzE21ITSh3dkabBSL7aMkOwn+e+xYsMOqvMuzt7cQNJhLFVQD35gXr3RrBxI2KrgIf+uEx1TK7IO1C/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6sQZdp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6sQZdp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5973C116C6;
	Fri, 27 Feb 2026 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206525;
	bh=2wm97TyyZjI/SrmKi1/wNI1HD8jHbl9Gjn52e3rRCIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f6sQZdp+LbTmEM/oHmeJsTS7ZJkowj3EDdtlJlNcMBWMcgSmmDiJCKl8lbQ02Tv4K
	 drKSDsqNCBvjYRfIaYS9TFDifBIs8qSoYeDmNxxBX9S0gl96ty1dkqPP8QF6Bry5pV
	 iMF2M9f9Gmoh1FKzovPo/dXy4M8K+PLnw9lpPeA375TA5DPYoxaIkLsh95w8fwaDjz
	 qqM4wPd7+bWpHJqwuKJghXTA+loymkP2gmeKA27NKrISbC7R0Y3qXYzuJhXLU+hhYt
	 jE3PSkaPVTB7g6VdpTV6RG1jcD9eQgpt7wFVjIxhRfR6/cMYVGRr2OR+eVqs/eiSju
	 lKxCz3EEjlbmw==
Message-ID: <54b36faa-62b3-4561-bfc9-0c507d9e148e@kernel.org>
Date: Fri, 27 Feb 2026 16:35:20 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: aspeed: Fix driver probe failure
To: Haiyue Wang <haiyuewa@163.com>, linux-aspeed@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jammy Huang <jammy_huang@aspeedtech.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <20260227123837.70079-1-haiyuewa@163.com>
 <8060fe77-18ec-4aa0-90a1-50eee398a55b@kernel.org>
 <0bc7875c-106c-48e1-8d40-72919ca227c4@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0bc7875c-106c-48e1-8d40-72919ca227c4@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2026 16:18, Haiyue Wang wrote:
> 
> 
> On 2/27/2026 8:59 PM, Krzysztof Kozlowski wrote:
>> On 27/02/2026 13:38, Haiyue Wang wrote:
>>> The aspeed video (be compatible for ast2400, ast2500, ast2600) now needs
>>> the reset DTS handle specified, otherwise it will fail to load:
>>>
>>> [    0.000000] OF: reserved mem: initialized node video, compatible id shared-dma-pool
>>> [    0.000000] OF: reserved mem: 0xbb000000..0xbeffffff (65536 KiB) map reusable video
>>> [    0.377039] videodev: Linux video capture interface: v2.00
>>> [    4.809494] aspeed-video 1e700000.video: irq 57
>>> [    4.809977] aspeed-video 1e700000.video: Unable to get reset
>>> [    4.810341] aspeed-video 1e700000.video: probe with driver aspeed-video failed with error -2
>>>
>>> Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
>>> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
>>> ---
>>>   arch/arm/boot/dts/aspeed/aspeed-g4.dtsi   | 1 +
>>>   arch/arm/boot/dts/aspeed/aspeed-g5.dtsi   | 1 +
>>>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi   | 1 +
>>>   include/dt-bindings/clock/ast2600-clock.h | 1 +
>>
>> Please run scripts/checkpatch.pl on the patches and fix reported
>> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
>> patches and (probably) fix more warnings. Some warnings can be ignored,
>> especially from --strict run, but the code here looks like it needs a
>> fix. Feel free to get in touch if the warning is not clear.
>>
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>>
> 
> Seperated into two patches in v2, please help to review.

No, please wait. One posting per day. We have enough of other patches to
review.

Best regards,
Krzysztof
