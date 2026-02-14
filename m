Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792C1A76DE;
	Sat, 14 Feb 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771056940; cv=none; b=ePia3gGe1QQGP40hbaYc5eElAPueW6Qgb+GH/E4+guODzhkVflvYcEhKwfrsOy8ZXHYpoV+2COO3irK3VxuHqjK13hImvR/aWNLRZJXyyfC4dZ5uO0QkmeqpEEfXSVi93HGO9oxCWHf9KVoVro/W7d/xlhlbQnh7jGMcuZ4gdzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771056940; c=relaxed/simple;
	bh=J7VQxhmhiGWy2GaXEPSiZJAUJMbw/CouS/E/ZtTNX90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2Ru8CskMsyZpG0S85kdHBH4kXuQMokcpQaOcglsSuf2q8b+HryzAz0Id8/NFzW5/yvedk/dQfQPHRYBF2PZF18PhsETlPUGLfPc4ayGCDepMDUUMGukHHnSAL6INy5rIUMADm75yVr+xoRlVgYgAxJdpJxCQRFmB9sxyWqlr+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [110.228.131.240])
	by APP-01 (Coremail) with SMTP id qwCowAAXv2oaL5BpR2PhBw--.14107S2;
	Sat, 14 Feb 2026 16:15:23 +0800 (CST)
Date: Sat, 14 Feb 2026 16:15:22 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <aZAvGnSrJ7/Ov6wV@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <aYNwmqEjvfAahGA+@duge-virtual-machine>
 <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
 <aZAXJOHqrhKh8kd5@duge-virtual-machine>
 <283d631f-7cc6-4ec6-9946-5e2120625150@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283d631f-7cc6-4ec6-9946-5e2120625150@zohomail.com>
X-CM-TRANSID:qwCowAAXv2oaL5BpR2PhBw--.14107S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rArWxWr13Kw1DtF4ruFg_yoW8tw17pr
	WSyF4v9F4DJr48JasIgw4YgF1Fv3WkAr1UWr15Kr98uFyavF1Sqrs7W3W5u3WDGrs8GF12
	vr45Gasruw18ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2FksUUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Sat, Feb 14, 2026 at 03:34:16PM +0800, Xukai Wang wrote:
> 
> On 2026/2/14 14:33, Jiayu Du wrote:
> > On Sat, Feb 14, 2026 at 12:37:24AM +0800, Xukai Wang wrote:
> >> On 2026/2/5 00:15, Jiayu Du wrote:
> >>> On Fri, Jan 16, 2026 at 09:26:18PM +0800, Xukai Wang wrote:
> >>>> This patch series adds clock controller support for the Canaan Kendryte
> >>>> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> >>>> PLLs and an external pulse input, with the controller managing these
> >>>> sources and their derived clocks.
> >>>  
> >>> Hi, Xukai. Currently, the k230 initial series and the patch 3 of the
> >>> pinctrl series has been in the linux next. So if possible, you need
> >>> to rebase your clock series onto the latest linux-next.
> >>>
> >>> Then I will proceed with the development based on your v11 of the
> >>> clock series.
> >> I've rebased my patch series to `linux-next` (20260212). I noticed that
> >> the patch which updated the `k230.dtsi` format has been merged into
> >> `linux-next`.
> >>
> >> Consequently, I've updated the `prerequisite-patch-id` for my series
> >> from `deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc` [1] to
> >> `9a2d01f55574b538dad572e193f81c44661f0853` [2]. Is this change correct?
> > Junhui Liu's commit `8cfdbd5e207d434a6e924eb81092874177f97536: riscv: dts:
> > canaan: k230: Add b ISA extension`, also modified k230.dtsi. I'm not
> > sure if you noticed this.
> >
> So, should I use `8cfdbd5e207d434a6e924eb81092874177f97536` as the
> `prerequisite-patch-id` instead of
> `9a2d01f55574b538dad572e193f81c44661f0853`?

Yeah, I think so. Cause the latest modification in linux-next is really
from it.

But actually, you are already using the latest linuxnext version now.
Doesn't it mean that the prerequisite-patch-id might not be necessary?

> >> Link:
> >> https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/
> >> [1]
> >> Link:
> >> https://lore.kernel.org/linux-devicetree/20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn/
> >> [2]
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

