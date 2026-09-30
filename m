Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CD476681;
	Wed, 30 Sep 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771069; cv=none; b=Ze1HtWrLcxwqRDnXv7Q9OR03jQJYOfWDGiiEoI3siOHY2dG6PcF/tQznkSTvIRYsQpTMUD+bmKIIdQTft3pyBpzU8YisBPvqVZ98kcDQeZ/gCl3lAlQ3qJdXjqmdUqV7CVpB+qnJONtny7OG0IWD+x1C7xvz8+w5BH86f3fbYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771069; c=relaxed/simple;
	bh=piNSrEoSPCszpzGrKKrAuQ/SVlY/vW75fVaBvN+BabA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nMXLB6SLfSRC2yB6T3JwGQXkPnhKi/xigMxkrMz3hdSMP6h16QoHrUZqwu9h8ur9DCLJs3WBE1vKK/jitC1lIiTsjLvocGclPCxuU1Nv78flN7ZtvNeD127OLng+NgB6KIxyITC1a9BOArt397G1c5+nVp3lPM116wYkgbbVsa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cCcyPSNM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cCcyPSNM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=piNSrEoSPCszpzGrKKrAuQ/SVlY/vW75fVaBvN+BabA=; b=cCcyPSNMLvL3kUvI2KXhnu6oW8
	0AwrWXVtxzslHde7At6k0FyZeXiSCcGzRvF+4CZ4kWkgMQR2SqCUngAxz2FjKEQs1aCqv7ztWsKnv
	jMWWZPJXfzXr7V+lNuNaEgUq3gP0m0oiVlGP3A4vLpNwACPYKhPzenaz+Ayu4v7VY0eqb2tu3Ca+6
	gd8gMik0ImrIqa1KCHe5kF4QR6Jo5r46qijBU7YRGijnuAqcPTEdB4L0BuFpLgHc0Q9Hqiw63I6kY
	Q9kOiy1rz6RZDNmtMkIaeeUhEPAgBKr3xe7V+6TOv4kcaMrp7VEHAm8ggdjcmM1wD1VgLNMOy5xHW
	rBSdEPTA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] clk: clk-gpio: do not blame the DT property on probe deferral
Date: Wed, 30 Sep 2026 14:24:18 +0200
Message-ID: <4966058.VLH7GnMWUR@diego>
In-Reply-To: <20260930114907.153690-1-francesco@dolcini.it>
References: <20260930114907.153690-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 30. September 2026, 13:49:06 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Francesco Dolcini:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> The message is also stored as the probe deferral reason, where it wrongly
> claims the 'enable'/'select' property is missing while it is the GPIO
> provider that has not probed (yet?).
>=20
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


