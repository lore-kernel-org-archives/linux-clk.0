Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BD391829;
	Wed, 29 Apr 2026 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434424; cv=none; b=VfgsL/v/tEN5yjRoidKvqGCtt5ZacdOC/njS4M3OCh1TibxjDWAyhn7dmKwbrcYxydIHKB1z2RelgaHixcP8LK/36i5HGQjyAQ3IaAmyOfCKtvz/+hjZLWdt4JZykmhd84XcFf5ih8LNVkjW69u/9v6/YZeebY4Mf7EMHNXh6UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434424; c=relaxed/simple;
	bh=WRWWBVBpJfyHUbcXC5KjEtdEc+bw539Wu5/xgbbyIoA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=izHC7gpyYMvNICg9zyHNHw/YlpxVkgfsvDQptsWYwvfZEjJUhCKAh1K6qvKXk66O6XzO8HTSDcfaloq/yXRMF1KfQ5uuz2rc8iS6AzM0w5EoySTeNi3m+xzosSwi4HJ8osqVyK96yl5Skg5eteU6LZCQFO/7T3qc3OFtG9esl9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fi3MoCxr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fi3MoCxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2637C2BCC6;
	Wed, 29 Apr 2026 03:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434424;
	bh=WRWWBVBpJfyHUbcXC5KjEtdEc+bw539Wu5/xgbbyIoA=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=Fi3MoCxr8XQyo389WKmKUe9eDdIw6NSPMsEZa/pfS1cucSAdx6joi7OqxGDyvXxgK
	 iEGMzvMJqvwMIAUBOFGGq7r6mnfHmFZae4ZmvpWU4maL8CxbOxolmVe2FTdKXNkqs0
	 AIAU6VVZU6huhv94JYn7TiVEya2tzAtNjIHUaUJ4a/Ri2fDKYhjEExUfmjJtoa1jWd
	 HnMiZ13t8RsCNomw+o+DneoY+xD6YjZc4jplUJ7xpQJTQQpo6susmbo90+raEr23Qo
	 j60NF64OL/LuUH45T/DfP25TE9K3zWyeac77sPIoSa85lTU1zxA0o6oPgB8CjRy6l/
	 Nt6oLFtF8yGuA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org> <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Ikjoon Jang <ikjn@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 28 Apr 2026 19:06:14 -0700
Message-ID: <177742837413.5403.1187117954638508299@localhost.localdomain>
User-Agent: alot/0.12

Quoting Daniel Golle (2026-03-25 22:09:35)
> Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
> a clock gate nor an update register.
>=20
> Add a MUX_CLR_SET convenience macro that takes only the mux register
> offsets, bit shift, and width, hardcoding upd_ofs =3D 0 and
> upd_shift =3D -1 so callers cannot accidentally pass bogus sentinel
> values to wrongly-typed fields.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next
