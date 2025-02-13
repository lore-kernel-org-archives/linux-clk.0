Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9A3D97A
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739459941; cv=none; b=ZFvKqUW5E+k6R2P7kkNd8wqw+VQAaTDG7iK3I4jZgiSzAVe6RhrF/IWI08vFa+vrVC86kBqSKFX01NG4mu3jKVFxzfm7UnZ5uNxbhVcHukl2hkqHzLlEokp3TBK+kzo+hDN/LAXGbLKEbtbtsO/1pJ6fZdUaqqDiZbh78y6x2Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739459941; c=relaxed/simple;
	bh=6/MHXBt3ThyNTmD9iHOOhPj6W2u7EZRVkOK3ed1Q64Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZaBRzJ963xHs4+Ivj2rb90uUC9kAWE6bIPjvlcoNFdxwsLpmHwkpqHsg2WWgTgrTUdWk6E6wgX05mBZG806jr6OCNUFlSZiOhiPiW8OC+dT/1u8/r6AsamvukpyJgRo9p25KrGrldHKZ4FcqfcB3+cq16f3rXxhtDmnBYhkX8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VN++il+2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VN++il+2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso217130766b.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 07:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739459938; x=1740064738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/MHXBt3ThyNTmD9iHOOhPj6W2u7EZRVkOK3ed1Q64Q=;
        b=VN++il+2NcLZMuXmB7DtC6t8u7pwISgu60YeSAlSoDlhL+Rz+BjYOrCDuKKGSqJNTv
         +u7wrbDiN6GxzM+lVgGdMuQoo4n9N7OdMHV2clzOhPj+5yq4lXOQQx/M/Mf+WNf2LfGS
         roSljNZR/rru7d2FngHpHdE9M5hnfNZ898pmXAsos05p8zy6zGs1CZ4hGWJxMxi47uwU
         +2ULc+oM+L2mH+Pz2q1MBLw/y7NUaI/FWZ0X/y37mRxw4CBIDGmyGja3Nxyu39j92DDC
         DCdVSScmyexP+VnO4sXZN/4KACKpyrO8nkBqH+vWulEO4uU2T5Ri9VWcZAFsWSgUhwcD
         3q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459938; x=1740064738;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/MHXBt3ThyNTmD9iHOOhPj6W2u7EZRVkOK3ed1Q64Q=;
        b=lTe3fOYP7s4zEuzBCAW7RK2WE3JmL5Eu3MG5yUd+AfFk7vuc+sohEFtn70FkBohV76
         5OteZ3Ou2NSgeseib8GPCE1/Tnw6C3Jnyu4TEUYrQwu8BT8eJtY8FBopwZEHYwka8ie5
         hjifbuqTklbNTs4+ctYH+dOhUcDBjC9OI9AwYPxJs5dc7eGZAedMK/ew+et/kNYeZsjY
         tsEP2m/yJSSWBFX0r1rLCFIfyXU00bMaO/CplXSQPXd3Kl4CbP9fgo2pZ6m3hun9uEPs
         xGBB97PN4839WqZPnzFCzmgwLXbHmi/OihKoWY3rudARSRYROGcG1KvWTZPbJgFu/A1z
         mDrw==
X-Forwarded-Encrypted: i=1; AJvYcCUsgehOUrpEn80stNzRmbZfdM4zYaHqTWQyEPeahKfPsjzWP65E0SwOskhMJ4MJ3KQOBIGvjEUg2wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwucYgxcIut7PvfKvfF7DUtarh8AIDwOESJqLF9AyylJcQNUCaE
	yeoISTlpCHg39P+c4nvHmy2SJ1z3XN/yJWLcUE75thk7wAtfn5X878tfPg8w161YZtqKSFsfWlV
	urxEJH7Ds0FRztA9jqwaf9btePinsVKgR74JrBA==
X-Gm-Gg: ASbGncvRZwfXaoJ/FTINfyic+bQdVsT6PsfXx3y7+wHmU8s3GN4D5DiH6j0D665/+Ce
	KCwvJPJ1557rnFtVsmoNS4sLYFuO4ffVn+Wz5CPQolE8JWeCu8TBvXxCeK/z8bvn8TNbl3+e0j7
	3Zm0rvC2nCqSY5/d+2lcNkrZn0c41c
X-Google-Smtp-Source: AGHT+IEUUAMp1A3OZpYQwTyMrudMkiFtVUqwOeMuLEVr7St6uJlPcG5asSsJxDTLPpX7Ju1+2ET5B41boTMft3YQY5k=
X-Received: by 2002:a17:907:3f25:b0:ab7:e278:2955 with SMTP id
 a640c23a62f3a-ab7f34a31b8mr633294966b.38.1739459936619; Thu, 13 Feb 2025
 07:18:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 15:18:45 +0000
X-Gm-Features: AWEUYZmetnZU5U18XyjwhGQ_ZYLhS4_yaGIMiS4tC4pNvrJmSgh7GCx5E_wteQI
Message-ID: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Andrea della Porta <andrea.porta@suse.com>
Cc: andrew@lunn.ch, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, herve.codina@bootlin.com, krzk+dt@kernel.org, 
	kw@linux.com, Linus Walleij <linus.walleij@linaro.org>, 
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

Hi Andrea,

The problem with this approach (loading an overlay from the RP1 PCIe
driver), and it's one that I have raised with you offline, is that
(unless anyone can prove otherwise) it becomes impossible to create a
Pi 5 DTS file which makes use of the RP1's resources. How do you
declare something as simple as a button wired to an RP1 GPIO, or fan
connected to a PWM output?

If this is the preferred route to upstream adoption, I would prefer it
if rp1.dtso could be split in two - an rp1.dtsi similar to what we
have downstream, and an rp1.dtso that #includes it. In this way we can
keep the patching and duplication to a minimum.

Thanks,

Phil

P.S. Apologies for the lack of context - your emails don't make it
through to rpi-kernel-list, and gmail doesn't make it easy to interact
with a mailing list.
