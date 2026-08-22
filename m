Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE8389115
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787393287; cv=none; b=tsIZ9eKd8h7atL8ui9sADXZKTXAD3muNQONgoVTbV8hDtla6Fr3rKmofJRqGy0/0xu8asHaY3M5VKx+kW3s6Y8xvj0gQ8LdJ+g7iljVyzJuZK79RC5AS75/L4m0+UB7O/H1UBdvR4u9mF77r5EvgqFWP6g0x7DRWW4JkwGfSKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787393287; c=relaxed/simple;
	bh=QwEwLWfYovktFB0vLfabHLllnSnZFaoIG32iako7kyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I4orKRelHxz/URP4IjtEY5HnwxyeTrcZ+qrK43RJToDslyPnB+sS2fR1MWTUWrwUlBpYm3gqbOSV5h3pFQLjuYmlWJCm3uMjWbgNr5O9oh0lbQndq6Dgs7hVAL5TcUkfkU45iMJCDtvoTeJSp80b/6gyvsBXsIUfmNgvkgGl3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ+BzHCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ+BzHCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3BC1F00A3D;
	Sat, 22 Aug 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787393286;
	bh=/d8P7I7vfJQ0XS9w54AjTC92hEX2uM5eQCtR99DuSq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJ+BzHCecay9FzxuMPe090CXACpMULnVL3vv+ccX4Zx/9UadHu0xjiMsAYUsUFcET
	 Y6meGcfEK8qbB1X0hNxFlcbQG0PM3C8lgqnWY6JNni70KqAAW4yKnIEwvdNW9Vxlib
	 lTqtEbyPfXXbvW1KATtUhDuJQxD+3ZePAZKpwOeRMrjHNZ533fPx1IcsjvqGF8qx0L
	 QNN+Fj/89xhHtdWLtQ4rVA4iQgFdcV/e/Cd1a83oFtnal5EAPec1+q7Wbn/tvscvxN
	 k1mX6VPFYCzdaeM/5RWB6SL/rUbxSedlMOo83gLDDAxg8gGE9S+iH98jAQr+ZUoM/B
	 E86as0rXgmgiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/3] net: phy: air_en8811h: Make sure
 clk_init_data is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <ebafac1803ee032ebd544a6ec5a1608c5630d81a.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
 <ebafac1803ee032ebd544a6ec5a1608c5630d81a.1787240118.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 10:08:05 +0000
Message-Id: <20260822100805.BB3BC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PHY driver calls the global `clk_save_context()` and `clk_rest=
ore_context()` APIs in its suspend and resume paths, forcefully saving and =
restoring all clocks in the entire system.
--

--- Patch [3]: [PATCH net-next 3/3] net: phy: air_en8811h: Make sure clk_in=
it_data is fully initialized ---
commit 681a33786ef724d10dc7ce4f726e8ec894967ea4
Author: Geert Uytterhoeven <geert+renesas@glider.be>

net: phy: air_en8811h: Make sure clk_init_data is fully initialized

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need. However,
not initializing all members may cause subtle issues. This commit makes
sure all members are fully initialized.

> diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
> index edd49c193e476..d1ab8744288bb 100644
> --- a/drivers/net/phy/air_en8811h.c
> +++ b/drivers/net/phy/air_en8811h.c

[ ... ]

> @@ -1031,7 +1031,7 @@ static const struct clk_ops en8811h_clk_ops =3D {
> =20
>  static int en8811h_clk_provider_setup(struct device *dev, struct clk_hw =
*hw)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	int ret;
> =20
>  	if (!IS_ENABLED(CONFIG_COMMON_CLK))

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this driver'=
s=20
clock handling I noticed a potential power management issue further down in=
=20
the file.

In drivers/net/phy/air_en8811h.c:

static int en8811h_resume(struct phy_device *phydev)
{
	clk_restore_context();

	return genphy_resume(phydev);
}

static int en8811h_suspend(struct phy_device *phydev)
{
	clk_save_context();

	return genphy_suspend(phydev);
}

Is it safe for the PHY driver to call the global clk_save_context() and=20
clk_restore_context() APIs during its suspend and resume handlers?

These APIs are intended for core PM operations and iterate over the entire=
=20
system's clock tree to save or restore state for all clocks system-wide.

Could restoring all clocks globally whenever this single leaf PHY resumes
forcefully reset or disrupt the clocks of completely unrelated devices,
potentially causing system lockups or crashes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240118.gi=
t.geert+renesas@glider.be?part=3D3
