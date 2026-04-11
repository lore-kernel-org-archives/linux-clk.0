Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545B1D416C;
	Sat, 11 Apr 2026 23:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949226; cv=none; b=TvjyM3CyXWxkdqY3KjWeT/QWl3swPJVbZvGb6Faf2V6dDZN7h4DMwBYZVXrRJX9749yppgVeLejjd4XVJDkUMZaoO+BBV2PBS2r4BBFol5gvxOEHsS+H/pP9dujZhTArqb9ElstE7iO+8mQFprgBQKGafOEh0wc6lBxIFI4UuY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949226; c=relaxed/simple;
	bh=WGxFQhgUixU2RNYbbTwPuezZUPy2VulUox1dwrDTWdk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CHX2ADGaQ/cUiopTAq6dMiMuDiIShfggs56fPdnlpOki5Sn3KA2R9hD+d/NU++u+RqVApIqw6tz/7ZYUkBqaFYvr9WP69fEgcwPn0f33Igji5cfYDCHo9Mbky0rL878AuWIYbax9ioKUG5EEmRKHtyll1yT7LylUEBH1o2Swa9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um02jK1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um02jK1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3058C116C6;
	Sat, 11 Apr 2026 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949225;
	bh=WGxFQhgUixU2RNYbbTwPuezZUPy2VulUox1dwrDTWdk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Um02jK1ooKDU2eNeMKc6xxWWiF1vNJsEwKQ4iiNB+PaKIeAkiWZcTDHi0c0rOPr2z
	 brgq4jmtzTW/4owNdJodXqKMXqm2uWm8P8vFjhtjZ85afdyvEFl42p7c66YhdkGuVP
	 cafDCk4umGk2sXdIz050iynmD0W2GP0a+bTVYFsiJsPLyfIsBBsgGRHiOtP/v5hsWa
	 uEDlQtyTEMzjkW0piou2SP+LDgVqpX8XsSuJDevC53CbWQOesSZmQ8IFqyQl7m5m43
	 HqkAFV02YWacayied9+bhpcje1XvPMqMZswy/ac8b0JJ9XaWyo5zHLidBUzB2I6G1K
	 xR+lQeVcozmMA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1774606649.git.geert+renesas@glider.be>
References: <cover.1774606649.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.1 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Sat, 11 Apr 2026 16:13:43 -0700
Message-ID: <177594922372.5403.3052959716124214494@lazor>
User-Agent: alot/0.12

Quoting Geert Uytterhoeven (2026-03-28 05:11:25)
>         Hi Mike, Stephen,
>=20
> The following changes since commit c8d5972a25408b1daf73653ccd5207fdfc80c9=
64:
>=20
>   clk: renesas: r9a09g056: Add clock and reset entries for RTC (2026-03-0=
6 13:33:56 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v7.1-tag2
>=20
> for you to fetch changes up to 77894661c00ab99053c9606f0f7ec673065f86ac:
>=20
>   clk: renesas: Add support for RZ/G3L SoC (2026-03-26 19:45:48 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
