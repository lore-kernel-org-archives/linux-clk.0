Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6244AB73
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516252; cv=pass; b=QVEThSympezrW9GZVVaxYqntfwhCwMIWhaZ0w3RtK8dnnVyAEWfQheQUOHiI4deBLA7xpEAGB/wmvr1xnQanGEIcl3UBgKWYDpOTNKgP/vshF+LoWolz+p3eqY4HYkDJO3Ecxajh8S6YndnnxhitppyIWso6NsBkjElRAH7FApU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516252; c=relaxed/simple;
	bh=6pWa6nwlBQWirCkIeVY8vaG8/HkEyvZHQABqTspSp3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZRz/DcwYeLNoecaQxGhoAnS6H/A3533CQgNX3z7ri0JUg0z/cG8tTOraOronmFeu/Oi7N0w1b0xYeUiPe/tSql8is1fzeHTnHdzTWWKOyynfPA9utk0esfA9MARJhtUpBk+O9buH52dCqbcQ5d5+ZZdCNTuF6fwN5MLaZ6M6Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QumnvHM/; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QumnvHM/"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66e63afda8fso735231d50.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 03:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788516249; cv=none;
        d=google.com; s=arc-20260327;
        b=MpC7ZMxVUyMCwKXoZJoFrQZPAxWHLdcUN9u7ee3enu9cm2/qJ1wzClVX/QNHYhB8uy
         d4r16TC1Y9BKDZn3tavwp7NvON6BNqjvlA6ps3cqTYLobR7dKdMUsYEvMKcr/y35sqks
         aXP1KDFSpMg8tSq739b0eM8zUwAcFrrq50qEMXQ1OhfetiewuwFA9gF1ZYVYw1EAoYb2
         /GC0krxtmxQYl4iaZkRL3vvV325yyU/nfpQlc3avfjBBowZ+CCT3Dfe3S7sHepmXTAO+
         A27GY8/xEBJqAd3iV0rsoeA5zSYHeUb0kmyng1FTbo3LlxY0cn2Pw4mlzDRHgGzTq2HZ
         JKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dU9BoqZNAPPEfH4/IVseL2Cruwn7NIGmHV726OGeGDc=;
        fh=eddsdAiQt3f/vbsh5nslk9v8dnlGuuRuWwjlNomB6lk=;
        b=Bx5ofhOI5T0PrQNNbaXo44t3fl2oyYF06UGdsBRFksR8PJQ9HbOgJ67VMiE5sVmtcy
         BntS/2IUYfXvQZv5Zqbd7Xen1XMIpidIImfjYYGeBd52hJZ4//1M62lysvGc61D6EXF6
         Ta+qkqcfaugwJbemRwegmiKWRwYVsqW0c055OIf0iU3d6Kuxy8WH4iXxeDFCNZn5dgYJ
         lw87t+Yu7sA+Qfx+8QJAnS+V2beP5yTgdASpxqy1I7NEUHVoOvYrqCm+l7iq/frlyJ7r
         yARZWm64u2nXwaeSX8k9xtjtpoP6mK0c2Y6fVQVBUMDeI8YydhuyNASyOak1+ms+FofU
         wdgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516249; x=1789121049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dU9BoqZNAPPEfH4/IVseL2Cruwn7NIGmHV726OGeGDc=;
        b=QumnvHM/niiIPPb07CYKNGbxRXqVJNXCJy9YS7z+FWS1iGiKXru8T07eMpFgIahETA
         wfuGdSPmw7H/0NxnOBTl2ZHtjiukMMJNaOv63+QT6Zoiss8Ou1KIepsC/ZL0DlYWR0oW
         tv9nC8kbaOBlX6xdKbDFZLWatr63UYLXySxUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516249; x=1789121049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dU9BoqZNAPPEfH4/IVseL2Cruwn7NIGmHV726OGeGDc=;
        b=UXOfqGUqCjBeIaU3NFz/UI9q8MQ77urttBVp24GHb30QoVRomdaUjdn3yH+FhR9zPf
         T5EA0aTP9Dorqw7/1jWQS4/MK4hxzfq9/o3yn4yHapMvG0laYBl2XxDpXmkJU/5XxMxZ
         GFBCTPyG6EMR4f4mlku7YDVElprwXvOT5yTgcn+8Xp4jniSC7GJG4WwchQ7yeeWHuBWL
         90Bjsvzf0ww0eKpOYBqfeIlm1yh9azzmx6wowFxTelcyvLgW0nCtqvrP+Btwak0kjZ3p
         K9lOj3/Bt+E6nb8jPrdpcmTU2ftd/eM7Ou24dNk2Lyez7J8Uqycv+PJUynqAHq5ETqc5
         EqGg==
