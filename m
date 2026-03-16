Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6F3B38AA
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676237; cv=none; b=VmIvFRS8AjwGDXT1NOY7eeAaI+WRPtcdsG5Va2dhXNs6PbZbCAWNzrPcBKEPhvxkTUh2vY3o+1CvtXiE8y5iB9ITQoFV1KYQfwTtMPEXfFeRbshKgq9Vf6aCmKrVBmd1NVmfduu9fS+PublM791V7xXMhDMaUzZT0i7vH88L3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676237; c=relaxed/simple;
	bh=b8GE4QZEzUOI/sCp5v2olWVKdWQuMuH1Ks+9LBxnb2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtbvRgxLA7iaqF9/POviWoqQN35iuyC/iPgvaiJCkmNq7JMj+3xw5USjDMji0YAz+Q3x56LSpPIcTze0tR0btWUaM0Q/f4GjoXhllHqgKDLbMDDy2ll4wXe0Zdz/MAtEc+5xK8KURBjbw7CdkTIU/SiohyfQITlMnXbYcOk60W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-950d235b500so341325241.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676231; x=1774281031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMV00VBJWKkaqpEtH1LAiLdHckZZ6qshJN4iQQpaP6g=;
        b=h4PDXMmh5ShjCYmfw+4GD/72l00Z9EvdEoAQOG5oaUBxIxdvi9HiBr/cfhiFTtyt2M
         MDC+CGoEQSrbB2Qjw1GqdQDZa+8Aenmxwb0smBoFSfGnclKF3X0JxiGxDi7u3NT4ziHa
         Xdinsi+K0NXpNkvJcC5A/d2eSMy2R4C37r4kKuDrywIALKf2uEwj90OKdC9Hl2x7A9aj
         Yqu/iRO+J8fxkoZ+iaMhoz9GjO3vDS/rgOv9JpSUJVEEjlupgUKfIC04s3Q+twxsKApd
         sAPLPPol4l7XM6v7XSG6AiB4Mj4JhUE/2wMgxqptcq0jbqhnvoSIHICYw8hw3Tt7gJrX
         5ywA==
X-Forwarded-Encrypted: i=1; AJvYcCW4L+apL7KEgBG/AIV88qgrj8NvqffcPHWsWX1uBuBq3sViLY8o8Cg25SjDiu8hqzLzVfbcyKIDRvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlrESFIswSmPg1frWHYPa2qAmg7u+tHRqmigmlrwOTc9X/vrX
	KMANO6n5VdAJIv0L78l8m0FGdmp2/uXmD7cTLjWCNN4r2s1zJBa4Nqf5Se6wOKEQ
X-Gm-Gg: ATEYQzzKnNdKT/Sme5b9HJfFLe4QvX3ErBftbc0zh6PWAnrsyyBWWMctFrjlqA+HUH6
	sfCc7c+qeOp+G3mmzm4WTCQio3XMbhmDP2o20QU39lb6BbXsQhWedndaEaZN2rVD4bVU2w2+G25
	2ODnhHVULpxwnRZdMdATQQM5yAgk8uLp2EtHWpqvAart4Yf7nUa0QdMqDWdLn29IJG/db4xYrwV
	CLH4nkVmZ1Sflzg7ruzWuOw/QrraIFcZJkyhF+ZkoYjB1RFljrn+9JjkUmmFJB8M5/6t7G21Ace
	PbvSp8jxceepz00H65Z/a6yVD2dQSOr90PKH57pjBucf04OuomAqRzOutw97ZZC4FTABhCBB3uB
	2JJcRG4LVvBccubyzk9tyIJ79Ir1KyEFOj6+pVRr91BIvMw5aLqMtMJMjQEvoCRU0bkTJb6RjzV
	QYas5w6J5f/g2Xqn09mfoe/7Y+UttuyxQ37owBQO9T/qlyRdIOZ2cFxBXF+xhT
X-Received: by 2002:a05:6102:32c4:b0:5ff:a4e0:193d with SMTP id ada2fe7eead31-6020e17b426mr5139747137.2.1773676231239;
        Mon, 16 Mar 2026 08:50:31 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-950b2fc7df9sm2854563241.2.2026.03.16.08.50.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:50:30 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffd76e4c89so866118137.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+OnLR2JBntY0fMeh+wVj1UivQItYCMFmpSPz3Y98ZvGbZCX3g88mho7lyd+/9MWA0SDznahg3q4I=@vger.kernel.org
