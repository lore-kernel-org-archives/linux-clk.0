Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3FD2C031E;
	Fri, 28 Aug 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925246; cv=none; b=BldqBX9Sog8bHyD1Xxd/UpAYdVPyl51+GZ1VdsjnhZNUIFu9EWg09vwKhPAlqAz0eZ9u+iU4rR4smMA893E9itYGjrHPinuUtWtASIg8pojskzeYiJB2c0iJI5rJHMAstA+TrtC+M2NhbSy3H2RIRtZz4obCeFJfjx8xWlWUSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925246; c=relaxed/simple;
	bh=mLpZyvcHJbhF+acLQ5W8TeqwwoCClYINwLWY5zXEipU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GoPYTS1RjPbGMMulYWQj+pSQYCR7fEgvxWlJV2q+PJIsNW8RCGZ5gwegdVDgr0mJml3I1I8qfTbDf37MZnPKCCDuE2ImNQ88odln6w1+d/Kz0lD6NxIiqBfw2aYDwsEUcSTSj067VTbkd6/Pt7zBGBGio81R6D6HiTV/Zxp7HBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QF4fewV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QF4fewV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F12C1F000E9;
	Fri, 28 Aug 2026 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925244;
	bh=2c8diSklvVUd6K6I6bSdgpwdYZU6SUVzQlMEjE+KPWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QF4fewV3m9gBHaINgD97JHB3uR/xyDcmpuJKAR5IGoBnglde8KYq9Wu5FNZ/ZDL9o
	 axes+Ku5Awi2vrgnlRXUp9jifxGsrIsFzgCIrgJzCMALs5LDxiPV2RjLC/rBoVtYWZ
	 ZXZ9xdX5I/dKFwfulnZLw+YglsXjur8c4ekU48lZhxVEY/HQU2FTweL+Itv+LNvb4i
	 CCQh9KxJegNhbxxfqAMrdZebY7bo3bl+oXtOo+PoCcIItd+ovh2rVrZsjiA8QEOEKJ
	 c7I3MP6ZJy676XVwqHpqbj8+S0osR6f1YlmYFZwo4lWD2IV5cEUZjId1nBYKYVl55f
	 rqeqZQWM6seBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/15] dt-bindings: mfd: Add
 starfive,jh7110-hdmi-subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260828-jh7110-clean-send-v2-3-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134819eucas1p2c8e2bb95dd957981ec5e60e1da03223c@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-3-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:54:03 +0000
Message-Id: <20260828135404.2F12C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string 'starfive,jh7110-hdmi-subsystem' embeds softw=
are architecture details into the hardware description.
--

commit f244c8f1868df1c7d5507202956114ed3dbd675e
Author: Michal Wilczynski <m.wilczynski@samsung.com>

dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem

This commit adds a device tree binding for the StarFive JH7110 HDMI subsyst=
em.
The binding describes a parent device acting as an MFD to hold shared
registers for PHY and controller children, addressing a circular clock
dependency.

> diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-s=
ubsystem.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-=
subsystem.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsyste=
m.yaml
[ ... ]
> +description:
> +  The StarFive JH7110 HDMI block is a monolithic IP containing both
> +  the digital controller logic and the analog PHY logic in a single
> +  register space.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-subsystem

[Severity: Low]
Is the use of "subsystem" in this compatible string intentional?

Device tree bindings typically describe the physical hardware block rather
than the software architecture. Since the commit message and description
indicate the HDMI IP is a monolithic physical block, encoding a Linux-speci=
fic
driver concept like a subsystem or an MFD parent into the compatible string
appears to embed software details into the hardware description.

Could this compatible string be updated to reflect the actual hardware bloc=
k's
designation without the "subsystem" suffix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D3
