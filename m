Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE35274B39;
	Mon, 25 May 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711045; cv=none; b=YA+tY/0lW5lIruh3eVorP1MheQ1W70w+61Ylj5AiV7fbzYEMjFQ/RipN6xgq4Aam1ykscU+IVR3s+gCQVoSBmKCAzzueVGCuHJF7ayw3O1ksdJMZvkCn7ERp82ID1kGr7so7GXtmrsEqNxI2a6QjFdNySSjY87+wRGnNDtFc/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711045; c=relaxed/simple;
	bh=H2XbRLZ5+GvP7BqNSiSKxXoYhCdSSYs7gZmgnwscKHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgMxPj4V3UxKMKet16KcCGhDOcevD/IxVu6EZ3ZTlXMn6B9sQD1C+wiDtXLnMrva1470ktjC6jeBQz8Q9NRZlbjOyFPDXRmteOuuWsO9dsnfg1kH+roqVycI4NSDCiRYDgHRDeOnbUoJbpvUSx9u4v5IokB34+bZ1sgcOE1RR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0vfZklM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0vfZklM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5F01F000E9;
	Mon, 25 May 2026 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779711044;
	bh=cY3kcG400HFwYsUxYZRg6ciJDEvU+8cftVFMVGBbPaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e0vfZklMVREIcM48htGLKBOoKgczK+3z159ZNICbWDo5cIBwe8Y1T3i34odJaqUQ2
	 Vld1PyeCsRJZe7OpBupoSgSawZaKa0GVVGj43du8T0L77MVrAk7j96PmyYIpo4Xg/7
	 XK61MwNjMJZTU30cuggpqK+i0sis5A8GNivm1LrbtFvBuYhzR2B/R0HUdqmU6xlKUq
	 e7MCvKSDwh1X+csDniDFg40DRIsufkKdV2cJR0m3vM7Fkvzrr3TK8PrMMo+gA+B69F
	 4UScN3rtheKMHVDbCCOqxJ5h/doX9qgRH1dalJxGOj6tNVZqW4DfvNSX42NnaSwFMd
	 1WpRMRpVdM5cA==
Message-ID: <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
Date: Mon, 25 May 2026 14:10:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: wens@kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net>
 <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
 <ahNuuaVlDl0KvOSj@home.wens.tw>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ahNuuaVlDl0KvOSj@home.wens.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> Hi,
> 
> (resent from new email)
> 
> On Thu, May 14, 2026 at 2:04 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
>>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>
>>> As it turns out, current H616 DE33 binding was written based on
>>> incomplete understanding of DE33 design. Namely, planes are shared
>>> resource and not tied to specific mixer, which was the case for previous
>>> generations of Display Engine (DE3 and earlier).
>>>
>>> This means that current DE33 binding doesn't properly reflect HW and
>>> using it would mean that second mixer (used for second display output)
>>> can't be supported.
>>>
>>> Remove layer register space, which will be represented with additional
>>> node, and replace it with phandle, which will point to that new, shared
>>> node. That way, all mixers can share same layers.
>>>
>>> There is no user of this binding yet, so changes can be made safely,
>>> without breaking any backward compatibility.
>>
>> There is user. git grep gives me:
>> drivers/gpu/drm/sun4i/sun8i_mixer.c
>>
>> which means this is a released ABI. As I understood, the old code was
> 
> We held off on merging the DT changes so that we could rework this.
> I can't find the actual request though. It was probably over IRC.
> 
>> working fine but just did not support all use cases. Why this cannot be
>> kept backwards compatible?
> 
> AFAIK the "planes" block is shared between two display mixers. As the
> commit message explains, this prevents using the second mixer, since
> only one of them can claim and map the register space. And on the H700
> (which is the same die as the H616 discussed here but with more exposed
> interfaces), there could actually be a use case for the second mixer.

It explains why you want to make the changes but not why you cannot keep
it backwards compatible.


Best regards,
Krzysztof
