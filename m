Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D64A0EF3;
	Tue, 15 Sep 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486557; cv=none; b=AZmq1Z4AIKLwW83tvzY9Jlx5eTVrOkYO/RHW/4Vh34a/rOjI963t5DDuE+SnzTNgJiejV+kGRnjghzR2nGvFuKZ/XN9Ip4tA6jvuzvM6R3umWpdO77wfRfe2F3E2Qzr/dOAeQURUCgrEMboXoJ1WHwkSf2+9qAK5wK3e6UKTghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486557; c=relaxed/simple;
	bh=fca0YU5wZJuYa6HE60kkyvWGAmizplbtlVsuBRCSgX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sceXqLdJRJB0Py/vMZ5h41IDtmmvSAygB8wAHKYYzodAb8D0Zsp24VSRZpqCd1FjIUw0YPGOAQpG0jyHOyUydAkS0cZag+ssbwyPDfk7KtUn7dDL/Ds80DmEdNRQiYphukJAbDlyrUnbpqxUwIoDC0ODUeW798s95jOj03KYrlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsVllUNZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsVllUNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101771F00893;
	Tue, 15 Sep 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486555;
	bh=fca0YU5wZJuYa6HE60kkyvWGAmizplbtlVsuBRCSgX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VsVllUNZS+5kLKM+n1mG2KHU6cnK3h2KUvVNUhsfFd2Ko7dgoep9CXHnfa0zB91Te
	 hkrtuX2ENZH2Fhac0m/fU3Ma2a3mxwCpwkk2Dq3PaVItQUgKA4lQLU/miwuCtyYBv2
	 +g3Gb1jbHNbRTfCo4wHRUDBOf+DdlERpfdSlFlyA4XkqBq3O6VbzF4fwwPCV37TRc1
	 podRWDCorpjkP/OqqpPFtmrD5nt4pxqAdQNo2KaPp5jGjMOWJs1N2ICgJRCwz3zlpF
	 /O39RtoJwkGRx051E++XcfqVwUU0KGnQp7M+Nui1LPKLKjv0oMP3KBJzJVY/byeYFV
	 +ie1Mw+r3Atog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/20] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, olteanv@gmail.com
In-Reply-To: <20260915-jh7110-clean-send-v4-2-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153216eucas1p2388b49e6b4c064ea49639d21f987e05e@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-2-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:35:54 +0000
Message-Id: <20260915153555.101771F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
> (DRM bridge).
>=20
> This device is the second child of the starfive,jh7110-hdmi-subsystem nod=
e.
> It consumes its register access, audio master and audio bit clocks
> (pclk, mclk, bclk) from voutcrg, and both the pixel clock (pixel) and
> the PHY from its hdmi_phy sibling.
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D2

