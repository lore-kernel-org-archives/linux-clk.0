Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A13955FD
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532966; cv=none; b=ZZJVE/moxi2g0Z6jYXl0KRiATW8M6KGZG1VdEMZqkmjY/gXQL/J3OYBIOI3z4CF6SszWOBEbiL2jqRl8BbfIzeKx2fdhQvm+lRhO83G7u6lXOgh6dyFtbXD53OHGMuiYu6qDzd/zDsDt+CBvJm1vHtCHelU4zIkbFepsrZHyH1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532966; c=relaxed/simple;
	bh=TcGIo92RiATa8vkGJVdjHgxt9WlzbewL1KtAW6cGFCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ns1N+IEyCz2sVTvMLRk+fyuv8J4Qw+30kjF5UuJzK+vJR9AyErAI8dBlnDeuMhszbNYvKSQq54Bvpxp+NKFgmtf6TsrSceTn/bAdTvNYxXdoumVRBlNBltZi4GRVq5AhYZcvcZtVvxap/GO3FfkaQivJmcKhLhU5AEYQg4B8uZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ab6c88052so370019137.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 07:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532963; x=1789137763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=;
        b=AZYyKRbS0We9Jft3n+pJso9YXQ15n7hnzHY8N55TmqO2f8BJg5Nx/Ql1FY/7ou7xGY
         SdvIujdkoRsblvp5Xpwt9hvWPqKqlorns220boQmM89OL16R5T+S7FBbVWxLGX8tCLuz
         n9AYi7UCZVXd5enGTg/kl9gpIsH1gxwtz9Y+p7VKXNFWAwQqb78LNzLG0ZrDi10V5Re2
         0BcIlMhzw9jarCQNO+L9h7++Kb8SN4Z+5TvPq6AkzQcHI556lVYZy9B1OrrK0ELikJRB
         0GdsdHIV4+oGsLe3WmJb6lm/sOoF8ISISKrmwed153IhmW2th9P52j7dN+TPNmCZM/UU
         oWpg==
X-Forwarded-Encrypted: i=1; AKwUvBxp3vGu3zsWrxwbIFBt1cOsk5rhaYGAdSebVv2N/dwvBhSoKroBi3uuhKaqBgQTBaY0AzORpEknHvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lIbYnypfVpg3dQEzM5yKlkmTMrV3GVjDJiDjtJ9qKMK6OrtZp2
	DXiVnpECqX0LwFSIBSiUV6acIu45hhX1EURi734H98MMCcto+tQn7Ay39k8EKdjiX0g=
X-Gm-Gg: AYBFou3gYjwuXz1TOO0n5wfYgKzxsojDjLZ7ahDHCihL92x0EnpPXOGd0WEsMxB2Ag5
	JpFSSSTL+kUCQ362IBM5P1YmYqw3KWMnyI/HBGbHXqL6T0Z2Sp/LevUmUf9x4y3r+gm4FYUGITC
	YS/QGGDj3mosK2Jc4bL9WM/uacIDMGDuFmzdvMOrnGZT9CeKzILAJ79m5WxjMpkdNX1U56ilA8x
	piCG55txtWvnPuuMQVCpvFMZv3MBuUrfSjRV8cXTsoyhyzsjKKImUrmJNSzo5BMLgR27YGmhkjJ
	mdXoKoOab94fDNzxZrug46pAL9StXkzSWIgSIcirhjyNxL/rRSz/YgwlZ/k7RxbBoaUty5D8OYb
	/oHHsoUtoTTo6UYpmDKAqIOJGUlVA4kvNv4Xrh0C68Ki9zcb1GWVupuVjdNfkKifcIsMvc1nIy/
	YoeFSfgwP036wEZkv3d+fl5aS+ofECfY1pSwDD43hldQb5kjb0pzwq7j6OAUTOz+kA58Duh2XOs
	1G77zrSwmfpwu2y7R6gv8lm9A==
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr1728565137.9.1788532962825;
        Fri, 04 Sep 2026 07:42:42 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm1865631137.5.2026.09.04.07.42.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:42:42 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so314160241.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 07:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIOw73L4DiFbYTwAXUM2yZK9L1FGWFC8tdM7aRPTx28AiwcLWmcFbgnXw9L8RofYfqtLbBUoAWQZM=@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1900429137.4.1788532960799; Fri, 04 Sep 2026
 07:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
 <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
In-Reply-To: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:42:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
X-Gm-Features: AcwNN1WAkp69Or55f6uh4v6WhdtMEG7Qz9QclhM1mQOZ0FBl4cYNnC9KwnYi2zM
Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Fri, 4 Sept 2026 at 16:03, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> > On systems using the ARM System Control and Management Interface (SCMI),
> > the Clock Pulse Generator hardware registers must not be accessed
> > directly.  Instead, the SCMI message protocol must be used for inquiry,
> > configuration, and control of clocks.
>
> Why is this node needed in the devicetree at all or why is it not disabled
> so that any driver in the OSPM is not probed at all.

The node is needed so the corresponding driver can bind against it.
The driver takes care of remapping DT hardware descriptions to the
abstractions offered by the SCMI firmware when SCMI must be used.

> > Add a "renesas,scmi-firmware" property to distinguish between systems
> > with and without SCMI, and to indicate which SCMI firmware interface
> > provider to communicate with.
> >
>
> I still don't see the need for this if you disable the node, so still

The node is not disabled.

> NACK. Sorry if I have missed some discussions, please present the information
> as part of this patch in the commit log if not the actual binding itself.

That's why we have cover letter, with links to previous versions and
discussions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
