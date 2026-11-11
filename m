Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395388;
	b=bpz6LhhFPEh5T/NLpH3a74u7w4H3/oDcViKXxuMQlyzkuYgnF+2lw+k8CU7SiulYNRQ5
	 b20vrnOt3sfS5haacpsrCBdsTkre+F6d3OwECJg1dz6+7xZGnuFU1PvDgXU0pVJfYzz9T
	 mwngmpnIvDQmblQ4lmvlriyqRYLij3APZXV09a245fQEpfIUB6whJQ3ugVInahbfLD+VX
	 C4CG5l0RggId7y9j2fcX2sRblor72IWwOpqZI/f/6u51YbUdvIBsYWWJOPImXXrALtWLT
	 VOJxoLQCYk6bB9iv6CElgIRdMlPjNucEEwYMSPZNG3EmSErInyjc5wnBJNE8W1/KcnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395388;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
	b=a/3JoYDO7cfqaTebmwZgTwwV+Y1BnEEeVtbxY7BRXnuDUiGW7UROkjC9yXBiUgas5rli
	 XIemyDFYwtSKT4A9ksZ9ZToLqA9JR2VldPKjjQ+riMg9bG6TCkfT1Yd5vfqZUoEwgM+Nf
	 J/Bc1S+yzSrOr9zA2F5ERBiQDo4Y033hJ3djtn7b4fS5TJHHvhsBFM3DjuSp5GFN90RMk
	 wAojY99FT5v3uvnajrWrHd/M1E81uqmTvtmXiNB289P6LLJYHigIo0/aavWOXN7J+WQNI
	 mtdbOa20wg7OLwcwoRxavZkgbvtBV6uvUtzZrAiZQt4VhB17VgeN+oivE32o9uG8X3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6094606A8AD
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6094606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eab93a9862so664312e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 03:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395387; x=1795000187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
        b=lko19uaY9GKCtwJ7iIDHtMHFTKX+FAszbiO6FDnEf6Ro52RenAViFbswMmNQRso3Ef
         hQa02rgZNJbeHHEprUDZdlTt5KMAVTAbyyRjCqscBEZrg3ynWzhEQW9W5RCrIVhBL/OP
         2+KmtJHIfcWkLVh6xoQnMUSKNhhBbKNUdbSaWROCmlt3hv3qHmlYcuIPMqYsxl+74jl8
         2NKO9oI9mlIRE9re486tFi6FxUwOX8OS9CqvAPQMrrkGDNNQxnAxv/+Hh/QFopMYoXF+
         Z/bBkHfgCnEUuFJB/ZSnml/B6GsQ3G3XD6uWBLhPJWOwdB9OdXaI/GIo5sygn5SGCjZ6
         wVjg==
X-Forwarded-Encrypted: i=1; AL+hErHHFUBGazuNVJz1JgoIyPgGIa+t2kYqIgCNn9zjdOhc3CkXDupVx+Hwz0+RYcNMSjlgPpAdapPROEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xVqSCgc4BwzmlvmbjruZGDtpgCnTcJEo3vR2p27tLIsY+dcq6
	Hug5SuMp95IhYHlyJKVMxy68xOxR/HK9WJow7bHuikqwOt5ulOXU+iXJlR6WdQaePJU=
