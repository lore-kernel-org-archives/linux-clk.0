Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1B2652B2;
	Tue, 27 Jan 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520117; cv=pass; b=EK5uRapVSRqESUjQPqjd6JYx5/fsJc4L89DfgGkQqYWrkcZ2suF1SnYvClFTun6KVVk2ZonGNb1KeKVeKyhdMVtXy/BWSBdai2rN4HtRaRRi7wowwZIOy9rnRsbsAFogiKvl7LqgVxgt50Oyo4nccvcouOHotfK2kEh9tqOQOgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520117; c=relaxed/simple;
	bh=5lwawLaZOAC4yzg5BhoVQ5uHvnfl2rvUXPUVrzViSKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR2ZXRWtvNV27loG6HxzTRWbSlWBO8QXw3mXTB2dbnhEGRs6g34TrLezfhR4r5kXCpO3FiaMN2lNIDw1tax6w93ATDhgV0dgSc4BcfZ/ji2e2rELbVmXeeRDwP/kCM3Sqq5kV8l/cB3JOgn/1wKNEmBEHIK8k3fzzTdinDX+pS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=N7gS8ip6; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="N7gS8ip6"
ARC-Seal: i=1; a=rsa-sha256; t=1769520096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n+p9ITehe7iLCcdCXHqjcTteGW+grRub8uFjz2LvFJfo5Taqqa+Bt0ojRtzWwZyGMiJi41GRYA3aSgoHZGdhPQID+0soOgwUn2ww/39aYQ4UQUglXNuy/h42GNDssVEz9sCrQk1c7p8jos3bRYdyNPVndB+0dPZyPRyGojiDTPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769520096; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=au18OVXzz84BbObn5tg/N4ElDA6wAjL30zw+A8uZLfI=; 
	b=nC8ambVuuehVgYGGQrNUpD6DZpDkhEMmuw1DwWGr9juFuH4VOVfHWgis3wm/211caV6qdmAUmr4ptNV2U42FBRGPz5zFwmZzsddjpIhTcpXe0J4gkOVS+/tn6SI835kZ/898fdOcdwuFfZHOwoIGmGokHe1zCOjyzR8biiiS760=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769520096;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=au18OVXzz84BbObn5tg/N4ElDA6wAjL30zw+A8uZLfI=;
	b=N7gS8ip6JXLb4pdCZCHVgx+FPNguTY4mVxZDS0ERqzg3Tzx+PjRxXFE2eXAZ3Zaw
	5CqAexyJHEFi1/vRqLV1cBHqHNOncZFnZXpBP3IfZvA9Ge+6ph9tKW1ZOZU5bqQQVTg
	ctLuL7m98GUcJYLeUlYflHC5lPRdhWv6SyF+keP4=
Received: by mx.zohomail.com with SMTPS id 17695200885111017.8066507963186;
	Tue, 27 Jan 2026 05:21:28 -0800 (PST)
Message-ID: <6fe3250a-7ca7-418e-9f55-12597aba79ba@zohomail.com>
Date: Tue, 27 Jan 2026 21:21:11 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
 <aXJJ3MjQSq8Rq084@duge-virtual-machine>
 <0af969a7-3579-4303-b302-f171ef02a163@zohomail.com>
 <aXiuDAO7I6urJj09@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aXiuDAO7I6urJj09@duge-virtual-machine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227a425b3b667381810365aabc3000037dba1dbb646afe9a06efa465b5df70dfebe43b8a75d68e24e:zu08011227447b0bc771d9ca025cf244310000f21f616ca4fd2c5a84a096bb6096c09bcf3ee47b112dcfd7c1:rf0801122c1c98ddc0f836bc53b2f7b21000000c8fd550d066760a8096a50cd9ca68e15133f36acc5eeada204e2658190b:ZohoMail
X-ZohoMailClient: External


