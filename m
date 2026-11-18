Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013503;
	b=wljSjfqmLwr3CwJJJgRdfQ3fir62IhFCCqwES1oB/84U17DvDaGufZ4z3h+Le5LatXek
	 8a5CgCKqKSoWXRr22yB5Y0R5StqcwCXaIz7pS3liuZYLjLtgt9ZkFX/DnD4mksyX/6aIp
	 20ZDHQwH+o+eivHh5Fj65QJlQ1OVJHbEqO5hgWh6Bs6P/rERaDmR1k41ePRDgJ/V8T/87
	 IjqrVJVlWTsXEbEEPFRwYrjQyVD3dYhKSN02yFO6GwF6rjRQlVFiSlgjAQbAjKXA6/k7O
	 PkC8GfO7NMja0B7YoaiV+bo1Pk6khhYi81z6OC/oX049v/Cu8UbO7qZPzmRkKaiDMkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013503;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u/v5EB4DuKP19larRiTYLfjHU2pmt6tp/b9vDdb9Zro=;
	b=2wSDcFiSs3+GWzswiLGvBlzP/hhwl9A6OLZpWMcsrMCPcCVHj2L7Kxs9AkRHOe0fqTzx
	 fImqU1QONlyddZTNI7YQkIgPm7kCghO4F+Rc8FachQHDlHoZhb5VnWkao0KiPZFDpcFEv
	 FcSFTyZ8AP7lT6lAyiZX5i+xULG/25G/tROrYgmEfhPoBa7WYnySf3N6td+AtWY6fjM59
	 eluQ1xL93J0PSC3PUTjGcLvXMRMn0T5iosDbsYlgeuWMnSNXex7KlZkX0bxVxw/J5VfyG
	 iaE+Lm813dhSLTWIGEo+pyDmUltJVYfvX4RT4pDnVyFBkZogt89Zlm1TK1v+1v1IkzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ByOj+lem;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288E3606A333;
	Wed, 18 Nov 2026 14:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288E3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ByOj+lem
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D2861596;
	Wed, 18 Nov 2026 06:51:38 -0800 (PST)
