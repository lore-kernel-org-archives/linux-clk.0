Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011C2D7DCE;
	Wed, 22 Jul 2026 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679326; cv=none; b=mpySrhO/3NUPFE++hZMgyw0Hf1XBB/jsGbFbvXJFloScevQ8NE6n0FR+ReFbnsYfeD/LWaK1kKs8c9fqXOk1JcTgPtWEZZPBhMnQ26+HChD/3+OfalC+TnKYkR7lGeVFpBXjnq30MdtgPUeWUCQiyuIaVctV2G9rf+atcNAJE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679326; c=relaxed/simple;
	bh=cNLUTybXKA4UkUr95prSBmvnXyEfDjiSjqPicEwBoHQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=APVwjY+OYIoeY5ohFn7OriFqlhZCCQNQ34D9udhV71N0J7WB34uDWRXKji/s0C7jcaHAdzcoMc/fD0YcttEv7/5eMaj1GwgZ9GVQRtKL89wCaB+E/90+P0Qdd0rekdvixrdImg3wG0vIKHxccUVuNxF8M4vpXSbP5SIF6NORVX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=k9dJiaap; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="k9dJiaap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=ZKisz1Ne04iXRtMnkOfnTn3thtOBxgjaa
	dn6CyTjmJQ=; b=k9dJiaapOZxvRslR7YPfqqFzkKBQglFIeLWIhTyDn92R7U7Ra
	h/phl75gCsB/sA+TdNXikHjscxdhmcYbPY2AWRGBx86nVx37RptDwJiG33LnDUSC
	p8AIw4h6EhlxMBkbJb1PfK4Y1F8dKiS55DIUizxLidoxQF3vUGXIu0uaXc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOsC2Bq9IMUAA--.17601S2;
	Wed, 22 Jul 2026 08:15:40 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 0/3] clk: ultrarisc: add DP1000 clock support
From: Jia Wang <wangjia@ultrarisc.com>
To: Brian Masney <bmasney@redhat.com>
Cc: wangjia@ultrarisc.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <al_oYeD8EKHAGnPl@redhat.com>
References: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
 <al_oYeD8EKHAGnPl@redhat.com>
Date: Wed, 22 Jul 2026 08:15:10 +0800
Message-Id: <178467931058.4117678.1808952053832316217.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784679311; l=1534;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=cNLUTybXKA4UkUr95prSBmvnXyEfDjiSjqPicEwBoHQ=;
 b=iV3j9p0EK8AWc4gdSQozmt8ztshsMsv5RraC+Y7Pk85VVdmI7qBlJpv4fzOgorHjynC9NDTTp
 ye/bWcbeE3MAOApMbbY0kRa9JfK2Xl+09I/lCyMNls5Pu42VKSIfwBy
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkOsC2Bq9IMUAA--.17601S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4rXFy7Ary8Ar47WFy8Zrb_yoW8Gw4kpF
	W8GFs5tFWkX3W2vws29wn2vry5Jas8tFWUJ3yUKry5tF1fWr1jqa97K3WfW3y29Fn5Ar9a
	yayj9w17AF42vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWpYVVAAAwAesw

On 2026-07-21 17:45 -0400, Brian Masney wrote:
> Hi Jia,
> 
> On Mon, Jul 20, 2026 at 08:38:03AM +0800, Jia Wang via B4 Relay wrote:
> > This series exports a small common clock helper and adds the devicetree
> > binding and clock driver for the UltraRISC DP1000 SoC.
> > 
> > The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> > the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> > I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> > and SPI0-1.
> > 
> > Testing:
> > - dt_binding_check and dtbs_check on ultrarisc,dp1000-clk
> > - Kernel build for RISC-V and boot-tested on DP1000
> > - Modules build test for CLK_ULTRARISC_DP1000
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> > Changes in v4:
> > - Drop the initial clk_hw_get_rate() max-rate warning after setting the
> >   divider rate range.
> 
> I also see this in the diff between v3 and v4. Is this expected?
>

Yes, this is expected. The change only fixes the oddiv1/oddiv2 field naming
to match the hardware definition and does not affect PLL frequency
calculation.
 
>  +++ b/drivers/clk/ultrarisc/clk-dp1000.c
>  @@ -0,0 +1,154 @@
> @@ -309,8 +309,8 @@
>  +	.frac_mask = GENMASK(23, 0),
>  +	.m_mask = GENMASK(23, 16),
>  +	.n_mask = GENMASK(11, 6),
> -+	.oddiv1_mask = GENMASK(4, 3),
> -+	.oddiv2_mask = GENMASK(1, 0),
> ++	.oddiv1_mask = GENMASK(1, 0),
> ++	.oddiv2_mask = GENMASK(4, 3),
> 
> Brian
> 
> 

Best regards,
Jia Wang


