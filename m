Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BEB1F1302
	for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753216023; cv=none; b=lIEnwnJjQakSHTEPb58NpzboD+/9lXvFQqQJlBNvq9yagRJR8T9ROfn+/elAjekgXnL7tLpbrL10jiBMtJZnC8mvtH/382AOmkU5oJjzHrnF8rQJ8n+rx/p1XI+eJ+s7N1VZcih0yuDvf11xfl3hyhAWZRoVPn3NEKUPaBpI1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753216023; c=relaxed/simple;
	bh=a7sa8zXHV/2sjX1Wyzr272Uwn8z1/BOkYJU+ndGg3Rc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hJc+fgTAZhUP3hY9B3Pyh5qCw+9TB/LJl5Vbkp3XX8r/ZWeQKLz/5dt30NSMET67KRkFwoIGGa+5dv5fAmxUb3ixmu/EF1Hk95y8P+TZY0U0SMWmIBDlzPH+HHVpSz5lDDn7VJhrJO6vX7z3Swxsxnhh+/OYoN9fwMsXRHfpA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnw6PyyZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnw6PyyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255BBC4CEEB;
	Tue, 22 Jul 2025 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753216023;
	bh=a7sa8zXHV/2sjX1Wyzr272Uwn8z1/BOkYJU+ndGg3Rc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gnw6PyyZJFACcXtBNCskEHZASE6wGYnoZvdNcTOo7Sxk13rp8kJs5+IwuOsB7MpI6
	 q0NoAig1XCLGY3QiXuhlySslVswI4b8qimp6FFgXndTzT4omTzCMoVO33Re3sd+k60
	 MrmPFwEnCnQLHZVpRaBfiUJfPzyD6TvmjF8i1ocCKld4dm+hTB22xsXNlmryNul8TJ
	 aDUGMuChM9MpBpzarsY3JBT9j+iYJwli1E5eAvU3XHtl94ZUQEuor++4y5A6VRwGH1
	 kmBvurnjjdekAQyUzeSOBoQ+HQkcY/EEQMRGHKEt4EvLe11Hk9gSOb1IYolV4gZX/5
	 h49okRVzO8JhQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250721102716.569900-1-claudiu.beznea@tuxon.dev>
References: <20250721102716.569900-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Tue, 22 Jul 2025 13:27:02 -0700
Message-ID: <175321602228.3513.645071744640402861@lazor>
User-Agent: alot/0.11

Quoting Claudiu Beznea (2025-07-21 03:27:16)
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.17
>=20
> for you to fetch changes up to c7f7ddbd27d55fa552a7269b7bae539adc2a3d46:
>=20
>   clk: at91: sam9x7: update pll clk ranges (2025-07-18 09:31:33 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next
