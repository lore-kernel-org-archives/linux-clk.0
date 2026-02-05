Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEB202C5C;
	Thu,  5 Feb 2026 18:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770317117; cv=none; b=WZyTgAK9rHtDKAHgChrBmJi94ujTM9YI32WbqtplWhtmhgw1BT0BSFPYgBBziGHMrsqaphFqST7mgNP0SVEc0XZHiWJrSbkJX0pnRAZRgnUIaBn9BYcow8SQsqHJA99bhor+WZyQN2xwlPC7YET1hJg1jF0uyMhUxM9BZ/iOUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770317117; c=relaxed/simple;
	bh=ZdulHp81VzQKd1Z3eSdf6JTAzvounjXm+PyUoDwuQ2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izHzfnpS3l8tFIetv8nyOYz3+Fwwt1AmI4hHgngLh+UW7AP0uIwthMPjR6A7H+DATOChDB7m4Y57W01M6nfAZFplMS6+4OeO0dWqPce55B06WK0rd8Zm43Mb1bn2eeh1JQLONRy8y7Q5Oq5ZRPkEIYjg8Jkuq45bH/Qowo59/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey/M0ZvW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey/M0ZvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D4DC4CEF7;
	Thu,  5 Feb 2026 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770317117;
	bh=ZdulHp81VzQKd1Z3eSdf6JTAzvounjXm+PyUoDwuQ2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ey/M0ZvWxBp8gFtEYBSLzkEBKE6o/OcQltEXsEPDdQBWeeC87IZLRoRXijrRIzEdA
	 Qzag38EEespagJNjnRpn6drg5BmQRS+ZXvb115o43fjV8tyQRNMbY4jg/MUlFraaJh
	 eYO444S5C4SmX7pZ/IRS0JYmNW2qFVUZ8YsvTxQgimOSK3qgRZtMe6FhArqTi29SzD
	 vuXF6WDbYMZf9m2c+57KbDYvtH9nAmWcjJwJImI60uYazspWFusa7DsJygsvfWMTUM
	 kUn0GkSGh2s3tQuqPuLIyewn1XF4wc0jrolQo1Xu3dIeii5JIiYkd427Sinr9XMIiv
	 WiJFhYPIOm4iQ==
Message-ID: <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
Date: Thu, 5 Feb 2026 19:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au,
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com,
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com,
 bmasney@redhat.com
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
 <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2026 15:31, Anirudh Srinivasan wrote:
>>> +examples:
>>> +  - |
>>> +    clock-controller@a8000000 {
>>> +      compatible = "tenstorrent,atlantis-prcm-rcpu";
>>> +      reg = <0xa8000000 0x10000>;
>>> +      clocks = <&osc_24m>;
>>> +      #clock-cells = <1>;
>>> +      #reset-cells = <1>;
>>> +    };
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index dc731d37c8fe..0fc7bc6d0458 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -22534,8 +22534,10 @@ M:   Joel Stanley <jms@oss.tenstorrent.com>
>>>  L:   linux-riscv@lists.infradead.org
>>>  S:   Maintained
>>>  T:   git https://github.com/tenstorrent/linux.git
>>> +F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
>>>  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>>>  F:   arch/riscv/boot/dts/tenstorrent/
>>> +F:   include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
>>>
>>>  RISC-V THEAD SoC SUPPORT
>>>  M:   Drew Fustini <fustini@kernel.org>
>>> diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
>>> new file mode 100644
>>> index 000000000000..3820781127c3
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
>>
>> Still wrong name... Look at your compatible.
>>
>> Please read writing bindings doc in DT dir.
> 
> We will have multiple compatibles in the future (I dropped these in

Maybe you will, maybe not. But you do not have now.

> this version and I have mentioned this in the changelog in the cover
> letter) named "tenstorrent,atlantis-prcm-xyz". The bindings document

Where did you mention it? I went TWICE through it.

> suggests picking a more generic name in this case, so isn't
> "tenstorrent,atlantis-prcm" okay for that?

No, because I don't want to keep guessing this. The docs clearly ask you
to post complete bindings, which now became less-complete, but fine.
Then the next rule asks you to use compatible as filename. You cannot
keep skipping the rules.

Best regards,
Krzysztof
