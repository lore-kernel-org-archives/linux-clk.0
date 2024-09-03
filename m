Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377CF1CDFA6
	for <linux-clk@vger.kernel.org>; Tue,  3 Sep 2024 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396957; cv=none; b=d87b833iFxvIg1Gb48D4cefTRufecsw8UYnGOkpOQMIEfJ9cY256tfFlMUt/seAQhxfDBVbDZbxzkyMWJEy7pd0IGgG5LaZBXtyzQyGgdXvUUQP4FMtn6inGjFwZKMn0ARTmf5rJbgxo2bRympGItsMx3TsMZcIci94XiYKLzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396957; c=relaxed/simple;
	bh=5O6WjL7y8465sIo1sxI2yt5BkZgotkNM9CTeeOGUjhk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Pu7kPwd84xT5s0kwzDLQ7DTaTupYs1yfeUSowJEd1VYICqI1d4J7jsOK7jtV5nn63TAakED+UvVtdJbGVRbjD2Msgr3JJhlSTLsq+XK5HA1rGtOVfYprLoHIEH/HMEY4MWfsgo8HilSPw14QLKd2xlxHhc7iztCbBycTeCN9Uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAXn765Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAXn765Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973BBC4CEC4;
	Tue,  3 Sep 2024 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396956;
	bh=5O6WjL7y8465sIo1sxI2yt5BkZgotkNM9CTeeOGUjhk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SAXn765ZZyzoaTPaMNy2TnnTaDQj5egrkns5sQYwSYt4gio0IksxB0wEWWLZmtLaQ
	 IpOUBLa72qNiZA/p6p8gjAuxBY7yecNM3aqLdK3ScR5rgfpFCIP8zWb6n9yE2aWUf5
	 Lk8YzfQh0LMyDZPcV53Pg8i4AIZhk72Uj8BINVrAkxUi9Ufg+sEZWomLWtmOkvtb3R
	 gZbhkzaSEcdsIx4oA/Cz+Lg0G2AaWLhXwyKADm7xPfeZt6FzaFleg3yprmSmU+vLAb
	 tCLZ5FKI6pPlj/YBLyoNbrFNkjg1HaFTqADtYwdXkDZD8Tle5BUG3XNT3qtc13LpY6
	 ZRlTLg/pkHtZg==
Message-ID: <50577525a098bd1e39b8eed1c8053872.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240901133425.2039071-1-claudiu.beznea@tuxon.dev>
References: <20240901133425.2039071-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org
Date: Tue, 03 Sep 2024 13:55:54 -0700
User-Agent: alot/0.10

Quoting Claudiu Beznea (2024-09-01 06:34:25)
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>=20
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.12
>=20
> for you to fetch changes up to 2d6e9ee7cb3e79b1713783c633b13af9aeffc90c:
>=20
>   clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs =
(2024-08-24 17:44:11 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

Please get rid of the clk.h include in sam9x7.c though. Looks like you
can use struct clk_parent_data and use fw_name for that. Also, could it
be a simple platform driver instead? That would be ideal.
