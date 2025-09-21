Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03457199BC
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758471910; cv=none; b=hBr0nn6QtE4t0fVuLmZkdy3IIU5QWc5H5F1JeYNaTJNszaAYaXo6YPSBdPZQZp1NGoR8IJ65JoU1sbihFmKbksey259qX4Vzv/nE2iqM5Obk/FFKjQRco/v5dl4sMjsIqmkxJaLEnt68ZhF7g9o/aha3CtSXQJ/MAKmbGrIji6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758471910; c=relaxed/simple;
	bh=T9JqLTewmUpzp1OJfKf6FYT+qzF9twZfYc+1+MFwbns=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IIaAi4k0nRvNx0C0X5Z4cs5xl7Haxrkhx3xjlmCGYKiMk+mQCdD96e7ovRAxzd9J+wspFkJcZS3/DeGtexWW4nTi+VJRH59msckF93KrQeLUDvPVRmEMrIroxoTdR00Aw16BL+P1QIF+QfaZR7b68ltirFscfbP4JDzvoPvpHeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJ8IiKhJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJ8IiKhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5766BC4CEE7;
	Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758471909;
	bh=T9JqLTewmUpzp1OJfKf6FYT+qzF9twZfYc+1+MFwbns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oJ8IiKhJtTlROb1iPY4bymSBTzOt4iHwMlN82VPt3hV5sb3iYv40IvlHwq+Z7E0p5
	 3uT6ACJVpb2nhbJHQZY9GGQIST+pXrxzEbwIOHMJ/T/d0rlCcRyn3FUorKVHTthbx1
	 TIJNaIZ4xbPSUtCl+h9CKJpg65ChDBizkk9RPLPz8Rg4THV34TSgscVESAOJ1nbJ1q
	 Iw2P9LOvb7yH4u7RrwEeiAdmhrylETRStAoqM8+RfF1s0pJTnN1i69I1qTZjvaNzPA
	 JNmdnioSuwINEixg1bdWE70tEkNyozV1d4GK50yIH6sbt6gAbGOSCmfmw6b336ORbI
	 RPZVDp8XENiFw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com> <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware fails
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:07 -0700
Message-ID: <175847190778.4354.11122681024032617561@lazor>
User-Agent: alot/0.11

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:17)
> From: Stefan Wahren <wahrenst@gmx.net>
>=20
> In contrary to raspberrypi_fw_set_rate(), the ops for is_prepared() and
> recalc_rate() silently ignore firmware errors by just returning 0.
> Since these operations should never fail, add at least error logs
> to inform the user.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next
