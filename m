Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0652D8DB7;
	Fri, 28 Nov 2025 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315887; cv=none; b=pU7MlXlZDBCQOuCbbIt7TDpO8wiuC9WgcQheDrDcvmBdxgh0jXVct8yClff7OmNLdCzl2gyp/pnjTffDZ25hELiBKhHodWxr7ffEydhQhyP1bshtZIgJQ74RfiNuqYAxzEOsB6vcJaSyoQtPIs8siJiwA2gFo++BLqp/lBvgqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315887; c=relaxed/simple;
	bh=+GQlUIiH0V+o48w7NPRuKZNNZR6aTD5xmSINOd9ZLR8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iQILheqx+F9QfNKMg9GA1zp9f8ywFimzvzuzSJtUSijtH4tFvXXbUGoLuhb8bVLFbj1kuR4QGqkZDZhLB7oUhuCLQPZQwc2OB/1fbqlhY8Z9dHwFz7oWXvKspt+7XaghrzkBsyxe2I1t2nSPbV6fO/CShi5spmxndDlGJwBmkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=FFzNu+W4; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="FFzNu+W4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+GQlUIiH0V+o48w7NPRuKZNNZR6aTD5xmSINOd9ZLR8=;
	t=1764315886; x=1765525486; b=FFzNu+W4AjKZkw0IepVYx7ix0FuQ19hFKHpeaHjOguOL03Z
	08TVvHcqjmoSnT3xTFt2FynIAUmrVILSCJ+5aecvMduQezfcfckO4QQzAEm+W6ujzId66wlaY0ofn
	2BdhAq4UjFL+irLDG92My4KZv+zFnnXuNED/v87kQK0nAgLVBXwwg7Cd3QrKCnAa4bKwv/uTJP/XC
	5EqFHFe0Qh2irttEa0xlRTdxH+z8i1iy91fm+19O1QxSWnMXjbwSKl2f64FRypWaGqTtc6wlecVht
	4odicoAW1piQ5BbQ0C3oiUaifH+FxfoXS3CmPvXAy+lehYOHCDlYo5NQuWWWOgxw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vOt9k-00000002TRo-3IE1;
	Fri, 28 Nov 2025 08:44:40 +0100
Message-ID: <d3340d34175e0a18675d7460576c7fe7a2623e2e.camel@sipsolutions.net>
Subject: Re: [PATCH] clk: Disable KUNIT_UML_PCI
From: Johannes Berg <johannes@sipsolutions.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, David Gow
 <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,  Brian
 Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Fan
	 <peng.fan@nxp.com>
Date: Fri, 28 Nov 2025 08:44:40 +0100
In-Reply-To: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com>
References: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

>=20
> commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()"=
)
> causes clk gate test fail. Deselect KUNIT_UML_PCI to avoid the failure.

While probably _true_ that this "caused" it, it also seems a bit
dishonest to blame it on that without giving any information as to why
the clk tests trigger some edge case or so?

FTR, the warning only happens when you pass an address to ioread(),
iowrite() or similar that wasn't obtained from ioremap(). Which ought to
not be valid, and I'm pretty convinced that a unit test should never
even end up here.

So no, I don't think this is a valid change, I think the clk unit tests
that end up doing readl() in the gate code for a non-existing device are
broken.

johannes
