Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C4A156C6A;
	Tue,  3 Feb 2026 00:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078945; cv=none; b=kgI1sSOosfmSKVqK9QFv/MbQqbGolnZOCYtxctm5yT8fT3sBROnrZFe9ejCKpTIHqzW0NMhldZ5Mh6WmoBeLkZLi8FoVcT7zip7z8W1tAgN1S6RH49Amc3+X49/vWQXHah+SNaPS3QLkxnQjTbezBpkDSjSHlydJ0qSeJ+C4/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078945; c=relaxed/simple;
	bh=7dXYnceLs4yQblLFCx0ReDZ1mOmpPWouUEBO3yddK54=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mBYnamw8Zv71Nn7M08Ta6+ELQUTCoo0GKfxpUA4JLxmrSZ3liyhxKT/ahOQZZF36wdqWMAxDZItKj51rSf5s2ov4CB/7HmAcCQFfzLBkFED4JzpTl0qx3rKaW6TdLW04Hjvry4QnNjEn9IYw6JS3flZ6brX0WARU2sGfvubDhuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVM6Zqti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVM6Zqti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4F9C116C6;
	Tue,  3 Feb 2026 00:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078944;
	bh=7dXYnceLs4yQblLFCx0ReDZ1mOmpPWouUEBO3yddK54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aVM6ZqtiIAT1qHR0Vt0+8fPGwCTknR0xNdz6TDy9iCGWbyLBoJ1AVNCBJgw13v8Qo
	 R1RmR2JpHaC+YMoO8X/gFcu+fJO5N4VKH/xv401X6CPvuE7GnfNZrXp9WYWOJCfAdE
	 itCDNHoV4wVAR60BzFjGP4U/LUcJMV9QuY2yBGQU1u3XMx/gNVA3XdB7RYQezui3tp
	 XzLipBQpXHS7sud+Z3Rc41vhbfkHVNEHWjFoHFUr2rNig2xuiT+q7QNCa/RB3Laj9B
	 xaTMlq+qPRhXwwGEuqU9Vnda7pPevRKLwfduKloSSK1Gz7nODN5fFJdTNSRMTnuEso
	 UT1mIee+hRkUw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
References: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org
Date: Mon, 02 Feb 2026 17:35:42 -0700
Message-ID: <177007894257.4027.5238022262476955140@lazor>
User-Agent: alot/0.11

Quoting Marek Vasut (2026-01-21 16:26:38)
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>=20
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields corrupts both
> the struct rs9_driver_data content and data around it, sometimes
> without crashing the kernel. However, the kernel does surely
> crash when the driver is unbound or during suspend.
>=20
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>=20
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91W=
OFnnYErLyg@mail.gmail.com
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next
