Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267039060C
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391301; cv=none; b=r/TI3WiN8NhqXFBEG7bS5utwJOHg6bsGGGdK2cVYxib3rUqFos8U8nFvQSN9MaGKJZ5DOrnnzMlVHsATQVEHsiMa2XURabNoAMITKAFA6yRzQiUfzgB661anJs+iXNH4hVWiFDNJDVQ7WZr/av6MIfXx8FI6ZjW3Ju4JY/VP5lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391301; c=relaxed/simple;
	bh=UqaAUnQLXGw5rrqrytPq2X7aEpCG7C97FRNXfRtz3Fk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CWoq8x85LZ1cCg+M8BX/PEVM1SMH0MN4ZEI3sLdK1wyC1Xy/dOybB54UbBV6TSgP6I5UhdXIGBdQCpNrWbRGyYyEme7pDTTFH2Mk4nLy69xDywzbCiFQnIDCnLJwUQ99QcYmbvPIogxsDR5eV59TA6J2JGRAowead30k5UMSUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuoEU+pF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuoEU+pF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D46F1F000E9;
	Sat, 13 Jun 2026 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391300;
	bh=zM54oc2YQKLJooiixhUvIE9F7hA5LAA6bb7CaMov7/s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=JuoEU+pFBTG3I5jQxbPP0PcF6jPibfwTDoBVk0Ea8M+wgQBJvUgm7GvYd/3bT/ROk
	 LTE/UZ6b+RbvfFPHUufH0wP+cQZFy8+RhPrXf98Lc1Oy1Y3CjjvjFAk2BVKlFe0Dbm
	 e8BYPbLxpIW0D84uATTPu4wDFQ9HhGggzAERhzDGMQxx8j38OZPaLA1MrEt8mYvgiv
	 zt4d+cvYnjwtZqwva0tsjjWe6IQJku/XIXS11o/OOCpds/GpBL26dQyZb14saL9x+9
	 Y6rd9Vhtu6SfHe5qlcautl+0q9HzVgYrX4zCAnlrlOY0ukDCx9wi9jSHDjX+V2ow0K
	 TIuSBPBnhNg2Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j1peu5nny.fsf@starbuckisacylon.baylibre.com>
References: <1j1peu5nny.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: Amlogic clock changes for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Sat, 13 Jun 2026 14:21:26 -0700
Message-ID: <178138568669.819343.12989878200172062964@localhost.localdomain>
User-Agent: alot/0.12

Quoting Jerome Brunet (2026-05-29 06:51:45)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock changes for v7.2.
> There is just a couple of minor DT bindings fixups. Nothing major.
>=20
> Please Pull.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.2-1
>=20
> for you to fetch changes up to ca89c88bcf69daca829044c638a8163d5ce47af0:
>=20
>   dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock (2026-0=
4-28 10:42:47 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
