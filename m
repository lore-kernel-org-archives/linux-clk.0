Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296630;
	b=n3hkyZrPizAMdtVCpNCU+mA/D7T+5wI6IfJTrWvU1xew+LqE3bK3OC3ktM9idhdvBkAD
	 gaoiyjK/BrRvk4l1GqrgiiqfOH6Am83r8U+Wb+Lc+/GULU4h21Pw5n1Z+FHZWkeqbnc9g
	 yOG2FDPuSZ3pxI8ciGeBszIKkOgRuNXN/A7gKXZdfBob1u3XlJxTXX90UJBV9d3AA9bqs
	 hyev8BAGh+1v/e5gxJ8GC0srxvXUP8lt959jPIq4RAA+Cgs73vzO+NVzjmstHSh+EOZEr
	 uppNLDmAHxd/PMIlHKzZCHiizDNDYrvZaHdIGOccmVI9A4cnNCDDcgqFPF7p6zIEwbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nDX2rRdVV3QP/6Ts1rsElxSn3+3Z1o4ammOugDPSu3s=;
	b=km2OPHZsA9l1ZHXnPivN1ZDCuoaZJyjmL25Ohn+QBqQKxhCE0YaquCa/RBJvSWRCkeo9
	 p23HsQFTXtJXa6M43GVQyIjmdwQBFeG/NHaDVmcykUTRXE8ZtYaMfgBEuy5EiByghgl2r
	 IoN/HI9W9z3IN/NiHp2yPva2lYcyBZrfqYvj8TD+m7uxfyACmHp5PqmibHilneLkd29kp
	 ewYRIjZEf+6+GQ4CB997Rwc3LbtnBdToE8td+z7L9uypWg9DmQF0SVzsdulJrxmA37r1M
	 /eIagF6pJCYzB4CJUh3GNmbfv+rLiAN4AUMvhDTmnwOp+ZHZz61rN96mInR1G4EsGpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuMj7yiH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD23606A31A
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 17:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuMj7yiH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25074175e9.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793296628; x=1793901428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDX2rRdVV3QP/6Ts1rsElxSn3+3Z1o4ammOugDPSu3s=;
        b=OuMj7yiH2IUcS/V2lonve3C2cgsJev9+d9Lw5c07BZ0N97vBRbsJ3mlh4k2Hsem+Qx
         p4dlaCcs+orJo59rVWBjRW5C2zlJ8GXCX/Kvlg0c7di8WixC+DOTwDPl3ohB7LF8xfNW
         uKlZ8HVgPSjsIqLCbAcufrbNKP146EJMzE+8O+CN/8MOKJR7hzceqXqLQwbkFE0muZzy
         G/nMTGRQ3gzTqfOWu0mUbNTzobadpkE3P9s1GVm7jeGxxFalFcaTJlSK3NnxvWZJu+f4
         2oxNnPst5u0+bLae1a6HqTxZ+oZerGvP2spqxEnnlxdcSnWymtgL6UR1GGR+yp9l+MBT
         H5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296628; x=1793901428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDX2rRdVV3QP/6Ts1rsElxSn3+3Z1o4ammOugDPSu3s=;
        b=QzE7DC75lJY2p/FI1vyD7lm+K3+BkQ56NRvAjAEXXYxSvYRIo+kFCe+j+Tey0HJhTl
         6bdeNyNT9hjrpt5S0QLzE48xWP7sf0xk/4PnxjJBHuOqIrwVXYlXGgxpE0hdr2Yq8Apy
         KccaAdquKQjBT+oajyBqwtP7/l+FpaIw5tscegLpMrwcLdq8xu5tB7qWSuA6XyA9t55J
         W5q/2JO3XsnpYovcFHkhX4V/ZNOE9lUfz9e+BIPGhNrXm1Zvlh4cPo7xwR9ijFrM8mMQ
         CNvuJdOeqFzIF0nd3bQmuzEn19Pf3CoWkALiRXxXYVD+UmqtFSUljFBDcyLz5mOuMwRx
         lkMg==
X-Forwarded-Encrypted: i=1; AKwUvBzfhqRWKQR7rk82kN4QnmtUVR1SPwGTZysvnLdkxkAcU4IaNHVP7+xgy588QAibL/swJa8EX2aNnws=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwxeJpQw4rlFftlwR+hK8uEp08rKuYZ1c/OMzmDKqv9dvulB4x
	KNZa+WNFIktAVBuGB/r7kuSo2+vrRv0/4YWnQF7uUNfpIrgBVjOwGaMEHMoBO6D1za8=
