Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A21F4C8E;
	Sun, 30 Nov 2025 20:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764533186; cv=none; b=FiSy1xfgyyq4qxwNCKq4ij43KpBTPw2QU7wQISUAsNYHbyVpSQZnHYAWCbjKw3VcSwlxaIYrjmQCqcJnltqXpld+Fl6zfjgGJlnim9n6emV+iJgwiP4Dl8jEjGsqM3HxTDQoho59xsRMmt8+IXKFCfrE3onBoasSq+IPKQWkDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764533186; c=relaxed/simple;
	bh=IBSN52KehuzkZVy9q9MNQGUv79e4ygajumwya/KjrQY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dqivNjMdoUSZI3AxWmPNHu46tcAo7+MqO/rSIX5yj2k1+B0Qt1tIOYZn+EMMk/hZb45kEbYfN4lbGDw22W9vEMJuh0tTU375B2wztCkrSE6OJLVgSqa/qnbVYJNgDFkUGfQ+KIU/DGL+8s5aIOVLNqYbpNAMx4pr6t/BUiNm8Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xcv4zONg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xcv4zONg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128D6C4CEF8;
	Sun, 30 Nov 2025 20:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764533186;
	bh=IBSN52KehuzkZVy9q9MNQGUv79e4ygajumwya/KjrQY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Xcv4zONg4bOWmL+MrwF6a6n6o9stoHXGJ+Z9+/KBFbaQB4ZU4Vi9t7DXkrO9VmyYy
	 zHtPL9D4NrDHU7YyL8UV3s+ENrBZlYVyzr8+lJvxP5WYbu1sUWptd5IXPezCKL62Hi
	 bpmd3WUOzqRgPDSKSoTt4MKICBazXvisnjMfWxxfHpXvO/ZIshpJT4TprjGfaaSxZt
	 nkRoyEcHfUyN0PHO1Vm5wQKkFB6VYAX6pk0o/CklKfpPioc+BZoskWiLf9mCM/9egG
	 ebUIrKn3pzO7tiseheDRGmn2WjbtHUmBglv+oYXju4z1OVViiW99PzXoWxOafGYkby
	 ckDA3bohlEk3Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251127135325.2390-1-johan@kernel.org>
References: <20251127135325.2390-1-johan@kernel.org>
Subject: Re: [PATCH] clk: keystone: fix compile testing
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Date: Sun, 30 Nov 2025 12:06:24 -0800
Message-ID: <176453318422.11952.5312023792967316806@lazor>
User-Agent: alot/0.11

Quoting Johan Hovold (2025-11-27 05:53:25)
> Some keystone clock drivers can be selected when COMPILE_TEST is
> enabled but since commit b745c0794e2f ("clk: keystone: Add sci-clk
> driver support") they are never actually built.
>=20
> Enable compile testing by allowing the build system to process the
> keystone drivers.
>=20
> Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Applied to clk-next
