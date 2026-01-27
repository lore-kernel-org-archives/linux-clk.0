Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9134C9AC;
	Tue, 27 Jan 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516573; cv=none; b=oFGA/gP2exP/7az4OtH4dRG30rq5gDhuSetNcaPyKBjINnlpAeilGQyBDBRB8kBZFWf9gUevR/H7xesgDaul/AmilARje6o4t/UY42079j5YWkd5QKyeHK9aGz0Pbgk9HPeRve6PjLS0xYykd1r7rLPBLDGXC5l1FFJ7C2Wo4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516573; c=relaxed/simple;
	bh=ujgP0jcbed1ZXd85wWPLMTNTNLiH/W/3Np/g9MdS0Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYqxezwizHhUkjpEFxICLt+a8eo9Fv0ixW+l/jzcDv44FclWH7FCTbGz0Rjz+DCWQayVmlVEG9Ni8CS1oxmqayjLMoSBV0S/MLtMm2DIcHSg3KBiGjelUfS5ZBFOccxQzpF6vhETISF37ojf7duGuiGHSM4hIEvw1BrhARbDWiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.223.177])
	by APP-03 (Coremail) with SMTP id rQCowACHqN8MrnhpMuD1Bg--.48031S2;
	Tue, 27 Jan 2026 20:22:38 +0800 (CST)
Date: Tue, 27 Jan 2026 20:22:36 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aXiuDAO7I6urJj09@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
 <aXJJ3MjQSq8Rq084@duge-virtual-machine>
 <0af969a7-3579-4303-b302-f171ef02a163@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0af969a7-3579-4303-b302-f171ef02a163@zohomail.com>
X-CM-TRANSID:rQCowACHqN8MrnhpMuD1Bg--.48031S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr15tFyUArW5XF48uFWrAFb_yoW5trW3p3
	97XF18CFWDGw1I9F1qvw47J34DtFs8ta1UGF93JFykJwnrA34jqF129w40gFWjvr4xCF4j
	yr48twn0vFW2yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Tue, Jan 27, 2026 at 07:03:59PM +0800, Xukai Wang wrote:
> 
> On 2026/1/23 00:01, Jiayu Du wrote:
> > On Thu, Jan 22, 2026 at 07:40:29PM +0800, Xukai Wang wrote:
> >> On 2026/1/19 16:18, Jiayu Du wrote:
> >>>> +
> >>>> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
> >>>> +		     K230_HS_HCLK_SRC_GATE,
> >>>> +		     0x18, 0, 0, 0,
> >>>> +		     &hs_hclk_high_src_rate.clk.hw);
> >>> Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
> >> I'm a bit confused, as I don't recall making these specific changes.
> >> Looking at the code below, the only difference between v9 and v10 is
> >> within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
> >> the second parameter changed from 1 to 0. Everything else appears
> >> consistent. Could you clarify which change you were referring to?
> >>> but after my board test, I find that when hs_hclk_high_gate is turned
> >>> off, the mmc/sd and other high-speed subsystems can not work. So maybe
> >>> you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.
> >> Regarding the clock management, I recommend explicitly enabling
> >> hs_hclk_high_gateas it will be closed by `close unused clocks`.
> > Sorry, you are right. It was me who made the changes locally. And I
> > saw your reply to this email[1], which you said According to the vendor's
> > code, the parent clock of hs_hclk_src is hs_hclk_high_src.
> >
> > Indeed, the parent clock of hs_hclk_src is hs_hclk_high_src. 
> 
> > but hs_hclk_high_gate is the gate of hs_hclk_high_src. 
> 
> No. It seems there is some confusion. The hs_hclk_high_src does not have
> a gate.

In this code segment of the vendor[1], it states that hs_hclk_high is
indeed the downstream gate of hs_hclk_high_src. Once hs_hclk_high is turned
off, all the high-speed peripherals such as USB, MMC, and SD will fail.
This indicates that in the hardware, the gate bit1 actually controls the
overall clock switch of the high speed system.

I understand that hs_sd0/1_ahb_gate should be enabled during the SD driver
probe, and hs_usb0/1_ahb_gate should be enabled during the USB driver probe,
but currently there is NO clear driver to ENABLE hi_hclk_high_gate. 

So in your code, I think hs_hclk_high_gate should be the gate of 
hs_hclk_high_src_rate. And hs_hclk_high_gate should be the parent of
hs_hclk_src_gate.

link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi#L497 [1]

> 
> The clock tree is as follow:
> 
>        pll0_div4
>           hs_hclk_high_src_rate
>              hs_hclk_high_gate
>              hs_hclk_src_gate
>                 hs_hclk_src_rate
>                    hs_sd0_ahb_gate
>                    hs_sd1_ahb_gate
>                    hs_ssi1_ahb_gate
>                    hs_ssi2_ahb_gate
>                    hs_usb0_ahb_gate
>                    hs_usb1_ahb_gate
> 
> > So, what you mean is
> > that you will add the CLK_IS_CRITICAL flag to the hs_hclk_high_gate?
> No, I don't intend to add CLK_IS_CRITICAL flag. Instead, I recommend you
> to explicitly enable the clock by using clk_prepare_enable in your driver.

I think there is NO clear driver to ENABLE hi_hclk_high_gate.

Regards,
Jiayu Du

> >
> > Link: https://lore.kernel.org/all/159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com/ [1]
> >
> > Regards,
> > Jiayu Du
> >

