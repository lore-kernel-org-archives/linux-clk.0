Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881333;
	b=JhbbCS6911ajqWOIb5sm59G5paMOMUsx0vboZs7tCdFeqKZpYVTiTdXwbOfY4Vk8XnfV
	 e0Dmok93foNGeDaQ3lbE8yhBOFrc2Qze5aXAx/d+2F0bQ+91F0L2oLuk/WNe825X8e3R5
	 xEndNavxbABVjdxkJnVplGAhBlVJzOz9TEjRhC9rgUfe+i3/hUaZap5OI33aAuvQOF2HH
	 7mkARk3TPbmlEhmJXU6oeg9S0qq98PuQJZnQcZzB2ZcL1fb7DteP3TyEsLc+dnF9foexb
	 N/q3ot6BJB0URfqyi8BGf+FbtNgAmuwLGPaA0tyTQVtizFtiiIJdudd3qVaa5FWxy2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881333;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O0kqlkUgSmSoqBy9DLE4UWFhP6VuU5dzn+P+OCJY318=;
	b=B80lW/ILl3y/9ArPlj7tuL0fTfs9rZTeJMkxslNR4VWyQ4DAooaCxxCmJqhgpoWhvCym
	 z++Ra72wnHL/sLLkq6vFxl/nIFiOeyS7wOracESzjsXdnGXGa+QaAbW97mb6Ts1N9ccby
	 toYKlfNUKp7t9oFhSLGwIr/FwAU13LGIOXYBUxZ/PaEHx/K8uTRXgLqzyg5SwvReXAvUD
	 WPmV/+tVPO7SHlnuAd5wh8/mse1X3UuzUTc89SWx4aocJGxd7+p3eQN0QUdZjrn5xeLqm
	 7xBtO55RDaIHj04ebe4Mc3ivb7/o3emYyIW2qWF74q2yDXDf6cprLxA9sgbRAGxgPBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgWstCB7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02478606D809;
	Thu,  5 Nov 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgWstCB7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965FC1F00919;
	Thu,  5 Nov 2026 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881332;
	bh=O0kqlkUgSmSoqBy9DLE4UWFhP6VuU5dzn+P+OCJY318=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MgWstCB7ROogpjdCV60VvhQMKLLr5tfHfFbstjKmVrfVP1P7VNbKRgNYc9Tphqbq+
	 E+o6JxQtqsgnfwC6ZV6+YfTjVV3z7OYD4f7/ZdXRHszT7hILJQqnD5Y+HFyoZrQU0y
	 ntO8x/nvxywx4uoyqSLOghFv+HyEEQQ3G8+LKXNJP2OqMG4b/cB3Fc2M4jcBn+fzEB
	 n+wJrL2TijhWz3irQkN9GLt0Z2Ahc3bcj71XOpQZEL77+SLh0KX7zZgfBNLYjI9qnS
	 jBEqaDT+yestXqLyyu4XxA2cgwdgtyzslBD4TFZ5Uu9ZtQkngq2uXjhpovl3VAyagV
	 EsoPqvBPO2P2w==
Message-ID: <sashiko-outbox-199018@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/5] clk: en7523: protect concurrent access to reset
 and PCI register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105121059.11201-4-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
 <20261105121059.11201-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:22:12 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: en7523: separate spinlocks fail to serialize shared SCU regis=
ters
- [Medium] clk: en7523: stale REG_PCI_CONTROL write after sleep in en7523_p=
ci_prepare()
--

commit 5b2603a4978075ae29e211f7115d7f39dfefbc9e
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: protect concurrent access to reset and PCI register

This commit adds spinlocks to struct en_clk_gate and struct en_rst_data to
serialize concurrent read-modify-write accesses to the PCI control and reset
registers.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 2baec734df9fe..c05d0bfa23400 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -123,6 +123,8 @@ struct en_clk_desc {
> =20
>  struct en_clk_gate {
>  	void __iomem *base;
> +	/* protect SCU register */
> +	spinlock_t lock;
>  	struct clk_hw hw;
>  };
> =20
> @@ -130,6 +132,8 @@ struct en_rst_data {
>  	const u16 *bank_ofs;
>  	const u16 *idx_map;
>  	void __iomem *base;
> +	/* protect SCU register */
> +	spinlock_t lock;
>  	struct reset_controller_dev rcdev;
>  };

[Severity: High]
Since struct en_clk_gate and struct en_rst_data each embed their own separa=
te
spinlock_t instance (initialized independently in en7523_register_pcie_clk()
and en7581_reset_register()), do PCIe clock operations and reset controller
operations still race with each other on the shared SCU registers?

Specifically, both structures point at the same SCU MMIO base and perform
read-modify-write updates on the same physical registers:

  - Offset 0x88 (REG_PCI_CONTROL / REG_NP_SCU_PCIC) is modified under
    &cg->lock in en7523_pci_prepare(), en7523_pci_unprepare(),
    en7581_pci_enable(), and en7581_pci_disable(), while
    en7523_reset_update() modifies the same register under &rst_data->lock.

  - Offset 0x834 (REG_RESET_CONTROL1 / REG_RST_CTRL1) is modified under
    &cg->lock in en7523_pci_prepare(), while en7523_reset_update() modifies
    the same register under &rst_data->lock.

Should struct en_clk_gate and struct en_rst_data share a single spinlock (or
a pointer to one) so that concurrent clock and reset operations actually
exclude each other when accessing these shared registers?

> @@ -577,44 +581,78 @@ static u32 en7523_get_div(const struct en_clk_desc =
*desc, u32 val)
[ ... ]
>  static int en7523_pci_prepare(struct clk_hw *hw)
>  {
>  	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
>  	void __iomem *np_base =3D cg->base;
> +	unsigned long flags;
>  	u32 val, mask;
> =20
>  	/* Need to pull device low before reset */
> +	spin_lock_irqsave(&cg->lock, flags);
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	val &=3D ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
>  	writel(val, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&cg->lock, flags);
> +
>  	usleep_range(1000, 2000);
> =20
>  	/* Enable PCIe port 1 */
> +	spin_lock_irqsave(&cg->lock, flags);
>  	val |=3D REG_PCI_CONTROL_REFCLK_EN1;
>  	writel(val, np_base + REG_PCI_CONTROL);
> +	spin_unlock_irqrestore(&cg->lock, flags);

[Severity: Medium]
In en7523_pci_prepare(), after dropping &cg->lock across usleep_range(1000,
2000) and reacquiring it to set REG_PCI_CONTROL_REFCLK_EN1, could reusing t=
he
cached val without re-reading np_base + REG_PCI_CONTROL overwrite concurrent
changes made to REG_PCI_CONTROL while the lock was released?

The subsequent critical sections in en7523_pci_prepare() re-read the regist=
er
after reacquiring &cg->lock, but this block still modifies the local val re=
ad
before the sleep.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105121059.1120=
1-1-ansuelsmth@gmail.com?part=3D3
