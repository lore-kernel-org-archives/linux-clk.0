Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258E2F7EF2;
	Mon,  3 Aug 2026 22:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785794921; cv=none; b=Q2ri3bf3G3MId0g+WeAS3Hh2OPuMY6ub5aekt1zh1fNZikS5MnXNzcK1NfXq+nDIwBm3DoUi6cYAzZ3IOO1FecDp4J17TuG9XsQTt+V4MM+XOGdvjmWCjuWVNrqTMwBIF6jzkgLFz3QnY1/uOBDpwGBzdGRdS2DIreeHGELAPsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785794921; c=relaxed/simple;
	bh=mjUfvBBHVgEAaKakm0tCqx6XE/STcnUwYsy7FmK9Oyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjrZ27ZYhvY/IILEvG7svegNqxjo5KMUMhhyBMKptxRJtEWQpcR4JZ4QRlH8fCqNV1vkUueZkWnHuAkmpbgPEcdxcraTt5TPK0oAaH4TORNLAbF+RMiU+A1+WpmUcNrpPnYheMsMTcf9BrHe73lWpYncI5VYgR44iEcReUMGCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwtLhuwO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwtLhuwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247131F000E9;
	Mon,  3 Aug 2026 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785794920;
	bh=pOkwPu99J/c8FYqsxD1pbfrwC9HOoyUrYnu/MVaJLvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OwtLhuwOiVs73G7Y4JWPNUivl9tgdn+T6ivWZogNaSp9BcMJyjfcAWpWHgPxsLNgi
	 B8p+cEQCvAFbnNyRrZGuWx7YyGfaOfmB/Xx3Fr/6cD1/iFRx6TpykE/7KOA7eZvK5w
	 bdXVA3IDSeaFxKhcmrm4yu1ZjoC2AmBo5psySGtCdgEv43uu07EtSQG3C9l/hFs2Ru
	 YahCRPkkjpmev62IkWM2RdiDIJxtQtv8kWnJRMZ0ffw6AeZC7Y+ZnsKTWe/a7Cx/I4
	 C3zvgys/u/anXvT4T6rmxWfXD3p0i9PjpaARPn+3PzUBYMl88umUFrkhzNbHgex655
	 f0b65Qudsz2vw==
Date: Mon, 3 Aug 2026 17:08:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, linux-clk@vger.kernel.org,
	goledhruva@gmail.com, Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	m-chawdhry@ti.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert APLL clock to DT schema
Message-ID: <178579491923.711351.1132944194362014733.robh@kernel.org>
References: <20260730083019.29998-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730083019.29998-1-egbostina@gmail.com>


On Thu, 30 Jul 2026 11:30:19 +0300, Eduard Bostina wrote:
> Convert the Texas Instruments APLL clock bindings to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/clock/ti/apll.txt     | 43 ---------
>  .../bindings/clock/ti/ti,apll-clock.yaml      | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/apll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

