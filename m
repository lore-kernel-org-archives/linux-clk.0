Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040D2D8773;
	Wed, 25 Mar 2026 02:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406955; cv=none; b=QYMNQ4puawxPqbZDqZzu3YLcbTEVTmXfRfJ4WATL9JPAgzBKRF1DovdLzoMx0um285M859rpoypResCSizmlMKdsKfDu5u3Ek/cdfLs5HXfihdgZm5jYjp3T/qUPvvj8SD/e/1XaHAK4uB3EtuWoWfog9U+UBdphP9ZF05IN1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406955; c=relaxed/simple;
	bh=+VMZxzxWPHPxlfkvFwfDZjxP5xM9wlOhgsLyDw/m218=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Hh6artqvBQhCC8Q5IxRIc/omHwF4wRxKQp9hIRazXxVwLV3AHA4dnU0T3rPiwWhifefSo5WFR1V7Rer+st26Mj3zGVVssAK0mC4xWIt8CwlCmQZxKTqWewUf2+o7cSqewuQ5HDfONC7z5QQbjwUUdQmOE/3cTEXp4GNFdZsr1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqwx6y5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqwx6y5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B23C2BCB2;
	Wed, 25 Mar 2026 02:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406954;
	bh=+VMZxzxWPHPxlfkvFwfDZjxP5xM9wlOhgsLyDw/m218=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qqwx6y5xRCM/4u7dT4wZmDDjIZ9vfa8RYBvmydvdh9bouB7ebnGWCV1YJUEQYue7o
	 c7/SFSHHIMMclU0c2PfTBetCQ93BCMuRtjYSkuPXNP20aimpG+LKt3lnsOCgUo2r1a
	 MJSHV+Y0wIpOY1De2ElVh19vQJTcOdnJKdJDz0RhWW5l1H1+y32ApY809cOjlmllPT
	 zBOEyothF/hN1c7+cJpqitcI+Wfo25xdjWWrQeU6j41JGPb0/AVQloQgDlbouMiQol
	 K2abxGGBdpcEswtlyCN20hCBuH3c5pnxxBI14TTXJ5khftY9lHavjXnVKLWB3h4q95
	 bhQeQ8yW8jA6g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260303080637.2100-1-dongxuyang@eswincomputing.com>
References: <20260303080513.2042-1-dongxuyang@eswincomputing.com> <20260303080637.2100-1-dongxuyang@eswincomputing.com>
Subject: Re: [PATCH v15 1/4] dt-bindings: clock: eswin: Documentation for eic7700 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, ganboing@gmail.com, marcel@ziswiler.com, Xuyang Dong <dongxuyang@eswincomputing.com>, Conor Dooley <conor.dooley@microchip.com>
To: bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dongxuyang@eswincomputing.com, krzk+dt@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org, troy.mitchell@linux.dev
Date: Tue, 24 Mar 2026 19:13:00 -0700
Message-ID: <177440478056.5403.2390774146288465901@localhost.localdomain>
User-Agent: alot/0.12

Quoting dongxuyang@eswincomputing.com (2026-03-03 00:06:37)
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add device tree binding documentation for the ESWIN eic7700
> clock controller module.
>=20
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Troy Mitchell <troy.mitchell@linux.dev>
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---

Applied to clk-next