X-Forwarded-Encrypted: i=1; AKwUvBytnZZvtk/tp6vs8oTGAaedV2HxiXJgyl8QIV1j19PtIz5AOeXHbI6blJzJdcWbFVkiz3SG6U5jerI=@vger.kernel.org
X-Gm-Message-State: AFuF++lAzDO51eMsTTrsLIdkfh3mWoanAttgH/213/Z2QU5AyRdIipcM
	5qwT3f+vmlnP3hyRh/ZbbjAuARxms6ev2+FO4KrNt4M6KytIBVrhDakC6S1W69Krkp2kXZ5/nOM
	LXXbSu7tEFG48l4i8EvXnJVR394eo2Ii0ujDa6W8LZg==
X-Gm-Gg: AYBFou01B9fDpcVs9Vjt4GsNfyYs0Yki2v59L6XmmOwJElWhIVlutTwbF6trx/l/qv2
	eIaChkpmWmyn2DSRRQv+b+3E7fCTLJsVFrzihx2blfFcHmGqU1PKBPOcG8JQ9Pcx7jgPe7u0/yo
	6Ggq96X37WXrhttdx0h4RwNeShargEqGjOgmk83YJiwfuwZCVvNkNMMPk1y/BE0l6ogXM2pTrQy
	lek2YI92v9XZ3XMHD9IuTyZk4KfWwcrw3N01/beT5/W1KlfDrQrdcVwlvtcaFMM6nNMsmPLAAE/
	9a7Yt8voFJlVaDHN+zzbAXEZByU44b+mNlc7MRdviCnZ9dJZK0gSf/bLm1fP1LtaBR1zzWuKtUE
	=
X-Received: by 2002:a05:690e:439a:b0:668:db:8c35 with SMTP id
 956f58d0204a3-66fb5a00051mr1241276d50.20.1788516248536; Fri, 04 Sep 2026
 03:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-3-dario.binacchi@amarulasolutions.com> <appLSfbVZMAoXkab@shlinux89>
In-Reply-To: <appLSfbVZMAoXkab@shlinux89>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 4 Sep 2026 12:03:57 +0200
X-Gm-Features: AcwNN1WLCK8cF9fO0rVZ2w24f4EfV4Qsn9E5_zBg4kpv-6Itf3goXqLtwYdrxnQ
Message-ID: <CABGWkvr7J1-6UZfay8yXcZwiTViP74Ra4rJsiZ_c_Qp-nzzW5Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/4] clk: scmi: reject SSC configuration out of the
 OEM field range
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Fri, Sep 4, 2026 at 6:34=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> On Thu, Sep 03, 2026 at 05:32:14PM +0200, Dario Binacchi wrote:
> >The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
> >tenths of a percent, and the modulation frequency in a 16-bit field.
> >
> >FIELD_PREP() silently truncates values that do not fit in the target
> >field. Moreover, the conversion from permyriad to tenths of a percent
> >turns values below 10 permyriad into zero, which is then passed to the
> >firmware as no spread at all.
> >
> >Reject these cases with a warning instead of silently programming a
> >configuration different from the requested one.
> >
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> >---
> >
> >Changes in v13:
> > - New patch
> >
> > drivers/clk/clk-scmi-oem.c | 15 ++++++++++++++-
> > 1 file changed, 14 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
> >index c1ebbdc6bbc5..4dac608edd4c 100644
> >--- a/drivers/clk/clk-scmi-oem.c
> >+++ b/drivers/clk/clk-scmi-oem.c
> >@@ -35,6 +35,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> >                                const struct clk_spread_spectrum *ss_con=
f)
> > {
> >       struct scmi_clk *clk =3D to_scmi_clk(hw);
> >+      u32 spread_pm =3D ss_conf->spread_bp / 10;
> >       int ret;
> >       u32 val;
> >
> >@@ -44,7 +45,19 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> >        * extConfigValue[24]    - Enable/Disable
> >        * extConfigValue[31:25] - Reserved
> >        */
> >-      val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->sp=
read_bp / 10);
> >+      if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENT=
AGE_MASK)) {
> >+              dev_warn(clk->dev, "%s: spread (%u permyriad) out of rang=
e\n",
> >+                       clk_hw_get_name(hw), ss_conf->spread_bp);
> >+              return -EINVAL;
>
> sashiko's comments is valid.
>
> And patch 1 & 3 have fixes tag. Patch 2 and 4 are new patches.
> If you would like patch 1 & 3 to be accepted in this 7.13, better post th=
em
> as separate patchset. Then CLK maintainer may pick them up for this relea=
se.

I'd rather keep a single series, since patch 2 depends on patch 1.
In v14 the two fixes come first so they can be picked up separately.

Sashiko's comment is addressed in v14.

Thanks and regards,
Dario

>
> Regards
> Peng
>
> >+      }
> >+
> >+      if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MA=
SK)) {
> >+              dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out =
of range\n",
> >+                       clk_hw_get_name(hw), ss_conf->modfreq_hz);
> >+              return -EINVAL;
> >+      }
> >+
> >+      val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
> >       val |=3D FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->mod=
freq_hz);
> >       if (ss_conf->method !=3D CLK_SPREAD_NO)
> >               val |=3D SCMI_CLOCK_IMX_SS_ENABLE_MASK;
> >--
> >2.43.0
> >
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
