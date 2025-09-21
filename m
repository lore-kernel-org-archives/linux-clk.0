Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C57239099
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758471923; cv=none; b=NKU9sTEEhefBnkrOSZhF26YyldDyH4Fn+1KHQXG2MWqGWqkVR+YKmJhMcESfc53jDwjQOQ5A5UmLz2KBO5As2o2yOFWBVxlCbO33VkZxj3r2kIuTKGfD3Y7brcp7BlvdJFH//90pvh9npT7QuHi2hUsziGMjiabWWgnNqtYbHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758471923; c=relaxed/simple;
	bh=OtNY3mZb+yYSBJf2rxALF2ewBk5OdFI056vRwJ4aepI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PI7EVUkAtGGkfPPdS519oJwaiDm5HUZkZLJPSpSSBBQ+0Rs1VI7OTnRw4aLhOwLt63ps6WYm1oygu7afpf7aombi5miEHupVvcOrd+61EKYZfZMAeY0AQs71ZXME3Qk9ly6WMKAlG0bNPbxqYWOOxSyZxNKTQlmYJztctpMDWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S27S9Jad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S27S9Jad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300F8C4CEF7;
	Sun, 21 Sep 2025 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758471923;
	bh=OtNY3mZb+yYSBJf2rxALF2ewBk5OdFI056vRwJ4aepI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S27S9JadoG9UKdmIkd4Bwr0qPl6ZUGqVre7SQ2mnHuVVJ1mqZx2oc+qo52g0vPyNL
	 Wohf9xmDPeyAk/dAWAIRvvgPs+E7onwrD/NS3ccl6bRG2+k3RlNWQGMYN8biB9FgPx
	 W+tSm1NseZKdwlFwDX2HIsNnhOQSKHVxwhc1t/0TytdvrUMznpPIRKQlrFDrhE/iNe
	 L2pJEhskt7wNu8fYRtft+wYdAY0cqztve762qMKpu+aEpuchJVgQn5pgHAvsd37b7E
	 L6d4FycfLOwQ1qpNcWupZGiijOcBAD2HqCDlwnVQsHPHqS/QeB7FcsH+coEk9GPyck
	 CjP1eoHxgKkJg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com> <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 3/5] clk: bcm: rpi: Maximize V3D clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:21 -0700
Message-ID: <175847192183.4354.13711226446879462833@lazor>
User-Agent: alot/0.11

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:19)
> Although minimizing the clock rate is the best for most scenarios, as
> stated in commit 4d85abb0fb8e ("clk: bcm: rpi: Enable minimize for all
> firmware clocks"), when it comes to the GPU, it's ideal to have the
> maximum rate allowed.
>=20
> Add an option to maximize a firmware clock's rate when the clock is
> enabled and set this option for V3D.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next
