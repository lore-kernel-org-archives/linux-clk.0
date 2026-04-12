Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075F1E834E;
	Sun, 12 Apr 2026 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954221; cv=none; b=JsVYDsx5ZCBZrGl9fvbpPnRWeRuENKB+QFEpzyW8e9u0lcJN1144+kVF3uoIimCuwtRV19x9nBplbB0lhalAjUnx3WGvfiIjcL/SalhJDhhRK1QzVbVTCw+/WRlEFRTq2euwr4E8TQkGytJdXFY5v4uNGTkzB2uifGVvbLO9ZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954221; c=relaxed/simple;
	bh=QTdPIOaoOChVAomUseJWzm8x71sZ6ceyQujEQSy1rzE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YCtBRDWK/a2ICcicz6NK/+gJB35qmqHMfPBfrksUW20XmWDJ5aVWqOxnCUUrwr4Siy9/68+v9eHlUf5efta7sPGUdXLKJ6kT3yhjMPmNB3jrEohnMRuAqRq5SXEyCEasyziHoQUgXb56yl6tBNngx+80sn0uWM+CEZc2V5IDepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTRAdwLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTRAdwLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C83BC116C6;
	Sun, 12 Apr 2026 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775954220;
	bh=QTdPIOaoOChVAomUseJWzm8x71sZ6ceyQujEQSy1rzE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jTRAdwLvH5xGiPWb3exhmlsyBp2obqZ1bATjFEtjyazvx7lJYfq+21vqok5991fCo
	 oA2YkaXnSWpxT6JN51Ed/H6Ga2e2a0N3YM9X8lRAQFIOQAskUItyV2OgildNsmf/kz
	 iBFkC7MOo+jd2fxtZXJsd1eFss5oKj8fcjDFPmN3zFcfBU/O5NO+PfAVNRDKdNvP3p
	 ozuN1NWx4/JuUl2+YgsiwzdwzTGPVvy10yInfB4MAZyC5JoV2keeYyHlAgSBnWmb+u
	 hDwlngeiEgnSRW18etSzoYRy43J+81OIBsUFDxL6wP6Pn/8ms3ulE3+zLCSG2kBmQq
	 mFYWf22o0pTcw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409002952.319668-1-marex@nabladev.com>
References: <20260409002952.319668-1-marex@nabladev.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: clock: fsl-sai: Document i.MX8M support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>, Conor Dooley <conor.dooley@microchip.com>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Marek Vasut <marex@nabladev.com>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 17:36:58 -0700
Message-ID: <177595421819.5403.9867255438145036360@lazor>
User-Agent: alot/0.12

Quoting Marek Vasut (2026-04-08 17:29:01)
> The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
> shifted by +8 bytes and requires additional bus clock. Document support
> for the i.MX8M variant of the IP with this register shift and additional
> clock. Update the description slightly.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Applied to clk-next
