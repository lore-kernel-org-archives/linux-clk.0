Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9180149F74;
	Sun, 17 Dec 2023 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWc1oPc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F56C433C7;
	Sun, 17 Dec 2023 23:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702855363;
	bh=7kF1H9/EDgVZxsSZuexSY64jgH3mq2OWdvdCAS2qa+U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AWc1oPc8hUfYZ3M1va101JvghU+foufXlR3La7TH3s5qNNnWWA+b9PhHDq+gVlJ3p
	 chJMhoxJ9ejV3CArhOgv2U8+Yn0Qmlv2pich5jyjGrSyFxUpbS6gch203iDVYzrNXn
	 qGMQoOPBTD3bYtN1khVfBQ9UkS0klgZx6qwiimOItxcNgOlMQ1TYKS8jwjDnzNa8yx
	 sZE5b457JQH2xF7kp//2YLg6KKnnfNm2Vnnzs8hFIKiPPyLRoSPUyOeZ64/laVfDdy
	 11UYBOQmxECv0lNe8yfm91zfw5I4qEoEQMluwJXYi85CzcLp4sagqt0YCwbZiC2hX8
	 gahLys7Kg7lDg==
Message-ID: <30b8c150ea929063614990c8a1bd3a87.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231119212416.2682-1-zajec5@gmail.com>
References: <20231119212416.2682-1-zajec5@gmail.com>
Subject: Re: [PATCH V2] dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 15:22:40 -0800
User-Agent: alot/0.10

Quoting Rafa=C5=82 Mi=C5=82ecki (2023-11-19 13:24:16)
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> DT schema helps validating DTS files. Binding was moved to clock/ as
> this hardware is a clock provider. Example required a small fix for
> "reg" value (1 address cell + 1 size cell).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