X-Gm-Gg: AYBFou33c18lxYgu5y5S7L1LyBHmzvtiR3T786pvEnpwLlnFvqkTd3E9uWOBnCaE4mT
	nuIVZuswF9AAi8de6r/CxEWzeaV1++JtLDBQVgadmsvCI+78EueiCQn99jmbIJCRreMMcp8Yebu
	Bgkv+DEWezzZ2ilMprGmjrJ/4HB/iZNVELIF0BvSVA5S/MADuqG3N/yBdKmjT7+TSik2Hn+FnPD
	PEFSKKhI0y8rGYwz0mHQPht45VVNk0z8PY0Lcj6U96PeSg2eyh0A4mjTMImOez8FQxWXlvp1C0c
	p+uYk8WdlMpoIvpJwikOFV5fQqA1Agob1C22ItIKj/ZCa6q5b7PJebB5SRueUijxqi3PoMnw+X2
	yeHkzgdx+qVx4qcMZbH+wcV4wI6BPUfJw4dARWVMX0c7hhx5XSpVc67JScHj83e5qxFbt5X02ik
	ISwvjJtROFKOwv1djR23YlHJs1+C9TrJZCpROUM67EmbLBiu8JNcGUBnI/sa0KuGD45mWQRGRbm
	D4tlHXZAW3FU2T4J0aNbXSvR300cBDLU5bxkQsLqmgAI/6aJfVITwlaTTKTLvQvhxIJDkYLqdDy
	NkeY9XERi9C687MZmBsHWBd+ujLJ+jvsMX+qWs2A38CmKvdG7FUYh9H84IqfUvpr5OrCrVsvaK9
	0oKlVeauW86PPu6hqKtWZpvV9uZ1tpgc60dl0RArFqV0KZ3ytsxZCE0tJZeIpMIY5u0dWNf9Vik
	JfBs9kZJvaoMArqg==
X-Received: by 2002:a05:600d:16:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4a9672f7512mr121511495e9.23.1793296627848;
        Thu, 29 Oct 2026 10:57:07 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm80168055e9.14.2026.10.29.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:57:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:57:04 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
	kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
Message-ID: <auOI8LbZNWbNGJuN@aspen.lan>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
 <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
 <fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.org>
 <4bb9c85e-f991-484e-861f-1940b8263890@riscstar.com>
 <e3c9087e-fea5-4ec6-852a-a0e0e33ce461@kernel.org>
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
In-Reply-To: <e3c9087e-fea5-4ec6-852a-a0e0e33ce461@kernel.org>

On Thu, Oct 29, 2026 at 02:54:35PM +0100, Krzysztof Kozlowski wrote:
> On 28/09/2026 16:52, Alex Elder wrote:
> > On 9/23/26 2:25 AM, Krzysztof Kozlowski wrote:
> > I believe the TC9564 *is* such a "complex" SoC.  And in any case,
> > anywhere pci-ep-bus is used, it implies that some chip internals
> > would be described using devicetree.
> >
> > Would incorporating the chip internals in a devicetree *overlay*
> > have any effect on your opinion on this?  I.e., the "main"
> > devicetree nodes would simply define the PCI device hierarchy,
> > but anything behind an endpoint would be described in an overlay.
> > This way, pci-ep-bus on a PCI endpoint just provides an external
> > interface onto which a very complex device could be "mounted"
> > (and described in an overlay).
> >
> > I'd like to continue to move ahead with upstreaming support for
> > this SoC, but to me it seems you have basic doubts about
> > pci-ep-bus and I'd like to get past that.
>
> Well, Rob might understand this better, so maybe review from him will
> solve these questions.

To aid whichever of the DT maintainers can help with review, I'd
like to offer a little more background on the "TC9564 is a complex
device" thread.

Hopefully it doesn't contradict what you've been discussing with Alex,
but it will perhaps give a different perspective.

My thoughts neatly divide into three parts:

1. The TC956x-series form a complex enough family of multi-function
   devices. We will need some way to describe it's structure (both
   external *and* internal).

2. There are multiple ways to describe a device's connectivity but
   devicetree is great for this job making it an excellent technical
   solution.

3. We have done sufficient thought experiments (and real-world
   experiments) to be confident that our solution is not in conflict
   with treating the QPS615 as a regular PCIe card.

Having offered the summary above because I now need to spend a lot of
words to back up the above. I'm afraid I have to go a long way past
the syscon bindings perimeter!

## Why I think the QPS615 is "complex"

I hope I don't have to rehash the multi-function part too much. The TC9564
included comms peripherals (UART, I2C, SPI, GPIO), some very common SoC-ish
management peripherals (reset, clock, interrupt controller), a Cortex-M3
controller (with access to pretty much everything) and some licensed
peripherals with well established devicetree bindings (2x Designware XGMAC).

