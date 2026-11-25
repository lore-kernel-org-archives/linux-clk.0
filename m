Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618405;
	b=Zbfj8J3ZXHh1pyDZd9RBxh8ftyoQI5ZxPAB8eWfyr8b4y+cMTFWUEHpWgqKsYHVkX/vA
	 9iXTk5xH7DYqzdUbkegFLN+PJ2QT4pQxB3fiVAKi/JvVyLufJSX0sqZ2MDZL8AlamxJUi
	 DNvZ4MRQz2RrdjdrV30zG4UXHafwrWsPoxcY8GPx6KE8T3sSr4+XAiViPB0RtDSLBKprT
	 9J8xE5R8NfUhMoClhG11httv+ssvUqN0wEuEWacNjBAmwf1/y7ojE9Onzt44IeXHh+Hyv
	 YaX1dpbANxneN06nP3OwN6cXvsVwVwIwM15yATeK8RW3ORbZaOp067W12tRYE5gB5cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618405;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
	b=gjdyH5bm84S2EjRpEE3BpWdFICS522WLfvyctcg0004hBITL58lH15UXA6JbBOajNG+9
	 Kz6BYz1ojNGYQrLWCgA/eNTSHd3qX0/G0D3RZL8W0uzD0Sutc1sSLRBlp9pY9mD457FnD
	 dZWEX8ozcgpfFVJP9HtEWr5vi++iA9UAYux2LWphnRLZVF4PyWP79XU2sdK6gEFmok3Dx
	 HD9M3VSkB1lu5jqxjFwIOwqmHhXmZXy5eNVPbo05O1JY9tXT+DoD7WeDm1ZlktIYssbdq
	 swx5C0iMoljoIb8XHV0mSiGkgNF5HNrvivPa9vNTPXygWPKTkzZ0K4iEKr2lOzwneKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BB606A327
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 14:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706BB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5366ae57896so60014601cf.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 06:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618404; x=1796223204;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
        b=aBsOyiJcE3Vmsp6rUIbPVynl44b7VXlgbzrxOudMc39vVdmhSsNpAQB7iunj0DIrPX
         LJ5kk5MBLfrdDg4DEuck0QvXC9CkGPQI7lazV7AahqKvkRpErowV2VHR9/ESBtJSybv+
         0WVNvl18r+cpzpeZfd+TxA3lhRCLR6+z+ItEbvXiGkeiaXvJMOEWGm6zI7C7JExVnOcw
         Wz6mNWW100N2D+BCd2PwiRhZvcjGsfdObRyZ5dzwxF9qBUIXxAg4J/1SobxH0zjXDSc+
         wqXvd8vQLSrXAVAVEDsUB3Jq5ZfeyEyhEqSijFhdsNuvn5IiTGzui4Tv6xIZ/o35nfaY
         ofMA==
X-Forwarded-Encrypted: i=1; AL+hErECkK3Z1wipLci2xjbtSrshgg/6gLVwg9ajsKLr00UxolMnYRImo9GrAo8NNUW7GPJTAzhLJBFjRe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fmtitsyvy7yNDMhJwDshIYUMrHI0TSrYCC7qRlKXOOXD7XMiA
	904J51g+98gTPZBLC+suPnrEUEaQx51yns1OsE5s7wYRqbzP+cBQ7hllcugKg/FM
X-Gm-Gg: AZFdTZeMykamSeXH624fLfD8QLRM692q+96VokJw1xJKUoPz8r75eQEvPTu4bbweVEH
	X7V9rIuz0C0vN2tBP11q6L35/TQ4ZpeRY/BXHGyiIysUKZu0x3XHCWHtQjCJsHZNlrfsN9gK78l
	W5Obyt4JwbbuVWv173z7qw4ocCvREOfb04Mpv22Wu612ulmteGbcB+ZWqg8loXSIB2MmkOTfMA4
	YyVhVttp8trF4Ejplhi6yrbnMwQdUs3YD+N5Mzahh+Ai6ocHUjA+E+jC8YQwp/KRbRwU3M+51qF
	19he7gLsYm4zevUo7cvFc22jtqInPv6I8xSMk5dPDsy02dyOqfHyk8K+xBk2n5j+amF20C3M8b9
	HqT63LnEg79Hj3x4uajGDa2tMG5UYWKoZkrGJIsr3ITxBsBopcfOxqi7zBr63IzOsXp4UroYX+d
	toQHUkvdBl9GSYhRrOSiRF+4BlNuURkp7NgDBdnxljHtpFGp8KaG/hOFoYsIzLHlRl8bmrKk5OZ
	raZmzzRjFOrejRGHUbjRXT/0mCrrOTxThDf3CfkpMhPU8EkK1TsubVgaApcL4jKnmS8UUMh6MuO
	/hwC1T8XHNcduxJgbaV7U+ubg50I8Q6favKBH5KRNdEwSrLuBrjFvapmircBAk02SV0=
X-Received: by 2002:a05:622a:17ce:b0:55d:99e:822f with SMTP id d75a77b69052e-55d76a8a94cmr336375721cf.46.1795618404337;
        Wed, 25 Nov 2026 06:53:24 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm156228101cf.3.2026.11.25.06.53.24
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:53:24 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-921318b2eb8so74260096d6.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 06:53:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPa/XZRGpf7mSAoRDP6n+0U1ObUi0Rcl0hRyX9b0pX2G12X0OD0VsrzX2Q3EdNpSR/eY9BJmkB1PM=@vger.kernel.org
X-Received: by 2002:a05:6122:1daa:b0:5ea:389c:520b with SMTP id
 71dfb90a1353d-5ee8af0b136mr10546236e0c.8.1795618054600; Wed, 25 Nov 2026
 06:47:34 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:47:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
X-Gm-Features: Aa3M54pxTFdlXtNPAY9vlRQdDdU5I_xDDti_PqZ4BrybSMWjBRbxoSvFUUiO_NA
Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 20 Nov 2026 at 12:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I don't think SCMI itself introduce instability.
> > It only defines the protocol, and each firmware choose its ids.
> > Could you tell me what you mean by instability?
>
> Let me try to reword:
>
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This

For core clocks, we came up with our own IDs, just like in other DT
bindings where there is no simple mapping to hardware.
For power domains and resets, the IDs are derived from the hardware
documentation (register and bitfield indices) (augmented with a few
power domain IDs that have no simple mapping to hardware).

> is a n:1-mapping of firmware IDs to our stable IDs.

Unfortunately this is not 100% true:
  - There may be multiple SCMI IDs corresponding to a single physical
    resource,
  - We are still discovering missing SCMI IDs for some resource.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
