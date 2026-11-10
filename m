Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278146;
	b=Dxyd19xy/ewgDefu+Z5Vug0wgxZ3SXfeGr8DW+WkliaJ3etI+umzrWrQnONxQpfq7OXv
	 b8oOmZqJX1ra3Wm7MznJLnieMfV8tB2L5cvjvVwkltG9PXF4w4uv5e00FNvJ6rNTkzIJX
	 fdLLYBRm2DFOFjmcdI2CenvFK5XuvA8602dUX+9KA4/3k8xsYZkANY6WK9pTcY7WjUn1/
	 Xf7LrucysIrMtY6T0bMLWRXZ/bTC6MW6UhvBPqZ+UWZZe0Ods4ytLG2MIyRGUPP3i2Dka
	 NS0qHeDVIjJjcXLTOg7hmYn2OEhAqONZf3eWY7knfVtgPMkfDmY9uATlUQM3rG7BKjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
	b=D69KHkynmioewLTWJjwG/5YzrfsnOmyvGbeIFXDvwrK8D6qMlLv8tcdG9qoNWLdUt4ML
	 6a7yEdE/yfr31p5C18KaTM3qQXNOLYaY8Ze0IKSCh5vFg/uy//fmU2W+UsIosqrVSoIdx
	 nNw4b7b827bLK8/dgnxvKdEXrhZwffI9ggkDYdTMSx+xg2/lKaXN3cNguRlGmwYKyC3gD
	 5eqqFcdx4FRhplG2JBg9qpBNZHULIevdxgp6/segTl37e0mjF0bJfZYONebhaVZD2GYHr
	 uU6KGl6kFX40jqst5IqTHUBDYVo48tGfQUIbo3Vp37NWAHtdXle/f/Z7gOcmAtZba/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A89606A334
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 02:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A89606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso1897276a12.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 18:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278144; cv=none;
        d=google.com; s=arc-20260327;
        b=dju/BblzLcz2swWElzNNQLbn+B4JWzD6hpWmjOp3K6aQ852jzXp9cuvUfQrOS0ACix
         ZR+R+Ag4wNlrkkUyTeuB/9BCzyHttNi6Uw9hc+QCHMvE2en9VBQLeGoWByv8ERdwKctd
         gt2dMU0G/VuXPzCXJ3y8+8xqUaA0tDkrDeJV9O/ui8bcTZUiz9O9jG37/l2bn99FQ2ag
         qpXzsGAl4UjAuI6wA0hyCGcv6HghdN2o17ZYUYWa/Xn50UcFMR3X3P213L21PLE9yAnK
         GRCul4FGVBjWwmMi6t6XSzRlPs06Vm7bX892OiiviFfhp4jMEbED6fPpC196A/HMpyla
         weMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        fh=DSP+GxauIs9i7ILBMz946Mp3yN+77oziDi7fhcc5fk0=;
        b=ok+LO+67UBOiidP4gDb/7naeWmpdnm3KGIwzUp/UD1JFgHAIhK5Tm+mV66y2DirbdF
         F2nV9GPfTWAULTdXIB0W1LpIuy/ZzY17Qw24VuEtRLAteRRDCgnm4FPyK0xdeUqnGzBH
         H3PWk4QbXk96vhqdUVLfV9mBXPdS0dPqA5V7We27YJtzZ55PBef1ba9xSGuIVK+eer0B
         YoxkqPZ/cKRacL7iml/oSOcrWFo1aOTVJOyxKGCiyjWz9Ulzk8dlb9+U+dMrGv47H6CR
         eFL/gSihRrzG5nj+9IDubhGu8zRICmXyvH58GYjjOIWEJvL4ApqMJtVXlyd7juqVMdyB
         /3Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278144; x=1794882944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=eWeSr5r5o4b1bkqYgjtJbC3rvhYpbz3xWgu0aFWS22hceYif1O3IQXjrS3egH1On7Y
         KX2rRkHlzyj9L1BWTMksqurfYziKbAMiQ/sLsnW2woDzPSHgBnaBJkAHN9eMGje7En8F
         hmedJE2eyTyBa0d220Zu2/+RfZYbFaZSycyh9uhIuIfnwXcRYUnaPlgIB04++iJw4rMZ
         zlt+wbkvaTn9Su/9+0JxBb+QzhIuCezceOZaJHA7ngx38wdX5AXaFTH3QQ6G3bMIDWo7
         a57FxHRfYEDzvyHNNLpvVnxr/9YhRNWLNU4jxDGHiMM8iGpaZNV+iJoblOzKcHB10bum
         VEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278144; x=1794882944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=pHgTxvppLASy8hSTWuIlYXjpBJT4k9YWTRfmTdasX0EDteqE1e/rkNIvwUsXkzJi8e
         F0Aqb8Mwh4kQ35Ai7pwF+5c2jpNqQ7y2K+2dPByVom3RYcMYy0YSa4sv1hnigXB/Vk0+
         KmW7PWOHMl4TPujNckHuQLLhDDtJLc/F2EaPSb79B5XYbrJUwdZYccoSXT97R8i/e7xz
         T/vXmJu/mEgu2q5G1GJLFAHT0ZMVThwglKP617llb8RPQ5VZyZ4yfh2BKZGfCn4i6MHC
         qujn5s68HOg5sZMZUNK5Sh8qpV3Z5UkTaH8i2WWS9vW479dj6h2VF/Fb7PTMc9iY6Fev
         qwBQ==
