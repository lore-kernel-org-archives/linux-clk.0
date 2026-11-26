Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681970;
	b=ZXNRMrU5RSArRTqk1wzi3K8N+iAJU8KzRJNhuCx1QjicHNdxbij6+eFsXILNSbrNio/j
	 AcgiP6Uq3oZ3dWy7lliseUPAcETi3GemV3SW5/U1UrJuMuZqRUeZetMF6HwzO//3GmyXV
	 PAV5XeaeDZ0YylHWfn3oNGm6mtS8TmpqOuXgAE9XlzMES7bC4X8u6k35RBB13iMxE+6ig
	 mm90nXXDvrxhTAgSCZ1hvUbPU2HhgU5xCsQwdbiw2iOARnl4lzHDrQ0eII5svdtk1INVw
	 BQYfSv8/nH1VO+UClDQYv3kyQtG7dB56EEzSPeueLmbyS/Yf/e2EL+Kh62DDdhuNvCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681970;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wLxY5sB8v8mPk8KgUDUq9dwEXJAF4r+U8SN0f9BdvmQ=;
	b=oyYMmPJVX279CYmegGGIjsUv+IE0d2lNludP82vcxlZqynm/QNKy121Jmn9Ncnm6j6wH
	 n5muakbomB5hh7JBt6y6CCeTzW/wkYwE5dgv5avvkI0MQNulbt8DJH3bmOFKjKAKHY6V6
	 r+rEWnaOwISJnPz+T3hArY1IAUo7SrJ/46ANRw1rCPhDiDQv0f8RhWlVybSpw5+5UYwVM
	 7luZ7IKZGsYY50JYp/w20R6ui2Tt41+3uzEMBpZnVFojAr+IOvZp+67qfGu7in8/oNB0n
	 RTzYK01h45VAIR3BNcgVE759VpdTa5NRi3R1dBX5mtlTSCJOu/kEyC3LRA3Q383HCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nph5ynBL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C51606A32A
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nph5ynBL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FCA1F000D8;
	Thu, 26 Nov 2026 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681969;
	bh=wLxY5sB8v8mPk8KgUDUq9dwEXJAF4r+U8SN0f9BdvmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nph5ynBLYEsKe+yImvoqcbvYb04unLBm3Ba987Q+sbVNu3P9dzEApC/CQ+x7Za9Mo
	 Z32bXqCTH+q4F8x6MhEbwN2rJuF+epQgh7Cw6jffiYIWafZlLkxPyqjpN+2Waxq7Ji
	 lCoKOnf7EcGy4BI5TgJ92N6T6RYyxkGP3SEkrlCS4f/7sNCT08V97KQfXOqLpE6EJW
	 AAzvYjuVPcHNwYDYwQY3szVh9JJk1dSguLGgqh9jT/ZzjjjGQjX0nNUfVY6lS1fllE
	 QKImawH3ER66gH80o6bPleDvKqMpVp3UzUpAzWiKZZzpv3cy6ZsCfUJ5bwEkmqSovm
	 eeoUUr5jdLaYw==
Message-ID: <sashiko-outbox-235026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: nuvoton: Manage MA35D1 mux clocks with the
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:32:48 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] clk: nuvoton: use-after-free in ma35d1_clocks_probe() [1]
--

commit 9ff45d0263efa96de1be9a7ff0a42ea74ccdf3fa
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

clk: nuvoton: Manage MA35D1 mux clocks with the controller

This commit converts ma35d1_clk_mux_parent() and ma35d1_clk_mux() to use
devm_clk_hw_register_mux_parent_data_table() so that the mux clocks are
automatically unregistered when the platform device is removed.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index e95f72bb81032..4428556b64ade 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -380,9 +380,9 @@ static struct clk_hw *ma35d1_clk_mux_parent(struct de=
vice *dev, const char *name
>  					    const struct clk_parent_data *pdata,
>  					    int num_pdata)
>  {
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> +	return devm_clk_hw_register_mux_parent_data_table(dev, name, pdata, num=
_pdata,
> +							  CLK_SET_RATE_NO_REPARENT, reg, shift,
> +							  width, 0, NULL, &ma35d1_lock);
>  }
> =20
>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *nam=
e,
> @@ -390,9 +390,9 @@ static struct clk_hw *ma35d1_clk_mux(struct device *d=
ev, const char *name,
>  				     const struct clk_parent_data *pdata,
>  				     int num_pdata)
>  {
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> +	return devm_clk_hw_register_mux_parent_data_table(dev, name, pdata, num=
_pdata,
> +							  CLK_SET_RATE_NO_REPARENT, reg, shift,
> +							  width, 0, NULL, &ma35d1_lock);
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but right above
ma35d1_clk_mux_parent(), doesn't ma35d1_clk_fixed() also leave its clocks
registered on probe failure or driver unbind [1]?

drivers/clk/nuvoton/clk-ma35d1.c:ma35d1_clk_fixed() {
	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
}

Because ma35d1_clk_fixed() uses the unmanaged
clk_hw_register_fixed_rate() helper instead of
devm_clk_hw_register_fixed_rate(), the fixed-rate clocks remain
registered in the clock framework and leak after ma35d1_clocks_probe()
fails or the device is unbound.

[1] https://sashiko.dev/#/bug/linux-0fffc72d-3bbf-4403-b81b-eac9ff603015

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-a35bb25eb5=
-u10-0@mail.sdu.edu.cn?part=3D1
