Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B6211479
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037843; cv=none; b=RjS4zTkSuuSqYbYTvpauarNQua7oi06cbKAEJEG9tFgP3xJD79LAjEm0QNv5wTDaZneBmiDmkl4cNejoZ5HRYkUfKKjCdYbgPjkRPdUZvhV591U3XuQY1y+KhTnuQwJwFvvdghibNTXo9AeePe1kM4EluAUPDL9gtZ1pD/zUmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037843; c=relaxed/simple;
	bh=dfr+O86TVilJxSLigDPHqskAHRxN4csm1x/HzUwrWiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eF/ZqR2VkWyRo7uQm0+yw1vjm7taT6FjR9eGEkQQ/Q300DO5qv8AUbIAaOXi5OjDLtsd5sYj5r9TTZwcLpuQlEwlcTBUh9+6ok5XOYjtJS+/I770j7DDZoyVTI84Onr2GgDYcwa/PGbO44z56FjbW57CdvPuD808QuKiJ6bkZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=0lyzPvCO; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="0lyzPvCO"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e4063e731eso4550085ab.3
        for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754037841; x=1754642641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLyL9cAx6BfgxcO7E+1dWaZ7Plp09nvga7blXTlglSc=;
        b=0lyzPvCOeaDHS8nDfMitVC3SZ/t6tE/49R8pQrRW5nnkYBfsshjulW8XgGq1gyULXz
         s3UdRkjl2OwA7TJqYUNpODxyyAVQYhkGh9So+3xzYl8uBiM/DTd5f8a6Fq+gKgrW4YfS
         WYwcBwbPR2R2QBLSWJ5F454RabVrgz8wiTXKfBI1/q1BE5inSpCf/W3IKph8xKvVrZ2Y
         j41yD4+1VbddL7yJkcFRAB63ePxzKMHZVloiyaoV88QINC/v+grLsSS41bMMTVniY9R+
         7STiHTjdwDKk7fdheIsFuuVJJH8r7xWUYqwsjHO2xqSV5adGToN+xr22IRbINnC3SJid
         pVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037841; x=1754642641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLyL9cAx6BfgxcO7E+1dWaZ7Plp09nvga7blXTlglSc=;
        b=JgXYULe9XBRlRjFqaHsXRRVRaOiDwljrJ6ufnsJQh+KidgBuhjJvS/klrXvFxIWU8n
         RhZZcyR55kZu9wWDqVJblNOp4A3XkNzJ9cp42ztY9bN70Wuu5zfKHXxQHMLhyRUAxkUG
         1aK7adkyMrHvEHnCP/CSqKze/UNMc6svq1wsFmheiNRCHWoda3bzS11CiOFukE04tXPB
         RcQs2fkHismHvSIy9sW8VZ5FWpZixQVIeBHWFNpKzmrnWDwYaCEZXo380wm/tedy+lIz
         MsaXn405gXP7dvDz1ISRR8bY+Az4BttZv7GxW1HLHV0973JX4/N5E01fK74e6+ldyooq
         DiFg==
X-Forwarded-Encrypted: i=1; AJvYcCV84ZBNrvj9p1TB9nKcGyWgXAFWg2bShTTKqf6Ljys6M9nYxCSCLM5AG96c7s+yVTy+EzlNFNV+LG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz09w8SWsPG0gLVbUIuddgMojWsBiuConAmWEpJz5y1vbDxxOCR
	2prPoQr4ShsiKHq2dnFacuAHEspzWntdR523qT1OEzcOnlxkig0KdPaN0KMZzFWv/84lWeLON4a
	4jEUvBVNDZ3inhZ8mksN58/t7dNqaNbrJXVGxjA2ZUg==
X-Gm-Gg: ASbGncu9g3xhOaj/nYKSlmC5zxY29qeHbYcu4nhpYorKCK2thw8GHnl+tJwY45r/1zg
	usOxf1rTlfM5uwKtxHvSfdUqDvkNGNOpaLKw5K0xV7E4wg6Dy/V0kjw92EBkgShv5Tm2eCEtuOD
	NpRsXUqCgn6Y4peMg/FGetNijhki3ITezXxAhm+59aF10tNkMQl6R0vLKAnwB114LWdPTo07tWV
	J5gFNGFJID3EXU=