It should be noted that TC9564 does also include a PCIe switch. However the
switch is *upstream* of the PCIe endpoint we use to control most of the other
TC9564 peripherals so you won't see it any any bindings that have come from
Alex and me.

Another factor that makes describing TC9564 complex is the presence or
absence of side channels that give the host SoC mechanisms to communicate with
the TC9564 without using PCIe.

 * On RB3gen2 there are host GPIOs that control TC9564 peripherals such as the
   ethernet phys (used for power control). Additionally there is an I2C side
   channel that is used to control the TC9564 GPIOs. This is needed
   to solve a chicken-and-egg problem related to the PCIe #PERST signals
   in the PCIe switch but also ends up being used to reset the ethernet phys.

 * On a real PCIe card there will be no side channels, which means the TC9564
   GPIO peripheral would suddenly become `status = "okay"` on the PCIe bus
   instead of the I2C bus (in this case we know that there is no
   chicken-and-egg... if there were then the card won't work electrically).

Thus, even with one part number, we already have some fairly significant
connectivity difference depending on the board design.

Finally, the TC956x is a family and we'd like to reuse as much as possible
across the part numbers that will come. Having a convenient way to
reuse common subsystems is is very valuable.

## Why devicetree is a great technical solution

Clearly we *could* rely on a big pile of what is essentially platform
bus code in the PCIe driver to describe the connectivity and familial
difference. Renaming it to auxiliary bus code doesn't stop the results
from feeling like fifteen-year old platform bus code.

For that reason we view devicetree as a better solution to model the
hardware. DT already has idiomatic ways to describe the connectivity of
the device.

Most of the non-discoverable baseboard <-> TC9564 connections are for the
MAC and using devicetree simplifies the binding there since we add only a
few essentials over the existing stmmac bindings (there are existing
stmmac PCIe cards but I believe many are for MACs with a smaller
feature set than TC9564 which makes things easier).

You are correct that for several other peripherals we only describe
internal connectivity. Ultimately we are copying prior art from the
Raspberry Pi RP1. RP1 is also a complex MFD that exposes its functions
in a similar way to what we propose for TC9564 (and on Raspberry Pi 5
is it soldered down just like it is on RB3gen2). FWIW I'd note that I
think the RP1 bindings describe peripherals with no external
connectivity.

So, it's not that the card can't come alive if we use open-coded C to
describe the connectivity. It can. We've been there and done it. Instead
the argument is that *not* using DT to describe TC956x family parts in
their various baseboards is a missed opportunity!

## Using TC9564 as a PCIe card

Currently our work only supports QPS615 soldered onto an RB3gen2 with all it's
sidebands. Here we settled on a static devicetree (no overlay) similar to
Raspberry Pi RP1. We tried overlays, the resulting DTs were fragmented and hard
to read. Ultimately we felt embedded developers would find working with a static
DT easier.

If you feel super strongly that the syscon bindings (which is what this
thread is about) should not appear in a static device tree, we maybe we
could discuss overlaying the discoverable-from-PID-VID parts as an
"embedded TC9564" overlay. Personally I really dislike this approach
because it's hard to read. Also it wouldn't actually impact the DT
bindings so perhaps isn't in scope yet anyway!

For real PCIe cards I definitely think DT overlay is the answer. Here
there are no sidebands meaning there will be no phandles linking the
overlay to the base DT (if there is one). That resolved the concerns
about readability of the overlay. If we actually had a PCIe card today
then I'm confident we'd be able to reuse almost all the driver work
Alex has posted so far and that we'd be able to run it on a system
using ACPI as its primary hardware model.

There are still some warts related to PCIe card identification but they are
unrelated to the DT bindings. TC9564 has a fixed VID/PID so, when there
is no static DT to help us, we must dynamically interrogate the card
from the pcie driver to discover what it actually is and figure out *which*
overlay to load. This is another reason I view devicetree as
an excellent technical solution. Having an easy way to describe each PCIe
card form its schematic is a great property to have.

In short, the TC9564 on a real removable PCIe card has been an
important thought experiment for me throughout this work. It's also
been a real experiment: we did implement dynamic overlay for RB3gen2
and have it working. The thing that moved us back to static DT
for this board was the sidebands and these don't exist for a real PCIe
card.

## That's all folks!

In short, for zany embedded designs with nasty (and mandatory) side
channels, we'd like to use the DT bindings we have proposed from static DT.
This should be comfortable and ergonomic for embedded developers who
are accustomed to slinging DTs around.

For sensible grown up designs that need to cooperate with both DT and
ACPI, we'd like to use DT overlay. This essentially makes the use of DT
an implementation detail that reduces maintenance by avoiding reinvention.



Daniel.
