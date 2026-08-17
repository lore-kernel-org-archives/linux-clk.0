Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75B439F9B
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984200; cv=none; b=cxlX6y8AawiEnd7HJLD1s2adbW5jmgMaDBWgfcpvT4QN2sCOcaBJpcQ3PG7Bkq7pTBfENzjVvdM0qULJmpH01ZIcm063URPkI5urWo+h+KPpFyIBeSf8i32ZoFYoQv6dsepzxMzWvyMHEVf4ZCm2TBGbNA7tWR5fcnKFMFy+ves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984200; c=relaxed/simple;
	bh=bVzCPV4wjDxG9wPLAJM+a71rr0A9R39LmmZ/0gFJN7Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VGT6144lmENAaOosvBsXWFqcjg8/+ApX3m8rsoCfJ4Y9ZePe1xV4ro2tFDr66DUMDkPxoTn7/Nu5uwT0Sw44vCtw6rc/9YssiJoSZITT7W01cOpcqImE+qVwn6urgb97PdSkihq2xQodN5+5Vfr/xPL1TOIJlzwqvHe0+Q3AraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKgYAM8f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKgYAM8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4253F1F00A3A;
	Mon, 17 Aug 2026 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786984199;
	bh=bVzCPV4wjDxG9wPLAJM+a71rr0A9R39LmmZ/0gFJN7Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=YKgYAM8f+ENTUe+/9NRXbZUAdOzYyZjHaMrohhFoGVtxN5RZOQ8oGpOde9cwfUH27
	 e/zPzIxXFw32WvUjKI+UJ+uZ3/ExWYVzDV8OZKhpVnbN9VQotDErCXy8JqElH9g7WJ
	 1c/7BDeSaCJVfBHl9oAr2Vxrk67m5d3EpVGE4HkIpDkmAcprevPaei5f/JZTop+lmD
	 QLqhos+xJWgoTV6gYqtVLgRB9TYHJ8IKOpWNRoA33jjSkKDplqxWIBxof6F8bmLItd
	 wkzc3zYJgTCxFtFPzVmRQeRcmqeztYKVrrUFQFWVjVFCn3P6moMxUC9CzZWfaJRTdM
	 AmC3bmZmORu5Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260729121640.3864006-2-ukleinek@kernel.org>
References: <20260729121640.3864006-2-ukleinek@kernel.org>
Subject: Re: [PATCH] Drop Michael Turquette's clk maintainer entry
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Mon, 17 Aug 2026 09:29:57 -0700
Message-ID: <178698419721.5030.1912996108307711223@lazor>
User-Agent: alot/0.12

Quoting Uwe Kleine-K=C3=B6nig (2026-07-29 05:16:40)
> Mike wasn't publically active for the clk subsystem since years. Stop
> pretending that there is a maintainer team caring for clk.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> ---

Applied to clk-next
