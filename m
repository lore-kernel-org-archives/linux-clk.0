Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF89E35DA55;
	Fri, 14 Aug 2026 02:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676199; cv=none; b=aGNYSW25pvdkXwZ4IzYXmHL23YTCpxyA/1b20pgO7iNGDxQl+j50v+TpQWaU8fFYBzonQd/HRhnJeIDT9iGL5qvXN71JZttX62a5bGfGR6bdbVPPzXUfdXr5jL/y1IXmzpWysWFTTKphV1hEUVxbmGcsPYUeYJDhbuogssylKqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676199; c=relaxed/simple;
	bh=Gusw+Trczq8u74nLdQHbmFiXhyF7jLnWfe1W1lswVGI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TDYXtBQsCfPaSglF8knyGys884ewZcOiXprGE2fbEXQJSQeLgI7lxUeHDrAamc1a/cJULaEW6ChFrTWiFhkB2YaDYL9vDs421B/1Hefk36s1LnEoSvXUNpcBa+vFe1+Kx2tQT8BYgGUHishnSkDTAxNZqGrF91bAHb/JhbAY0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcgdltNi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcgdltNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0A21F000E9;
	Fri, 14 Aug 2026 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786676198;
	bh=3IinE3EERWc6yXCwpp37aOo5C9ONkNdTpErOyVloYGc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=YcgdltNi7kBCdNeGX06oUPdWsCvrcKvmYudlZeddfwNmGgulDsMTEK5+OaCKD/36n
	 nzpUi1ohZ7Gc0IwleRuC0WXsnFZG6qjs33RRiJUkw5VwHdzON42W4J3Ghl3w0ji3lh
	 4UYjfP2ctz+lh9qzBRLn1+Mwa+8LnRqW0SD1l863JdCubWOsLTLOsz9X8eKCw89QRL
	 s4PokuVjhO+D1jpBwCI/hW4RAEa0UncMpKxijJW18we4+6b5Vmb1ncVk+It8QaZu4O
	 xeoNr3iUbLX+f9XIW1198Lwip4xmnzi4rHCwQLVn641vmEaN4v+Nz7q0vgYLIt69L4
	 I10EhEOcNoPlg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 13 Aug 2026 19:56:36 -0700
Message-ID: <178667619639.5897.18080046231006197967@lazor>
User-Agent: alot/0.12

Quoting Krzysztof Kozlowski (2026-08-01 12:55:41)
> Correct a few white-space issues, like double space after '=3D' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next
