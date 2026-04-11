Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333B01FE451;
	Sat, 11 Apr 2026 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775948436; cv=none; b=qfuafDDIKWvImqHxC7qBwazfFfm2W2wBGN7NNCToDvrEkQmtoikFCgYWPSh4+/940QQ5DgTeSaFxwf1+8xxB+UeFPHPJiNioNvYVfEmfDWl53lLNLXTSpp2GwYLVVqVvsDOhNtRqb/7d7XG4Awk8Uy6uHs/OQx7DEhbCxXGCqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775948436; c=relaxed/simple;
	bh=tq1KXTnWpJmdQtwkrrNB8D2YP4p81pR/wPRdcNwSHdg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=K3l3bd+9Y67rhIW3DWGGW+00fzc13ZWBGeOz2U4awaULZPTz/w2//0hx4pcf3z9C+bVJ2ytUdG6MWE+lOoQh4kkt3TXocg2hNk7Rnd9P67muePoHwBaRZ/ujsOWOa6K3Vo06ZIQt0RVL8vuNOzy8G0rrF5+uyPuYDH/yTNuA70g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVqpOi5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVqpOi5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65BBC116C6;
	Sat, 11 Apr 2026 23:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775948435;
	bh=tq1KXTnWpJmdQtwkrrNB8D2YP4p81pR/wPRdcNwSHdg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KVqpOi5EMQnk4kfyzl33OuwBaecnrQsKo/M0lAHyy04LNJMKkid8eStdalwpvmtNq
	 Ig4q5t3Y3Nne4/YQNytUCjEZ6frU8IqD5RY5AXhWCLQIXdvS65VUFmyvgVZOJsFRKe
	 DCQN7uGYFpi546VfWlqTpmk3L+XPpZ0uXCr3bjGX2e5MsfgXWOZo38Ny+y/MdTxOYh
	 fS5gGrKA1fwhC8Y8KSLND2bYbb+XzMkazC9CNbFYFOILVspWPLLP+pDdLKrNz8H45n
	 hhQ5ksfNW82+/9+7UxY6TlOgovFZAKpi+GSB316BhSFS1Q4msdxDpYjRZW470aoIJi
	 g00KsE9kGzreQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <abghFg5INVslFFcc@x1>
References: <abghFg5INVslFFcc@x1>
Subject: Re: [GIT PULL] clk: tenstorrent: Add Atlantis PRCM for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Drew Fustini <fustini@kernel.org>
Date: Sat, 11 Apr 2026 16:00:33 -0700
Message-ID: <177594843379.5403.17573222940623235549@lazor>
User-Agent: alot/0.12

Quoting Drew Fustini (2026-03-16 08:26:14)
> Hi Stephen,
>=20
> This pull request introduces support for the Tenstorrent Atlantis RISC-V
> SoC in the form of a clk driver, reset driver and the associated DT
> binding. The reset driver was reviewed by Philipp, who agreed that it
> could go via the clk tree. Brian reviewed the clk driver but there is no
> review/ack from you. Please let me know if you'd like to see any changes
> and we will post a new revision.
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tag=
s/tenstorrent-clk-for-v7.1
>=20
> for you to fetch changes up to 23c8ebc952849b3ba47d04d0ec95daf5cc136061:
>=20
>   clk: tenstorrent: Add Atlantis clock controller driver (2026-03-09 20:1=
0:26 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
