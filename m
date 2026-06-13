Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9D3A9624
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391313; cv=none; b=OfU1UWt/ZDD0blZmNauUSMd6/sa++yIKfLxjyLKLtpq0x7Z/V5ZyAs0pcmYxzv+ZVMNOX58UT6bFmssMFfGXD7rGNkfx63SNqE3zK8d8g/7CUdrxwQ9+KhHCsIDK7yHZbdGQzE4wxnieI/6dVi2JMFuMVNyBEWf8oTKLl58ieao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391313; c=relaxed/simple;
	bh=TCp8FKKYBBafoFvdzYUXnNhoEW6/x2D+CWMsd1SoZTA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iLyGwdmtw3+WOnBJtegrf6/rGCFzgjbYvLDNKiR9CB1JTVixfT3kh+t2Hq8lWFSohtgPWVjP5QrkaRBsQ9bYv738cykeN34gN99RAz37MWJBB9SxHeN0dy5j+93578fEN+ydtcmdjEKJ7DGiV92wMRM7AEFFPCDcICe8ggAt2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huwkjijA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huwkjijA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A4B1F000E9;
	Sat, 13 Jun 2026 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391311;
	bh=FpfBaoUiB6e1lbWzdI0F/WNvTJYy+2TU5mLL5q9BoYA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=huwkjijAcEeAJXukn4B3Rb3ZltH9/Jis4EmJ8ohXBDSXPjVt2Bp8T3MRK5H4+/UWA
	 soJ0IbT896omepTZwdMM7uhcAz6C02hN6GlISpYp9gxDoHMo/np68hiO7MYftlo1E5
	 P2/OVuTnOcwLoYaErvBh8RRh9qIG/Di/dFoKe1AWR7CdQxXmnnp5lDB+EBLltbqxj6
	 UqrSB6APCzHU+D3JBiLW9Ty4ETu4o2Dscap0SqO/JUw0aiDQhqKNibg4BP4N8v5to/
	 uzQZkHDcpaMwTecFfK9RRACyvqwkwTK0Za+cVKvCWGo4j4kw86iJ1+pnItYWxaIGFY
	 py9lkeN68BenA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260601114214.2652969-1-claudiu.beznea@tuxon.dev>
References: <20260601114214.2652969-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock fixes for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Sat, 13 Jun 2026 14:58:26 -0700
Message-ID: <178138790641.819343.1341253816236765526@localhost.localdomain>
User-Agent: alot/0.12

Quoting Claudiu Beznea (2026-06-01 04:42:14)
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-fixes-7.1
>=20
> for you to fetch changes up to 22fa1c39ba6fe726b547c877c924379b7fee260a:
>=20
>   clk: at91: keep securam node alive while mapping it (2026-05-31 17:17:5=
5 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
