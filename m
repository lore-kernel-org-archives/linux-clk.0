Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C791CABA;
	Thu, 14 Nov 2024 22:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731624349; cv=none; b=Gq14dYdsMiPpVAEihOecyhHIpyBjxipniPHAt+5S4KM7qwAbrSrlKVj28Iv8JbDXv7AqJS5AXzb+sNv4du3aK9ybazhSEaP5O7SFv7HimyEHRA8UuhSdTrM0hS06bh3t6OpZEDlPMy3HoyefmmEdeJrnAqtkkR75vu2DMkTi9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731624349; c=relaxed/simple;
	bh=WnhyDZ5zxnAB0KqBpY6eimtTNvFobWj5fWrZ0EuLUZ8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=f9zrHP8Lo4PAP8wh2lm+dXn5/JoB6xJyyH+kjegm+FC49DXdbqfWOs1He0GZkpMQujTj/yZlaS7MZ2xOMfUkPx4gwjeRQCAGheGIdgHdhWO3nMlIreDKp9L/XjmEfwx9kvQgjSQTMR2xYDpXNvF20nL7/BYnfecgzg4LSDKDwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyrLohW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyrLohW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06C2C4CECD;
	Thu, 14 Nov 2024 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731624349;
	bh=WnhyDZ5zxnAB0KqBpY6eimtTNvFobWj5fWrZ0EuLUZ8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dyrLohW7kE918/KqmCxkbf/QSEs3P+gicOY6nBxhehQHbjJIyuIvZ8wIIwbFIo5Nm
	 Mz1EJeRfNXAQQNe81nmGf4QQbLmoWGDr5MF0isETg0bEnkst7TefEW0FkKy36Oqt2s
	 IVB0AQB9NV8ob8kiESuetIp8D1YtH2HTabewSsh5iyl6ZwejrGPclndhGjyMZpB7Do
	 JacJ9aQvn4gemwI8g0IxGhUs3zvDOvD8fgswMhfsfrD2RJfIOkohXJhrPaqBC6LLap
	 +Vtu38GUdFL/zqBBrZe6l1dERJZCWEYCRLWtHnw9llUAMkoqaCKDCLJdzhoR5GKiKF
	 VhfAXCBKpsskQ==
Message-ID: <8d8138035dc740ab9da2986aa142d2ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241029-axi-clkgen-fix-axiclk-v2-1-bc5e0733ad76@analog.com>
References: <20241029-axi-clkgen-fix-axiclk-v2-0-bc5e0733ad76@analog.com> <20241029-axi-clkgen-fix-axiclk-v2-1-bc5e0733ad76@analog.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
To: Nuno Sa <nuno.sa@analog.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Thu, 14 Nov 2024 14:45:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Nuno Sa (2024-10-29 06:59:41)
> In order to access the registers of the HW, we need to make sure that
> the AXI bus clock is enabled. Hence let's increase the number of clocks
> by one and add clock-names to differentiate between parent clocks and
> the bus clock.
>=20
> Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---

Applied to clk-next