X-Gm-Gg: AYBFou1E1t7yN7QkS+UiKkLIFbOzbzt9BHaYxckzAHLSgXDfP4mwhtRln1cy6Osewou
	hv/xNv4bAs4cO0tbGMjF9RXXiQgPXg+meZ61InuB7ZYegvQrQsWRuRuPKOsXzgUvM/y30NGrQQ3
	V4M7U8Y1J4voDIDtS9JApQ4fIFsZxYQ+KUEoRB+UAqalP3vN+Y9Vp2Uo6VF1kfbNCPIT7gSFLep
	LeR6/n9lKrkll6sCHvdfuzYJWjr8ujZzrgKmljYC9XkpkBl8LwqcfKTEjBaGdBG1WKdQb26UctV
	s/HaMcTwnmJt1QeW+NnplafCbra0ZUFN6gpqx3nyfmywFnnZ/0pqBzRmUQO2ykBGywoTOqE18mN
	RKTRSW7zZNfx+Z8xNbN4HpAlWn/remI/kmfsocil8SRGBX7hEwpBndLqyPfo+Axm58DOdUnon/9
	hJwLVZJw1fMIWBTXXyqJLec1UpFUpv6SZwKrPORDGdlOJrWmORkUrAuonp1+kjI+TI+vXsmYSTg
	GlzTGPdBUQOhAnzZD6y37emkr7sRwdv4E+BlQNNKPr2E4NsUpqieE2ldEe3L2VM6NiUalfVp68e
	G+Y5xLyHutLK9MC8rbVNokhti3Bi2kUKPZDz2WbLqFCcI474lAjbTdGEJSKICdpxTgn6LnzEs6i
	00ohVdVzBfrYm8w==
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr448153137.32.1794395386720;
        Wed, 11 Nov 2026 03:09:46 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm3589866241.4.2026.11.11.03.09.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:09:38 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso758347241.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 03:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuWQl8gs9PUBdK50DJEjxGAhUu9uw5pj0DVTM/CU+yOS/SzQtaL8tWqCLwTE71mNNoOG9bI2xqCJI=@vger.kernel.org
X-Received: by 2002:a05:6102:d8e:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d4fb291ba2mr478980137.14.1794395373576; Wed, 11 Nov 2026
 03:09:33 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-1-1b2072e8c37e@ideasonboard.com>
 <20261110-steady-kangaroo-of-mastery-5fcd7f@quoll> <179438844820.272237.18262716067322018404@neptunite.rasen.tech>
 <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
In-Reply-To: <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Nov 2026 12:09:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
X-Gm-Features: AclHuK-p812fgpXzcAZTo074hP5s29t5onlgPposQZBLZQWezlnyhodp5CVCArI
Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: clock: renesas,r8a78000-cpg: Add CPG_SGDn_VIO_DP_{TX,OTHER}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Elder <paul.elder@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 at 10:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 11/11/2026 10:14, Paul Elder wrote:
> > Quoting Krzysztof Kozlowski (2026-11-10 18:30:50)
> >> On Mon, Nov 09, 2026 at 10:34:22PM +0900, Paul Elder wrote:
> >>> Add the CPG_SGDn_VIO_DP_TX and CPG_SGDn_VIO_DP_OTHER clocks that are
> >>> used by FCPV, VSP, VCON, and DPTX cores.
> >>>
> >>> It should be noted that there is likely a discrepancy regarding the
> >>> clocks. In practice it ought not to be an issue as all the clocks der=
ive
> >>> from the same SGD1_VIO_MAIN clock and none of them are programmable o=
r
> >>> gateable.
> >>>
> >>> According to the datasheet, the FCPV[BID] and VSPD cores use
> >>> SGD*_VIO_DP_TX=CF=86 while the VSP[BI] cores use SGD*_VIO_DP_OTHER=CF=
=86.
> >>> However, educated guessing suggests that IP cores in the same pipelin=
e
> >>> should be using the same clocks:
> >>> - FCPV[BI] -> VSP[BI]:                  SGD*_VIO_DP_OTHER=CF=86
> >>> - FCPVD -> VSPD -> VCON -> DPTX:        SGD*_VIO_DP_TX=CF=86
> >>>
> >>> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> >>>
> >>> ---
> >>> Changes in v4:
> >>> - Add all the clocks
> >>> - remove DNI
> >>
> >> What is DNI?
> >
> > Do not integrate. Most of the patches here were DNI in previous version=
s
> > because they depended on a lot of downstream things, but now those depe=
ndencies
> > are in the process of upstreaming so these can graduate from DNI status=
.
>
> Upstream clock indices ABI does not depend on downstream at all, so
> seeing this unmergeable is just confusing.

In case of the clock indices, "work in progress" would be a better
wording than "downstream": multiple patch series are adding indices
in parallel, so some of them may need to be renumbered. Just like when
adding syscalls.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