X-Received: by 2002:a05:6102:d87:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-6020e2823b8mr5534337137.15.1773676230555; Mon, 16 Mar 2026
 08:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla> <abLrm7x8ggzAhYOg@pluto>
In-Reply-To: <abLrm7x8ggzAhYOg@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 16:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
X-Gm-Features: AaiRm50iTDhKDonU-J5qpw3zzDb9304AIvkxbNozshzVrNKZQ64ZXXeHYUSrWsA
Message-ID: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > Hi Cristian,
> > > >
> > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > rates.
> > > > >
> > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >
> > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > >
> > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > -               if (!ret)
> > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > >
> > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > do not support the SCMI CLOCK_ATTRIBUTES command.

Apparently it is not just CLOCK_ATTRIBUTES, but also
CLOCK_DESCRIBE_RATES.

> > > > Before, these clocks were still instantiated, but were further unusable.
> > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > are available at all.
> > >
> > > ...and this is exactly what I feared while doing this sort of hardening :P
> > >
> > > So there are a few possible solutions (beside reverting this straight away)
> > >
> > > The easy fix would be instead change the above in a
> > >
> > >     if (ret)
> > >             continue;
> > >
> > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > FW releases to fix this :D
> > >
> > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > quirk targeting the affected FW releases...
> > >
> > > This latter option, though, while enforcing the correct behaviour AND
> > > fixing your R-Car issue, leaves open the door for a number of possible
> > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > >
> > > ...that could be solved with more quirks of course...but...worth it ?
> > >
> > > Thoughts ?
> > >
> > > Let's see also what @Sudeep thinks about this...
> >
> > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > the firmware baselines are derived from it. In the worst case, we can relax
> > the hardening until we figure out a proper quirk-based solution.
>
> Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> Geert with proper versioning....so I can check that there are no
> surprises round the (quirked) corner...

Unfortunately you cannot "continue" from a quirk, without resorting
to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
control in quirk code snippets"[1].

Then I came up with the following preliminary (have to check more
firmware versions) quirk (Gmail whitespace-damaged):

diff --git a/drivers/firmware/arm_scmi/clock.c
b/drivers/firmware/arm_scmi/clock.c
index f62f9492bd42afbc..6f2af6e9084836c6 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
clk_protocol_events = {
        .num_events = ARRAY_SIZE(clk_events),
 };

+#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
+       ({                                                              \
+               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
+                       continue;                                       \
+       })
+
+#define QUIRK_RCAR_X5H_NO_RATES
         \
+       ({                                                              \
+               if (ret == -EOPNOTSUPP)                                 \
+                       ret = 0;                                        \
+       })
+
 static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 {
        int clkid, ret;
@@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
struct scmi_protocol_handle *ph)
        for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
                cinfo->clkds[clkid].id = clkid;
                ret = scmi_clock_attributes_get(ph, clkid, cinfo);
+               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
QUIRK_RCAR_X5H_NO_ATTRIBUTES);
                if (ret)
                        return ret;

                ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
QUIRK_RCAR_X5H_NO_RATES);
                if (ret)
                        return ret;
        }
diff --git a/drivers/firmware/arm_scmi/quirks.c
b/drivers/firmware/arm_scmi/quirks.c
index 3772139a758c8a78..5a69f119e1b6c806 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -172,6 +172,8 @@ struct scmi_quirk {
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000",
+                 "renesas,r8a78000");

 /*
  * Quirks Pointers Array
@@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
"Qualcomm", NULL, "0x20000-");
 static struct scmi_quirk *scmi_quirks_table[] = {
        __DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
        __DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
+       __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
        NULL
 };

diff --git a/drivers/firmware/arm_scmi/quirks.h
b/drivers/firmware/arm_scmi/quirks.h
index 74bf6406dd043049..13f28d13bbd74d4c 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device
*dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);

 #endif /* _SCMI_QUIRKS_H */

Does that look like what you have in mind?
Thanks!

[1] https://lore.kernel.org/51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
