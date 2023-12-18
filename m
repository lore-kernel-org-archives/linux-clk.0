Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3A5392;
	Mon, 18 Dec 2023 01:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Djqa4ubR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F77C433C9;
	Mon, 18 Dec 2023 01:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702864008;
	bh=Ex9NugQNN6ego8hmaqk9sn4T6nhpkFc8aBfpNboPrBA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Djqa4ubRaSZfMEaO5Vhf9l0FQXamjRU+B1YxuUJW8HDJ64panAs5cLThatfEUx30j
	 hZUtcSh0VGSBIWCDFJ532AGEfEN8dgV17g5VwyQvkTyrdsEWVQ4RDxpDWF1232kzlR
	 MWhJWF9Ql2GVVDPW5X4UkGCQLlFtGOunlva7NE/ystB2KPSWP8RNtCkFNJmIZdBjNF
	 oo7GB4FdmNFrEQVzFs4ZlNNNvsJCfIQtbZdkJhogoi/TlYNJcVtR6Gv+2opI+jGurL
	 +WdsALC4ylrazhAScOLIAQrD4r/eeZXl8+ac3C5UEnvEei6gWz6eqOOWeBrnxjyg6C
	 2zfYAWDocyzwA==
Message-ID: <9bebc25ad3c40640faa9df3d036f2326.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231101031633.996124-1-suhui@nfschina.com>
References: <20231101031633.996124-1-suhui@nfschina.com>
Subject: Re: [PATCH v2] clk: si5341: fix an error code problem in si5341_output_clk_set_rate
From: Stephen Boyd <sboyd@kernel.org>
Cc: Su Hui <suhui@nfschina.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To: Su Hui <suhui@nfschina.com>, mike.looijmans@topic.nl, mturquette@baylibre.com
Date: Sun, 17 Dec 2023 17:46:45 -0800
User-Agent: alot/0.10

Quoting Su Hui (2023-10-31 20:16:36)
> regmap_bulk_write() return zero or negative error code, return the value
> of regmap_bulk_write() rather than '0'.
>=20
> Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
> Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---

Applied to clk-next
