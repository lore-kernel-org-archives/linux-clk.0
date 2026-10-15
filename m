Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5B52269B;
	Thu, 15 Oct 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069071; cv=none; b=dnHaBpkEMLT+8eS9aPVh0Xxay7ORG/o/uIj0UiGMIfEnLPnkE72WbHsPL5s9SP2gRCFl7L21Ws9M49I+yCNN8ntJIZrX0M5aMqvs4wWoEmiIO2nzsAIsc1WEsPvdOemHIyL6FVEnEbe6FmUfI15qTurmihc1DawNMlzEAhfBLdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069071; c=relaxed/simple;
	bh=FuTzkRikDYM07/3AFRFXJBoANpJlY9V7Kn6FI7DM++M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B+XYrMIz5bQuetr0gBfEOpwTnjoO07Zzea+UqA/LDRFWN9fbxC1KsNf/QOFYj0QwKhsqBIlJpkyYUBOMH7bZ6XZUBWpdeycoNd/HX/5/p1KJnY+neGh26aP4W594XxGd1Xh6JafmK5iASZzTeIQP1pJjeHpLSNcU5PF4aJDey7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PiXT3iEa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PiXT3iEa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C5A5C1A123B;
	Thu, 15 Oct 2026 12:57:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A51E60360;
	Thu, 15 Oct 2026 12:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FE0D10328C00;
	Thu, 15 Oct 2026 14:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792069057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FuTzkRikDYM07/3AFRFXJBoANpJlY9V7Kn6FI7DM++M=;
	b=PiXT3iEaHEYZhbRCYLKOXhCY2KkN+14ckAJ1tPCCekWVM1x/bMk6pEIsUsB+7devevhGtv
	jKnvuLYBFDfZJzTfzUVNujrmffzNzrOxDV0JDhj5NPf+ZXM5qUxYcguCfixBEtQKmCSlRU
	xg1bVril0daMImzashO+L1rmiO27+fpalq8GgQ4oF+dUgAnCkRYhK6GJft9m7rGhxDO/6o
	aUFdr1ay4lUFhKd2jSoEq1X2toJU2mJ9reOlH99T8ls6VK/5bP6XI7GY1+wZMfARzSLn2q
	4qVzFm06mqrXkUlr/Hxh7yUlaboPR6QsvXGgfJNWn5xKbPdAPO2hU92ODitOzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v9 01/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
In-Reply-To: <sashiko-outbox-172810@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 15 Oct 2026 12:34:43 +0000")
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
	<20261015-perso-ma35d1-upstream-clk-v9-1-1f548fa2002e@bootlin.com>
	<sashiko-outbox-172810@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 14:57:35 +0200
Message-ID: <87o6cvunnk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 15/10/2026 at 12:34:43 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] clk: ma35d1: unmanaged mux clocks leak and cause UAF on probe fa=
ilure

[...]

> While a later patch in this series addresses a similar issue for fixed cl=
ocks
> by switching to a devm_ variant, ma35d1_clk_mux() still uses the unmanaged
> clk_hw_register_mux_hws(). Should this be updated to use the appropriate
> managed devm_ variant to prevent this regression?

I should have converted those to devm_ registration as well. I will just
do the same move with the muxes than with the fixed rates since I'm
already migrating them to a slightly different API.

This is the solution to both problems raised by Sashiko this time.

Miqu=C3=A8l
