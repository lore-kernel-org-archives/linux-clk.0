Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3A1B4120
	for <linux-clk@vger.kernel.org>; Tue, 24 Dec 2024 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735042747; cv=none; b=BTK5Fw/A5ccD3s4atmRmedlI7wo/hGS3nvcaIME3yC4ap62dNkStb5igFkvNCeSEBjQ8Fvi3euDlvofLHkomWJGUKyS4ZugnDzQuoCv1SrrnRJZwnzEfmZN3Gw4gA4YbDVnnR6jp/I/5Ik0WLyu7umPEk7TCbGSmSWVDz83IjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735042747; c=relaxed/simple;
	bh=iSZbopuJTWSo/8vniA36NEL/klC1Puu0S5meTNnXccM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJuop4lj5R0xyeJhwGkon2PIB8tFBSnheV6XIz0RgllIB2WXPi71zITtCXnePugKra+U803oD2y7tSQOqxH+8u9cdxMujypuYajXg6yHEGDWs3msQGTMdVeQub1O5FKiRdd6IJnrFv9cjFgqi3RCy09asxv0Y7GCQrnR4eFET3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iLrPD17o; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iLrPD17o"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e46ac799015so4249589276.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Dec 2024 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735042745; x=1735647545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=;
        b=iLrPD17oCn3IodTJdKI99YYvXfy1lXtNvQbyC3hikHSK/RNfmMn9JKAQeWaQlBgrir
         FIFOiwDU/QhcIgN6vbodKjBqgKVkNOvVgms4VhUk7ngSVs0XHpzWQ4yvHGkFs9f8F4r9
         95JMn0FvPMCGsdZtf9WRnJp8pUYjF8DiYsR1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735042745; x=1735647545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=;
        b=uaH7h3vGoLw1fnmAkIOp/EkuavMDpDKGjYGR315Uo8QAFYpKZuHgNalJtAiWg7OaCf
         nlu1MQrVjbfh+/yzzfkVGp0JZRuWi2bKZe/luNJTVH48Plj9DcgqcsmyzN2EgQ1MzS/t
         ZYYgezUvcwOZgbtpGRwdyzdeIXuaIupRfSneAnRJKsgNNQQx6Chx/6RKI6qX3svD2AlE
         k1klM0ruvX3dwUx9wze+JqEa1O+iTvCty1yMrb2Gg4HRUaRjbNA1zWneyIFSZWu/fguT
         NrHqvAFzeFVTnp2UHO4vaiJU5UAp1Q+1mIPAG8YrFmXJtMSWCQl4FsB5iwFA9O97YPPT
         DaXA==
X-Forwarded-Encrypted: i=1; AJvYcCUexjP0h6r5csjWs9BqUbQJEG0wUb3bF8KqwdXaagorFPo5sol+u6lu7MbmcgvYKXLk6lZcNHJ+YCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHyrV6BZkwOa00vSbr5ZHqsWMLddrhOacj8YIRYaahDswz5pq3
	8kytb5Tc5ES/iZ3DoROPj8ETji3KGvhM+LRySidqtJDgs7L8biWqXC/Yu2n3BetP0ktKgMmpN+j
	AhMptVwsfxzM5j59QR/IXqRThroD6eVyyFez6FomMfmZRmfPqip0=
X-Gm-Gg: ASbGncv/SQsuH51n1LkYAvaIApiqCu68t5YGqPiTZjykXjoGplpugfofrIZv+oMUW5M
	MTNOD7a+UoHIuivk0XjXFqJeaf5cRVvbowTU=
X-Google-Smtp-Source: AGHT+IH0riz8i408V1go9BqRjnhl3rg4DSK4AgKGCx/MVPvbG6Ayq1HxKA9H10UEg0e3O98yC0fCqBHSM4WINMwLeDg=
X-Received: by 2002:a05:690c:6188:b0:6ec:b10a:22a4 with SMTP id
 00721157ae682-6f3f814987fmr118816497b3.25.1735042744731; Tue, 24 Dec 2024
 04:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com> <20241224032223.GC20573@localhost.localdomain>
In-Reply-To: <20241224032223.GC20573@localhost.localdomain>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 24 Dec 2024 13:18:54 +0100
Message-ID: <CABGWkvrdMF-sUsHt4Af+Wn-OUgwbjpOpUq-yzMfOYo334_BTjA@mail.gmail.com>
Subject: Re: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Tue, Dec 24, 2024 at 3:17=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Sun, Dec 22, 2024 at 06:04:25PM +0100, Dario Binacchi wrote:
> >Get the hw of a clock registered by the anatop module. This function is
> >preparatory for future developments.
> >
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> >---
> >
> >(no changes since v5)
> >
> >Changes in v5:
> >- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors
> >
> >Changes in v4:
> >- New
> >
> > drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
> > drivers/clk/imx/clk.h |  7 +++++++
> > 2 files changed, 35 insertions(+)
> >
> >diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> >index df83bd939492..9a21f233e105 100644
> >--- a/drivers/clk/imx/clk.c
> >+++ b/drivers/clk/imx/clk.c
> >@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device=
_node *np, const char *name)
> > }
> > EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
> >
> >+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || =
\
> >+      defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) |=
| \
> >+      defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) |=
| \
> >+      defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
>
> drop the guarding macros, then this could be reused by i.MX9.
>
> >+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
>
> how about change to
> struct clk_hw *imx_anatop_get_clk_hw(int id, struct device_node *np)?

I designed this function so that the caller, i.e., the CCM driver,
would no longer need to
reference the anatop compatible in any way, but I agree with you that
it would be better
 to add the np parameter. Do you think it would then make sense to add
a phandle to the
 anatop node in the clk node?

clk: clock-controller@30380000 {
    compatible =3D "fsl,imx8mn-ccm";
    ...
    fsl,anatop =3D <&anatop>
}

So that we can call
anatop_np =3D of_parse_phandle(np, "fsl,anatop", 0);
instead of
anatop_np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
This would require an additional patch to
Documentation/devicetree/bindings/clock/imx8m-clock.yaml,
but it would make the CCM driver code more generic.

What do you think? I=E2=80=99m waiting for your response before sending ver=
sion 7.

Thanks and regards,
Dario





>
> >+{
> >+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
> >+      const char *compatible =3D "fsl,imx8mq-anatop";
> >+#else
> >+      const char *compatible =3D "fsl,imx8mm-anatop";
> >+#endif
> >+      struct device_node *np;
> >+      struct of_phandle_args args;
> >+      struct clk_hw *hw;
> >+
> >+      np =3D of_find_compatible_node(NULL, NULL, compatible);
>
> Then no need to find the compatible for every function call.
>
> >+      args.np =3D np;
> >+      args.args_count =3D 1;
> >+      args.args[0] =3D id;
> >+      of_node_put(np);
> >+
>
> Thanks,
> Peng



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
