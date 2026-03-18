Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58F246BCD
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821478; cv=none; b=fRsBg884IeSxZkLWIYhldUxbOUHn1UJkS3EHji2bexJo4Rp4T6XTifc6gnhxNBhJBsOZHNOGrkjK5bCMvTJzHBhDtjJ8OSbiWvU7n4uy3LPT8oEXFICWDroMR8WVk8IYPPC5VGRIBsRr+AS3hsOJ1S3qjUk8riplCPc1PCqhRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821478; c=relaxed/simple;
	bh=KAICH7AyRNLHyx9na4VNik7GvrikW4tPpi3l7+AtXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwoFSoYZcROtDut2YUSqHTmW1yX8fg5EREWHQdwlGuuhzq6hI3v8mp1z7ehH5XKLhaH82ioYeC1n6F1YbH15L+hhJjVivhj84ptILxDSlRKWW2kRl98qSloprE97UzppjTIlo3bP64Va+XaYhs8uN3Fui1s1BatFhOixiZGTKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so122589e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821476; x=1774426276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLFVo6AiXNHbx6lUNUpPWDsgWE1jK824gYrpCYtdfM0=;
        b=UOIN37kY6okbc1docVnxtBqZZ9nlmtJxINYQMAtuJVD6WqsnzAyBuBqEWM48GuPuiZ
         iGOM3kZ7+lHm5tPEBtRXKwRYGlu3CsEwoXUeL1GDnFEAk0IhchgzniQXqv2Fav3sZSsO
         6NYppelKyJazqCVz23HCb+8XUI3RA1oW300UymcMENyyXzZ1W30XuMrVa5Wl9mIQZTco
         bCBXIzjGULnfSMDitQsm3DDZ94U0W5n0jISVlIe7X8OSeMw53+2WnK2V/Me9rg/bwJB3
         DcMBj8v7nuhb26W8WiTM3hk6s0aULMsaOT3NUTjG4pD3xGFc2FuOBJ1qbjFLWj+7d0Ss
         laTg==
X-Forwarded-Encrypted: i=1; AJvYcCWO/S00f9Z/DlHzL9RErDYG1IkjJZLZ08qiIpQyn3Nr5MHPdNHkKYHI2jhqzTSZ5OhENCNEKXvOZh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZO449w+O+xdO1PFsVK5Bwi3YGOS0iarjwPIPxH+p/6jOJ+6g
	Zw2jRUfbn5uL9xIXSxk8GcwIRWre8ntL0wloU9duzHnQTiP8dmn4O10YKaIjc/tSV98=
X-Gm-Gg: ATEYQzxtOMGWExL7YOMg2KVF2TK/MOKgn0WuwZz/GQBdsq89eOKoYj648WIHYp8scPo
	FyvQkiUyunoJtDBR0el0MswHCSgycDUM+Xk/PUh8oRhZCZQGvu/KSXzPEgqoUszWF7H7DUiIm2v
	v1oMBPD4MQUx+kIXyuaNeyf9ie7EAIpSOhTf2vIBb2iNwCaDcUsakDvT/euvm0uP7gMUZscRn/4
	GXX712Q7yoeL5rZHttsAC+349fdf1YPJKP+ra/Uj4ipXNNWCotCEy6hLQWQlZYo4idWllwaMovU
	cavjCTndZO8bdfhEHbr7Gj+hCLxRTKgrRttzKINR8BxpMlbvjGz/fhP3cDcgn5GAz5f/VHY2Iw4
	/Iblo/2aLwum4YCvljqzZ4VLJbBTgqOk/3Dig4lLDOBqg2xPLkNo3zz+PYcHrzQCiUJlD4U5HHo
	U+EzEweQmJGr0ulCbEz+9cUKtQEGfNVaXvHR4o/uRf5YHvGkPbKraf5nA7AP9GveD7
X-Received: by 2002:a05:6122:628a:b0:56b:95a5:da18 with SMTP id 71dfb90a1353d-56ba713be41mr1389551e0c.10.1773821475920;
        Wed, 18 Mar 2026 01:11:15 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba7069460sm1414642e0c.16.2026.03.18.01.11.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:11:15 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso2626716e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCzXaNLb7yv8RKCEbn8Mca7XTgPFQps7Wb2hKLyhUYYgvL0HfQbzSE/iC7e2P1kVL63AEPbNFOKsM=@vger.kernel.org
X-Received: by 2002:a05:6102:945:b0:5f8:e323:580d with SMTP id
 ada2fe7eead31-6027d1284cbmr1153417137.11.1773821475435; Wed, 18 Mar 2026
 01:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com> <TY3PR01MB11346876072AAF91064B2700D8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346876072AAF91064B2700D8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 09:11:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiomf+6O5eDUBAt-41D-Lhvnda7w_bbdj-EQppapjdUg@mail.gmail.com>
X-Gm-Features: AaiRm52dBzFdESjaYAuu__pn42Q-OWaaQ-EFK2jgv-IViv74in_nOyYaaSxkIRo
Message-ID: <CAMuHMdUiomf+6O5eDUBAt-41D-Lhvnda7w_bbdj-EQppapjdUg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 17 Mar 2026 at 20:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Please ignore this series . I missed to addresses for Patch#4. I have sent a new
> version[1] fixing it. Sorry for the noise.
>
> [1] https://lore.kernel.org/linux-renesas-soc/20260317195650.468330-1-biju.das.jz@bp.renesas.com/T/#t

You have sent two "v4" versions with different Message-IDs,
which are treated as different series by both b4 and lore.
Please bump to v5 and resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
