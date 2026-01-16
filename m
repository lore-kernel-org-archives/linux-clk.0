Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF2277C81;
	Fri, 16 Jan 2026 02:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531915; cv=none; b=dH/nIlRoMFFJ6zGTM6QjfED9WDfVYzGE30axowVdOY/2tKaG2UBQNgeoxY6KLHGaaboRuhuP8Dn+lpTjaZpmMFSonch+zUPCFtaMpzsxmULjz2wLACIX0Pujq/Ls0XybG4SKdcY2jiuHskTJxDvA+L89dDmtfHLOVaRWG7Dr80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531915; c=relaxed/simple;
	bh=S9nVq1cgsfIub+TS5NUZ9DJGkUv4yv+AcIqzr3XFuT8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=X4xNafKdx0LlK38GnUpDO4Rx52Rjk98P2jacGaEUWHA/7Jh8G6F2ZgoWMAZzR2PPM67jq4MxjEBw29m4XO0IEHC/Ulz11IFtkf563KkFA9lJcse1iPuY1KHE5gbBH4oEkc5KOt1xxoVwBK/vHNPdzCPxqc9RnwcdZc+d/EtioD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmGbSSyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmGbSSyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B39C116D0;
	Fri, 16 Jan 2026 02:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531915;
	bh=S9nVq1cgsfIub+TS5NUZ9DJGkUv4yv+AcIqzr3XFuT8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WmGbSSyBdHC46DhW9YjddEsurKZror88DtmUTTannsEh5QphuEW2H+oUajPSFx2ks
	 U2VI4dQGQW7StsA/Lkz76xVKouU5hVoACy6szDyRhdQk9kL8Vntnd7+Pg+Gd5t7Md2
	 lHVMzWL3+xY+DtVeFCdBMWIHYafWJLXn719zi7VHD15j15vnHl6Bg05isqFezbBIE+
	 EvnmGbGgMZB2bTTZVSzzkeCjffoE/JaJDNuZBVPU3IYU98R7onk4JbbipsBc1ocomN
	 hoHVcovf1cQh606UfosgZnNuUXo6IxL6HodXDxEaGBGSCcKqTzaURtbqjx4zH31EFb
	 ixhlLZU/cIivA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org>
References: <cover.1764581744.git.geert@linux-m68k.org> <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] clk: Move clk_{save,restore}_context() to COMMON_CLK section
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Keerthy <j-keerthy@ti.com>, Michael Turquette <mturquette@baylibre.com>, Russ Dill <Russ.Dill@ti.com>, Russell King <linux@armlinux.org.uk>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Date: Thu, 15 Jan 2026 19:51:53 -0700
Message-ID: <176853191353.4027.10879981541626027875@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-12-01 02:42:26)
> The clk_save_context() and clk_restore_context() helpers are only
> implemented by the Common Clock Framework.  They are not available when
> using legacy clock frameworks.  Dummy implementations are provided, but
> only if no clock support is available at all.
>=20
> Hence when CONFIG_HAVE_CLK=3Dy, but CONFIG_COMMON_CLK is not enabled:
>=20
>     m68k-linux-gnu-ld: drivers/net/phy/air_en8811h.o: in function `en8811=
h_resume':
>     air_en8811h.c:(.text+0x83e): undefined reference to `clk_restore_cont=
ext'
>     m68k-linux-gnu-ld: drivers/net/phy/air_en8811h.o: in function `en8811=
h_suspend':
>     air_en8811h.c:(.text+0x856): undefined reference to `clk_save_context'
>=20
> Fix this by moving forward declarations and dummy implementions from the
> HAVE_CLK to the COMMON_CLK section.
>=20
> Fixes: 8b95d1ce3300c411 ("clk: Add functions to save/restore clock contex=
t en-masse")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511301553.eaEz1nEW-lkp@i=
ntel.com/
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Applied to clk-next
