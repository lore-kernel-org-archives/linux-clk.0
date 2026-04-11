Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BCB2EC090
	for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949577; cv=none; b=TCuZbrAx0INs5uVCA4ePAJwvO1jRAoCFNHEpI52umNtbe3N5lCX26gMwukJksGAIYyEUSaKZSlOIUh3TRof6O837MlZ9Rnrujv35HK34QGjkfJEVVp6crkivwgojzRSWTzJsIkCsvx0m1SUkMTPa5+4MZfGHYdiRAwrTXkgBAw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949577; c=relaxed/simple;
	bh=I2VWE7LKKKqbq4qyKBCkqBA+0WuNKfHQf0Hs/AgTI68=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TGfeQvPqyvFAZIv6ZxXoLPJGeWa9gQ0ctHAq1lHH7RKUBmpD2IMx22tbsncg4FvbPxqucyvZH8h5N6TulH0in+7gOvCKTplT4SlYn3Ytu0JGWgK13HmVHji27ohWWfxqg25XX4aE9lXJydDZJVEO7A355Ml9C9sx+m45RbOSQ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzcchfM2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzcchfM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E80C116C6;
	Sat, 11 Apr 2026 23:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949577;
	bh=I2VWE7LKKKqbq4qyKBCkqBA+0WuNKfHQf0Hs/AgTI68=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UzcchfM2B3L2e2IQoVs/UYY+A2TP+0iVRbmzWi9txjWyKXE7hvGuMF2pWlwA1Hxji
	 lzoAC/LGZikm7XURVi6euRoHYQDUkIMXmPPv0sX+hikCB6jQkfSnVfSZXoaHaS+2hm
	 gmht3vtXHct6PDd9Z7wfs9g2zY9V+XClW/F3mT7Z0jplPjS3WB0cz/6Z1t0aMxVAT5
	 3gy+SPYqdJO0cQLJYbItXLH17Cu0j7D0SBbx6g8FPOvxH/G5xNGqSp+akn+mfAVquM
	 ggHenDx3kIy78FmgwTYBIrNATHY5g0QHwKZxGAr1xz/BeJS5cBUVE/eHeFYa6KcMvj
	 Hfa89YpabUw0g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260403071549.2558857-1-claudiu.beznea@tuxon.dev>
References: <20260403071549.2558857-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock fixes for v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Sat, 11 Apr 2026 16:19:35 -0700
Message-ID: <177594957514.5403.6507660737165905070@lazor>
User-Agent: alot/0.12

Quoting Claudiu Beznea (2026-04-03 00:15:49)
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-fixes-7.0
>=20
> for you to fetch changes up to 2f7ae8ab6aa73daaf080d5332110357c29df9c36:
>=20
>   clk: microchip: mpfs-ccc: fix out of bounds access during output regist=
ration (2026-03-02 17:12:45 +0000)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
