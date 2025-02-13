Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83347242915
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464058; cv=none; b=WdkMGR49f/xKWKEV2Fhtt9YHWwFrk6L8/mNHv2m8EGE5IlzPomw0ShRzv7ybYcPWZkQ3qHAiKnjq1KNW4FHPlJzmF5zcb81Dco4bbkJ8CajVJx2Tc3fR3ntPpVLu+g3B23J9MawbFGCkNKkPnesB5HIA1iseIMW38e0vwsC/s9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464058; c=relaxed/simple;
	bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQ+werjoM6U5cnjPcZVHLavicXtEn/Vqu1HGRvR2pEZAFoqRkQP7cTgHlm8kdL9emam9/2zwUNgG6p4p3HrKbxZhDSXG3B7cVKq2BG4q6Fx4Gs/B7gPphBrv86TOhjCmszJnULLUfMihDaD7CUGIWpfhClntpZUk4wOaoCKZwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZjaV1ZNq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZjaV1ZNq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so141078066b.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739464055; x=1740068855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
        b=ZjaV1ZNqmYvjW/J9hX4ZCLBp9Fb02u997YQh6qdKHSMif8rYRUrNHUgtB8BBQ2QLCR
         2fioYgRdEguSTwvpDMZpf0uecwykrIo89KN3KO+AyzeRBCmOuvl5eUQ/FdUQnT4FMnSA
         utyTJjZE6pSqnHtYo+a3NdRoOgrY0s9Kbvpe7QLMctxpEfxHW9IxscuVn3ZZSXntQcaf
         I86ETNlHeSSwXLw0dYbfD7MAnMOlNnz3gTLeILHthjrJLNZhzjqXtEHd74NMlGcJ859F
         9oeTD526IYnxt7OOM0CZsYyuAmBzHT7HtUvEN1lPYHZEKXPV+4hwVq+zPb31QLkUPubg
         oZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464055; x=1740068855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
        b=Q06tiuYtpa2pryAIdwntYF2SsfxvJBeJLWk7JdnUlu8BM8HXlNcEkxQ1T8xi3KBqg3
         RT6l6L94jpe8bGNn4f49gYx/RaWiMWJUHP+duXmH3wQUEykkriHzbk+51e4yeuAFjFkK
         Q+iX86E5GDh1PiJE9xBNfhLeZR2rnsPdMsgq/NHXaHmAzrle1Xm5hSNi9JzCnO7GP4jd
         /T1g+G99fkQBA36kZVVPt3RoinDO8fWqCEbp3gec2qo4VM9eoYAJQFFjuGbadKVTDgho
         XPWdT+uPVxOs3NvsX0THDHN0XGkChlqU0VrVDA+V4c5TbOixCipcVEfd3kAlRr+VinU7
         JMaw==
X-Forwarded-Encrypted: i=1; AJvYcCUIimXLqhmzhakGprsNwdpxb4co6KxRft3gkuRl2QU4c8eAARuO7cP1cKUW1P2fvmzg9VE9Xmc7if4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/HRYE977VbDho7/1YqDbceOak6NaGQBIEVEauwRgVM/wJJkuf
	Ik+3fcAfZDHC1Dq6B0etJrk7+7awVGo+P4QalHgDT8G7YIeLPUjzCJNev/qQyX/sreGOGpGODzn
	6fyjSAbFmJyaqU5yK0mIzioAh+nJov5ZTtHSjeQ==
X-Gm-Gg: ASbGncsWlTX66zx6yH/AaVVc4cjj6+scB+Qvbt1HabWgMOlUXQnbW3MDOsU9nzVHBZb
	iRkJKqxr9eGPyevSN0yFA1VtviAJU4l/RYBUpwdAzQdAnsleDgRU9J4Qw6q0nq4WrRi7qk+p8D7
	9mYNDzSKePl6FF+ASRKtGx9kF+U3zf
X-Google-Smtp-Source: AGHT+IGh1IZYUOs4P7JSIz9yKatxKcYCpkTha4+Vt1XXHAvpLvRRPqSwJWHf/GTRbZo8Nm9ZR0QzY9EHYI9QcB0Oy7A=
X-Received: by 2002:a17:906:7956:b0:ab7:f221:f7b4 with SMTP id
 a640c23a62f3a-ab7f34738c0mr776743366b.43.1739464054629; Thu, 13 Feb 2025
 08:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com>
In-Reply-To: <20250213171435.1c2ce376@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 16:27:23 +0000
X-Gm-Features: AWEUYZl0UFEHY2kV2h1h_cYG6cbTpw7bZVsKquFMakyrJEadnvQ1Edus79HpRwQ
Message-ID: <CAMEGJJ1++aeE7WWLVVesbujME+r2WicEkK+CQgigRRp2grYf=A@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, andrew@lunn.ch, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Thu, 13 Feb 2025 at 16:14, Herve Codina <herve.codina@bootlin.com> wrote=
:
>
> Hi Phil,
>
> On Thu, 13 Feb 2025 15:18:45 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Hi Andrea,
> >
> > The problem with this approach (loading an overlay from the RP1 PCIe
> > driver), and it's one that I have raised with you offline, is that
> > (unless anyone can prove otherwise) it becomes impossible to create a
> > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > declare something as simple as a button wired to an RP1 GPIO, or fan
> > connected to a PWM output?
>
> The driver could be improved in a second step.
> For instance, it could load the dtbo from user-space using request_firmar=
e()
> instead of loading the embedded dtbo.
>
> >
> > If this is the preferred route to upstream adoption, I would prefer it
> > if rp1.dtso could be split in two - an rp1.dtsi similar to what we
> > have downstream, and an rp1.dtso that #includes it. In this way we can
> > keep the patching and duplication to a minimum.
>
> Indeed, having a rp1.dtsi avoid duplication but how the rp1.dtso in
> the the kernel sources could include user customization (button, fan, ...=
)
> without being modified ?
> At least we have to '#include <my_rp1_customizations.dtsi>'.
>
> Requesting the dtbo from user-space allows to let the user to create
> its own dtso without the need to modify the one in kernel sources.
>
> Does it make sense ?

I think I understand what you are saying, but at this point the RP1
overlay would no longer be an RP1 overlay - it would be an
RP1-and-everything-connected-to-it overlay, which is inherently
board-specific. Which user-space process do you think would be
responsible for loading this alternative overlay, choosing carefully
based on the platform it is running on? Doesn't that place quite a
burden on all the OS maintainers who up to now have just needed a
kernel and a bunch of dtb files?

If it is considered essential that the upstream Pi 5 dts file does not
include RP1 and its children, then Raspberry Pi are going to have to
walk a different path until we've seen how that can work. By splitting
rp1.dtso as I suggested, and perhaps providing an alternative helper
function that only applies the built-in overlay if the device node
doesn't already exist, we get to stay as close to upstream as
possible.

Phil
