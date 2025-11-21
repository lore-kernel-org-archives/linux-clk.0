Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1262F1FE4;
	Fri, 21 Nov 2025 05:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702448; cv=none; b=Fki5dJaFNvMziduTrB+RAgWoN8utjrM59iLot/kbVzY9wGz5KrLMFrGga+T76W9FTXp45RVLlIFu5JBPiMQDjYXANfuJS5wwpekSgVeXDeqq3b6Pdy5QkzRCF+UpTdo9jUOr2vT+4pVpPpbLPLS94ZlIcr7wW9ZtMJoEFCv9o1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702448; c=relaxed/simple;
	bh=Q/VEFzM84Y9OBPN5IPiiv8IzB5PP/GcGyuSe7Fz8zeI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=o+MJdKHcWmAHOUX5mCM1vIF/c3OJ6P5clJc5H+9Fp4vptr30tJDTjGazFKo0+aEExpVl4PNOy8nu0LMYl4Tk2MDTXgQjVGaRSqLlRYub82WCd6e7g3G8xv/GXK2xNr24c8BKwhr7yrUoPXr8EQmm40QakKU0jzmyHLrriDIdqsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU6VXLs7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU6VXLs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FD3C19423;
	Fri, 21 Nov 2025 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702448;
	bh=Q/VEFzM84Y9OBPN5IPiiv8IzB5PP/GcGyuSe7Fz8zeI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LU6VXLs7wKg3PTUWt+XHZ+E02tSSqAd7v4gTQuDUeEXQOXy0jFFjixfCAwr2xsOAf
	 mfuOdHyDaLUkzozd/KrIqi4G8k8ugjYP0BBBYpvULm+d9+9dujW3ChjLUk21JdGpOR
	 bU+ZUQ2kcGf64VfEbPcxvgiP8WPLL8HhhmU4iUCVA2kP1HYVrmjEZ2/omVjsDVstIm
	 JbsexUhxSoCV53IsN33IiLf1fy9tIVwfepUJGJNX5rMwBabGAqPgKam+Y68a3MQiQ2
	 NL/p9Cd5PxGuP3c9FwOuwgGFsvL+XVEcKT7tPOV3jQnpL0lNM/Bjs1p3/DDSvvxeR6
	 PN2Zli5JLEh0A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp> <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH 2/2] dt-bindings: clock: tmpv770x: Remove definition of number of clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:53:25 -0800
Message-ID: <176369360530.11952.16156337990379437425@localhost.localdomain>
User-Agent: alot/0.11

Quoting Yuji Ishikawa (2025-11-13 22:53:58)
> Remove the definitions of number of clocks from bindings because they
> prevent adding new clocks. Since the previous patch removed all refereces
> within the driver, they can now be deleted.
>=20
> The same for resets and plls.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next
