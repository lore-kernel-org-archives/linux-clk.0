Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396070;
	b=nVuBnCflK7c6VSqffD/MyzvFCgkW9jz5paxCUKGpc3If+TLmqiXQznzfPi//tHIBApdq
	 XtZjE6TWIfVifPhaSxW2Q+53I/3kbSGzdfRwx4ZcOHum4o2vrQpmdiROfI3Qc0hilK3tY
	 lA4Ghvk3KDWafFF8BB5eYjSoVAPZsh534ek8yRFv/GGCH5u/c373/cGFHGHOjRrguPvvJ
	 Bh+Rn0EpqmcSEXn0drfwNv147MBnoxE6IZJH3QwETGe3MoAfJvtI3iq+n7hhu+OClreik
	 sXk8gGfYtKyCouwYNbNU7Zarlj382z+3ekA3GXSNIpEfVwpdeVomSJ6HJ7bf9mWN3pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396070;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n9eMp4Ks0FZCltmngYBV5QRXUSvr6ha96eXxZ61XSW8=;
	b=B3ysep6StGbp80HdbhTjFQxrWmANO7xRAY6gQdgB2LHiCb/fxJxPzotbWK92pe5XxJNO
	 /YhWXHbBmZt/00digwjSIr76yytXVI1d+XXxI1hOKdgQAHHy2xwcjvNyrhMzff8chJf5x
	 +GFHZoOL9kmkdfoUc8yWvwXoeyFiNbGSubeTZ4iQoZxFPRiMFB/Id23GVNWUTJJfMDxhW
	 kV+E9Ojm/99zEtZ66hM5QyZ+yOH/FFQPjzKgTRvzdVH5Utt4DrJP10QywVCWFKKFNqT25
	 KdKwfhWlBFE1tJTr6/BYUD/UUobSp3GU3VnMqfNwQvp8i46Z6zilrOoyGwm6ia/ZNbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nq9s8uUi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23761606A324;
	Wed, 11 Nov 2026 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nq9s8uUi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641541F00A05;
	Wed, 11 Nov 2026 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396069;
	bh=n9eMp4Ks0FZCltmngYBV5QRXUSvr6ha96eXxZ61XSW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nq9s8uUiajv1IuSAJLt7CugwEflNVQaHq8pv0a5qZDdLjh5muesftq64zRDtM4n+l
	 J6sug2e++k4OLqgjijNR7/ZbA8X9lklhxIRoF4pW9vaGmrKIzJgiK4hyC5efq/J2Ug
	 HeqOfvxxo0Yh9uNR5sUMXWXn5tWnZ954CsDbTMXFQs9Zk8L1cvP9vzKVB96ehDJQLg
	 tXp1C74486sd1xrFi6bZ+farNlcPBKz2+50WzxGUrQP0SdzIhVnZPO1ogQQqHGhn9I
	 8AVl8XBQ34c30kl4crq+pw7F7/yskOGQvhZSbmZ7KTWkqM/LWBWcFcajhvqd0/YriB
	 WDpmHqZBu9oEA==
Message-ID: <sashiko-outbox-208862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: imx: clk-imx95-blk-ctl: fix error unwinding in
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manush Prajwal" <manushprajwal555@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <6af44b5c.67914289.fe7ab.6559@mx.google.com>
References: <6af44b5c.67914289.fe7ab.6559@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:21:08 +0000
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
- [High] clk: imx: uninitialized register overwrite in
  imx95_bc_runtime_resume() [1]
--

commit 19a6efb010aee7e2b721c30ed7ad173ca7b7d1df
Author: Manush Prajwal <manushprajwal555@gmail.com>

clk: imx: clk-imx95-blk-ctl: fix error unwinding in probe

This commit fixes error handling in imx95_bc_probe() by checking runtime PM
return values, dropping the runtime PM reference on failure, and disabling
bc->clk_apb on error paths.

> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-im=
x95-blk-ctl.c
> index bc6957299ceca..ad386a48ec2bb 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -394,17 +394,29 @@ static int imx95_bc_probe(struct platform_device *p=
dev)

[ ... ]

>  	if (bc->pdata->rpm_enabled) {
> -		devm_pm_runtime_enable(&pdev->dev);
> -		pm_runtime_resume_and_get(&pdev->dev);
> +		ret =3D devm_pm_runtime_enable(&pdev->dev);
> +		if (ret)
> +			goto err_clk_disable;
> +
> +		ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +		if (ret)
> +			goto err_clk_disable;
>  	}

[Severity: High]
This problem wasn't introduced by this patch, but doesn't calling
pm_runtime_resume_and_get() here [1] overwrite the hardware clock
control register with zero before any state has been saved?

bc is allocated with devm_kzalloc(), so bc->clk_reg_restore is initially
0.  When pm_runtime_resume_and_get() runs during probe, it synchronously
invokes imx95_bc_runtime_resume():

drivers/clk/imx/clk-imx95-blk-ctl.c:imx95_bc_runtime_resume() {
	...
	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);

	return 0;
}

Writing the uninitialized zero value clobbers the clock gate and mux
settings configured by the bootloader, disabling active clocks and hanging
dependent blocks such as display or LVDS.  Initializing
bc->clk_reg_restore from the register before enabling runtime PM (or
calling pm_runtime_set_active() before devm_pm_runtime_enable()) would
preserve the hardware state.

[1] https://sashiko.dev/#/bug/linux-2f2aa951-60e6-4afb-8098-949100502ab9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6af44b5c.67914289.f=
e7ab.6559@mx.google.com?part=3D1
