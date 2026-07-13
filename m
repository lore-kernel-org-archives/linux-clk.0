Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828F7145B3F;
	Mon, 13 Jul 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934034; cv=none; b=gfZMQYqtoSSGejpiRxyuhph0+ng9LEdbq33jwN7hcKmBiyX6id8Y+rMF2L7Rm8WvxwyoERGDB/fYHD9FE95wnrCuQ4fdK5OYvwn+BKxNflVJ/Vks8yMSfPR6OG3U/MWk89XWyrm/Vfazhj+6Hpq8zlzyzUUJzJ1mCwbcXblxRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934034; c=relaxed/simple;
	bh=dcCDLxbyJUIXwfhBT64SAsExYyiIGV2LF8cYyZrekEI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=IKyHRJr0uwX+wLnnwg2EhkdQMPiSxxRJEgFkWScz0b/lOQWIqTLm4XgoAkYTtrYvHlBWOMhW0X+lWzvhbSDiiSosWeWoB5WCasGCnDd43mY+uoy41UB0c+nykSvZcXrE/rVlEw8UkaKsY2soLDcYc9WCEvt+79RYjS8RReBF8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=IUuGB3GK; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="IUuGB3GK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=VPrIFSTxqSlGbcvuQoKbhlpKcFEI6JaSI
	349NQx+Zgk=; b=IUuGB3GKPqgYvkjowh7DX5Zzu4C3USSYRQjbvO1VX9f9DDCI0
	oi/fbYjO093ziDVtCiTG7iQmizpBk+AhCXBUmFTZ9w6bJH/COQVze/uJQVj5kSEg
	xinhwYaEDv5LKc7lhvcXh7abbxhjjDnfTuXGhMg2IhSblKdTxGHtCDLSKc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJcrFRqA48QAA--.16585S2;
	Mon, 13 Jul 2026 17:14:05 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] clk: ultrarisc: add DP1000 clock driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <ak5fGAp2NMPgW77M@redhat.com>
References: <20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com>
 <20260617-ultrarisc-clock-v2-2-9cb16083e15e@ultrarisc.com>
 <ak1Zc7uSoqx-F_7Q@redhat.com>
 <178349718662.2043299.5991323028483371285.b4-reply@b4>
 <ak5fGAp2NMPgW77M@redhat.com>
Date: Mon, 13 Jul 2026 17:13:33 +0800
Message-Id: <178393401383.3197075.7283325660001879501.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934014; l=1815;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=dcCDLxbyJUIXwfhBT64SAsExYyiIGV2LF8cYyZrekEI=;
 b=mPIF9TaQ0styqNJX6Lj462n06oarXZ44l+TmRuyZeJLmhi2BOM5OAcjSiPW90B1wbclFFBNYM
 UtV9cdLSWemBz5fAFFeuYa96UwhAVlE/aKxEvQqU1efVY+jIdfbaItU
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYUJcrFRqA48QAA--.16585S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWDWr4UCw13WF15tw4kXrb_yoW8WrWfpF
	WrGa4jkrW0qF13Zw42v3WqyF9xtw18tayjk3srJw1SvrnIqrySka1fJas8CF1rZry8WFyj
	vF4jvFyxWw1FyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWpUYNAAJgAMsz

On 2026-07-08 10:30 -0400, Brian Masney wrote:
> On Wed, Jul 08, 2026 at 03:53:06PM +0800, Jia Wang wrote:
> > On 2026-07-07 15:54 -0400, Brian Masney wrote:
> > > On Wed, Jun 17, 2026 at 02:02:55PM +0800, Jia Wang wrote:
> > > > +static struct clk_hw *
> > > > +ultrarisc_clk_hw_register_composite(struct device *dev, const char *name,
> > > > +				    const char * const *parent_names,
> > > > +				    int num_parents, struct clk_hw *mux_hw,
> > > > +				    const struct clk_ops *mux_ops,
> > > > +				    struct clk_hw *rate_hw,
> > > > +				    const struct clk_ops *rate_ops,
> > > > +				    struct clk_hw *gate_hw,
> > > > +				    const struct clk_ops *gate_ops,
> > > > +				    unsigned long flags)
> > > > +{
> > > > +	struct clk_hw *hw;
> > > > +	int ret;
> > > > +
> > > > +	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
> > > > +				       mux_hw, mux_ops, rate_hw, rate_ops,
> > > > +				       gate_hw, gate_ops, flags);
> > > > +	if (IS_ERR(hw))
> > > > +		return hw;
> > > > +
> > > > +	ret = devm_add_action_or_reset(dev, ultrarisc_clk_unregister_composite,
> > > > +				       hw);
> > > 
> > > Use devm_clk_hw_register_composite_pdata()
> > > 
> > 
> > I originally used clk_hw_register_composite() together with
> > devm_add_action_or_reset() because devm_clk_hw_register_composite_pdata()
> > is not currently exported, while this driver can be built as a module.
> > 
> > If exporting it is acceptable, I can add a preparatory patch in this series
> > to export it and then switch the driver to use that helper.
> 
> Yes, I think that exporting this makes sense.
>

Thanks. I'll add a preparatory patch to export the helper and update the
driver to use it in the next version.
 
> Brian
> 
>

Best regards,
Jia Wang 


