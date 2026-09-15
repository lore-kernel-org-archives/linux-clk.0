Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FA2390237;
	Tue, 15 Sep 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486961; cv=none; b=dYYCr1yA3hnGLBV48oO1JDVJMywv4rGyH+AjGDsO9O3aBbXUXQ4SI3pU3u5aetL6Gc+v5RoD11KzeYrzq90ygSZSN0DNuGyjyE44jvD2q9uH853OqqtJag8y5SefY2RI5FPqUwWqQSx/s2JAONsegQfRdEQz7vm7HpPwJXrcFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486961; c=relaxed/simple;
	bh=7Vx16qxwEkTNfbzykTnvh+0c27LHNjH/X44JjJbizcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fomi+lpR4WfdWQL7rCfxDHcZ1WFC7ARUP085jBcHuSFU8bbsQOvKVVvcg2HqIw2MSWPS5r7l1uW7Kxl8JNzCwA4ADu7h6mH686vfqItUZeHSia7AAa2HwB/9HVaYAkK3JCnpaxJ0u0blqAtjcZyDhPO53Jq2ZIc8i0NxXyPj1pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmTD19Y1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmTD19Y1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4881F000FF;
	Tue, 15 Sep 2026 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486958;
	bh=7Vx16qxwEkTNfbzykTnvh+0c27LHNjH/X44JjJbizcg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hmTD19Y1PJoy/SdbWt4a2mLXPgWnUpHE1h1tBiQ6NGZZd6cCd3Dhw7qzbRzLCxlqA
	 lzzCSHyUCca76SFKQAeRwr4OPeXd3szV9vRefA4Dh6uzRA6KMi2kctNrbF1UPGHohR
	 lOrnsIMs+kHtfF39nNQqYkPAKrdNJRZjA/p5H3xWzfKLvuR+OBi1cB9mumP1Jv3Iau
	 fY66LyNP6d5eSUd7pMipafLAfLVLmgRT+hcBSWNyonw27jmRKc4RZqgRcKbWnx09W1
	 0KsrqjiHYkRSxVHRj+gS4iVx9qE6/5zIdtTwpSltWso5kEtD1RoV6Y4qCUpTlwYqP9
	 0DBzvZ2QF5bSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/20] drm/bridge: inno-hdmi: Allow the register map
 to come from a parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, vkoul@kernel.org
In-Reply-To: <20260915-jh7110-clean-send-v4-8-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153227eucas1p2c51b87dc8da5d9dfacd6db6bb7d6774e@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-8-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:42:37 +0000
Message-Id: <20260915154237.CB4881F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> On some SoCs the HDMI controller does not own its register window. The
> StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
> the controller and the PHY, so the parent device maps it and owns the
> regmap while the two children share it.
>=20
> Use a regmap supplied by the parent device when there is one, and keep
> mapping our own resource when there is not, so platforms that own their
> register window are unaffected.
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D8

