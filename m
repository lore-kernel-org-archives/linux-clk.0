Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6614883F;
	Fri, 14 Aug 2026 00:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667113; cv=none; b=jIFNuQnUarWNppJSRnD8UXflYIk12Gt1uanr+tDCM9XhfzbPwc+v+FyhO+Lle77ROzSMJlLZnV9NrGhQjegOWlOV8V86rEZQkiFvtbU8vbVhCqNzokoGzc9W5v8n9xwTveNX3bLz22neYUEwIw4NFEpMsDiNTbjawmRNAqoqSMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667113; c=relaxed/simple;
	bh=ZuaEF1rxeGK8zrOVfwljDvsbkI7IIQb1EkXDEZeuzBA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LlP4eh7JzQdEkZ3IIaHh4HacKYHg/ASe42pE5XB/iwRgj5Fqtrm+ovkGaSV3yGjfvBhh415wrGfTXtWv1w6SimrsfO8FkkIKgEIsQFXR0zfLw7YewADwHFzsjj7JxQUyx7ir5op2mZBfagFyNko+XyssJi+OvYuNL8ROCgVxi8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRpuA+tC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRpuA+tC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382051F000E9;
	Fri, 14 Aug 2026 00:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786667112;
	bh=oL76sEdCJIDg66Rg+T3XAHsBr8jjKzpZE1XWkCj0Vt8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=nRpuA+tCMnpLfs1Fq1ixZwLjA5evSbXWK68gnqnKfaJBSLuzybj7+AEbNdwi6M7gP
	 1rTeuXE7MGD+d7X1ns6LX/ckPlFc5ZnGbZIbslsu3A/Z6YGltzfAr6E1IEVT/Ux4Hf
	 TIQshIHGNYynm4LahvLcTqimJMRYNtQgiLy3tGFAiSud9p8LN1dGrRr9+JEY8c7AD+
	 2eHDIiBlx4WoE870zufjJ0W4x6ncma+ga7pOjJ/lzE5Tmh6RkRgpZtp2CaNec0Ot2a
	 owegvfGti3TsINeguiD8QQ23ZiMQRvnxwtt3Xyrai+Qo/yifBvAwOr992nQragGUmF
	 x1oEHstRKH4aA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <akLzCVzbMbUsgDda@redhat.com>
References: <akLzCVzbMbUsgDda@redhat.com>
Subject: Re: [GIT PULL] clk: various improvements and fixes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Aug 2026 17:25:09 -0700
Message-ID: <178666710978.5897.9665771464641303345@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-06-29 15:34:49)
> Hi Stephen,
>=20
> Here's various improvements and fixes that weren't picked up during the
> last merge window that I feel are ready. Let me know if you'd like me to
> drop anything and I can send you a v2. Details from the 19 contributors a=
re
> below in the signed tag.
>=20
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/masneyb/linux tags/clk-misc-for-v7.3
>=20
> for you to fetch changes up to e3a9ad35af677ecdff0aed12891f9360d1a493bd:
>=20
>   pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop() (2026-06-29 =
17:53:17 -0400)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
