Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B314B296BBA
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 02:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406947; cv=none; b=mm6B1+KR5kQGRk4hW4/6XShGj49m+S/ky/xoW1z8w6XERiri1pK1lIKNIJoBcCGjxLEqFUwCRv8IhpQWdjQcg6vDE5s2I8cZZq+fM0DzGK8d1OcQh+srn8iczTlVVhp1kobtcibHaKUQRKrSMTH1le/0q3q/m/rE86eGh4b49qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406947; c=relaxed/simple;
	bh=AMlrKIWE1KM4Yad6QSZWMlcL+MvR+08LGf01fWoQDYo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fnemt1beUWdoZW/+LsUMQ3ZsS4cLIP+1M70FpIyBJ/T6LJsAGsOrIL8qZ8g2nX32/u0/rENWMlfnhz45zNPcnqFt/fITyJ+sW3j4qE40GwAy0sDc1jmN5ADvARenhcOuoyO0n6LmqQV/tJUul+JnClixcEoTja2SRaTGN8tu0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ght6Y8kO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ght6Y8kO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB5BC2BCB5;
	Wed, 25 Mar 2026 02:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406947;
	bh=AMlrKIWE1KM4Yad6QSZWMlcL+MvR+08LGf01fWoQDYo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ght6Y8kOUfC/XhylkChbjn7EyL/6UF0fwadCVcpSo6Xcef8SICFwJAqK1saq9sW5b
	 ux6z2CK2Zf+D+p4sKBbjxw5EbTTJyzIM4bIwDM8KlPA9vm0DZvqIZW5pl1GiLlNs/I
	 gc5JPQkPBQ40hCBnszgS0CcZU6kPGgEmX3SViBFKgyLrCeSSe+ZfnNVMW+Tscj9MGu
	 T1XOr1rUWH3Tiwolds7eWcK//AB927onwFMlxI9SrvuPW4as18ihlbo3DyR+efGzT3
	 l9uEUzasvSHRXRvvCJUxoKRePILko/TU5ZsVE3oyMRw1Or2dPAQYIkGV6BkdWowB19
	 N+uUfYVLjkNdA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com> <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Chema Casanova <jmcasanova@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Tue, 24 Mar 2026 19:06:48 -0700
Message-ID: <177440440896.5403.6955660705156176314@localhost.localdomain>
User-Agent: alot/0.12

Quoting Ma=C3=ADra Canal (2026-03-12 14:34:23)
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
> Rather than pushing rate management to clock consumers, handle it
> directly in the clock framework's prepare/unprepare callbacks. In
> unprepare, set the rate to the minimum before disabling the clock.
> In prepare, for clocks marked with `maximize` (currently v3d),
> restore the rate to the maximum after enabling.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next
