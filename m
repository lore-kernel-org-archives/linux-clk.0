Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633741;
	b=l4GA/TM6kW+SACoFdh95RNyho6EVBy4OM6jNHtNt6bPazw07g71QgFJeCzDE6NBFdtl+
	 b51KeXNHPQom9ubX9RKhxHr+7vuj+n7e15O0fKEX2fCgmXDCqHPeHyzb8jq6Ptdb+pvr+
	 E7bkoj1ou2nsFqKLtHCiCqV559IvSuxfBtoBxh7P17GiIVB9eLOWrLgKl9B6dN/vyoNmJ
	 7qLa1HROJl8hod9kWI92smarLYzSZHO0PAAeHi2h4jWHeDGh+Z64rctTXkMLYjgKPsoLF
	 buV8cQdSEAxXB+MLeTs/CMBAOYhMwOD0bnAdWF1AV8ZzL/eT4ee299wl6qRfAASwxIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
	b=DXMR9I3ZUUkx/4qzhyjpw7bhEUSpGS0D6sJ4Hko7IA5CDnhRkW1djzk29/3/N76BBWj1
	 kG4ihygsm7NsBJcBDLRGkP6VFrcGIDuz+RZoGpcPymI1sEQIMgz3WrejErkQCsuFe8BlZ
	 3N6QoXqxsxUtJZfV8vhmwCKiRRTF+Ke9pW7d0Aw3trgT7HRRThkN9U8mKjHt4Qltvitbp
	 Ih03F0ndlFVbWzX4XqdvE17x0fF15SGFwhQEIBqWyo+2TvRKZOX2DWVV+xGgrZDdEibMS
	 wbwWN7onlbDPtZJadBoOPbQ3sxyDQxn+TmIn0XIpeyJ8E6Xo9qEN49nUdADfnip42oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IIhBqlbW;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8E606A323
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 19:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C8E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IIhBqlbW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38699cf08dfso7389960eec.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795633739; x=1796238539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
        b=IIhBqlbWbrprmxMZ+kWojREY0lc0WTXHSKBAg6UU/UXHe1Cnkm2qyYNQdRGc51qR0a
         2pYUF3yT5QTuVLqTA2AxB9OD6cZy2UZg0W3D5M2AuJwlpxuiBSy7SBnJetpNQNpU20uB
         fcUaQhiKZCVdLEj4zfd5cEMWGKjDXRdy1MJ20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633739; x=1796238539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
        b=m4c10sQUOGubSPWnPcBhZUpOCgDfC8i54tD/anOAoOaIoBHISuaopm2Do6wdo1wtHu
         tJSCSBH+fx5rtdAQf3Ot9GcEprRaJn5JRU0eALRZlSSyoL5BliT7xw0ho+rgdKZ+FXZ1
         rbJFIfeJi/Scgi+zugon4V1oQfA6j9iFMGFTFb4XHOILvrTEZjsGGTacRQwKjOBClvxv
         qcmVzVr5WmZjZT854K3gW+ruSbV4LVtNvLRy20SWtJ14bvOo1J7AEemc+FyeMsm46Pt+
         R2yCeM6qDna3qBi1aU2+31pDpjxoZICYT329ziavMMNXygxdA6ivCwsODN0yOswuP2UH
         oZtw==
X-Forwarded-Encrypted: i=1; AL+hErGKRnu2SodbO5cYsG2d1FsDi+LbUFgX7bnjIh4gOv+aCKVjgSmQVSW98SCw66FLVhh8dHI3t9eBlgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IVfXFtOmGDTuDzE20zmXVYhNhpAZRHCRhZ7GvIrE6wUaJ1nzD
	byMHg5Juw6+SQ4xIekuV271BYMLd+qvsaVIeb953MBPcqcysuxUQYBsUlYPXeSXxWsHS8OS8Rnv
	iW5c=
