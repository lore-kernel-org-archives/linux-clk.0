Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B237FA
	for <linux-clk@vger.kernel.org>; Sat,  9 Mar 2024 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709945140; cv=none; b=KZgzXT6+e3AlEXYSN/cgNowcyEyrLzFH3dyWbc8WuSkKu/baRv73nE9mr4WQAk87rFYlXfHgHv53DjWyg85oxZzQvsVWf7Fdvs8SXQQSBkyRv+e370HEZ+ab20sh0bbSTj/DfDG4ve1oZVC5eO1hxfL9tt3nXFXLeg/XxKGn3Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709945140; c=relaxed/simple;
	bh=EVBQwYbe9GLYy5Cn4gnQphVU+uSagdhy0YO/w44SSKk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=gGFJDiqvDhHXshZOXnwrStlvbtK11zpSxHvMXXaez7b5lUrFNF78T4F4Ss9Vd4PyV08viWdcALqpunklg8DyElkLXwbo6dQaL4scgdstFsPzzawCalI0PnugpKnL9d6SusGBrbUk2rJMbpYF6EoPTepEFBaZteDn/AkMlWzhktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZcDaUys; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZcDaUys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93326C433F1;
	Sat,  9 Mar 2024 00:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709945139;
	bh=EVBQwYbe9GLYy5Cn4gnQphVU+uSagdhy0YO/w44SSKk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UZcDaUysQjumZwTwVulYqvP/POFuIBFwz6QCaJXYCUBbcICT7PpI1RRV7hnfac6/e
	 Xp0/kG1Aan1Po9hOO7YuFL8BN217lKaB6vuwJfJNRftp05aaWfUlWyz/UtY6ijbrYU
	 vE9VwVzbx086HTeGdCv9S7NvVJSRPXMPWUpYRO3LEQQqBys1gRaXWCZaESiEjHKRYs
	 flUWggLHlr5c/ln+lFcdgWfbml2vYCILY+X6Vme3tkohsHjR6RpCdUJHfFoQiCYcqL
	 ufFA+gQWAMkfUUAxMX2CskesaF9QXuN7waC/0XwfQlorpWRWZZUX4L//85nLshdYYY
	 H5s08Kf9DkHQQ==
Message-ID: <924cd406d5edd263fb1b0bb6bf62a955.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240308100013.697607-1-claudiu.beznea@tuxon.dev>
References: <20240308100013.697607-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com, claudiu.beznea@tuxon.dev
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org
Date: Fri, 08 Mar 2024 16:45:36 -0800
User-Agent: alot/0.10

Quoting Claudiu Beznea (2024-03-08 02:00:13)
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.9
>=20
> for you to fetch changes up to 72151193839e4fe222d0be9931f6ba3a94de7aa5:
>=20
>   clk: microchip: mpfs: convert MSSPLL outputs to clk_divider (2024-02-06=
 14:07:18 +0000)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
