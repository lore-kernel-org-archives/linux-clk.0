Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E4D224D6;
	Tue, 14 Jan 2025 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736838563; cv=none; b=M1je/U20RicnNekf5LV75m8AyTrzRr0wbYawbpyLgJtoZuhyzSPC05AnAOtWVjMKd30hMIKXE9vGOX4XFnt498ziYg212e2UqC6xeTD9t1KB55jUzmJprg0p8PWxmYXKXG/CRPylkeDSiZhWVO1LqOHawbvF/DoyjV+Ip792n9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736838563; c=relaxed/simple;
	bh=oaUqBQUJrGV4WfLA/880hHwq3osVsbUrqFe8lyBu7AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Di/ivdx38DZvJzD2QUGxruxhRgCR78D779KAXiRatR0xwXORmH3uFHdgqUBGK2c+C73qAbHoMd0jnmf2indDusEUKP0j4URhqWcei67x+YapgTDJB7gfrSxmrdaAuOhb9gBGB4LPRRkZT57Lo4WPoktEAwAiPYIR0WAKLRRlGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqM5uTy5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqM5uTy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C77C4CEDD;
	Tue, 14 Jan 2025 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736838562;
	bh=oaUqBQUJrGV4WfLA/880hHwq3osVsbUrqFe8lyBu7AM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fqM5uTy50dEQJ9fDAKKqNcB8CwlpCB64UlHDFpwSf0mj6pgvc3SIluQSZ7WJzKjoR
	 zXQUV20SSS/pTDHOIMfB3diserNYhCr/uYh06yYvMJnPtmvmEpY9PQAM3C5+DS2NXH
	 dpOlvV2uVhaztWG1pVFmoDs160+nVMfgfwFeokR7J1Cy+dOoDDWHwtJRFnvRg8wtCF
	 SYFu4YMO8AijYAwDDXCG5d/LasNhfB1M8EG7dCITbIz70BZFnik6qpOuP5TJAlTfg7
	 vih1fxTCZbDS5cSy1nuW7JYNVQ1wclv/h7lyybWzmQahpZcYuJkyJlJ1eMsWpKQrQU
	 mTfxkb4g8ba6w==
Message-ID: <a4796db2-e354-48e0-bd5f-da774f154473@kernel.org>
Date: Tue, 14 Jan 2025 08:09:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 yangshiji66@outlook.com, linux-kernel@vger.kernel.org
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org>
 <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
 <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org>
 <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
 <cf9732b1-fd09-454e-bfd7-bef55b234175@kernel.org>
 <CAMhs-H_6QTptfFsSEh7PKy8Fnoem1ph4j=mwT_23=J=adDDT8w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMhs-H_6QTptfFsSEh7PKy8Fnoem1ph4j=mwT_23=J=adDDT8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/01/2025 13:58, Sergio Paracuellos wrote:
> On Mon, Jan 13, 2025 at 1:37 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 13/01/2025 13:29, Sergio Paracuellos wrote:
>>>>>
>>>>>> 2. What is the point of this? We do not add constants when there are no
>>>>>> users. Commit msg explains here nothing.
>>>>>
>>>>> All of the old ralink SoCs' dts files which are in the tree are not
>>>>> properly updated. I expect to have them updated somewhere in time
>>>>> merging real base stuff from openwrt dts [0] files. Not having this
>>>>> header with definitions makes very hard to update dts and then
>>>>> checking the driver code becomes a need to see the indexes for the
>>>>> clocks to properly setup a consumer node. Because of this, this file
>>>>> is added here.
>>>>
>>>> Still there is no point without the users. I do not see any reason why
>>>> this cannot be combined with fixing driver to use the header. Not
>>>> combining is an indication this is not a binding in the first place.
>>>
>>> Driver uses a bunch of arrays for the clocks (base, fixed, factor and
>>> peripheral) and they are registered consecutively in order just using
>>> the ARRAY_SIZE macro for any of them. Thus, the direct application of
>>> these definitions would be for dts consumer nodes, not the driver
>>> itself.
>>
>> So what do you constants here fix? Driver can still reorganize arrays
>> breaking everything. If defining headers for proper ABI, then use that
>> ABI to make everything build-time testable and visible. That's why this
>> is not supposed to be a separate patch from users.
> 
> I understand your point and agree that the driver can do that, but the
> idea as this driver maintainer is not to do that :).
> Is adding something like the following in the binding itself with the
> header addition a possible way to go?
> 
> --- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> @@ -18,6 +18,12 @@ description: |
>    These SoCs have an XTAL from where the cpu clock is
>    provided as well as derived clocks for the bus and the peripherals.
> 
> +  Each clock is assigned an identifier and client nodes use this identifier
> +  to specify the clock which they consume.
> +
> +  All these identifiers could be found in:
> +  [1]: <include/dt-bindings/clock/mediatek,mtmips-sysc.h>.
> +
>  properties:
>    compatible:
>      items:
> @@ -38,7 +44,8 @@ properties:
> 
>    '#clock-cells':
>      description:
> -      The first cell indicates the clock number.
> +      The first cell indicates the clock number, see [1] for available
> +      clocks.
>      const: 1
> 
> @@ -56,6 +63,8 @@ additionalProperties: false
> 
>  examples:
>    - |
> +    #include <dt-bindings/clock/mediatek,mtmips-sysc.h>
> +
>      syscon@0 {
>        compatible = "ralink,rt5350-sysc", "syscon";
>        reg = <0x0 0x100>;

This changes nothing.

> 
> I don't like the idea of changing the driver code for using these
> constants since I do believe that it would make code uglier and less
> maintainable. I just wanted to make things easier for the device tree

Then why having constants in the first place?

> consumer nodes. So if adding this header is not a possibility with the
> changes in the yaml file I will forget about this addition and this
> patch.

Header without user is pointless. Driver and the DTS are the expected users.


Best regards,
Krzysztof
