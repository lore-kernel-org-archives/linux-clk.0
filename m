Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587190;
	b=BJZO89ZtkiEVU61aH2drwrcGLzmMgGlrBcAvAlyAGRsJiYYq0+q7Ig8TnE0+PWlqpYT0
	 JbfFg8Ib+fBgdLRkAvbrl/DGGjMBVJ5wYwlqXoa39bfsPoDYh8ymAvZLCNxJXIionQnsz
	 n8yWDjNbHvH7tqMsSP4/6pMr5KZU4g5Y9DKLrvvNBrtcemifLo9OS+EMfs52C0jbJbHC5
	 S59yE3YY3/OZDNSAKvxEx0xchjAUPBGLligQWaEYz+PytI/FK/1YDZ+y97lSkLgpwi1Zz
	 7awdR5spP5kWJbgKWkg2ydYsUoHuPayRR3kc3Un8WpdId0C/Iq5mCc2m0cVZoXrAUvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587190;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=on8VJY5xGeaa8ViM2oo84YYTFOdL+M9b1DqhNX4XCi8=;
	b=IVzsIXnyVrj6Wl/8ISieKPo/vxb/kB+WCAppCLKhyY2Zxv4RzFh7YJmvgFxbjx5PONH0
	 nyxhcVdsgx2zLIFx3l3lr2NTjhrHK5+1dt1x0E8WTzn2g+dv+R/g44b1+vP4cl4UdW81M
	 Xdfohh5d0th2G0niVqtxaKJ7Fi/5LURtOdBX64Mj91OpW84jjL4pRVtI6gr3srnhyQWf7
	 6wCJB/uC/n+4br+c+RtQijh7WzMypSl/ips817kmksv3LL3LysuQVPKCAAg68idaK6MOw
	 jYDgDkU3LOabZ4Wjv6h0vNeq1tvVFvxTko0DRlsIFvks2gwSvTq3rcgcqjZ3f2X3dPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fbu/M8Ww";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F87606A31E;
	Wed, 25 Nov 2026 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbu/M8Ww
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0F31F000D1;
	Wed, 25 Nov 2026 06:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587189;
	bh=on8VJY5xGeaa8ViM2oo84YYTFOdL+M9b1DqhNX4XCi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fbu/M8WwObNIMzOq3DmQJ6C9LPdWexyMYmNDTRx+/WePdwXwu0eDL276imaCvyUTt
	 DIvGnQkPv9z7jfAoK7XWCJRlmlZONvpS72vmq7DqGn5kC+SqZPWKJWF8F5fWC8cykZ
	 814oGGX7E4ht/BxDL3L+kg3i6FDCpq4pWactT9Ar4CGo6eKywNPHHuiLyGQ3De8C9F
	 HBAGjnL2ZE5KeP0G9Idpv8xChRiD+LUOkxqaKTVxjP3S7ZzAm48WXmDUHg4WbFLESd
	 MtYpRkbQrAllpvaon25WjxaUxQfohktbBJti4bw7RdO6f3wfMse/QCaCuZfoLHwJYl
	 f3FMVWMPd7KJQ==
Message-ID: <sashiko-outbox-232652@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: mediatek: add MT8196 MMDVFS
 clock IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Echo Zhang" <echo.zhang@mediatek.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125060037.649659-2-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-2-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:13:08 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: clock: mediatek: software DVFS voters and dummy
  IDs in binding
- [Low] dt-bindings: clock: mediatek: clock count macro MMDVFS_USER_NUM
  in binding
--

commit 8ccadc25b913bfdd48ee17134dbe19aa8303b626
Author: Echo Zhang <echo.zhang@mediatek.com>

dt-bindings: clock: mediatek: add MT8196 MMDVFS clock IDs

This commit adds Devicetree clock binding IDs for the MediaTek MT8196
MMDVFS clock provider.

> diff --git a/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h b/include=
/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
> new file mode 100644
> index 0000000000000..428d8a35abdba
> --- /dev/null
> +++ b/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
> @@ -0,0 +1,74 @@

[ ... ]