On 2026/1/27 20:22, Jiayu Du wrote:
> On Tue, Jan 27, 2026 at 07:03:59PM +0800, Xukai Wang wrote:
>> On 2026/1/23 00:01, Jiayu Du wrote:
>>> On Thu, Jan 22, 2026 at 07:40:29PM +0800, Xukai Wang wrote:
>>>> On 2026/1/19 16:18, Jiayu Du wrote:
>>>>>> +
>>>>>> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
>>>>>> +		     K230_HS_HCLK_SRC_GATE,
>>>>>> +		     0x18, 0, 0, 0,
>>>>>> +		     &hs_hclk_high_src_rate.clk.hw);
>>>>> Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
>>>> I'm a bit confused, as I don't recall making these specific changes.
>>>> Looking at the code below, the only difference between v9 and v10 is
>>>> within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
>>>> the second parameter changed from 1 to 0. Everything else appears
>>>> consistent. Could you clarify which change you were referring to?
>>>>> but after my board test, I find that when hs_hclk_high_gate is turned
>>>>> off, the mmc/sd and other high-speed subsystems can not work. So maybe
>>>>> you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.
>>>> Regarding the clock management, I recommend explicitly enabling
>>>> hs_hclk_high_gateas it will be closed by `close unused clocks`.
>>> Sorry, you are right. It was me who made the changes locally. And I
>>> saw your reply to this email[1], which you said According to the vendor's
>>> code, the parent clock of hs_hclk_src is hs_hclk_high_src.
>>>
>>> Indeed, the parent clock of hs_hclk_src is hs_hclk_high_src. 
>>> but hs_hclk_high_gate is the gate of hs_hclk_high_src. 
>> No. It seems there is some confusion. The hs_hclk_high_src does not have
>> a gate.
> In this code segment of the vendor[1], it states that hs_hclk_high is
> indeed the downstream gate of hs_hclk_high_src. Once hs_hclk_high is turned
> off, all the high-speed peripherals such as USB, MMC, and SD will fail.
> This indicates that in the hardware, the gate bit1 actually controls the
> overall clock switch of the high speed system.
>
> I understand that hs_sd0/1_ahb_gate should be enabled during the SD driver
> probe, and hs_usb0/1_ahb_gate should be enabled during the USB driver probe,
> but currently there is NO clear driver to ENABLE hi_hclk_high_gate. 
>
> So in your code, I think hs_hclk_high_gate should be the gate of 
> hs_hclk_high_src_rate. And hs_hclk_high_gate should be the parent of
> hs_hclk_src_gate.
>
> link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi#L497 [1]

OK, I understandthe issue you described. The namespace in the vendor's
code is quite poorly structured, so I will rename hs_hclk_high_src to
hs_hclk_high and hs_hclk_src to hs_hclk, to better reflect that they are
part of the same clock. The updated clock tree is as follows:

      hs_hclk_high_gate
          hs_hclk_high_rate
             hs_hclk_gate
                hs_hclk_rate
                   hs_sd0_ahb_gate
                   hs_sd1_ahb_gate
                   hs_ssi1_ahb_gate
                   hs_ssi2_ahb_gate
                   hs_usb0_ahb_gate
                   hs_usb1_ahb_gate

This revision clarifies both the clock tree structure and namespace, and
once you enable a leaf node in the clock tree, such as hs_sd0_ahb_gate,
the top-level gate clock will be automatically enabled.

>
>> The clock tree is as follow:
>>
>>        pll0_div4
>>           hs_hclk_high_src_rate
>>              hs_hclk_high_gate
>>              hs_hclk_src_gate
>>                 hs_hclk_src_rate
>>                    hs_sd0_ahb_gate
>>                    hs_sd1_ahb_gate
>>                    hs_ssi1_ahb_gate
>>                    hs_ssi2_ahb_gate
>>                    hs_usb0_ahb_gate
>>                    hs_usb1_ahb_gate
>>
>>> So, what you mean is
>>> that you will add the CLK_IS_CRITICAL flag to the hs_hclk_high_gate?
>> No, I don't intend to add CLK_IS_CRITICAL flag. Instead, I recommend you
>> to explicitly enable the clock by using clk_prepare_enable in your driver.
> I think there is NO clear driver to ENABLE hi_hclk_high_gate.
>
> Regards,
> Jiayu Du
>
>>> Link: https://lore.kernel.org/all/159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com/ [1]
>>>
>>> Regards,
>>> Jiayu Du
>>>
