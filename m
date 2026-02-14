Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442731FE45A
	for <linux-clk@vger.kernel.org>; Sat, 14 Feb 2026 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771103370; cv=none; b=N5oXpuQG1gCJ91LtvBlyWhiaX+uDP8zIhQXV45YCK3dUHYiHomzMPRzB9n5LlOG9jk8QLdjZEGJn04Ssr66XGO+uYoZ+Y+fuaHAaaPW2PVWoi8X7rWuUsllcSozpbQpbAe9dBKJzKnCMzRqHQoIc53uz4h+C5aEyZKmZ7Ljku4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771103370; c=relaxed/simple;
	bh=g8nYWPMUBY7CgMskSO+8CU3KVwxKo6X7Bsl8D5taTOQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJy3ClIwDs9v52S8qVjTivvWVpgD8jxCTMM/DbmzdO6jJYrTz5ZIw16nVL8BKtOnbTS4RVFrGflHg5j5gwo8QN0xOIl+ym8QKEcISuUgvjuH05TFLvwT8hh4fLJWlnUAWJbCOLTEiIdeYb60Fo13ds6r8/rlUGKhkb7BKJQ3+9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wSB7pnif; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wSB7pnif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771103353; x=1771362553;
	bh=eGKJib+0WITKdpI220IMwglgT6GjONiYD8yYH1MaSFg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wSB7pnifFw7d637dCE6Oe2YIk+00Zdug8aP0uY805FsknyxLwXqipP774M/qiKgDc
	 JcE/14B0Vz0eF8x4bmC8rCt0qZTEP6oaO8LxfYmgVoc3BdZ57MGUHeHrRPHiKCRYHx
	 C9GmHoeMMvWyHXRCsbrdmzWZqP6ky9Vql0CEGFqiPu1rnOrZr2Yc8WwK0kg+eQE1HY
	 mhkcHaoQ5Tb4h7fo582W8NpvOwXtZmAPE5NmzCESXXG44z3lzjQFYHA5sLOlg/oueK
	 3AVc+WysGFur4NzCA+XpmwgrbBKz9E7xN+JruFvP9u5E7A2IvQgiCdSRMhL7kCRhn6
	 r9Gfn4Wnpd9gA==
Date: Sat, 14 Feb 2026 21:09:09 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <2QWRaIfoa_z-SIFIhFu37bcpZtK9jYlmk-mziAtaZMAFazmFi_7nloNxIroQ0B8gMhm_FmgptlYexUgHVQQkU6PEcmFi_6DvwwQXDycQESA=@protonmail.com>
In-Reply-To: <223c900f-e509-4c22-a3ea-3e2051ca6975@kernel.org>
References: <20260214180933.42143-1-hpausten@protonmail.com> <20260214180933.42143-2-hpausten@protonmail.com> <20260214-daffy-roadrunner-of-inquire-babdce@quoll> <NptKiK70heOFOIj9x6tz-gtS1m7ueBoa3SNCijidv1yeFPpt9OAPd-LTgBUbrEfAA2u3DTJHzlUDjv17fuddIPZ4m2YEZ1dTaMQuiXDGkD0=@protonmail.com> <223c900f-e509-4c22-a3ea-3e2051ca6975@kernel.org>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: cf7a540bc2054d661460ecfcb69c6bac455ed3f1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, 14 February 2026 at 20:59, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On 14/02/2026 21:57, Harry Austen wrote:
> >>>
> >>> +  interrupts:
> >>> +    items:
> >>> +      - description: user clock monitor interrupt
> >>> +
> >>> +  interrupt-names:
> >>> +    items:
> >>> +      - const: monitor
> >>> +
> >>>    xlnx,static-config:
> >>>      $ref: /schemas/types.yaml#/definitions/flag
> >>>      description:
> >>> @@ -66,12 +74,24 @@ required:
> >>>    - xlnx,speed-grade
> >>>    - xlnx,nr-outputs
> >>>
> >>> +if:
> >>
> >> Why isn't this in allOf? Code is fine, but why changing it?
> >
> > There is only a single if condition, so the allOf is not required. Remo=
ved
> > for simplicity and reduced indentation.
> >
>=20
> Heh, you might need to add it soon re-indenting everything on adding
> just one more if, so for me that was wrong choice. And you got a review :=
/

Very fair points. Agreed, it was definitely the wrong thing to do. Not sure
what I was thinking. Do you think it is okay as is, or would you like me to
add the allOf back again?

>=20
> Best regards,
> Krzysztof
>=20

Thanks again,
Harry
