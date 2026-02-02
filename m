Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255E2F25F4;
	Mon,  2 Feb 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059610; cv=none; b=UftPdgyWGHdp23ZacnMD5Mn0V3VTDRlBI+f9zpwWZR3XI+E9sHIbbal+gnDfRVFVN2b6JoxGH/1jOPR89PkMORDIoDXQN9A7zSPJ4OwepeKUHcLxjfUa1Mq0bVq1HyOxXu1i4zSTU18xc6nGjlPg6YTiSKS/LkiJbqcckM9tXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059610; c=relaxed/simple;
	bh=2VU7aHOI3OjGlEUiCW6SkZgmY2ThX7FZLCasJM3grOg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XYKr7wAy+aTV8C90mn2RIXCb157/+10PBpFWBGWfdxoQpgfe/fIMPEMojL7uUcfl/MwqDYoPLULIGyCg2paeZ3Guut3Amp2WUDa7UDIVqc028J3arL5l7ahVIhiajT0ZzI5oWApmJe3DdL7L9uXBstmQ6SGGM8lz7Aa/oSG8cpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmtaV1iI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmtaV1iI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DE2C116C6;
	Mon,  2 Feb 2026 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770059610;
	bh=2VU7aHOI3OjGlEUiCW6SkZgmY2ThX7FZLCasJM3grOg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RmtaV1iIJwUw4HXt6wcW5uajoZYRuhY+4MZnW1vFkHsVQV1XjwtmvIQd1vCQA9i4d
	 gWxQmC1mMBKkhUlXJp2/t7Pi7UYbzExahLIS2t09vlTH7UP79OblMvVK2htKSEyzKD
	 rWQr6oiJb9OWsEVqCjH1Y04VRwJIhhIjzmZm/+nBESDlDUDH/hI/JbiRGcqZ5dx3QI
	 LyZid7GZJGhntlNoN0nks09wAtdtZ0o8KyFJLkl4maZGfolkE431wICjhII0HNqywr
	 /UsVvobg99bAm/zqam2JYxHyrTd90Xd16O4qkCnwbGIQOE2iM66QKrcDD+xQRk2jt5
	 P1DlWyzeX2MCQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
Subject: Re: [GIT PULL] ASPEED clk updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, mturquette@baylibre.com <mturquette@baylibre.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
To:
Date: Mon, 02 Feb 2026 12:13:27 -0700
Message-ID: <177005960797.4027.14390177024032129085@lazor>
User-Agent: alot/0.11

Quoting Billy Tsai (2026-01-28 19:36:24)
> Hi Stephen,
>=20
> Please pull the following ASPEED clock driver updates for v6.20.
>=20
> The series includes:
> - Reorganization of ASPEED clock drivers under drivers/clk/aspeed/
> - MAINTAINERS updates for ASPEED clock drivers
> - New ASPEED clock driver support
>=20
> The branch is based on v6.19-rc1 as requested.
>=20
> Thanks,
>=20
> Billy
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
