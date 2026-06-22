Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB039479B;
	Mon, 22 Jun 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118907; cv=none; b=A2MDaVVq5pzQJKZEph5aaq9G+j7BkZBAMU5DdMF3Ep1QzITK7IFDuqLUm9cQgB8BdmN5yb9yVn6L3EmbB71cxhHiAwfdsXOrVVXXvOacFEK9Zjt5Ux8gu72qtNNy/e0+OD68ilqWTuZ0Y1TzYseI2UDaVofF4xP2RhFCkyV+/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118907; c=relaxed/simple;
	bh=rPDnEmXHEc2v4DI/oWtyKrtEfMWniB2PbkMNFsj9G1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/5UASbo+DMXfDUuscFhb6478WVS4MPgpEbY56Hi35uz2ZwLPnatQYOnFQWzd31atGhCTNGtiQyrK+X8JrCOUUUU6bIMnMKPBS40BORdfaOuXd8g4DvS4vcIgmjJncoxpEXE/TN1GZeKX+cY1rNdH8O396ysAQxyGTF5R5z1404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYGcjHAQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYGcjHAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DDC1F000E9;
	Mon, 22 Jun 2026 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782118905;
	bh=//Q2BswMnTN5Wfxgn1eprSUPN/0KSr0VWHHUiHGtYxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bYGcjHAQouBzYOga14uCNQQIf9FfQV3hIuVYk7CN08n1jOQO7yw9l8C0IsxUyMzoS
	 tfGJdFkmg6gYNqycJY9Mf2gNfENHzqANlkRmO63O0tjDyB7571Xjm1D9aTvOyfvxz9
	 ENAb2OKtIlnANWkjP/iNb6ubPcWkT2RaukSyIj1UkpIoMlrWz7PFuvke3M+BvBAGT2
	 hGnwUn3HpH9Wr2q9tXm/bigBPBoFlbr/FXYmXdJbQFjJmhoOGqj5YT5iIED12AneF+
	 X84u5BOCHAK1jDlpvIs/hg0lgamArAFuKHFfC87jt5VN9BSXfM6YtAXZS/c4v5mmFd
	 Hat6cYhNf5i5w==
Date: Mon, 22 Jun 2026 11:01:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: soc: cix: add sky1 audss cru
 controller
Message-ID: <20260622-handsome-kagu-from-jupiter-8ebe05@quoll>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622022520.3127103-2-joakim.zhang@cixtech.com>

On Mon, Jun 22, 2026 at 10:25:17AM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU)
> groups clock muxing, gating and block-level software reset control
> in a single register block.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 92 +++++++++++++++++++
>  .../dt-bindings/clock/cix,sky1-audss-clock.h  | 60 ++++++++++++
>  .../dt-bindings/reset/cix,sky1-audss-reset.h  | 25 +++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
>  create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-reset.h

Both headers should have the same name as the compatible. I already
requested this some time ago, I think.

Best regards,
Krzysztof

