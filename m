Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F483C17
	for <linux-clk@vger.kernel.org>; Sun, 30 Nov 2025 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764531391; cv=none; b=pJDL/MUJ/ePKKSUm0wXytVfVQ0Fcwxxg9FHNmOMoloU64MoXnYo+jqoF5YdXQvdROImby9Vji6Cc6axlcrRxnNAUecPddaatWDkrPM04hj15mfKtQqSMsl7++pdlfFq7QTFlTLnmtiPNVl20Dk6ELv2aR7j9s9IBDALT0mKhhSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764531391; c=relaxed/simple;
	bh=4EyD0Bg6/NVuoQFCE3IRhFvR8Y21kaRFXelGDBkNHE0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fsqoRJ8jsAyPp2iYzGlZQqZ03Ot/1ZVBSi3UJZJWxXkzxpBl30xKlfHW7w3N3lXa6g7Tw39xQHChcyAlOA+rJgJp5Xx/W2T8+SyQ1jMXqfBeFuLNgQuPINlFnaC91HMB6fSgNdvKXnL8XnHyUq7c1cGMpZyDwrkWuC1RcAHcLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4tdQvo5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4tdQvo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0EEC4CEF8;
	Sun, 30 Nov 2025 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764531391;
	bh=4EyD0Bg6/NVuoQFCE3IRhFvR8Y21kaRFXelGDBkNHE0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T4tdQvo5RvDHMSwmHQ4BgMnmrOsYW09P0sR8Ixoy46qFOTGqOE9hA/DicBY1xpypV
	 /F1zF6m73+B7al2bldXtXARe3WU2mEgILQkqWYyjofTQ/YoUT77j6sphG6VSyUvwl/
	 z1GeYp7xMMahilUWCeFlvf5PD26y/BCQhAasgfEUgFvxA82mbvmvLYiRCYNR/PY3Nr
	 IVBr8dFbU7hbY7fQ6bXED8njE1V8LYByzSTf5DSMCaxJL4cx6mC755tf6F2yurxj88
	 l9fHiwRhj55902eUqwfY/izQ4QdeZsQe/TH4kDw0ROn5pITqePQHbg60R0dapSAKZK
	 DPmnRmQ5OqelQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251121200433.2005639-1-claudiu.beznea@tuxon.dev>
References: <20251121200433.2005639-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL v2] Microchip clock updates for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Sun, 30 Nov 2025 11:36:29 -0800
Message-ID: <176453138910.11952.4117870243424252707@lazor>
User-Agent: alot/0.11

Quoting Claudiu Beznea (2025-11-21 12:04:33)
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.19
>=20
> for you to fetch changes up to 781f60e45bdfe351aad692ac0fa89e36f8bf4a36:
>=20
>   reset: mpfs: add non-auxiliary bus probing (2025-11-11 16:47:24 +0000)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
