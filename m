Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634056;
	b=OjeP8lyoTkuabvjd0b16+0obeRKVKxSK4QkvJ4xbyugg91+yhLsergyefnn8hf8p3MPR
	 XLsn3I/iCCxRz7u4P6Ceco293MMrGGumFOyhAhJq3AbwiMdopwFQZH5oxILtUZWcm8jx2
	 TX7AB/pxf7079jgaltGfuOgFpGTR4k48R8RquCJ1E8RgyIE8ekIVicnqBmjvBCu+zoyeQ
	 lBYCc8c62cAaWvX6T7ZAAqDb5K7MRs9Glhlc1tbgSa0iGPOMMaKCMdxK2aVknHYuSzfVT
	 z07K21Ls9tUorNX+1bN8IS3CT3DnICBexl+uYjEfyUNJzsftWHBt/EokJfobLqz6VzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2Mxaj7MSnWu+9ygVGHzFTKYO5aL6o7ueBK40srZALsk=;
	b=wI4MYBS8ipSBP2ZpNwRNpSDG9TcwQ8E+5c8lBNJy0s53+VcPSInOSYIX0yE5VZekkLMD
	 zhxUYygXttyWvex/0Q9I/m2lTqX/2YwOTbZkw9Is6yV4G8+FyzMhBQGvyTwqvnOGE9AkD
	 Bi0MDoU3zgMspyZjvc2HdrRwd38bIxbylRwzbUaLK/GJOWjAmbGZOhXOINeoHDXHBfRzz
	 6/FmTuP/sZ2cFhNbxyhgDSE0OpX3Zvv9FB1/cdVRJvkBOLmRW8msmvA+MAZcw49kSrJjp
	 UG+tcu/+AtWnfXHdFxH3W9d7s+9SYQ71+5crrFNv6jMOgQljg/ip79gUgtH5nQpjtnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tj6vBlbC;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063A606A327
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 19:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1063A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tj6vBlbC
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so4352632a91.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634055; x=1796238855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Mxaj7MSnWu+9ygVGHzFTKYO5aL6o7ueBK40srZALsk=;
        b=Tj6vBlbC9JMlJyTasmd4zElLY4siTE7WVfPniodB3bH0eHFWeBlwnRZMfB0wF5TQMS
         fhXDLtWSvkWe9uFiAJmuOCK6+HjuJ9xKxDg+RwgRonkVOZlmsUZCZaS0i60CjrA56heE
         aecpd0h9ty6vp2bF83UJG/FJd+GKwHy+WoQv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634055; x=1796238855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Mxaj7MSnWu+9ygVGHzFTKYO5aL6o7ueBK40srZALsk=;
        b=h0el9ccFeiZ2ZZpIRu9NqlU9SbsMSekJlrszXaOGIZJMe6ZJOG9SREcgWw8WhUowvO
         9REwLK6T9jPCY1dyCStDCZB9h2wDJ0qvnvUClPhq+26YlEMqyTmSqj34PCVqhOUWZDiM
         j98U+CUmeO35IPRuGLvyx68s50Z3L983TkJmKfPbIwCzJU6SrbpIf6NJNZuKJw11HhWX
         w0/XXvucxAYLOTx8k4QFu+I2O2WA1EHtMQIjM+xCn52uAseu13kpLVssdg/AVq9bFtuD
         zeXMSNezhdpd+xDU+bWtndg1b6+h6aC3Kfo/eFNRDmarQeIbF5roglUVF2Uux3czRbpg
         bkhA==
X-Forwarded-Encrypted: i=1; AL+hErFeehYBb4QUt9iCQQavyp+TxEuINRFVy0/NvsiYVrSZVSRMunqT9qnPRlVNM7DuxnPoY1YOuf1djJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GVi6iwOnPiXXXoI7rNaHBmAXXZPCpgA0JYoyES7V9iYdK1hIM
	EsDBb+IKcmkRYlmKwd5vENUdiX6/LLA47tE7ZDGwMe/lA5Jg1ZXEMc0CQbPY/4XS0g==
X-Gm-Gg: AZFdTZdCUIqx5utvEE6zccRvWTlfmfv5ocKH3/ypuU3FeXm+4t6mHxTw9xAFycfxZv7
	kKsDt+b/A2fE5LCOiEsafH/stBdbra7wGd9PcfuPsMPa69h9450Bgxpb2RpIn/WYg0GeRaA3I3Y
	8Kswr3Ta5HT+3ZbkC99p/jOSEXP19IewZ2BVVGlvMEYrbaoofB3JYKu4/4fNX4A3w6ut81xSofg
	MlpTqBgT40nXuqZlDWBH1E0rDZB7QjlKi7mDA+40MEigmaloaaPe3EZTaVv+MgHKSexz0wqi9LN
	n+90n/K7XbmfeSWFfj6QY7ofFvlfTWb1dR+fZtZ4onTCOPSP3FyeCFlix6JxSCe9wjRgs5bUn0u
	US4j0f6xYrVhfnv5THRgjrfWPzq0xB3n2esK1ZQAuOR98OaEkS2VPq8DeggQkY6/BVIYc07rndb
	peoEMoLdXiGQWPCgGqCV1AxpYyFeAXpv7sxwJEWKCjKOdokkE/9Yj44PMDq/WAKHCLdpual3vEZ
	83j+/WFy3QszWN0mkyHihUe4E6k3h9lzsfO32WBwb0pM2NKrZBBKK8djlZE/gyHJuGcTxbthEzQ
	Z9h/25R5i9kmUSo53zPE4eBg7Nve57+JdvDEaNESoXZIHuFd/0H9XZy6+9IQ06xKTsc=
