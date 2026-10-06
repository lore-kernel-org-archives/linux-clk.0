Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB440B396;
	Tue,  6 Oct 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290108; cv=none; b=Kf975hpAsXJgL6BXFn4MdnbO6xnoPgUB7V777xbbRkEIq0ge9pvq56b6FeH+JStza4+xuGMATjqR4zdQavB+rZkzqnQ84A8yc8EpTpsMVk5CBtlg6nCCiOyaMdgnj5IzP0Ce+Zg+LfpEMAplsla6zxW+DwLvLqrpTfzX+sjVVOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290108; c=relaxed/simple;
	bh=Ow4YdD7EyXVoC88S4SgLcJSHB1darWp8OYA87UMQTb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFbWtS6Ri7dJUwAnTa6CY7jLvSu9VqmHL9QLR8S2fU69Qia9evdxj8yOlCKY3H7WrMMBHJl0Mv472WurbmqsF6ijYb4mab7uX/pRU5qnGbTxS3KtF2KmXSznqvuGqA29kvTtu/5m9v2iZuomHQHrWPKhuKet+jL5oQLyE61V6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXmVXP7W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXmVXP7W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C911F00893;
	Tue,  6 Oct 2026 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791290101;
	bh=QmxIbqvDsq9l5YYyvR9X8Zb0Z4CnWUHkZNsWXAw9LqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WXmVXP7WQgu+WfHWF15Ga63mp3w1ZfcBx0m4Csdt4S17QyRXKwAVOVVsdsfr+7USs
	 +Mdhvbu6OcVt9ky/SavGlEC+LUBdO5Y13oI4sq9TfTVjPPfU1vT2QuEuc/qjrQgrdX
	 6Jb6xdtD1zMjSC1mooX4nt4sJuBl6H45LziUV8HxxCxdNsDIR4MImnXADTAUbmxLjs
	 9BA72egvEeP09xMcbH5Ut58BcmIrJ83Gca6ep83+QFUReS4296OftEkPgaI33dBDqQ
	 U2goEnR+MoAlZrk1/8lT8cFFUf10wT9gU2jIh7b0fkkwDLY8hYrAE18/rPA+98+o9i
	 W1OmJv0SawmHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb
 child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261006-dcif-upstreaming-v10-6-bcfb28de0aae@oss.nxp.com>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-6-bcfb28de0aae@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 12:34:59 +0000
Message-Id: <20261006123500.94C911F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing LDB constraints for nxp,imx95-lvds-csr vari=
ant
--

commit ef256d56e7840a3d6a825d4ac33adad77eacd513
Author: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add 'ldb' child node to handle
these use cases.

> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.ya=
ml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index fbbf1b3f17904..97fe816a38f94 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
[ ... ]
> @@ -63,7 +67,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: nxp,imx95-camera-csr
> +            enum:
> +              - nxp,imx94-lvds-csr
> +              - nxp,imx95-camera-csr
>      then:
>        required:
>          - '#address-cells'

[Severity: Medium]
Could this introduce a regression where device tree validation incorrectly =
fails
for i.MX95 devices that define an ldb child node under the LVDS CSR?

This change restricts #address-cells and #size-cells to these two strings,
forcing them to false for nxp,imx95-lvds-csr. Should nxp,imx95-lvds-csr also
be included in this enum?

[ ... ]
> @@ -72,8 +78,24 @@ allOf:
>        properties:
>          '#address-cells': false
>          '#size-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: nxp,imx95-camera-csr
> +    then:
>        patternProperties:
>          '^formatter@[0-9a-f]+$': false
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: nxp,imx94-lvds-csr
> +    then:
> +      patternProperties:
> +        '^ldb@[0-9a-f]+$': false

[Severity: Medium]
Does this introduce a regression by preventing nxp,imx95-lvds-csr from
declaring an ldb child node?

This explicitly forbids the ldb child node for anything other than
nxp,imx94-lvds-csr, thereby silently prohibiting it for nxp,imx95-lvds-csr.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-dcif-upstr=
eaming-v10-0-bcfb28de0aae@oss.nxp.com?part=3D6
