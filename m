Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF7277C81;
	Fri, 16 Jan 2026 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531920; cv=none; b=MXQsDg4HXpIORRKbCrsDylcZc1sp/GbfYDvoLmOLJo+JfXLx5bNFh/QrnS6858zJ5Gr/XiAqO8Pu97GZWXjUjzHPY3CHjygPtiY4YSm0YIoy32d6ugJG+CrZ8ydb54Ta4FyUaLNfLFjylR/r5raC4a1KReusO8c/JN3CnWeG/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531920; c=relaxed/simple;
	bh=YEYz8iy6S/qwpKnKAwEHZ0SEVsBpuJ0XI8l0ZVAgpow=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ruwDlthY/3wWdYJpykMLMrBf3oa8UzfZb1NMYcwKyn9qQHmchf4CVG+keDiSOQIFQAvpvECiR6/4t9edkVoxv2TrolrOI3B2y8QdRtwRXNijhPkBVUhmS9TDkw1R2SVan2pKFcCWiQgxRa6S5Gi4c7ocCBMtog6K9UzLE8OJAYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDdMOnB6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDdMOnB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678C8C116D0;
	Fri, 16 Jan 2026 02:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531920;
	bh=YEYz8iy6S/qwpKnKAwEHZ0SEVsBpuJ0XI8l0ZVAgpow=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jDdMOnB6hJ/m9uvGDqQyDdqLBWj5FMlIZJh1bP7aR3u2t/9LGWP2t/3SSeyxa4oue
	 BV1NKbBRZANr/yN7/xs7LSAA42OZhok8djyAHpt/4Gh8SEkTxizlLSY3ePYDcveoVh
	 r9GaX9lou0Dmmb0s2hKO5fozVAzP9g10MfZD6wUjEXyukpdBJeXAL/ovDhvIcZQXhI
	 QNj8uFRn98F4JOBrBXF3mjVe5H/fRfN88InJJzEk7H8zs3jh0fTedKvbFGw0RCIV24
	 PZ9Bl4omRl0f1NAdz0pwfn4urWMu23jFGDk9OGtkbRkw5+2qo/lHu9m1b8ZgVuJ+V9
	 4z9063GTVDEDw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c6bf644391dc28803a0ac1e331f196fc2c3c36de.1764582057.git.geert@linux-m68k.org>
References: <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org> <c6bf644391dc28803a0ac1e331f196fc2c3c36de.1764582057.git.geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] clk: Merge prepare and unprepare sections
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Keerthy <j-keerthy@ti.com>, Michael Turquette <mturquette@baylibre.com>, Russ Dill <Russ.Dill@ti.com>, Russell King <linux@armlinux.org.uk>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Date: Thu, 15 Jan 2026 19:51:58 -0700
Message-ID: <176853191833.4027.490977743923572405@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-12-01 02:42:27)
> <linux/clk.h> contains two consecutive #ifdef/#else/#endif sections
> that check for CONFIG_HAVE_CLK_PREPARE: one for prepare-related
> functionality, and a second for unprepare-related functionality.
> Reduce #ifdef clutter by merging them.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Applied to clk-next
