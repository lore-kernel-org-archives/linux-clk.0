Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A42BEC5E;
	Fri, 23 Jan 2026 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132003; cv=none; b=DZDt1GLivpD8Hce5nztd9AX4qzHaSBNuXWSQLRM5CcYNl/RQ1zkU79r2W5dRIYDKMXHo3qGdDneghVIV6c+lMeuQoxW/n5M1czRQgkPXKduxvuysg2l9/opZq7qSKBqE2UMm/TrCxQKqDm49bVyA4WWL5nKvTX9nl8jVKqKTMqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132003; c=relaxed/simple;
	bh=qSSPryv6W9bOlha6k5nKfgyHQyZos4KXehGO1XfOwYc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GgC4PyHlDuU/R4kiizeKbfKqmoMVMjQ8qbK+vU8jiLjdQIzp6k1B83BLCk1lwkQwFn70Yph2GYRzDx94lF1+SQjkwRYuBdcZpg9g87rShoNfc2JxQtU+eja+n8J3LMpY6FzHXeQqOK6yCeC3ol+hSYjInOfSm54LrBjt5pqfLPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCdLJv0N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCdLJv0N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE91C116C6;
	Fri, 23 Jan 2026 01:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132003;
	bh=qSSPryv6W9bOlha6k5nKfgyHQyZos4KXehGO1XfOwYc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kCdLJv0NVjCCaZSNDangU9kexw+zOXkD4hpGEHWwYLQMZmHxSoLELbdeF8ydIFcb8
	 43UsYWb+OQUq6fYlTJQIP3TGo6wRJsTf9bKCExkGSP5N1wP659juniPx8zcA4upzJl
	 REjJe4bn7TOmem8Cg23FqaeqMyImeb8eAjOOoKpCyDyFSrWjkY64KdhKddWcpfphec
	 gGHffdrkYkdvkzOKSmZ4wKyBKM6GeQ4R1iDhLFFNRT3J/TgWL07ysGW167jVy9BASK
	 poW9Z/YonjDfD2DFNVHZgLbwLiHAH3a7CfRqPvIi3xceC6LFVFBlaiY1JkEUz9YNx0
	 2kme3aEV3gXpQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aW1TSYOA0KgYN4rw@x1>
References: <aW1TSYOA0KgYN4rw@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yao Zi <me@ziyao.cc>
To: Drew Fustini <fustini@kernel.org>
Date: Wed, 21 Jan 2026 12:35:51 -0700
Message-ID: <176902415127.4027.15296678851046084048@localhost.localdomain>
User-Agent: alot/0.11

Quoting Drew Fustini (2026-01-18 14:40:25)
> Hi Stephen, sorry for not sending this sooner. There are not many
> changes for this cycle.
>=20
> Thanks,
> Drew
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/=
thead-clk-for-v6.20
>=20
> for you to fetch changes up to baf4fc7c03bd0f68c768cfe27829674bd060c6b4:
>=20
>   clk: thead: th1520-ap: Support CPU frequency scaling (2026-01-14 17:26:=
47 -0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
