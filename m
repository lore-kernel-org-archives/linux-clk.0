Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EACE149C53;
	Sat, 18 Jan 2025 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737191322; cv=none; b=T8Ga+8DJPNV32ggtZu65v+KGhHfI7H3goeh94prCAkNJbEWOnZTa1JjWzASKYDxrZ0AVpmY90dWXTTeLzJdtxgkVAjH1B4ELxYG7VPZbsT6ZKLK6Q+iMS5MtrbkGSmE1fBkE95TfnOP0azI/tWWzow1NWBYUDkGIvYLrEp2mShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737191322; c=relaxed/simple;
	bh=fnQFZ7OW3e3AUF0ttwPf2f3WYHTq7BE+uUVTG5XL8WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oV5BwxaDOt/H4Fn6H/bbXr+4fJK/c3v1PnGEKiCB9/ehBR9oF5OY+puHZ0gKSA8gzGD1YeAWz3y7T19+rGFSLM0BZPVLBfGL+iZBfcNA7RYapGRdLEWePtphetjwUXC3XwRrwIJ/pdDno6286f3rAvBtkDSdbgKKiCLqPtl9D5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmtRGLPQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmtRGLPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60ABC4CED1;
	Sat, 18 Jan 2025 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737191321;
	bh=fnQFZ7OW3e3AUF0ttwPf2f3WYHTq7BE+uUVTG5XL8WI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MmtRGLPQEM5RgnSVRclg7ZXw7yokBT3Q3ibM34xXEti6/JZM2kxNXURa2lWH1wnFd
	 tIQxxeh4A1BoizR28ibVKsLy4SUnfvvXey6tsSYXIT680H/bJKqH6WxL2U1A+5e24L
	 oNKw9Rtu2JtmJZ4mNu6hRppfo1fC6dV0SrCWYgsq35lCkNxmS40R5tWkFoorojwQlX
	 v4ZYX2CPPrroNexqQD6ywPyzRyoPPVK1aOnXGJTh0quZBciiYh2ecEXeYTzSRFIJ06
	 C36UPd/BU/WTeJzYQXCkWbUc6+ZUp3iFz/sBVx8kjiioxUuDq9BDRLpZw3suRgjwij
	 t633+6zjK12CA==
Message-ID: <00cbc2a1-b4c1-46a2-8234-f66edc19fac9@kernel.org>
Date: Sat, 18 Jan 2025 10:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for
 rk3328
To: Peter Geis <pgwipeout@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com, kever.yang@rock-chips.com, frank.wang@rock-chips.com,
 william.wu@rock-chips.com, wulf@rock-chips.com,
 linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Dragan Simic <dsimic@manjaro.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Trevor Woerner <twoerner@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Zhang Yubing <yubing.zhang@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 02:26, Peter Geis wrote:
> 
> This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> based loosely on my original version, but as of now almost nothing of
> the original driver remains. The main fix here is the discovery of
> BIT(6) in the interrupt enable grf register fixes the usb3 disconnection
> detection (mostly). On occasion an unpopulated usb3 hub will take
> several seconds to disconnect. However this means all of the hack around
> work to reset the usb core manually is no longer required.
> 
BTW, RFC for some maintainers means "do not review, work-in-progress".
For some means "review, but low priority" or "review, but for sure I
have bugs here". I usually review and then someone responds: "it is not
for review, it is just RFC", so to avoid my wasted time please always
mention in cover letter why this is RFC. What do you expect here or why
this is not ready for review as normal patch.

Best regards,
Krzysztof
