Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023316DC09
	for <linux-clk@vger.kernel.org>; Mon,  1 Jul 2024 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865079; cv=none; b=rcxrCmHCSYvDXOfAEs8zL5HU06rqA1BG2akn4gDaQxI3gOFQM0tFZhJG4i0bEB4UX/QQU1izpIhGwTyXQO/8MV8hpjASyeRS+boEq1+oeLkR8hBNpF9UO8Ot3lajOYeEA8UVLTc7b18Trv7mKMxbuNvOdOzu5Cy2CwuLixjT0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865079; c=relaxed/simple;
	bh=k37LkV27AerqxXOKVO2onHf2LK7R0wvTJ9sByqdD0ag=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=JuH7THm/hlScx7wMARhrOjQ/bYWb7IUxj8zv6++ag4LQfyd7l8S33jxH5ccdy5aoVNQ+8Yokw5Sn1unS3ge6vBDUj3mytUYs/1IrlsIL0XyY89qfH/nBPDLJdNNT2xeU2t/v5rf5kRxOzz6Vm3pG+QknlsR9KMAFcLXuNNXMIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C56USqln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C56USqln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D871C116B1;
	Mon,  1 Jul 2024 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719865078;
	bh=k37LkV27AerqxXOKVO2onHf2LK7R0wvTJ9sByqdD0ag=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C56USqlnrrv0eHrhetLyIW1Fue5mfmJ3435Wld+Egr6tRoVa9LyNvIAalYTXOCt5b
	 1HKa4pLDcOsmYuSv3QN9hqESUVmZ5hVMV/TTWM2JXXBatumPy7q5y+yDzEXpyN7/D9
	 AgPi+hStaThTdGNALjBdPuBEMwhslKSzDejNo0z4Ctqm229cMRqgFf+xh9se5290dt
	 +0/GQddxwT/vlMQkrbPf3GGvNTXLIgd6BmqZzT5TM5b8StwqhxRYi4XxxxsYM/xGdm
	 lI0USP9+LOzQCm7+hg3gjLhufCry5CwWFlxrasu6j6HeD7851mKhQs0H8QkwbNnK9K
	 e/QHWc1z4tibg==
Message-ID: <8e5b6bf0fe9748a675d967143a1bd1db.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j34oxxhyo.fsf@starbuckisacylon.baylibre.com>
References: <1j34oxxhyo.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 01 Jul 2024 13:17:56 -0700
User-Agent: alot/0.10

Quoting Jerome Brunet (2024-06-28 07:25:19)
>=20
> Hi Stephen,
>=20
> Here is the Amlogic clock update for v6.11
> The biggest part is the introduction of a new SoC support (C3), the rest
> is regular house keeping as described below.
>=20
> Please pull
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.11-1
>=20
> for you to fetch changes up to befe87380e21f0d37633273e1068c9318f8135ff:
>=20
>   clk: meson: add missing MODULE_DESCRIPTION() macros (2024-06-14 09:29:4=
1 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