X-Received: by 2002:a17:90a:d607:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b41c97c8acmr18800018a91.67.1795634055227;
        Wed, 25 Nov 2026 11:14:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b40578dca0sm32183592a91.2.2026.11.25.11.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:14:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:14:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <awczhDk20JDpqKqQ@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
 <avZkfg6WMlMzOxpn@google.com>
 <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>
 <de65af39-3a9c-4b2e-bb82-2a84b8584731@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de65af39-3a9c-4b2e-bb82-2a84b8584731@kernel.org>

On Wed, Nov 25, 2026 at 09:31:54AM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2026 08:07, Krzysztof Kozlowski wrote:
> > On 13/11/2026 02:14, Brian Norris wrote:
> >> Hi Krzysztof,
> >>
> >> On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> >>> On 03/11/2026 03:36, Brian Norris wrote:
> >>>> On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> >>>>
> >>>>>> --- /dev/null
> >>>>>> +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> >>>>>> @@ -0,0 +1,16 @@
> >>>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>>>> +/*
> >>>>>> + * This header provides constants for CPM IRQ.
> >>>>>> + *
> >>>>>> + * Copyright 2025-2026 Google LLC
> >>>>>> + *
> >>>>>> + */
> >>>>>> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>>>>> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>>>>> +
> >>>>>> +#define CPM_IRQ_RTC_ALARM_NO			0
> >>>>>
> >>>>> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> >>>>> prefix.
> >>>>>
> >>>>>
> >>>>>> +#define CPM_IRQ_AOC_MIN				7
> >>>>>
> >>>>> Anyway, ABI constants should be indexed from 0 and incremented by 1.
> >>>>
> >>>> What do you mean by this? Do I need to make up names for the
> >>>> unused IDs between 0 and 7? On an initial search, I don't believe they
> >>>> have any meaning at all. Does that mean I should make up some kind of
> >>>> "RESERVED_<N>" naming here?
> >>>
> >>> No, I meant CPM_IRQ_AOC_MIN is 1.
> >>>
> >>>>
> >>>> Between 7 and 156, these are just ... 150 different "service numbers"
> >>>> within the AOC (Always On Connectivity) subsystem. I can name them
> >>>> AOC_0, AOC_1, ... AOC_149 if that helps.
> >>>>
> >>>> Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
> >>>> into 0-151? I thought it was valuable to directly use the firmware
> >>>> indexing where possible; if I change those, then the indexing loses its
> >>>> inherent meaning, and we also have to add another layer of translation.
> >>>
> >>> We do not use hardware numbers as bindings and ABI, because that's
> >>> pointless - no benefits, only risks. Similarly you do not define GIC
> >>> interrupt numbers, pinctrl pin numbers, MMIO addresses as bindings. None
> >>> of these bind anything between DTS and software, so not a binding.
> >>
> >> OK, I see your point about the distinction between hardware numbers and
> >> bindings. So are firmware-protocol-defined numbers more like hardware
> >> numbers or bindings?

I'm not sure if you answered this question. I'm inferring "hardware
numbers".

> >>> There are some exceptions like SCMI firmware, but that's not the case here.
> >>
> >> It's funny you mention that, because that's exactly what Jerome compared
> >> this to in the clk, reset, and pmdomain portions.
> >>
> >> These values are used literally in the firmware interface, so I'd
> >> consider them very similar to SCMI firmware protocol IDs (and, not that
> > 
> > Sure, where is the source code of the firmware then?

In case this is a non-rhetorical question: it's proprietary. I have
access, but it's not open source.

> And if you do not have the source code, then not a binding,

To be clear (I added some of this to your other recent reply too):

1) in v2 I dropped LPCM IDs from include/dt-bindings/
2) they're completely gone from the clock DTS (the indirection is in the
   driver now)
3) they remain in the DTS for resets, as naming documentation

So agreed, not a "binding" (if my above "distinction" interpretation was
correct). But the numbers still may be appropriate in the device tree.

And I don't understand where source code has anything to do with it. My
understanding was that we treat firmware very similar to hardware --
it's opaque, and has IDs that we can rely on, if they're part of the ABI
we use to communicate with the remote firmware.

(If those ABI IDs change arbitrarily, e.g., on vendor firmware updates,
that seems like a problem regardless of whether it's mapped directly in
the device tree or in the driver. And I accept that if Google makes such
poor decisions, we live with the damage -- possibly including having to
update device trees. I do not believe Google tends to make such breaking
changes, as it causes difficulties even in a non-upstream-Linux context.)

> so you won't
> have case like:
> https://lore.kernel.org/all/20261124-qcom-adsp-shared-vmid-fixes-v1-1-f1a808dc41a5@mainlining.org/

I'm not quite sure where that's relevant. To me, that's not much
different than somebody reading the SoC datasheet wrong and getting the
GIC interrupt number wrong. It's not really an argument about ABI
breakage; it was just a simple mistake, where obviously the previous
assignment never worked.

It also has seems to have nothing to do with access to source code. One
doesn't require a public data sheet for every driver either.

Or are you simply concerned about putting such error-prone things in
include/dt-bindings/ ? Because in v2, there are no such HW/FW-assigned
identifiers in include/dt-bindings/ -- all FW numbers are either purely
in DTS (simple mappings like IRQ and resets), or in per-SoC indirection
tables in drivers (clock and pmdomain).

Brian
