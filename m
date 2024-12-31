Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E4B64A;
	Tue, 31 Dec 2024 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735605566; cv=none; b=Q3RLDR++dCSShPqRcmNj+FzX0b9QvuWz1Vlo8TxLdzxezFNHuHEhg99k/vchSHArti2oJ8Xc9PQSm04PVgmC0Xq84v1MnJwX3FVElv4UovwlrSrwNJxFYAvlu3mJ6zSs0lUU9aZ4Gh1SZNFzCfIp0y5C9YUqihhknyXiU5G+9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735605566; c=relaxed/simple;
	bh=DebDtKWVcH8ESuuP0gUMAP0mpjt23oiaM+dD/NQMrrw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=E3qfP3MslP4vAAfk3ZTG1v42JvmvUBkBf9Hp+KOe9Kfu5t2FuDk33OD1escB+bjPMlXXoinRnjOcBJmPU8cOQtNV5I15hpoaeqV6jO2zsuyRn50Urh5CJ+qaLmpgv+JrkezBhSOu3MSbUAFJ23LQ2RNiHZ57lD2mTnCHbOgV5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3bWGKFJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3bWGKFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1AEC4CED0;
	Tue, 31 Dec 2024 00:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735605566;
	bh=DebDtKWVcH8ESuuP0gUMAP0mpjt23oiaM+dD/NQMrrw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h3bWGKFJblMbN7mV4PEaDApqhHXlIHioiHhM57nEeRpZjKsdmENT08ASeaO84EkMv
	 AzfmI1kqVBSq2/+3np+FbroYnkxlj4IVzgLFlHPYOI7fneCoQTL3jlvudgrEFdD9lN
	 sBjppnIwEdKNe+7ILjL03aAcSKjBgjtPGqfjc3ZD4taKGFGDEg5o+ZjlV0m6qPEsCE
	 TGn3UIjSYFD3p5G75zeJs9rjFGr1i/8TsWPn0ejmzHSz1L0RdTQRufo9TeKPyvzFpw
	 MeMbUq13pdNku8a8OamO/QZKaYsxujW3VZ9YM3V8opwXq9fEMZ+0J6lCpHl/VTN0wg
	 djFBe5neV0FYw==
Message-ID: <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241226122023.3439559-2-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com> <20241226122023.3439559-2-rohit.visavalia@amd.com>
Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Mon, 30 Dec 2024 16:39:23 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Rohit Visavalia (2024-12-26 04:20:21)
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index 81501b48412e..f294a2398cb4 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
>          * Bit 0 : Gasket isolation
>          * Bit 1 : put VCU out of reset
>          */
> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset",
> +                                                  GPIOD_OUT_LOW);
> +       if (IS_ERR(xvcu->reset_gpio)) {
> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> +               dev_err(&pdev->dev, "failed to get reset gpio for vcu.\n"=
);

Use dev_err_probe() and friends.

> +               goto error_get_gpio;
> +       }
> +
> +       if (xvcu->reset_gpio) {
> +               gpiod_set_value(xvcu->reset_gpio, 0);
> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 33.3=
3KHz */
> +               usleep_range(60, 120);
> +               gpiod_set_value(xvcu->reset_gpio, 1);
> +               usleep_range(60, 120);
> +       } else {
> +               dev_warn(&pdev->dev, "No reset gpio info from dts for vcu=
. This may lead to incorrect functionality if VCU isolation is removed post=
 initialization.\n");

Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an
unfixable warning message if the reset isn't there. Why have this
warning at all?
