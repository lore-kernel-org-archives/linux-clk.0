Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C82DF68;
	Tue,  3 Feb 2026 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079000; cv=none; b=Aqsae+0R+pS6Gsqzc+WFpAFvwppxEWd8YJ0T8oFLJRtaTiFl5IzU6oqPdSrO6N+YSwOqAbocr0TxPlg30lm2XLMtw/DOqoxQ6jXt8g4XrVdeeYLe+OOq/2BbxEumIjpy1K2WJrUXAAYaj9Bb88Dt4hEVRURUoH0GnIavySzbsxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079000; c=relaxed/simple;
	bh=XsJUttOLmvcvYELVFL7+14GzSjHRUm0N6G2ZdfBBNiw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uuQDF4eyjrX4Zgp4577slsMwr37FXFwDiYx/qfQPPAP3EEyyh8TJvDFyDVZ22ibWeU/Qub/biKXREFcaD+7EVjz6ByS3vN96hhxu1HJuaTpppGUKld+NVHjJPaveoCBMXWxExD/cxh1M6nELP4h/CHJ1gizpUCWbbM/ot+aUwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXyX7Ovk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXyX7Ovk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4532C116C6;
	Tue,  3 Feb 2026 00:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078999;
	bh=XsJUttOLmvcvYELVFL7+14GzSjHRUm0N6G2ZdfBBNiw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eXyX7OvkRT9e7UYBEFO/DB5K6YQKnyakG0tNaniVjm7GuIdqNiPCWk0VPvrxNXl/M
	 c4bPfqmxeDJ7Rvyg/0HKvExJSRgR7RHzKX+aLQXb9OltERUUn2cjxlF62X8vTm4v71
	 Zi/AgbGP93MrJqwKsRd1sTy3xnC6WBt6wkA9a5wdClysQTEdIWyn7bAvW2/vPkCg9z
	 n+4ZtAoilmxyY+EGutkdYDhDb9yf9qxXOvG/HrXuPxhdKP2M0LjPozwR6VPuixaBKc
	 H83uRB3/I0FcfUIjjCpo18QkT8b+9EiAQ4rNZ5qnb9xRsAo29bHYnHEGkc5coX44uZ
	 XfnHSaCkR0bQA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251014104626.10682-1-marek.vasut@mailbox.org>
References: <20251014104626.10682-1-marek.vasut@mailbox.org>
Subject: Re: [PATCH] dt-bindings: clk: rs9: Fix DIF pattern match
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@mailbox.org>, linux-clk@vger.kernel.org
Date: Mon, 02 Feb 2026 17:36:37 -0700
Message-ID: <177007899770.4027.7705142903765028675@lazor>
User-Agent: alot/0.11

Quoting Marek Vasut (2025-10-14 03:46:03)
> The pattern match [0-19] is incorrect and does not cover range of 0..19,
> use pattern 1?[0-9] to cover range 0..19 instead. Update the example to
> validate all parts of the pattern match and prevent such failures in the
> future.
>=20
> Fixes: 26c1bc67aa2f ("dt-bindings: clk: rs9: Add Renesas 9-series I2C PCI=
e clock generator")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Applied to clk-next