X-Google-Smtp-Source: AGHT+IHmDGSj8nBVu2UdqL0jDDjl4m5SMVZpNB5EGI45FpC4Q2VdKsJNxym9Ty834wUMcEEJgUTipp1SECn/mOC0qB8=
X-Received: by 2002:a92:d447:0:b0:3e2:9eac:dc01 with SMTP id
 e9e14a558f8ab-3e3f628ea39mr174094325ab.18.1754037840628; Fri, 01 Aug 2025
 01:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-9-apatel@ventanamicro.com> <175341132347.3513.7184287611040628050@lazor>
 <CAK9=C2UDV3xCpKxZmT4NsRvN=hCcQrcx0fr-QFD2fuOrqmXmHA@mail.gmail.com>
 <175359739515.3513.8664828076215459722@lazor> <CAK9=C2WRVHZ4FdoW0fKRRFg6qAC5asn03dHj_NXkMKfBXKkXdA@mail.gmail.com>
 <175398062959.3513.15195554063633980579@lazor>
In-Reply-To: <175398062959.3513.15195554063633980579@lazor>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Aug 2025 14:13:49 +0530
X-Gm-Features: Ac12FXz23n5I2gUDW1GUPhVBv6qqLgn5liXl8qbTORMXLg42e8K813D_AmSmA3A
Message-ID: <CAAhSdy31yTWn2zXO+rVH0ziQ9YSc-tMV4g65Wso+3s=p_h2cGA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-acp <i@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:20=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Quoting Anup Patel (2025-07-28 02:19:23)
> > On Sun, Jul 27, 2025 at 11:53=E2=80=AFAM Stephen Boyd <sboyd@kernel.org=
> wrote:
> > >
> > > It's not providing clks? The SBI firmware is not discoverable? Do you
> > > have a pointer to the DTS for this node and the clock controller node=
 in
> > > the next patch? I'd like to understand why this is named a clock
> > > controller when it doesn't provide clks.
> >
> > The firmware driver is not providing clks. Also, the SBI firmware and
> > various SBI extensions are indeed discoverable from supervisor software=
.
>
> If SBI extensions are discoverable from software why do we need a DT
> binding?

The firmware which implements the SBI MPXY channel needs to
discover the underlying RPMI service group from DT.

Let's say we have only one RPMI shared memory transport between
application processors and platform microcontroller. This RPMI transport
will be shared between M-mode firmware (OpenSBI) and S-mode (Linux).

The OpenSBI will use the following example DT nodes to probe the
mailbox driver and MPXY driver to expose MPXY channel to S-mode.

mb: mailbox@10080000 {
    compatible =3D "riscv,rpmi-shmem-mbox";
    reg =3D <0x00 0x10080000 0x00 0x10000>,
         <0x00 0x10090000 0x00 0x10000>,
         <0x00 0x100a0000 0x00 0x10000>;
    reg-names =3D "a2p-req", "p2a-ack", "a2p-doorbell";
    #mbox-cells =3D <0x01>;
    riscv,slot-size =3D <0x40>;
    riscv,p2a-doorbell-sysmsi-index =3D <3>;
};

clock-service {
    compatible =3D "riscv,rpmi-mpxy-clock";
    mboxes =3D <&mb 0x08>;
    riscv,sbi-mpxy-channel-id =3D <0x1001>;
};

Based on the above, Linux will use the following example DT nodes
to probe the Linux MPXY mailbox driver and RPMI clock driver.

mpxy_mbox: sbi-mpxy-mbox {
    compatible =3D "riscv,sbi-mpxy-mbox";
    #mbox-cells =3D <2>;
    msi-parent =3D <&imsic_slevel>;
};

rpmi-clk {
    compatible =3D "riscv,rpmi-clock";
    #clock-cells =3D <1>;
    mboxes =3D <&mpxy_mbox 0x1001 0x0>;
};

I hope the above example DT node provides a better picture
about how DT bindings are used in firmware and Linux.

Regards,
Anup
