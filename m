Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBCF44238C;
	Thu, 15 Oct 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049086; cv=none; b=PHuL+Zo5bsTgtrCHvYq7kFLVjL/95QrLwe+qrI3SHcbFb8elk4x1alBasCPl+omrU6ujfbw2WRqvfe7RJNp1QX92prF45OmLZQY6kxVxT8a6ixwNVYqzlJ1OMt7nJDUXAnu/4n4ZvFYbwskK8U/JnXRXY/HgfnAI+mNKo4T6cC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049086; c=relaxed/simple;
	bh=eqJnzKF9vAc14QPZPLRomXXHDZ1UKTcqAtU77UlxfaA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=E5Ub+Lmd7gXPbmHNcb8Ekff+tIQZ2d8sLTtS52vRo2hVqvJVuoe8KjsAdSkEyJl5qO+/6XTaZbVC/oFHiMKomhH9EMXIo3lbJ8ho1cTfGQFfo+djVD6nsuKj6sCoVwILbZmVj0pkvfMAAEt4Ujn39AvpVMNSa/8ZaW91alqm4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0QY9jLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0QY9jLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33F11F000C4;
	Thu, 15 Oct 2026 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049077;
	bh=mE+SAGgizS+xyvCVS/63OL3pT41G3lbsgQ8FlsfIYuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0QY9jLrVCefFRG/x2ecydeWwZjT+YJlMDzMvHulHFmUlQNTOKgYKG/uJNxy4xOz+
	 KaP1iKcEziEYKXobsIA5PUIaHv+P1TPkx/ix180p7OqWUVwaRyG8DLpt7u9l/fMWnR
	 Cm9HrcwCnNDebdFev4V71pB93fOuOhs/k5Ecv7IdjiTzVecZhb+fh9C9qxFEcJxX59
	 UlV8hItcI6OOgbLzSF6oLZQVtxNh3ltKBkuLWJPg0sLqZBZABzgSLrr3YZLTyypizB
	 9cw1rOF0DnK11lByvTwjmeo1xBifk24DTYe+AtTFf0/v+DrHGbgHBO2WE58YD4yBkR
	 9Fn04vtar0yZg==
Message-ID: <sashiko-outbox-172396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM
 clock bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-5-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:37 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: missing reset header include breaks dt_binding_check
- [Low] dt-bindings: topcrm PHY child node lacks $ref or compatible constra=
int
--

commit 2a48341d23f9ed02596c916c05af28f44dc6b0bb
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings

Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
for child nodes inside topcrm.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm=
.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
> new file mode 100644
> index 0000000000000..9466661929f03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
[ ... ]
> +patternProperties:
> +  "^phy@[01]$":
> +    type: object
> +    description: PCIe PHY child nodes

[Severity: Low]
Does this node definition allow malformed PHY child nodes to silently pass
validation?

Because type: object imposes no constraints by default and there is no
$ref: /schemas/phy/phy-provider.yaml# (nor a requirement for a compatible
string), dt-schema will not apply the necessary structural checks to the
child node.

[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx279128s-crm.h>
> +    #include <dt-bindings/reset/zte,zx279128s-reset.h>

[Severity: Low]
Does this missing header break dt_binding_check?

The missing header <dt-bindings/reset/zte,zx279128s-reset.h> is introduced =
in
the very next patch of this series.

Any developer running schema checks on this exact commit will hit a 'No such
file or directory' error, which breaks git bisect for anyone validating
schemas.

Each commit in a series must build independently without introducing regres=
sions
to preserve bisectability.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D4
