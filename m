Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF03C345D;
	Sun, 27 Sep 2026 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542763; cv=none; b=SlGlq5Ys+x5GQFSl7bNSmz2ibf0WdMNiHoRZH2GD8Qof8ig3lSTqMjPoP4DP7tptlk+tWmmVYYwkBCzM1kGEFMOsc4ZIZEEISz+A8MY1Okqk4fNj0+Y6P9grL5dkfE1Sdw0sYylfISW45b0iERM2X42bulktXDOxeGDsJxWy0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542763; c=relaxed/simple;
	bh=bjd2xsMHgt2f4k8YQWXYZtZZfNnBUY5y6vjs+uRTKhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RYHz7IU4wexuT60cFckT57WolV2vUY6icvCX0hcPLq5Cd9Viy5YyjNuBjO0XrpfEawUp/YQPrF4Mz0qakCulkIIYpVi4QMk6nv73m7zDs/7SrvMNZsTv/ErMBMhiVFosjs6NHwBMX+xDYcEDNsdOVTVyNIluPm56JL8Hd1qE2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFNVVNFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFNVVNFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B701F000FF;
	Sun, 27 Sep 2026 20:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542762;
	bh=bjd2xsMHgt2f4k8YQWXYZtZZfNnBUY5y6vjs+uRTKhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XFNVVNFnUA5QwiZ1GCqUdNT+Xna9529xJ8/ifBHbaeapY0ijaGVaK85f2iShB76Z9
	 EK/5MRDL6bh+GMa3sWXwluLNcQHuRjaSpsB3FJW69Gpd4zaGv5UbzUMEg5DyL/L7z+
	 PUmCxcL6F/MkgRrzltbstkMCUwnzfITGwZm3hmNmNDKdYEoyLLZ9eEY2DRhXoyngIT
	 O/mPVt7QcOfN6kkWgE/VahQvXg4xU3+zF2lmLmzUkDeI+OTUdzPeeKsyrRb1NC6ZDh
	 E/vWLB5qZl3MuufcfoW3vEpqBctY9DIi1Lw4MRgpZtQqAaRN739HiwPgOK0MSue0ra
	 Z9q/aiTSepRGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 07/13] clk: zte: Add regmap-based clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, vkoul@kernel.org, lee@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260927-zx29clk-v13-7-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-7-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:59:21 +0000
Message-Id: <20260927205921.E0B701F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D7

