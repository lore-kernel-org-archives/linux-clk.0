Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D91CF2AC;
	Sat, 19 Oct 2024 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729316696; cv=none; b=HPkhIKQuROaO3wo5n/Mo4KYh286G7iT+apQa2IRDuQdOa7Vbon3iyo4KNn9NpJ5U2xSPfXFTlJ8CfGerYe9hoEffS/rNUYZ3CJB/j23PKE2fsandr1YMirGwNYFBu/z1KbFuwJIRYW8PcCZx7VjcWLTGz8tNWt8O07FUk/9Gx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729316696; c=relaxed/simple;
	bh=H30yMisKp1RiBtqU9YcdWjeFN7quqSeJt4EWLEGi6O4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QJzUf2eUQgpXAb0dydY45L4dSRvbVGUdLVedkTy+VMHBJS+Jyw3BOKP8s+zxa4amDysNnNJlfeUbei5jutmyEjZjsQZMuvXXHmRUPcFpkxPlZEXNJqdZHCVOkDIYpiw+bOneCZIPC7YbWlWcTb5sn9fe8PURj04ebD8sBQLCwQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSqPd4Dc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSqPd4Dc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552EEC4CEC7;
	Sat, 19 Oct 2024 05:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729316696;
	bh=H30yMisKp1RiBtqU9YcdWjeFN7quqSeJt4EWLEGi6O4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cSqPd4Dc3ktU1eZ7LeQH+0nlceu6f+GeiMNH23s1AGXuxt10IMbHmHgG3kCGujKSP
	 F8Rbz4mJeXO3euDMM/WnYaIUp7f6J6mKfMxspl8bkNLZ4t5E1OAkPPggNTL8VieK+U
	 Vot+RGWoG17eV2238eWXU1JtW7U1UUj0ypNmNZJ3jkmsRjbLyGKqRwfvfbb9j8ZY6R
	 Bc/zOatm3c0aluQtoKesXZhcFicM9nFyhAc5nP7B38XwNTwA+VtW//QkJ3iEVGVzpn
	 51XRn7shp0qT3odEEw+3G6i+nPam9iJSHWrFMatFhxKqxcIgtmhJvqUh3nySlGLFbJ
	 lmxPRHmj3+A8Q==
Message-ID: <1ca4985e2a29582d0f003037e6aeb7d3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1729252443.git.geert+renesas@glider.be>
References: <cover.1729252443.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 18 Oct 2024 22:44:54 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-10-18 05:05:26)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.13-tag1
>=20
> for you to fetch changes up to 92850bed9d4d334ee502a035ed5750285faccbea:
>=20
>   clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks (2024-=
10-14 10:04:31 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
