Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655CB155C97;
	Tue, 24 Mar 2026 00:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311601; cv=none; b=n8h1ZIR3V8bA/g9baOKemHNLFyhchgANpr4fgKhN4asodm/BNF7sGGs1bWNPG77C5KZPJFhKc5nLT4LUfVniLHe/ig9FsoZupfM8mdUWlqt13srYgxrp8isIUcaIxCf2vRxg8PSO9+DbGl1ZkGee/sLuXdJkmHrVhJRfa7fWIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311601; c=relaxed/simple;
	bh=cqQsI3EogMco4TEmfeGOLwSKN6hU44LpjLUbEkbOZK8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZGCjQKgpJRaB9I2QSCj4ME+kkxXlUzTV3NdavmxBOLshA/BVHIBHELIPrkvyV1xlhgQkBt9JOjx3yKs/J3V1d1KwfMCAdeKvs5HNlfxDQH0oIG7X7EtHISFgcp8LiqbzEMZtIbPIza/U+X34vDX91ElR1BgequeQqWMtMt7qKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcALsVzP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcALsVzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E395DC4CEF7;
	Tue, 24 Mar 2026 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311601;
	bh=cqQsI3EogMco4TEmfeGOLwSKN6hU44LpjLUbEkbOZK8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tcALsVzPjZzObwi+OV8lwSigoIb4PFyBGMil6Mcwhp/wjCvUF6H8ZS//mZiU6R0t4
	 olCjcG2nCDzMj7SWo6G2mxeiSwwixkVQxRqPthe4i3NyrFg6GkSGswlhaKkuahgsTu
	 LRmCNwlip7mvAMdpvsY0ShscQWlAGFHqypaZsQ+uOt7GXL7qjGDIrY4Cu3079pcDMw
	 n0Vh+q3PvdC2VwLrUxLuAs22PjOnYrNn1v940DNL+yH3PO9GfRmJaqA+3jby1o4K8e
	 rf4SJA30Y9BPtI6uYpMiyFmBh9IuumNNpb3beoVAen0RL5uvOvgox5J2IQucpp6HCz
	 Jwe8wERH0FIzA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d175826e203f2c2fa7060d57763286ec3fe2f43.1772705227.git.geert+renesas@glider.be>
References: <0d175826e203f2c2fa7060d57763286ec3fe2f43.1772705227.git.geert+renesas@glider.be>
Subject: Re: [PATCH] clk: xgene: Fix mapping leak in xgene_pllclk_init()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Khuong Dinh <khuong@os.amperecomputing.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 23 Mar 2026 17:19:59 -0700
Message-ID: <177431159906.5403.17462558942153116180@lazor>
User-Agent: alot/0.12

Quoting Geert Uytterhoeven (2026-03-05 02:11:16)
> If xgene_register_clk_pll() fails, the mapped register block is never
> unmapped.
>=20
> Fixes: 308964caeebc45eb ("clk: Add APM X-Gene SoC clock driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
