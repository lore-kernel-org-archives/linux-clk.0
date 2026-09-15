Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970614A6CE0;
	Tue, 15 Sep 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486515; cv=none; b=YRZHY9FjTk40bPE0pCq2CA3Qy/uCLBAQfShCivXEihJlYS1wrNclMkgAhIZUl9qUF6WY9J5rw99c9nMI7OPr0fjUHUDr8xtdyxuZ7GlGPBmUnrxAaBWwT2cspeAhELlBvcZ3De4pEK+rJdfe3H1cNaOdk+slS/XbF15lR04kV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486515; c=relaxed/simple;
	bh=XSb8dXizqy5/EqI8CxSB6VpYY3eCdPsC9ugr3cwl2Vc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZC9rD8VTgw7Pq+a/9peak2dc4VjZIpcP7xIemzp71oAkc80yF5i9+70+NhIHeq2MPLpFNBuCOaShhziSrCJOd7xjTqukPtCidm9zJI1MYL4RHeizrinnggMXaI/4zQM7wawPmBJbVOgey9BHawtzVK/sA5vwqERPU6OB9YXOAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9AAdEaY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9AAdEaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1571F00898;
	Tue, 15 Sep 2026 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486513;
	bh=XSb8dXizqy5/EqI8CxSB6VpYY3eCdPsC9ugr3cwl2Vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9AAdEaYvscgYzGfa9JvOhjKbnzT+IN3imErOzjDuyz0iJhJcHcbJyREaNre0XXFJ
	 SGx5nqCAs5uR5DJ0AGfp2sXm1ICyAAEeVL2nMIJ4hQaP4PYABSYWBjtdxudZJ9+KDH
	 Ha008Bcwkm0ew36LE9r23SgomnutdEZRal8qcy267B5nLDpC8ZuyYeFl/dPvvoW5mM
	 7FaO2aNsmcl43a1a2tzeyUGFtHqmrL1UrkpF7PruvQpp5Gi5bMQ+etrEg4xuAYh/7i
	 waEVPF+NL0fFo9yqRX8dqV9UG1Rfb3/HBVLCsaivBeRWICBy0rgIf9wuKGToGgNAFG
	 eExbmj9Ag+raA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/20] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: neil.armstrong@linaro.org, lee@kernel.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:35:12 +0000
Message-Id: <20260915153512.AD1571F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The video output subsystem has its own system controller, documented as
> dom_vout_syscon. Among other things it holds the mux that selects which
> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
> to reach it.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D4

