Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03A3AE6E9
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455695; cv=none; b=uxAytqB47VjmL3n9nqgDCUfKDpURv8oHqx9LEURROA5KlGSxlecsSavd0YcTNOR2bTyJahMr9xOiS5ugeBYKDjq1JXQdddNnHWoDTZmmKHRme1mp+uIagW3id/2xdbtMgglGxktXgIDzyZELa3ZxoBFCcY4Uop3Vz2EDqZjrB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455695; c=relaxed/simple;
	bh=5HFzGr832crqv2W64pTYS8wggyt85EHspGHJD1BYhVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWJOJsWy5+tfOBEeYSdiolQ5lmxcC9empj8VOt+Ood7StDVTGB7222SsG75eoJ96hDo3Li5JJi15Pv6VTiY7zfXSIKxqy9V247TDawSmD89vZJ0bOY3+CH+usK7RL0S1R5WK4nMbafkywCb62w0TzQz0Uz5a6IwpILW/kO2MPvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ff093cf15eso1007767137.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 04:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455692; x=1773060492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPZaguxK4uAclO1GJ8sZm5gYxF5BgvNNNwtD4mqwBno=;
        b=SXBmV0yjDxhyK8zZMDRCmSY2Ai6dx510qgCFSBlDlCpoKQByX8HfHcGGiF/9yUCedz
         d+z631kjMiG2JoGAbgK4T2OonI5wVb4NvEN0hFn2dInioygP/G/gLXycN6AlZ4mlInRX
         +SvO1meYe8YBpHU9XC8PJ9ZzuYvF4osz7rl9UjqvZ4Q3bhSzoElZn8I19A6oRhsOakJ0
         T0ulhZTIlowcfrDr427D9ncG1Yz+I80YRqQxtU/lVZ3nnR/zp1T/aXyUEnzofQ+rPHCH
         974BTjKpwRTKHZJQVDroPyO9glrw5Bht58S60wPPh/oh9FeHfMj5Xjxb563G3YAdB64r
         dFuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7TQAo3J4tfFJlIL6L4RKL3je7/Va2H6rtAA2S8ZoDQ3nsSGOwwUG+/qBcAKKEx80K3PAzAWmGuF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDe7d+GszwDHokXcIDxVXVtxPJ4HjKCO9dazKBmgruXHpUjmcP
	go26ka5FDw5vsaglEg5PHpcVtIlXjDgvHb0PIavgU9OUPGnX4BGjlxpURJEBA/vI
X-Gm-Gg: ATEYQzztc1sdRnGibqEUzbe/ZP32g7K2hD5M9O7J13l4wGPdvRIAuOGtksMS9ETM6ww
	ZLiHdfoT7Jw3asyWuVw9sJxzgaGdmE2tIyNpBTYmM4vX7b1GWahEii2U2IBM4bvB7P1r5Qc93UQ
	H0ED1e9vHb/0jnIVqcG2LnNRDGz+XHLdYpBa6s41Pt1jm6PcIPno1UGXMRyWZ6/0+kCtLD7Zwf0
	t6T+yoz4ZsB2w+XdF/Q+9HwHqyaC3WrHmrlamGlxTQqkSe8i/Jd+muxa0mkeSFsArS+Rt75PEvD
	TnBZDKomnDw6iFHq0PB22YJn+mS/tL458dwmIVEIPpVb9Fow528Qsn6BWjq3mlUGBLOP7kpS4NH
	LqTIoJdIrQ+cHk4L5HkIAIkFEI6wbus5JRwbGAHzCKIK5C1XZrVHkijHk+7KKAr8yMmrs7s4qSP
	IoUJSjIT+khPI4J79pP6FT6SrNaTppTacKfOi2RhXhKEZncrPuyj30mSGtA8B/W3E3CYSnRCc=
X-Received: by 2002:a05:6102:41ab:b0:5f5:2638:9f3f with SMTP id ada2fe7eead31-5ff322805cdmr3991354137.8.1772455691811;
        Mon, 02 Mar 2026 04:48:11 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d6695sm11787567241.1.2026.03.02.04.48.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:48:11 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ff093cf15eso1007761137.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 04:48:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZUsjyi2bhoDxCYCFxVjWsNChuV5+vb9PUzIMQwMrdTu/mmPNU5YGOY8Q6SmLf8Z+NN6HlHLHdHRQ=@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ef:24aa:986f with SMTP id
 ada2fe7eead31-5ff32280163mr4813153137.2.1772455690946; Mon, 02 Mar 2026
 04:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-4-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-4-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
X-Gm-Features: AaiRm50BStTuBuZFtFkMptJqRSM8Fy1hreKbQGIVp2iYFH2DYfQrEyfTQ_vqsrc
Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
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

Thanks for your patch!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Move needlessly exposed fields away from scmi_clock_info into the new
> internal struct scmi_clock_desc while keeping exposed only the two new
> min_rate and max_rate fields for each clock.
>
> No functional change.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
>         __le32 rate_high;
>  };
>
> +struct scmi_clock_desc {
> +       u32 id;
> +       bool rate_discrete;
> +       unsigned int num_rates;
> +       u64 rates[SCMI_MAX_NUM_RATES];
> +#define        RATE_MIN        0
> +#define        RATE_MAX        1
> +#define        RATE_STEP       2

Any specific reason you are not using a union here, like in
scmi_clock_info?

> +       struct scmi_clock_info info;
> +};

> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -51,6 +51,8 @@ struct scmi_clock_info {
>         bool rate_ctrl_forbidden;
>         bool parent_ctrl_forbidden;
>         bool extended_config;
> +       u64 min_rate;
> +       u64 max_rate;
>         union {
>                 struct {
>                         int num_rates;

You patch description read like the actual rates would be moved
from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
