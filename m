Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496C36495A
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456969; cv=none; b=MWTeh0GOPBifuXAjA1D+Mb/KC88j7//QRtJ2aEZhpEbyx3tNNi0cItK+rTp8w5wpOqw7UWuTorqvvRmzirG9eYccs+8w9QlSaek9Mqfdo5j9XyER4748mTgH5sU/+n7ysKRdqA2igxi5la3c4fyGd+WwMHOQegdpZEoIBQUNUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456969; c=relaxed/simple;
	bh=flPzsF7PzOvMEnCHPNRVbaZwyCdjFf5LYGl94bUvKVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+CG/fm4oiyOgarBrWJKz7oqmPzBBkUplhReIdLetQayCQ3llGRCMl3kvtq5k7dU2/qFirWb6/2CY1A0Mancv21Npsbvu9+bnfMMMWUuyJRW/Dedh3n7UsLmhZRQIhNR+ycs4JP6HDX3+cLeb/jYdcdmEzl7+0VZ+893L0y/d0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f65.google.com with SMTP id ada2fe7eead31-5ff1703cb93so2863359137.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 05:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456967; x=1773061767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbpBDECGTuxrjZK2784Rn4svmYdxHMnNQNyQJ/QvvFQ=;
        b=GKRxvgVhwcozOiATsyPghjUQNWSA833age0u/qtmAWZi82pLjAYSCODirdKAPvwbdC
         72+GrGHtf1ibn9UPpcdrAaPh4R8LYkB46oAgM1vZINrAnOODhzHU++NZE82mM8FEfpzS
         IpKzXUrX5jodmz9+GkGT7I0qusjIC2Ves1yRfCQgMWBWaO4cBPg40cyLRbJxjqUICRpY
         wc6A8qOByA8iAd/tuGqEuYCTbKQ9izObuDV463Id5uKAEwyqP14+Frv92O8wngdRga9/
         2z7BY2Eu46tcgYQkxdf/n2UocQqunwP8jehaaCUHcAY5CUCrhQTiWGCTs5S1XYm3WYiR
         EavA==
X-Forwarded-Encrypted: i=1; AJvYcCUuohwF81QHsF8zwnujqOu1jrH8X8PzTq3Y/foVJbTVoYHV4hSkaiPowEpJJZVxClHo3JBxW/zku2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKqCzdnd5SffGWOJwhl+2ET+gapRMqva+xwoP5E/+SRcGvR1YE
	CPlaZPkRj2W9+W8C90iPtAhNGuL3VagHcJvec8n68xBx87CFbO1fy8JlCSmYAZjhpH0=
X-Gm-Gg: ATEYQzxKm4GoHcg8mIi15R0YmW8amH9PBwjZo0xsimfB1a8LoPoipp5qSVkndwqCnRg
	/IOf957NALl4khtnkp7INSU5zvGCNEQwchvd1giwsAKCVDLFqBWplKaWchEQt/16ajW1h+hICMW
	F7Pquh/QPXsxMYpx92lmChMGeSfn95KtJxbaYlm/TII65HWJ+7bTUwkDhFph5KfyAIIsNrSIQtR
	tL79LP/dXtlmYEVq/VRM33qZrY2hxNqnIcOK8UtnA0hB+M9ussnMG2r03mjeMD/r6MUkwgJsaGm
	tSzXmhVWheNcij8Ot2Me0Gw+bprMiXpaWf3P2M+gf5GFtVTEq1m6aU/dL48FZmhsKBVj79F2vZO
	sN18K6yYp13RI9ImkNMU2+vBMmzt7qc1hxq3VXOoOLCrHt2rFIons7cZ8CyH3EyUYeomfrkycAI
	43RPK6/TJ0Um6u72JX3k+K8LArOrMccPt61iktKVTQBbBFHCY/zbGN1e2ICjyan4WMeRhxmQ8=
X-Received: by 2002:a05:6102:e08:b0:5f5:320c:4d36 with SMTP id ada2fe7eead31-5ff325b7a61mr5661273137.40.1772456967383;
        Mon, 02 Mar 2026 05:09:27 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df641e133sm11843339241.5.2026.03.02.05.09.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:09:27 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ff1703cb93so2863350137.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 05:09:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrSFRrWBoaA3oEXwfjSyrfWlkNPD7dFKGNofGwOVHkeC65aM72SxidL26y02dqDX8oJ5GB0PqOn5c=@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6199626137.27.1772456966817; Mon, 02 Mar 2026
 05:09:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com> <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
In-Reply-To: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:09:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
X-Gm-Features: AaiRm50gWrUOn4xlq8V0dsaXBHr2iE-RWJy6NrWL5o5U_z-q0G3KqmZt-0p4hrs
Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Mon, 2 Mar 2026 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Move needlessly exposed fields away from scmi_clock_info into the new
> > internal struct scmi_clock_desc while keeping exposed only the two new
> > min_rate and max_rate fields for each clock.
> >
> > No functional change.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> >         __le32 rate_high;
> >  };
> >
> > +struct scmi_clock_desc {
> > +       u32 id;
> > +       bool rate_discrete;
> > +       unsigned int num_rates;
> > +       u64 rates[SCMI_MAX_NUM_RATES];
> > +#define        RATE_MIN        0
> > +#define        RATE_MAX        1
> > +#define        RATE_STEP       2
>
> Any specific reason you are not using a union here, like in
> scmi_clock_info?

Ah, "[PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
dynamic" answers that.

>
> > +       struct scmi_clock_info info;
> > +};
>
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -51,6 +51,8 @@ struct scmi_clock_info {
> >         bool rate_ctrl_forbidden;
> >         bool parent_ctrl_forbidden;
> >         bool extended_config;
> > +       u64 min_rate;
> > +       u64 max_rate;
> >         union {
> >                 struct {
> >                         int num_rates;
>
> You patch description read like the actual rates would be moved
> from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

And these members are actually removed in "[PATCH 05/11] firmware:
arm_scmi: Drop unused clock rate interfaces".  Please reflect that in
this patch description.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
