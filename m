Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620430AAA6;
	Wed, 29 Apr 2026 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434411; cv=none; b=hyV2IVaQFRkHMix3uALut9TtD2TvKp3YvlmHR/twWqDvco3apBjsJLgWEv9tThRFU+9efTFjzdXsNoWJwTFJ5L7uE60xOts8NDGgDSD/k6Dmvzj9i5eMqGZtjFP/nU8slMq6zAexUJ2HccxQYf3oJxQNEOpaBbYvNJ+KcLb0zmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434411; c=relaxed/simple;
	bh=0pKIoD8B1WlRBw3jh+ZtXWxB/FZR1BeNK1uftIfEetQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=tK+hNIMfhVwt5YW2L+ILeMIxpry3Td3/hWia+pLc2yLZ96HgYnUmY4KsujejQnC8rPPhxmS1tdY5FWzPs/1YIqxlEEZnjWWyQF05c18zqhnZkfOd0sIVvVHN7XLYA1a+WVugkJd7QyRCFTnVQXEOXj/Aj03zN+uqp40/1lsCjAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJIrdbP0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJIrdbP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EB7C2BCC9;
	Wed, 29 Apr 2026 03:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434411;
	bh=0pKIoD8B1WlRBw3jh+ZtXWxB/FZR1BeNK1uftIfEetQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eJIrdbP0F4UYzAdvwm7g6dnSKTUviBuSlSIPTQDhwZb6flMp3gVWTWXUR596ixI6Y
	 k69NXmuSp1pNn2ZeoYbdkYTEORdviSW8BQPNspW/8ot1GR4hYhb4iZJylJDkWRgv/1
	 WgseBsCxekoq1LKDZ79XyyPfOgzcojtzYY+6NK2v+IR58rLi3AdYn0ywwy0cdD5n2f
	 G7W2TAmAbI+BnnxkFrRFd4vmD5uYGNPM7bDTGNiLN6AtLBc8qWI83H1zNYatlbkydL
	 mUMEcxNH7YT0QbStCE6DS0AYzsqXH8c3GNTuNKFTVcemxaVsXgQ0KeqspNdPdj3WR7
	 2iG60PY+gNg5w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260422125313.141808-1-alexander.stein@ew.tq-group.com>
References: <20260422125313.141808-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] clk: bulk: Use dev_err_probe() helper in of_clk_bulk_get()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 28 Apr 2026 18:59:15 -0700
Message-ID: <177742795530.5403.16162699014113829164@localhost.localdomain>
User-Agent: alot/0.12

Quoting Alexander Stein (2026-04-22 05:53:12)
> pr_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER. For that the dev pointer has to be passed along.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied to clk-next
