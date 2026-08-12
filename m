Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422A2D6E44;
	Wed, 12 Aug 2026 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786511103; cv=none; b=UXKo6/y4ho1XYDPEyY1ZG6/kjtUsTC1FqI5uQ0chHKWD4BujsQDgZ2pg8436mWYJYYgpuVsYvgnBmEYtjjWvmUxpGiXRSTwkie2FN+3VTxNujCzgU+66HWlkuVzYBkaLDSaHegPBxxMfcHT16aMCeld18E9D/pmO9iJGTz/mmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786511103; c=relaxed/simple;
	bh=g8UsJ6js6XQ8w82LoFRPM82v07mMs+HpK2kRcqWCgdA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IDD4JoBlDts6Zad655Mz6v5N8vxIYFmakfY4FA2zimNVb79bZuhMBKsbAOuwwHnjhE3tkGS16ISfjw0Olfk+sTcEBvKoLSeKmeKQ3khfO931NeBLsJBs5bTdKNihInMgcIVQBrVnIKrkHwht4WzF3sttJpfkeG/fMNiHaRPtiSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRv0de3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRv0de3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188811F000E9;
	Wed, 12 Aug 2026 05:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786511101;
	bh=lGRa0j36nHTZvzLPz8m3jS1r9OBEvZJ4DiCu0wGwMYw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=LRv0de3fqWTNrooxEvE+dn4DNE0C6iZwt46JCtWtQhm6iA2gornZKM6NnhGRs7ySj
	 rvk6OtBPSKPFXO/ELJzmgpXDbE+fsvs0DzV5xRXuecJH+Mfw59YebAFTqoLlEmtuHw
	 HYY3Whq9U/EE/f+b9UtcSoGPxcS607C8EvHLkTLKYpo7/xQpyrFYtjLaDWPKDQ01qT
	 zLxeuymbISYhPF1p5yEkass7mv0ahGAtSGlzT43NGH8bDLu1TK8wX7+T6mGR+JAq20
	 05J4CMi5rxLj4McnLpLv5IozHq31Mkd8zEehvIbAIxe0BrhC2bUSYfPOnW2orVqQI4
	 8s0aMnRDEio4g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <RcAweJqGSl27gSWWG_TpDg@bootlin.com>
References: <RcAweJqGSl27gSWWG_TpDg@bootlin.com>
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Aug 2026 22:03:10 -0700
Message-ID: <178651099021.5862.1840015036350433599@localhost.localdomain>
User-Agent: alot/0.12

Quoting Beno=C3=AEt Monin (2026-07-24 00:54:57)
> Hi Stephen,
>=20
> Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ7H
> SoC. This pull request is a clean rebase of the version that was posted
> during the last release cycle[1] and it was also posted as a patch series=
[2].
>=20
> Alongside the changes to the clk-eyeq driver, this pull request also
> provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to the
> reset-eyeq driver acked by Philipp Zabel and a small rework of the
> fixed-factor clocks reviewed by Brian Masney.
>=20
> [1]: https://lore.kernel.org/linux-clk/h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com
> [2]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@bootli=
n.com
>=20
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/benoitmonin/linux tags/clk-eyeq7h-7.3
>=20
> for you to fetch changes up to 44af1b974949c8f2f7cca469c0c7eee481750309:
>=20
>   clk: eyeq: Add EyeQ7H compatibles (2026-07-17 10:09:56 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
