Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A063BBFC9;
	Fri,  4 Sep 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538303; cv=none; b=Epl5GiEUcuf5Kv+jWLUxPWOXx6n2oQ8jHyjO6/+saJ1dKjD3W7ZwZDtF6cbiniIU4JBm/j7w9scpJ9P1tvORbQbDRSnCAMFDUCgd4Y9snMSWEZGedJywNaLonhVqOfEPlRR20mf6ZuCp/INh2V+KKcfKy+gRWro1k06xin7boNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538303; c=relaxed/simple;
	bh=gCPOpzwRJ8xNleeKClOunJ24RXsOqJDudpRm5P4JZ+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QtjoostlpCxPwfv5IvQCedIoc256oHYtAT+qu912kjid4yNXaCBicOr7kHuZRA484f4LpbQLFc4QUZkyWsSm5XIospFsSkHH5/T6tRHpOu0IdIYtSq1hlBTfgIbLUIeoMy1zL+atdUW/EHQlK1pBxKP0wcHoedwjJeEavk2flis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxULpyrq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxULpyrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26661F00A3D;
	Fri,  4 Sep 2026 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538302;
	bh=SLfVs718j9nImd7ISUNn/QOwAibKk1q0Ds3PSWeSls4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxULpyrqjKbb3Mq2FuQ5RLp/4p5yI557bA8m7rNAhEkDbR48sy5jzlus0sQgvZ4Un
	 Q1YHruqLMWzmtoLeXpBdFr48zk28zidYY908iM6910H+BsQ1byUUxJFlUU8K20p6l3
	 0Az5DpPf0Dv52NqzNNjMFcI1dwpx8pwWneKQQICUr8H7f8SPupzQBo7fommcvw8gU7
	 9KNDl1ojDBo0iKj+D2YevXmBDPn2jTgYuD+jAblF004fxX6tk5BXvp/0bpqBiE6B0L
	 XwlKRANLsN7K9jW5Ja1+/5+mGEYRiU34rkkOivVG9HPFk0oRaBdkaGt/6yVkMDq5m5
	 gq8+Aq/pu8wGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/27] dt-bindings: clock: mediatek: regroup MT8192
 dt-bindings into MT8186
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-6-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-6-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:11:41 +0000
Message-Id: <20260904161141.F26661F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Missing required constraint for `#reset-cells` on reset provider=
s.
--

commit 0550a18e08e9f8b8ca4e5f412e6e70a0779197aa
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186
   =20
This commit regroups the MT8192 functional and system clock dt-bindings into
the MT8186 bindings to improve maintainability. It removes the MT8192-speci=
fic
binding files and adds their compatible strings to the shared MT8186 yaml
schemas.

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-=
clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-cl=
ock.yaml
> index 199eac2034f22..41b8c61132e22 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.y=
aml
> @@ -35,6 +35,10 @@ properties:
>            - mediatek,mt8188-infracfg-ao
>            - mediatek,mt8188-pericfg-ao
>            - mediatek,mt8188-topckgen
> +          - mediatek,mt8192-apmixedsys
> +          - mediatek,mt8192-infracfg
> +          - mediatek,mt8192-pericfg
> +          - mediatek,mt8192-topckgen

[Severity: Medium]
This is a pre-existing issue, but should the reset-cells property be
explicitly required for compatible strings that act as reset providers,
such as mediatek,mt8192-infracfg?

Currently, the properties section in mt8186-sys-clock.yaml specifies
reset-cells as an optional property globally. Since mediatek,mt8192-infracfg
functions as a reset provider, is an allOf conditional block needed to make
reset-cells explicitly required for it?

Without this constraint, an incomplete device tree node omitting reset-cells
for a reset provider will incorrectly pass schema validation silently.

>        - const: syscon
> =20
>    reg:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D6