X-Gm-Gg: AZFdTZfaz8df69B5bJPiDYFiID6cLmZFDu3CVIy1sJlk8ctNCKJM5vtRJXJQrxRCEGH
	TMZU/Wotha0uIUYFNUKT44Yz0/JnH6pErGhmcOLczPW5jLxzRmNYvb/FXsRpPzpH25UH0+4N8V3
	TWS3gWf9vJU19LtlVppChpxRKgnANqB3XvqprGNBzBlLIkPbf0OxR21X3QthAVvzBWLrjiIIZBt
	FeqO+nnorTcxc0tByg42v9X92gWARDGVRzRtccOKrZXq+gGYZpMVGbm4ZG0re1DjPP0vDS0wsY6
	WEKjBWfcYSZcTVVta8L4VTuOck17n05TQYtSr4SsTTfeD2uRXhjmNGAqpuP8OZa0KO/YY9DLKi0
	/F4UjgMKWzbT4hSxuCT0aTaHu32s01IfV0LwDZ0g1/+UW7rfNg6xUxiu4nLur1aRgqUapuDK9fV
	Dc+OYMPlmiwonvLKLzJvXJtoQT3YPJKPfcytYXnOW6ZR2pF561vpU5eITTPCmoCWQ4+VGnfk+CX
	kzI/MLXhtumSqWNKF6E285+i2pJE/z6RYbrQpMR+GscqtsPv/65F22CoePHDpfm08/mJ2tbpTBJ
	1EBua2lOmDmFZYwPz/FXQ6x+MAktUXzgZDNrL/KoJGQ/3mLBPjxw2YdBBMtKMDNSj3E=
X-Received: by 2002:a05:693c:87d6:20b0:386:bc19:6a30 with SMTP id 5a478bee46e88-386bc196d10mr7852852eec.20.1795633739073;
        Wed, 25 Nov 2026 11:08:59 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm68043117eec.4.2026.11.25.11.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:08:58 -0800 (PST)
Date: Wed, 25 Nov 2026 11:08:56 -0800
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
Message-ID: <awcySI6q3O3_M7Gp@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
 <avZkfg6WMlMzOxpn@google.com>
 <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>
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
In-Reply-To: <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>

Hi Krzysztof,

On Wed, Nov 25, 2026 at 08:07:57AM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2026 02:14, Brian Norris wrote:
> > Hi Krzysztof,
> > 
> > On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> >> On 03/11/2026 03:36, Brian Norris wrote:
> >>> On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >>>> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> >>>>> @@ -0,0 +1,54 @@
> >>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>>> +
> >>>>> +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>>>> +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>>>> +
> >>>>> +/*
> >>>>> + * LPCM IDs of each SSWRP.
> >>>>> + */
> >>>>> +#define LGA_LPCM_CPM			0
> >>>>
> >>>> What are all these?
> >>>
> >>> The binding doc says:
> >>>
> >>>       Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
> >>>       See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >>>       <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.
> >>>
> >>> and
> >>>
> >>>       Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
> >>>       2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >>>       <dt-bindings/clock/google,lga-cpm.h> for clock IDs.
> >>>
> >>> These are the IDs used in the firmware interface to talk about these
> >>> things, as many of the SoC resources involved (clocks, resets, power
> >>> domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
> >>> with indexing within each subsystem).
> >>>
> >>> In reading again, I see that the definitions and explanation of these
> >>> terms and the SoC organization are split a bit between the pmdomain
> >>> commit message and the binding doc. Where would you prefer I elaborate
> >>> more? In the binding doc, the comments here, or both?
> >>
> >> I just try to understand their placement. Bindings should not be in the
> >> soc directory, except a few things without clear subsystem owner. If
> >> this applies for both clocks and resets, maybe this could be firmware,
> > 
> > Maybe firmware, maybe power? LPCM is "Local Power and Clock Manager",
> > and I believe there's essentially 1 LPCM (microcontroller) within each
> > top-level power domain.
> 
> How does it help you to have LPCM ID in the DTS? It's derivative from
> the clock (or could be made derivative)?

For the record: in v2, the LPCM ID for clocks *is* made derivative of a
single-cell clock binding.

More info, in case you had other adjacent non-clock concerns: I settled
on dropping LPCM IDs (and other firmware IDs) from the clock binding
(and DTS) in v2. And LPCM IDs moved out of include/dt-bindings/
entirely, even for resets. I thought this addressed your feedback (after
a few weeks of waiting for further response/clarification) so I sent v2.
I'd appreciate a look at whether v2 is more to your liking.

LPCM IDs remain in the DTS for resets though (as documentation [1]; but
the driver never has to inspect them), because I still think they are
the straightforward way to describe resets, and there's much less
complexity that might imply any "risk" here (vs clocks or pmdomains).

If you look at the v2 reset driver, you see that just like any hardware
indices / GIC numbers in typical reset or IRQ drivers, the firmware IDs
are a simple address scheme that are passed directly through. If I do
the indirection you're asking for, then:

1) I have to add extra indirection tables in the reset driver and
2) the driver will now require per-SoC handling that otherwise is not
   required.

I see you had a separate semi-related question that gained its own
sub-thread. I'll reply to that separately.

Brian

[1] Aligned with Chen-Yu's suggestion:
    https://lore.kernel.org/all/CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com/
