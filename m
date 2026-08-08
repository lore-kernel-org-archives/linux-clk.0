Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22683F4122
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786199371; cv=none; b=Y+ww/l9BVqJQvssHpC3W15Gaa9eLgxVamb+bmQHxBNDK/CJbLOQI9oyiUnLTbYapAWC/TXHIcGnYwrxEUoMrvqFEy9Y3zuDW7WiKYOBoY4s04BuLfl+LWTUkE8j9PIV+ioVluXVEW1Uda8NrZgfeJ7aK4o/684ErPZ1V3EJiOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786199371; c=relaxed/simple;
	bh=bptTALW6R8bnxOtse24KWu7lJf0Yrq1VbtD7l4NArTk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ODAND4jUIcOxCaIqCdRQD9judejOlS+LDwRI+vZdCBbQS0drNKlG0FWpALzdgdfMkkfAeazMLfbDz/7KkcXin5Ao5rrFgXAbzGxTH1Wp3YSEcbsNSX2O7h+Vu6nZVMPHKCjRwYO5viK05O5g2o33ZBZgJt18gEbOZl4MV0fPgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nroSgcbN; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nroSgcbN"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cbb818e57c9so286511a12.0
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786199369; x=1786804169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CZYGhkXjoLPOZDdCP+ZBeQkJbqW9Nm3A99Ju9rkXbI=;
        b=nroSgcbNcOl6BQloJQbxOFJup1KvPh/sBQAH7PcNgzFpPpDhzEyl8lqwwDPKGuRovi
         dcOqFz9UwKVeYgx+Kf/Vd8Z1cODVRXJOwKNu16pQkuaP+0twPQ8RbxaLSjTX52XpwPZd
         Xz8uFeeQFkdnAdqxGSRVfv1+k0by4+KO7nolBgy89P4epgJnbZzn2SYB15Y/YkDK4fw2
         I0J2vM9vFXBnv8Mn+4teJbNoyIQkgOhwN9c0mT0YBLLZYMrjThkK681xkl3twQLS2v4T
         tXLGkBrEH9auq/aM3sPxdmk48KnmEhyANyM0EE6ZDOxjJxktl7YNJSHJryJjel/JIiue
         YEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199369; x=1786804169;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CZYGhkXjoLPOZDdCP+ZBeQkJbqW9Nm3A99Ju9rkXbI=;
        b=f+ukPWLs9/mF41XGFU8gUeXUBIkb+r1vX1TIItRjRGSTB0zqci/sN86FnE+5uTTsj2
         fFFERF6fQmPqb1OnQ26uX0bfir730PgM69fO9ug6nF85XSvhNIEYxwwTSafKe6luaxvI
         awIBrUlz2slth+AzrL948uUq8pprK2K4MV/oJ4lqCpeU5+NcqY3JCCkHitJJAW7Nx1Q5
         zUtkESGyHFxwOjxS4Hdz1KbGTAcgtAzrDTc/lCQoSSbpkEI6S0ijAiucel5V3ClXMtha
         K0FIrawjBOubpY/OIMZ8mOrtYNkKtnmlChqdNGxcME0EigRnS0cVsU7kyi6kdeCYsPmt
         bmGA==
X-Forwarded-Encrypted: i=1; AHgh+RqO09XGzk0nqiu/5oHmzTQ2xHjI9RuNo4C8kQFuGDSqa7nma6T6gv/aBhsg8QM5QdIzimNPpIzPWK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjA91rNpZLuUPLS8r9Jsysnh4JdZskixqgNk+eadXoDELLX4Zu
	NktBFmWleISX80WRsCTdflypNBEZaBkTKabsob4KoCXmY2SNogfQoozz
X-Gm-Gg: AR+sD10lOAb/UD2BXZdPl656/KJCb0uY+/UIopUFnSqSslgqJUM4TVxfCAHKzTh+G/s
	v0Rph2xRujk0QS1JX1fAIFRwh+ny4cRg6yxMeNlLCB6+zwm7dK+zTbun3+JCHNRA2nD7vhDW0Om
	rvWji2XRh9cI9VX8iWAsuuDoS8ozcw5YAuZy267/Mn8zpMpOYTpagzbg++wJ4O1dDVsTvlP7h6T
	wttAgxS4BA5aHNdL4VzTX1oC6l1hC/LuDgmxM7h77v08KzzzgyLG7nLIxALkEGpVmGCXoJPMUe6
	Bye3oEmW7PoDubYIIA2Z0249LJfnAtS8oS9d59S11sBt4P7Kpo0fFxMwGq5vVBVs7c/qN0y4Ght
	A0Trk3edcubr0zrbHOpT+HeCyxIsjxpwci99EP3h9B3WFXLD2N/9PMPmJL95vym2KcV3XihAkcn
	JLZ+KL2iW+eAa1yvOd8i8CWVSzeK457dWj8FY5dDA=
X-Received: by 2002:a05:6a00:278b:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84f2e0dc994mr36524222b3a.39.1786199369200;
        Sat, 08 Aug 2026 07:29:29 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm2140077b3a.23.2026.08.08.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:29:28 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:29:25 +0800
Message-ID: <2b3c661bf7e1d437f81e4b7da13be25d.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY
 PLL pixel clocks on K3 APMU
In-Reply-To: <20260807230824.GA2220945-robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-4-6de34d80e86c@gmail.com>
 <20260807230824.GA2220945-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Rob,

On Fri, 07 Aug 2026 18:08:24 -0500, Rob Herring wrote:
> On Sat, Jul 25, 2026 at 12:51:13AM -0400, Cody Kang wrote:
> > The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
> > K3 syscon takes two clock inputs the other variants do not have.
> >
> > Gate them behind the K3 compatible instead of widening the shared clock
> > list, so a non-K3 syscon cannot silently accept clocks it has no mux for.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  | 30 +++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > index d3a7c93c3c54..b8fc6632a392 100644
> > --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > @@ -31,14 +31,18 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 4
> > +    minItems: 4
> > +    maxItems: 6
> >
> >    clock-names:
> > +    minItems: 4
> >      items:
> >        - const: osc
> >        - const: vctcxo_1m
> >        - const: vctcxo_3m
> >        - const: vctcxo_24m
> > +      - const: edp0_pll_pxclk
> > +      - const: edp1_pll_pxclk
> >
> >    "#clock-cells":
> >      const: 1
> > @@ -95,6 +99,30 @@ allOf:
> >          - clocks
> >          - clock-names
> >          - "#clock-cells"
> > +  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
> > +  # inputs (parents of its eDP pixel-clock muxes); every other variant has
> > +  # the four base oscillator inputs only.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: spacemit,k3-syscon-apmu
> > +    then:
> > +      properties:
>
> > +        clocks:
> > +          minItems: 4
> > +          maxItems: 6
> > +        clock-names:
> > +          minItems: 4
> > +          maxItems: 6
> > +    else:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +          maxItems: 4
> > +        clock-names:
> > +          minItems: 4
> > +          maxItems: 4
>
> 4 is already the minimum, so it can be dropped on all of these.

Thanks for the review. Will drop them in v2.

Cody
