Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A239520322;
	Thu, 11 Dec 2025 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433792; cv=none; b=qhIKMOsYKIaIU7x1avIkjLbwVPLabF1YySMBfssV4sWgDiIHWrjf9GMtgoshIBRoHpbxjVjGbOPYXGVyMvutiMvvUWZ8/ng4oJMSaNiYD7cvDhDUDHMaUCe997sS7WWLy1fW+AYqV/07M/rMW00TfSFFvN282Eltb9wAOtjw674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433792; c=relaxed/simple;
	bh=bvT1VlwRH7XGC2MP4ovfWsz0gA8jdt47wxOpuOfG/XM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+zJxRds3s66UmNvY+WEyxyysk/3YtZPSoZFzskcP/aXwS8EG0+TxtMtwjaclCD8wPHezGGfl6ETs8S9jGZKiKpUDlK6EvfZm+1zWlkTqovIw4+PLFA8tYpvueH8C/0w87uxF/jeOwyvXYPv0T3OlQRYrytwL0p438FqashNIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUGpwECA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUGpwECA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EBAC4CEFB;
	Thu, 11 Dec 2025 06:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765433791;
	bh=bvT1VlwRH7XGC2MP4ovfWsz0gA8jdt47wxOpuOfG/XM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUGpwECA6gZn5jHX2eYEMqFzVIFUVnMAR9FSdFdAOxjVkFmZgf+0xS0gNDd4KvaJ5
	 4cCJG4naR/JkLFnqIlIe43x9XvZajRMCMn1jbROQXq2Zkjd0Et2D5DnSlTuTyAt9SA
	 l9cJnAwZAARSDNv4YHSpg4C7vFxR0pNvnN9MLzBt4TfE8jUw7op/Vjm/uba1oJmwRj
	 A+h4tdZFPKmMjQqyYQvNCV7ruRqJAgn5SM9Yo5HHpRwx2YQ6K0J3FHOLHVAo9tMcyK
	 alKLOAPhAfNKba8GJKYa+StfQ34YRtM3NA3O/0yPVtZzfuHAUQk0nJ5txbVQdufr6T
	 tHhONQ/igKaGQ==
Message-ID: <38ef7ee0-1879-42d5-a7fd-d32b96d01367@kernel.org>
Date: Thu, 11 Dec 2025 07:16:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
 <20251204053635.1234150-3-jian.hu@amlogic.com>
 <20251208-independent-warping-macaw-74a169@quoll>
 <dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
 <4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org>
 <1jy0ncvu23.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1jy0ncvu23.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/12/2025 11:16, Jerome Brunet wrote:
> On Tue 09 Dec 2025 at 07:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 08/12/2025 09:40, Jian Hu wrote:
>>> Hi, Krzysztof
>>>
>>>
>>> Thans for your review.
>>>
>>> On 12/8/2025 2:17 PM, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
>>>>> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
>>>>>
>>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>>> ---
>>>>>   include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>>>>>   1 file changed, 47 insertions(+)
>>>>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
>>>>>
>>>> Where is any binding doc for this? Why is this a separate patch?
>>>
>>>
>>> The ARM SCMI device tree binding specification is located at 
>>> ./Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
>>
>> Then git grep for the file name - there is no such compatible. Are you
>> sure you follow writing bindings doc?
>>
>> Think how are you going to use these values. You will have phandle, yes?
>> To some controller, yes? Which one?
> 
> For the C3 (I believe the T7 is the same), the compatible being used is
> "arm,scmi-smc". It is a generic one documented here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml?h=v6.18#n202
> 
> The phandle used is a subnode of that, to clock protocol:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi?h=v6.18#n116
> 
> Same things is done on imx, stm and rockchip platforms from what I can
> see.

I see, thanks for explanation, it's fine.

> 
> Jian is just adding the arbitrary IDs used to identify the clocks in the
> FW. I don't think there is anything out of the ordirnary here.
> 
> Is there something else Rob and I missed reviewing this ?
> 
>>
>>>
>>> Certain secure clocks on the T7 rely on the ARM SCMI driver stack, which 
>>> is officially supported by ARM.
>>>
>>> The kernel-side SCMI client implementation resides in 
>>> ./drivers/firmware/arm_scmi/.
>>>
>>> To enable ARM SCMI on T7, three components are needed:
>>>
>>> - Kernel-side definition of ARM SCMI clock indices (this patch addresses 
>>> this component);
>>> - SCMI server implementation in the ARM Trusted Firmware (ATF) running 
>>> at Exception Level 3 (EL3), which has been integrated into the bootloader;
>>> - Device Tree Source (DTS) configuration for ARM SCMI clock nodes (the 
>>> DTS changes will be submitted after the T7 clock driver patches are 
>>> merged upstream).
>>
>> So silently you keep the users hidden? No, I want to see the users.
>>
> 
> Is there a new requirement to submit the DTS file changes along with the
> driver changes now ?
> 
> This has never been case before, especially since the changes are merged
> through different trees.

There is no such requirement, but "has never been case before" is
clearly not accurate, because I raised this question multiple times last
two-three years.

There is no reasonable way to hold publishing of DTS, therefore if
someone uses arguments like above with waiting for driver, I usually got
suspicious.

Also note, that many contributions from various people (not saying that
this one here is) were bad quality and badly designed but without seeing
DTS it takes me significantly more time to understand that design. So
yes, publish your DTS solving all of the questions and making reviewing
easier. Or don't and receive questions...


Best regards,
Krzysztof
