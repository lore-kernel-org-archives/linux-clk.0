Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD0F352957;
	Fri, 23 Jan 2026 01:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132781; cv=none; b=XkwzkgrJoT0+80PQwi4/wODzoKr7YpW/cwfaS5vcYIyAIFlcAOWLINOpR6lf2s027aHnkgsZiOluYKKHqTyEjehRGFJAgbI47Ce5yQ0bifn8YrTdeXWYBijzhlXhXJZIOa6CZNpwYm2QFkNebnnpc9bn1UalEYFybqv2H8EjP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132781; c=relaxed/simple;
	bh=64Dv2Q73LpzBvPArXPMCYu6WRRtSWQKGL8gHPitpMsw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ovGd/IWimqbaIs/8Xxx6Q8ATTRzrYWIOYC+sZjpbINn3dXFwiGc1KIsuaKTBQBL0dBL6/BF/TH4iYLYK9kaPn5wHKLxTCplhM6soFpLfXxMup2VLrVjvQ2eTtJYVH40Nn3Bs8e3IR7VUqCH1KaOQ5c8uGNdEIv/NAqkP/MLHkGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiA+Ng5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiA+Ng5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971BCC116C6;
	Fri, 23 Jan 2026 01:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132778;
	bh=64Dv2Q73LpzBvPArXPMCYu6WRRtSWQKGL8gHPitpMsw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LiA+Ng5HEHFveXvi/29UYw8nH8zrjoZQkFmDBi0FYmn1fC9r9PKkVFk3wqIg2lUaW
	 XHGhsP1I3G52hceAcQjwaIUqqLGNh3eBtLP2evv2QQ9a4M3ThCRlfzlLtN44dJ3iwV
	 oGXh0uuhXqKuAwHdo5u1XFK29m0P2WADuBLSLO/0DqLYhYkj8p/A0hQIB1bVDTuNl+
	 /Ng0hz/h1VLYMuqgWrPXuV/RCkSW9awWWhZQBG5nxTNb/0WrlIte0X/VAE8YOQDP4x
	 Sh0eexYFrtfXuL7fFE3SD2Pj3QuxsTDyJi6/Bx8tPFJNKoH7eMFKK2vbG5OboHg0jV
	 WdER+C088v7tA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 22 Jan 2026 18:46:16 -0700
Message-ID: <176913277684.4027.726770744275023765@lazor>
User-Agent: alot/0.11

Quoting Bartosz Golaszewski (2025-12-22 08:02:35)
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Applied to clk-next
