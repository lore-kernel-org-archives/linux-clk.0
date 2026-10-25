Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926171;
	b=WK9vvVXP5adAk8TqcZhkBqFrfo9g2gJBYn5V4nIQrRb2uCJZMXdpKzluScSxIoqHOFQs
	 MG/S6UIY9aVrEfHuah+ovlMU65ZKquhgZCwUPrYLKrzIYtK3I7GsHOtmH+NiaWbQ3P1yQ
	 3ALodz5hozscSmY6WyLhHbTCZOAF2r1pKnqTaab2NEB//vKBYEoTQ3nW+y+xXaIHf4GYE
	 4YAMtwP3+7eVAcjn/sxt1GcYCap4Bi4Ua1wiezN+JAUzvy4rOFtRFPuz3sarNWIjBw0JH
	 29tHFBqpoWCe/+ebGqSkjk2m3aSvqSoKuwFZjrUdVQZU7w8JM9LIHT+q8CICVF4Fhhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926171;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
	b=ygBCUhy2u4zTAVbVXgsLbdI8zYNzsmaWjRaatrarzUu4Oc8x4auaZTMlsFO1UnhbLt1v
	 oKx0RZQ4MAYj4F6Vi6bYxkBPDydLbhir9lFEruGQPYGzvd+TT9aUmOWlNp/h4eLeLB7QE
	 JNJIGrLQA0lr3mf0LK2GmYcQCqfGBvHpZWhhxBBLuxkoBp8iA6DMWAIHJU51Is6L6idK1
	 Micd3EbHB0xqMRS4KFQBxk+qM6iSRZw6vY1CBQ2Jn34UzbXL6TcQDCMzViDx7SrVMcFs5
	 TTXym9Wk8p9cKJpzkGnTmkHvxiVouz65EFksVYLGBDv1VtpBoqf5pea5ozpJa30cnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF1606A31A
	for <linux-clk@vger.kernel.org>; Sun, 25 Oct 2026 11:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FF1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1648169241.2
        for <linux-clk@vger.kernel.org>; Sun, 25 Oct 2026 04:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792926169; x=1793530969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
        b=PavoeICEWHQd0J7YWNUzts4nyHItP8yxM7RFNAGqiVLejT4WsBNdtYPTVC/st0Ljdp
         TdjF4auxi/AlbuM0x/20iG4wbj93MBEjIVeamZt9Z0DVPKKDo1GAtn1tOsOr+aivWJn0
         lqWZ3t2q6OzoU0etZwhVHRw8xF+sDfH3Ov4Dq+/gQUKZgC0use90a2nNLO1/2QpbSl7g
         3OskHpDvJ+vJM6Svna6NCWl3V3wshRSezTFLaCE8HzjU3ful7beIc5YGI6sPqwMSrxWi
         VjyvKUzjNXQJJYV9ob9zt6n9VmUThRmgRCp0/yjXmdSmEwkEf2oRG6qmelfHGoYruVaR
         q5kw==
X-Forwarded-Encrypted: i=1; AKwUvBzgFa147BXqu0HW5NA/A7qKAJtV7uSFkpNjHXstll+pcFYuSEGrjgcsy7tGBkq5rfDkmMxqjD4Uw64=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJRbjdEMwu5ExVK382tdp2OTc1+HrcOiho2Q5tgISfc6AtmkT2
	rcLx5j2iVhZM0ETHEB2OcnNfoBWb8JGvANy4r0PZGASZj3by+quEdcYIrSWhvW3p
X-Gm-Gg: AYBFou0BajzBQ9dJGqrkQNVO3ZnCR82L8GLZ1CymSBHsoMGo8MHINwqLU09vtOk90Vs
	qWTsfX4i85spd6XAS4w3LeFDKEa90f1IQ903o/1YI04Lo1kW0ENfqviyu5yO3serFb9pLSoYAb5
	GSHksL+hdTuw0iEp7SHmvdLZflsOYQOiIVZLBM1LiYBYW7CUnHNktucUdr/GNVSrPi+7EnUskfN
	SfK3yYrcUAok/JdjTYlFepbkoq9lDdR6pzEBZ8tBqQ3EGuuSX0LOfANFNl1xXjIaYgAFtnU/gTX
	62hVbhpr9InRsjF+sGRb8qFsHrWKaaVX5mEFQuR7lsVMe1LsJuOnloz45VsaQS4NKxJzD754xcJ
	y89bQX5wBfYrVKVQjuLhnizW01c1vbT3Xa0pjw6BQSlWLmT5oSzKpHXqSZxAqsr0wHt5owfxAQZ
	Hqqt1WUaK3gjICY8TTRvccESCjm7yesrzXVgTIYaLQORV4Is2U6jZVLSpiCF4EmDueLFhl76eSR
	7wxIWoLA36Q80GqjyMMSjc+hcN2G/sql5FdoTCRHCX60NT9XMZ617yQmAkSVXCYuFPdOkAl/Li5
	AgFUEPxn1DbD1/3cjZ3RCQtuE1smHlnY8xhK9vk=
X-Received: by 2002:a05:6102:8698:10b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7ce62a06afamr639635137.9.1792926169657;
        Sun, 25 Oct 2026 04:02:49 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2848a9sm4518675137.10.2026.10.25.04.02.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:02:28 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98febe968deso1684593241.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Oct 2026 04:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvJyKotdLyXktp+Xnf5UL4dCyVMot+H02cXvj+1Tb8p9NYp50h/kAueF/M79IHo7upLgFPBrtYkSA=@vger.kernel.org
X-Received: by 2002:a05:6102:4423:b0:7cc:776:6c54 with SMTP id
 ada2fe7eead31-7ce5cd246a2mr1349167137.21.1792926141152; Sun, 25 Oct 2026
 04:02:21 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
 <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
In-Reply-To: <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Oct 2026 12:02:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
X-Gm-Features: AclHuK8CaW_17mlyRa4Y7XpLgXIYuKk4YmAF6_as85fetPG-fOFZ1fPRmRtKgD8
Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 24 Oct 2026 at 07:35, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/23/26 7:50 PM, Geert Uytterhoeven wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> > the Renesas R-Car X5H (R8A78000) SoC.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes compared to Marek's original:
> >    - Use hardware clocks/power-domains/resets instead of direct SCMI
> >      references,
> >    - Drop gpio-ranges properties for now, as upstream lacks Pin Function
> >      Controller (PFC) support.
>
> Is that ^ OK ? If so, good, TIL.

Yes, it works without PFC, as long as the pins are kept at their reset
state or configured for GPIO before Linux boots, which is the case
for the pins on the PWM connector.

> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

BTW, looks like I used a wrong base for submitting, as the context does
include the pfc node, which is not present in upstream ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
