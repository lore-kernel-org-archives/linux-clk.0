Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70A3939AF;
	Wed, 29 Apr 2026 03:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434434; cv=none; b=m3ZHzxstZhE1hroy6meD0B0FhNNrXV0ofi+sP2Ko4cEJ6pbNvEHFlaAxxzUsKM0F+aEIjdKaatmYONZHuDcOhNIEXIbexH3lfaSD8j/ch4k1E4hhhHcoobd6BYSARXeE26uORNvoRf3g/Q2/h278FXL6/25z4MquNIhpn5yqmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434434; c=relaxed/simple;
	bh=KWz0aAZB1SwnncfHZ9VoaJOseFg3hiw6XXrMGkHja3A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lhJkGdiQJ/cLrsQ8S9jnrNDPp0Z5ljvlSMJDfPKgx9DQ5mueZzHzJ/Wdv15QkLbOIsZZr//ycyL7pdAD9b/jxnb2a3LEsNg5sgBEOpPwo2MlrqO2TUQVnpqO6bsCCNGi+2E0+L91SDFxMP+54FC353PiBJIcSbCly5UB6HvTyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DID0rkay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DID0rkay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1D6C2BCC4;
	Wed, 29 Apr 2026 03:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434433;
	bh=KWz0aAZB1SwnncfHZ9VoaJOseFg3hiw6XXrMGkHja3A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DID0rkaypJyTfnjgkLJXl3v/8m0CCcXvJMGKxTtNVEzvZv+ZB8pZzD/byGRaTzBg1
	 GLdc0RoKWPzDBFgdf9+4W3GqvwIvXFxv49M4KzzOyoEe8+sanZ/VVcRb3H5Enk1VTc
	 oBjYAgjRWHfjEdQozbXZSRurTwqGXRdXbO8w6O7HS7JjTJ+EsICpGRllI6QX5rhyr7
	 WPz7xiB0vOZPDRZkoKbwIGw+2El3T+3t9uUXR20VX5HSk4NapIUeg3eFXvwIvf5D+y
	 VbeH5wvHkA2/VU2pyjojz3qGBYdpXVUMmVFSvIf0U1rR/cb/z7IrdypN+5DjchuhFS
	 1y8gkcvqVtYRA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260424-clk-axi-clk-versal-support-v1-1-ea070f83db7e@analog.com>
References: <20260424-clk-axi-clk-versal-support-v1-1-ea070f83db7e@analog.com>
Subject: Re: [PATCH RESEND] clk: clk-axi-clkgen: Add support versal timings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
To: Nuno =?utf-8?q?S=C3=A1?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com
Date: Tue, 28 Apr 2026 19:16:26 -0700
Message-ID: <177742898605.5403.497070367355773947@localhost.localdomain>
User-Agent: alot/0.12

Quoting Nuno S=C3=A1 via B4 Relay (2026-04-24 10:29:04)
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> Add proper VCO and PFD limits for versal based platforms. For that we
> need to add new Technology and Speed grade defines.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---

Applied to clk-next
