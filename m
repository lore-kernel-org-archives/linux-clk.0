Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916343D9DC8
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 02:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673671; cv=none; b=c4bWCpId56O/NTAsLWbbezeK2ZNscf5yyq4yAfKtcShUP4Xe+kBCBc2wArITCazQZJTQTtB5+74C991kZ5K0dT/wOqX51AGu59F7z0Bp++Oh+RsXr3Mn1v5WqBn4VaZqOdRaIrnUFLXmNjTf4FHlEx02GDVlG7EbLrCWwxzW0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673671; c=relaxed/simple;
	bh=KuY5ui7Dr3xfSrbwCi/JkzEt9F6U3f3vYvPc0/q5Mtg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Zbqg9osOW+KWqS4lYiGA56MITTomjaxOHDnsFNjV63cSXfxRU2xTQae6WjHXq5avQ3flOLU5L/iCw8DFKr+JIHwJzoJlm3uGJHkNJrf4aEwmt1RGMaGmu4eja9f+TYufIK8jF95JwCZUD4WzGgzNKpmgxnGI2/iill1Qg4E163Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo19KONn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo19KONn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340B51F000E9;
	Fri, 14 Aug 2026 02:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786673663;
	bh=KdC2SaDU2UQMwYkijQwEGt215AJah0s45GAfxg6sOyA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=eo19KONnd2cktBxtijLuXVr0AO7+GGyYLeuP6Nq7OlE3Yti5PXXa3vcq+q/8ANj7+
	 2pj7nwdA6xrJ4I13nSwB24wcPoQJVPfiNu0EonuhU523RHsgdiomTG6GATLWoTyrLO
	 F1vViin4PqAnSiQ14YdX/iegL7+avIpfGmyMDFPordf8gnoB3DlwPMxn8H7bX0cy9t
	 IrRFslEUMrkN7blioKGhPeRAdzu1OXkgLurzHO1qoxg8qxGNtKr6DIdLWuLoSih9Ob
	 w+1iYLzb4o+F1J9o8x4/0BbXUClEzs7xbKB02uby+5GYkTjqvzEnkZtkSCFn60O6tZ
	 k/x3x8rMMB9Eg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260812062143.1285702-1-claudiu.beznea@tuxon.dev>
References: <20260812062143.1285702-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Thu, 13 Aug 2026 19:14:21 -0700
Message-ID: <178667366122.5897.15093662733527525247@lazor>
User-Agent: alot/0.12

Quoting Claudiu Beznea (2026-08-11 23:21:43)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-7.3
>=20
> for you to fetch changes up to da3abd0445245077a1ac45b97ee0a59f8d300d31:
>=20
>   clk: at91: Read "reg" with helper (2026-08-12 09:02:57 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
