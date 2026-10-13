Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D00344DB1
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875972; cv=none; b=J2Ytvn8037Gwz6kmZiAkcNt/QGa//2mBdwfwcLN7BJeA2PMipN4E413rXjI1fSmZt/Ss0Fc/FENFR0Fs4WrCbnbDpyy1x3t2hQyFkOEUGVsTkkzNLJOwWSPpH8pIaxOCSemW+sNuZUCZAclhTDjnhyUeqfBSl5o4EFQZ86hldXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875972; c=relaxed/simple;
	bh=sEglk4zDiaRWMZn6TV5RhybCrCHj6S4q7FbWVKCjTkI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=KDjhfwoJAKKaxj+wUgw8YAMowxgi5RNF4WNQMbWp7CDO03uZdhxmKySzifd+NKQ7XlSvPCe2YYVV3cSTh8uM98JGprHb2AszNhq4FZKtWpe4SGZ5U+6Up5gIX+kB5r4ADQmzctmDMlHC4QhweQhY4f8nbtA4zWEBmEQNKZdHlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxuCcPYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxuCcPYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A466D1F000FF;
	Tue, 13 Oct 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791875970;
	bh=oDJC8jzbYR7I0TuCKgdiwyCtyKydAySserzPu1skwW4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=nxuCcPYNJCDxiZmAOEXFhrTAbzkcuTjhzV9mvyGKuUjt5SVXrrfAsgwD9iiuc+0Ga
	 Dff6vYtmrV+rpTPbctdcO1yD36ub2MK1urX9PLt4XaN2y7PyLLtw2GP0WxKrxuLOkC
	 qSQWvBi847hI78M/kZEfE6Z36XL8jJi2O6yJ12lFGbcFvdD6U60QXgT0IeTfm35RPq
	 /LxEF4SYYAhxgDkJwhby2qIAQvvwI2r6qGjDGCiu3rQCckUDwOwglLTOTTcuqaS9xP
	 vbuFkKz/Puq6vWCyZXz5qu+LdITHQSh/fx2yWyDS+olvuUYLD7QH1SXzZu3ng8Gijh
	 xOzfF0ADcApEA==
Message-ID: <sashiko-outbox-169178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] clk: socfpga: stratix10: register the SP timer
 clocks early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>, linux-clk@vger.kernel.org
In-Reply-To: <7de51d5f9c716c03fabab77d1a2b4dba3af745fd.1791871090.git.adrian.ho.yin.ng@altera.com>
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
 <7de51d5f9c716c03fabab77d1a2b4dba3af745fd.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:19:30 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: socfpga: data race in early provider hws array modification
--

commit dfd4eb57c5dabe82235a8f50e5c912f34f5c229f
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

clk: socfpga: stratix10: register the SP timer clocks early

This commit changes the Stratix10 clock manager to register the l4_sp_clk
and its parents early via CLK_OF_DECLARE_DRIVER(). The remaining clocks
are deferred and registered later when the platform driver probes. The clock
manager structure, including the hardware clock array, is reused between
the early and late init phases.

> diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
> --- a/drivers/clk/socfpga/clk-s10.c
> +++ b/drivers/clk/socfpga/clk-s10.c

[ ... ]

> +static int s10_clkmgr_init(struct platform_device *pdev)
> +{
> +	struct stratix10_clock_data *clk_data;
> +	int i, ret;
> +
> +	if (!s10_clk_data) {
> +		ret =3D s10_clkmgr_setup(pdev->dev.of_node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	clk_data =3D s10_clk_data;
> =20
> +	s10_clk_register_c_perip(s10_main_perip_c_clks,
> +				 ARRAY_SIZE(s10_main_perip_c_clks), clk_data);

[Severity: Medium]
Does this introduce a data race with concurrent clock consumers?

Because s10_clkmgr_early_init() previously exposed the clock provider array
by calling of_clk_add_hw_provider(), the array can now be read locklessly
by other threads via of_clk_hw_onecell_get() while consumer drivers probe.

When s10_clk_register_c_perip() runs here, it writes newly registered clock
pointers directly into the array:

s10_clk_register_c_perip()
    data->clk_data.hws[clks[i].id] =3D hw_clk;

Modifying this array using standard C assignments without annotations like
WRITE_ONCE() or a lock while it is exposed to readers constitutes an
unannotated data race under the Linux Kernel Memory Model. This could=20
potentially lead to compiler tearing or KCSAN splats.

[ ... ]

> +	for (i =3D 0; i < STRATIX10_NUM_CLKS; i++)
> +		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
> +			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);

[Severity: Medium]
Could modifying these deferral pointers concurrently cause issues for reade=
rs?

The same exposed clk_data->clk_data.hws array is modified directly without
WRITE_ONCE(). A concurrent reader accessing the array via
of_clk_hw_onecell_get() could observe partial updates or inconsistent state=
s.

> +
> +	return s10_clkmgr_add_provider(pdev->dev.of_node);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791871090.gi=
t.adrian.ho.yin.ng@altera.com?part=3D3