> +/* Core user clocks used by multimedia hardware drivers */
> +#define MMDVFS_USER_DISP	0	/* user-disp */
> +#define MMDVFS_USER_MDP		1	/* user-mdp */
> +#define MMDVFS_USER_MML		2	/* user-mml */
> +#define MMDVFS_USER_SMI		3	/* user-smi */
> +#define MMDVFS_USER_JPEGDEC	4	/* user-jpegdec */
> +#define MMDVFS_USER_JPEGENC	5	/* user-jpegenc */
> +#define MMDVFS_USER_VENC	6	/* user-venc */
> +#define MMDVFS_USER_VFMT	7	/* user-vfmt */
> +#define MMDVFS_USER_IMG		8	/* user-img */
> +#define MMDVFS_USER_CAM		9	/* user-cam */
> +#define MMDVFS_USER_VCORE	10	/* user-vcore */
> +#define MMDVFS_USER_VMM		11	/* user-vmm */
> +#define MMDVFS_USER_VDISP	12	/* user-vdisp */
> +#define MMDVFS_USER_VDEC	13	/* user-vdec */
> +#define DUMMY_USER_DIS		14	/* dummy-dis */
> +#define DUMMY_USER_MDP		15	/* dummy-mdp */
> +#define DUMMY_USER_MML		16	/* dummy-mml */
> +#define DUMMY_USER_SMI		17	/* dummy-smi */
> +#define DUMMY_USER_VEN		18	/* dummy-ven */
> +#define DUMMY_USER_VDE		19	/* dummy-vde */
> +#define DUMMY_USER_IMG		20	/* dummy-img */
> +#define DUMMY_USER_CAM		21	/* dummy-cam */
> +#define MMDVFS_USER_CAM_SMI	22	/* user-cam-smi */
> +#define MMDVFS_USER_VCP_SMI	23	/* user-vcp-smi */
> +
> +/* AP voter clocks (24-33) - System level control */
> +#define MMDVFS_AP_CAM		24
> +#define MMDVFS_AP_CAMTM		25
> +#define MMDVFS_AP_VDE		26
> +#define MMDVFS_AP_IMG		27
> +#define MMDVFS_AP_IPE		28
> +#define MMDVFS_AP_DIS		29
> +#define MMDVFS_AP_MML		30
> +#define MMDVFS_AP_SMI		31
> +#define MMDVFS_AP_VEN		32
> +#define MMDVFS_AP_MDP		33
> +
> +/* VCP voter clocks (34-43) - VCP firmware control */
> +#define MMDVFS_VCP_CAM		34
> +#define MMDVFS_VCP_CAMTM	35
> +#define MMDVFS_VCP_VDE		36
> +#define MMDVFS_VCP_IMG		37
> +#define MMDVFS_VCP_IPE		38
> +#define MMDVFS_VCP_DIS		39
> +#define MMDVFS_VCP_MML		40
> +#define MMDVFS_VCP_SMI		41
> +#define MMDVFS_VCP_VEN		42
> +#define MMDVFS_VCP_MDP		43

[Severity: Medium]
Should virtual DVFS voting channels, voltage rail voters
(MMDVFS_USER_VCORE, MMDVFS_USER_VMM, MMDVFS_USER_VDISP), unprefixed dummy
placeholders (DUMMY_USER_DIS through DUMMY_USER_CAM), and duplicate AP/VCP
software voter slots be exposed as Devicetree clock binding IDs?

Devicetree bindings describe hardware rather than software voting
channels.  The actual MT8196 multimedia hardware clocks (such as
CLK_TOP2_IMG1, CLK_TOP2_CAM, CLK_TOP2_VDEC, CLK_TOP2_VENC, CLK_TOP2_DISP,
and CLK_TOP2_MDP) are already defined in
include/dt-bindings/clock/mediatek,mt8196-clock.h, whereas DVFS operating
points, voltage rails, and bandwidth requests are normally described with
OPP, regulator, and interconnect bindings.

> +
> +#define MMDVFS_USER_NUM		44
> +#endif /* _DT_BINDINGS_MMDVFS_CLK_MT8196_H */

[Severity: Low]
Should MMDVFS_USER_NUM be dropped from the Devicetree binding header?
Count macros are not clock IDs, and defining the total count in
include/dt-bindings/ means adding any new ID later changes the macro value
and breaks the binding ABI.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125060037.6496=
59-1-echo.zhang@mediatek.com?part=3D1
