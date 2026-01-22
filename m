Received: from cstnet.cn (unknown [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018EA48C3FD;
	Thu, 22 Jan 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097716; cv=none; b=nX2VSNHiPhwvL7iNq0GKTUYXW3UhtCOz4gSXgAEaTl6P4RnAfOTvC7px1+3xxbLlNoGvC6QYFA+gfya/9/T1uySaY5m8HUKHuCNhqbVERX+QqVxS9dXMNZVdwJ2VYDQE/kADK2bSOzV3nucTKjMimRa4XdzXFITSic2323s4CuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097716; c=relaxed/simple;
	bh=MS7wBS31az3nY8BubQfwrrIXlXvQJt6kkKLP4ntO8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNoasqgdOs8zyD8OvgNM3/wc4QiSYBD4OnCt5PdCV2A+MCJltnZ4Eoxk00wvloiqQ11BFceBK3DdAlW0xn47mEmPS4oNCNmc4Nsrxh23Ul8djidxIfYeK29/Yw21ZUGcj47XS6jntZ2tsaZ7moMntOZiNONYsSq+AsiOCKWTP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-01 (Coremail) with SMTP id qwCowACXP2vcSXJpCLXLBQ--.27565S2;
	Fri, 23 Jan 2026 00:01:34 +0800 (CST)
Date: Fri, 23 Jan 2026 00:01:32 +0800
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
Message-ID: <aXJJ3MjQSq8Rq084@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
X-CM-TRANSID:qwCowACXP2vcSXJpCLXLBQ--.27565S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4DKFWDKr43Gr13Xr43KFg_yoW8Wr1kp3
	93uF18CFWDK34I9F1jvw4xCw1DtFs5ta18JFnav348Aw43Z34kZF1I9w42vayjvrnrCayU
	Ar48Jwn8tFW2v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
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
	IFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Thu, Jan 22, 2026 at 07:40:29PM +0800, Xukai Wang wrote:
> 
> On 2026/1/19 16:18, Jiayu Du wrote:
> >> +
> >> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
> >> +		     K230_HS_HCLK_SRC_GATE,
> >> +		     0x18, 0, 0, 0,
> >> +		     &hs_hclk_high_src_rate.clk.hw);
> > Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
> 
> I'm a bit confused, as I don't recall making these specific changes.
> Looking at the code below, the only difference between v9 and v10 is
> within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
> the second parameter changed from 1 to 0. Everything else appears
> consistent. Could you clarify which change you were referring to?

> > but after my board test, I find that when hs_hclk_high_gate is turned
> > off, the mmc/sd and other high-speed subsystems can not work. So maybe
> > you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.
> 
> Regarding the clock management, I recommend explicitly enabling
> hs_hclk_high_gateas it will be closed by `close unused clocks`.

Sorry, you are right. It was me who made the changes locally. And I
saw your reply to this email[1], which you said According to the vendor's
code, the parent clock of hs_hclk_src is hs_hclk_high_src.

Indeed, the parent clock of hs_hclk_src is hs_hclk_high_src. but
hs_hclk_high_gate is the gate of hs_hclk_high_src. So, what you mean is
that you will add the CLK_IS_CRITICAL flag to the hs_hclk_high_gate?

Link: https://lore.kernel.org/all/159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com/ [1]

Regards,
Jiayu Du

