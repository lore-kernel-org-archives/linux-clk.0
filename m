Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8432396596
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735969; cv=none; b=FhtaUDq06fROMRvzKFVWeLpgsKxaZuy4qKL2sI+wxz6qHBwpK3riQagP9jEx/BCJEVC5t91058shZ3PHHqhs+2T+LGiOQqOj9mqauS7shFw2Hajne549H5RVRcPkIC8ZI2qxei8QMSJNAe19MG03jP9jmsmJrg35V+nll9IFELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735969; c=relaxed/simple;
	bh=DAXjupgOdwZoikKs5JyJB8iXIyxbkLJF1f1ATpyhV6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvYYJZk+31K6KjsCSfTThsWwTPgapeN+sBVjLlKPuTAat7rHKOXxXfkacdl0Ev456FNPQtgEqIpsA5N3VE3semvPAkdPAMPoy/Ke3x7q+q7Dh9irZC7p1e9AJoMsEFFGAz2fRDV9ab9AyQRnCVrNsV0aSDDSpeC89fcEBueyn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4671cbce465so2457526b6e.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 01:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735967; x=1774340767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MZrBOzWKX3a3J3HCcGoedqBZCxLLoAjByNA5cYsB/Y=;
        b=AALsQK+g5SQajGvqfUOpjLFJ+Im6KeBuNrrRd2C1Ia5EUoy+PAs/wkPKsqLO/+6OMv
         nfFnRt3R6QnqRLZoX8LHriLZ2tnOzvySn6rawwIWOD9Dpmv1Fno2tSGLeeyilqV0p1ZY
         wdMOmlmU2Ui3buHUcUG3wboD+mw3ZvnoUMOUdg9qdVnhOW4zPMe1mG/RoWJ2ez0mZUws
         L0VxD4hi0OntZ+l+FlumPtWOpkfgtBERIw/kO94eVNNkeCqwO13pno6873eE1OTTY9bE
         4YqGTvHbY/0Hwt/dsgfhlOuvrKddhVXhrDllhUv/agEoQ5fEXqySiZ9KUCLlxXG2eR8V
         tKAw==
X-Forwarded-Encrypted: i=1; AJvYcCW8cPovXTwRSc9lBBn7XpGrOdHN0y6i5fG4/O5+oxS14lSDgBdk0NGt4rQqY0FKUlvcQg5KNV8FJ8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRv7u3XaBvKy7FQAIjzXLGe/VTD9K/pZwpg+lBbgOX7Kx969A
	pa2YFVXCQoocJAhBBj4FQOPR3+dbZHBw+10NV2UGTjWMVoVYDkFKsaPrdjz/jpsP
X-Gm-Gg: ATEYQzzJ0j+0ul6hCGtEuTq+ujxri192q9hY7YrHcHEszAPv8mitzgQ02Hdlj2iHuBw
	HREfQRO3wPYgNZmAy3LDN4N5vUE7rFIR7rESKNF6kOehlJcXVUzgz5pmH5H3DhpP+4QbHGesCIl
	q35d5wAnYDOVIxwoCaS8y2wkAawDkN4LP/2Dq6P2K9153Sf8EA6PhQm6Lj4hS0NZxutNrpt+1La
	/0Xud6qWLaz7Uidwqp26MdGL6Z/nVrx/sgDIkxGXVqSuM2aEDRqbtUfO66mN3AHILDPHI81+ch8
	EZ+kMN1Hb+nY4ElicBEDKgscGV+fkdwhFOKAkjecR7bfKq5gBMJyL/L/C66H8abAx2aRXCFU25x
	aaHDMCUuDMEx0saOfzf8zWuva+Qpa+xsuWPJzcLr9dsqhoxMLaPqCphquXdKU2WwttQsv48cL9/
	S5mBd1w5MzJaAh/vWxEt9G34OKJ4xgUKcD1N0BVSehuZIHZMuwCe5Or7i5X7SfRjdTJfrM1xpCd
	MM=
X-Received: by 2002:a05:6808:67c1:b0:467:bfa:bd9b with SMTP id 5614622812f47-467571364a4mr9071370b6e.21.1773735966769;
        Tue, 17 Mar 2026 01:26:06 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e94b4sm17597183fac.11.2026.03.17.01.26.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:26:06 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4671cbce465so2457519b6e.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 01:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF4+/cakA/UjRJuPsvplomwPlTaseR0g2x+uaDmMVXlB579OSe/ym1+BcmR+z8kGlsW4ls2Gu4ihE=@vger.kernel.org
X-Received: by 2002:a05:6102:442b:b0:5ff:cc82:744b with SMTP id
 ada2fe7eead31-6020e4b8061mr7168193137.19.1773735619991; Tue, 17 Mar 2026
 01:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:20:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
X-Gm-Features: AaiRm51yyOA7w0a8XkB8aVbP3N6VXftKc6GGkOKP6ReYYiu4pm3s3wiL1ZOxXBM
Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] SCMI Clock rates discovery rework
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

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 2-6.
>
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
>
> Patch 7-12 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to only retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 13 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc3.
> Tested on JUNO and an emulated environment.
>
> Beside addressing a few review comments, in V2:
>
>  - patch [1/13] introduces a fix for the pre-existing rounding algorithm,
>    before relocating the algorithm logic as alreday done in V1.
>  - patch [8/13] hardens clock protocol initialization by adding some
>    missing retval checks

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.

As upstream does not support SCMI on R-Car X5H yet, I am ignoring
the hardening for now (it may be fixed by a quirk), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
