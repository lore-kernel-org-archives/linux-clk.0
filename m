Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1361BDCF;
	Mon, 13 Jan 2025 21:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803863; cv=none; b=egXa+Tk20qMV/OBdJHIO3pEiSyIf5Uk+ZDpTQruC+N5HR4j0cbJyreG2nYGLiwu1EYt0PRYZlI3NLe4XMtnNytPUp470omZNpMpA3IuBiRb7nTojZ6BPHE61GqfRwW9DJt1xjvgpRKCM7KUp63FwJvUDJpah851A8RqPUmwb+Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803863; c=relaxed/simple;
	bh=1idho53w8fBxX0WUXqVsjraMyidFL3R+9EWgINIW8f4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=IiRFVVQu6rtfWGKm/8zzonjkkkS61A8gpLpCdoHFFZYFFT8Nu5s21QjYpf2E3hES96JHwU8FS50Isk/jCZvelSAxY8pmiNRiOyMW7bDJ30vsDRTBm5EnZlmJM8MCh72nb9zdQQp5OpaTYxc0daGNl+qaPp/gZ9F7hPzbmoHRb50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsJt7tGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsJt7tGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE0CC4CED6;
	Mon, 13 Jan 2025 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736803863;
	bh=1idho53w8fBxX0WUXqVsjraMyidFL3R+9EWgINIW8f4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VsJt7tGr0Uf+/++olkGyPoWMddzidtVWecfSMbHmDlA4foDgsmy7Hck4XNOrA3UlP
	 Xzpmia1KFNjEooIrhdi4lTTwxfwY5GeedAPwx88qFeOR8Hvhha0aNGPghSRo1t3Gkl
	 b8slAcYfoOLTZlGhymhMskGJdcOb+t+YFIYxr8jtamPLGj9OW0uytMlCjEAAAO66fN
	 TaT1Gbgauo+bT7hxBwyV9Y0Ma+wO2Qcz8WuOJyjWMCE5dFy+UeNQEb/IKFi5o7f3Sy
	 1zKLJvRd0WsqL3z7hsNlqOk4JVlc4+X9IE8XnCdA2v7zuqmLUyBhgkweB7D89Vdxj7
	 SP+b1HoCSapeQ==
Message-ID: <2b1a072612d356f0d29481ee1fb87a8c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250112133953.10404-1-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 1/4] clk: en7523: Rework clock handling for different clock numbers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 13:31:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-12 05:39:37)
> Airoha EN7581 SoC have additional clock compared to EN7523 but current
> driver permits to only support up to EN7523 clock numbers.
>=20
> To handle this, rework the clock handling and permit to declare the
> clocks number in match_data and alloca clk_data based on the compatible
> match_data.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied to clk-next
