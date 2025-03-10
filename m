Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB1B199939;
	Mon, 10 Mar 2025 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603710; cv=none; b=X8rbMUFJ7NpzAdJ4dC0j1Uz27NMGABAQb1AWVp1u+38rtby8HX6aHKNgtymPPOVE7uHbKvvK1ECIe8/fE4ea2OP7vMNH9W01KLCx+Y/+eoxgNvu4YbvQlyQ+e5m1bPoAf4LHBYCUR7hQGa/UT4PCidaMYo0Xk7hgDUkEOofXYOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603710; c=relaxed/simple;
	bh=vp3GGKR2xiMcDEYzikelXFHF5XdEOgesgxhI4m2MWX8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdPPPKR04voNzKH4z0KQfjAwmQtJK6pxqNqzUBXQ7NzniaNWStDIUEGqXw9iAHc4k7e+wcAHXwbJ/jAfg559PzgA96kCiDMacKANH0UkiI0swUPhmEEYXAGSbIoiZ7AbBZz+qKUxzUwP/ulLYGDKSh3+MSYG4Gd//m7GzIZV78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95160153B;
	Mon, 10 Mar 2025 03:48:39 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E4223F673;
	Mon, 10 Mar 2025 03:48:24 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:48:21 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Hironori KIKUCHI"
 <kikuchan98@gmail.com>, "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Conor Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 22/27] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <20250310104821.3c85977a@donnerap.manchester.arm.com>
In-Reply-To: <c8b85753-5c97-4258-a158-06a17929fad6@app.fastmail.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
	<20250216183710.8443-23-ryan@testtoast.com>
	<20250224175642.170c124e@donnerap.manchester.arm.com>
	<c8b85753-5c97-4258-a158-06a17929fad6@app.fastmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Mar 2025 22:30:36 +1300
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi Ryan,

> On Tue, 25 Feb 2025, at 6:56 AM, Andre Przywara wrote:
> 
> Apologies Andre, I came to review your comments on the TCON series and realised I had missed responding to this comment before sending v8. 

No worries about that!

> >> +      - allwinner,sun50i-h616-de33-mixer-0
> >>  
> >>    reg:
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 3  
> >
> > What are those three regions? I wonder if we should have reg-names here,
> > to fix the order, and to document them on the way?  
> 
> This would be the top, display and mixer groups for the DE333, and mixer for DE3 and earlier. Can certainly add in names for these. Is there any example elsewhere in the bindings to look at?

It's basically the same idea as for clock-names, as used in this very file
here (allwinner,sun8i-a83t-de2-mixer.yaml). You can find an explicit
example for reg-names in allwinner,sun4i-a10-mbus.yaml, for instance.
In the code you would use devm_platform_ioremap_resource_byname() then.

Cheers,
Andre

> >> @@ -61,6 +63,23 @@ properties:
> >>      required:
> >>        - port@1
> >>  
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          enum:
> >> +            - allwinner,sun50i-h616-de33-mixer-0
> >> +
> >> +    then:
> >> +      properties:
> >> +        reg:
> >> +          maxItems: 3  
> >
> > Should we override minItems here as well? I guess any driver would need
> > all three region to work?  
> 
> This seems sensible, as you say it would always be 3 groups for the DE33.
> 
> Regards,
> 
> Ryan

