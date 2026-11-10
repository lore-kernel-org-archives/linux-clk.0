Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299264;
	b=W6Jonf8lAIuMViWKFqITyz5+onHWqKrFMCcrGgl67PT48AiMPYmPeiEI8Gm9JQ/cWnQj
	 CyTLdAue3PdnKfkEDDWId9vuUwzCuucA1P4+vY6VrCiwAtyxfeLV8LgkbO4ENh4NYKo2q
	 juEbWlKRdx/gDjOC0YGBYu582cuPqYA/sQmRFfoU6FmIwJ4OK6ABk9Gj/1QdqLISPWj1n
	 37kX6YoQ7CZBt2sFsi8bidotH7ctwJ1gZMm5DS2/9pXMCr3TGgd2btvwXvcTh3RNH5nhR
	 otneauzod9Gw7sPq8LWnVDD1ZIMes4QPRN3uMqM7NAHNpre0wvjQ4HXeLIHwxmrIguw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299264;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z+n7GkR0pifD4/2RXbWX1AgFi3gIudpbZojDZ36ABEI=;
	b=lw/FIaZq1sXuw4yvOKogkWDF0lS1c35CLIbnVAkosjXLSmOl9bGFzdEnkV464cpTX4ee
	 kkbFqp7yh8Cy2KUlzles8EDTYK7NENDbZg3XHWJUYDMdje2/W7OYI1YnOCbKo06QFjR5k
	 8YOfuc45vE13LlpvhEnO3mjUYkRFUM4LlKD/m8APdXoXj/yG/Hb7lNVHyXYxHOjEvmsaO
	 d5je1qyhqzTqZihPekyfGSg94Cr5viYSZVRxOq4jfgKW/2mx8ki//kjUQK+WsNz3EIPS2
	 zfjAsLeoO6mW8gS42HvSyOy8/WeFgBHib+Q5acdCenT29lyC/0PeCa3yLom5nQPQF9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZmFI8GN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B7606A32E;
	Tue, 10 Nov 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZmFI8GN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A511F0089F;
	Tue, 10 Nov 2026 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299263;
	bh=z+n7GkR0pifD4/2RXbWX1AgFi3gIudpbZojDZ36ABEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZZmFI8GNnAwgGco9NL4ZOKCriB1Tr+v9Rt7NPAbeQDLDiFDI+Dh2vLJEGXT7lqvOH
	 HAZxaN+LTljukkAVoByTl4oLxcaSSK0WV7kGd6p5veY0hoH2pHSG45Mkw+QybHKM1+
	 FwKwv3YhebrGYlRCiqUFpit5EHNkFc1hKTWYHcfIaIPPnFIm8IzuicAi6Vf5GkS5Vq
	 RsYDb0eqWHV6ByFO8dLr44IBNYFdThXlNqHOMXaA4nm+lVN44gY/n0FSUT3ZOJ5qqY
	 4FrWnY8t99X54Kj7g5O/a5wP7DlZck7U+EbSwvYwj5qgCK5a6f+9+ANNO7tNmK7fac
	 NQbFDjJSnAD5g==
Message-ID: <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
Date: Tue, 10 Nov 2026 09:27:34 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
To: Arnd Bergmann <arnd@arndb.de>, Brian Masney <masneyb@kernel.org>
Cc: Long Zhao <longzhao@ambarella.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-clk@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 09:23, Arnd Bergmann wrote:
> On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
>> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
> 
>>> - I can then merge patches 3 and 5 into clk-pile.
>>
>> You will have code depending on non-exisitng ARCH_AMBARELLA symbol, but
>> if that's fine for you then sure.
>>
>>>
>>> - The DTS folks will take patch 4.
>>
>> The entire platform is for SoC tree. This sounds ok for
>> me, but I am not sure if Arnd was merging pulls with
>> dependencies. If not, then worse case the arm64 bits will
>> wait a cycle. Anyway, I guess you can take clock bits.
> 
> The way I usually handle new SoC families is to have
> a separate branch for those beside the usual dt/driver/defconfig
> updates, possibly for multiple new SoC families, and
> possibly including required drivers. The idea is that
> whatever we merge here has at least a chance to boot
> into an initramfs with a console.
> 
> If it can boot without the clk driver, the easiest way
> would be to just keep the clk and arch/arm64 bits
> separate. If the clk driver is required to boot, I would
> suggest having a branch with the two clk patches that
> can get merged (not applied) into both the clk tree
> and the soc/newsoc branch to put the other patches
> on top. This would make sure we only have each commit
> once, but still have a clean history that includes the
> driver in both sides.
> 

There is a build dependency - DTS needs clock binding header - so it has
to be second, unless the dependency is decoupled.

Best regards,
Krzysztof
