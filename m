Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD64C39E162;
	Mon, 17 Aug 2026 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984651; cv=none; b=GwXjTEUZMAdI/3MT+QkFp0XFlqh8WFTwkyVnXr+rx8wCc4+bgpPNKzywBOekE73C2iYbMn4CjkkKAOjw3TREqpCnN8LqChnLlv2+n2oHOHVL7hGwiredqWDYeezqPSZCAwtlfCC2hCkKQOSEvFT9Fuef80LsvNcmo0Dcjb7LUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984651; c=relaxed/simple;
	bh=P5lmDpHOO4rhkjggKbW8gdsPM1x+hlNL8EyBq0gxxq4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pNxSQLTf386Q7DuAxYea/vB2npIw24hjr82BaurUdb1WEKo7h2KoLFLX1oHlvdIWlLQQ5xm5WMNqvolwX59OV4jrGP7Wj1cLTWAzwZ1WdcRHgpkfKbB3au7CNU9AL58/XJm6zu6lNAd4zrBtO4J2NrGWdO8GEzglR4IbA9e5vL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRkxfHzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRkxfHzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422681F00A3A;
	Mon, 17 Aug 2026 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786984650;
	bh=P5lmDpHOO4rhkjggKbW8gdsPM1x+hlNL8EyBq0gxxq4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=XRkxfHzWgmMgjevAKHm45KOU5fJG8/sAlQjhyfqZdIyIOLmS6JTnq98jN4zaqTwSI
	 Q5pqBLOK3u6jQcZwRgYT7C5OC/dveYDqWnZfpWEDk9wL/G3KddihLJwmBVQZN/VlMY
	 azaKSt7N7iuWXfVS8sLnLgVS3ETIuoVOqN+hVEDnQukKcyokqCudcyTH7AJL7Nzr8J
	 e2R1NWacXDACqMyXCPzsLqpARui0RhM2eiLhqiAHT1ZDPQtrA46E17AXjYes1lBbyS
	 YXrL/28zZD6yXnz/fjLF9I4BXiceoDsBIz/UP1myJ6Uw1GrpRLvfL3l2Sj4uYJ/aal
	 nU9CwPLsT6C8w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260814-clk-next-v3-1-6f7f1410e809@baylibre.com>
References: <20260814-clk-next-v3-1-6f7f1410e809@baylibre.com>
Subject: Re: [PATCH v3] MAINTAINERS: Add Brian Masney and Jerome Brunet as co-maintainers for clk subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 17 Aug 2026 09:37:28 -0700
Message-ID: <178698464801.5030.2102940835263591905@lazor>
User-Agent: alot/0.12

Quoting Jerome Brunet (2026-08-14 09:27:49)
> From: Brian Masney <bmasney@redhat.com>
>=20
> With Michael Turquette stepping down as a clk co-maintainer, this
> subsystem is big enough that it needs multiple people to keep the
> clk community healthy. Add Brian and Jerome as co-maintainers.
>=20
> Link: https://lore.kernel.org/linux-clk/anW-jTldkWSJK3wl@redhat.com/T/#m0=
ae01b8dd23c452d82f34b61844a8305977a53a4
> Acked-by: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

Thanks Jerome and Brian for stepping up to help! And thank you Mike for
all the work over the past decade and a half on the CCF.
