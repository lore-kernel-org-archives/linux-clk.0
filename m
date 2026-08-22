Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE173806C8
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787393286; cv=none; b=KU7VfpBoZPpfvYZ9pNwAWEPeoYMomU+5wqTYLpl7ju7cdNaE+Tt2VqGbOg2l2uo7RVc0xgXbkih/ReNYZOoh2U3F1CXotM41M6wKyIvYzCPCKHreNKNJTbEI2Nl9k5DErn6xEdL9YNAs+WOZxUHQSJFbpbZbChsZelxBbNe7e0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787393286; c=relaxed/simple;
	bh=cZu96uVe3P2z6zOyOUFsCY0Vqc1FywbJHBLH8HLn/Uk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oWd+2hrlThi4rWrTqw8/JmrD0nMHDcji80ArRh84yPDrmzqMd2zQJgphpE8wLSJX2/IUBdu4NOWkXQEpQoNegjwXGHZvPvn1yjTNpuX2IWmyJ/cO5CYBQoUFtEXqALJ1DZUkvPUTFioeND/cwbJwDx+WsyohMH0s8EYNgm1wcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfVByST2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfVByST2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26681F00A3A;
	Sat, 22 Aug 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787393285;
	bh=tg5kjStL0tCD6eQ9sGookoa7WJnCMLpD6A94KGeYygU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SfVByST27BjnBU3hMZ1TnEVqTN4Bt1BfIdusaJtyjb8SCGCURd840qON+odz/ZTkg
	 QDzOjcyrooJgcpKLdObdOJd7gLg7d8rCchcwnOhFxpeNa0K/rw3h4IW1tqc0rOuT8l
	 pLj/WYxAWZySSGazaHKMOPcrzGoAH7weEt0D/8AkFPXxGMlZgFR4tdzcwIfox5pmtP
	 kTfGk/fV3LucIt5rqNCs6s2LYFCk68zQ9pYUNl7dAdADRZb5wKLVNMRVxQRsAqexE1
	 BzkkCFQoNAsRPySaVk8nni71RQMKccKlUYdI5JFfpDp3OvprFIx5bHgMCaGVdQ4QUx
	 UodhKjUwBYX+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: mux-meson-g12a: Make sure
 clk_init_data is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <ae6cfac64d3983801b9baa2abb30bf09c3d7ce3b.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
 <ae6cfac64d3983801b9baa2abb30bf09c3d7ce3b.1787240118.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 10:08:04 +0000
Message-Id: <20260822100804.F26681F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Busy-wait loop of up to 1 second with interrupts disabled in atomi=
c clock enable callback
--

--- Patch [2]: [PATCH net-next 2/3] net: mdio: mux-meson-g12a: Make sure cl=
k_init_data is fully initialized ---
commit 061a72e517f35ad4bc41a274d2b768db77d84ad1
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: net: mdio: mux-meson-g12a: Make sure clk_init_data is fully initia=
lized

This commit ensures the clk_init_data structure is fully initialized by
adding an empty initializer. This prevents subtle bugs related to mutually
exclusive members when different stack initialization patterns are enabled.

> diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/md=
io-mux-meson-g12a.c
> --- a/drivers/net/mdio/mdio-mux-meson-g12a.c
> +++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
> @@ -223,7 +223,7 @@ static int g12a_ephy_glue_clk_register(struct device =
*dev)
>  {
>  	struct g12a_mdio_mux *priv =3D dev_get_drvdata(dev);
>  	const char *parent_names[PLL_MUX_NUM_PARENT];
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};

[Severity: High]
This is a pre-existing issue, but while reviewing this clock initialization=
,=20
I noticed a potential lockup in the related PLL operations.

Does g12a_ephy_pll_enable() risk triggering the hard lockup detector?

The g12a_ephy_pll_ops struct is used later in this function to initialize=20
the pll clock, and its .enable callback maps to g12a_ephy_pll_enable():

drivers/net/mdio/mdio-mux-meson-g12a.c:g12a_ephy_pll_enable() {
    ...
    return readl_poll_timeout(pll->base + ETH_PLL_CTL0, val,
                              val & PLL_CTL0_LOCK_DIG, 0, PLL_LOCK_TIMEOUT);
}

The clock framework calls the .enable callback with the enable_lock spinlock
held and local interrupts disabled. Since the delay parameter is 0 and=20
PLL_LOCK_TIMEOUT is 1,000,000, readl_poll_timeout() evaluates to a tight
busy-wait loop.=20

If the PLL hardware fails to lock or takes a long time, could this stall=20
the CPU for up to 1 second in an interrupt-disabled context?

Would it be possible to move this hardware initialization sequence to the=20
.prepare callback instead, which executes in a preemptible context where=20
sleeping delays are permitted?

>  	struct g12a_ephy_pll *pll;
>  	struct clk_mux *mux;
>  	struct clk *clk;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240118.gi=
t.geert+renesas@glider.be?part=3D2
