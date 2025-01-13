Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB71CDA3F;
	Mon, 13 Jan 2025 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803895; cv=none; b=tDSSD1+JnMnfqyfBGXHD8KtPkIP5tG/S1B7Cm+BUNQiEYp+1xZn0CGN/wk4KRpxyK605lgG+e8b1HgK4uKmrVzJ06ukYrMFYbsa7/r5QP9HnTw3dBG8DmT552oDzaFO4X/0oNtgzI6CWqKHJ0GyhJMaM8ajLkQP6YaXp/bSM06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803895; c=relaxed/simple;
	bh=OnMVyWRZTAEbC8Mk7XnfP3cK2N9vSnXyF/a2x725byA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=uBX3Y9X5OQoJ2+GcfH44G7OnZv7G+/z60U1t6N8G7wfdeCmgmCOmzjZSe5rv+2TBIjRDfKoS3fmRURKCWbv8mfDHGRzBGW2a4bOKZzLVXNEZKEqw0WUcyvg/4WHrrsiJzzw5D+6a1AqOmUsQDx++le3+9iXOHvJY/YTsoBNiQgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiIUEvLG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiIUEvLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E78C4CED6;
	Mon, 13 Jan 2025 21:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736803894;
	bh=OnMVyWRZTAEbC8Mk7XnfP3cK2N9vSnXyF/a2x725byA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iiIUEvLGR6iQxyW0745F0ALfJrpzTCtZuQkBDpJedh+o5T3ps/mIEovDrnV3y/ahi
	 89vkjyEQMrbadtZHwDTRKlJSv08Sr5rOE0hYt8QxpWcYYyF+8us1KNilBv8thl9ser
	 gv5cncCiHn82wNey98gaYH599gpQQCDdUHpxF6YGVkRHcPeuKbbVSQ3EljVC6iQokb
	 IYAPWPU78GJNF7d+4pVuRRtpKWN4guqnJuZaHShZlV5mPaH/GgbLhrh3j5i/FJDuUL
	 hVKJeFNn+ylkSvD/5pDIelc1pLuDKazqSk+I0ipPb/e0i892mqiFQGz+dBKk9DChFH
	 olbGGdbMaffnA==
Message-ID: <48b5e4136c5bf0172ea7ce168010507f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250112133953.10404-3-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com> <20250112133953.10404-3-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: add ID for eMMC for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 13:31:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-12 05:39:39)
> Add ID for eMMC for EN7581. This is to control clock selection of eMMC
> between 200MHz and 150MHz.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next
