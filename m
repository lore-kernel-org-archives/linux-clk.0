Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8B384CFA;
	Wed, 12 Aug 2026 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786507869; cv=none; b=KJCW1QAdc5HdVlFFBTnB3eKEoL9xfPwUX+iewKKT9KegP9cHkse3a0YD3OC5NwPpSbdQZVznNNIjJj0y4KIARxTrRm/mm28GbJbdCXv4++4EVcnR3sOaqfeDlZUy9QL0iV8+n2OPjXgY6ZgJFbkuQxEvvi2ZEzrQj7UZNlMRh/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786507869; c=relaxed/simple;
	bh=Rg827rDRcODl/QK4IHiUCFOq7OzX1WuWjygYfP7AzN0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ikfnKjS1WkZXPP62eueJCtmJXrRzeVWZdZ8gIDaRaWHqjz5jqwaA6LvvCVq8di9F4XfgLsJWGJb0tcIKtSRKRWKjrAOMyqaGKXc5cTiBt9qHHT+XyLuPLYzNWuvKfzqAjj+aKiru1Q3UBQ1CfNRgs7ixwpBfQSH8QHiuSM4nI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLmtQxyS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLmtQxyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9FC1F000E9;
	Wed, 12 Aug 2026 04:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786507868;
	bh=ZLdGvYtPx/SJa2vCX15lKvUKymeUZ/q/AFxjf0rZ/50=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=VLmtQxyS6fDnxPibwApEFou8yMDV9pgFt69ezH9JAVSi+dDrz09ZwG+xJWGCW7uQ3
	 Zjp1lREuIJ92vsJcfDwQGGn1jECN71hvuPN390ZolMPQ2gmnNbXantDf5KRsQ6nBB9
	 03pJCF60OWJzzhvmPB1Yf5+poNGXmA0cpnTV0CgjI+XiX/EdW9VdCQYQW7J12jFKqd
	 HhKLhKzibevLTbUbpCs5Oxd0ju2aLtJKr6SWnpjaHkPdFSUREkDd3pkzplZKkuEyS/
	 r9l8tV0bAKS0ICQxwO3vZvpu/LltWvlavzdsTfbXROtsPKOWyvI4tg62YEsaX/cAIJ
	 VpnhD/ZloxGGQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1784195202.git.geert+renesas@glider.be>
References: <cover.1784195202.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Aug 2026 21:11:06 -0700
Message-ID: <178650786652.5862.6578978384046656833@lazor>
User-Agent: alot/0.12

Quoting Geert Uytterhoeven (2026-07-16 03:04:10)
>         Hi Mike, Stephen,
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v7.3-tag1
>=20
> for you to fetch changes up to 2df26b8663b6f315d0e9364927c8503280fe3dd3:
>=20
>   clk: r9a08g045: Add clocks and resets for CAN-FD (2026-07-13 13:58:01 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
