Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E084446C0C;
	Thu, 13 Aug 2026 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615407; cv=none; b=h600s2A/jXn5gaN2rjyCGgMlRyvq7bEOuj2+lm06ftltL2RCIuWdy4WDOIeIEV2uOf1GZn51HkDkqMyoC7a0+f4A/Nf3CkHj2+1tA3gCGrR8TaBCUK5TBSkApS6313zp4DdHtdVhdMS8cc6kmSkA8Npdd9W+14Y8tKZs0v2HD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615407; c=relaxed/simple;
	bh=VOaUJbgZQU+pfw9W12tfoglM3U8ttSUAirKPWGKXiW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m9l5DmwH62HGPZFntjRA+Vo9gQCAXpYXHWHb1vyFOjL28/XJdkNrXoA3wJ5ENfueelMdCX8+jFgPfZo5yONTZYzsH0aEg8rbNXn/sLrxtXnPECqbcodNApjtzmTEB469M+pKh1/LreA+Fl82D55ioK1/VZWvOdaQV0QCYR4POyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNeA7iqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNeA7iqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B3C1F00A3D;
	Thu, 13 Aug 2026 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615406;
	bh=OWvlJs9FRzUUCi+Kufsya56PwLrKBDMPWP5pJQAeebE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNeA7iqPoN0+nrw6FPL27juAaY8KO1PIiVJ8/sYJJNl5Asmr7mlMlmDQT88Vd2tmT
	 B/rM6+eDyF1qCK8Yizpcl4Iq95tKCvITXK8QEn6nxObWsomFUlkzV8zxQwugdxxksB
	 pIP/wOlKrAwnhrgjYGNTU//XGxc3jRzbuRI8BdvhC5tOQnWKsKdxuYHjL9WoaRGhey
	 ARxyqzjpG+jUL7GuOuxkmGWV6fKZYsTCX+Leg2hGa1vhNUGvKRUMpWLRlgWPNy7qzU
	 fQbGg+xPf7S5HYIDfmX/Vl0is5a4sLf8qdfHr7yG2ZH91RC8tRs9IAe0N3sNX89OlY
	 Y0wOF84io324Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: mfd: syscon: add Ambarella CV75
 secure scratchpad
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-cv75-v3-a-v3-2-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-2-cfdd20b1b4dd@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:03:25 +0000
Message-Id: <20260813100325.C3B3C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The compatible string 'ambarella,cv75-sec-scratchpad' was omitte=
d from the 'select' block in syscon.yaml.
- [Low] The commit message subject for the MFD subsystem change does not ca=
pitalize the description.
--

--- Patch [2]: [PATCH v3 2/6] dt-bindings: mfd: syscon: add Ambarella CV75 =
secure scratchpad ---
commit ea79700d5daf0e265e9307d2ab596a80db0d5db8
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad

Allow ambarella,cv75-sec-scratchpad with syscon for shared secure
scratchpad registers used by pinctrl pull configuration.

> dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad

[Severity: Low]
This isn't a bug, but should the word "add" be capitalized here to follow
the MFD subsystem naming conventions?

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index e228670880631..05c7f59aba5de 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -148,6 +148,7 @@ properties:
>                - allwinner,sun50i-a64-system-controller
>                - altr,l3regs
>                - altr,sdr-ctl
> +              - ambarella,cv75-sec-scratchpad
>                - amd,pensando-elba-syscon
>                - amlogic,meson-mx-assist
>                - amlogic,meson-mx-bootrom

[Severity: Medium]
Will older dtschema tools skip validation for this new compatible string?

It appears this compatible string was omitted from the select block earlier
in the file, which is required for compatibility with dtschema <2024.02:

select:
  properties:
    compatible:
      contains:
        enum:
          ...
          - altr,sdr-ctl
          - amd,pensando-elba-syscon

Should ambarella,cv75-sec-scratchpad also be added to this enum block so
older tools correctly select and apply this schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-a-=
v3-0-cfdd20b1b4dd@ambarella.com?part=3D2
