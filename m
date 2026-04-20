Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263453368B2;
	Mon, 20 Apr 2026 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776710283; cv=none; b=fhJztcBV1dTZgLp+MG40Oa2FcQvXbymALvXNVPQOBhc+CSEKI3b6/IrfKH7vMAFQbKwHhdX+zbjskuOeOKT5835fUgZQrMQ7ZwNA2BD9I4fklbCMVUc+O0JglXkPvRax0u1TKN6h3mANXSUszpgcIP1/gHzWPYZqX4t10F55Xfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776710283; c=relaxed/simple;
	bh=hJ0lycRYGV4y8XaDz0FBYcKAJV3l46BXgtsUAQIkGuU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GluV5ByITfhEAuB+L67wGEXm5mJ2zgECQuehLeTbjcy59J0lx7lecy3wjm1HuXJ0v0vziQdoz7/gZ/hMfiUhwHWHyZ8dIZKCbK2o4ksAKLzI+Y86Hq1d49lum/YzdRqmtkrESnbvUOEpsDBCYkWTHUs0cHhDP1Ddb2YhM7Yi5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4muTQUH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4muTQUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A476AC19425;
	Mon, 20 Apr 2026 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776710282;
	bh=hJ0lycRYGV4y8XaDz0FBYcKAJV3l46BXgtsUAQIkGuU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V4muTQUHbcsd7/nox7EQrxep4fA9+nM8nJx9awVFnoFuns8my/ol9FPydoR90PS0N
	 QCtUQh74HiG7dO+XdzoLfw2RPfeV2FiCRrsM9BGuF8BqcUQDcDP3+kW6BYBb9vRyS2
	 jhKMgGRxf/HCEUZhmJf/Tmq2xIk/8eVEvCm1Rvdt87BPydtS6713LOmLpmaW0mwOrS
	 alaRgSzStVGRjB0MrgyfMf/b+C6a74c3nA+2sJTGs9pg6d57WSLXVdRC8ctvat+WhF
	 /0wa7uSFULIsYrifDEIvHP1CEJgzaLQSD6QStAL0G1VmxlZmTkMHyh9o9DL3jYEsLh
	 Io8ExSk/SZouA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org
Date: Mon, 20 Apr 2026 11:38:00 -0700
Message-ID: <177671028062.5403.10359224538543497170@lazor>
User-Agent: alot/0.12

Quoting Marek Vasut (2026-04-19 12:35:34)
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
