Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816531;
	b=skOiw1GWsQo2win0ttHQty0C4ogRZh+eSPOfWyvOLAke9USfvDqElziLKQG/0FLckOtQ
	 CrwkoFgJZk4Vcgs5yD0b05aFo1Oq5Fp5yIdRrJSnr04I6bU+34ICyCBv2IrSsytBie4TO
	 wqvhZ+y3xOfT/rGeptULvFlOmULZXDb0SvMDEp4kbNxa8h6PiZ9uZlqy9VF835PECDtcl
	 5z/h0HU3DkcBK2/LnmpPZpX0Aob7yC3sm7FnBCuJoT4zMOz+gzmZDWBJDonfcIgGE3M5c
	 a2hgFlJ5a4trZm/UsehMT3ugS4u+c8hD4Fi31NUL89g24sc77MDFX34dP8yk0x/dPEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816531;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ivWTJPqjdiuB5Vs30SI6emsm3IIETLMbeYJntQT1hdw=;
	b=XrowEHex747tcuBtgtZGrMpXY6iwh/2gh3fRy6LwujC2EXZtFvYUyRNvxwHpZ5/nA1Fv
	 IcYJ9fwqe7/BLstTRvwaOf1iqzS64sqBvBiq5pHL+sVNAplRoKMdL3jb+Pmjt0c+feE8k
	 KmFBKv1pt+fjiFUjIFckszXTz4omb55EYtWMLt5LSZQtOtDRjn/G5Daj72Vsz+jxDq1Nv
	 zVDGjLopPySu0JIsGTcLb21pS6ilyRCN+2WUOX3sk89AfhvrGKke/lDuU+ZgLn7aGy3ZH
	 zR8RCnMCEGZgfGk9Uu7muECnBXj9X9DqHxmME0ZR2jf6lKLlbmojbVDT1uXaXocpXIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=biPw850Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E68606D2DC;
	Wed,  4 Nov 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=biPw850Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DCF1F000C1;
	Wed,  4 Nov 2026 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816530;
	bh=ivWTJPqjdiuB5Vs30SI6emsm3IIETLMbeYJntQT1hdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=biPw850Qh7eUdzejzjr9cmpBWZxjMSFnXJE1D5FmNOuzgLcxet6+7xhVbOW6y9KNV
	 2cQTNN6cNHDf53ajT35zi97f+QTFuniVTArFfg4Xj2tQwMRz/j6FKzmioLe+F5B6+9
	 kdj4qBZOP/evRZLkoGOOWhw5sdvk8KJZN4KfN9YrVt5E0VraLgrEmoqf+Od/ne17BH
	 63qoKs2GdGJgqu33B8RfBHabJltIpY8JzXKyXYFDXx0LbT6/cLNo8aMwoqLbRTiwXC
	 DQWz+LGoN86gP8AoaBpnqjpVwcVN8Qs0r3u5oGZYBisjsMZ5+K971LhZihllOiEoUT
	 /XzpY6ZiNobGA==
Message-ID: <sashiko-outbox-197833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom,sc8280xp-lpasscc: Add
 SM8350 LPASS audio CSR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Demeter Barna" <me@fromdisposition.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-b4-sm8350-sound-v1-1-4c872df294fa@fromdisposition.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-1-4c872df294fa@fromdisposition.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:22:09 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: clock: missing sc7280 header in qcom,sc8280xp-lpasscc =
See also
--

commit dee8eaeed95bbc7385e8c1208d78c9a4483b6760
Author: Demeter Barna <me@fromdisposition.org>

dt-bindings: clock: qcom,sc8280xp-lpasscc: Add SM8350 LPASS audio CSR

This commit adds the qcom,sm8350-lpassaudiocc compatible to the
qcom,sc8280xp-lpasscc binding schema for the SM8350 LPASS audio CSR block,
which only provides resets to the OS and uses the SC7280 reset IDs.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpassc=
c.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> index f235b4e24cc70..3d4a794abf134 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> @@ -22,6 +22,7 @@ properties:
>        - enum:
>            - qcom,sc8280xp-lpassaudiocc
>            - qcom,sc8280xp-lpasscc
> +          - qcom,sm8350-lpassaudiocc

[Severity: Low]
As noted in the commit message and implemented in
drivers/clk/qcom/lpassaudiocc-sc7280.c, qcom,sm8350-lpassaudiocc binds to
lpass_audio_cc_reset_sc7280_desc and uses the reset IDs from
include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h:

  LPASS_AUDIO_SWR_RX_CGCR  0
  LPASS_AUDIO_SWR_TX_CGCR  1
  LPASS_AUDIO_SWR_WSA_CGCR 2

However, the description property in
Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml only
lists the SC8280XP header:

  description: |
    Qualcomm LPASS core and audio clock control module provides the clocks,
    and reset on SC8280XP.

    See also:
      include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h

In include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h, the same macro names
have different numeric values (with LPASS_AUDIO_SWR_WSA_CGCR defined as 1
and LPASS_AUDIO_SWR_TX_CGCR defined as 0 for the LPASS TCSR block).

Should include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h also be listed
under "See also:" in description so that users of this binding know where
the SM8350 reset IDs are defined?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-b4-sm8350-=
sound-v1-0-4c872df294fa@fromdisposition.org?part=3D1
