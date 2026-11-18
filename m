Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045494;
	b=3slYpq/dWEgjHI6HU2jUX2+uvWdTcwjqEcSj4Cl65QHpq1csxyGW2CCGOWG4zI7vN+Fm
	 j4yoA3KqlfNGX9GroCfWfBjmv7prKu5CO8M78H36D6mvXSR01UDfgXTpc2WWSF7Ere4IF
	 D5yGT49vdffhRWwvERtVjJySzwTpGMOuEH1ws2qf8Il6SGqBfuZj1vuC94qPRSZijbVUx
	 q1EgrNBuvG7PHfarmUrNAOIOOzoHCTPQB5vWLY4lOaOVIoZJTZ6F72ny8iXkkw8g2baze
	 1KrbFl1HE//dqMrMgeFf/VYn/0t9Z/UPDO/OFJNvoFfycc5KagdSlHG3UHb+uJC/jGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sug6PAia0+SNns4syGwhysVyckiG8foTA5pRY0w5mJc=;
	b=1Em2eeXIz+D5795jig/H9YgqYurefJNO6t8kTUNBwLIv/TRnOaGCo9on4gC/J1vy7wSs
	 pZlaa/7FDRRvCzxMt8Ch9N9vNoe1siew0bRuULnYOSVjESdtpeRUzKjKLWyzIMzrn56Nh
	 fStC6J1t2II/sv8x42t0FB4zf+5NS+lc3bxxBIYHqMsT/OL2tutZCNBttk5SuziWpo0pv
	 9jRr8GmwzWuiJGpQfF2ttsMr/PNrN+hXT5wr3TBETFVxaRwLsTFQqinlv/AvyEhbpLTLb
	 XCpD7j0QCbOmM9zNPaoJ/YtuqbM2EIScwZvU3gu8+WXjQUzOiORu6dUIr6zUXgREIqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LlFI7UcT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED34606A31C;
	Wed, 18 Nov 2026 23:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LlFI7UcT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968DA1F000C4;
	Wed, 18 Nov 2026 23:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045493;
	bh=sug6PAia0+SNns4syGwhysVyckiG8foTA5pRY0w5mJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LlFI7UcTVnNiEHuHqUKgjXhpXrSQMLNUzNH6Nn1ZOeEyxqzu4q8gzkfjrRmLYmpAw
	 eiAD0zMHGisWMhcyaVKoYsEo/UMeVYh7bIRhTE2M3DSKjqs8zjkACpvUr/fC0Gf/Zc
	 nQhyHB1gwQUuhdKXrVggnALp9OmatMLPCgQYWq3PBn5BjtZsTOE7p6vpUG8RCIifJx
	 FTFnFrazbP7xb5NDvylzrZlbWx64sbKjm9QWomzLE4JzGmrcdDAs+BDj2Zy6KOZG/5
	 1AgPUvvxfi+gTRuLT4nLyVymdfBFao+6kxQ8ilSabrAeH9JO/rkqXNVL/IascQkFk4
	 +nVlf1Jp85dCg==
Message-ID: <sashiko-outbox-222207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/15] dt-bindings: clock: versal: add Versal Gen 2
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory Williams" <gregory.williams@amd.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118233211.4121361-9-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
 <20261118233211.4121361-9-gregory.williams@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 23:44:53 +0000
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
- [Medium] dt-bindings: clock: versal: duplicate xlnx,versal2-clk in
  compatible oneOf
- [Medium] dt-bindings: clock: versal: missing clock-names validation in
  allOf block
--

commit fd8a0b655d481ee627fd749c39ad8be1171d696f
Author: Naman Trivedi <naman.trivedimanojbhai@amd.com>

dt-bindings: clock: versal: add Versal Gen 2 compatible string

This commit adds the xlnx,versal2-clk compatible string to the Xilinx
Versal clock controller DT binding schema.

> Add compatible string for Versal Gen 2 clock driver and validate
> clock-names for xlnx,versal2-clk compatible.

[Severity: Medium]
Does this patch actually update the clock-names validation for
xlnx,versal2-clk?

The commit message says it validates clock-names for xlnx,versal2-clk, but
the allOf conditional block in xlnx,versal-clk.yaml only checks for
xlnx,versal-net-clk:

Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml {
    ...
allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - xlnx,versal-net-clk
    then:
      properties:
        clocks:
          minItems: 3
        clock-names:
          minItems: 3
    else:
      properties:
        clocks:
          maxItems: 2
        clock-names:
          maxItems: 2
    ...
}

Because xlnx,versal2-clk is not added to that enum, it falls into the else
branch (maxItems: 2), which will fail dtbs_check if Versal Gen 2 specifies
all three input clocks (ref, pl_alt_ref, alt_ref) like Versal NET.

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index 1f36ccc4cde1d..e06f1ebc192ab 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -17,10 +17,13 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - const: xlnx,versal-clk
> +      - enum:
> +          - xlnx,versal-clk
> +          - xlnx,versal2-clk
>        - items:
>            - enum:
>                - xlnx,versal-net-clk
> +              - xlnx,versal2-clk
>            - const: xlnx,versal-clk

[Severity: Medium]
Should xlnx,versal2-clk be listed in only one branch of compatible.oneOf?

Adding xlnx,versal2-clk to both branches permits it both as a standalone
compatible string without a fallback and with the xlnx,versal-clk
fallback.  Also, at this point in the series (prior to commit "clk:
zynqmp: add compatible string for Versal Gen 2"), zynqmp_clock_of_match[]
in drivers/clk/zynqmp/clkc.c only matches xlnx,zynqmp-clk and
xlnx,versal-clk.  It looks like the addition under xlnx,versal-net-clk may
have been intended for the allOf block below.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118233211.4121=
361-1-gregory.williams@amd.com?part=3D8
