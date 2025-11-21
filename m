Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6D0274B34;
	Fri, 21 Nov 2025 05:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702448; cv=none; b=EDgFc+gf6DlAx7hOTkvxJToistEuWGypl0lqv3d/EQvmavg445nAg7wVLysg5PEnVIZeQoZTx3Gd9PHjQmBi19nC43sRd6Jgnutm2pGqP+rT2cQOApmmQAgcUS6zZrVzhC9MYTFbam4NZktAsXGYR84HydYAbchwVQCY1LHzHt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702448; c=relaxed/simple;
	bh=WC6eLut1Yf09opHOVTaJBeB1nlKjA4v68z7bew5ZoVo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=a8ADInp3EdnTTwyFiw4xQW118zMQkqrb/JpcdzQXpIfwKl0o0FhaPKYSR/C8zZ70Qpx5Lw/D8XpvunDVwqvlgkQv3Q9AWIYSWmy6Xv4cxTcXJmWLa8th4UwwzdddCyQegAwlI49ImCXzxymKBRg8FRdNSjLLv+NlAub0jzanrOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu6xjMYR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu6xjMYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EDFC4CEF1;
	Fri, 21 Nov 2025 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702446;
	bh=WC6eLut1Yf09opHOVTaJBeB1nlKjA4v68z7bew5ZoVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Nu6xjMYRFI/JlWLprau9hzGZe8ly/4zqDx3Xvb9/hINt8cfFQq7vqt5tgXyvaaFf8
	 GXoJ7sn+kwRcmUwYUmrhWeOO+lTsNRhkjcaSSyHxQigQM56oZRssXDjy6FS2MKG5sO
	 IUlAmHycszpV77MQu80apcaUSSkoBEN7DYP7X/oFdGiOeW9ASBNtDAJzQATfUQqvVv
	 aFm2gixa1uO06hynDfEadFfb5hBfZuJuZ9WlhbBmhvLAwfOe5MjdxJG5CTYehWQrk4
	 SYC7G1icNswTvhY/SqGFN/8elNKzi5283Uo9niLhPKZ3AtHkeaykGrsIuWxJXjuXbS
	 JiiyltYRWyh4Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114065358.854817-2-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp> <20251114065358.854817-2-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH 1/2] clk: visconti: Do not define number of clocks in bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:53:17 -0800
Message-ID: <176369359764.11952.15909609410140938429@localhost.localdomain>
User-Agent: alot/0.11

Quoting Yuji Ishikawa (2025-11-13 22:53:57)
> Remove use of TMPV770X_NR_CLK.
> Instead, define number of clocks inside the driver directory.
>=20
> The same for TMPV770X_NR_RESET and TMPV770X_NR_PLL.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next