Received: from [10.57.69.78] (unknown [10.57.69.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A4F63F632;
	Wed, 18 Nov 2026 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795013501; bh=p1Y9kHEyN3vd2Wh1wITEyX27uB3SFUWAu7d3tBIEFBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ByOj+lemTBjazJeZupwPkqMz/bPa1QgkOgQ5nCJ57x2NvIvm02Kwzhu4mpjbfHmcD
	 wMVA3i2dtfSiRhsDGtTKAWsg7rkKoaUsyD42U4IoavnNTYaA/V33K7MoGxP/WLZYig
	 yw1YB5kt1e9GhoE5MH5iOOtSFJ1FODE1mWlgEggQ=
Message-ID: <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com>
Date: Wed, 18 Nov 2026 15:51:36 +0100
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
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks
 enabled
To: wens@kernel.org
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Junhui Liu <junhui.liu@pigmoral.tech>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
References: <20261112-a733-fwclk-v2@gmail.com>
 <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
 <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/18/26 14:41, Chen-Yu Tsai wrote:
> On Wed, Nov 18, 2026 at 1:18 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> Hi,
>>
>> the patch itself looks fine, but the comments and the commit message are
>> not entirely correct, I think.
>>
>> On 11/12/26 22:38, Enzo Adriano wrote:
>>> The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
>>> consumers, so unused-clock cleanup gates them. With vendor SCP firmware
>>> running on the E902 as shipped on Cubie A7S, warm reboot then stalls.
>>
>> Please note that we don't support "vendor firmware" with mainline Linux.
>> That was mostly incompatible in the past, and while it might work these
>> days, this is not something we control and want to endorse.
>> So we would be quite reluctant (to put it mildly) about merging patches
>> that are solely needed for BSP firmware bits.
>>
>>> Keep both critical until remoteproc/mailbox drivers can claim them.
>>
>> I don't think this "until" is an argument. Even if we'd have Linux
>> driver support, they would be optional to use (not compiled, not
>> loaded), and would only be needed to *communicate* with the firmware.
>>
>> But those clocks are actually there to drive the RISC-V core clock, and
>> also the "RISC-V side" of the peripherals, due to a lack of separate
>> clock controls in the SoC in the Allwinner design. So the kernel should
>> not care about or touch those clocks at all - which is what
>> CLK_IS_CRITICAL does.
> 
> No. CLK_IS_CRITICAL also tells the kernel to turn it on, and you then
> can never turn it off. You get a big warning if you try to defeat the
> refcounting, but nothing else happens.

Good point, so is CLK_IGNORE_UNUSED a better flag? As far as I can see, 
it only prevents turning it off if unclaimed, it doesn't turn it on if 
it was off initially, and it doesn't disallow turning it off.

> So what if the *real* remoteproc driver needs to turn the clock off to
> pause the RISC-V core? It can't

I guess this depends on the use case, which isn't very well defined. If 
this E902 is really a remoteproc device entirely controlled by Linux, 
then sure: Linux should have full control over its clock.
But if it's running some kind of firmware component, then the kernel 
shouldn't mess with it, IMHO. But I think there is still the arisc on 
the A733, so this would more likely run the management processor (SCP) code?

Cheers,
Andre

> So, not a fan of this. If the loaded firmware somehow needs some resources
> then perhaps the software that loaded it needs to somehow tell the kernel
> they are needed, like the bootloader patching the DT passed to the kernel.
> 
> If the firmware needs a piece of DRAM, you don't say in the kernel that
> this piece of DRAM is off-limits. You let the bootloader tell the kernel.
> Static DRAM carve outs with reserved-memory nodes in the DT source is also
> ugly, as you could end up with mismatches if the firmware somehow changed.
> 
> IMO CLK_IS_CRITICAL should be used for things that the kernel knows it needs
> but there's nothing to claim it.
> 
> 
> ChenYu
> 
>>> This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
>>> Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
>>> clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
>>>
>>> On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
>>> clk_ignore_unused, warm reboot returns with both clocks critical and
>>> stalls without them. Vinicius found either flag alone insufficient on
>>> Cubie A7Z. Power-off, suspend, single flags on A7S, other
>>> boards/firmware and upstream TF-A were not tested.
>>>
>>> Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
>>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
>>>     these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
>>>     review, pending remoteproc/mailbox ownership.
>>> - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
>>>
>>> v1:
>>> https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
>>>
>>> Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
>>> https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech
>>>
>>> November 12 board test: two RAM boots and warm reboot -f returns on
>>> Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
>>> Both retained clocks were 1/1; all three dropped clocks were 0/0.
>>> The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
>>> byte-identical in v7, where the no-flag control was not repeated.
>>> Runtime used DT v3 and its dependencies (all four UART v2 patches),
>>> with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
>>> https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
>>
>> I don't think there is any need for those longish test descriptions,
>> especially if they pass.
>>
>>>
>>>    drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>> index b8f6e8c6e507..f2965daba0d3 100644
>>> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>> @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
>>>                                  0);
>>>    static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
>>>
>>> -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
>>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
>>
>> Please change this comment. Something like the msgbox clock is shared
>> between the E902 core and the Arm APs.
>>
>>> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
>>> +                      0x17c, BIT(0), CLK_IS_CRITICAL);
>>>
>>>    static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
>>>    static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
>>> @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
>>>                                  24, 2,        /* mux */
>>>                                  BIT(31),      /* gate */
>>>                                  0);
>>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
>>
>> and this. Just note that the E902 might be running on its own, in a pure
>> firmware role, or even completely separate from the main kernel.
>>
>> Oh, and also please put somewhere that this is based on the linux-sunxi
>> for-next tree, aside from just having the base-commit ID below.
>>
>> Cheers,
>> Andre
>>
>>>    static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
>>> -                      0x21c, BIT(0), 0);
>>> +                      0x21c, BIT(0), CLK_IS_CRITICAL);
>>>    static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
>>>                         0x21c, BIT(1), 0);
>>>
>>>
>>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>>