X-Forwarded-Encrypted: i=1; AL+hErGyty3Ee9ln0vjukGkr914nFXrNRrZgSgKuV2Dtc+rtXNCg4souX60k/2muN9EwSUyUPjW9lfWj6a4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qok+VnWU/mG7t//xLG7UQNjbzZb7g1BvD+qxijBIUysKMX+Pq
	8Igx3dKFoAtmGd6DlrRS1EdK2GEN0AJTEPJ6JJ/a1fdoEuE7KECW/kl4iFjyUS0AKqigjog9GmD
	LU+i+5bgle72ulEL3INks0zqHtomL0oE=
X-Gm-Gg: AYBFou1u4ihz1v7IEYJ6C39BNQDafhMbcrLWdJk1xUDXXbrWnoWUs5pmNlyr9uY+EP9
	F7abYZThs4Ia51FWhdv4Bq38SzDf+IkZoS66LWemggNuDYuh6H7i0GSPzi5rz2V4AaATPXe4fZc
	ujNo8sw0+NyUcbWjs0/Qb8Zzo83SmF7i1UhZn0sIuE9kRw/tL8D52DCb0jGig8debCNFpwSw0U8
	etLB+ALke74IOaUjX7Q+1UFP0DdywX2CqGphTVu6vclLCLza2zvAABEzrFDinoYlu8d+SH0aHrk
	nlSKnoXZgTy2bIgyxL7phhHCHG2YutcoW7H3GN89ljUDmRbeKMJbZ+jdwtWe7t28t4oX79bTlqF
	QT0zqbgEBmFBFYSGwdisKmvs8jil2VSJ7SZ0hdc64DgAPCVTbwRkfkQMc1GF3TIlJ8cuVsicbGG
	gHsN0jlnDp66gQ/4iYveRHT6SfedznQA0HgqSBqpvREFoRfjF5T30c6rT+kpAOFIUNTjOB6XRM0
	+TspT5ZVMkDbSyF/KY/8TSYZieefzr0XB2zcKwd+rUi0JClUg==
X-Received: by 2002:a05:6402:1ed3:b0:6b5:6116:e333 with SMTP id
 4fb4d7f45d1cf-6b756ae9459mr1091731a12.31.1794278144068; Mon, 09 Nov 2026
 18:35:44 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <avKAhjtbi85dpGoV@x1g10>
In-Reply-To: <avKAhjtbi85dpGoV@x1g10>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Nov 2026 18:35:32 -0800
X-Gm-Features: AclHuK_Jcl2NU-HrOo7MbkFV6enMWs315CdjsGGJBAubQkYibDnJglGFx-rUHxk
Message-ID: <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
To: Brian Masney <masneyb@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:25=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> > The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> > arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
> > clock before the driver core is up. This series replaces it with a new
> > driver in drivers/clk.
> >
> > Only the reference and CPU clocks are registered early, with
> > CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
> > plat_time_init(). A platform driver bound to the same node registers th=
e
> > DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provide=
r
> > returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> >
> > Patches 1 and 2 move the two remaining non-clock duties out of the arch
> > clock code, so that it only uses its own registers and the clk API: the
> > QCA956x timer interrupt workaround, and the reference clock that is
> > read from the bootstrap pins when the device tree has no rate. Patches =
3
> > and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver=
,
> > and patch 6 removes the old code.
> >
> > Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
> > DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
> > of the old code. The serial console, both GMACs, the PCIe PLL with a
> > QCA9880 behind it, and the WMAC all work, and no devices are left
> > deferred. The other SoCs are not tested on hardware. For each SoC the
> > rate calculation was compiled in userspace together with the old code
> > and fed 2 million random register sets. The results are identical,
> > except where the old code overflowed 32 bits with register values that
> > no real setup uses.
> >
> > Changes in v2:
> > - Post the new driver as one patch, instead of moving
> >   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
> >   patches (review feedback).
> > - Register only the reference and CPU clocks with CLK_OF_DECLARE, and
> >   the others from a platform driver (review feedback).
> > - Describe the SoCs with match data, and read the CPU, DDR and AHB
> >   selection of AR934x and later with one function.
> > - Keep mapping the AR934x SRIF block from its fixed address. It lies
> >   inside the wireless MAC registers, which ath9k claims, so it can't be
> >   a reg entry of the PLL node.
> > - Drop the clkdev registrations, which have no users.
> >
> > Claude Code (Claude Opus 5.5) was used while preparing this series. It
> > wrote most of the new driver from the old one, together with the
> > userspace test of the rate calculation. I reviewed and tested every
> > change and take responsibility for it.
>
> 40 minutes elapsed from when I asked for changes to when a fully formed
> new driver was posted with major changes. Your cover letter says this
> v2 was tested on real hardware, however I am honestly a bit skeptical
> given the short time frame. On top of that, that's not enough time to
> also go through what all Claude did for you. Please slow down!!
This was tested with a linux-next kernel on an Archer C7 v2 hooked up
through serial and two ethernet cables (LAN and WAN). There's no
difference that I can see between the old and new driver.

That being said, I only have two pieces of hardware on which testing
can be done. Both are rather new relatively speaking. Older version of
this series is currently live on OpenWrt with seemingly no ill
consequences.
>
> I'm going to pass on reviewing this version. I want you to take some
> time to test this on real hardware, and understand the code. If after
> that you truly have no additional changes, then I'll reconsider
> reviewing this version.
Sashiko had two complaints. I'll fix those in v3.
>
> Also, if you want to help, then consider helping with reviews on patches
> from other people, in particular with the large series for the new SoC
> vendors. It's a lot of work reviewing the flood of patches from
> everyone. You can see the backlog for the clk core on the kernel.org
> patchwork server.
I agree. It's quite unfortunate and have no solution to it.
>
> Brian
