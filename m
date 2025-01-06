Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3531DA634;
	Mon,  6 Jan 2025 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207299; cv=none; b=BwsgGLfLC4jf3UfXQuBeSRMEJGxocYWd/Eua0FB74XopCO5NaRfdpqLOoQZiJJTZl0L+axsDQJYCEh/kRYZqgey+nX9qqgZl3NOFEgNlXzR3S+ox6WyU4UH77quezjPI5acVAIOMdTsHLMoz3jhjNysMCIQOjZfz/Dn8uj/DYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207299; c=relaxed/simple;
	bh=tk3HDO1RXmeaTn7h2NrgJSeAsieiLy4mYuakR1M3QUM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=SI+B5mINPy8VdwJzRCAtIAdW9HhglIZoxacALxaHrDVnHBuZSdWcdM66IjZFqWU65ba/p8JrS417zxycWsv/MaNeevZlxcp7zKNiKwznVw6yq8GpOGltdeUuf6AQ7r+nUuAdUcwtjJTWl+/EDJIch2tTur/TULtiH6QQzf62dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tW/AKC6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tW/AKC6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D870C4CED2;
	Mon,  6 Jan 2025 23:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207299;
	bh=tk3HDO1RXmeaTn7h2NrgJSeAsieiLy4mYuakR1M3QUM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tW/AKC6rNfoqOpvbWeLnrdjUDMiKmSwl4o1aQoVgYauhNo+xou3nvavqPDWZkDa31
	 511k/EZe95NFxJUXku6B0yMdmCeVEOIXh0qwoyiERB6kDx2e1JCB7TGpZghX/npBf1
	 8hGUNVt/NvC15uni0XXfzmGIu9o2o5PerRJNlJ5ETOzvEJbVgeW0XzB0sUJ1i7vTFb
	 MkXNG35uMqtH3krjS6gLEdfF1sYZT3JHF2weYHaQpoKR636ZElQqJE6DvmgvVsV8Ko
	 MMz7fthSGcYAAxscWvzO18NA/vYKsj2Zt6EpOTKEZmlWjlvV6P2yw0gXNQwnBb+4xl
	 +2obtLht1PDPw==
Message-ID: <c35f062bd6a9310df7bd5b5e3ac4cd24.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com> <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: st,stm32mp1-rcc: complete the reference path
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 15:48:17 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dario Binacchi (2024-12-31 07:01:41)
> All other paths referenced in the file follow a scheme starting from the
> Linux root. The patch adjusts the single file that deviated from this
> scheme, making it consistent with the others.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next
