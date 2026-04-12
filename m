Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC440DFA1;
	Sun, 12 Apr 2026 00:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775955339; cv=none; b=CwayGc2P6hz4aptVXIcsWkKSBeLyWlpMQcluwJFjCZhSceKhFYl2MO/DCfaWdvsDeBABH7eXXGPOgOm5eOLGHJ35EY3pCtXHZChdjZm3H6zmuctQqyHCTE5nXUbnA6MXTvGkZh4Tf998LbLMiK/tzEnNndxe3ckQ06heFMogM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775955339; c=relaxed/simple;
	bh=lOHsfV2KnFeUojq+ZG4SEwYslwEmc12aVkqhFKommzk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VBoQhcjS57/Yn3ny24K5G71V59ohYPq0yxlyTWtrf0xX09l1Zcyu53hvscJeLbrhYJ3CG8rG7CeovPodowvYj1Odv8KFSFHG3e2sSqMwgNO434hSyidd07JyzYu8QJ3+V9WhgTFTBpQmX0xZYdpH3blO8e7BzZf9nRs2CpYg2+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQZvEX8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQZvEX8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6247C19425;
	Sun, 12 Apr 2026 00:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775955338;
	bh=lOHsfV2KnFeUojq+ZG4SEwYslwEmc12aVkqhFKommzk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oQZvEX8rNbiiNj5goAzRtrMw9yx2RVOdQGiXdTZcbosWjHRPfzX+X4XYCkrA05t78
	 VyxgBSviVKZSMrjYiDZFTMRen4HryKOW16/+WQV05sJ3jkq3lw1zbUj3UvCN3XarWP
	 audTqqW5XriRgwfYMCRukJxmNtH/6DFIxMgsi03EcDJvH2Vy6/k9dRx3q1PQlJbTWz
	 xgzn2dWrz0XUAzoc8MWVUwv5c5MKu2uI+o7ObYIEKUSNbN1nKcnj6HtXnqByFIBxL8
	 cc3LJv+ZMJHHC8uF9yA2VBMNBFxO8VvUI63hHOoCa2q4afYxH8RXwXRS9rtBAA6cQ0
	 vU7cL1HsRkMiw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
References: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
Subject: Re: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Rosen Penev <rosenp@gmail.com>
Date: Sat, 11 Apr 2026 17:55:36 -0700
Message-ID: <177595533685.5403.15903650774630512518@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-03-30 07:32:37)
> Sashiko reported the following:
>=20
> > The struct clk_init_data init is declared on the stack without being
> > fully zero-initialized. While fields like name, flags, parent_names,
> > num_parents, and ops are explicitly assigned, the parent_data and
> > parent_hws fields are left containing stack garbage.
>=20
> clk_core_populate_parent_map() currently prefers the parent names over
> the parent data and hws, so this isn't a problem at the moment. If that
> ordering ever changed in the future, then this could lead to some
> unexpected crashes. Let's just go ahead and make sure that the struct
> clk_init_data is initialized to zero as a good practice.
>=20
> Fixes: b4cbe606dc367 ("clk: visconti: Add support common clock driver and=
 reset driver")
> Link: https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gma=
il.com
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next
