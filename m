Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD194B122;
	Sun, 17 Dec 2023 23:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqbCUq2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCBBC433C7;
	Sun, 17 Dec 2023 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702855735;
	bh=n7hkW7SDQi+ZDWyN11xC8ddmWW0kWj0pJZDNQQfNI0s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TqbCUq2FxIzeKWW70tiuX3dsa3jWAFnMCmkHbfVwX4Fl1gkrfFIrngbnRnmXWqkYC
	 iu46OY3vozomoIQCIz8Alo/MhyFzpnyjFVs0XpdMxFZ/g8Vs9juo1xQtkFs3lmTURk
	 Vy/h6fjYB7XxCjeVJ81N66wtuHfQGxuWD2cgSIo8vHXZW0VZ8wLd/9NDmJ+B6Ghu3i
	 dNyBtaG8j7I7TtD2wRYyBfXSZ+3yEDuZ5S64Eol1r+6JB6uLwoYTpWhV1dUCS+QRBI
	 oj7rZtQNzbEZgw4m4FapG1GQreUvuRk4XCkk4uKbs5L8KG93zl6rKyRa5OGcoxysgk
	 Vs27VaArjHyNQ==
Message-ID: <6c47f4e46b67f1bbc0a9139d51cfe6b5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231113221949.111964-3-marek.vasut+renesas@mailbox.org>
References: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org> <20231113221949.111964-3-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3 3/4] clk: rs9: Replace model check with bitshift from chip data
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 15:28:53 -0800
User-Agent: alot/0.10

Quoting Marek Vasut (2023-11-13 14:18:53)
> Adjust rs9_calc_dif() to special-case the 9FGV0241 where DIFx bits
> start at 1, encode this shift into chip data and drop the model
> check entirely.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next
