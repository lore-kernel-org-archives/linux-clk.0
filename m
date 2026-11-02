Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610927;
	b=20wppl31U19VfdSYVag7U2pjcwoWArzvhnO8K6fFef0jM7MWEbI7wMuhK+HueWw0EnKB
	 mYb2Ij9vW+vbywlRW9uCly9Ockk5eTD+koHlqUVCcGUtuD89MFmflTov+2YXMlB+h8suF
	 3uBVdqlhl8hNT/F7tlp071D17LKTKx8Oud9Er92KjdGAel+CXivOcWBNaNlA5d/SpY339
	 grz5SXCCqLZOAwmFl72NdZVZdMLtk6BJzfX22V/7ebD0gFRilBviHohhSa78580Gz3Xck
	 czvE09csdKMuUHCOkcJfFa26WUleqIzMb0JmEC7jTxGDgb/udQffBpyRX2Bcbx9XZQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610927;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
	b=UKZxcJwwHTRN0OuZUeh5dKprFvv28+wz06NaNGjka8X7QMU2A6PWCFq1ISXLDQt48W40
	 LVpR6+Iy2GWt0AAThjjaQJs/evWWmoA4WnzIfbbKXpspAj+jGqpJ6rGtHo65J/Ny7Ergs
	 Oc1FJluE0MB3XUK1ki6+q6V2ia6KeAKCM47MzR4U6x+wOivLqEfxLxNuOPV0WQJ/KGRFo
	 Lf+GcwSJ6tNexW3vwJ+1VFLYNPOFvRGi+Ii/JbDLSnImH5QLnb8AlQ83pwNqc3TLglpdU
	 YjCP89tskJahmkyWwp4ffgYukRV/q6uFnLyALRuf0v/rv+4wtyLlkMyRlGuZg+S4AwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEA606A324
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 09:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EEA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53c4b82919fso46251321cf.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 01:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610926; x=1794215726;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ac+xpJrvd6zfAE97WIurl+pYtHzF00Lzr1WG7VTrgAw=;
        b=rNUjy7xc9bKBebSfuFdIOPR3xxLjBLU77XMLsdo97I0LAxVt+rEfyCdSsuqRA5Mj1g
         ZUOyAuyYWx+JaOzpKvTm6+bUbWNBZzohItDMtFWrPJZ/gP5LkxMaKjoPJiBNbAkxMNo+
         C/piDjEJsgPBydxapf8wV8oKrTahEnHB21SzAM0eSFaEejgzwdjL07h1GFPyiob+TRWg
         g/B9wqy7Xd98DekAoWGXrFx+JuYxy0dJ2MwVx7XbZSD+Zi/W6yNHy3reTVtlOZM494Vr
         3DrE2EAGxjPqWlrb1MqsVdNoArjnvioup3WSTq45rwcNxZ6x0pWsBkIMHEtheZxkvauw
         LJgA==
X-Forwarded-Encrypted: i=1; AKwUvByXvUd+osRRLY5x+2v8k3jnlbgr0WX/YBo5zfmSb0SU/962iiIR/mF3dveOTHF9DpMDigyRH2G2VsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpn+DcmyThp7Ee8tbGbDG/NHI4+cBtz1UWds8PmL9HdxGbagHY
	fHMEKxtmKE2ylzbLwCsAkZ1rpe4F4FkURrK3f38EF101z0KsRZLXi+8T8r++WdU2
X-Gm-Gg: AYBFou3mj78rVxA8vEGic1c5qXq+pYNTwSc9zYB2f6aSahjPHixFLVqbfpdgdp0MHZK
	/ujDuGrubyPEHzTwTJ4S/tT+PLfzGeaTas7ZZfRcI6QowN9NAwsc/HtfkjqtZKWQQaO2nEtBq+J
	W3djluFJhTVOl7iKoCPgs2ZRaGCrF+2JHnB8acTRrf7MGMIe+yslfZpqP3OvfYI4BYa35/F1U7H
	4OI+XeVWa7NGn+u8zEn6+67AIj4i4Fpj/Am/rKogX9mwd/bNwk/POZcakZytL1EpHqomPwb6AiS
	gW0CvUVtHYlpz7ete8+8HbVeav3/zETFh7mMf1ml9WwLyOgCvchEBg8h+kzrFCKB8FpJtaOg3oP
	uFIPK1C/iv+I+Msxhd7vmRJILMfvrvUzp1x474YZkLdkmtTZ3lY05J3X4MQOFhx4oo9GH6rDFnG
	LXJj7IK+08M3yXqGJDMWIrMh4Vm6rWpnosRH4Jt96DU2ZLvAQpjD34hXTRToAyLW4Uj2nRzT6vE
	Kv6qCFvkAojBwLizalL8VQ+vlcKfpB1Fc2CP2uMa1DuHqNxyVlbZYW+juJ95TpIeMeNjhcbVVka
	BGOSoySLR96gKTvNHNv1FIA9ncEqqGflmCKsDUMYX/lcdBBVI/CI5l2SbsJsYbS0KqAw4A==
X-Received: by 2002:ac8:5fd0:0:b0:533:386a:edca with SMTP id d75a77b69052e-542b639bf3amr156971621cf.16.1793610926089;
        Mon, 02 Nov 2026 01:15:26 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5462e3d369dsm48892641cf.3.2026.11.02.01.15.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:25 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533778ab0bdso41475921cf.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 01:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwRWUZDXnjFbiGZ3VQTsKCfZxYnByQpFa69S5sAt3VSdrhwjO9rf5YQst//q7Lu5++dx+UKUqI4cJg=@vger.kernel.org
X-Received: by 2002:a67:f403:0:b0:7d0:9587:1b90 with SMTP id
 ada2fe7eead31-7d0958732b2mr1205111137.13.1793610463593; Mon, 02 Nov 2026
 01:07:43 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-3-e052903a3832@ideasonboard.com> <20261030220549.GH3178046@killaraus.ideasonboard.com>
In-Reply-To: <20261030220549.GH3178046@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 10:07:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
X-Gm-Features: AclHuK-1v1dRSgyK1HeeK29l-3g4aKIGNPop6k2nHA1eLryORdmauRDpRhHjRsM
Message-ID: <CAMuHMdX1czCW_KTW8Z+_jb3egLxqBu7bOUmqyXy3PqYhmUfLNg@mail.gmail.com>
Subject: Re: [PATCH DNI v3 03/15] pmdomain: renesas: r8a78000: Add maps for
 VIO for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 23:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 15, 2026 at 04:51:43PM +0900, Paul Elder wrote:
> > Add maps for VIO for the VSP and FCP power domains and reset domains.
>
> s/reset domains/module control/ as its not just reset (and there's no
> "reset domain") but also module control clock ?

FTR, SCMI calls it "reset domain", but I agree "module controle" fits
better here.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
