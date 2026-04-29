Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B323890E7;
	Wed, 29 Apr 2026 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434415; cv=none; b=bEn2UMEqLWvf4PqbSy4SAqgLJq2Lf9s73xxlmkv1O8XB/sYOubpVwl9PipywTmn6iy4DIU4UmjypFxsacBA95Er2fQedsS5XevljAtoIeOUzptKacB422BfS250zmWJaOrOwS41xXpEmzwZfI/vVryEv8pkn/Ts2XLH9pudgn6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434415; c=relaxed/simple;
	bh=p7x99D/zvCW06oI+oYSXWn9Qz4v3DmIovPsC7ckmesk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uekgf8xGMK4E82NY/Tw0RaCQfJKFZuvREh9KOWqP8TUHrulTLey0QNgXVspKkRO/6B6z3Ay7YdTf//QzLcC+rax1/+h9oGd9Ih7jyU4ows7/fbKJ27XSaJCsI3tlzZaHifviEZgdDRsv0yQPbBRa0qp5Fn7+1uhge/K6A+MhevA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEpYFAnY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEpYFAnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB565C2BCC4;
	Wed, 29 Apr 2026 03:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434415;
	bh=p7x99D/zvCW06oI+oYSXWn9Qz4v3DmIovPsC7ckmesk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CEpYFAnYFUeaLE1fbLaMsj3c2MXlIwEuuQTPTcEt28CjrOopJcJxs3oDC2OibfWHC
	 FZuN+MgiyV//B3IlU+8ChrSF680eexQ8fLCO6We6iGbFt30fBzYnAO8IwM+ubJLaeU
	 uqyhRKhJl03B24K01zC/K9O899sPE4D2DRD/b0McVTQaHTlKvn8NzfDt+ytRxJxCnW
	 NnJS62bNmYmEa8us+voA0WIvFUHMm1UaOGQe7fu/IUQ48JzRy9c7uRZJZB9wtjzXjt
	 TcYfh0almkc1X3eij9eZgBlSrjTsPmvd5U4GLrzqXcpXdmhQaU3B2RsnqWPSDb+ZTZ
	 je4JniBZOMb7A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260225-macb-phy-v7-1-665bd8619d51@bootlin.com>
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com> <20260225-macb-phy-v7-1-665bd8619d51@bootlin.com>
Subject: Re: [PATCH v7 1/3] clk: eyeq: use the auxiliary device creation helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Date: Tue, 28 Apr 2026 19:03:59 -0700
Message-ID: <177742823969.5403.2827018666576647707@localhost.localdomain>
User-Agent: alot/0.12

Quoting Th=C3=A9o Lebrun (2026-02-25 08:55:05)
> From: Jerome Brunet <jbrunet@baylibre.com>
>=20
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>=20
> Use it and remove some boilerplate code.
>=20
> Tested-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-fixes
