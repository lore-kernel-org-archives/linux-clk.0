Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB826D4E5
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770058784; cv=none; b=Rl2ufyh87kZNkV4T3iS63GWvlCpcUQzWkWguFqmmu9/CjgfsIfKrxmlEFFzRoycWPL4lT6WTtuYdBQRw88jy8xCTzJWkHV+ZFfp4MvCI5SBUrxvLK1V/r3ewf4cZs+ak+bYnSCl8K4BVhUF8nAijwz6iQNLoL+ZmvFiNUFXSy7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770058784; c=relaxed/simple;
	bh=UL28tgDpwnuSIxkqezficeyd9/IAmeBAOHgpop7lJL0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FOY1mpJkkIW0/FvgI1wTu5XuTJbyo1otNpxYxovDc6p2ugq6EG7hHHvo3SpFdhWsXErywFMonuzEo2bccOTi3tFUw7+nKfE0BPx6RhDeqVusvqG1qSNAfB+fzWG34M6G4YhZCa0NcCXRMyADZ0L72LzY/GhzuN0gRd6E93ecgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5sfmS46; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5sfmS46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4B4C116C6;
	Mon,  2 Feb 2026 18:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770058784;
	bh=UL28tgDpwnuSIxkqezficeyd9/IAmeBAOHgpop7lJL0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=O5sfmS463hUOrlWHow4qBvBtEu4JW7H/6xS0wZ/CmaDX+by1HWF+SamTWRTThd7RG
	 aWiUspkLR8323l3+xApXJbjj/vaCz7rPvcy4uKEabO7UxQT5VAxRUah0gEyP6DRsrr
	 mE4isWPVnn4ckQ4JT27JslhCsXxINe+9McHAdlyha2DQzFoO1t9bgl9W2tMTytMdn9
	 f+9XLiAcCPhbW1SBIendNJR10GEvconm0RFl3BCwo/p1n3wQiNmaMxnbCeWnNXIB0l
	 kREXX3ed4y+NpZK8bfIKoQBlVJS8uMAo9FQqwz9t5qFiiCTYMvadC/hcwIs4dtvY0M
	 IbI5VLqMUcd1Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260124094715.2106796-1-claudiu.beznea@tuxon.dev>
References: <20260124094715.2106796-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Mon, 02 Feb 2026 11:59:40 -0700
Message-ID: <177005878083.4027.8612819339789209496@lazor>
User-Agent: alot/0.11

Quoting Claudiu Beznea (2026-01-24 02:47:15)
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.20
>=20
> for you to fetch changes up to ec8c1f35b5aa7aa63bd398add63a8633adad532c:
>=20
>   dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility (2026-01-16 =
08:48:38 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
